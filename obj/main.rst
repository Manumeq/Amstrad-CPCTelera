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
                             14 	.globl _dibujar_personaje
                             15 	.globl _cpct_getScreenPtr
                             16 	.globl _cpct_setPALColour
                             17 	.globl _cpct_setPalette
                             18 	.globl _cpct_waitVSYNC
                             19 	.globl _cpct_setVideoMode
                             20 	.globl _cpct_drawSprite
                             21 	.globl _cpct_isAnyKeyPressed_f
                             22 	.globl _cpct_isKeyPressed
                             23 	.globl _cpct_scanKeyboard_if
                             24 	.globl _cpct_memset
                             25 	.globl _cpct_disableFirmware
                             26 	.globl _prota
                             27 ;--------------------------------------------------------
                             28 ; special function registers
                             29 ;--------------------------------------------------------
                             30 ;--------------------------------------------------------
                             31 ; ram data
                             32 ;--------------------------------------------------------
                             33 	.area _DATA
   49B6                      34 _prota::
   49B6                      35 	.ds 5
                             36 ;--------------------------------------------------------
                             37 ; ram data
                             38 ;--------------------------------------------------------
                             39 	.area _INITIALIZED
                             40 ;--------------------------------------------------------
                             41 ; absolute external ram data
                             42 ;--------------------------------------------------------
                             43 	.area _DABS (ABS)
                             44 ;--------------------------------------------------------
                             45 ; global & static initialisations
                             46 ;--------------------------------------------------------
                             47 	.area _HOME
                             48 	.area _GSINIT
                             49 	.area _GSFINAL
                             50 	.area _GSINIT
                             51 ;--------------------------------------------------------
                             52 ; Home
                             53 ;--------------------------------------------------------
                             54 	.area _HOME
                             55 	.area _HOME
                             56 ;--------------------------------------------------------
                             57 ; code
                             58 ;--------------------------------------------------------
                             59 	.area _CODE
                             60 ;src/main.c:27: void dibujar_personaje(){
                             61 ;	---------------------------------
                             62 ; Function dibujar_personaje
                             63 ; ---------------------------------
   4760                      64 _dibujar_personaje::
                             65 ;src/main.c:29: pvmem = cpct_getScreenPtr(CPCT_VMEM_START,prota.x,prota.y);
   4760 21 B7 49      [10]   66 	ld	hl, #_prota + 1
   4763 56            [ 7]   67 	ld	d, (hl)
   4764 21 B6 49      [10]   68 	ld	hl, #_prota + 0
   4767 5E            [ 7]   69 	ld	e, (hl)
   4768 D5            [11]   70 	push	de
   4769 21 00 C0      [10]   71 	ld	hl, #0xc000
   476C E5            [11]   72 	push	hl
   476D CD 96 49      [17]   73 	call	_cpct_getScreenPtr
   4770 4D            [ 4]   74 	ld	c, l
   4771 44            [ 4]   75 	ld	b, h
                             76 ;src/main.c:30: cpct_drawSprite(prota.sprite,pvmem,G_PJ_0_W,G_PJ_0_H);
   4772 2A B8 49      [16]   77 	ld	hl, (#_prota + 2)
   4775 11 09 1B      [10]   78 	ld	de, #0x1b09
   4778 D5            [11]   79 	push	de
   4779 C5            [11]   80 	push	bc
   477A E5            [11]   81 	push	hl
   477B CD 2F 48      [17]   82 	call	_cpct_drawSprite
   477E C9            [10]   83 	ret
                             84 ;src/main.c:32: void mover_personaje(){
                             85 ;	---------------------------------
                             86 ; Function mover_personaje
                             87 ; ---------------------------------
   477F                      88 _mover_personaje::
                             89 ;src/main.c:33: if(cpct_isKeyPressed(Key_CursorRight)){
   477F 21 00 02      [10]   90 	ld	hl, #0x0200
   4782 CD 17 48      [17]   91 	call	_cpct_isKeyPressed
   4785 7D            [ 4]   92 	ld	a, l
   4786 B7            [ 4]   93 	or	a, a
   4787 28 09         [12]   94 	jr	Z,00107$
                             95 ;src/main.c:34: prota.x++;
   4789 01 B6 49      [10]   96 	ld	bc, #_prota+0
   478C 0A            [ 7]   97 	ld	a, (bc)
   478D 3C            [ 4]   98 	inc	a
   478E 02            [ 7]   99 	ld	(bc), a
                            100 ;src/main.c:35: dibujar_personaje();
   478F C3 60 47      [10]  101 	jp  _dibujar_personaje
   4792                     102 00107$:
                            103 ;src/main.c:36: }else if(cpct_isKeyPressed(Key_CursorLeft)){
   4792 21 01 01      [10]  104 	ld	hl, #0x0101
   4795 CD 17 48      [17]  105 	call	_cpct_isKeyPressed
   4798 7D            [ 4]  106 	ld	a, l
   4799 B7            [ 4]  107 	or	a, a
   479A C0            [11]  108 	ret	NZ
                            109 ;src/main.c:38: }else if(cpct_isKeyPressed(Key_CursorUp)){
   479B 21 00 01      [10]  110 	ld	hl, #0x0100
   479E C3 17 48      [10]  111 	jp  _cpct_isKeyPressed
                            112 ;src/main.c:45: void init(){
                            113 ;	---------------------------------
                            114 ; Function init
                            115 ; ---------------------------------
   47A1                     116 _init::
                            117 ;src/main.c:47: cpct_disableFirmware();
   47A1 CD 85 49      [17]  118 	call	_cpct_disableFirmware
                            119 ;src/main.c:49: cpct_memset(CPCT_VMEM_START, 0, 0x4000);
   47A4 21 00 40      [10]  120 	ld	hl, #0x4000
   47A7 E5            [11]  121 	push	hl
   47A8 AF            [ 4]  122 	xor	a, a
   47A9 F5            [11]  123 	push	af
   47AA 33            [ 6]  124 	inc	sp
   47AB 26 C0         [ 7]  125 	ld	h, #0xc0
   47AD E5            [11]  126 	push	hl
   47AE CD 77 49      [17]  127 	call	_cpct_memset
                            128 ;src/main.c:50: cpct_setVideoMode(0);
   47B1 2E 00         [ 7]  129 	ld	l, #0x00
   47B3 CD 4E 49      [17]  130 	call	_cpct_setVideoMode
                            131 ;src/main.c:51: cpct_setBorder(HW_BLACK);
   47B6 21 10 14      [10]  132 	ld	hl, #0x1410
   47B9 E5            [11]  133 	push	hl
   47BA CD 23 48      [17]  134 	call	_cpct_setPALColour
                            135 ;src/main.c:53: cpct_setPalette(g_palette, 16);
   47BD 21 10 00      [10]  136 	ld	hl, #0x0010
   47C0 E5            [11]  137 	push	hl
   47C1 21 00 40      [10]  138 	ld	hl, #_g_palette
   47C4 E5            [11]  139 	push	hl
   47C5 CD 00 48      [17]  140 	call	_cpct_setPalette
                            141 ;src/main.c:56: pvmem = cpct_getScreenPtr(CPCT_VMEM_START,prota.x,prota.y);
   47C8 21 B7 49      [10]  142 	ld	hl, #(_prota + 0x0001) + 0
   47CB 56            [ 7]  143 	ld	d, (hl)
   47CC 21 B6 49      [10]  144 	ld	hl, #_prota + 0
   47CF 5E            [ 7]  145 	ld	e, (hl)
   47D0 D5            [11]  146 	push	de
   47D1 21 00 C0      [10]  147 	ld	hl, #0xc000
   47D4 E5            [11]  148 	push	hl
   47D5 CD 96 49      [17]  149 	call	_cpct_getScreenPtr
                            150 ;src/main.c:59: prota.x=20;
   47D8 21 B6 49      [10]  151 	ld	hl, #_prota
   47DB 36 14         [10]  152 	ld	(hl), #0x14
                            153 ;src/main.c:60: prota.y=15;
   47DD 21 B7 49      [10]  154 	ld	hl, #(_prota + 0x0001)
   47E0 36 0F         [10]  155 	ld	(hl), #0x0f
                            156 ;src/main.c:61: prota.sprite=g_PJ_0;
   47E2 21 10 40      [10]  157 	ld	hl, #_g_PJ_0
   47E5 22 B8 49      [16]  158 	ld	((_prota + 0x0002)), hl
   47E8 C9            [10]  159 	ret
                            160 ;src/main.c:66: void main(void) {
                            161 ;	---------------------------------
                            162 ; Function main
                            163 ; ---------------------------------
   47E9                     164 _main::
                            165 ;src/main.c:67: init();
   47E9 CD A1 47      [17]  166 	call	_init
                            167 ;src/main.c:70: while (1){
   47EC                     168 00104$:
                            169 ;src/main.c:71: cpct_scanKeyboard_if();
   47EC CD DE 48      [17]  170 	call	_cpct_scanKeyboard_if
                            171 ;src/main.c:72: if(cpct_isAnyKeyPressed_f){//con f mas rapido pero mas memoria
   47EF 3E 49         [ 7]  172 	ld	a, #>(_cpct_isAnyKeyPressed_f)
   47F1 F6 5C         [ 7]  173 	or	a,#<(_cpct_isAnyKeyPressed_f)
   47F3 28 06         [12]  174 	jr	Z,00102$
                            175 ;src/main.c:73: mover_personaje();
   47F5 CD 7F 47      [17]  176 	call	_mover_personaje
                            177 ;src/main.c:74: dibujar_personaje();
   47F8 CD 60 47      [17]  178 	call	_dibujar_personaje
   47FB                     179 00102$:
                            180 ;src/main.c:76: cpct_waitVSYNC();
   47FB CD 46 49      [17]  181 	call	_cpct_waitVSYNC
   47FE 18 EC         [12]  182 	jr	00104$
                            183 	.area _CODE
                            184 	.area _INITIALIZER
                            185 	.area _CABS (ABS)
