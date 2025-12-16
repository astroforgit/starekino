// Sprite data from the game
const sprites = {
    player: {
        guy_p0Frame1: [0x3C, 0x7E, 0x7E, 0x7E, 0x7E, 0x7F, 0xFF, 0xFF, 0x7F, 0x7F, 0xFE, 0xFE, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xF9, 0xF9, 0xF9, 0xF9, 0xF1, 0xF0, 0xFE, 0xFF],
        guy_p1Frame1: [0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0xC0, 0xE0, 0xE0, 0xF0, 0xF8, 0xF8, 0xFC, 0xFC, 0xFC, 0xFC, 0xFC, 0xFD, 0x76, 0x10, 0x90, 0x90, 0x98, 0xD9, 0xD9, 0xC9, 0xEA, 0xEA, 0xEA, 0xEA, 0xEA, 0xF4, 0xFC, 0xF8, 0xF0, 0xF0, 0xF0, 0xF0, 0xF0, 0xF0, 0xF0, 0xF0, 0xF0, 0xF0, 0xF0, 0xF0, 0xF0, 0xF0, 0xF0, 0xFE, 0xFF, 0x00],
        guy_p0Frame2: [0x3C, 0x7E, 0x7E, 0x7E, 0x7E, 0x7F, 0xFF, 0xFF, 0x7F, 0x7F, 0xFE, 0xFE, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFB, 0xFB, 0xF9, 0xF9, 0xF9, 0xF8, 0xF8, 0xF8, 0xF8, 0xF0, 0xF0, 0xFE, 0xFF],
        guy_p1Frame2: [0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x80, 0xC0, 0xE0, 0xF0, 0xF8, 0xF8, 0xF8, 0xFC, 0xFC, 0xFC, 0xFC, 0xFD, 0x76, 0x10, 0x90, 0x90, 0x98, 0xD9, 0xD9, 0xC9, 0xEA, 0xEA, 0xEA, 0xEA, 0xE8, 0xFC, 0xFC, 0xF8, 0xF0, 0xF0, 0xF0, 0xF0, 0xF0, 0xF0, 0xF8, 0xF8, 0xF8, 0xF8, 0xFC, 0xFC, 0xFC, 0xFC, 0x7F, 0x7F, 0x78, 0x00],
        guy_p0Frame3: [0x3C, 0x7E, 0x7E, 0x7E, 0x7E, 0x7F, 0xFF, 0xFF, 0x7F, 0x7F, 0xFE, 0xFE, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFD, 0xFD, 0xFC, 0xFC, 0xFC, 0xF8, 0xF8, 0xF8, 0xF8, 0xF8, 0xF8, 0xF8, 0xF8, 0xF8, 0xF0, 0xF0, 0xFE, 0xFF],
        guy_p1Frame3: [0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x80, 0xC0, 0xE0, 0xF0, 0xF8, 0xF8, 0xF8, 0xFC, 0xFC, 0xFC, 0xFC, 0xFD, 0x56, 0x10, 0x90, 0x90, 0x98, 0xD9, 0xD9, 0xC9, 0xEA, 0xEA, 0xEA, 0xEA, 0xFE, 0xF4, 0xFC, 0xFC, 0xFC, 0xFC, 0xFC, 0xFE, 0xFE, 0xFE, 0x3F, 0x3F, 0x3F, 0x1F, 0x1F, 0x1F, 0x1F, 0x07, 0x07, 0x00, 0x00, 0x00],
        guy_p0Frame4: [0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x03, 0x07, 0x07, 0x0F, 0x1F, 0x1F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0xBF, 0x6E, 0x08, 0x09, 0x09, 0x19, 0x9B, 0x9B, 0x93, 0x57, 0x57, 0x57, 0x57, 0x57, 0x2F, 0x3F, 0x1F, 0x0F, 0x0F, 0x0F, 0x0F, 0x0F, 0x0F, 0x0F, 0x0F, 0x0F, 0x0F, 0x0F, 0x0F, 0x0F, 0x0F, 0x0F, 0x7F, 0xFF, 0x00],
        guy_p1Frame4: [0x3C, 0x7E, 0x7E, 0x7E, 0x7E, 0xFE, 0xFF, 0xFF, 0xFE, 0xFE, 0x7F, 0x7F, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xDF, 0xDF, 0xDF, 0xDF, 0xDF, 0x9F, 0x9F, 0x9F, 0x9F, 0x8F, 0x0F, 0x7F, 0xFF],
        guy_p0Frame5: [0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x03, 0x07, 0x0F, 0x1F, 0x1F, 0x1F, 0x3F, 0x3F, 0x3F, 0x3F, 0xBF, 0x6E, 0x08, 0x09, 0x09, 0x19, 0x9B, 0x9B, 0x93, 0x57, 0x57, 0x57, 0x57, 0x17, 0x3F, 0x3F, 0x1F, 0x0F, 0x0F, 0x0F, 0x0F, 0x0F, 0x0F, 0x1F, 0x1F, 0x1F, 0x1F, 0x3F, 0x3F, 0x3F, 0x3F, 0xFE, 0xFE, 0x1E, 0x00],
        guy_p1Frame5: [0x3C, 0x7E, 0x7E, 0x7E, 0x7E, 0xFE, 0xFF, 0xFF, 0xFE, 0xFE, 0x7F, 0x7F, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xDF, 0xDF, 0x9F, 0x9F, 0x9F, 0x1F, 0x1F, 0x1F, 0x1F, 0x0F, 0x0F, 0x7F, 0xFF],
        guy_p0Frame6: [0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x03, 0x07, 0x0F, 0x1F, 0x1F, 0x1F, 0x3F, 0x3F, 0x3F, 0x3F, 0xBF, 0x6A, 0x08, 0x09, 0x09, 0x19, 0x9B, 0x9B, 0x93, 0x57, 0x57, 0x57, 0x57, 0x7F, 0x2F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x7F, 0x7F, 0x7F, 0xFC, 0xFC, 0xFC, 0xF8, 0xF8, 0xF8, 0xF8, 0xE0, 0xE0, 0x00, 0x00, 0x00],
        guy_p1Frame6: [0x3C, 0x7E, 0x7E, 0x7E, 0x7E, 0xFE, 0xFF, 0xFF, 0xFE, 0xFE, 0x7F, 0x7F, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xBF, 0xBF, 0x3F, 0x3F, 0x3F, 0x1F, 0x1F, 0x1F, 0x1F, 0x1F, 0x1F, 0x1F, 0x1F, 0x1F, 0x0F, 0x0F, 0x7F, 0xFF]
    },
    bicycle: {
        bike_p0: [0x18, 0x0C, 0x08, 0x1E, 0x2C, 0x4A, 0x4A, 0x91, 0x91, 0x91, 0x81, 0x81, 0x42, 0x42, 0x24, 0x18, 0x00, 0x00],
        bike_p1: [0x00, 0x00, 0x00, 0x88, 0x70, 0x20, 0x10, 0x08, 0x08, 0x04, 0x04, 0x0E, 0x15, 0x15, 0x11, 0x0E, 0x00, 0x00]
    },
    enemies: {
        bat_p0Frame1: [0x00, 0x00, 0x02, 0x02, 0x03, 0x0F, 0x3E, 0x7F, 0x7F, 0xF3, 0xC3, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00],
        bat_p1Frame1: [0x00, 0x00, 0x40, 0x40, 0xC0, 0xF0, 0xBC, 0xFE, 0xFE, 0xCF, 0xC3, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00],
        bat_p0Frame2: [0x00, 0x00, 0x00, 0x02, 0xC2, 0x73, 0x7B, 0x3E, 0x3F, 0x1F, 0x17, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00],
        bat_p1Frame2: [0x00, 0x00, 0x00, 0x40, 0x43, 0xCE, 0xDE, 0xBC, 0xFC, 0xF8, 0xE8, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00],
        bat_p0Frame3: [0x00, 0x00, 0x02, 0x02, 0x03, 0x0F, 0x3E, 0x7F, 0x7F, 0xF3, 0xC3, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00],
        bat_p1Frame3: [0x00, 0x00, 0x40, 0x40, 0xC0, 0xF0, 0xBC, 0xFE, 0xFE, 0xCF, 0xC3, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00],
        bat_p0Frame4: [0x00, 0x00, 0x00, 0x02, 0xC2, 0x73, 0x7B, 0x3E, 0x3F, 0x1F, 0x17, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00],
        bat_p1Frame4: [0x00, 0x00, 0x00, 0x40, 0x43, 0xCE, 0xDE, 0xBC, 0xFC, 0xF8, 0xE8, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00],
        sreel_p0Frame1: [0x00, 0x00, 0x00, 0x07, 0x0F, 0x1B, 0x11, 0x3B, 0x3E, 0x3E, 0x3B, 0x11, 0x1B, 0x0F, 0x07, 0x00, 0x00, 0x00],
        sreel_p1Frame1: [0x00, 0x00, 0x00, 0xE0, 0xF0, 0xD8, 0x88, 0xDC, 0x7C, 0x7C, 0xDC, 0x88, 0xD8, 0xF0, 0xE0, 0x00, 0x00, 0x00],
        sreel_p0Frame2: [0x00, 0x00, 0x00, 0x03, 0x0E, 0x1C, 0x1E, 0x3F, 0x36, 0x22, 0x37, 0x1F, 0x1E, 0x2F, 0x23, 0x00, 0x00, 0x00],
        sreel_p1Frame2: [0x00, 0x00, 0x00, 0xC0, 0x70, 0x38, 0x78, 0xFC, 0x6C, 0x44, 0xEC, 0xF8, 0x78, 0xF4, 0xC4, 0x00, 0x00, 0x00],
        sreel_p0Frame3: [0x00, 0x00, 0x00, 0x07, 0x0F, 0x1B, 0x11, 0x3B, 0x3E, 0x3E, 0x3B, 0x11, 0x1B, 0x0F, 0x07, 0x00, 0x00, 0x00],
        sreel_p1Frame3: [0x00, 0x00, 0x00, 0xEC, 0xF0, 0xD8, 0x88, 0xDC, 0x7C, 0x7C, 0xDC, 0x88, 0xD8, 0xF0, 0xE0, 0x00, 0x00, 0x00],
        sreel_p0Frame4: [0x00, 0x00, 0x00, 0x03, 0x0E, 0x1C, 0x1E, 0x3F, 0x36, 0x22, 0x37, 0x1F, 0x1E, 0x0F, 0x03, 0x00, 0x00, 0x00],
        sreel_p1Frame4: [0x00, 0x00, 0x00, 0xC0, 0x70, 0x38, 0x78, 0xFC, 0x6C, 0x44, 0xEC, 0xF8, 0x78, 0xF0, 0xC0, 0x00, 0x00, 0x00]
    }
};

// Animation groups - defines which sprites belong to which animation
// Format: [p0Frame1, p1Frame1, p0Frame2, p1Frame2, ...] so frames are paired correctly
const animationGroups = {
    'Player Right': ['guy_p0Frame1', 'guy_p1Frame1', 'guy_p0Frame2', 'guy_p1Frame2', 'guy_p0Frame3', 'guy_p1Frame3'],
    'Player Left': ['guy_p0Frame4', 'guy_p1Frame4', 'guy_p0Frame5', 'guy_p1Frame5', 'guy_p0Frame6', 'guy_p1Frame6'],
    'Bat': ['bat_p0Frame1', 'bat_p1Frame1', 'bat_p0Frame2', 'bat_p1Frame2', 'bat_p0Frame3', 'bat_p1Frame3', 'bat_p0Frame4', 'bat_p1Frame4'],
    'Small Reel': ['sreel_p0Frame1', 'sreel_p1Frame1', 'sreel_p0Frame2', 'sreel_p1Frame2', 'sreel_p0Frame3', 'sreel_p1Frame3', 'sreel_p0Frame4', 'sreel_p1Frame4'],
    'Bicycle': ['bike_p0', 'bike_p1']
};

let currentSprite = null;
let currentData = [];
let pairedSprite = null;
let pairedData = [];
let pixelSize = 8; // Size of each pixel in the editor (square)
let canvas, ctx, canvas2, ctx2, previewCanvas, previewCtx;
let animationInterval = null;
let currentAnimationFrame = 0;
let isAnimationPlaying = false;
let currentAnimationGroup = null;

// Pixel buffers for preserving pixels during shifts
let leftPixelBuffer = [];
let rightPixelBuffer = [];
let topPixelBuffer = [];
let bottomPixelBuffer = [];

function init() {
    canvas = document.getElementById('spriteCanvas');
    ctx = canvas.getContext('2d');
    canvas2 = document.getElementById('spriteCanvas2');
    ctx2 = canvas2.getContext('2d');
    previewCanvas = document.getElementById('previewCanvas');
    previewCtx = previewCanvas.getContext('2d');

    // Populate sprite lists
    const playerList = document.getElementById('playerSprites');
    const enemyList = document.getElementById('enemySprites');
    const bicycleList = document.getElementById('bicycleSprites');

    Object.keys(sprites.player).forEach(name => {
        const li = document.createElement('li');
        li.className = 'sprite-item';
        li.textContent = name;
        li.onclick = () => loadSprite('player', name);
        playerList.appendChild(li);
    });

    Object.keys(sprites.bicycle).forEach(name => {
        const li = document.createElement('li');
        li.className = 'sprite-item';
        li.textContent = name;
        li.onclick = () => loadSprite('bicycle', name);
        bicycleList.appendChild(li);
    });

    Object.keys(sprites.enemies).forEach(name => {
        const li = document.createElement('li');
        li.className = 'sprite-item';
        li.textContent = name;
        li.onclick = () => loadSprite('enemies', name);
        enemyList.appendChild(li);
    });

    // Load first sprite
    loadSprite('player', 'guy_p0Frame1');

    // Canvas event handlers for continuous drawing
    let isDrawing = false;

    canvas.addEventListener('mousedown', (e) => {
        isDrawing = true;
        handleCanvasClick(e);
    });

    canvas.addEventListener('mousemove', (e) => {
        if (isDrawing) {
            handleCanvasClick(e);
        }
    });

    canvas.addEventListener('mouseup', () => {
        isDrawing = false;
    });

    canvas.addEventListener('mouseleave', () => {
        isDrawing = false;
    });

    canvas2.addEventListener('mousedown', (e) => {
        isDrawing = true;
        handleCanvas2Click(e);
    });

    canvas2.addEventListener('mousemove', (e) => {
        if (isDrawing) {
            handleCanvas2Click(e);
        }
    });

    canvas2.addEventListener('mouseup', () => {
        isDrawing = false;
    });

    canvas2.addEventListener('mouseleave', () => {
        isDrawing = false;
    });

    // Color picker
    document.getElementById('colorPicker').addEventListener('change', () => {
        drawSprite();
        drawPairedSprite();
        drawIndividualPreviews();
        drawAnimationPreview();
    });

    // Animation controls
    document.getElementById('playPauseBtn').addEventListener('click', toggleAnimation);
    document.getElementById('prevFrameBtn').addEventListener('click', prevFrame);
    document.getElementById('nextFrameBtn').addEventListener('click', nextFrame);
}

function loadSprite(category, name) {
    // Always ensure P0 is on left, P1 is on right
    let p0Name, p1Name;

    if (name.includes('_p0')) {
        p0Name = name;
        p1Name = name.replace('_p0', '_p1');
    } else if (name.includes('_p1')) {
        p1Name = name;
        p0Name = name.replace('_p1', '_p0');
    } else {
        // Not a paired sprite
        currentSprite = { category, name };
        currentData = [...sprites[category][name]];
        pairedSprite = null;
        pairedData = [];

        // Update active state
        document.querySelectorAll('.sprite-item').forEach(item => {
            item.classList.remove('active');
            if (item.textContent === name) {
                item.classList.add('active');
            }
        });

        // Update UI
        document.getElementById('spriteName').textContent = name;
        const height = currentData.length;
        document.getElementById('spriteSize').textContent = `8x${height}`;
        document.getElementById('spriteName2').textContent = 'No pair';
        document.getElementById('spriteSize2').textContent = '-';

        // Resize canvases
        canvas.width = 8 * pixelSize;
        canvas.height = height * pixelSize;
        canvas2.width = 8 * pixelSize;
        canvas2.height = height * pixelSize;

        drawSprite();
        drawPairedSprite();
        updateExportData();
        drawIndividualPreviews();
        startAnimationPreview();
        return;
    }

    // Load P0 (left) and P1 (right)
    if (sprites[category][p0Name] && sprites[category][p1Name]) {
        currentSprite = { category, name: p0Name };
        currentData = [...sprites[category][p0Name]];
        pairedSprite = { category, name: p1Name };
        pairedData = [...sprites[category][p1Name]];
    } else {
        // Fallback if pair not found
        currentSprite = { category, name };
        currentData = [...sprites[category][name]];
        pairedSprite = null;
        pairedData = [];
    }

    // Update active state
    document.querySelectorAll('.sprite-item').forEach(item => {
        item.classList.remove('active');
        if (item.textContent === name) {
            item.classList.add('active');
        }
    });

    // Update UI - always show P0 on left, P1 on right
    document.getElementById('spriteName').textContent = p0Name;
    document.getElementById('spriteSize').textContent = `8x${currentData.length}`;

    if (pairedSprite) {
        document.getElementById('spriteName2').textContent = p1Name;
        document.getElementById('spriteSize2').textContent = `8x${pairedData.length}`;
    }

    // Resize canvases to fit sprites
    canvas.width = 8 * pixelSize;
    canvas.height = currentData.length * pixelSize;

    if (pairedSprite) {
        canvas2.width = 8 * pixelSize;
        canvas2.height = pairedData.length * pixelSize;
    }

    drawSprite();
    drawPairedSprite();
    updateExportData();
    drawIndividualPreviews();
    startAnimationPreview();
}

function getAnimationGroup(spriteName) {
    for (const [groupName, spriteNames] of Object.entries(animationGroups)) {
        if (spriteNames.includes(spriteName)) {
            return { groupName, spriteNames };
        }
    }
    return null;
}

function startAnimationPreview() {
    // Stop existing animation
    if (animationInterval) {
        clearInterval(animationInterval);
        animationInterval = null;
    }

    const animGroup = getAnimationGroup(currentSprite.name);
    currentAnimationGroup = animGroup;

    if (!animGroup) {
        // No animation group, just show static preview
        isAnimationPlaying = false;
        document.getElementById('playPauseBtn').textContent = 'Play';
        drawAnimationPreview();
        return;
    }

    currentAnimationFrame = 0;
    isAnimationPlaying = true;
    document.getElementById('playPauseBtn').textContent = 'Pause';
    drawAnimationPreview();

    // Start animation loop (10 FPS)
    animationInterval = setInterval(() => {
        currentAnimationFrame++;
        drawAnimationPreview();
    }, 100);
}

function toggleAnimation() {
    if (!currentAnimationGroup) return;

    if (isAnimationPlaying) {
        // Pause
        if (animationInterval) {
            clearInterval(animationInterval);
            animationInterval = null;
        }
        isAnimationPlaying = false;
        document.getElementById('playPauseBtn').textContent = 'Play';
    } else {
        // Play
        isAnimationPlaying = true;
        document.getElementById('playPauseBtn').textContent = 'Pause';
        animationInterval = setInterval(() => {
            currentAnimationFrame++;
            drawAnimationPreview();
        }, 100);
    }
}

function prevFrame() {
    if (!currentAnimationGroup) return;

    // Pause animation
    if (animationInterval) {
        clearInterval(animationInterval);
        animationInterval = null;
    }
    isAnimationPlaying = false;
    document.getElementById('playPauseBtn').textContent = 'Play';

    // Get frame count
    const { spriteNames } = currentAnimationGroup;
    const isPaired = spriteNames.some(name => name.includes('_p0') || name.includes('_p1'));
    const frameCount = isPaired ? spriteNames.length / 2 : spriteNames.length;

    // Go to previous frame
    currentAnimationFrame = (currentAnimationFrame - 1 + frameCount) % frameCount;
    drawAnimationPreview();
}

function nextFrame() {
    if (!currentAnimationGroup) return;

    // Pause animation
    if (animationInterval) {
        clearInterval(animationInterval);
        animationInterval = null;
    }
    isAnimationPlaying = false;
    document.getElementById('playPauseBtn').textContent = 'Play';

    // Get frame count
    const { spriteNames } = currentAnimationGroup;
    const isPaired = spriteNames.some(name => name.includes('_p0') || name.includes('_p1'));
    const frameCount = isPaired ? spriteNames.length / 2 : spriteNames.length;

    // Go to next frame
    currentAnimationFrame = (currentAnimationFrame + 1) % frameCount;
    drawAnimationPreview();
}

function drawAnimationPreview() {
    if (!currentSprite) return;

    const animGroup = getAnimationGroup(currentSprite.name);
    if (!animGroup) {
        // No animation group, clear preview
        const previewCanvas = document.getElementById('previewCanvas');
        const previewCtx = previewCanvas.getContext('2d');
        previewCtx.fillStyle = '#000';
        previewCtx.fillRect(0, 0, previewCanvas.width, previewCanvas.height);
        document.getElementById('animationInfo').textContent = 'No animation';
        return;
    }

    // Get all sprites in the animation group
    const { groupName, spriteNames } = animGroup;

    // Determine if this is a 2-sprite animation (like player or bicycle)
    const isPaired = spriteNames.some(name => name.includes('_p0') || name.includes('_p1'));

    if (isPaired) {
        // Group sprites into pairs (p0 and p1)
        const frames = [];
        for (let i = 0; i < spriteNames.length; i += 2) {
            const p0Name = spriteNames[i];
            const p1Name = spriteNames[i + 1];

            // Find category for these sprites
            let p0Data, p1Data;
            for (const [cat, spriteList] of Object.entries(sprites)) {
                if (spriteList[p0Name]) p0Data = spriteList[p0Name];
                if (spriteList[p1Name]) p1Data = spriteList[p1Name];
            }

            if (p0Data && p1Data) {
                frames.push([p0Data, p1Data]);
            }
        }

        if (frames.length > 0) {
            const frameIndex = currentAnimationFrame % frames.length;
            const [p0, p1] = frames[frameIndex];

            // Draw to main preview canvas (combined view)
            const previewCanvas = document.getElementById('previewCanvas');
            const previewCtx = previewCanvas.getContext('2d');
            const height = Math.max(p0.length, p1.length);
            previewCanvas.height = height * 4;
            previewCanvas.width = 16 * 4; // 2 sprites * 8 pixels * 4 scale
            previewCtx.fillStyle = '#000';
            previewCtx.fillRect(0, 0, previewCanvas.width, previewCanvas.height);

            // Draw both sprites side by side (P0 on LEFT, P1 on RIGHT)
            drawSpriteData(previewCtx, p0, 0, 0, 4);
            drawSpriteData(previewCtx, p1, 8 * 4, 0, 4);

            // Update info
            document.getElementById('animationInfo').textContent =
                `${groupName} - Frame ${frameIndex + 1}/${frames.length}`;
        }
    }
}

function drawIndividualPreviews() {
    if (!currentSprite) return;

    // Find the paired sprite (p0 <-> p1)
    const currentName = currentSprite.name;
    let p0Name, p1Name, p0Data, p1Data;

    if (currentName.includes('_p0')) {
        p0Name = currentName;
        p1Name = currentName.replace('_p0', '_p1');
    } else if (currentName.includes('_p1')) {
        p1Name = currentName;
        p0Name = currentName.replace('_p1', '_p0');
    } else {
        // Not a paired sprite, clear individual previews
        const p0Canvas = document.getElementById('preview0Canvas');
        const p0Ctx = p0Canvas.getContext('2d');
        p0Ctx.fillStyle = '#000';
        p0Ctx.fillRect(0, 0, p0Canvas.width, p0Canvas.height);

        const p1Canvas = document.getElementById('preview1Canvas');
        const p1Ctx = p1Canvas.getContext('2d');
        p1Ctx.fillStyle = '#000';
        p1Ctx.fillRect(0, 0, p1Canvas.width, p1Canvas.height);
        return;
    }

    // Get sprite data
    for (const [cat, spriteList] of Object.entries(sprites)) {
        if (spriteList[p0Name]) p0Data = spriteList[p0Name];
        if (spriteList[p1Name]) p1Data = spriteList[p1Name];
    }

    if (!p0Data || !p1Data) return;

    const color = document.getElementById('colorPicker').value;

    // Draw Player 0 preview (LEFT half)
    const p0Canvas = document.getElementById('preview0Canvas');
    const p0Ctx = p0Canvas.getContext('2d');
    p0Canvas.height = p0Data.length * 4;
    p0Canvas.width = 8 * 4;
    p0Ctx.fillStyle = '#000';
    p0Ctx.fillRect(0, 0, p0Canvas.width, p0Canvas.height);
    drawSpriteData(p0Ctx, p0Data, 0, 0, 4);

    // Draw Player 1 preview (RIGHT half)
    const p1Canvas = document.getElementById('preview1Canvas');
    const p1Ctx = p1Canvas.getContext('2d');
    p1Canvas.height = p1Data.length * 4;
    p1Canvas.width = 8 * 4;
    p1Ctx.fillStyle = '#000';
    p1Ctx.fillRect(0, 0, p1Canvas.width, p1Canvas.height);
    drawSpriteData(p1Ctx, p1Data, 0, 0, 4);
}

function drawSpriteData(context, data, offsetX, offsetY, scale) {
    const color = document.getElementById('colorPicker').value;
    context.fillStyle = color;

    for (let y = 0; y < data.length; y++) {
        const byte = data[y];
        for (let x = 0; x < 8; x++) {
            const bit = (byte >> (7 - x)) & 1;
            if (bit) {
                context.fillRect(offsetX + x * scale, offsetY + y * scale, scale, scale);
            }
        }
    }
}

function drawSprite() {
    if (!currentData) return;

    const color = document.getElementById('colorPicker').value;
    const height = currentData.length;

    // Clear canvas
    ctx.fillStyle = '#000';
    ctx.fillRect(0, 0, canvas.width, canvas.height);

    // Draw pixels (square pixels now)
    drawSpriteData(ctx, currentData, 0, 0, pixelSize);

    // Draw grid
    ctx.strokeStyle = '#333';
    ctx.lineWidth = 1;
    for (let x = 0; x <= 8; x++) {
        ctx.beginPath();
        ctx.moveTo(x * pixelSize, 0);
        ctx.lineTo(x * pixelSize, height * pixelSize);
        ctx.stroke();
    }
    for (let y = 0; y <= height; y++) {
        ctx.beginPath();
        ctx.moveTo(0, y * pixelSize);
        ctx.lineTo(8 * pixelSize, y * pixelSize);
        ctx.stroke();
    }
}

function drawPairedSprite() {
    if (!pairedData || pairedData.length === 0) return;

    const color = document.getElementById('colorPicker').value;
    const height = pairedData.length;

    // Clear canvas
    ctx2.fillStyle = '#000';
    ctx2.fillRect(0, 0, canvas2.width, canvas2.height);

    // Draw pixels
    drawSpriteData(ctx2, pairedData, 0, 0, pixelSize);

    // Draw grid
    ctx2.strokeStyle = '#333';
    ctx2.lineWidth = 1;
    for (let x = 0; x <= 8; x++) {
        ctx2.beginPath();
        ctx2.moveTo(x * pixelSize, 0);
        ctx2.lineTo(x * pixelSize, height * pixelSize);
        ctx2.stroke();
    }
    for (let y = 0; y <= height; y++) {
        ctx2.beginPath();
        ctx2.moveTo(0, y * pixelSize);
        ctx2.lineTo(8 * pixelSize, y * pixelSize);
        ctx2.stroke();
    }
}

function handleCanvasClick(e) {
    if (!currentData) return;

    const rect = canvas.getBoundingClientRect();
    const x = Math.floor((e.clientX - rect.left) / pixelSize);
    const y = Math.floor((e.clientY - rect.top) / pixelSize);

    if (x >= 0 && x < 8 && y >= 0 && y < currentData.length) {
        // Toggle bit (XOR operation) - allows drawing on both black and white pixels
        const bitMask = 1 << (7 - x);
        currentData[y] ^= bitMask;

        // Update sprite data
        sprites[currentSprite.category][currentSprite.name] = [...currentData];

        drawSprite();
        updateExportData();
        drawIndividualPreviews();
        drawAnimationPreview();
    }
}

function handleCanvas2Click(e) {
    if (!pairedData || pairedData.length === 0) return;

    const rect = canvas2.getBoundingClientRect();
    const x = Math.floor((e.clientX - rect.left) / pixelSize);
    const y = Math.floor((e.clientY - rect.top) / pixelSize);

    if (x >= 0 && x < 8 && y >= 0 && y < pairedData.length) {
        // Toggle bit (XOR operation) - allows drawing on both black and white pixels
        const bitMask = 1 << (7 - x);
        pairedData[y] ^= bitMask;

        // Update sprite data
        sprites[pairedSprite.category][pairedSprite.name] = [...pairedData];

        drawPairedSprite();
        updateExportData();
        drawIndividualPreviews();
        drawAnimationPreview();
    }
}

function clearSprite() {
    if (!currentData) return;
    currentData = currentData.map(() => 0);
    sprites[currentSprite.category][currentSprite.name] = [...currentData];
    drawSprite();
    updateExportData();
    drawIndividualPreviews();
    drawAnimationPreview();
}

function invertSprite() {
    if (!currentData) return;
    currentData = currentData.map(byte => (~byte) & 0xFF);
    sprites[currentSprite.category][currentSprite.name] = [...currentData];
    drawSprite();
    updateExportData();
    drawIndividualPreviews();
    drawAnimationPreview();
}

function shiftLeft() {
    if (!currentData) return;

    // Store pixels that will be shifted out (rightmost bits)
    rightPixelBuffer = currentData.map(byte => (byte & 0x01) ? 1 : 0);

    // Shift left, bringing in pixels from left buffer (or black if empty)
    currentData = currentData.map((byte, index) => {
        const leftBit = leftPixelBuffer.length > 0 ? (leftPixelBuffer[index] << 7) : 0;
        return ((byte << 1) & 0xFF) | leftBit;
    });

    // Clear left buffer since we used those pixels
    leftPixelBuffer = [];

    sprites[currentSprite.category][currentSprite.name] = [...currentData];

    drawSprite();
    updateExportData();
    drawIndividualPreviews();
    drawAnimationPreview();
}

function shiftRight() {
    if (!currentData) return;

    // Store pixels that will be shifted out (leftmost bits)
    leftPixelBuffer = currentData.map(byte => (byte & 0x80) ? 1 : 0);

    // Shift right, bringing in pixels from right buffer (or black if empty)
    currentData = currentData.map((byte, index) => {
        const rightBit = rightPixelBuffer.length > 0 ? rightPixelBuffer[index] : 0;
        return ((byte >> 1) & 0xFF) | rightBit;
    });

    // Clear right buffer since we used those pixels
    rightPixelBuffer = [];

    sprites[currentSprite.category][currentSprite.name] = [...currentData];

    drawSprite();
    updateExportData();
    drawIndividualPreviews();
    drawAnimationPreview();
}

function shiftUp() {
    if (!currentData) return;

    // Store the bottom row pixels that will be shifted out
    bottomPixelBuffer = [...currentData.slice(-1)];

    // Shift up, bringing in pixels from top buffer (or black row if empty)
    const topRow = topPixelBuffer.length > 0 ? [...topPixelBuffer] : new Array(8).fill(0);
    currentData = [...topRow, ...currentData.slice(0, -1)];

    // Clear top buffer since we used those pixels
    topPixelBuffer = [];

    sprites[currentSprite.category][currentSprite.name] = [...currentData];

    drawSprite();
    updateExportData();
    drawIndividualPreviews();
    drawAnimationPreview();
}

function shiftDown() {
    if (!currentData) return;

    // Store the top row pixels that will be shifted out
    topPixelBuffer = [...currentData.slice(0, 1)];

    // Shift down, bringing in pixels from bottom buffer (or black row if empty)
    const bottomRow = bottomPixelBuffer.length > 0 ? [...bottomPixelBuffer] : new Array(8).fill(0);
    currentData = [...currentData.slice(1), ...bottomRow];

    // Clear bottom buffer since we used those pixels
    bottomPixelBuffer = [];

    sprites[currentSprite.category][currentSprite.name] = [...currentData];

    drawSprite();
    updateExportData();
    drawIndividualPreviews();
    drawAnimationPreview();
}

// Zoom functions
function zoomIn() {
    pixelSize = Math.min(pixelSize + 2, 20); // Max zoom: 20px
    if (currentData) {
        canvas.width = 8 * pixelSize;
        canvas.height = currentData.length * pixelSize;
        drawSprite();
    }
    if (pairedData && pairedData.length > 0) {
        canvas2.width = 8 * pixelSize;
        canvas2.height = pairedData.length * pixelSize;
        drawPairedSprite();
    }
}

function zoomOut() {
    pixelSize = Math.max(pixelSize - 2, 4); // Min zoom: 4px
    if (currentData) {
        canvas.width = 8 * pixelSize;
        canvas.height = currentData.length * pixelSize;
        drawSprite();
    }
    if (pairedData && pairedData.length > 0) {
        canvas2.width = 8 * pixelSize;
        canvas2.height = pairedData.length * pixelSize;
        drawPairedSprite();
    }
}

function resetZoom() {
    pixelSize = 8; // Default zoom
    if (currentData) {
        canvas.width = 8 * pixelSize;
        canvas.height = currentData.length * pixelSize;
        drawSprite();
    }
    if (pairedData && pairedData.length > 0) {
        canvas2.width = 8 * pixelSize;
        canvas2.height = pairedData.length * pixelSize;
        drawPairedSprite();
    }
}

function updateExportData() {
    if (!currentData) return;

    const name = currentSprite.name;
    const height = currentData.length;

    let output = `    ${name} : array[0..${height - 1}] of byte = (\n`;

    for (let i = 0; i < currentData.length; i += 8) {
        const chunk = currentData.slice(i, i + 8);
        const hexValues = chunk.map(b => '$' + b.toString(16).toUpperCase().padStart(2, '0'));
        output += '        ' + hexValues.join(', ');
        if (i + 8 < currentData.length) {
            output += ',\n';
        } else {
            output += ');\n';
        }
    }

    document.getElementById('exportData').value = output;
}

function exportCurrentSprite() {
    if (!currentData) return;

    const name = currentSprite.name;
    const data = document.getElementById('exportData').value;

    const blob = new Blob([data], { type: 'text/plain' });
    const url = URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url;
    a.download = `${name}.pas`;
    a.click();
    URL.revokeObjectURL(url);
}

function exportAllSprites() {
    let output = '// Player PMG sprites (2 sprites, 60 pixels tall)\n';
    output += '// Frames 1-3: right-facing, Frames 4-6: left-facing\n\n';

    Object.keys(sprites.player).forEach(name => {
        const data = sprites.player[name];
        const height = data.length;
        output += `    ${name} : array[0..${height - 1}] of byte = (\n`;

        for (let i = 0; i < data.length; i += 8) {
            const chunk = data.slice(i, i + 8);
            const hexValues = chunk.map(b => '$' + b.toString(16).toUpperCase().padStart(2, '0'));
            output += '        ' + hexValues.join(', ');
            if (i + 8 < data.length) {
                output += ',\n';
            } else {
                output += ');\n';
            }
        }
        output += '\n';
    });

    output += '\n// Bicycle sprites (18 pixels tall)\n\n';

    Object.keys(sprites.bicycle).forEach(name => {
        const data = sprites.bicycle[name];
        const height = data.length;
        output += `    ${name} : array[0..${height - 1}] of byte = (\n`;

        for (let i = 0; i < data.length; i += 8) {
            const chunk = data.slice(i, i + 8);
            const hexValues = chunk.map(b => '$' + b.toString(16).toUpperCase().padStart(2, '0'));
            output += '        ' + hexValues.join(', ');
            if (i + 8 < data.length) {
                output += ',\n';
            } else {
                output += ');\n';
            }
        }
        output += '\n';
    });

    output += '\n// Enemy sprites (18 pixels tall)\n\n';

    Object.keys(sprites.enemies).forEach(name => {
        const data = sprites.enemies[name];
        const height = data.length;
        output += `    ${name} : array[0..${height - 1}] of byte = (\n`;

        for (let i = 0; i < data.length; i += 8) {
            const chunk = data.slice(i, i + 8);
            const hexValues = chunk.map(b => '$' + b.toString(16).toUpperCase().padStart(2, '0'));
            output += '        ' + hexValues.join(', ');
            if (i + 8 < data.length) {
                output += ',\n';
            } else {
                output += ');\n';
            }
        }
        output += '\n';
    });

    const blob = new Blob([output], { type: 'text/plain' });
    const url = URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url;
    a.download = 'all_sprites.pas';
    a.click();
    URL.revokeObjectURL(url);
}

// Initialize on load
window.addEventListener('load', init);

// Expose functions to global scope for HTML button handlers
window.clearSprite = clearSprite;
window.invertSprite = invertSprite;
window.shiftLeft = shiftLeft;
window.shiftRight = shiftRight;
window.shiftUp = shiftUp;
window.shiftDown = shiftDown;
window.exportCurrentSprite = exportCurrentSprite;
window.exportAllSprites = exportAllSprites;
