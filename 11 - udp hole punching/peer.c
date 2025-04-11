// peer.c
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <arpa/inet.h>

int main(int argc, char *argv[]) {
    if (argc != 4) {
        printf("Usage: %s <local_peer_port> <introducer_ip> <introducer_port>\n", argv[0]);
        return 1;
    }

    int local_port = atoi(argv[1]);
    char *introducer_ip = argv[2];
    int introducer_port = atoi(argv[3]);

    int sockfd;
    struct sockaddr_in local_addr, introducer_addr, peer_addr;
    socklen_t addr_len = sizeof(struct sockaddr_in);
    char buffer[1024];

    sockfd = socket(AF_INET, SOCK_DGRAM, 0);

    // Bind to fixed port
    memset(&local_addr, 0, sizeof(local_addr));
    local_addr.sin_family = AF_INET;
    local_addr.sin_port = htons(local_port);
    local_addr.sin_addr.s_addr = INADDR_ANY;

    if (bind(sockfd, (struct sockaddr*)&local_addr, sizeof(local_addr)) < 0) {
        perror("bind failed");
        return 1;
    }

    // Introducer address
    memset(&introducer_addr, 0, sizeof(introducer_addr));
    introducer_addr.sin_family = AF_INET;
    introducer_addr.sin_port = htons(introducer_port);
    introducer_addr.sin_addr.s_addr = inet_addr(introducer_ip);

    // Register with introducer
    sendto(sockfd, "1", 1, 0, (struct sockaddr*)&introducer_addr, sizeof(introducer_addr));

    // Receive peer address
    recvfrom(sockfd, &peer_addr, sizeof(peer_addr), 0, NULL, NULL);
    printf("Connected to peer at %s:%d\n",
           inet_ntoa(peer_addr.sin_addr), ntohs(peer_addr.sin_port));

    // Punch hole
    sendto(sockfd, "hello", 5, 0, (struct sockaddr*)&peer_addr, sizeof(peer_addr));

    // Chat loop
    fd_set read_fds;
    while (1) {
        FD_ZERO(&read_fds);
        FD_SET(0, &read_fds);
        FD_SET(sockfd, &read_fds);

        select(sockfd + 1, &read_fds, NULL, NULL, NULL);

        if (FD_ISSET(0, &read_fds)) {
            fgets(buffer, sizeof(buffer), stdin);
            sendto(sockfd, buffer, strlen(buffer), 0,
                   (struct sockaddr*)&peer_addr, sizeof(peer_addr));
        }

        if (FD_ISSET(sockfd, &read_fds)) {
            int len = recvfrom(sockfd, buffer, sizeof(buffer) - 1, 0, NULL, NULL);
            buffer[len] = '\0';
            printf("Peer: %s", buffer);
        }
    }

    close(sockfd);
    return 0;
}
