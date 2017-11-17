#include "myLib.h"
#include "characterTiles.h"
#include "bg.h"
#include "splash.h"
#include "bg2.h"
#include "pause.h"
#include "lose.h"
#include "lose2.h"
#include "game.h"
#include "win.h"

//State variables
enum { SPLASH, GAME, WIN, LOSE, PAUSE };
int state;

//allows button pressed to work
unsigned short buttons;
unsigned short oldButtons;

int MAXBULLETS = 15;

// allows scrolling of background
int vOff = 0;
int timer = 0;

int gamesLost;

#define ROWMASK 0xFF
#define COLMASK 0x1FF

int main()
{
    hideSprites();
    initialize();
    goToSplash();
    gamesLost = 0;
    while(1)
    {
        // makes background scroll downwards
        vOff -= (3/2);
        // allows buttonpressed to work
        oldButtons = buttons;
        buttons = BUTTONS;
        
        switch(state)
        {
            case SPLASH:
                splash();
                break;
            case GAME:
                game();
                break;
            case WIN:
                win();
                break;
            case LOSE:
                lose();
                break;
            case PAUSE:
                pause();
                break;
        }

    }
}

void initialize()
{
    hideSprites();
    init();
}

void goToSplash()
{
    waitForVBlank();
    loadPalette(splashPal);

    DMANow(3, splashTiles, &CHARBLOCK[0], splashTilesLen/2);
    DMANow(3, splashMap, &SCREENBLOCK[31], splashMapLen/2);

    REG_DISPCTL = MODE0 | BG0_ENABLE;
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);

    state = SPLASH;
}

void splash()
{

    // pressing start goes to game
    if(BUTTON_PRESSED(BUTTON_START))
    {
        goToGame();
    }
}

void goToGame()
{
    waitForVBlank();
    state = GAME;
    loadPalette(bgPal);
        // to enable sprites in the register display control
    REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE; 
    // loads star background and DMAs into the cbb and sbb in memory 
    REG_BG1CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(27) | BG_SIZE_LARGE | BG_8BPP;
    DMANow(3, bgTiles, &CHARBLOCK[0], bgTilesLen/2);
    DMANow(3, bgMap, &SCREENBLOCK[27], bgMapLen/2);

    REG_BG0CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(31) | BG_SIZE_SMALL | BG_8BPP;
    DMANow(3, bg2Tiles, &CHARBLOCK[1], bg2TilesLen/2);
    DMANow(3, bg2Map, &SCREENBLOCK[31], bg2MapLen/2);

    // loads the characters created on usenti into the cbb that stores data for sprites
    DMANow(3, characterTilesTiles, &CHARBLOCK[4], characterTilesTilesLen/2);
    DMANow(3, characterTilesPal, SPRITEPALETTE, 256);

}

void game()
{
    update();
    draw();
    REG_BG1VOFF = vOff;
    timer++;
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
}

void goToWin()
{
    waitForVBlank();
    loadPalette(winPal);
    DMANow(3, winTiles, &CHARBLOCK[0], winTilesLen/2);
    DMANow(3, winMap, &SCREENBLOCK[31], winMapLen/2);

    REG_DISPCTL = MODE0 | BG0_ENABLE;
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;  
    state = WIN;

}

void win()
{
    if(BUTTON_PRESSED(BUTTON_START)) {
        initialize();
        goToSplash();
    }
}

void goToLose()
{
    waitForVBlank();
    gamesLost++;
    if (gamesLost > 1) {
        loadPalette(lose2Pal);
        DMANow(3, lose2Tiles, &CHARBLOCK[0], lose2TilesLen/2);
        DMANow(3, lose2Map, &SCREENBLOCK[31], lose2MapLen/2);

        REG_DISPCTL = MODE0 | BG0_ENABLE;
        REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);
        REG_BG0HOFF = 0;
        REG_BG0VOFF = 0;
    } else {
        loadPalette(losePal);
        DMANow(3, loseTiles, &CHARBLOCK[0], loseTilesLen/2);
        DMANow(3, loseMap, &SCREENBLOCK[31], loseMapLen/2);

        REG_DISPCTL = MODE0 | BG0_ENABLE;
        REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);
        REG_BG0HOFF = 0;
        REG_BG0VOFF = 0;
    }
    state = LOSE;
}

void lose()
{
    if (BUTTON_PRESSED(BUTTON_START)) {
        initialize();
        goToSplash();
    }
}

void goToPause()
{
    waitForVBlank();

    loadPalette(pausePal);
    DMANow(3, pauseTiles, &CHARBLOCK[0], pauseTilesLen/2);
    DMANow(3, pauseMap, &SCREENBLOCK[31], pauseMapLen/2);

    REG_DISPCTL = MODE0 | BG0_ENABLE;
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;

    state = PAUSE;
}

void pause()
{
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
    } else if (BUTTON_PRESSED(BUTTON_SELECT)) {
        initialize();
        goToSplash();
    }

}

