#include <SDL2/SDL.h>
#include <SDL2/SDL_net.h>
#include <iostream>

const int SCREEN_WIDTH = 640;
const int SCREEN_HEIGHT = 480;
const int DOT_SIZE = 10;

SDL_Window* gWindow = NULL;
SDL_Renderer* gRenderer = NULL;

void renderDot(int x, int y) {
    SDL_Rect fillRect = { x, y, DOT_SIZE, DOT_SIZE };
    SDL_SetRenderDrawColor(gRenderer, 0x00, 0x00, 0x00, 0xFF);
    SDL_RenderFillRect(gRenderer, &fillRect);
}

int main(int argc, char* args[]) {
    if (SDL_Init(SDL_INIT_VIDEO) < 0) {
        std::cerr << "SDL could not initialize! SDL_Error: " << SDL_GetError() << std::endl;
        return 1;
    }

    gWindow = SDL_CreateWindow("SDL Multiplayer Game", SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, SCREEN_WIDTH, SCREEN_HEIGHT, SDL_WINDOW_SHOWN);
    if (gWindow == NULL) {
        std::cerr << "Window could not be created! SDL_Error: " << SDL_GetError() << std::endl;
        return 1;
    }

    gRenderer = SDL_CreateRenderer(gWindow, -1, SDL_RENDERER_ACCELERATED);
    if (gRenderer == NULL) {
        std::cerr << "Renderer could not be created! SDL_Error: " << SDL_GetError() << std::endl;
        return 1;
    }

    bool quit = false;
    SDL_Event e;

    int dotX = SCREEN_WIDTH / 2;
    int dotY = SCREEN_HEIGHT / 2;

    while (!quit) {
        while (SDL_PollEvent(&e) != 0) {
            if (e.type == SDL_QUIT) {
                quit = true;
            }
        }

        const Uint8* currentKeyStates = SDL_GetKeyboardState(NULL);
        if (currentKeyStates[SDL_SCANCODE_UP]) {
            dotY -= DOT_SIZE;
        }
        if (currentKeyStates[SDL_SCANCODE_DOWN]) {
            dotY += DOT_SIZE;
        }
        if (currentKeyStates[SDL_SCANCODE_LEFT]) {
            dotX -= DOT_SIZE;
        }
        if (currentKeyStates[SDL_SCANCODE_RIGHT]) {
            dotX += DOT_SIZE;
        }

        SDL_SetRenderDrawColor(gRenderer, 0xFF, 0xFF, 0xFF, 0xFF);
        SDL_RenderClear(gRenderer);

        renderDot(dotX, dotY);

        SDL_RenderPresent(gRenderer);
    }

    SDL_DestroyRenderer(gRenderer);
    SDL_DestroyWindow(gWindow);
    SDL_Quit();
    return 0;
}
#include <SDL2/SDL.h>
#include <SDL2/SDL_net.h>
#include <iostream>

const int SCREEN_WIDTH = 640;
const int SCREEN_HEIGHT = 480;
const int DOT_SIZE = 10;

SDL_Window* gWindow = NULL;
SDL_Renderer* gRenderer = NULL;

void renderDot(int x, int y) {
    SDL_Rect fillRect = { x, y, DOT_SIZE, DOT_SIZE };
    SDL_SetRenderDrawColor(gRenderer, 0x00, 0x00, 0x00, 0xFF);
    SDL_RenderFillRect(gRenderer, &fillRect);
}

int main(int argc, char* args[]) {
    if (SDL_Init(SDL_INIT_VIDEO) < 0) {
        std::cerr << "SDL could not initialize! SDL_Error: " << SDL_GetError() << std::endl;
        return 1;
    }

    gWindow = SDL_CreateWindow("SDL Multiplayer Game", SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, SCREEN_WIDTH, SCREEN_HEIGHT, SDL_WINDOW_SHOWN);
    if (gWindow == NULL) {
        std::cerr << "Window could not be created! SDL_Error: " << SDL_GetError() << std::endl;
        return 1;
    }

    gRenderer = SDL_CreateRenderer(gWindow, -1, SDL_RENDERER_ACCELERATED);
    if (gRenderer == NULL) {
        std::cerr << "Renderer could not be created! SDL_Error: " << SDL_GetError() << std::endl;
        return 1;
    }

    bool quit = false;
    SDL_Event e;

    int dotX = SCREEN_WIDTH / 2;
    int dotY = SCREEN_HEIGHT / 2;

    while (!quit) {
        while (SDL_PollEvent(&e) != 0) {
            if (e.type == SDL_QUIT) {
                quit = true;
            }
        }

        const Uint8* currentKeyStates = SDL_GetKeyboardState(NULL);
        if (currentKeyStates[SDL_SCANCODE_UP]) {
            dotY -= DOT_SIZE;
        }
        if (currentKeyStates[SDL_SCANCODE_DOWN]) {
            dotY += DOT_SIZE;
        }
        if (currentKeyStates[SDL_SCANCODE_LEFT]) {
            dotX -= DOT_SIZE;
        }
        if (currentKeyStates[SDL_SCANCODE_RIGHT]) {
            dotX += DOT_SIZE;
        }

        SDL_SetRenderDrawColor(gRenderer, 0xFF, 0xFF, 0xFF, 0xFF);
        SDL_RenderClear(gRenderer);

        renderDot(dotX, dotY);

        SDL_RenderPresent(gRenderer);
    }

    SDL_DestroyRenderer(gRenderer);
    SDL_DestroyWindow(gWindow);
    SDL_Quit();
    return 0;
}
