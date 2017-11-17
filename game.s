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
	.file	"game.c"
	.text
	.align	2
	.global	init
	.type	init, %function
init:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, .L15
	mov	ip, #40
	stmfd	sp!, {r4, r5, r6}
	str	ip, [r0, #0]
	ldr	r0, .L15+4
	mov	ip, #3
	str	ip, [r0, #0]
	ldr	r0, .L15+8
	mov	r2, #0
	str	r2, [r0, #0]
	ldr	r0, .L15+12
	ldr	r3, .L15+16
	str	r2, [r0, #0]
	mov	r0, #144
	str	r0, [r3, #0]
	mov	r0, #112
	mov	r1, #16
	str	r0, [r3, #4]
	mov	r0, #20
	str	r0, [r3, #24]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	ldr	r3, .L15+20
	mov	r0, #25
	mov	ip, #1
.L2:
	add	r2, r2, #1
	cmp	r2, #8
	str	r0, [r3, #-8]
	str	r1, [r3, #4]
	str	r1, [r3, #8]
	str	r1, [r3, #-12]
	str	ip, [r3, #12]
	str	ip, [r3, #0]
	str	r2, [r3, #16]
	add	r0, r0, #25
	add	r3, r3, #36
	bne	.L2
	ldr	r3, .L15+24
	mov	r4, r1
	mov	r0, #9
	mov	r2, #25
	mov	r1, #31
.L3:
	str	r2, [r3, #-8]
	add	r2, r2, #25
	cmp	r2, #225
	str	r0, [r3, #16]
	str	r4, [r3, #4]
	str	r4, [r3, #8]
	str	r1, [r3, #-12]
	str	ip, [r3, #12]
	str	ip, [r3, #0]
	add	r0, r0, #1
	add	r3, r3, #36
	bne	.L3
	ldr	r3, .L15+28
	mov	r0, #17
	mov	r2, #25
	mov	r1, #46
.L4:
	str	r2, [r3, #-8]
	add	r2, r2, #25
	cmp	r2, #225
	str	r0, [r3, #16]
	str	r4, [r3, #4]
	str	r4, [r3, #8]
	str	r1, [r3, #-12]
	str	ip, [r3, #12]
	str	ip, [r3, #0]
	add	r0, r0, #1
	add	r3, r3, #36
	bne	.L4
	mov	r1, #25
	ldr	r3, .L15+32
	mov	r2, r1
	mov	r0, #61
.L5:
	str	r2, [r3, #-8]
	add	r2, r2, #25
	cmp	r2, #225
	str	r1, [r3, #16]
	str	r4, [r3, #4]
	str	r4, [r3, #8]
	str	r0, [r3, #-12]
	str	ip, [r3, #12]
	str	ip, [r3, #0]
	add	r1, r1, #1
	add	r3, r3, #36
	bne	.L5
	ldr	r3, .L15+36
	mov	r0, #33
	mov	r2, #25
	mov	r1, #76
.L6:
	str	r2, [r3, #-8]
	add	r2, r2, #25
	cmp	r2, #225
	str	r0, [r3, #16]
	str	r4, [r3, #4]
	str	r4, [r3, #8]
	str	r1, [r3, #-12]
	str	ip, [r3, #12]
	str	ip, [r3, #0]
	add	r0, r0, #1
	add	r3, r3, #36
	bne	.L6
	ldr	r3, .L15+40
	mov	r1, #44
	mov	r4, #6
	mov	r0, #2
	mvn	r6, #5
	mov	r2, #0
	mvn	r5, #1
.L7:
	str	r1, [r3, #-8]
	add	r1, r1, #1
	cmp	r1, #49
	str	r4, [r3, #-12]
	str	r0, [r3, #-16]
	str	r6, [r3, #-32]
	str	r2, [r3, #-28]
	str	r5, [r3, #-24]
	str	r2, [r3, #-20]
	stmda	r3, {r2, ip}	@ phole stm
	add	r3, r3, #36
	bne	.L7
	ldr	r3, .L15+44
	ldr	r5, [r3, #20]
	ldr	ip, [r3, #56]
	ldr	r3, .L15+48
	rsb	r5, r5, #0
	rsb	ip, ip, #0
	str	r2, [r3, #4]
	str	r2, [r3, #12]
	str	r2, [r3, #28]
	str	r2, [r3, #32]
	str	r2, [r3, #40]
	str	r2, [r3, #48]
	str	r2, [r3, #64]
	str	r2, [r3, #68]
	mov	r2, #50
	str	r4, [r3, #20]
	str	r0, [r3, #16]
	str	r5, [r3, #0]
	str	r0, [r3, #8]
	str	r1, [r3, #24]
	str	r4, [r3, #56]
	str	r0, [r3, #52]
	str	ip, [r3, #36]
	str	r0, [r3, #44]
	str	r2, [r3, #60]
	ldmfd	sp!, {r4, r5, r6}
	bx	lr
.L16:
	.align	2
.L15:
	.word	enemiesRemaining
	.word	livesRemaining
	.word	score
	.word	timer
	.word	player
	.word	enemies1+12
	.word	enemies2+12
	.word	enemies3+12
	.word	enemies4+12
	.word	enemies5+12
	.word	bullets+32
	.word	bullets
	.word	enemyBullets
	.size	init, .-init
	.align	2
	.global	drawPlayer
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L22
	ldr	r2, [r3, #28]
	cmp	r2, #1
	beq	.L21
	cmp	r2, #0
	bne	.L20
	ldmia	r3, {r1, r2}	@ phole ldm
	mvn	r2, r2, asl #17
	ldr	r3, .L22+4
	mvn	r2, r2, lsr #17
	orr	r1, r1, #16384
	strh	r2, [r3, #2]	@ movhi
	mov	r2, #134	@ movhi
	strh	r1, [r3, #0]	@ movhi
	strh	r2, [r3, #4]	@ movhi
	bx	lr
.L21:
	ldmia	r3, {r1, r2}	@ phole ldm
	ldr	r3, .L22+4
	orr	r1, r1, #16384
	mvn	r2, r2, asl #17
	mvn	r2, r2, lsr #17
	strh	r1, [r3, #0]	@ movhi
	mov	r1, #130	@ movhi
	strh	r2, [r3, #2]	@ movhi
	strh	r1, [r3, #4]	@ movhi
	bx	lr
.L20:
	cmp	r2, #2
	bxne	lr
	ldr	r1, [r3, #4]
	ldr	r2, .L22+4
	orr	r1, r1, #16384
	ldrh	r3, [r3, #0]
	strh	r1, [r2, #2]	@ movhi
	mov	r1, #0	@ movhi
	strh	r1, [r2, #4]	@ movhi
	strh	r3, [r2, #0]	@ movhi
	bx	lr
.L23:
	.align	2
.L22:
	.word	player
	.word	shadowOAM
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	drawBullet
	.type	drawBullet, %function
drawBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #28]
	cmp	r3, #0
	beq	.L25
	ldr	ip, [r0, #32]
	ldr	r2, [r0, #24]
	cmp	ip, #0
	ldr	r1, .L28
	ldrh	ip, [r0, #0]
	mov	r2, r2, asl #3
	ldrh	r0, [r0, #4]
	add	r3, r1, r2
	strh	ip, [r1, r2]	@ movhi
	movne	r1, #129	@ movhi
	moveq	r2, #70	@ movhi
	strh	r0, [r3, #2]	@ movhi
	strneh	r1, [r3, #4]	@ movhi
	streqh	r2, [r3, #4]	@ movhi
	bx	lr
.L25:
	ldr	r3, [r0, #24]
	ldr	r2, .L28
	mov	r3, r3, asl #3
	mov	ip, #512	@ movhi
	strh	ip, [r2, r3]	@ movhi
	bx	lr
.L29:
	.align	2
.L28:
	.word	shadowOAM
	.size	drawBullet, .-drawBullet
	.align	2
	.global	updateBullet
	.type	updateBullet, %function
updateBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #28]
	cmp	r3, #0
	bxeq	lr
	ldr	r3, [r0, #0]
	ldr	r2, [r0, #20]
	add	r2, r3, r2
	cmp	r2, #0
	ble	.L32
	ldr	r1, [r0, #12]
	ldr	r2, [r0, #4]
	add	r2, r1, r2
	cmp	r2, #0
	ble	.L32
	cmp	r2, #238
	bgt	.L32
	cmp	r3, #17
	ble	.L33
	ldr	r1, [r0, #32]
	cmp	r1, #0
	bne	.L34
.L33:
	cmp	r3, #159
	bgt	.L32
	ldr	r1, [r0, #32]
	cmp	r1, #0
	beq	.L34
.L32:
	mov	r3, #0
	str	r3, [r0, #28]
	bx	lr
.L34:
	ldr	r1, [r0, #8]
	add	r3, r1, r3
	str	r3, [r0, #0]
	str	r2, [r0, #4]
	bx	lr
	.size	updateBullet, .-updateBullet
	.align	2
	.global	fireBullet
	.type	fireBullet, %function
fireBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6}
	ldr	r0, .L41
	mov	r3, #0
	mov	r2, r0
.L38:
	ldr	r1, [r2, #28]
	cmp	r1, #0
	beq	.L40
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #36
	bne	.L38
.L35:
	ldmfd	sp!, {r4, r5, r6}
	bx	lr
.L40:
	add	r3, r3, r3, asl #3
	add	r2, r0, r3, asl #2
	ldr	r1, .L41+4
	ldr	r4, [r2, #16]
	ldr	ip, [r1, #16]
	add	r6, r4, r4, lsr #31
	ldr	r4, [r1, #0]
	add	r5, ip, ip, lsr #31
	ldr	r1, [r1, #4]
	mov	ip, r6, asr #1
	rsb	ip, ip, r5, asr #1
	sub	r4, r4, #3
	add	r1, ip, r1
	str	r4, [r0, r3, asl #2]
	mov	r3, #1
	str	r1, [r2, #4]
	str	r3, [r2, #28]
	b	.L35
.L42:
	.align	2
.L41:
	.word	bullets
	.word	player
	.size	fireBullet, .-fireBullet
	.align	2
	.global	fireEnemyBullet
	.type	fireEnemyBullet, %function
fireEnemyBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L48
	stmfd	sp!, {r4, r5, r6}
	ldr	r2, [r3, #28]
	cmp	r2, #0
	beq	.L44
	ldr	r2, [r3, #64]
	cmp	r2, #0
	beq	.L47
.L43:
	ldmfd	sp!, {r4, r5, r6}
	bx	lr
.L47:
	mov	r2, #1
.L44:
	add	r2, r2, r2, asl #3
	add	r1, r3, r2, asl #2
	ldr	r4, [r1, #16]
	ldr	ip, [r0, #16]
	add	r6, r4, r4, lsr #31
	ldr	r4, [r0, #0]
	add	r5, ip, ip, lsr #31
	ldr	r0, [r0, #4]
	mov	ip, r6, asr #1
	rsb	ip, ip, r5, asr #1
	add	r4, r4, #6
	add	r0, ip, r0
	str	r4, [r3, r2, asl #2]
	mov	r3, #1
	str	r0, [r1, #4]
	str	r3, [r1, #28]
	b	.L43
.L49:
	.align	2
.L48:
	.word	enemyBullets
	.size	fireEnemyBullet, .-fireEnemyBullet
	.align	2
	.global	updatePlayer
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	mov	r3, #67108864
	add	r3, r3, #256
	sub	sp, sp, #20
	ldrh	r2, [r3, #48]
	tst	r2, #32
	bne	.L51
	ldr	r5, .L90
	ldr	r3, [r5, #4]
	sub	r2, r3, #2
	cmp	r2, #237
	subls	r3, r3, #1
	strls	r3, [r5, #4]
	mov	r3, #0
	str	r3, [r5, #28]
.L53:
	ldr	r8, .L90+4
	ldrh	r3, [r8, #0]
	tst	r3, #1
	beq	.L56
	ldr	r2, .L90+8
	ldrh	r2, [r2, #0]
	ands	r4, r2, #1
	beq	.L82
.L56:
	tst	r3, #2
	beq	.L81
	ldr	r3, .L90+8
	ldrh	r3, [r3, #0]
	tst	r3, #2
	bne	.L81
	ldr	r3, .L90+12
	ldr	r7, .L90+16
	ldr	ip, .L90+20
	ldr	r0, .L90+24
	ldr	r1, .L90+28
	mov	r2, r7
	add	r6, r3, #288
	b	.L68
.L59:
	ldr	r4, [r1, #12]
	cmp	r4, #1
	subgt	r4, r4, #1
	strgt	r4, [r1, #12]
	ble	.L83
.L61:
	ldr	r4, [r0, #12]
	cmp	r4, #1
	subgt	r4, r4, #1
	strgt	r4, [r0, #12]
	ble	.L84
.L63:
	ldr	r4, [ip, #12]
	cmp	r4, #1
	subgt	r4, r4, #1
	strgt	r4, [ip, #12]
	ble	.L85
.L65:
	ldr	r4, [r2, #12]
	cmp	r4, #1
	subgt	r4, r4, #1
	strgt	r4, [r2, #12]
	ble	.L86
.L67:
	add	r3, r3, #36
	cmp	r3, r6
	add	r2, r2, #36
	add	ip, ip, #36
	add	r0, r0, #36
	add	r1, r1, #36
	beq	.L57
.L68:
	ldr	r4, [r3, #12]
	cmp	r4, #1
	subgt	r4, r4, #1
	strgt	r4, [r3, #12]
	bgt	.L59
	addne	r4, r4, #1
	strne	r4, [r3, #12]
	ldr	r4, [r1, #12]
	cmp	r4, #1
	subgt	r4, r4, #1
	strgt	r4, [r1, #12]
	bgt	.L61
.L83:
	addne	r4, r4, #1
	strne	r4, [r1, #12]
	ldr	r4, [r0, #12]
	cmp	r4, #1
	subgt	r4, r4, #1
	strgt	r4, [r0, #12]
	bgt	.L63
.L84:
	addne	r4, r4, #1
	strne	r4, [r0, #12]
	ldr	r4, [ip, #12]
	cmp	r4, #1
	subgt	r4, r4, #1
	strgt	r4, [ip, #12]
	bgt	.L65
.L85:
	addne	r4, r4, #1
	strne	r4, [ip, #12]
	ldr	r4, [r2, #12]
	cmp	r4, #1
	subgt	r4, r4, #1
	strgt	r4, [r2, #12]
	bgt	.L67
.L86:
	addne	r4, r4, #1
	strne	r4, [r2, #12]
	b	.L67
.L81:
	ldr	r7, .L90+16
.L57:
	ldr	r6, .L90+16
	mov	r4, #0
	b	.L70
.L69:
	add	r4, r4, #1
	cmp	r4, #8
	add	r6, r6, #36
	beq	.L87
.L70:
	ldr	r3, [r6, #24]
	cmp	r3, #0
	beq	.L69
	add	r0, r4, r4, asl #3
	add	r0, r7, r0, asl #2
	add	r4, r4, #1
	bl	fireEnemyBullet
	cmp	r4, #8
	add	r6, r6, #36
	bne	.L70
.L87:
	ldr	r3, [r5, #24]
	ldrh	r2, [r8, #0]
	add	r3, r3, #1
	tst	r2, #4
	str	r3, [r5, #24]
	beq	.L71
	ldr	r3, .L90+8
	ldrh	r3, [r3, #0]
	tst	r3, #4
	beq	.L88
.L71:
	ldr	r4, .L90+32
	ldr	r8, .L90+36
	ldr	r7, .L90+40
	add	r6, r4, #72
	mov	sl, #0
.L73:
	ldr	r3, [r4, #0]
	cmp	r3, #0
	bne	.L89
.L72:
	add	r4, r4, #36
	cmp	r4, r6
	bne	.L73
	add	sp, sp, #20
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L89:
	sub	ip, r4, #28
	ldmia	ip, {ip, lr}	@ phole ldm
	ldr	r9, [r4, #-8]
	ldr	fp, [r4, #-12]
	ldr	r3, [r5, #16]
	ldmia	r5, {r0, r1}	@ phole ldm
	ldr	r2, [r5, #20]
	stmia	sp, {ip, lr}	@ phole stm
	str	r9, [sp, #8]
	str	fp, [sp, #12]
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	ldrne	r3, [r7, #0]
	subne	r3, r3, #1
	strne	sl, [r4, #0]
	strne	r3, [r7, #0]
	b	.L72
.L51:
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L54
	ldr	r5, .L90
	ldr	r3, [r5, #4]
	cmp	r3, #0
	ble	.L55
	ldr	r2, [r5, #16]
	rsb	r2, r2, #239
	cmp	r3, r2
	addlt	r3, r3, #1
	strlt	r3, [r5, #4]
.L55:
	mov	r3, #1
	str	r3, [r5, #28]
	b	.L53
.L54:
	ldr	r5, .L90
	mov	r3, #2
	str	r3, [r5, #28]
	b	.L53
.L82:
	ldr	r2, [r5, #24]
	cmp	r2, #15
	ble	.L56
	bl	fireBullet
	ldr	r3, .L90
	str	r4, [r3, #24]
	ldrh	r3, [r8, #0]
	b	.L56
.L88:
	ldr	r3, .L90+44
	mov	lr, pc
	bx	r3
	b	.L71
.L91:
	.align	2
.L90:
	.word	player
	.word	oldButtons
	.word	buttons
	.word	enemies1
	.word	enemies5
	.word	enemies4
	.word	enemies3
	.word	enemies2
	.word	enemyBullets+28
	.word	collision
	.word	livesRemaining
	.word	goToPause
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	updateLives
	.type	updateLives, %function
updateLives:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L98
	ldr	r3, [r3, #0]
	cmp	r3, #2
	beq	.L96
	cmp	r3, #1
	beq	.L97
	cmp	r3, #0
	ldreq	r2, .L98+4
	moveq	r3, #328
	moveq	r1, #512	@ movhi
	streqh	r1, [r2, r3]	@ movhi
	bx	lr
.L96:
	ldr	r2, .L98+4
	mov	r3, #344
	mov	r1, #512	@ movhi
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L97:
	ldr	r2, .L98+4
	mov	r3, #336
	mov	r1, #512	@ movhi
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L99:
	.align	2
.L98:
	.word	livesRemaining
	.word	shadowOAM
	.size	updateLives, .-updateLives
	.align	2
	.global	updateEnemy
	.type	updateEnemy, %function
updateEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, sp, #20
	ldr	r3, [r0, #24]
	cmp	r3, #0
	mov	r5, r0
	beq	.L100
	ldr	r1, [r0, #4]
	add	r2, r0, #12
	ldmia	r2, {r2, r3}	@ phole ldm
	add	r1, r2, r1
	add	r0, r1, r3
	cmp	r0, #239
	str	r1, [r5, #4]
	ble	.L108
.L102:
	ldr	r0, [r5, #0]
	rsb	r2, r2, #0
	add	r0, r0, #8
	str	r2, [r5, #12]
	str	r0, [r5, #0]
.L103:
	ldr	ip, .L110
	ldr	r6, [ip, #0]
	ldr	r4, [ip, #4]
	add	ip, ip, #16
	ldmia	ip, {ip, lr}	@ phole ldm
	ldr	r2, [r5, #20]
	ldr	r7, .L110+4
	str	r6, [sp, #0]
	stmib	sp, {r4, lr}	@ phole stm
	str	ip, [sp, #12]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	ldrne	r3, .L110+8
	movne	r2, #0
	ldr	r4, .L110+12
	strne	r2, [r3, #0]
	ldr	r8, .L110+16
	add	r6, r4, #180
	mov	sl, #0
.L106:
	ldr	r3, [r4, #0]
	cmp	r3, #0
	bne	.L109
.L105:
	add	r4, r4, #36
	cmp	r4, r6
	bne	.L106
.L100:
	add	sp, sp, #20
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L108:
	cmp	r1, #2
	ldrgt	r0, [r5, #0]
	bgt	.L103
	b	.L102
.L109:
	sub	ip, r4, #28
	ldmia	ip, {ip, lr}	@ phole ldm
	ldr	r9, [r4, #-8]
	ldr	fp, [r4, #-12]
	ldmia	r5, {r0, r1}	@ phole ldm
	ldr	r2, [r5, #20]
	ldr	r3, [r5, #16]
	stmia	sp, {ip, lr}	@ phole stm
	str	r9, [sp, #8]
	str	fp, [sp, #12]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L105
	ldr	r3, [r8, #0]
	sub	r3, r3, #1
	cmp	r3, #0
	str	sl, [r5, #24]
	str	r3, [r8, #0]
	str	sl, [r4, #0]
	bne	.L105
	ldr	r3, .L110+20
	mov	lr, pc
	bx	r3
	b	.L105
.L111:
	.align	2
.L110:
	.word	player
	.word	collision
	.word	livesRemaining
	.word	bullets+28
	.word	enemiesRemaining
	.word	goToWin
	.size	updateEnemy, .-updateEnemy
	.align	2
	.global	drawEnemy
	.type	drawEnemy, %function
drawEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	str	r4, [sp, #-4]!
	ldr	r3, [r0, #24]
	cmp	r3, #0
	beq	.L113
	ldr	r3, [r0, #28]
	ldr	r4, [r0, #4]
	ldr	r1, .L119
	ldrh	r0, [r0, #0]
	mov	r2, r3, asl #3
	cmp	r3, #8
	add	ip, r1, r2
	orr	r4, r4, #16384
	strh	r0, [r1, r2]	@ movhi
	movle	r1, #2	@ movhi
	strh	r4, [ip, #2]	@ movhi
	strleh	r1, [ip, #4]	@ movhi
	ble	.L112
	sub	r2, r3, #9
	cmp	r2, #7
	movls	r3, #4	@ movhi
	strlsh	r3, [ip, #4]	@ movhi
	bls	.L112
	sub	r2, r3, #17
	cmp	r2, #7
	movls	r1, #64	@ movhi
	strlsh	r1, [ip, #4]	@ movhi
	bls	.L112
	sub	r2, r3, #25
	cmp	r2, #7
	movls	r3, #68	@ movhi
	strlsh	r3, [ip, #4]	@ movhi
	bls	.L112
	sub	r3, r3, #33
	cmp	r3, #11
	movls	r1, #66	@ movhi
	strlsh	r1, [ip, #4]	@ movhi
.L112:
	ldmfd	sp!, {r4}
	bx	lr
.L113:
	ldr	r3, [r0, #28]
	ldr	r2, .L119
	mov	r3, r3, asl #3
	mov	r1, #512	@ movhi
	strh	r1, [r2, r3]	@ movhi
	b	.L112
.L120:
	.align	2
.L119:
	.word	shadowOAM
	.size	drawEnemy, .-drawEnemy
	.align	2
	.global	hideSprites
	.type	hideSprites, %function
hideSprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L124
	mov	r3, #0
.L122:
	mov	r1, #512	@ movhi
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L122
	bx	lr
.L125:
	.align	2
.L124:
	.word	shadowOAM
	.size	hideSprites, .-hideSprites
	.align	2
	.global	drawNumber
	.type	drawNumber, %function
drawNumber:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r2, #9
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
	mov	r4, r2
	mov	r8, r0
	mov	r6, r1
	mov	r7, r3
	ble	.L138
	ldr	sl, .L151
.L140:
	smull	r3, r5, sl, r4
	mov	r3, r4, asr #31
	rsb	r5, r3, r5, asr #2
	mov	r2, r5
	add	r5, r5, r5, asl #2
	mov	r1, r6
	mov	r3, r7
	mov	r0, r8
	sub	r4, r4, r5, asl #1
	bl	drawNumber
	cmp	r4, #9
	add	r6, r6, #6
	add	r7, r7, #1
	bgt	.L140
.L138:
	cmp	r4, #0
	beq	.L142
	cmp	r4, #1
	beq	.L143
	cmp	r4, #2
	beq	.L144
	cmp	r4, #3
	beq	.L145
	cmp	r4, #4
	beq	.L146
	cmp	r4, #5
	beq	.L147
	cmp	r4, #6
	beq	.L148
	cmp	r4, #7
	beq	.L149
	cmp	r4, #8
	beq	.L150
	cmp	r4, #9
	bne	.L126
	ldr	r2, .L151+4
	mov	r7, r7, asl #3
	add	r3, r2, r7
	orr	r6, r6, #16384
	strh	r8, [r2, r7]	@ movhi
	mov	r2, #264	@ movhi
	strh	r6, [r3, #2]	@ movhi
	strh	r2, [r3, #4]	@ movhi
	b	.L126
.L142:
	ldr	r2, .L151+4
	mov	r7, r7, asl #3
	add	r3, r2, r7
	orr	r6, r6, #16384
	strh	r8, [r2, r7]	@ movhi
	mov	r2, #192	@ movhi
	strh	r6, [r3, #2]	@ movhi
	strh	r2, [r3, #4]	@ movhi
.L126:
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
	bx	lr
.L143:
	ldr	r2, .L151+4
	mov	r7, r7, asl #3
	add	r3, r2, r7
	orr	r6, r6, #16384
	strh	r8, [r2, r7]	@ movhi
	mov	r2, #194	@ movhi
	strh	r6, [r3, #2]	@ movhi
	strh	r2, [r3, #4]	@ movhi
	b	.L126
.L144:
	ldr	r2, .L151+4
	mov	r7, r7, asl #3
	add	r3, r2, r7
	orr	r6, r6, #16384
	strh	r8, [r2, r7]	@ movhi
	mov	r2, #196	@ movhi
	strh	r6, [r3, r4]	@ movhi
	strh	r2, [r3, #4]	@ movhi
	b	.L126
.L145:
	ldr	r2, .L151+4
	mov	r7, r7, asl #3
	add	r3, r2, r7
	orr	r6, r6, #16384
	strh	r8, [r2, r7]	@ movhi
	mov	r2, #198	@ movhi
	strh	r6, [r3, #2]	@ movhi
	strh	r2, [r3, #4]	@ movhi
	b	.L126
.L146:
	ldr	r2, .L151+4
	mov	r7, r7, asl #3
	add	r3, r2, r7
	orr	r6, r6, #16384
	strh	r8, [r2, r7]	@ movhi
	mov	r2, #200	@ movhi
	strh	r6, [r3, #2]	@ movhi
	strh	r2, [r3, r4]	@ movhi
	b	.L126
.L147:
	ldr	r2, .L151+4
	mov	r7, r7, asl #3
	add	r3, r2, r7
	orr	r6, r6, #16384
	strh	r8, [r2, r7]	@ movhi
	mov	r2, #256	@ movhi
	strh	r6, [r3, #2]	@ movhi
	strh	r2, [r3, #4]	@ movhi
	b	.L126
.L148:
	ldr	r1, .L151+4
	mov	r7, r7, asl #3
	mov	r3, #256
.L141:
	add	r2, r1, r7
	orr	r6, r6, #16384
	add	r3, r3, #2
	strh	r8, [r1, r7]	@ movhi
	strh	r6, [r2, #2]	@ movhi
	strh	r3, [r2, #4]	@ movhi
	b	.L126
.L149:
	ldr	r2, .L151+4
	mov	r7, r7, asl #3
	add	r3, r2, r7
	orr	r6, r6, #16384
	strh	r8, [r2, r7]	@ movhi
	mov	r2, #260	@ movhi
	strh	r6, [r3, #2]	@ movhi
	strh	r2, [r3, #4]	@ movhi
	b	.L126
.L150:
	ldr	r1, .L151+4
	mov	r7, r7, asl #3
	mov	r3, #260
	b	.L141
.L152:
	.align	2
.L151:
	.word	1717986919
	.word	shadowOAM
	.size	drawNumber, .-drawNumber
	.align	2
	.global	draw
	.type	draw, %function
draw:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	bl	drawPlayer
	ldr	r9, .L166
	ldr	sl, .L166+4
	ldr	r8, .L166+8
	ldr	r7, .L166+12
	ldr	r6, .L166+16
	mov	r5, #0
.L154:
	add	r4, r5, r5, asl #3
	mov	r4, r4, asl #2
	add	r0, r9, r4
	bl	drawEnemy
	add	r0, sl, r4
	bl	drawEnemy
	add	r0, r8, r4
	bl	drawEnemy
	add	r0, r7, r4
	bl	drawEnemy
	add	r5, r5, #1
	add	r0, r6, r4
	bl	drawEnemy
	cmp	r5, #8
	bne	.L154
	ldr	r3, .L166+20
	ldr	r2, .L166+24
	add	ip, r3, #180
.L158:
	ldr	r1, [r3, #-4]
	cmp	r1, #0
	beq	.L155
	ldr	lr, [r3, #0]
	ldr	r1, [r3, #-8]
	cmp	lr, #0
	ldrh	lr, [r3, #-32]
	mov	r1, r1, asl #3
	add	r0, r2, r1
	strh	lr, [r2, r1]	@ movhi
	ldrh	r1, [r3, #-28]
	movne	lr, #129	@ movhi
	strh	r1, [r0, #2]	@ movhi
	moveq	r1, #70	@ movhi
	strneh	lr, [r0, #4]	@ movhi
	streqh	r1, [r0, #4]	@ movhi
.L157:
	add	r3, r3, #36
	cmp	r3, ip
	bne	.L158
	ldr	r3, .L166+28
	add	r0, r3, #72
.L162:
	ldr	r1, [r3, #-4]
	cmp	r1, #0
	beq	.L159
	ldr	lr, [r3, #0]
	ldr	r1, [r3, #-8]
	cmp	lr, #0
	ldrh	lr, [r3, #-32]
	mov	r1, r1, asl #3
	add	ip, r2, r1
	strh	lr, [r2, r1]	@ movhi
	ldrh	r1, [r3, #-28]
	movne	lr, #129	@ movhi
	strh	r1, [ip, #2]	@ movhi
	moveq	r1, #70	@ movhi
	strneh	lr, [ip, #4]	@ movhi
	streqh	r1, [ip, #4]	@ movhi
.L161:
	add	r3, r3, #36
	cmp	r3, r0
	bne	.L162
	ldr	r3, .L166+32
	mov	r0, #0
	ldr	r2, [r3, #0]
	mov	r1, #210
	mov	r3, #50
	bl	drawNumber
	ldr	r3, .L166+36
	mov	r0, #0
	ldr	r2, [r3, #0]
	mov	r1, #45
	mov	r3, #41
	bl	drawNumber
	mov	r0, #3
	ldr	r1, .L166+24
	mov	r2, #117440512
	mov	r3, #512
	ldr	ip, .L166+40
	mov	lr, pc
	bx	ip
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	bx	lr
.L155:
	ldr	r1, [r3, #-8]
	mov	lr, #512	@ movhi
	mov	r1, r1, asl #3
	strh	lr, [r2, r1]	@ movhi
	b	.L157
.L159:
	ldr	r1, [r3, #-8]
	mov	ip, #512	@ movhi
	mov	r1, r1, asl #3
	strh	ip, [r2, r1]	@ movhi
	b	.L161
.L167:
	.align	2
.L166:
	.word	enemies1
	.word	enemies2
	.word	enemies3
	.word	enemies4
	.word	enemies5
	.word	bullets+32
	.word	shadowOAM
	.word	enemyBullets+32
	.word	score
	.word	livesRemaining
	.word	DMANow
	.size	draw, .-draw
	.align	2
	.global	speedUp
	.type	speedUp, %function
speedUp:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L182
	stmfd	sp!, {r4, r5, r6, r7}
	ldr	r2, .L182+4
	ldr	r3, [r3, #0]
	smull	r1, r2, r3, r2
	mov	r1, r3, asr #31
	rsb	r2, r1, r2, asr #5
	add	r2, r2, r2, asl #2
	add	r2, r2, r2, asl #2
	cmp	r3, r2, asl #2
	bne	.L168
	mov	r2, #548
	add	r2, r2, #2
	cmp	r3, r2
	ble	.L168
	ldr	r3, .L182+8
	ldr	r4, .L182+12
	ldr	ip, .L182+16
	ldr	r0, .L182+20
	ldr	r1, .L182+24
	add	r6, r3, #288
.L180:
	ldr	r2, [r3, #12]
	sub	r5, r2, #1
	cmp	r5, #3
	bhi	.L170
	tst	r2, #1
	addne	r2, r2, #1
	strne	r2, [r3, #12]
	bne	.L171
.L170:
	add	r7, r2, #4
	cmp	r7, #3
	bhi	.L171
	tst	r2, #1
	strne	r5, [r3, #12]
.L171:
	ldr	r2, [r1, #12]
	sub	r5, r2, #1
	cmp	r5, #3
	bhi	.L172
	tst	r2, #1
	addne	r2, r2, #1
	strne	r2, [r1, #12]
	bne	.L173
.L172:
	add	r7, r2, #4
	cmp	r7, #3
	bhi	.L173
	tst	r2, #1
	strne	r5, [r1, #12]
.L173:
	ldr	r2, [r0, #12]
	sub	r5, r2, #1
	cmp	r5, #3
	bhi	.L174
	tst	r2, #1
	addne	r2, r2, #1
	strne	r2, [r0, #12]
	bne	.L175
.L174:
	add	r7, r2, #4
	cmp	r7, #3
	bhi	.L175
	tst	r2, #1
	strne	r5, [r0, #12]
.L175:
	ldr	r2, [ip, #12]
	sub	r5, r2, #1
	cmp	r5, #3
	bhi	.L176
	tst	r2, #1
	addne	r2, r2, #1
	strne	r2, [ip, #12]
	bne	.L177
.L176:
	add	r7, r2, #4
	cmp	r7, #3
	bhi	.L177
	tst	r2, #1
	strne	r5, [ip, #12]
.L177:
	ldr	r2, [r4, #12]
	sub	r5, r2, #1
	cmp	r5, #3
	bhi	.L178
	tst	r2, #1
	addne	r2, r2, #1
	strne	r2, [r4, #12]
	bne	.L179
.L178:
	add	r7, r2, #4
	cmp	r7, #3
	bhi	.L179
	tst	r2, #1
	strne	r5, [r4, #12]
.L179:
	add	r3, r3, #36
	cmp	r3, r6
	add	r4, r4, #36
	add	ip, ip, #36
	add	r0, r0, #36
	add	r1, r1, #36
	bne	.L180
.L168:
	ldmfd	sp!, {r4, r5, r6, r7}
	bx	lr
.L183:
	.align	2
.L182:
	.word	timer
	.word	1374389535
	.word	enemies1
	.word	enemies5
	.word	enemies4
	.word	enemies3
	.word	enemies2
	.size	speedUp, .-speedUp
	.align	2
	.global	update
	.type	update, %function
update:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	bl	updatePlayer
	ldr	r9, .L190
	ldr	sl, .L190+4
	ldr	r8, .L190+8
	ldr	r7, .L190+12
	ldr	r6, .L190+16
	mov	r5, #0
.L185:
	add	r4, r5, r5, asl #3
	mov	r4, r4, asl #2
	add	r0, r9, r4
	bl	updateEnemy
	add	r0, sl, r4
	bl	updateEnemy
	add	r0, r8, r4
	bl	updateEnemy
	add	r0, r7, r4
	bl	updateEnemy
	add	r5, r5, #1
	add	r0, r6, r4
	bl	updateEnemy
	cmp	r5, #8
	bne	.L185
	ldr	r3, .L190+20
	ldr	r2, [r3, #0]
	ldr	r3, .L190+24
	rsb	r2, r2, #40
	str	r2, [r3, #0]
	ldr	r5, .L190+28
	mov	r4, #0
.L186:
	add	r0, r4, r4, asl #3
	add	r0, r5, r0, asl #2
	add	r4, r4, #1
	bl	updateBullet
	cmp	r4, #5
	bne	.L186
	ldr	r0, .L190+32
	bl	updateBullet
	ldr	r0, .L190+36
	bl	updateBullet
	ldr	r3, .L190+40
	ldr	r3, [r3, #0]
	cmp	r3, #0
	ldreq	r3, .L190+44
	moveq	lr, pc
	bxeq	r3
.L187:
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	b	speedUp
.L191:
	.align	2
.L190:
	.word	enemies1
	.word	enemies2
	.word	enemies3
	.word	enemies4
	.word	enemies5
	.word	enemiesRemaining
	.word	score
	.word	bullets
	.word	enemyBullets
	.word	enemyBullets+36
	.word	livesRemaining
	.word	goToLose
	.size	update, .-update
	.comm	shadowOAM,1024,4
	.comm	gamesLost,4,4
	.comm	player,32,4
	.comm	bullets,180,4
	.comm	enemyBullets,72,4
	.comm	enemies1,288,4
	.comm	enemies2,288,4
	.comm	enemies3,288,4
	.comm	enemies4,288,4
	.comm	enemies5,288,4
	.comm	enemiesRemaining,4,4
	.comm	livesRemaining,4,4
	.comm	score,4,4
	.comm	timer,4,4
	.comm	lives,72,4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
