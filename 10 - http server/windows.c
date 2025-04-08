#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <winsock2.h>

#define PORT 8080

void send_response(SOCKET client_socket) {
    const char *response = 
        "HTTP/1.1 200 OK\r\n"
        "Content-Type: application/json\r\n"
        "Content-Length: 2\r\n"
        "\r\n"
        "{}";

    int result = send(client_socket, response, strlen(response), 0);
    if (result == SOCKET_ERROR) {
        perror("Error sending response");
    }
}

void handle_client(SOCKET client_socket) {
    char buffer[1024];
    int result;

    // Receive data from the client (not used in the response, but necessary to avoid issues with some clients)
    result = recv(client_socket, buffer, sizeof(buffer), 0);
    if (result == SOCKET_ERROR) {
        perror("Error receiving data");
        return;
    }

    // Send an empty JSON response
    send_response(client_socket);
}

int main() {
    WSADATA wsaData;
    SOCKET server_socket, client_socket;
    struct sockaddr_in server_addr, client_addr;
    int client_addr_len = sizeof(client_addr);
    
    // Initialize Winsock
    if (WSAStartup(MAKEWORD(2, 2), &wsaData) != 0) {
        printf("WSAStartup failed. Exiting...\n");
        return 1;
    }

    // Create server socket
    server_socket = socket(AF_INET, SOCK_STREAM, 0);
    if (server_socket == INVALID_SOCKET) {
        perror("Error opening socket");
        WSACleanup();
        return 1;
    }

    // Set up server address
    memset(&server_addr, 0, sizeof(server_addr));
    server_addr.sin_family = AF_INET;
    server_addr.sin_addr.s_addr = INADDR_ANY;
    server_addr.sin_port = htons(PORT);

    // Bind socket to address
    if (bind(server_socket, (struct sockaddr *)&server_addr, sizeof(server_addr)) == SOCKET_ERROR) {
        perror("Error binding socket");
        closesocket(server_socket);
        WSACleanup();
        return 1;
    }

    // Start listening for incoming connections
    if (listen(server_socket, 5) == SOCKET_ERROR) {
        perror("Error listening on socket");
        closesocket(server_socket);
        WSACleanup();
        return 1;
    }

    printf("Server listening on port %d...\n", PORT);

    // Main server loop
    while (1) {
        // Accept incoming connections
        client_socket = accept(server_socket, (struct sockaddr *)&client_addr, &client_addr_len);
        if (client_socket == INVALID_SOCKET) {
            perror("Error accepting connection");
            continue;
        }

        // Handle the client connection
        handle_client(client_socket);

        // Shutdown the connection gracefully before closing the socket
        if (shutdown(client_socket, SD_SEND) == SOCKET_ERROR) {
            perror("Error shutting down connection");
        }

        // Close the client socket
        closesocket(client_socket);
    }

    // Close the server socket
    closesocket(server_socket);

    // Clean up Winsock
    WSACleanup();

    return 0;
}
