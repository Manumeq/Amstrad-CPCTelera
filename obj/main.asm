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
	.globl _dibujar_personaje
	.globl _cpct_getScreenPtr
	.globl _cpct_setPALColour
	.globl _cpct_setPalette
	.globl _cpct_waitVSYNC
	.globl _cpct_setVideoMode
	.globl _cpct_drawSprite
	.globl _cpct_isAnyKeyPressed_f
	.globl _cpct_isKeyPressed
	.globl _cpct_scanKeyboard_if
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
;src/main.c:27: void dibujar_personaje(){
;	---------------------------------
; Function dibujar_personaje
; ---------------------------------
_dibujar_personaje::
;src/main.c:29: pvmem = cpct_getScreenPtr(CPCT_VMEM_START,prota.x,prota.y);
	ld	hl, #_prota + 1
	ld	d, (hl)
	ld	hl, #_prota + 0
	ld	e, (hl)
	push	de
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	ld	c, l
	ld	b, h
;src/main.c:30: cpct_drawSprite(prota.sprite,pvmem,G_PJ_0_W,G_PJ_0_H);
	ld	hl, (#_prota + 2)
	ld	de, #0x1b09
	push	de
	push	bc
	push	hl
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
	jr	Z,00107$
;src/main.c:34: prota.x++;
	ld	bc, #_prota+0
	ld	a, (bc)
	inc	a
	ld	(bc), a
;src/main.c:35: dibujar_personaje();
	jp  _dibujar_personaje
00107$:
;src/main.c:36: }else if(cpct_isKeyPressed(Key_CursorLeft)){
	ld	hl, #0x0101
	call	_cpct_isKeyPressed
	ld	a, l
	or	a, a
	ret	NZ
;src/main.c:38: }else if(cpct_isKeyPressed(Key_CursorUp)){
	ld	hl, #0x0100
	jp  _cpct_isKeyPressed
;src/main.c:45: void init(){
;	---------------------------------
; Function init
; ---------------------------------
_init::
;src/main.c:47: cpct_disableFirmware();
	call	_cpct_disableFirmware
;src/main.c:49: cpct_memset(CPCT_VMEM_START, 0, 0x4000);
	ld	hl, #0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xc0
	push	hl
	call	_cpct_memset
;src/main.c:50: cpct_setVideoMode(0);
	ld	l, #0x00
	call	_cpct_setVideoMode
;src/main.c:51: cpct_setBorder(HW_BLACK);
	ld	hl, #0x1410
	push	hl
	call	_cpct_setPALColour
;src/main.c:53: cpct_setPalette(g_palette, 16);
	ld	hl, #0x0010
	push	hl
	ld	hl, #_g_palette
	push	hl
	call	_cpct_setPalette
;src/main.c:56: pvmem = cpct_getScreenPtr(CPCT_VMEM_START,prota.x,prota.y);
	ld	hl, #(_prota + 0x0001) + 0
	ld	d, (hl)
	ld	hl, #_prota + 0
	ld	e, (hl)
	push	de
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:59: prota.x=20;
	ld	hl, #_prota
	ld	(hl), #0x14
;src/main.c:60: prota.y=15;
	ld	hl, #(_prota + 0x0001)
	ld	(hl), #0x0f
;src/main.c:61: prota.sprite=g_PJ_0;
	ld	hl, #_g_PJ_0
	ld	((_prota + 0x0002)), hl
	ret
;src/main.c:66: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:67: init();
	call	_init
;src/main.c:70: while (1){
00104$:
;src/main.c:71: cpct_scanKeyboard_if();
	call	_cpct_scanKeyboard_if
;src/main.c:72: if(cpct_isAnyKeyPressed_f){//con f mas rapido pero mas memoria
	ld	a, #>(_cpct_isAnyKeyPressed_f)
	or	a,#<(_cpct_isAnyKeyPressed_f)
	jr	Z,00102$
;src/main.c:73: mover_personaje();
	call	_mover_personaje
;src/main.c:74: dibujar_personaje();
	call	_dibujar_personaje
00102$:
;src/main.c:76: cpct_waitVSYNC();
	call	_cpct_waitVSYNC
	jr	00104$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
