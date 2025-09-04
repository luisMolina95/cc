#include <SDL3/SDL.h>
#include <stdio.h>

int main(int argc, char const *argv[])
{
    if (!SDL_Init(SDL_INIT_VIDEO))
    {
        SDL_Log("Failed");
        return 1;
    }

    SDL_Window *window = SDL_CreateWindow("MIke - SDL3", 320, 240, SDL_WINDOW_RESIZABLE);
    SDL_Delay(5 * 1000);

    SDL_Quit();
    printf("Hello World!!");
    return 0;
}
