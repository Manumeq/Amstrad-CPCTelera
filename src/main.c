//-----------------------------LICENSE NOTICE------------------------------------
//  This file is part of CPCtelera: An Amstrad CPC Game Engine
//  Copyright (C) 2015 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU Lesser General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU Lesser General Public License for more details.
//
//  You should have received a copy of the GNU Lesser General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.
//------------------------------------------------------------------------------

#include <cpctelera.h>
#include "PJ_0.h"
typedef struct{
    u8 x,y;
    u8* sprite;
    u8 mover;
}TProta;
TProta  prota;
void dibujarProta(){
    u8* pvmem=cpct_getScreenPtr(CPCT_VMEM_START,prota.x,prota.y);
    //cpct_drawSpriteMaskedAlignedTable(prota.sprite,pvmem,prota.x,prota.y);
    cpct_drawSprite(prota.sprite,pvmem,prota.x,prota.y);
}
void mover_personaje(){
    if(cpct_isKeyPressed(Key_CursorRight)){

    }else if(cpct_isKeyPressed(Key_CursorLeft)){

    }else if(cpct_isKeyPressed(Key_CursorUp)){

    }else{

    }
}
void init(){
    u8* pvmem;  // Pointer to video memory
    cpct_disableFirmware();
    // Clear Screen
    cpct_memset(CPCT_VMEM_START, 0, 0x4000);
    cpct_setVideoMode(0);
    cpct_setBorder(HW_BLACK);
    //cpct_fw2hw(g_palette, 16);
    cpct_setPalette(g_palette, 16);

    // Draw String on the middle of the screen
    pvmem = cpct_getScreenPtr(CPCT_VMEM_START, 20, 96);
    //cpct_drawStringM0("Welcome to CPCtelera!", pvmem, 1, 0);
    
    prota.x=20;
    prota.y=15;
    prota.sprite=g_PJ_0;
    cpct_drawSprite(prota.sprite,pvmem,64,32);

}

void main(void) {
    init();

    // Loop forever
    while (1){
        if(cpct_isAnyKeyPressed_f){//con f mas rapido pero mas memoria
            mover_personaje();
        }
    }
}
