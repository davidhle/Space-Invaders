	.cpu arm7tdmi
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	2
	.global	initialize
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	ldr	r3, .L2
	mov	lr, pc
	bx	r3
	ldr	r3, .L2+4
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r3, lr}
	bx	lr
.L3:
	.align	2
.L2:
	.word	hideSprites
	.word	init
	.size	initialize, .-initialize
	.align	2
	.global	goToSplash
	.type	goToSplash, %function
goToSplash:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r3, .L5
	mov	lr, pc
	bx	r3
	ldr	r0, .L5+4
	ldr	r3, .L5+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L5+12
	mov	r0, #3
	ldr	r1, .L5+16
	mov	r2, #100663296
	mov	r3, #2256
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	ldr	r1, .L5+20
	add	r2, r2, #63488
	mov	r3, #1024
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r2, #7936	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldr	r2, .L5+24
	mov	r1, #0
	str	r1, [r2, #0]
	mov	r2, #256	@ movhi
	strh	r2, [r3, #0]	@ movhi
	ldmfd	sp!, {r4, lr}
	bx	lr
.L6:
	.align	2
.L5:
	.word	waitForVBlank
	.word	splashPal
	.word	loadPalette
	.word	DMANow
	.word	splashTiles
	.word	splashMap
	.word	state
	.size	goToSplash, .-goToSplash
	.align	2
	.global	goToGame
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r3, .L8
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+4
	mov	r2, #1
	str	r2, [r3, #0]
	ldr	r0, .L8+8
	ldr	r3, .L8+12
	mov	lr, pc
	bx	r3
	mov	ip, #-1224736768
	mov	lr, #4864	@ movhi
	mov	r5, #100663296
	mov	r6, #67108864
	mov	ip, ip, asr #17
	ldr	r4, .L8+16
	strh	lr, [r6, #0]	@ movhi
	strh	ip, [r6, #10]	@ movhi
	mov	r2, r5
	mov	r0, #3
	ldr	r1, .L8+20
	mov	r3, #7808
	mov	lr, pc
	bx	r4
	add	r2, r5, #55296
	mov	r0, #3
	ldr	r1, .L8+24
	mov	r3, #4096
	mov	lr, pc
	bx	r4
	mov	ip, #8064
	add	ip, ip, #4
	strh	ip, [r6, #8]	@ movhi
	add	r2, r5, #16384
	mov	r0, #3
	ldr	r1, .L8+28
	mov	r3, #992
	mov	lr, pc
	bx	r4
	add	r2, r5, #63488
	mov	r0, #3
	ldr	r1, .L8+32
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	add	r2, r5, #65536
	mov	r0, #3
	ldr	r1, .L8+36
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L8+40
	add	r2, r2, #512
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	waitForVBlank
	.word	state
	.word	bgPal
	.word	loadPalette
	.word	DMANow
	.word	bgTiles
	.word	bgMap
	.word	bg2Tiles
	.word	bg2Map
	.word	characterTilesTiles
	.word	characterTilesPal
	.size	goToGame, .-goToGame
	.align	2
	.global	splash
	.type	splash, %function
splash:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L13
	ldrh	r3, [r3, #0]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L13+4
	ldrh	r3, [r3, #0]
	tst	r3, #8
	bxne	lr
	b	goToGame
.L14:
	.align	2
.L13:
	.word	oldButtons
	.word	buttons
	.size	splash, .-splash
	.align	2
	.global	goToWin
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r3, .L16
	mov	lr, pc
	bx	r3
	ldr	r0, .L16+4
	ldr	r3, .L16+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L16+12
	mov	r0, #3
	ldr	r1, .L16+16
	mov	r2, #100663296
	mov	r3, #1584
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L16+20
	add	r2, r2, #63488
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r1, #7936	@ movhi
	strh	r1, [r3, #8]	@ movhi
	ldr	r1, .L16+24
	mov	r2, #0
	mov	r0, #2
	str	r0, [r1, #0]
	strh	r2, [r3, #16]	@ movhi
	strh	r2, [r3, #18]	@ movhi
	mov	r2, #256	@ movhi
	strh	r2, [r3, #0]	@ movhi
	ldmfd	sp!, {r4, lr}
	bx	lr
.L17:
	.align	2
.L16:
	.word	waitForVBlank
	.word	winPal
	.word	loadPalette
	.word	DMANow
	.word	winTiles
	.word	winMap
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L21
	stmfd	sp!, {r4, lr}
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L18
	ldr	r3, .L21+4
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L20
.L18:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L20:
	bl	initialize
	ldmfd	sp!, {r4, lr}
	b	goToSplash
.L22:
	.align	2
.L21:
	.word	oldButtons
	.word	buttons
	.size	win, .-win
	.align	2
	.global	goToLose
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L27
	stmfd	sp!, {r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L27+4
	ldr	r2, [r3, #0]
	add	r2, r2, #1
	cmp	r2, #1
	str	r2, [r3, #0]
	ble	.L24
	ldr	r0, .L27+8
	ldr	r3, .L27+12
	mov	lr, pc
	bx	r3
	ldr	r4, .L27+16
	mov	r0, #3
	ldr	r1, .L27+20
	mov	r2, #100663296
	mov	r3, #2336
	mov	lr, pc
	bx	r4
	ldr	r1, .L27+24
	mov	r2, #100663296
	mov	r0, #3
.L26:
	add	r2, r2, #63488
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r2, #7936	@ movhi
	strh	r2, [r3, #8]	@ movhi
	mov	r2, #256	@ movhi
	strh	r2, [r3, #0]	@ movhi
	mov	r2, #0	@ movhi
	strh	r2, [r3, #16]	@ movhi
	strh	r2, [r3, #18]	@ movhi
	ldr	r3, .L27+28
	mov	r2, #3
	str	r2, [r3, #0]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L24:
	ldr	r0, .L27+32
	ldr	r3, .L27+12
	mov	lr, pc
	bx	r3
	ldr	r4, .L27+16
	mov	r0, #3
	ldr	r1, .L27+36
	mov	r2, #100663296
	mov	r3, #1680
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L27+40
	b	.L26
.L28:
	.align	2
.L27:
	.word	waitForVBlank
	.word	gamesLost
	.word	lose2Pal
	.word	loadPalette
	.word	DMANow
	.word	lose2Tiles
	.word	lose2Map
	.word	state
	.word	losePal
	.word	loseTiles
	.word	loseMap
	.size	goToLose, .-goToLose
	.align	2
	.global	lose
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L32
	stmfd	sp!, {r4, lr}
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L29
	ldr	r3, .L32+4
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L31
.L29:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L31:
	bl	initialize
	ldmfd	sp!, {r4, lr}
	b	goToSplash
.L33:
	.align	2
.L32:
	.word	oldButtons
	.word	buttons
	.size	lose, .-lose
	.align	2
	.global	goToPause
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r3, .L35
	mov	lr, pc
	bx	r3
	ldr	r0, .L35+4
	ldr	r3, .L35+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L35+12
	mov	r0, #3
	ldr	r1, .L35+16
	mov	r2, #100663296
	mov	r3, #2080
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L35+20
	add	r2, r2, #63488
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r1, #7936	@ movhi
	strh	r1, [r3, #8]	@ movhi
	ldr	r1, .L35+24
	mov	r2, #0
	mov	r0, #4
	str	r0, [r1, #0]
	strh	r2, [r3, #16]	@ movhi
	strh	r2, [r3, #18]	@ movhi
	mov	r2, #256	@ movhi
	strh	r2, [r3, #0]	@ movhi
	ldmfd	sp!, {r4, lr}
	bx	lr
.L36:
	.align	2
.L35:
	.word	waitForVBlank
	.word	pausePal
	.word	loadPalette
	.word	DMANow
	.word	pauseTiles
	.word	pauseMap
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	game
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r3, .L40
	mov	lr, pc
	bx	r3
	ldr	r3, .L40+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L40+8
	ldr	r2, [r3, #4]
	ldrh	r0, [r3, #0]
	add	r2, r2, #1
	mov	r1, #67108864
	strh	r0, [r1, #22]	@ movhi
	str	r2, [r3, #4]
	ldr	r3, .L40+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L40+16
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L37
	ldr	r3, .L40+20
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L39
.L37:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L39:
	ldmfd	sp!, {r4, lr}
	b	goToPause
.L41:
	.align	2
.L40:
	.word	update
	.word	draw
	.word	.LANCHOR0
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	game, .-game
	.align	2
	.global	pause
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L47
	stmfd	sp!, {r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L47+4
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L43
	ldr	r2, .L47+8
	ldrh	r2, [r2, #0]
	tst	r2, #8
	beq	.L45
.L43:
	tst	r3, #4
	beq	.L42
	ldr	r3, .L47+8
	ldrh	r3, [r3, #0]
	tst	r3, #4
	beq	.L46
.L42:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L46:
	bl	initialize
	ldmfd	sp!, {r4, lr}
	b	goToSplash
.L45:
	ldmfd	sp!, {r4, lr}
	b	goToGame
.L48:
	.align	2
.L47:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	pause, .-pause
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	ldr	r3, .L61
	mov	lr, pc
	bx	r3
	bl	initialize
	bl	goToSplash
	ldr	r3, .L61+4
	mov	r2, #0
	mov	r6, #67108864
	str	r2, [r3, #0]
	ldr	r5, .L61+8
	ldr	r4, .L61+12
	ldr	r8, .L61+16
	ldr	r7, .L61+20
	add	r6, r6, #256
.L60:
	ldr	r2, [r5, #0]
	ldrh	r3, [r4, #0]
	ldr	r1, [r8, #0]
.L51:
	strh	r3, [r7, #0]	@ movhi
	ldrh	r3, [r6, #48]
	sub	r2, r2, #1
	strh	r3, [r4, #0]	@ movhi
	cmp	r1, #4
	ldrls	pc, [pc, r1, asl #2]
	b	.L51
.L57:
	.word	.L52
	.word	.L53
	.word	.L54
	.word	.L55
	.word	.L56
.L56:
	str	r2, [r5, #0]
	bl	pause
	b	.L60
.L55:
	str	r2, [r5, #0]
	bl	lose
	b	.L60
.L54:
	str	r2, [r5, #0]
	bl	win
	b	.L60
.L53:
	str	r2, [r5, #0]
	bl	game
	b	.L60
.L52:
	str	r2, [r5, #0]
	bl	splash
	b	.L60
.L62:
	.align	2
.L61:
	.word	hideSprites
	.word	gamesLost
	.word	.LANCHOR0
	.word	buttons
	.word	state
	.word	oldButtons
	.size	main, .-main
	.global	MAXBULLETS
	.global	vOff
	.global	timer
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	gamesLost,4,4
	.comm	state,4,4
	.data
	.align	2
	.type	MAXBULLETS, %object
	.size	MAXBULLETS, 4
MAXBULLETS:
	.word	15
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	vOff, %object
	.size	vOff, 4
vOff:
	.space	4
	.type	timer, %object
	.size	timer, 4
timer:
	.space	4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
