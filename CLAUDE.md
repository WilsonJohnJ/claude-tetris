# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

**Tetris** is a vanilla JavaScript implementation of the classic Tetris game using HTML5 Canvas, CSS3, and no external dependencies or build process. The game is fully playable by simply opening `index.html` in a browser or serving it locally.

## Running the Project

Since there's no build process or package.json:

- **Direct open**: `open index.html` (macOS), `xdg-open index.html` (Linux), `start index.html` (Windows)
- **Local server** (recommended):
  ```bash
  python3 -m http.server 8000    # Python 3
  npx serve .                     # Node.js
  php -S localhost:8000          # PHP
  ```
  Then navigate to `http://localhost:8000`

## Architecture Overview

The codebase consists of three files:

### `game.js` (~300 lines)
Contains all game logic:

- **Game State**: `board`, `current` (active piece), `next` (upcoming piece), `score`, `lines`, `level`, `paused`, `gameOver`
- **Board Model**: 2D array (20 rows × 10 columns) where each cell is `0` (empty) or a color index (1–7)
- **Piece Representation**: Defined in `PIECES` array as 3×3 or 4×4 matrices with numeric color indices
- **Core Functions**:
  - `createBoard()` — Initialize empty game board
  - `collide(shape, ox, oy)` — Check if piece overlaps board bounds or locked blocks
  - `rotateCW(shape)` — Rotate piece 90° clockwise via matrix transposition
  - `tryRotate()` — Attempt rotation with basic wall kicks (offsets: 0, ±1, ±2 columns)
  - `clearLines()` — Remove completed rows, update score/level
  - `ghostY()` — Calculate where piece will land (for ghost piece rendering)
  - `hardDrop()` / `softDrop()` — Instant or accelerated drop with score bonuses
  - `spawn()` — Move next piece to current, generate new next piece
  - `loop(ts)` — Main game loop using `requestAnimationFrame`, handles piece gravity
  - `draw()` — Render board, grid, ghost piece, and current piece
  - `drawNext()` — Render preview of next piece in separate canvas

- **Game Loop**: Accumulates elapsed time; when `dropAccum >= dropInterval`, piece drops one row or locks
- **Scoring**: Uses classic Tetris table `[0, 100, 300, 500, 800]` × level; hard drop adds 2 points per row, soft drop adds 1 point per row
- **Levels & Speed**: Level increases every 10 cleared lines; drop interval decreases from 1000ms, capped at 100ms

### `index.html`
DOM structure:
- Canvas (`#board`) sized 300×600px (10 cols × 20 rows × 30px block size)
- Sidebar panel with score, lines, level display
- Next piece preview canvas (`#next-canvas`)
- Control legend
- Hidden overlay div for pause and game over states

### `style.css`
Visual styling:
- Dark/retro arcade theme (dark backgrounds, monospace fonts)
- Flexbox layout for game container and sidebar
- Backdrop blur filter for overlay
- Color variables for UI consistency

## Key Customization Points

Tunable constants in `game.js`:
- `COLS` (10), `ROWS` (20), `BLOCK` (30px) — Board dimensions and cell size
- `COLORS` array — Color palette per piece type
- `LINE_SCORES` — Points for clearing 1–4 lines simultaneously
- `dropInterval` — Initial drop speed (1000ms)

If changing board dimensions, also update canvas dimensions in `index.html`: `width = COLS × BLOCK`, `height = ROWS × BLOCK`.

## Game Mechanics

- **7 Standard Tetriminos**: I, O, T, S, Z, J, L with fixed rotation matrices
- **Wall Kicks**: Rotation attempts up to ±2 column offsets if initial rotation fails
- **Ghost Piece**: Semi-transparent preview of final position
- **Pause & Resume**: Press P; maintains game state
- **Game Over**: Triggered when spawned piece collides at origin; overlay shows final score with restart button

## Input Handling

Keyboard events in `keydown` listener:
- Arrow Left/Right — Move horizontally
- Arrow Down — Soft drop (accelerated fall)
- Arrow Up or X — Rotate clockwise
- Space — Hard drop (instant placement)
- P — Toggle pause

## Weather Skill

A project-level weather skill is available via `/clima`.

### Usage

```
/clima "La Paz, Bolivia"    # Check weather for a specific location
/clima                      # Check weather for Santa Cruz, Bolivia (default)
```

### Examples

- `/clima` — Default: Santa Cruz, Bolivia
- `/clima "La Paz, Bolivia"` — Weather in La Paz
- `/clima "Madrid, España"` — Weather in Madrid
- `/clima "Nueva York, USA"` — Weather in New York

### Features

✅ No API key required  
✅ Real-time data  
✅ Works for any city worldwide  
✅ ASCII art visualization  
✅ 3-day forecast included  

**Service**: wttr.in | **Script**: `./.claude/scripts/get-weather.sh`
