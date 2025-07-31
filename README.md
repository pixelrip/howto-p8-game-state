# How to Create a Game State System in Pico-8

This is repo provides one example of how to create a basic game state system in PICO-8. Based on [p8-template](https://github.com/pixelrip/p8-template).

## Prerequisites

1. **Pico-8** - Install from [lexaloffle.com](https://www.lexaloffle.com/pico-8.php)
2. **Python 3.4+** - Required for picotool
3. **picotool** - Install from [GitHub](https://github.com/dansanderson/picotool)
3. **Git** (recommended) - For version control

## Quick Start
   ```bash
   ./scripts/build.sh
   ```
   Load `game-state.p8` in Pico-8 and run it.


## Project Structure

```
project/
├── .vscode                # VS Code settings
├── src/                   # Source code
│   ├── main.lua           # Entry point with _init, _update, _draw
│   └── utils/
│       └── log.lua        # Logging utility
├── assets/                
│       ├── audio.p8       # Audio Data
│       └── sprites.p8     # Spritesheet Data
├── build/                 # Generated files (dev/prod builds)
├── scripts/               # Build automation
├── config/                # Build configuration
└── docs/                  # Documentation
```


## Workflow

- Edit spritesheet in `assets/sprites.p8`
- Edit audio (sfx and patterns) in `assets/audio.p8`
- Build the project with `./scripts/build.sh`
- Load and run the compiled file in Pico-8

## Documentation

See [docs/README.md](docs/README.md) for complete documentation.

