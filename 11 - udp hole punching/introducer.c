// introducer.c
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <arpa/inet.h>

struct Peer {
    struct sockaddr_in addr;
};

int main() {
    printf("Starting...\n");
    int sockfd;
    struct sockaddr_in server_addr, client_addr;
    socklen_t addr_len = sizeof(client_addr);
    char buffer[1];
    struct Peer peers[2];
    int peer_count = 0;

    const char* envPort = getenv("PORT");
    if(envPort == NULL){
        envPort = "12345";
    }
    unsigned long port = strtoul(envPort, NULL, 10);

    sockfd = socket(AF_INET, SOCK_DGRAM, 0);
    server_addr.sin_family = AF_INET;
    server_addr.sin_port = htons(port);
    server_addr.sin_addr.s_addr = INADDR_ANY;

    bind(sockfd, (struct sockaddr*)&server_addr, sizeof(server_addr));

    printf("Introducer running on port %lu...\n", port);

    while (1) {
        recvfrom(sockfd, buffer, sizeof(buffer), 0, (struct sockaddr*)&client_addr, &addr_len);

        if (peer_count < 2) {
            peers[peer_count].addr = client_addr;
            peer_count++;
            printf("Client %d registered: %s:%d\n", peer_count,
                   inet_ntoa(client_addr.sin_addr), ntohs(client_addr.sin_port));
        }

        if (peer_count == 2) {
            // Exchange peer addresses
            sendto(sockfd, &peers[1].addr, sizeof(struct sockaddr_in), 0,
                   (struct sockaddr*)&peers[0].addr, sizeof(struct sockaddr_in));
            sendto(sockfd, &peers[0].addr, sizeof(struct sockaddr_in), 0,
                   (struct sockaddr*)&peers[1].addr, sizeof(struct sockaddr_in));
            peer_count = 0; // Reset for next pair
        }
    }

    close(sockfd);
    return 0;
}
