uses
  SysUtils, FastGraph, Crt;

const
  _HEIGHT = 60;
  _SIZE = 84;

var
  // Colors for players (white color for visibility)
  p0Color : array[0..1] of byte = (14, 14);
  p1Color : array[0..1] of byte = (14, 14);

// Player 0 data - Right-facing frames
guy_p0Frame1 : array[0.._HEIGHT - 1] of byte = (
    $3C, $7E, $7E, $7E, $7E, $7F, $FF, $FF,
    $7F, $7F, $FE, $FE, $FF, $FF, $FF, $FF,
    $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FB,
    $FB, $FB, $FB, $FB, $F9, $F9, $F9, $F9,
    $F1, $F0, $FE, $FF);

guy_p0Frame2 : array[0.._HEIGHT - 1] of byte = (
    $3C, $7E, $7E, $7E, $7E, $7F, $FF, $FF,
    $7F, $7F, $FE, $FE, $FF, $FF, $FF, $FF,
    $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FB,
    $FB, $F9, $F9, $F9, $F8, $F8, $F8, $F8,
    $F0, $F0, $FE, $FF);

guy_p0Frame3 : array[0.._HEIGHT - 1] of byte = (
    $3C, $7E, $7E, $7E, $7E, $7F, $FF, $FF,
    $7F, $7F, $FE, $FE, $FF, $FF, $FF, $FF,
    $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $FF, $FF, $FD, $FD, $FC, $FC, $FC, $F8,
    $F8, $F8, $F8, $F8, $F8, $F8, $F8, $F8,
    $F0, $F0, $FE, $FF);

// Player 1 data - Right-facing frames
guy_p1Frame1 : array[0.._HEIGHT - 1] of byte = (
    $00, $00, $00, $00, $00, $80, $00, $00,
    $00, $00, $00, $00, $00, $80, $C0, $E0,
    $E0, $F0, $F8, $F8, $FC, $FC, $FC, $FC,
    $FC, $FD, $76, $10, $90, $90, $98, $D9,
    $D9, $C9, $EA, $EA, $EA, $EA, $EA, $F4,
    $FC, $F8, $F0, $F0, $F0, $F0, $F0, $F0,
    $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0,
    $F0, $FE, $FF, $00);

guy_p1Frame2 : array[0.._HEIGHT - 1] of byte = (
    $00, $00, $00, $00, $00, $80, $00, $00,
    $00, $00, $00, $00, $00, $80, $80, $C0,
    $E0, $F0, $F8, $F8, $F8, $FC, $FC, $FC,
    $FC, $FD, $76, $10, $90, $90, $98, $D9,
    $D9, $C9, $EA, $EA, $EA, $EA, $E8, $FC,
    $FC, $F8, $F0, $F0, $F0, $F0, $F0, $F0,
    $F8, $F8, $F8, $F8, $FC, $FC, $FC, $FC,
    $7F, $7F, $78, $00);

guy_p1Frame3 : array[0.._HEIGHT - 1] of byte = (
    $00, $00, $00, $00, $00, $80, $00, $00,
    $00, $00, $00, $00, $00, $80, $80, $C0,
    $E0, $F0, $F8, $F8, $F8, $FC, $FC, $FC,
    $FC, $FD, $56, $10, $90, $90, $98, $D9,
    $D9, $C9, $EA, $EA, $EA, $EA, $FE, $F4,
    $FC, $FC, $FC, $FC, $FC, $FE, $FE, $FE,
    $3F, $3F, $3F, $1F, $1F, $1F, $1F, $07,
    $07, $00, $00, $00);

guy_pos: array[0.._SIZE - 1] of byte =
    (0,2,6,10,14,16,18,18,18,16,14,10,6,2,0,2,6,10,14,16,18,16,18,16,14,10,6,2,0,2,6,10,14,16,18,16,18,16,14,10,6,2,0,2,6,10,14,16,18,16,18,16,14,10,6,2,0,2,6,10,14,16,18,16,18,16,14,10,6,2,0,2,6,10,14,16,18,16,18,16,14,10,6,2);


  PMGMEM : word;
  guy_px0, guy_py0 : byte;
  guy_px1, guy_py1 : byte;
  frame : byte;
  i : byte;

procedure NextFrame;
begin
  // Clear player memory first to avoid artifacts
  FillByte(pointer(PMGMEM + 512), 256, 0);        // Clear Player 0
  FillByte(pointer(PMGMEM + 512 + 128), 256, 0);  // Clear Player 1

  if frame = 1 then begin
    Move(guy_p0Frame1, Pointer(PMGMEM + 512 + guy_py0 + guy_pos[i]), _HEIGHT);
    Move(guy_p1Frame1, Pointer(PMGMEM + 512 + 128 + guy_py1 + guy_pos[i]), _HEIGHT);
  end
  else if frame = 2 then begin
    Move(guy_p0Frame2, Pointer(PMGMEM + 512 + guy_py0 + guy_pos[i]), _HEIGHT);
    Move(guy_p1Frame2, Pointer(PMGMEM + 512 + 128 + guy_py1 + guy_pos[i]), _HEIGHT);
  end
  else if frame = 3 then begin
    Move(guy_p0Frame3, Pointer(PMGMEM + 512 + guy_py0 + guy_pos[i]), _HEIGHT);
    Move(guy_p1Frame3, Pointer(PMGMEM + 512 + 128 + guy_py1 + guy_pos[i]), _HEIGHT);
  end;
end;

begin
  // Player position
  guy_px0 := 80; guy_py0 := 40;
  guy_px1 := 88; guy_py1 := 40;

  // Set environment
  InitGraph(0);
  Poke(710, 0); Poke(712, 0);

  // Set P/M graphics
  Poke(53277, 0);
  PMGMEM := Peek(106) - 8;
  Poke(54279, PMGMEM);
  PMGMEM := PMGMEM * 256;

  // P/M graphics double resolution
  Poke(559, 46);

  // Clear player memory (need more space for 60-pixel sprites)
  FillByte(pointer(PMGMEM + 384), 768, 0);

  // Enable third color
  Poke(623, 33);

  // Player normal size
  Poke(53256, 0); Poke(53257, 0);

  // Turn on P/M graphics
  Poke(53277, 3);

  frame := 1;

  Writeln('Player animation');
  Poke(53248, guy_px0); Poke(53249, guy_px1);

  i:= 1;
  repeat 

    NextFrame;
    Poke(704, p0Color[0]);
    Poke(705, p1Color[0]);
    Pause(5);

    Inc(guy_px0,2); Inc(guy_px1,2);
    Poke(53248, guy_px0); Poke(53249, guy_px1);
    Inc(frame);
    if frame > 3 then frame := 1;
    Inc(i);
    if i = _SIZE then i:=1;
  until false;
  

  repeat until keypressed;
end.

