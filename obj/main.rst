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
                             13 	.globl _cpct_getScreenPtr
                             14 	.globl _cpct_setPALColour
                             15 	.globl _cpct_setPalette
                             16 	.globl _cpct_setVideoMode
                             17 	.globl _cpct_drawSolidBox
                             18 	.globl _cpct_drawSprite
                             19 	.globl _cpct_memset
                             20 	.globl _cpct_disableFirmware
                             21 ;--------------------------------------------------------
                             22 ; special function registers
                             23 ;--------------------------------------------------------
                             24 ;--------------------------------------------------------
                             25 ; ram data
                             26 ;--------------------------------------------------------
                             27 	.area _DATA
                             28 ;--------------------------------------------------------
                             29 ; ram data
                             30 ;--------------------------------------------------------
                             31 	.area _INITIALIZED
                             32 ;--------------------------------------------------------
                             33 ; absolute external ram data
                             34 ;--------------------------------------------------------
                             35 	.area _DABS (ABS)
                             36 ;--------------------------------------------------------
                             37 ; global & static initialisations
                             38 ;--------------------------------------------------------
                             39 	.area _HOME
                             40 	.area _GSINIT
                             41 	.area _GSFINAL
                             42 	.area _GSINIT
                             43 ;--------------------------------------------------------
                             44 ; Home
                             45 ;--------------------------------------------------------
                             46 	.area _HOME
                             47 	.area _HOME
                             48 ;--------------------------------------------------------
                             49 ; code
                             50 ;--------------------------------------------------------
                             51 	.area _CODE
                             52 ;src/main.c:21: void init(){
                             53 ;	---------------------------------
                             54 ; Function init
                             55 ; ---------------------------------
   422C                      56 _init::
   422C F5            [11]   57 	push	af
                             58 ;src/main.c:24: cpct_disableFirmware();
   422D CD 68 43      [17]   59 	call	_cpct_disableFirmware
                             60 ;src/main.c:26: cpct_memset(CPCT_VMEM_START, 0, 0x4000);
   4230 21 00 40      [10]   61 	ld	hl, #0x4000
   4233 E5            [11]   62 	push	hl
   4234 AF            [ 4]   63 	xor	a, a
   4235 F5            [11]   64 	push	af
   4236 33            [ 6]   65 	inc	sp
   4237 26 C0         [ 7]   66 	ld	h, #0xc0
   4239 E5            [11]   67 	push	hl
   423A CD 5A 43      [17]   68 	call	_cpct_memset
                             69 ;src/main.c:27: cpct_setVideoMode(0);
   423D 2E 00         [ 7]   70 	ld	l, #0x00
   423F CD 4C 43      [17]   71 	call	_cpct_setVideoMode
                             72 ;src/main.c:28: cpct_setBorder(HW_BLACK);
   4242 21 10 14      [10]   73 	ld	hl, #0x1410
   4245 E5            [11]   74 	push	hl
   4246 CD 9B 42      [17]   75 	call	_cpct_setPALColour
                             76 ;src/main.c:30: cpct_setPalette(g_palette, 16);
   4249 21 10 00      [10]   77 	ld	hl, #0x0010
   424C E5            [11]   78 	push	hl
   424D 21 00 40      [10]   79 	ld	hl, #_g_palette
   4250 E5            [11]   80 	push	hl
   4251 CD 84 42      [17]   81 	call	_cpct_setPalette
                             82 ;src/main.c:33: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, 20, 96);
   4254 21 14 60      [10]   83 	ld	hl, #0x6014
   4257 E5            [11]   84 	push	hl
   4258 21 00 C0      [10]   85 	ld	hl, #0xc000
   425B E5            [11]   86 	push	hl
   425C CD 31 44      [17]   87 	call	_cpct_getScreenPtr
                             88 ;src/main.c:35: cpct_drawSolidBox(CPCT_VMEM_START, 0, 10, 10);
   425F E5            [11]   89 	push	hl
   4260 01 0A 0A      [10]   90 	ld	bc, #0x0a0a
   4263 C5            [11]   91 	push	bc
   4264 AF            [ 4]   92 	xor	a, a
   4265 F5            [11]   93 	push	af
   4266 33            [ 6]   94 	inc	sp
   4267 01 00 C0      [10]   95 	ld	bc, #0xc000
   426A C5            [11]   96 	push	bc
   426B CD 78 43      [17]   97 	call	_cpct_drawSolidBox
   426E F1            [10]   98 	pop	af
   426F F1            [10]   99 	pop	af
   4270 33            [ 6]  100 	inc	sp
   4271 E1            [10]  101 	pop	hl
                            102 ;src/main.c:36: cpct_drawSprite(sprite,pvmem,16,16);
   4272 C1            [10]  103 	pop	bc
   4273 C5            [11]  104 	push	bc
   4274 11 10 10      [10]  105 	ld	de, #0x1010
   4277 D5            [11]  106 	push	de
   4278 E5            [11]  107 	push	hl
   4279 C5            [11]  108 	push	bc
   427A CD A7 42      [17]  109 	call	_cpct_drawSprite
   427D F1            [10]  110 	pop	af
   427E C9            [10]  111 	ret
                            112 ;src/main.c:40: void main(void) {
                            113 ;	---------------------------------
                            114 ; Function main
                            115 ; ---------------------------------
   427F                     116 _main::
                            117 ;src/main.c:41: init();
   427F CD 2C 42      [17]  118 	call	_init
                            119 ;src/main.c:44: while (1);
   4282                     120 00102$:
   4282 18 FE         [12]  121 	jr	00102$
                            122 	.area _CODE
                            123 	.area _INITIALIZER
                            124 	.area _CABS (ABS)
