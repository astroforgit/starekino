program wsk;
{$librarypath '../../blibs/'}
{$librarypath '../../MADS/blibs/'}
uses atari, rmt, b_system, b_crt;

const
{$i const.inc}
{$r resources.rc}
dlist_title: array [0..34] of byte = (
		$70,$70,$70,$70,$70,$70,$70,$C2,lo(TITLEBACK_MEM),hi(TITLEBACK_MEM),
		$82,$82,$82,$82,$82,$82,$82,$82,
		$82,$82,$82,$82,$82,$82,$82,$00,
		$00,$00,$00,$00,$00,$00,
		$41,lo(word(@dlist_title)),hi(word(@dlist_title))
	);
var
    hpos : word = 0;
    music : boolean;
    msx : TRMT;
    old_vbl,old_dli : Pointer;
    i : byte;
    frame, guyframe : byte;
    offset_x : Word;
    offset_y : Word;
    gamestatus : Byte = 2;
    tab: array [0..127] of byte; 


    pcolr : array[0..3] of byte absolute $D012;   // Player color
    hposp : array[0..3] of byte absolute $D000;  // Player horizontal position
    sizep : array[0..3] of byte absolute $D008;  // Player size
    hposm : array[0..3] of byte absolute $D004;  // Missile horizontal position
    gtiactl	: byte absolute	$D01B;
    vsc : byte absolute $14;

    joy_1 : byte absolute $D300;
    strig0 : byte absolute $D010;

    // Player data
    // Player PMG sprites (2 sprites, 60 pixels tall) - Frames 1-3: right-facing
    // Full 60-byte sprite for single-line resolution - Frame 1 (right-facing)
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

    // Player 0 data
    bat_p0Frame1 : array[0.._HEIGHT - 1] of byte =
        ($00, $00, $2, $2, $3, $F, $3E, $7F, $7F, $F3, $C3, $80, $00, $00, $00, $00, $00, $00);
    bat_p0Frame2 : array[0.._HEIGHT - 1] of byte = 
        ($00, $00, $00, $2, $C2, $73, $7B, $3E, $3F, $1F, $17, $3, $00, $00, $00, $00, $00, $00);
    bat_p0Frame3 : array[0.._HEIGHT - 1] of byte = 
        ($00, $00, $2, $2, $3, $F, $3E, $7F, $7F, $F3, $C3, $80, $00, $00, $00, $00, $00, $00);
    bat_p0Frame4 : array[0.._HEIGHT - 1] of byte = 
        ($00, $00, $00, $2, $C2, $73, $7B, $3E, $3F, $1F, $17, $3, $00, $00, $00, $00, $00, $00);

    // Player 1 data
    bat_p1Frame1 : array[0.._HEIGHT - 1] of byte = 
        ($00, $00, $40, $40, $C0, $F0, $BC, $FE, $FE, $CF, $C3, $1, $00, $00, $00, $00, $00, $00);
    bat_p1Frame2 : array[0.._HEIGHT - 1] of byte = 
        ($00, $00, $00, $40, $43, $CE, $DE, $BC, $FC, $F8, $E8, $C0, $00, $00, $00, $00, $00, $00);
    bat_p1Frame3 : array[0.._HEIGHT - 1] of byte = 
        ($00, $00, $40, $40, $C0, $F0, $BC, $FE, $FE, $CF, $C3, $1, $00, $00, $00, $00, $00, $00);
    bat_p1Frame4 : array[0.._HEIGHT - 1] of byte = 
        ($00, $00, $00, $40, $43, $CE, $DE, $BC, $FC, $F8, $E8, $C0, $00, $00, $00, $00, $00, $00);

    bat_pos: array[0.._SIZE - 1] of byte =
        (0,0,0,0,0,0,0,0,0,2,2,2,4,4,4,6,6,6,8,8,8,9,9,10,9,9,8,8,8,6,6,6,4,4,4,2,2,2,0,0,0,0,0,0,0,0,0,0,0,0,2,2,2,4,4,4,6,6,6,8,8,8,9,9,10,9,9,8,8,8,6,6,6,4,4,4,0,0,0,0,0,0,0,0);

    // Player 0 data
    sreel_p0Frame1 : array[0.._HEIGHT - 1] of byte = 
        ($00, $00, $00, $3, $F, $1B, $11, $3B, $3E, $3E, $3B, $11, $1B, $F, $33, $00, $00, $00);
    sreel_p0Frame2 : array[0.._HEIGHT - 1] of byte = 
        ($00, $00, $00, $3, $F, $1E, $1F, $37, $22, $36, $3F, $1E, $1C, $E, $3, $00, $00, $00);

    sreel_p0Frame3 : array[0.._HEIGHT - 1] of byte = 
        ($00, $00, $00, $3, $F, $1B, $11, $3B, $3E, $3E, $3B, $11, $1B, $F, $3, $00, $00, $00);

    sreel_p0Frame4 : array[0.._HEIGHT - 1] of byte = 
        ($00, $00, $00, $23, $2F, $3E, $1F, $37, $22, $36, $3F, $1E, $1C, $E, $3, $00, $00, $00);

    // Player 1 data
    sreel_p1Frame1 : array[0.._HEIGHT - 1] of byte = 
        ($00, $00, $00, $E0, $F0, $D8, $88, $DC, $7C, $7C, $DC, $88, $D8, $F0, $E0, $00, $00, $00);

    sreel_p1Frame2 : array[0.._HEIGHT - 1] of byte = 
        ($00, $00, $00, $C0, $70, $38, $78, $FC, $6C, $44, $EC, $F8, $78, $F4, $C4, $00, $00, $00);

    sreel_p1Frame3 : array[0.._HEIGHT - 1] of byte = 
        ($00, $00, $00, $EC, $F0, $D8, $88, $DC, $7C, $7C, $DC, $88, $D8, $F0, $E0, $00, $00, $00);

    sreel_p1Frame4 : array[0.._HEIGHT - 1] of byte = 
        ($00, $00, $00, $C0, $70, $38, $78, $FC, $6C, $44, $EC, $F8, $78, $F0, $C0, $00, $00, $00);

    sreel_pos: array[0.._SIZE - 1] of byte =
        (0,0,0,0,0,2,2,2,4,4,4,6,6,6,8,8,8,9,9,9,10,10,10,9,9,9,8,8,8,6,6,6,4,4,4,2,2,2,0,0,0,0,0,0,0,0,0,0,0,0,2,2,2,4,4,4,6,6,6,8,8,8,9,9,9,10,10,10,9,9,9,8,8,8,6,6,6,4,4,4,0,0,0,0);

    // Player position
    bike_px0 : byte = 240; bike_py0 : byte = 90;
    bike_px1 : byte = 247; bike_py1 : byte = 90;
    
    bat_px0 : byte = 80; bat_py0 : byte = 24;
    bat_px1 : byte = 88; bat_py1 : byte = 24;

    sreel_px0 : byte = 100; sreel_py0 : byte = 71;
    sreel_px1 : byte = 107; sreel_py1 : byte = 71;

    guy_x : byte = 60; guy_y : byte = 68;  // Not used anymore (was for background drawing)
    guy_oldx : byte; guy_oldy : byte;  // Not used anymore
    guy_px0 : byte = 120;  // Horizontal position for left sprite
    guy_px1 : byte = 128;  // Horizontal position for right sprite (8 pixels right, adjacent)
    guy_py : byte = 130;   // Vertical position - lower under buildings (60 bytes = 60 scanlines, at 130-189)
    guy_base_py : byte = 130;  // Base Y position (ground level)
    guy_jump_height : byte = 0;  // Current jump height (0 = on ground)
    guy_jump_velocity : shortint = 0;  // Jump velocity (positive = up, negative = down)



	fntTable: array [0..29] of byte;
    //  = (
	// 	hi(TITLE1_FONT1),hi(TITLE1_FONT1),hi(TITLE1_FONT1),hi(TITLE1_FONT1),hi(TITLE1_FONT1),hi(TITLE1_FONT1),hi(TITLE1_FONT1),hi(TITLE1_FONT1),
	// 	hi(TITLE1_FONT1),hi(TITLE1_FONT1),hi(TITLE1_FONT2),hi(TITLE1_FONT2),hi(TITLE1_FONT2),hi(TITLE1_FONT2),hi(TITLE1_FONT1),hi(TITLE1_FONT1),
	// 	hi(TITLE1_FONT1),hi(TITLE1_FONT1),hi(CHARSET_FONT),hi(CHARSET_FONT),hi(CHARSET_FONT),hi(CHARSET_FONT),hi(CHARSET_FONT),hi(CHARSET_FONT),
	// 	hi(CHARSET_FONT),hi(CHARSET_FONT),hi(CHARSET_FONT),hi(CHARSET_FONT),hi(CHARSET_FONT),hi(CHARSET_FONT)
	// );

	c0Table: array [0..29] of byte = (
		$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,
		$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,
		$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,
		$0E,$0E,$0E,$0E,$0E,$0E
	);

	c1Table: array [0..29] of byte = (
		$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,
		$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,
		$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,
		$0E,$0E,$0E,$0E,$0E,$0E
	);

	c2Table: array [0..29] of byte = (
		$00,$00,$00,$00,$00,$00,$00,$00,
		$00,$00,$00,$00,$00,$00,$00,$00,
		$00,$00,$00,$00,$00,$00,$00,$00,
		$00,$00,$00,$00,$00,$00
	);

	c3Table: array [0..29] of byte = (
		$00,$00,$00,$00,$00,$00,$00,$00,
		$00,$00,$00,$00,$00,$00,$00,$00,
		$00,$00,$00,$00,$00,$00,$00,$00,
		$00,$00,$00,$00,$00,$00
	);



{$i interrupts.inc}

procedure setBackgroundOffset(x:word);
var vram1,vram2:byte;
    line:byte;
    dlist:word;
begin
    vram1:= x shr 2;
    vram2:= vram1 or $80;
    dlist:=DISPLAY_LIST_ADDRESS + 7;
    line:=64;  // 64*2 = 128 scanlines
    repeat
        poke(dlist,vram1);
        poke(dlist+3,vram2);
        inc(dlist,6);
        dec(line);
    until line = 0;
    hscrol := (x and 3) xor 3;
end;

// procedure Guy_BackSet;
// // Set remembered back into background 
// begin
//     offset_x:=0;
//     offset_y:=guy_oldy shl 7;
//     for i:=0 to _GUY_HEIGHT - 1 do
//     begin
//         Inc(offset_x,128);
//         Move(Pointer(GUYBACK_MEM + (i shl 2)), Pointer(BACKGROUND_MEM + offset_x + offset_y + guy_oldx), 4);
//     end;
// end;

// Guy_Anim procedure no longer needed - using PMG hardware sprites instead
// procedure Guy_Anim(f : byte);
// var
//     draw_x: word;
//     old_draw_x: word;
//     scroll_offset: word;
//     old_scroll_offset: word;
// begin
//     // Calculate scroll offset in bytes (hpos is in pixels, divide by 4 to get bytes)
//     scroll_offset := hpos shr 2;
//     old_scroll_offset := guy_oldx shr 2;
//
//     offset_x:=0;
//     offset_y:=guy_y shl 7;
//
//     // Player appears at fixed screen position guy_x (e.g., 60 bytes from left edge of screen)
//     // Memory position = screen_position + scroll_offset
//     // As we scroll right (hpos increases), we need to draw further right in memory
//     draw_x := guy_x + scroll_offset;
//     old_draw_x := guy_x + old_scroll_offset;
//
//     for i:=0 to _GUY_HEIGHT - 1 do
//     begin
//         Inc(offset_x,128);
//
//         // Only restore background if position has changed
//         if (draw_x <> old_draw_x) then begin
//             // Restore background at OLD position
//             Move(Pointer(GUYBACK_MEM + (i shl 2)), Pointer(BACKGROUND_MEM + offset_x + offset_y + old_draw_x), 4);
//             // Save background at NEW position
//             Move(Pointer(BACKGROUND_MEM + offset_x + offset_y + draw_x), Pointer(GUYBACK_MEM + (i shl 2)), 4);
//         end;
//
//         // Draw the current animation frame at current position
//         if f = 1 then
//             Move(Pointer(GUY1_MEM + (i shl 2)), Pointer(BACKGROUND_MEM + offset_x + offset_y + draw_x), 4);
//         if f = 2 then
//             Move(Pointer(GUY2_MEM + (i shl 2)), Pointer(BACKGROUND_MEM + offset_x + offset_y + draw_x), 4);
//         if f = 3 then
//             Move(Pointer(GUY3_MEM + (i shl 2)), Pointer(BACKGROUND_MEM + offset_x + offset_y + draw_x), 4);
//         if f = 4 then
//             Move(Pointer(GUY4_MEM + (i shl 2)), Pointer(BACKGROUND_MEM + offset_x + offset_y + draw_x), 4);
//         if f = 5 then
//             Move(Pointer(GUY5_MEM + (i shl 2)), Pointer(BACKGROUND_MEM + offset_x + offset_y + draw_x), 4);
//         if f = 6 then
//             Move(Pointer(GUY6_MEM + (i shl 2)), Pointer(BACKGROUND_MEM + offset_x + offset_y + draw_x), 4);
//
//     end;
//
//     // Remember the scroll position for next time
//     guy_oldx := hpos;
// end;

procedure NextFrame;
begin
  // Clear player memory before drawing
  // SINGLE-LINE RESOLUTION: Player 0 at 1024, Player 1 at 1280 (256 bytes each)
  FillByte(Pointer(PMGBASE + 1024 + guy_py), _GUY_HEIGHT, 0);        // Clear Player 0 sprite area
  FillByte(Pointer(PMGBASE + 1280 + guy_py), _GUY_HEIGHT, 0);        // Clear Player 1 sprite area

  // Draw player based on guyframe (1-6)
  case guyframe of
    1: begin
        Move(guy_p0Frame1, Pointer(PMGBASE + 1024 + guy_py), _GUY_HEIGHT);
        Move(guy_p1Frame1, Pointer(PMGBASE + 1280 + guy_py), _GUY_HEIGHT);
       end;
    2: begin
        Move(guy_p0Frame2, Pointer(PMGBASE + 1024 + guy_py), _GUY_HEIGHT);
        Move(guy_p1Frame2, Pointer(PMGBASE + 1280 + guy_py), _GUY_HEIGHT);
       end;
    3: begin
        Move(guy_p0Frame3, Pointer(PMGBASE + 1024 + guy_py), _GUY_HEIGHT);
        Move(guy_p1Frame3, Pointer(PMGBASE + 1280 + guy_py), _GUY_HEIGHT);
       end;
    4: begin
        Move(guy_p0Frame4, Pointer(PMGBASE + 1024 + guy_py), _GUY_HEIGHT);
        Move(guy_p1Frame4, Pointer(PMGBASE + 1280 + guy_py), _GUY_HEIGHT);
       end;
    5: begin
        Move(guy_p0Frame5, Pointer(PMGBASE + 1024 + guy_py), _GUY_HEIGHT);
        Move(guy_p1Frame5, Pointer(PMGBASE + 1280 + guy_py), _GUY_HEIGHT);
       end;
    6: begin
        Move(guy_p0Frame6, Pointer(PMGBASE + 1024 + guy_py), _GUY_HEIGHT);
        Move(guy_p1Frame6, Pointer(PMGBASE + 1280 + guy_py), _GUY_HEIGHT);
       end;
  end;

  // Draw enemies based on frame (1-4)
  // NOTE: Bat and reel DISABLED - they share Players 0&1 with guy and cause overlap
  // Only drawing player sprite for now
  {
  if frame = 1 then begin
    // bat - uses Players 0 and 1 (same as guy)
    Move(bat_p0Frame1, Pointer(PMGBASE + 512 + 0 + bat_py0 + bat_pos[i]), _HEIGHT);
    Move(bat_p1Frame1, Pointer(PMGBASE + 512 + 128 + bat_py1 + bat_pos[i]), _HEIGHT);

    // small reel - uses Players 0 and 1 (same as guy)
    Move(sreel_p0Frame1, Pointer(PMGBASE + 512 + 0 + sreel_py0 - sreel_pos[i]), _HEIGHT);
    Move(sreel_p1Frame1, Pointer(PMGBASE + 512 + 128 + sreel_py1 - sreel_pos[i]), _HEIGHT);
  end
  else if frame = 2 then begin
    // bat
    Move(bat_p0Frame2, Pointer(PMGBASE + 512 + 0 + bat_py0 + bat_pos[i]), _HEIGHT);
    Move(bat_p1Frame2, Pointer(PMGBASE + 512 + 128 + bat_py1 + bat_pos[i]), _HEIGHT);

    //small reel
    Move(sreel_p0Frame2, Pointer(PMGBASE + 512 + 0 + sreel_py0 - sreel_pos[i]), _HEIGHT);
    Move(sreel_p1Frame2, Pointer(PMGBASE + 512 + 128 + sreel_py1 - sreel_pos[i]), _HEIGHT);
  end
  else if frame = 3 then begin
    Move(bat_p0Frame3, Pointer(PMGBASE + 512 + 0 + bat_py0 + bat_pos[i]), _HEIGHT);
    Move(bat_p1Frame3, Pointer(PMGBASE + 512 + 128 + bat_py1 + bat_pos[i]), _HEIGHT);

    Move(sreel_p0Frame3, Pointer(PMGBASE + 512 + 0 + sreel_py0 - sreel_pos[i]), _HEIGHT);
    Move(sreel_p1Frame3, Pointer(PMGBASE + 512 + 128 + sreel_py1 - sreel_pos[i]), _HEIGHT);
  end
  else if frame = 4 then begin
    Move(bat_p0Frame4, Pointer(PMGBASE + 512 + 0 + bat_py0 + bat_pos[i]), _HEIGHT);
    Move(bat_p1Frame4, Pointer(PMGBASE + 512 + 128 + bat_py1 + bat_pos[i]), _HEIGHT);

    Move(sreel_p0Frame4, Pointer(PMGBASE + 512 + 0 + sreel_py0 - sreel_pos[i]), _HEIGHT);
    Move(sreel_p1Frame4, Pointer(PMGBASE + 512 + 128 + sreel_py1 - sreel_pos[i]), _HEIGHT);
  end;
  }

end;

procedure Update_Jump;
begin
    // Only update if jumping
    if guy_jump_velocity <> 0 then begin
        // Apply gravity
        guy_jump_velocity := guy_jump_velocity - 1;

        // Update height
        guy_jump_height := guy_jump_height + guy_jump_velocity;

        // Check if landed
        if guy_jump_height <= 0 then begin
            guy_jump_height := 0;
            guy_jump_velocity := 0;
        end;
    end;

    // Always update Y position based on jump height
    guy_py := guy_base_py - guy_jump_height;
end;

procedure Joystick_Move;
var
    joy_dir : byte;
begin
    // mask to read only 4 youngest bits
    joy_dir := joy_1 and 15;

    case joy_dir of
        joy_left:   begin
                        // Move player sprite left
                        if (guy_px0 > 48) then begin
                            Dec(guy_px0, 2);
                            Dec(guy_px1, 2);
                        end;
                        // Scroll background left
                        if (hpos > 0) then begin
                            dec(hpos);
                        end;
                        // Animate left (frames 4, 5, 6)
                        if (guyframe < 4) or (guyframe > 6) then guyframe := 4;
                        Inc(guyframe);
                        if guyframe > 6 then guyframe:=4;
                    end;
        joy_right:  begin
                        // Move player sprite right
                        if (guy_px0 < 200) then begin
                            Inc(guy_px0, 2);
                            Inc(guy_px1, 2);
                        end;
                        // Scroll background right
                        if (hpos < 339) then begin
                            inc(hpos);
                        end;
                        // Animate right (frames 1, 2, 3)
                        if (guyframe < 1) or (guyframe > 3) then guyframe := 1;
                        Inc(guyframe);
                        if guyframe > 3 then guyframe:=1;
                    end;
    end;

    // Check for jump (joystick up)
    if (joy_dir = joy_up) or ((joy_dir = joy_left_up) or (joy_dir = joy_right_up)) then begin
        // Start jump if on ground
        if guy_jump_height = 0 then begin
            guy_jump_velocity := 8;  // Initial jump velocity (higher = higher jump)
            guy_jump_height := 1;    // Start jumping
        end;
    end;

    // Update jump physics
    Update_Jump;

end;



procedure startgame;
begin
    EnableVBLI(@vbl);
    EnableDLI(@dli1);

    DLISTL := DISPLAY_LIST_ADDRESS;

    colbk:=$c;
    colpf1:=$0;
    colpf2:=$c;
    colpf3:=$c;

    // Initialize player animation frame
    guyframe:=1;
    waitframe;

    i:=1;
    repeat
        Joystick_Move;

        setBackgroundOffset(hpos);
        
        Nextframe;

        // Set PMG horizontal positions
        hposp[0]:=guy_px0;  // Player sprite 0
        hposp[1]:=guy_px1;  // Player sprite 1
        hposp[2]:=bat_px0;  // Enemy bat sprite 0 (disabled)
        hposp[3]:=bat_px1;  // Enemy bat sprite 1 (disabled)

        // Player does NOT move automatically - only moves with joystick in Joystick_Move
        // Enemies are disabled for now
        // Inc(bat_px0); Inc(bat_px1);
        // Dec(sreel_px0); Dec(sreel_px1);

        if (vsc and 7) = 0 then Inc(frame);
        // if (vsc and 2) = 0 then Guy_Anim;
        if frame > 4 then frame := 1;
        Inc(i);
        if i = _SIZE then i:=1;
    
        if (strig0 = 0) then gamestatus:= 2;
        waitframe;

    until gamestatus <> 1;
end;

procedure title;
begin
    SetCharset (Hi(CHARSET_FONT)); // when system is off
    CRT_Init(TITLEBACK_MEM);

    Move(Pointer(TITLE1_SCREEN), Pointer(TITLEBACK_MEM),$280);
    for i:=0 to 9 do
        fntTable[i]:=hi(TITLE1_FONT1);
    // end;
    for i:=10 to 13 do
        fntTable[i]:=hi(TITLE1_FONT2);
    // end;
    for i:=14 to 17 do
        fntTable[i]:=hi(TITLE1_FONT1);
    // end;
    for i:=18 to 29 do
        fntTable[i]:=hi(CHARSET_FONT);
    // end;

    // DLISTL := TITLE_LIST_ADDRESS;
    DLISTL:=Word(@dlist_title);

    EnableVBLI(@vbl_title);
    EnableDLI(@dli_title);
    // nmien := $c0;	



    repeat

       waitframe; 
    until (strig0 = 0);
    gamestatus:= 1;
end;

procedure endgame;
begin
    
    
    Move(Pointer(TITLE2_SCREEN), Pointer(TITLEBACK_MEM),$280);
    for i:=0 to 17 do
        fntTable[i]:=hi(TITLE2_FONT1);
    // end;
    for i:=18 to 29 do
        fntTable[i]:=hi(CHARSET_FONT);
    // end;

    // DLISTL := TITLE_LIST_ADDRESS;
    DLISTL:=Word(@dlist_title);

    EnableVBLI(@vbl_title);
    EnableDLI(@dli_title);
    // nmien := $c0;	

    repeat
    
       waitframe; 
    until (strig0 = 0);
    gamestatus:= 0;
end;


begin
    SystemOff;

    msx.player := pointer(RMT_PLAYER_ADDRESS);
    msx.modul := pointer(RMT_MODULE_ADDRESS);
    msx.Init(0);

    WaitFrame;



    gractl:=3; // Turn on P/M graphics
    pmbase:=Hi(PMGBASE);

    // P/M graphics SINGLE LINE resolution (for full 60-byte sprite)
    // Each byte of sprite data = 1 scanline
    // 60-byte sprite = 60 scanlines (perfect size!)
    dmactl := 62;  // Enable DMA + single-line resolution

    // Clear player memory (missiles + all 4 players)
    // SINGLE-LINE RESOLUTION: 768 = missiles, 1024-2047 = 4 players (256 bytes each)
    FillByte(Pointer(PMGBASE + 768), 1280, 0);


    // Priority register
    // - Players and missiles in front of playfield
    // - Enable third color for players (like player.pas test file)

    gtiactl := 33;  // $21 = enable players + third color

    // Make player smaller (normal width = 0, double width = 1, quad width = 3)
    sizep[0] := 0;  // Player 0 - normal size (8 pixels wide)
    sizep[1] := 0;  // Player 1 - normal size (8 pixels wide)
    sizep[2] := 0;  // Player 2 (unused) normal size
    sizep[3] := 0;  // Player 3 (unused) normal size

    // Player/missile colors
    // NOTE: Players 0 and 1 are for the guy sprite
    pcolr[0] := $00;  // Player 0 - black
    pcolr[1] := $00;  // Player 1 - black
    pcolr[2] := $00;  // Player 2 - unused
    pcolr[3] := $00;  // Player 3 - unused

    // Player horizontal positions
    hposp[0] := guy_px0;
    hposp[1] := guy_px1;
    hposp[2] := bat_px0;
    hposp[3] := bat_px1;
    
    music:=true;

    repeat
        case gamestatus of
            0: title;
            1: startgame;
            2: endgame;
        end;
    until false;
    
    music:= false;
    msx.stop;
    // waitframe;
    // DisableDLI;
    // DisableVBLI;
    nmien:=0;
    Dmactl:= 0;
    
end.
