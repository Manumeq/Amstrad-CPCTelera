                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (CYGWIN)
                              4 ;--------------------------------------------------------
                              5 	.module main
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _main
                             12 	.globl _init
                             13 	.globl _mover_personaje
                             14 	.globl _dibujarProta
                             15 	.globl _cpct_getScreenPtr
                             16 	.globl _cpct_setPALColour
                             17 	.globl _cpct_setPalette
                             18 	.globl _cpct_setVideoMode
                             19 	.globl _cpct_drawSprite
                             20 	.globl _cpct_isAnyKeyPressed_f
                             21 	.globl _cpct_isKeyPressed
                             22 	.globl _cpct_memset
                             23 	.globl _cpct_disableFirmware
                             24 	.globl _prota
                             25 ;--------------------------------------------------------
                             26 ; special function registers
                             27 ;--------------------------------------------------------
                             28 ;--------------------------------------------------------
                             29 ; ram data
                             30 ;--------------------------------------------------------
                             31 	.area _DATA
   43E9                      32 _prota::
   43E9                      33 	.ds 5
                             34 ;--------------------------------------------------------
                             35 ; ram data
                             36 ;--------------------------------------------------------
                             37 	.area _INITIALIZED
                             38 ;--------------------------------------------------------
                             39 ; absolute external ram data
                             40 ;--------------------------------------------------------
                             41 	.area _DABS (ABS)
                             42 ;--------------------------------------------------------
                             43 ; global & static initialisations
                             44 ;--------------------------------------------------------
                             45 	.area _HOME
                             46 	.area _GSINIT
                             47 	.area _GSFINAL
                             48 	.area _GSINIT
                             49 ;--------------------------------------------------------
                             50 ; Home
                             51 ;--------------------------------------------------------
                             52 	.area _HOME
                             53 	.area _HOME
                             54 ;--------------------------------------------------------
                             55 ; code
                             56 ;--------------------------------------------------------
                             57 	.area _CODE
                             58 ;src/main.c:27: void dibujarProta(){
                             59 ;	---------------------------------
                             60 ; Function dibujarProta
                             61 ; ---------------------------------
   4210                      62 _dibujarProta::
                             63 ;src/main.c:28: u8* pvmem=cpct_getScreenPtr(CPCT_VMEM_START,prota.x,prota.y);
   4210 21 EA 43      [10]   64 	ld	hl, #_prota + 1
   4213 56            [ 7]   65 	ld	d, (hl)
   4214 21 E9 43      [10]   66 	ld	hl, #_prota + 0
   4217 5E            [ 7]   67 	ld	e, (hl)
   4218 D5            [11]   68 	push	de
   4219 21 00 C0      [10]   69 	ld	hl, #0xc000
   421C E5            [11]   70 	push	hl
   421D CD C9 43      [17]   71 	call	_cpct_getScreenPtr
   4220 4D            [ 4]   72 	ld	c, l
   4221 44            [ 4]   73 	ld	b, h
                             74 ;src/main.c:30: cpct_drawSprite(prota.sprite,pvmem,G_PJ_0_W,G_PJ_0_H);
   4222 2A EB 43      [16]   75 	ld	hl, (#_prota + 2)
   4225 11 10 20      [10]   76 	ld	de, #0x2010
   4228 D5            [11]   77 	push	de
   4229 C5            [11]   78 	push	bc
   422A E5            [11]   79 	push	hl
   422B CD D2 42      [17]   80 	call	_cpct_drawSprite
   422E C9            [10]   81 	ret
                             82 ;src/main.c:32: void mover_personaje(){
                             83 ;	---------------------------------
                             84 ; Function mover_personaje
                             85 ; ---------------------------------
   422F                      86 _mover_personaje::
                             87 ;src/main.c:33: if(cpct_isKeyPressed(Key_CursorRight)){
   422F 21 00 02      [10]   88 	ld	hl, #0x0200
   4232 CD BA 42      [17]   89 	call	_cpct_isKeyPressed
   4235 7D            [ 4]   90 	ld	a, l
   4236 B7            [ 4]   91 	or	a, a
   4237 C0            [11]   92 	ret	NZ
                             93 ;src/main.c:35: }else if(cpct_isKeyPressed(Key_CursorLeft)){
   4238 21 01 01      [10]   94 	ld	hl, #0x0101
   423B CD BA 42      [17]   95 	call	_cpct_isKeyPressed
   423E 7D            [ 4]   96 	ld	a, l
   423F B7            [ 4]   97 	or	a, a
   4240 C0            [11]   98 	ret	NZ
                             99 ;src/main.c:37: }else if(cpct_isKeyPressed(Key_CursorUp)){
   4241 21 00 01      [10]  100 	ld	hl, #0x0100
   4244 C3 BA 42      [10]  101 	jp  _cpct_isKeyPressed
                            102 ;src/main.c:43: void init(){
                            103 ;	---------------------------------
                            104 ; Function init
                            105 ; ---------------------------------
   4247                     106 _init::
                            107 ;src/main.c:45: cpct_disableFirmware();
   4247 CD B8 43      [17]  108 	call	_cpct_disableFirmware
                            109 ;src/main.c:47: cpct_memset(CPCT_VMEM_START, 0, 0x4000);
   424A 21 00 40      [10]  110 	ld	hl, #0x4000
   424D E5            [11]  111 	push	hl
   424E AF            [ 4]  112 	xor	a, a
   424F F5            [11]  113 	push	af
   4250 33            [ 6]  114 	inc	sp
   4251 26 C0         [ 7]  115 	ld	h, #0xc0
   4253 E5            [11]  116 	push	hl
   4254 CD AA 43      [17]  117 	call	_cpct_memset
                            118 ;src/main.c:48: cpct_setVideoMode(0);
   4257 2E 00         [ 7]  119 	ld	l, #0x00
   4259 CD 81 43      [17]  120 	call	_cpct_setVideoMode
                            121 ;src/main.c:49: cpct_setBorder(HW_BLACK);
   425C 21 10 14      [10]  122 	ld	hl, #0x1410
   425F E5            [11]  123 	push	hl
   4260 CD C6 42      [17]  124 	call	_cpct_setPALColour
                            125 ;src/main.c:51: cpct_setPalette(g_palette, 16);
   4263 21 10 00      [10]  126 	ld	hl, #0x0010
   4266 E5            [11]  127 	push	hl
   4267 21 00 40      [10]  128 	ld	hl, #_g_palette
   426A E5            [11]  129 	push	hl
   426B CD A3 42      [17]  130 	call	_cpct_setPalette
                            131 ;src/main.c:54: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, 20, 96);
   426E 21 14 60      [10]  132 	ld	hl, #0x6014
   4271 E5            [11]  133 	push	hl
   4272 21 00 C0      [10]  134 	ld	hl, #0xc000
   4275 E5            [11]  135 	push	hl
   4276 CD C9 43      [17]  136 	call	_cpct_getScreenPtr
   4279 EB            [ 4]  137 	ex	de,hl
                            138 ;src/main.c:57: prota.x=20;
   427A 21 E9 43      [10]  139 	ld	hl, #_prota
   427D 36 14         [10]  140 	ld	(hl), #0x14
                            141 ;src/main.c:58: prota.y=15;
   427F 21 EA 43      [10]  142 	ld	hl, #(_prota + 0x0001)
   4282 36 0F         [10]  143 	ld	(hl), #0x0f
                            144 ;src/main.c:59: prota.sprite=g_PJ_0;
   4284 01 10 40      [10]  145 	ld	bc, #_g_PJ_0+0
   4287 ED 43 EB 43   [20]  146 	ld	((_prota + 0x0002)), bc
                            147 ;src/main.c:60: cpct_drawSprite(prota.sprite,pvmem,16,32);
   428B 21 10 20      [10]  148 	ld	hl, #0x2010
   428E E5            [11]  149 	push	hl
   428F D5            [11]  150 	push	de
   4290 C5            [11]  151 	push	bc
   4291 CD D2 42      [17]  152 	call	_cpct_drawSprite
   4294 C9            [10]  153 	ret
                            154 ;src/main.c:64: void main(void) {
                            155 ;	---------------------------------
                            156 ; Function main
                            157 ; ---------------------------------
   4295                     158 _main::
                            159 ;src/main.c:65: init();
   4295 CD 47 42      [17]  160 	call	_init
                            161 ;src/main.c:68: while (1){
   4298                     162 00104$:
                            163 ;src/main.c:69: if(cpct_isAnyKeyPressed_f){//con f mas rapido pero mas memoria
   4298 3E 43         [ 7]  164 	ld	a, #>(_cpct_isAnyKeyPressed_f)
   429A F6 8F         [ 7]  165 	or	a,#<(_cpct_isAnyKeyPressed_f)
   429C 28 FA         [12]  166 	jr	Z,00104$
                            167 ;src/main.c:70: mover_personaje();
   429E CD 2F 42      [17]  168 	call	_mover_personaje
   42A1 18 F5         [12]  169 	jr	00104$
                            170 	.area _CODE
                            171 	.area _INITIALIZER
                            172 	.area _CABS (ABS)
