;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (CYGWIN)
;--------------------------------------------------------
	.module main
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _init
	.globl _cpct_getScreenPtr
	.globl _cpct_setPALColour
	.globl _cpct_setPalette
	.globl _cpct_setVideoMode
	.globl _cpct_drawSolidBox
	.globl _cpct_drawSprite
	.globl _cpct_memset
	.globl _cpct_disableFirmware
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;src/main.c:21: void init(){
;	---------------------------------
; Function init
; ---------------------------------
_init::
	push	af
;src/main.c:24: cpct_disableFirmware();
	call	_cpct_disableFirmware
;src/main.c:26: cpct_memset(CPCT_VMEM_START, 0, 0x4000);
	ld	hl, #0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xc0
	push	hl
	call	_cpct_memset
;src/main.c:27: cpct_setVideoMode(0);
	ld	l, #0x00
	call	_cpct_setVideoMode
;src/main.c:28: cpct_setBorder(HW_BLACK);
	ld	hl, #0x1410
	push	hl
	call	_cpct_setPALColour
;src/main.c:30: cpct_setPalette(g_palette, 16);
	ld	hl, #0x0010
	push	hl
	ld	hl, #_g_palette
	push	hl
	call	_cpct_setPalette
;src/main.c:33: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, 20, 96);
	ld	hl, #0x6014
	push	hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:35: cpct_drawSolidBox(CPCT_VMEM_START, 0, 10, 10);
	push	hl
	ld	bc, #0x0a0a
	push	bc
	xor	a, a
	push	af
	inc	sp
	ld	bc, #0xc000
	push	bc
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
	pop	hl
;src/main.c:36: cpct_drawSprite(sprite,pvmem,16,16);
	pop	bc
	push	bc
	ld	de, #0x1010
	push	de
	push	hl
	push	bc
	call	_cpct_drawSprite
	pop	af
	ret
;src/main.c:40: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:41: init();
	call	_init
;src/main.c:44: while (1);
00102$:
	jr	00102$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
