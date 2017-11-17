#include <stdio.h>
#include <stdlib.h>
#include "myLib.h"
#include "characterTiles.h"
#include "bg.h"
#include "splash.h"
#include "game.h"

// player and ENEMY reference
PLAYER player;
LIFE lives[3];
ENEMY enemies1[ENEMYCOUNT];
ENEMY enemies2[ENEMYCOUNT];
ENEMY enemies3[ENEMYCOUNT];
ENEMY enemies4[ENEMYCOUNT];
ENEMY enemies5[ENEMYCOUNT];
BULLET bullets[BULLETCOUNT];
BULLET enemyBullets[ENEMYBULLETCOUNT];
int enemiesRemaining;
int livesRemaining;
int score;
int timer;

enum { LEFT, RIGHT, STILL };

OBJ_ATTR shadowOAM[128];

void update()
{
	updatePlayer();

	// Update all enemies
	for (int i = 0; i < ENEMYCOUNT; i++) {
		updateEnemy(&enemies1[i]);
		updateEnemy(&enemies2[i]);
		updateEnemy(&enemies3[i]);
		updateEnemy(&enemies4[i]);
		updateEnemy(&enemies5[i]);
	}
	// update score
	score = 40 - enemiesRemaining;
	// update all bullets
	for (int i = 0; i < BULLETCOUNT; i++) {
		updateBullet(&bullets[i]);
	}
	// update all enemy bullets
	for (int i = 0; i < ENEMYBULLETCOUNT; i++) {
		updateBullet(&enemyBullets[i]);
	}
	// lose condition
	if (livesRemaining == 0) {
    	goToLose();
    }
    speedUp();
}

void draw() {
	drawPlayer();
	for (int i = 0; i < ENEMYCOUNT; i++) {
    	drawEnemy(&enemies1[i]);
    	drawEnemy(&enemies2[i]);
    	drawEnemy(&enemies3[i]);
    	drawEnemy(&enemies4[i]);
    	drawEnemy(&enemies5[i]);
    }
	for (int i = 0; i < BULLETCOUNT; i++) {
    	drawBullet(&bullets[i]);
    }
    for (int i = 0; i < ENEMYBULLETCOUNT; i++) {
    	drawBullet(&enemyBullets[i]);
    }
    // draws the score
    drawNumber(0, 210, score, 50);
    //draws the lives
    drawNumber(0, 45, livesRemaining, 41);
    DMANow(3, shadowOAM, OAM, 128*4);
}

void updatePlayer() {
	// player controls
	if(BUTTON_HELD(BUTTON_LEFT)) {
        if(player.col < 240 && player.col > 1) {
            player.col--;
        }
        player.dir = LEFT;
	} else if(BUTTON_HELD(BUTTON_RIGHT)) {
        if(player.col > 0 && player.col < 240 - player.width - 1) {
            player.col++;
        }
        player.dir = RIGHT;
	} else {
		player.dir = STILL;
	}
	// Fire bullets
	if (BUTTON_PRESSED(BUTTON_A) && player.bulletTimer >= 16) {
		fireBullet();
		player.bulletTimer = 0;
	}
	if(BUTTON_PRESSED(BUTTON_B)) {
		for(int i = 0; i < ENEMYCOUNT; i++) {
			if (enemies1[i].cdel > 1) {
				enemies1[i].cdel--;
			} else if (enemies1[i].cdel < 1) {
				enemies1[i].cdel++;
			}
			if (enemies2[i].cdel > 1) {
				enemies2[i].cdel--;
			} else if (enemies2[i].cdel < 1) {
				enemies2[i].cdel++;
			}
			if (enemies3[i].cdel > 1) {
				enemies3[i].cdel--;
			} else if (enemies3[i].cdel < 1) {
				enemies3[i].cdel++;
			}
			if (enemies4[i].cdel > 1) {
				enemies4[i].cdel--;
			} else if (enemies4[i].cdel < 1) {
				enemies4[i].cdel++;
			}
			if (enemies5[i].cdel > 1) {
				enemies5[i].cdel--;
			} else if (enemies5[i].cdel < 1) {
				enemies5[i].cdel++;
			}
		}
	}
	for(int i= 0; i < ENEMYCOUNT; i++) {
		if (enemies5[i].active) {
			fireEnemyBullet(&enemies5[i]);
		}
	}
	player.bulletTimer++;

    // pressing SELECT/BACKSPACE -> pause screen
    if(BUTTON_PRESSED(BUTTON_SELECT)) {
        goToPause();
    }
    // collision with enemy bullets
    for (int i = 0; i < ENEMYBULLETCOUNT; i++) {
		if (enemyBullets[i].active && collision(player.row, player.col, player.height, player.width, 
			enemyBullets[i].row, enemyBullets[i].col, enemyBullets[i].height, enemyBullets[i].width)) {
			enemyBullets[i].active = 0;
			livesRemaining--;
		}
	}
}


void init()
{
	enemiesRemaining = ENEMYCOUNT *5;
	livesRemaining = 3;
	score = 0;
	timer = 0;
	//initial player position
	player.width = 16;
	player.height = 16;
	player.row = 144;
	player.col = 240/2-player.height/2;
	player.bulletTimer = 20;

    // inital position of first row of enemies & index in shadowOAM
    for (int i = 0; i < 8; i++) {
        enemies1[i].width = 16;
        enemies1[i].height = 16;
        enemies1[i].row = 16;
        enemies1[i].col = 25 + i*25;
        enemies1[i].active = 1;
        enemies1[i].cdel = 1;
        enemies1[i].index = i + 1;
    }
    // inital position of second row of enemies & index in shadowOAM
    for (int i = 0; i < 8; i++) {
        enemies2[i].width = 16;
        enemies2[i].height = 16;
        enemies2[i].row = 31;
        enemies2[i].col = 25 + i*25;
        enemies2[i].active = 1;
        enemies2[i].cdel = 1;
        enemies2[i].index = ENEMYCOUNT + i + 1;
    }
    // inital position of third row of enemies & index in shadowOAM
    for (int i = 0; i < 8; i++) {
        enemies3[i].width = 16;
        enemies3[i].height = 16;
        enemies3[i].row = 46;
        enemies3[i].col = 25 + i*25;
        enemies3[i].active = 1;
        enemies3[i].cdel = 1;
        enemies3[i].index = ENEMYCOUNT * 2 + i + 1;
    }
    // inital position of fourth row of enemies & index in shadowOAM
    for (int i = 0; i < 8; i++) {
        enemies4[i].width = 16;
        enemies4[i].height = 16;
        enemies4[i].row = 61;
        enemies4[i].col = 25 + i*25;
        enemies4[i].active = 1;
        enemies4[i].cdel = 1;
        enemies4[i].index = ENEMYCOUNT * 3 + i + 1;
    }
    // inital position of fifth row of enemies & index in shadowOAM
    for (int i = 0; i < 8; i++) {
        enemies5[i].width = 16;
        enemies5[i].height = 16;
        enemies5[i].row = 76;
        enemies5[i].col = 25 + i*25;
        enemies5[i].active = 1;
        enemies5[i].cdel = 1;
        enemies5[i].index = ENEMYCOUNT * 4 + i + 1;
    }
    // initialize ALLY bullets
    for (int i = 0; i < BULLETCOUNT; i++) {
		bullets[i].height = 6; 
		bullets[i].width = 2;
		bullets[i].row = -bullets[i].height;
		bullets[i].col = 0;
		bullets[i].rdel = -2;
        bullets[i].cdel = 0;
		bullets[i].active = 0;
		bullets[i].ally = 1;
		bullets[i].index = i+44; // Index in shadowOAM; last life is at 43
	}
	// initialize ENEMY bullets
	for (int i = 0; i < ENEMYBULLETCOUNT; i++) {
		enemyBullets[i].height = 6; 
		enemyBullets[i].width = 2;
		enemyBullets[i].row = -bullets[i].height;
		enemyBullets[i].col = 0;
		enemyBullets[i].rdel = 2;
        enemyBullets[i].cdel = 0;
		enemyBullets[i].active = 0;
		enemyBullets[i].ally = 0;
		enemyBullets[i].index = i+49; // Index in shadowOAM; last ally bullet is at 48
	}
}

void drawPlayer()
{
	// setting attributes for the player
    if (player.dir == RIGHT) {
    	shadowOAM[0].attr0 = player.row | ATTR0_4BPP | ATTR0_WIDE;
    	shadowOAM[0].attr1 = player.col | ATTR1_MEDIUM;
    	shadowOAM[0].attr2 = ATTR2_TILEID(4, 2);
    }
    if (player.dir == LEFT) {
    	shadowOAM[0].attr0 = player.row | ATTR0_4BPP | ATTR0_WIDE;
    	shadowOAM[0].attr1 = player.col | ATTR1_MEDIUM;
    	shadowOAM[0].attr2 = ATTR2_TILEID(4, 6);
    }
    if (player.dir == STILL) {
    	shadowOAM[0].attr2 = ATTR2_TILEID(0, 0);
    	shadowOAM[0].attr1 = player.col | ATTR1_SMALL;
    	shadowOAM[0].attr0 = player.row | ATTR0_4BPP | ATTR0_SQUARE;
    }
}

void drawBullet(BULLET* b) {
	if(b->active) {
		shadowOAM[b->index].attr0 = (b->row) | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[b->index].attr1 = (b->col) | ATTR1_TINY;
		if(b-> ally) {
			shadowOAM[b->index].attr2 = ATTR2_TILEID(4, 1);
		} else {
			shadowOAM[b->index].attr2 = ATTR2_TILEID(2, 6);
		}
	} else {
		shadowOAM[b->index].attr0 = ATTR0_HIDE;
	}
}

void updateBullet(BULLET* b) {
	// If active, update; otherwise ignore
	if (b->active) {
		if (b->row + b->height-1 >= 0
            && b->col + b->cdel > 0
            && b->col + b->cdel < SCREENWIDTH-1
            && b->row > 17
            && b->ally) { // so bullets don't go past border

			b->row += b->rdel;
            b->col += b->cdel;
		} else if (b->row + b->height-1 >= 0
            && b->col + b->cdel > 0
            && b->col + b->cdel < SCREENWIDTH-1
            && b->row < 160
            && !b->ally) { // so bullets don't go past border

			b->row += b->rdel;
            b->col += b->cdel;
		} else {
			b->active = 0;
		}
	}
}

void fireBullet() {
	// Find the first inactive bullet
	for (int i = 0; i < BULLETCOUNT; i++) {
		if (!bullets[i].active) {
			// Position the new bullet 
			bullets[i].row = player.row - 3;
			bullets[i].col = player.col + player.width/2 - bullets[i].width/2;
			// Take the bullet out of the pool
			bullets[i].active = 1;
			// Break out of the loop
			break;
		}
	}
}

void fireEnemyBullet(ENEMY* e) {
	// Find the first inactive enemy bullet
	for (int i = 0; i < ENEMYBULLETCOUNT; i++) {
		if (!enemyBullets[i].active) {

			// Position the new bullet
			enemyBullets[i].row = e->row + 6;
			enemyBullets[i].col = e->col + e->width/2
				-enemyBullets[i].width/2;

			// Take the bullet out of the pool
			enemyBullets[i].active = 1;

			// Break out of the loop
			break;
		}
	}
}

void updateLives() {
	if (livesRemaining == 2) {
		shadowOAM[43].attr0 = ATTR0_HIDE;
	} else if (livesRemaining == 1) {
		shadowOAM[42].attr0 = ATTR0_HIDE;
	} else if (livesRemaining == 0) {
		shadowOAM[41].attr0 = ATTR0_HIDE;
	}
}

void updateEnemy(ENEMY* e) {
	if (e -> active) {
		e->col += e-> cdel;
		if(e->col + e->width - 1 > SCREENWIDTH-2 || e->col < 3) {
			e->cdel *= -1;
			e->row+=8;
		}
		if(collision(e->row, e->col, e->height, e->width, player.row, player.col, player.height, player.width)) {
			livesRemaining = 0;
		}
		for (int i = 0; i < BULLETCOUNT; i++) {
			if ( bullets[i].active && collision(e->row, e->col, e->height, e->width, 
				bullets[i].row, bullets[i].col, bullets[i].height, bullets[i].width)) {
				e->active = 0;
				bullets[i].active = 0;
				enemiesRemaining--;

				if (!enemiesRemaining) {
					goToWin();
				}
			}
		}
	}
}

void drawEnemy(ENEMY* e) {
	if (e->active) {
		shadowOAM[e->index].attr0 = (e->row) | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[e->index].attr1 = (e->col) | ATTR1_SMALL;
		if(e->index < 9) {
			shadowOAM[e->index].attr2 = ATTR2_TILEID(0, 2) & ~(3<<10);
		} else if(e->index >= 9 && e->index < 17) {
			shadowOAM[e->index].attr2 = ATTR2_TILEID(0, 4) & ~(3<<10);
		} else if(e->index >= 17 && e->index < 25) { 
			shadowOAM[e->index].attr2 = ATTR2_TILEID(2, 0) & ~(3<<10);
		} else if(e->index >= 25 && e->index < 33) { 
			shadowOAM[e->index].attr2 = ATTR2_TILEID(2, 4) & ~(3<<10);
		} else if(e->index >= 33 && e->index < 45) {
			shadowOAM[e->index].attr2 = ATTR2_TILEID(2, 2) & ~(3<<10);
		}
	} else {
		shadowOAM[e->index].attr0 = ATTR0_HIDE;
	}
}

void hideSprites()
{
    for(int i = 0; i < 128; i++) {
        shadowOAM[i].attr0 = ATTR0_HIDE;
    }
}

void drawNumber(int row, int col, int number, int index) {
	if (number < 10) {
		if (number == 0) {
			shadowOAM[index].attr0 = row | ATTR0_4BPP | ATTR0_SQUARE;
			shadowOAM[index].attr1 = col | ATTR1_SMALL;
			shadowOAM[index].attr2 = ATTR2_TILEID(6, 0);
		} else if (number == 1) {
			shadowOAM[index].attr0 = row | ATTR0_4BPP | ATTR0_SQUARE;;
			shadowOAM[index].attr1 = col | ATTR1_SMALL;
			shadowOAM[index].attr2 = ATTR2_TILEID(6, 2);
		} else if (number == 2) {
			shadowOAM[index].attr0 = row | ATTR0_4BPP | ATTR0_SQUARE;;
			shadowOAM[index].attr1 = col | ATTR1_SMALL;
			shadowOAM[index].attr2 = ATTR2_TILEID(6, 4);
		} else if (number == 3) {
			shadowOAM[index].attr0 = row | ATTR0_4BPP | ATTR0_SQUARE;;
			shadowOAM[index].attr1 = col | ATTR1_SMALL;
			shadowOAM[index].attr2 = ATTR2_TILEID(6, 6);
		} else if (number == 4) {
			shadowOAM[index].attr0 = row | ATTR0_4BPP | ATTR0_SQUARE;;
			shadowOAM[index].attr1 = col | ATTR1_SMALL;
			shadowOAM[index].attr2 = ATTR2_TILEID(6, 8);
		} else if (number == 5) {
			shadowOAM[index].attr0 = row | ATTR0_4BPP | ATTR0_SQUARE;;
			shadowOAM[index].attr1 = col | ATTR1_SMALL;
			shadowOAM[index].attr2 = ATTR2_TILEID(8, 0);
		} else if (number == 6) {
			shadowOAM[index].attr0 = row | ATTR0_4BPP | ATTR0_SQUARE;;
			shadowOAM[index].attr1 = col | ATTR1_SMALL;
			shadowOAM[index].attr2 = ATTR2_TILEID(8, 2);
		} else if (number == 7) {
			shadowOAM[index].attr0 = row | ATTR0_4BPP | ATTR0_SQUARE;;
			shadowOAM[index].attr1 = col | ATTR1_SMALL;
			shadowOAM[index].attr2 = ATTR2_TILEID(8, 4);
		} else if (number == 8) {
			shadowOAM[index].attr0 = row | ATTR0_4BPP | ATTR0_SQUARE;;
			shadowOAM[index].attr1 = col | ATTR1_SMALL;
			shadowOAM[index].attr2 = ATTR2_TILEID(8, 6);
		} else if (number == 9) {
			shadowOAM[index].attr0 = row | ATTR0_4BPP | ATTR0_SQUARE;;
			shadowOAM[index].attr1 = col | ATTR1_SMALL;
			shadowOAM[index].attr2 = ATTR2_TILEID(8, 8);
		}
	} else {
		drawNumber(row, col, number/10, index);
		drawNumber(row, col + 6, number % 10, index + 1);
	}
}

void speedUp() {
	if (!(timer % 100) && timer > 550) {
		for (int i = 0; i < ENEMYCOUNT; i++) {
			if (enemies1[i].cdel > 0 && enemies1[i].cdel < 5 && enemies1[i].cdel%2) {
				enemies1[i].cdel++;
			} else if (enemies1[i].cdel < 0 && enemies1[i].cdel > -5 && enemies1[i].cdel%2) {
				enemies1[i].cdel--;
			}
			if (enemies2[i].cdel > 0 && enemies2[i].cdel < 5 && enemies2[i].cdel%2) {
				enemies2[i].cdel++;
			} else if (enemies2[i].cdel < 0 && enemies2[i].cdel > -5 && enemies2[i].cdel%2) {
				enemies2[i].cdel--;
			}
			if (enemies3[i].cdel > 0 && enemies3[i].cdel < 5 && enemies3[i].cdel%2) {
				enemies3[i].cdel++;
			} else if (enemies3[i].cdel < 0 && enemies3[i].cdel > -5 && enemies3[i].cdel%2) {
				enemies3[i].cdel--;
			}
			if (enemies4[i].cdel > 0 && enemies4[i].cdel < 5 && enemies4[i].cdel%2) {
				enemies4[i].cdel++;
			} else if (enemies4[i].cdel < 0 && enemies4[i].cdel > -5 && enemies4[i].cdel%2) {
				enemies4[i].cdel--;
			}
			if (enemies5[i].cdel > 0 && enemies5[i].cdel < 5 && enemies5[i].cdel%2) {
				enemies5[i].cdel++;
			} else if (enemies5[i].cdel < 0 && enemies5[i].cdel > -5 && enemies5[i].cdel%2) {
				enemies5[i].cdel--;
			}
    	}
	}
}