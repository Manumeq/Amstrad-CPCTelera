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
   43F2                      32 _prota::
   43F2                      33 	.ds 5
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
   4210 21 F3 43      [10]   64 	ld	hl, #(_prota + 0x0001) + 0
   4213 56            [ 7]   65 	ld	d, (hl)
   4214 21 F2 43      [10]   66 	ld	hl, #_prota + 0
   4217 5E            [ 7]   67 	ld	e, (hl)
   4218 D5            [11]   68 	push	de
   4219 21 00 C0      [10]   69 	ld	hl, #0xc000
   421C E5            [11]   70 	push	hl
   421D CD D2 43      [17]   71 	call	_cpct_getScreenPtr
   4220 4D            [ 4]   72 	ld	c, l
   4221 44            [ 4]   73 	ld	b, h
                             74 ;src/main.c:30: cpct_drawSprite(prota.sprite,pvmem,prota.x,prota.y);
   4222 21 F3 43      [10]   75 	ld	hl, #(_prota + 0x0001) + 0
   4225 56            [ 7]   76 	ld	d, (hl)
   4226 21 F2 43      [10]   77 	ld	hl, #_prota + 0
   4229 5E            [ 7]   78 	ld	e, (hl)
   422A 2A F4 43      [16]   79 	ld	hl, (#_prota + 2)
   422D E5            [11]   80 	push	hl
   422E FD E1         [14]   81 	pop	iy
   4230 D5            [11]   82 	push	de
   4231 C5            [11]   83 	push	bc
   4232 FD E5         [15]   84 	push	iy
   4234 CD DB 42      [17]   85 	call	_cpct_drawSprite
   4237 C9            [10]   86 	ret
                             87 ;src/main.c:32: void mover_personaje(){
                             88 ;	---------------------------------
                             89 ; Function mover_personaje
                             90 ; ---------------------------------
   4238                      91 _mover_personaje::
                             92 ;src/main.c:33: if(cpct_isKeyPressed(Key_CursorRight)){
   4238 21 00 02      [10]   93 	ld	hl, #0x0200
   423B CD C3 42      [17]   94 	call	_cpct_isKeyPressed
   423E 7D            [ 4]   95 	ld	a, l
   423F B7            [ 4]   96 	or	a, a
   4240 C0            [11]   97 	ret	NZ
                             98 ;src/main.c:35: }else if(cpct_isKeyPressed(Key_CursorLeft)){
   4241 21 01 01      [10]   99 	ld	hl, #0x0101
   4244 CD C3 42      [17]  100 	call	_cpct_isKeyPressed
   4247 7D            [ 4]  101 	ld	a, l
   4248 B7            [ 4]  102 	or	a, a
   4249 C0            [11]  103 	ret	NZ
                            104 ;src/main.c:37: }else if(cpct_isKeyPressed(Key_CursorUp)){
   424A 21 00 01      [10]  105 	ld	hl, #0x0100
   424D C3 C3 42      [10]  106 	jp  _cpct_isKeyPressed
                            107 ;src/main.c:43: void init(){
                            108 ;	---------------------------------
                            109 ; Function init
                            110 ; ---------------------------------
   4250                     111 _init::
                            112 ;src/main.c:45: cpct_disableFirmware();
   4250 CD C1 43      [17]  113 	call	_cpct_disableFirmware
                            114 ;src/main.c:47: cpct_memset(CPCT_VMEM_START, 0, 0x4000);
   4253 21 00 40      [10]  115 	ld	hl, #0x4000
   4256 E5            [11]  116 	push	hl
   4257 AF            [ 4]  117 	xor	a, a
   4258 F5            [11]  118 	push	af
   4259 33            [ 6]  119 	inc	sp
   425A 26 C0         [ 7]  120 	ld	h, #0xc0
   425C E5            [11]  121 	push	hl
   425D CD B3 43      [17]  122 	call	_cpct_memset
                            123 ;src/main.c:48: cpct_setVideoMode(0);
   4260 2E 00         [ 7]  124 	ld	l, #0x00
   4262 CD 8A 43      [17]  125 	call	_cpct_setVideoMode
                            126 ;src/main.c:49: cpct_setBorder(HW_BLACK);
   4265 21 10 14      [10]  127 	ld	hl, #0x1410
   4268 E5            [11]  128 	push	hl
   4269 CD CF 42      [17]  129 	call	_cpct_setPALColour
                            130 ;src/main.c:51: cpct_setPalette(g_palette, 16);
   426C 21 10 00      [10]  131 	ld	hl, #0x0010
   426F E5            [11]  132 	push	hl
   4270 21 00 40      [10]  133 	ld	hl, #_g_palette
   4273 E5            [11]  134 	push	hl
   4274 CD AC 42      [17]  135 	call	_cpct_setPalette
                            136 ;src/main.c:54: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, 20, 96);
   4277 21 14 60      [10]  137 	ld	hl, #0x6014
   427A E5            [11]  138 	push	hl
   427B 21 00 C0      [10]  139 	ld	hl, #0xc000
   427E E5            [11]  140 	push	hl
   427F CD D2 43      [17]  141 	call	_cpct_getScreenPtr
   4282 EB            [ 4]  142 	ex	de,hl
                            143 ;src/main.c:57: prota.x=20;
   4283 21 F2 43      [10]  144 	ld	hl, #_prota
   4286 36 14         [10]  145 	ld	(hl), #0x14
                            146 ;src/main.c:58: prota.y=15;
   4288 21 F3 43      [10]  147 	ld	hl, #(_prota + 0x0001)
   428B 36 0F         [10]  148 	ld	(hl), #0x0f
                            149 ;src/main.c:59: prota.sprite=g_PJ_0;
   428D 01 10 40      [10]  150 	ld	bc, #_g_PJ_0+0
   4290 ED 43 F4 43   [20]  151 	ld	((_prota + 0x0002)), bc
                            152 ;src/main.c:60: cpct_drawSprite(prota.sprite,pvmem,64,32);
   4294 21 40 20      [10]  153 	ld	hl, #0x2040
   4297 E5            [11]  154 	push	hl
   4298 D5            [11]  155 	push	de
   4299 C5            [11]  156 	push	bc
   429A CD DB 42      [17]  157 	call	_cpct_drawSprite
   429D C9            [10]  158 	ret
                            159 ;src/main.c:64: void main(void) {
                            160 ;	---------------------------------
                            161 ; Function main
                            162 ; ---------------------------------
   429E                     163 _main::
                            164 ;src/main.c:65: init();
   429E CD 50 42      [17]  165 	call	_init
                            166 ;src/main.c:68: while (1){
   42A1                     167 00104$:
                            168 ;src/main.c:69: if(cpct_isAnyKeyPressed_f){//con f mas rapido pero mas memoria
   42A1 3E 43         [ 7]  169 	ld	a, #>(_cpct_isAnyKeyPressed_f)
   42A3 F6 98         [ 7]  170 	or	a,#<(_cpct_isAnyKeyPressed_f)
   42A5 28 FA         [12]  171 	jr	Z,00104$
                            172 ;src/main.c:70: mover_personaje();
   42A7 CD 38 42      [17]  173 	call	_mover_personaje
   42AA 18 F5         [12]  174 	jr	00104$
                            175 	.area _CODE
                            176 	.area _INITIALIZER
                            177 	.area _CABS (ABS)
