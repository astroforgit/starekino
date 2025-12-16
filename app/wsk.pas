// ============================================================================
// FILE: wsk.pas
// ============================================================================
program wsk;
{$librarypath '../../blibs/'}
{$librarypath '../../MADS/blibs/'}
uses atari, rmt, b_system, b_crt;

const
{$i const.inc}
{$r resources.rc}

// Title screen display list
dlist_title: array [0..34] of byte = (
        $70,$70,$70,$70,$70,$70,$70,$C2,lo(TITLEBACK_MEM),hi(TITLEBACK_MEM),
        $82,$82,$82,$82,$82,$82,$82,$82,
        $82,$82,$82,$82,$82,$82,$82,$00,
        $00,$00,$00,$00,$00,$00,
        $41,lo(word(@dlist_title)),hi(word(@dlist_title))
    );

var
    // ========================================================================
    // 1. HARDWARE REGISTERS (Absolute Variables)
    // ========================================================================
    pcolr : array[0..3] of byte absolute $D012;
    hposp : array[0..3] of byte absolute $D000;
    hposm : array[0..3] of byte absolute $D004;
    sizep : array[0..3] of byte absolute $D008;
    vsc : byte absolute $14;
    joy_1 : byte absolute $D300;
    strig0 : byte absolute $D010;

    // ========================================================================
    // 2. UNINITIALIZED VARIABLES
    // ========================================================================
    music : boolean;
    msx : TRMT;
    frame, guyframe : byte;
    i : byte;

    // Physics
    sy : smallint;
    cy : byte;
    fly : boolean;
    jump : boolean;
    jumpforce : byte;

    // Walls
    wall_x : array[0..3] of byte;
    wall_h : array[0..3] of byte;
    wall_wait : array[0..3] of byte;

    // Tables
    fntTable: array [0..29] of byte;

    // ========================================================================
    // 3. INITIALIZED VARIABLES (Must come LAST)
    // ========================================================================
    hpos : word = 0;
    gamestatus : Byte = 2;

    guy_px0 : byte = 80;
    guy_px1 : byte = 88;
    guy_py : byte = 160;
    guy_base_py : byte = 160;

    last_wall : byte = 0;
    difficulty : byte = 0;

    energy : byte = 80;
    score : word = 0;
    gameover_flag : boolean = false;
    damagecount : byte = 0;

    bonus_x : byte = 0;
    bonus_wait : byte = 10;
    bonus_wall : byte = 0;
    bonus_anim_idx : byte = 0;

    // Color Tables
    c0Table: array [0..29] of byte = ($0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E);
    c1Table: array [0..29] of byte = ($0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E);
    c2Table: array [0..29] of byte = ($00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00);
    c3Table: array [0..29] of byte = ($00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00);

    // Included files
    {$i sprites_guy.inc}
    {$i sprites_bonus.inc}

{$i interrupts.inc}

procedure setBackgroundOffset(x:word);
var vram1,vram2:byte;
    line:byte;
    dlist:word;
begin
    vram1:= x shr 2;
    vram2:= vram1 or $80;
    dlist:=DISPLAY_LIST_ADDRESS + 7;
    line:=64;
    repeat
        poke(dlist,vram1);
        poke(dlist+3,vram2);
        inc(dlist,6);
        dec(line);
    until line = 0;
    hscrol := (x and 3) xor 3;
end;

procedure NextFrame;
begin
  FillByte(Pointer(PMGBASE + 1024 + guy_base_py - 80), 80 + _GUY_HEIGHT, 0);
  FillByte(Pointer(PMGBASE + 1280 + guy_base_py - 80), 80 + _GUY_HEIGHT, 0);
  case guyframe of
    1: begin Move(guy_p0Frame1, Pointer(PMGBASE + 1024 + guy_py), _GUY_HEIGHT); Move(guy_p1Frame1, Pointer(PMGBASE + 1280 + guy_py), _GUY_HEIGHT); end;
    2: begin Move(guy_p0Frame2, Pointer(PMGBASE + 1024 + guy_py), _GUY_HEIGHT); Move(guy_p1Frame2, Pointer(PMGBASE + 1280 + guy_py), _GUY_HEIGHT); end;
    3: begin Move(guy_p0Frame3, Pointer(PMGBASE + 1024 + guy_py), _GUY_HEIGHT); Move(guy_p1Frame3, Pointer(PMGBASE + 1280 + guy_py), _GUY_HEIGHT); end;
    4: begin Move(guy_p0Frame4, Pointer(PMGBASE + 1024 + guy_py), _GUY_HEIGHT); Move(guy_p1Frame4, Pointer(PMGBASE + 1280 + guy_py), _GUY_HEIGHT); end;
    5: begin Move(guy_p0Frame5, Pointer(PMGBASE + 1024 + guy_py), _GUY_HEIGHT); Move(guy_p1Frame5, Pointer(PMGBASE + 1280 + guy_py), _GUY_HEIGHT); end;
    6: begin Move(guy_p0Frame6, Pointer(PMGBASE + 1024 + guy_py), _GUY_HEIGHT); Move(guy_p1Frame6, Pointer(PMGBASE + 1280 + guy_py), _GUY_HEIGHT); end;
  end;
end;

procedure Update_Jump;
begin
    if sy > 0 then begin
        cy := cy + sy;
        guy_py := guy_py + (cy shr 5);
        if (guy_py >= guy_base_py) then begin
            sy := 0; cy := 0; fly := false; guy_py := guy_base_py;
        end;
    end;
    if sy < 0 then begin
        cy := cy - sy;
        guy_py := guy_py - (cy shr 5);
    end;
    cy := cy and %11111;
    inc(sy);
end;

procedure ShowEnergy;
begin
    FillByte(Pointer(TEXT_SCREEN), energy shr 1, $4E);
    if (energy shr 1) < 40 then FillByte(Pointer(TEXT_SCREEN + (energy shr 1)), 40 - (energy shr 1), 0);
end;

procedure ShowScore;
begin
    poke(BACKGROUND_MEM + 2, (score div 10000) mod 10 + 16);
    poke(BACKGROUND_MEM + 3, (score div 1000) mod 10 + 16);
    poke(BACKGROUND_MEM + 4, (score div 100) mod 10 + 16);
    poke(BACKGROUND_MEM + 5, (score div 10) mod 10 + 16);
    poke(BACKGROUND_MEM + 6, score mod 10 + 16);
end;

procedure CheckCollision;
var
    p0pf_col, p1pf_col : byte;
    p0pl_col, p1pl_col : byte;
    m0pl, m1pl, m2pl, m3pl : byte;
    wall_collision, bonus_collision : byte;
begin
    if damagecount > 0 then dec(damagecount);

    // 1. DETECT WALLS (Missiles)
    p0pf_col := peek($D004);
    p1pf_col := peek($D005);

    m0pl := peek($D000);
    m1pl := peek($D001);
    m2pl := peek($D002);
    m3pl := peek($D003);

    wall_collision := 0;
    // Check PF3 hits (5th player mode) - Bit 3
    if ((p0pf_col or p1pf_col) and 8) <> 0 then wall_collision := 1;
    // Check raw Missile hits (MxPL) - Bits 0-1
    if ((m0pl or m1pl or m2pl or m3pl) and 3) <> 0 then wall_collision := 1;

    // 2. DETECT BONUS (Players 2 & 3)
    p0pl_col := peek($D00C);
    p1pl_col := peek($D00D);
    bonus_collision := (p0pl_col or p1pl_col) and %1100;

    if (bonus_collision <> 0) and (bonus_wait < 4) then begin
        bonus_wait := 10; bonus_x := 0;
        energy := energy + 10;
        if energy > 80 then energy := 80;
        ShowEnergy;
    end;

    if (wall_collision <> 0) and (energy > 0) and (damagecount = 0) and not gameover_flag then begin
        Dec(energy);
        damagecount := 10;
        ShowEnergy;
        if energy = 0 then gameover_flag := true;
    end;
    poke($D01E, $FF); // HITCLR
end;

procedure SetWallHeight(wall_num, height: byte);
var y_pos, mask, wall_bottom: byte; vram_addr: word;
begin
    mask := %11 shl (wall_num * 2);
    wall_bottom := guy_base_py + _GUY_HEIGHT;
    for y_pos := 0 to 72 do begin
        vram_addr := PMGBASE + 768 + wall_bottom - y_pos;
        if y_pos < height then poke(vram_addr, peek(vram_addr) or mask)
        else poke(vram_addr, peek(vram_addr) and not mask);
    end;
end;

procedure UpdateBonus;
var
    frame: byte;
    bonus_y: byte;
    current_bonus_y: byte;
begin
    bonus_y := 108;
    current_bonus_y := bonus_y - reel_pos[bonus_anim_idx];

    // Clear a larger area because the sprite is now taller (60 lines)
    FillByte(Pointer(PMGBASE + 1536 + bonus_y - 20), 80, 0);
    FillByte(Pointer(PMGBASE + 1792 + bonus_y - 20), 80, 0);

    if bonus_wait < 4 then begin
        frame := (peek(20) shr 2) and 3;
        case frame of
            0: begin Move(reel_p0Frame1, Pointer(PMGBASE + 1536 + current_bonus_y), _BONUS_HEIGHT); Move(reel_p1Frame1, Pointer(PMGBASE + 1792 + current_bonus_y), _BONUS_HEIGHT); end;
            1: begin Move(reel_p0Frame2, Pointer(PMGBASE + 1536 + current_bonus_y), _BONUS_HEIGHT); Move(reel_p1Frame2, Pointer(PMGBASE + 1792 + current_bonus_y), _BONUS_HEIGHT); end;
            2: begin Move(reel_p0Frame3, Pointer(PMGBASE + 1536 + current_bonus_y), _BONUS_HEIGHT); Move(reel_p1Frame3, Pointer(PMGBASE + 1792 + current_bonus_y), _BONUS_HEIGHT); end;
            3: begin Move(reel_p0Frame4, Pointer(PMGBASE + 1536 + current_bonus_y), _BONUS_HEIGHT); Move(reel_p1Frame4, Pointer(PMGBASE + 1792 + current_bonus_y), _BONUS_HEIGHT); end;
        end;
        bonus_x := wall_x[bonus_wait];
        hposp[2] := bonus_x; hposp[3] := bonus_x;
        Inc(bonus_anim_idx);
        if bonus_anim_idx > 79 then bonus_anim_idx := 0;
    end else begin
        hposp[2] := 0; hposp[3] := 0;
        bonus_anim_idx := 0;
    end;
end;

procedure MoveWalls;
var wall_num: byte; rnd_val: byte absolute $D20A;
begin
    for wall_num := 0 to 3 do
        if wall_wait[wall_num] = 0 then begin
            dec(wall_x[wall_num], 2);
            if (wall_x[wall_num] < 2) and not gameover_flag then begin
                wall_x[wall_num] := 255;
                wall_wait[wall_num] := last_wall + 9 + (rnd_val mod (12 + difficulty));
                last_wall := wall_wait[wall_num];
                wall_h[wall_num] := ((rnd_val mod 3) + 1) * 24;
                SetWallHeight(wall_num, wall_h[wall_num]);
                if (bonus_wait >= 10) and ((rnd_val mod 5) = 0) then bonus_wait := wall_num;
            end;
        end else dec(wall_wait[wall_num]);
    hposm[0] := wall_x[0]; hposm[1] := wall_x[1]; hposm[2] := wall_x[2]; hposm[3] := wall_x[3];
    if last_wall > 0 then dec(last_wall);
end;

procedure Joystick_Move;
var joy_dir : byte;
begin
    joy_dir := joy_1 and 15;
    if not fly then begin
        if (joy_dir = joy_up) then begin
            if not jump then begin jump := true; jumpforce := 10; end;
            if jump and (jumpforce < 70) then inc(jumpforce, 3);
        end;
        if jump and (joy_dir <> joy_up) then begin jump := false; fly := true; sy := -jumpforce; end;
    end;
    if not fly then begin
        if (vsc and 3) = 0 then begin Inc(guyframe); if (guyframe > 3) or (guyframe < 1) then guyframe := 1; end;
    end else guyframe := 1;
end;

procedure startgame;
begin
    EnableVBLI(@vbl);
    EnableDLI(@dli1);

    DLISTL := DISPLAY_LIST_ADDRESS;

    // Write colors
    poke($D01A, $0c);
    poke($D017, $00);
    poke($D018, $0c);

    // Set 5th Player Mode (Missiles = PF3)
    gprior := $31;
    poke($D01B, $31); // Direct hardware write to GTIACTL

    // Set Player/Missile Colors to BLACK
    poke($D012, $00); // P0
    poke($D013, $00); // P1
    poke($D014, $00); // P2 (Bonus)
    poke($D015, $00); // P3 (Bonus)
    poke($D019, $00); // COLPF3 (Walls)

    // Set Sprite Widths
    sizep[0] := 0; // P0 Normal
    sizep[1] := 0; // P1 Normal
    sizep[2] := 1; // P2 Double Width (Rolka)
    sizep[3] := 1; // P3 Double Width (Rolka)

    gractl:=3;
    pmbase:=Hi(PMGBASE);
    dmactl := 62;

    FillByte(Pointer(PMGBASE + 768), 1280, 0);

    guyframe:=1;

    // Initialize uninitialized vars
    sy := 0; cy := 0; fly := false; jump := false; jumpforce := 0;
    i := 1;

    wall_x[0] := 200; wall_x[1] := 255; wall_x[2] := 255; wall_x[3] := 255;
    wall_wait[0] := 0; wall_wait[1] := 30; wall_wait[2] := 60; wall_wait[3] := 90;
    wall_h[0] := 48; wall_h[1] := 24; wall_h[2] := 72; wall_h[3] := 48;
    SetWallHeight(0, wall_h[0]);
    last_wall := 0;

    FillByte(Pointer(TEXT_SCREEN), 40, 0);
    energy := 80; score := 0; gameover_flag := false; difficulty := 0; damagecount := 0;
    bonus_x := 0; bonus_wait := 10; bonus_wall := 0; bonus_anim_idx := 0;

    hposp[0] := guy_px0; hposp[1] := guy_px1;
    hposm[0] := 255; hposm[1] := 255; hposm[2] := 255; hposm[3] := 255;
    sizem := $ff;

    ShowEnergy;
    ShowScore;

    waitframe;
    repeat
        Joystick_Move;
        Update_Jump;
        MoveWalls;
        UpdateBonus;
        CheckCollision;

        if fly and not gameover_flag then begin
            Inc(score);
            if (score and 15) = 0 then begin
                ShowScore;
                difficulty := (score shr 8) shr 4;
                if difficulty > 10 then difficulty := 10;
            end;
        end;

        setBackgroundOffset(hpos);
        Nextframe;

        hposp[0]:=guy_px0; hposp[1]:=guy_px1;

        if (hpos < 339) then inc(hpos) else hpos := 0;
        if (vsc and 7) = 0 then Inc(frame);
        if frame > 4 then frame := 1;
        Inc(i); if i = _SIZE then i:=1;
        if gameover_flag then gamestatus := 2;
        waitframe;
    until gamestatus <> 1;
end;

procedure title;
var i: byte;
begin
    SetCharset (Hi(CHARSET_FONT));
    CRT_Init(TITLEBACK_MEM);
    Move(Pointer(TITLE1_SCREEN), Pointer(TITLEBACK_MEM),$280);
    for i:=0 to 9 do fntTable[i]:=hi(TITLE1_FONT1);
    for i:=10 to 13 do fntTable[i]:=hi(TITLE1_FONT2);
    for i:=14 to 17 do fntTable[i]:=hi(TITLE1_FONT1);
    for i:=18 to 29 do fntTable[i]:=hi(CHARSET_FONT);
    DLISTL:=Word(@dlist_title);
    EnableVBLI(@vbl_title);
    EnableDLI(@dli_title);
    repeat waitframe; until (strig0 = 0);
    gamestatus:= 1;
end;

procedure endgame;
var i: byte;
begin
    Move(Pointer(TITLE2_SCREEN), Pointer(TITLEBACK_MEM),$280);
    for i:=0 to 17 do fntTable[i]:=hi(TITLE2_FONT1);
    for i:=18 to 29 do fntTable[i]:=hi(CHARSET_FONT);
    DLISTL:=Word(@dlist_title);
    EnableVBLI(@vbl_title);
    EnableDLI(@dli_title);
    repeat waitframe; until (strig0 = 0);
    gamestatus:= 0;
end;

begin
    SystemOff;
    msx.player := pointer(RMT_PLAYER_ADDRESS);
    msx.modul := pointer(RMT_MODULE_ADDRESS);
    msx.Init(0);
    WaitFrame;
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
    nmien:=0;
    Dmactl:= 0;
end.