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

## How it Works

If you're coming from a background of procedural programming tutorials like me, you might be used to putting all of your game's logic into the main `_update()` and `_draw()` functions. For a very simple game, this can work, but it quickly gets complicated.

You might end up with code that looks like this:

```lua
function _update()
  if is_on_title_screen then
    -- do title screen stuff
  elseif is_playing then
    -- do gameplay stuff
  elseif is_game_over then
    -- do game over stuff
  end
end
```

This can become a mess of `if/then` statements. A **state machine** is a design pattern that helps us organize this logic into self-contained "states." 

This project demonstrates a simple, object-oriented approach to state management.

### The Core Components

There are two key parts to this system: the **GameState Manager** and the **GameStates** themselves.

1.  **The `GameState` "Template" (`src/states/base/gameStates.lua`)**

    This is a basic "template" or "class" for all of our states. It ensures that every state we create has the same set of functions: `init`, `update`, `draw`, and `exit`. This consistency is what allows the manager to control any state without needing to know the specifics of that state's code.

2.  **The `gameStateManager` (`src/managers/gameStateManager.lua`)**

    This is the "brain" of our state machine. It does a few simple but important things:

      * It keeps track of the `current` active state.
      * It has a `switch()` function that allows us to change from one state to another. When we switch, it tells the *old* state to `exit()` and the *new* state to `init()`.
      * It plugs into PICO-8's main game loop. The main `_update()` and `_draw()` functions in `main.lua` don't have any game logic in them; they just tell the manager to update and draw the *current* state.

### The Game Flow

So, how does it all fit together?

1.  **Initialization (`_init` in `main.lua`)**: When the game starts, we tell the `gameStateManager` about all the possible states by "registering" them (see `setup.lua`). Then, we immediately switch to our starting state: the `"title"` state.

2.  **The Title Screen (`titleState.lua`)**: The `gameStateManager` now holds the `TitleState` object as its `current` state. On every frame, the game's main `_update()` and `_draw()` functions call the `update()` and `draw()` functions of the `TitleState` object. The `titleState.lua` file is completely self-contained; it only has the logic and drawing code for the title screen.

3.  **Switching States**: The `TitleState`'s update function waits for a button press. When the start button is pressed, it doesn't switch the state itself. Instead, it publishes an event called `"start_button_pressed"`.

    > **Note on the Event System**: This project uses a simple event system to allow different parts of the code to communicate without being directly tied together. This is another powerful OOP concept. I'm currently working on another project demonstrating this which I will link soon.

    In `setup.lua`, we have a listener for this event that tells the `gameStateManager` to switch to the `"gameplay"` state. The `gameStateManager` then calls `exit()` on the `TitleState` and `init()` on the `GameplayState`.

4.  **Gameplay and Beyond**: Now the `GameplayState` is active, and its `update()` and `draw()` functions are being called each frame. This process repeats for the entire lifecycle of the game. When the player goes off-screen, the `Player` object publishes a `"player_off_screen"` event, which triggers a switch to the `"gameOver"` state, and so on.

By using this state machine pattern, each part of our game is neatly organized into its own file with a clear purpose. This makes our code easier to read, debug, and expand upon in the future.