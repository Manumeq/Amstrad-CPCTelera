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
	.globl _mover_personaje
	.globl _dibujarProta
	.globl _cpct_getScreenPtr
	.globl _cpct_setPALColour
	.globl _cpct_setPalette
	.globl _cpct_setVideoMode
	.globl _cpct_drawSprite
	.globl _cpct_isAnyKeyPressed_f
	.globl _cpct_isKeyPressed
	.globl _cpct_memset
	.globl _cpct_disableFirmware
	.globl _prota
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_prota::
	.ds 5
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
;src/main.c:27: void dibujarProta(){
;	---------------------------------
; Function dibujarProta
; ---------------------------------
_dibujarProta::
;src/main.c:28: u8* pvmem=cpct_getScreenPtr(CPCT_VMEM_START,prota.x,prota.y);
	ld	hl, #(_prota + 0x0001) + 0
	ld	d, (hl)
	ld	hl, #_prota + 0
	ld	e, (hl)
	push	de
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	ld	c, l
	ld	b, h
;src/main.c:30: cpct_drawSprite(prota.sprite,pvmem,prota.x,prota.y);
	ld	hl, #(_prota + 0x0001) + 0
	ld	d, (hl)
	ld	hl, #_prota + 0
	ld	e, (hl)
	ld	hl, (#_prota + 2)
	push	hl
	pop	iy
	push	de
	push	bc
	push	iy
	call	_cpct_drawSprite
	ret
;src/main.c:32: void mover_personaje(){
;	---------------------------------
; Function mover_personaje
; ---------------------------------
_mover_personaje::
;src/main.c:33: if(cpct_isKeyPressed(Key_CursorRight)){
	ld	hl, #0x0200
	call	_cpct_isKeyPressed
	ld	a, l
	or	a, a
	ret	NZ
;src/main.c:35: }else if(cpct_isKeyPressed(Key_CursorLeft)){
	ld	hl, #0x0101
	call	_cpct_isKeyPressed
	ld	a, l
	or	a, a
	ret	NZ
;src/main.c:37: }else if(cpct_isKeyPressed(Key_CursorUp)){
	ld	hl, #0x0100
	jp  _cpct_isKeyPressed
;src/main.c:43: void init(){
;	---------------------------------
; Function init
; ---------------------------------
_init::
;src/main.c:45: cpct_disableFirmware();
	call	_cpct_disableFirmware
;src/main.c:47: cpct_memset(CPCT_VMEM_START, 0, 0x4000);
	ld	hl, #0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xc0
	push	hl
	call	_cpct_memset
;src/main.c:48: cpct_setVideoMode(0);
	ld	l, #0x00
	call	_cpct_setVideoMode
;src/main.c:49: cpct_setBorder(HW_BLACK);
	ld	hl, #0x1410
	push	hl
	call	_cpct_setPALColour
;src/main.c:51: cpct_setPalette(g_palette, 16);
	ld	hl, #0x0010
	push	hl
	ld	hl, #_g_palette
	push	hl
	call	_cpct_setPalette
;src/main.c:54: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, 20, 96);
	ld	hl, #0x6014
	push	hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	ex	de,hl
;src/main.c:57: prota.x=20;
	ld	hl, #_prota
	ld	(hl), #0x14
;src/main.c:58: prota.y=15;
	ld	hl, #(_prota + 0x0001)
	ld	(hl), #0x0f
;src/main.c:59: prota.sprite=g_PJ_0;
	ld	bc, #_g_PJ_0+0
	ld	((_prota + 0x0002)), bc
;src/main.c:60: cpct_drawSprite(prota.sprite,pvmem,64,32);
	ld	hl, #0x2040
	push	hl
	push	de
	push	bc
	call	_cpct_drawSprite
	ret
;src/main.c:64: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:65: init();
	call	_init
;src/main.c:68: while (1){
00104$:
;src/main.c:69: if(cpct_isAnyKeyPressed_f){//con f mas rapido pero mas memoria
	ld	a, #>(_cpct_isAnyKeyPressed_f)
	or	a,#<(_cpct_isAnyKeyPressed_f)
	jr	Z,00104$
;src/main.c:70: mover_personaje();
	call	_mover_personaje
	jr	00104$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
