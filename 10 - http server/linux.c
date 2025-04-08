#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netinet/ip.h>

#define PORT 8080

void send_response(int client_socket) {
    const char *response = 
        "HTTP/1.1 200 OK\r\n"
        "Content-Type: application/json\r\n"
        "Content-Length: 2\r\n"
        "\r\n"
        "{}";

    send(client_socket, response, strlen(response), 0);
}

int main() {
    int server_socket, client_socket;
    struct sockaddr_in server_addr, client_addr;
    socklen_t client_addr_len = sizeof(client_addr);
    
    // Create server socket
    server_socket = socket(AF_INET, SOCK_STREAM, 0);
    if (server_socket < 0) {
        perror("Error opening socket");
        exit(1);
    }

    // Set server address
    memset(&server_addr, 0, sizeof(server_addr));
    server_addr.sin_family = AF_INET;
    server_addr.sin_addr.s_addr = INADDR_ANY;
    server_addr.sin_port = htons(PORT);

    // Bind socket to the address
    if (bind(server_socket, (struct sockaddr *)&server_addr, sizeof(server_addr)) < 0) {
        perror("Error binding socket");
        exit(1);
    }

    // Start listening for incoming connections
    if (listen(server_socket, 5) < 0) {
        perror("Error listening on socket");
        exit(1);
    }

    printf("Server listening on port %d...\n", PORT);

    // Main server loop
    while (1) {
        // Accept incoming connections
        client_socket = accept(server_socket, (struct sockaddr *)&client_addr, &client_addr_len);
        if (client_socket < 0) {
            perror("Error accepting connection");
            continue;
        }

        // Send an empty JSON response
        send_response(client_socket);

        // Close the client socket
        close(client_socket);
    }

    // Close the server socket
    close(server_socket);

    return 0;
}
