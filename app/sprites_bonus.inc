// ============================================================================
// Bonus Sprite Data (Rolka/Sreel Character)
// ============================================================================
// 18 pixels tall (_HEIGHT constant), 4 animation frames
// Uses Players 2 and 3 for bonus collection (16 pixels wide total)
// Based on Mr. Hoppe bonus system
// ============================================================================

// Player 0 data (left half of sprite)
sreel_p0Frame1 : array[0.._HEIGHT - 1] of byte = 
    ($00, $00, $00, $3, $F, $1B, $11, $3B, $3E, $3E, $3B, $11, $1B, $F, $33, $00, $00, $00);

sreel_p0Frame2 : array[0.._HEIGHT - 1] of byte = 
    ($00, $00, $00, $3, $F, $1E, $1F, $37, $22, $36, $3F, $1E, $1C, $E, $3, $00, $00, $00);

sreel_p0Frame3 : array[0.._HEIGHT - 1] of byte = 
    ($00, $00, $00, $3, $F, $1B, $11, $3B, $3E, $3E, $3B, $11, $1B, $F, $3, $00, $00, $00);

sreel_p0Frame4 : array[0.._HEIGHT - 1] of byte = 
    ($00, $00, $00, $23, $2F, $3E, $1F, $37, $22, $36, $3F, $1E, $1C, $E, $3, $00, $00, $00);

// Player 1 data (right half of sprite)
sreel_p1Frame1 : array[0.._HEIGHT - 1] of byte = 
    ($00, $00, $00, $E0, $F0, $D8, $88, $DC, $7C, $7C, $DC, $88, $D8, $F0, $E0, $00, $00, $00);

sreel_p1Frame2 : array[0.._HEIGHT - 1] of byte = 
    ($00, $00, $00, $C0, $70, $38, $78, $FC, $6C, $44, $EC, $F8, $78, $F4, $C4, $00, $00, $00);

sreel_p1Frame3 : array[0.._HEIGHT - 1] of byte = 
    ($00, $00, $00, $EC, $F0, $D8, $88, $DC, $7C, $7C, $DC, $88, $D8, $F0, $E0, $00, $00, $00);

sreel_p1Frame4 : array[0.._HEIGHT - 1] of byte = 
    ($00, $00, $00, $C0, $70, $38, $78, $FC, $6C, $44, $EC, $F8, $78, $F0, $C0, $00, $00, $00);

