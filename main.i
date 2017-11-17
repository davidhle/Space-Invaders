# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 1 "myLib.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 64 "myLib.h"
extern unsigned short *videoBuffer;
# 85 "myLib.h"
typedef struct {
 u16 tileimg[8192];
} charblock;


typedef struct {
 u16 tilemap[1024];
} screenblock;



void setPixel3(int row, int col, unsigned short color);
void drawRect3(int row, int col, int height, int width, volatile unsigned short color);
void fillScreen3(volatile unsigned short color);
void drawImage3(int row, int col, int height, int width, const unsigned short *image);
void drawFullscreenImage3(const unsigned short *image);


void setPixel4(int row, int col, unsigned char colorIndex);
void drawRect4(int row, int col, int height, int width, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int row, int col, int height, int width, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);


void waitForVBlank();
void flipPage();
void loadPalette(const unsigned short * palette);





typedef struct {
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
} OBJ_ATTR;







extern OBJ_ATTR shadowOAM[];
# 180 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;






void splash();
void game();
void pause();
void win();
void lose();
void goToSplash();
void goToGame();
void goToPause();
void goToWin();
void goToLose();
void hideSprites();
void initialize();


int gamesLost;




typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 247 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);




int collision(int rowA, int colA, int heightA, int widthA, int rowB, int colB, int heightB, int widthB);
# 2 "main.c" 2
# 1 "characterTiles.h" 1
# 21 "characterTiles.h"
extern const unsigned short characterTilesTiles[16384];


extern const unsigned short characterTilesPal[256];
# 3 "main.c" 2
# 1 "bg.h" 1
# 22 "bg.h"
extern const unsigned short bgTiles[7808];


extern const unsigned short bgMap[4096];


extern const unsigned short bgPal[256];
# 4 "main.c" 2
# 1 "splash.h" 1
# 22 "splash.h"
extern const unsigned short splashTiles[2256];


extern const unsigned short splashMap[1024];


extern const unsigned short splashPal[256];
# 5 "main.c" 2
# 1 "bg2.h" 1
# 22 "bg2.h"
extern const unsigned short bg2Tiles[992];


extern const unsigned short bg2Map[1024];


extern const unsigned short bg2Pal[256];
# 6 "main.c" 2
# 1 "pause.h" 1
# 22 "pause.h"
extern const unsigned short pauseTiles[2080];


extern const unsigned short pauseMap[1024];


extern const unsigned short pausePal[256];
# 7 "main.c" 2
# 1 "lose.h" 1
# 22 "lose.h"
extern const unsigned short loseTiles[1680];


extern const unsigned short loseMap[1024];


extern const unsigned short losePal[256];
# 8 "main.c" 2
# 1 "lose2.h" 1
# 22 "lose2.h"
extern const unsigned short lose2Tiles[2336];


extern const unsigned short lose2Map[1024];


extern const unsigned short lose2Pal[256];
# 9 "main.c" 2
# 1 "game.h" 1

typedef struct
{
    int row;
    int col;
    int rdel;
    int cdel;
    int width;
    int height;
    int bulletTimer;
    int dir;
} PLAYER;

typedef struct
{
    int row;
    int col;
    int width;
    int height;
    int active;
    int index;
} LIFE;

typedef struct
{
    int row;
    int col;
    int rdel;
    int cdel;
    int width;
    int height;
    int active;
    int index;
    int bulletTimer;
} ENEMY;

typedef struct
{
    int row;
    int col;
    int rdel;
    int cdel;
    int width;
    int height;
    int index;
    int active;
    int ally;
} BULLET;







extern PLAYER player;
extern BULLET bullets[5];
extern BULLET enemyBullets[2];
extern ENEMY enemies1[8];
extern ENEMY enemies2[8];
extern ENEMY enemies3[8];
extern ENEMY enemies4[8];
extern ENEMY enemies5[8];
extern int enemiesRemaining;
extern int livesRemaining;
extern int score;
extern int timer;



void init();
void drawPlayer();
void update();
void updatePlayer();
void updateEnemy(ENEMY* e);
void updateLives();
void updateBullet(BULLET* b);
void fireBullet();
void initBullets();
void draw();
void drawBullet(BULLET* b);
void fireBullet();
void drawEnemy(ENEMY* e);
void fireEnemyBullet(ENEMY* e);
void drawNumber(int row, int col, int number, int index);
void speedUp();
# 10 "main.c" 2
# 1 "win.h" 1
# 22 "win.h"
extern const unsigned short winTiles[1584];


extern const unsigned short winMap[1024];


extern const unsigned short winPal[256];
# 11 "main.c" 2


enum { SPLASH, GAME, WIN, LOSE, PAUSE };
int state;


unsigned short buttons;
unsigned short oldButtons;

int MAXBULLETS = 15;


int vOff = 0;
int timer = 0;

int gamesLost;




int main()
{
    hideSprites();
    initialize();
    goToSplash();
    gamesLost = 0;
    while(1)
    {

        vOff -= (3/2);

        oldButtons = buttons;
        buttons = (*(volatile unsigned short *)0x04000130);

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

    DMANow(3, splashTiles, &((charblock *)0x6000000)[0], 4512/2);
    DMANow(3, splashMap, &((screenblock *)0x6000000)[31], 2048/2);

    (*(unsigned short *)0x4000000) = 0 | (1<<8);
    (*(volatile unsigned short*)0x4000008) = (0<<14) | ((0)<<2) | ((31)<<8);

    state = SPLASH;
}

void splash()
{


    if((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3)))))
    {
        goToGame();
    }
}

void goToGame()
{
    waitForVBlank();
    state = GAME;
    loadPalette(bgPal);

    (*(unsigned short *)0x4000000) = 0 | (1<<8) | (1<<9) | (1<<12);

    (*(volatile unsigned short*)0x400000A) = ((0)<<2) | ((27)<<8) | (3<<14) | (1<<7);
    DMANow(3, bgTiles, &((charblock *)0x6000000)[0], 15616/2);
    DMANow(3, bgMap, &((screenblock *)0x6000000)[27], 8192/2);

    (*(volatile unsigned short*)0x4000008) = ((1)<<2) | ((31)<<8) | (0<<14) | (1<<7);
    DMANow(3, bg2Tiles, &((charblock *)0x6000000)[1], 1984/2);
    DMANow(3, bg2Map, &((screenblock *)0x6000000)[31], 2048/2);


    DMANow(3, characterTilesTiles, &((charblock *)0x6000000)[4], 32768/2);
    DMANow(3, characterTilesPal, ((unsigned short *)0x5000200), 256);

}

void game()
{
    update();
    draw();
    (*(volatile unsigned short *)0x04000016) = vOff;
    timer++;
    waitForVBlank();
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        goToPause();
    }
}

void goToWin()
{
    waitForVBlank();
    loadPalette(winPal);
    DMANow(3, winTiles, &((charblock *)0x6000000)[0], 3168/2);
    DMANow(3, winMap, &((screenblock *)0x6000000)[31], 2048/2);

    (*(unsigned short *)0x4000000) = 0 | (1<<8);
    (*(volatile unsigned short*)0x4000008) = (0<<14) | ((0)<<2) | ((31)<<8);
    (*(volatile unsigned short *)0x04000010) = 0;
    (*(volatile unsigned short *)0x04000012) = 0;
    state = WIN;

}

void win()
{
    if((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
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
        DMANow(3, lose2Tiles, &((charblock *)0x6000000)[0], 4672/2);
        DMANow(3, lose2Map, &((screenblock *)0x6000000)[31], 2048/2);

        (*(unsigned short *)0x4000000) = 0 | (1<<8);
        (*(volatile unsigned short*)0x4000008) = (0<<14) | ((0)<<2) | ((31)<<8);
        (*(volatile unsigned short *)0x04000010) = 0;
        (*(volatile unsigned short *)0x04000012) = 0;
    } else {
        loadPalette(losePal);
        DMANow(3, loseTiles, &((charblock *)0x6000000)[0], 3360/2);
        DMANow(3, loseMap, &((screenblock *)0x6000000)[31], 2048/2);

        (*(unsigned short *)0x4000000) = 0 | (1<<8);
        (*(volatile unsigned short*)0x4000008) = (0<<14) | ((0)<<2) | ((31)<<8);
        (*(volatile unsigned short *)0x04000010) = 0;
        (*(volatile unsigned short *)0x04000012) = 0;
    }
    state = LOSE;
}

void lose()
{
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        initialize();
        goToSplash();
    }
}

void goToPause()
{
    waitForVBlank();

    loadPalette(pausePal);
    DMANow(3, pauseTiles, &((charblock *)0x6000000)[0], 4160/2);
    DMANow(3, pauseMap, &((screenblock *)0x6000000)[31], 2048/2);

    (*(unsigned short *)0x4000000) = 0 | (1<<8);
    (*(volatile unsigned short*)0x4000008) = (0<<14) | ((0)<<2) | ((31)<<8);
    (*(volatile unsigned short *)0x04000010) = 0;
    (*(volatile unsigned short *)0x04000012) = 0;

    state = PAUSE;
}

void pause()
{
    waitForVBlank();
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        goToGame();
    } else if ((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2))))) {
        initialize();
        goToSplash();
    }

}
