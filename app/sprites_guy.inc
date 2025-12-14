// ============================================================================
// Player Sprite Data (Guy Character)
// ============================================================================
// 60 pixels tall, 6 animation frames
// Frames 1-3: right-facing, Frames 4-6: left-facing
// Uses Players 0 and 1 (16 pixels wide total)
// ============================================================================

// Frame 1 (right-facing)
guy_p0Frame1 : array[0.._GUY_HEIGHT - 1] of byte = (
    $3C, $7E, $7E, $7E, $7E, $7F, $FF, $FF,
    $7F, $7F, $FE, $FE, $FF, $FF, $FF, $FF,
    $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FB,
    $FB, $FB, $FB, $FB, $F9, $F9, $F9, $F9,
    $F1, $F0, $FE, $FF);

guy_p1Frame1 : array[0.._GUY_HEIGHT - 1] of byte = (
    $00, $00, $00, $00, $00, $80, $00, $00,
    $00, $00, $00, $00, $00, $80, $C0, $E0,
    $E0, $F0, $F8, $F8, $FC, $FC, $FC, $FC,
    $FC, $FD, $76, $10, $90, $90, $98, $D9,
    $D9, $C9, $EA, $EA, $EA, $EA, $EA, $F4,
    $FC, $F8, $F0, $F0, $F0, $F0, $F0, $F0,
    $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0,
    $F0, $FE, $FF, $00);

// Frame 2 (right-facing)
guy_p0Frame2 : array[0.._GUY_HEIGHT - 1] of byte = (
    $3C, $7E, $7E, $7E, $7E, $7F, $FF, $FF,
    $7F, $7F, $FE, $FE, $FF, $FF, $FF, $FF,
    $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FB,
    $FB, $F9, $F9, $F9, $F8, $F8, $F8, $F8,
    $F0, $F0, $FE, $FF);

guy_p1Frame2 : array[0.._GUY_HEIGHT - 1] of byte = (
    $00, $00, $00, $00, $00, $80, $00, $00,
    $00, $00, $00, $00, $00, $80, $80, $C0,
    $E0, $F0, $F8, $F8, $F8, $FC, $FC, $FC,
    $FC, $FD, $76, $10, $90, $90, $98, $D9,
    $D9, $C9, $EA, $EA, $EA, $EA, $E8, $FC,
    $FC, $F8, $F0, $F0, $F0, $F0, $F0, $F0,
    $F8, $F8, $F8, $F8, $FC, $FC, $FC, $FC,
    $7F, $7F, $78, $00);

// Frame 3 (right-facing)
guy_p0Frame3 : array[0.._GUY_HEIGHT - 1] of byte = (
    $3C, $7E, $7E, $7E, $7E, $7F, $FF, $FF,
    $7F, $7F, $FE, $FE, $FF, $FF, $FF, $FF,
    $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $FF, $FF, $FD, $FD, $FC, $FC, $FC, $F8,
    $F8, $F8, $F8, $F8, $F8, $F8, $F8, $F8,
    $F0, $F0, $FE, $FF);

guy_p1Frame3 : array[0.._GUY_HEIGHT - 1] of byte = (
    $00, $00, $00, $00, $00, $80, $00, $00,
    $00, $00, $00, $00, $00, $80, $80, $C0,
    $E0, $F0, $F8, $F8, $F8, $FC, $FC, $FC,
    $FC, $FD, $56, $10, $90, $90, $98, $D9,
    $D9, $C9, $EA, $EA, $EA, $EA, $FE, $F4,
    $FC, $FC, $FC, $FC, $FC, $FE, $FE, $FE,
    $3F, $3F, $3F, $1F, $1F, $1F, $1F, $07,
    $07, $00, $00, $00);

// Frame 4 (left-facing) - mirrored version of frame 1
guy_p0Frame4 : array[0.._GUY_HEIGHT - 1] of byte = (
    $00, $00, $00, $00, $00, $01, $00, $00,
    $00, $00, $00, $00, $00, $01, $03, $07,
    $07, $0F, $1F, $1F, $3F, $3F, $3F, $3F,
    $3F, $BF, $6E, $08, $09, $09, $19, $9B,
    $9B, $93, $57, $57, $57, $57, $57, $2F,
    $3F, $1F, $0F, $0F, $0F, $0F, $0F, $0F,
    $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F,
    $0F, $7F, $FF, $00);

guy_p1Frame4 : array[0.._GUY_HEIGHT - 1] of byte = (
    $3C, $7E, $7E, $7E, $7E, $FE, $FF, $FF,
    $FE, $FE, $7F, $7F, $FF, $FF, $FF, $FF,
    $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $FF, $FF, $FF, $FF, $FF, $FF, $FF, $DF,
    $DF, $DF, $DF, $DF, $9F, $9F, $9F, $9F,
    $8F, $0F, $7F, $FF);

// Frame 5 (left-facing) - mirrored version of frame 2
guy_p0Frame5 : array[0.._GUY_HEIGHT - 1] of byte = (
    $00, $00, $00, $00, $00, $01, $00, $00,
    $00, $00, $00, $00, $00, $01, $01, $03,
    $07, $0F, $1F, $1F, $1F, $3F, $3F, $3F,
    $3F, $BF, $6E, $08, $09, $09, $19, $9B,
    $9B, $93, $57, $57, $57, $57, $17, $3F,
    $3F, $1F, $0F, $0F, $0F, $0F, $0F, $0F,
    $1F, $1F, $1F, $1F, $3F, $3F, $3F, $3F,
    $FE, $FE, $1E, $00);

guy_p1Frame5 : array[0.._GUY_HEIGHT - 1] of byte = (
    $3C, $7E, $7E, $7E, $7E, $FE, $FF, $FF,
    $FE, $FE, $7F, $7F, $FF, $FF, $FF, $FF,
    $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $FF, $FF, $FF, $FF, $FF, $FF, $FF, $DF,
    $DF, $9F, $9F, $9F, $1F, $1F, $1F, $1F,
    $0F, $0F, $7F, $FF);

// Frame 6 (left-facing) - mirrored version of frame 3
guy_p0Frame6 : array[0.._GUY_HEIGHT - 1] of byte = (
    $00, $00, $00, $00, $00, $01, $00, $00,
    $00, $00, $00, $00, $00, $01, $01, $03,
    $07, $0F, $1F, $1F, $1F, $3F, $3F, $3F,
    $3F, $BF, $6A, $08, $09, $09, $19, $9B,
    $9B, $93, $57, $57, $57, $57, $7F, $2F,
    $3F, $3F, $3F, $3F, $3F, $7F, $7F, $7F,
    $FC, $FC, $FC, $F8, $F8, $F8, $F8, $E0,
    $E0, $00, $00, $00);

guy_p1Frame6 : array[0.._GUY_HEIGHT - 1] of byte = (
    $3C, $7E, $7E, $7E, $7E, $FE, $FF, $FF,
    $FE, $FE, $7F, $7F, $FF, $FF, $FF, $FF,
    $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $FF, $FF, $BF, $BF, $3F, $3F, $3F, $1F,
    $1F, $1F, $1F, $1F, $1F, $1F, $1F, $1F,
    $0F, $0F, $7F, $FF);

