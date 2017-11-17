// Game structs
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

// constants
#define BULLETCOUNT 5
#define ENEMYBULLETCOUNT 2
#define ENEMYCOUNT 8

// Variables
extern PLAYER player;
extern BULLET bullets[BULLETCOUNT];
extern BULLET enemyBullets[ENEMYBULLETCOUNT];
extern ENEMY enemies1[ENEMYCOUNT];
extern ENEMY enemies2[ENEMYCOUNT];
extern ENEMY enemies3[ENEMYCOUNT];
extern ENEMY enemies4[ENEMYCOUNT];
extern ENEMY enemies5[ENEMYCOUNT];
extern int enemiesRemaining;
extern int livesRemaining;
extern int score;
extern int timer;


// Prototypes
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
