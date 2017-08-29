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
#include "credits.h"
void init(){
    u8* pvmem;  // Pointer to video memory
    u8* sprite;
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
    cpct_drawSolidBox(CPCT_VMEM_START, 0, 10, 10);
    cpct_drawSprite(sprite,pvmem,16,16);

}

void main(void) {
    init();

    // Loop forever
    while (1);
}
