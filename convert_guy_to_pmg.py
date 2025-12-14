#!/usr/bin/env python3
"""Convert guy .gr8 files to PMG sprite format (2 sprites, 60 lines)"""

import sys

def convert_gr8_to_pmg(filename):
    """Read .gr8 file and extract first 2 bytes of each line for PMG sprites"""
    with open(filename, 'rb') as f:
        data = f.read()
    
    # Each line is 4 bytes, we want 60 lines
    player0 = []
    player1 = []
    
    for i in range(60):
        offset = i * 4
        if offset + 2 < len(data):
            player0.append(data[offset + 1])  # Second byte -> Player 0
            player1.append(data[offset + 2])  # Third byte -> Player 1
        else:
            player0.append(0)
            player1.append(0)
    
    return player0, player1

def format_array(name, data):
    """Format byte array as Pascal code"""
    # Format as groups of 8 bytes per line
    lines = []
    for i in range(0, len(data), 8):
        chunk = data[i:i+8]
        hex_values = ', '.join(f'${b:02X}' for b in chunk)
        lines.append(f'        ({hex_values}')
    
    # Join with commas and close parenthesis
    result = name + ' : array[0.._GUY_HEIGHT - 1] of byte =\n'
    result += ',\n'.join(lines[:-1]) + ',\n' + lines[-1] + ');\n'
    return result

# Convert all 6 frames
frames = []
for frame_num in range(1, 7):
    filename = f'app/assets/ludzik6_{frame_num}.gr8'
    try:
        p0, p1 = convert_gr8_to_pmg(filename)
        frames.append((frame_num, p0, p1))
        print(f"Converted {filename}")
    except FileNotFoundError:
        print(f"Warning: {filename} not found", file=sys.stderr)

# Output Pascal code
print("\n// Player PMG sprites (2 sprites, 60 pixels tall)")
print("// Frames 1-3: right-facing, Frames 4-6: left-facing")
print()

for frame_num, p0, p1 in frames:
    print(f"    guy_p0Frame{frame_num}" + format_array("", p0))
    print(f"    guy_p1Frame{frame_num}" + format_array("", p1))

