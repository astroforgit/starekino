# PMG Sprite Editor

A web-based sprite editor for editing Player/Missile Graphics (PMG) sprites for the Atari 8-bit game "W Starym Kinie" (In the Old Cinema).

## Features

- Visual editing of 8-pixel wide PMG sprites
- Support for all player and enemy sprites in the game
- Real-time preview with customizable colors
- Export to Mad-Pascal format
- Editing tools: clear, invert, shift (up/down/left/right)
- Click to toggle individual pixels

## Installation

```bash
cd sprite-editor
npm install
```

## Usage

### Development Server

```bash
npm run dev
```

This will start a development server at http://localhost:3000 and automatically open it in your browser.

### Build for Production

```bash
npm run build
```

This will create a production build in the `dist` directory.

### Preview Production Build

```bash
npm run preview
```

## How to Use

1. **Select a sprite** from the left sidebar (Player or Enemy sprites)
2. **Click on the canvas** to toggle individual pixels on/off
3. **Use editing tools** to modify the sprite:
   - Clear: Erase all pixels
   - Invert: Flip all pixels
   - Shift Left/Right: Rotate pixels horizontally
   - Shift Up/Down: Rotate pixels vertically
4. **Change preview color** using the color picker
5. **Export sprites**:
   - "Export Current" - Download the current sprite as a .pas file
   - "Export All" - Download all sprites in Mad-Pascal format

## Sprite Data

The editor includes all sprites from the game:

### Player Sprites (60 pixels tall)
- guy_p0Frame1-6 (Player 0, frames 1-6)
- guy_p1Frame1-6 (Player 1, frames 1-6)
- Frames 1-3: Right-facing animation
- Frames 4-6: Left-facing animation

### Enemy Sprites (18 pixels tall)
- bat_p0Frame1-4 (Bat Player 0, frames 1-4)
- bat_p1Frame1-4 (Bat Player 1, frames 1-4)
- sreel_p0Frame1-4 (Small Reel Player 0, frames 1-4)
- sreel_p1Frame1-4 (Small Reel Player 1, frames 1-4)

## Export Format

Exported sprites are in Mad-Pascal array format:

```pascal
sprite_name : array[0..HEIGHT - 1] of byte = (
    $3C, $7E, $7E, $7E, $7E, $7F, $FF, $FF,
    ...
);
```

This format can be directly copied into your `app/wsk.pas` file.

## Technical Details

- Each sprite is 8 pixels wide (1 byte per scanline)
- Player sprites are 60 pixels tall
- Enemy sprites are 18 pixels tall
- Sprites are stored as byte arrays where each bit represents a pixel
- Bit 7 (leftmost) = pixel 0, Bit 0 (rightmost) = pixel 7

## License

Part of the "W Starym Kinie" Atari 8-bit game project.

