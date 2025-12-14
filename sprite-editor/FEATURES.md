# PMG Sprite Editor - Features

## Animation Preview System

The sprite editor now includes an **Animation Preview** feature that shows how sprites animate in the game!

### How It Works

1. **Select any sprite** from the sidebar (Player, Bicycle, or Enemy sprites)
2. The **Animation Preview** canvas on the right will automatically show:
   - Combined view of both sprites (Player 0 and Player 1) side-by-side
   - Animated playback of all frames in the animation group
   - Frame counter showing current frame and total frames

### Animation Groups

The editor automatically detects and groups related sprites:

#### **Player Right** (3 frames)
- guy_p0Frame1, guy_p0Frame2, guy_p0Frame3
- guy_p1Frame1, guy_p1Frame2, guy_p1Frame3
- Shows player running to the right

#### **Player Left** (3 frames)
- guy_p0Frame4, guy_p0Frame5, guy_p0Frame6
- guy_p1Frame4, guy_p1Frame5, guy_p1Frame6
- Shows player running to the left

#### **Bat** (4 frames)
- bat_p0Frame1-4 and bat_p1Frame1-4
- Shows bat flying animation

#### **Small Reel** (4 frames)
- sreel_p0Frame1-4 and sreel_p1Frame1-4
- Shows film reel spinning animation

#### **Bicycle** (static)
- bike_p0 and bike_p1
- Shows the bicycle sprite (no animation)

### Animation Speed

- Animations play at **10 FPS** (100ms per frame)
- This matches the game's animation speed
- Loops continuously

### Preview Features

- **16-pixel wide preview**: Shows both Player 0 and Player 1 sprites combined
- **Scaled 4x**: Large enough to see details clearly
- **Black background**: Matches the game's appearance
- **Color customization**: Use the color picker to preview different colors
- **Real-time updates**: Changes to sprites update the animation immediately

### Editing While Previewing

1. Click on any sprite in the animation group
2. Edit it using the pixel editor on the left
3. The animation preview updates in real-time
4. See how your changes look in the full animation!

### Technical Details

- **Paired sprites**: Player 0 and Player 1 are displayed side-by-side (8 pixels each = 16 pixels total)
- **Frame cycling**: Animation automatically cycles through all frames
- **Synchronized**: Both sprites in a pair are always shown together
- **Auto-detection**: The editor automatically detects which sprites belong together based on naming

## Sprite Categories

### Player Sprites (60 pixels tall)
- 12 total sprites (6 frames × 2 sprites per frame)
- 6 animation frames (3 right-facing, 3 left-facing)
- Each frame uses 2 PMG sprites (Player 0 and Player 1)

### Bicycle (18 pixels tall)
- 2 sprites (bike_p0 and bike_p1)
- Static sprite (no animation frames)
- Original sprite that was replaced by the player

### Enemy Sprites (18 pixels tall)
- **Bat**: 8 sprites (4 frames × 2 sprites per frame)
- **Small Reel**: 8 sprites (4 frames × 2 sprites per frame)
- Each frame uses 2 PMG sprites

## Export Options

### Export Current
- Downloads the currently selected sprite as a `.pas` file
- Ready to paste into your Mad-Pascal code

### Export All
- Downloads all sprites (Player, Bicycle, and Enemies)
- Organized by category with comments
- Complete Pascal array definitions

## Editing Tools

- **Click to toggle**: Click pixels on/off
- **Clear**: Erase entire sprite
- **Invert**: Flip all pixels
- **Shift Left/Right**: Rotate pixels horizontally
- **Shift Up/Down**: Rotate pixels vertically
- **Color Picker**: Change preview color (doesn't affect export)

## Tips

1. **Preview animations** before exporting to ensure they look smooth
2. **Edit multiple frames** in sequence to create new animations
3. **Use the color picker** to test how sprites look in different colors
4. **Watch the frame counter** to see which frame you're editing
5. **Export frequently** to save your work

## Browser Compatibility

- Works in all modern browsers (Chrome, Firefox, Safari, Edge)
- Requires JavaScript enabled
- Best viewed on desktop (large screen recommended)

## Development

```bash
# Start development server
npm run dev

# Build for production
npm run build

# Preview production build
npm run preview
```

The editor runs on **Vite** for fast hot-reloading during development!

