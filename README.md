# ToonScape - 0.0.6 (Created by CrypticTM)

A comprehensive single-player RuneScape-inspired game built in C++ using SFML.

## Features

### Core Gameplay
- **Character Creation**: Customize your character's appearance, class, and starting stats
- **Skill System**: 23 skills including combat, gathering, and production skills
- **Combat System**: Turn-based combat with melee, ranged, and magic styles
- **Inventory Management**: 28-slot inventory with item stacking and organization
- **Equipment System**: 13 equipment slots for weapons, armor, and accessories

### World & Environment
- **Open World**: 1000x1000 tile world with various biomes and locations
- **Towns & Cities**: Visit iconic locations like Lumbridge, Varrock, and Falador
- **Dungeons & Arenas**: Challenge yourself in various combat and skill-based areas
- **Dynamic Weather**: Day/night cycle with changing weather conditions
- **Resource Nodes**: Mining, woodcutting, fishing, and farming locations

### Items & Crafting
- **Weapons**: Swords, axes, bows, staves, and more with unique properties
- **Tools**: Specialized tools for gathering and crafting activities
- **Food & Potions**: Consumables for healing and stat boosting
- **Armor**: Defensive equipment with different protection types
- **Crafting**: Create items using gathered materials and skills

### Enemies & Combat
- **Diverse Enemies**: Goblins, orcs, dragons, skeletons, and more
- **AI Behavior**: Intelligent enemy AI with aggro, leashing, and pathfinding
- **Loot System**: Enemy drops with rarity-based item generation
- **Combat Mechanics**: Attack speed, damage calculation, and critical hits

### Skills & Progression
- **Combat Skills**: Attack, Strength, Defence, Hitpoints, Ranged, Prayer, Magic
- **Gathering Skills**: Mining, Woodcutting, Fishing, Farming, Hunter
- **Production Skills**: Smithing, Crafting, Cooking, Herblore, Fletching
- **Support Skills**: Agility, Thieving, Slayer, Runecrafting, Construction

### User Interface
- **Modern UI**: Clean, intuitive interface with smooth animations
- **Inventory Management**: Drag-and-drop item management
- **Skill Interface**: Visual skill progression and experience tracking
- **Map System**: Minimap and world map with location markers
- **Settings Menu**: Customizable graphics, audio, and control options

## Building the Project

### Prerequisites

- **Windows Batch , Windows Terminal**

## Contributing

This is a personal project, but suggestions and feedback are welcome. The project follows these development principles:

- **Clean Code**: Well-structured, readable, and maintainable code
- **Performance**: Efficient algorithms and data structures
- **Modularity**: Clear separation of concerns and reusable components
- **Documentation**: Comprehensive code documentation and comments

## License

This project is for educational and personal use only. It is inspired by RuneScape but is not affiliated with Jagex Ltd. or the official RuneScape game. Please don't sue me Jagex <3 

## Acknowledgments

- **Jagex Ltd.**: For creating the original RuneScape game
- **SFML Team**: For the excellent multimedia library
- **C++ Community**: For the powerful programming language and tools

## Support

If you encounter any issues or have questions:

1. Check the build instructions above
2. Ensure all dependencies are properly installed
3. Verify your compiler supports C++17
4. Check that SFML is properly linked

For development questions or suggestions, feel free to open an issue or discussion.

---

Keeping the old README available here. 

OLD README STARTS BELOW -------->>> 
---
---

--- 
- ~~**CMake**: Version 3.16 or higher~~
- ~~**SFML**: Version 2.5 or higher~~
- ~~**OpenGL**: Compatible graphics drivers~~

### Windows Build Instructions

1. **Install Dependencies**:
   ```bash
   # Install vcpkg (if not already installed)
   git clone https://github.com/Microsoft/vcpkg.git
   cd vcpkg
   ./bootstrap-vcpkg.bat
   
   # Install SFML
   ./vcpkg install sfml:x64-windows
   ./vcpkg integrate install
   ```

2. **Build the Project**:
   ```bash
   mkdir build
   cd build
   cmake .. -DCMAKE_TOOLCHAIN_FILE=[path_to_vcpkg]/scripts/buildsystems/vcpkg.cmake
   cmake --build . --config Release
   ```

### Linux Build Instructions

1. **Install Dependencies**:
   ```bash
   # Ubuntu/Debian
   sudo apt-get update
   sudo apt-get install build-essential cmake libsfml-dev libopengl-dev
   
   # Fedora
   sudo dnf install gcc-c++ cmake SFML-devel mesa-libGL-devel
   
   # Arch Linux
   sudo pacman -S base-devel cmake sfml
   ```

2. **Build the Project**:
   ```bash
   mkdir build
   cd build
   cmake ..
   make -j$(nproc)
   ```

### macOS Build Instructions

1. **Install Dependencies**:
   ```bash
   # Install Homebrew (if not already installed)
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   
   # Install dependencies
   brew install cmake sfml
   ```

2. **Build the Project**:
   ```bash
   mkdir build
   cd build
   cmake ..
   make -j$(sysctl -n hw.ncpu)
   ```

## Project Structure

```
ToonScape/
├── CMakeLists.txt          # Build configuration
├── README.md               # This file
├── include/                # Header files
│   ├── Constants.h         # Game constants and configuration
│   ├── Enums.h            # Game enumerations and types
│   ├── Game.h             # Main game class
│   ├── Player.h           # Player character class
│   ├── Item.h             # Item system classes
│   ├── Inventory.h        # Inventory management
│   ├── Skill.h            # Skill system
│   ├── Enemy.h            # Enemy AI and behavior
│   ├── LoginScreen.h      # Login interface
│   ├── CharacterCreation.h # Character creation interface
│   ├── World.h            # World management
│   ├── UI.h               # User interface system
│   ├── Audio.h            # Audio management
│   ├── Map.h              # Map and navigation
│   ├── Town.h             # Town and city management
│   ├── Arena.h            # Combat arenas
│   ├── SpawnManager.h     # Enemy spawning
│   ├── QuestSystem.h      # Quest management
│   └── SaveSystem.h       # Save/load functionality
├── src/                    # Source files
│   ├── main.cpp           # Entry point
│   ├── Game.cpp           # Main game implementation
│   ├── Player.cpp         # Player implementation
│   ├── Item.cpp           # Item system implementation
│   ├── Inventory.cpp      # Inventory implementation
│   ├── Skill.cpp          # Skill system implementation
│   ├── Enemy.cpp          # Enemy implementation
│   ├── LoginScreen.cpp    # Login screen implementation
│   ├── CharacterCreation.cpp # Character creation implementation
│   ├── World.cpp          # World implementation
│   ├── UI.cpp             # UI implementation
│   ├── Audio.cpp          # Audio implementation
│   ├── Map.cpp            # Map implementation
│   ├── Town.cpp           # Town implementation
│   ├── Arena.cpp          # Arena implementation
│   ├── SpawnManager.cpp   # Spawn manager implementation
│   ├── QuestSystem.cpp    # Quest system implementation
│   └── SaveSystem.cpp     # Save system implementation
└── assets/                 # Game assets
    ├── textures/           # Image textures
    ├── sounds/             # Audio files
    └── fonts/              # Font files
```

## Controls

### General
- **WASD/Arrow Keys**: Move character
- **Shift**: Run/Walk toggle
- **Escape**: Pause menu
- **I**: Open/close inventory
- **M**: Open/close map
- **C**: Open/close character panel
- **K**: Open/close skills panel
- **Q**: Open/close quest log

### Combat
- **Left Click**: Attack enemy
- **Right Click**: Interact with object/enemy
- **1-9**: Use ability/special attack
- **Space**: Auto-attack toggle

### Inventory
- **Left Click**: Select item
- **Right Click**: Use item
- **Drag & Drop**: Move items between slots
- **Shift + Click**: Split stack
- **Ctrl + Click**: Quick equip

## Game Mechanics

### Experience & Leveling
- Skills level from 1 to 99
- Experience follows RuneScape's formula
- Higher levels unlock new abilities and content
- Virtual levels can exceed 99 for certain activities

### Combat System
- Turn-based combat with initiative
- Three combat styles: Melee, Ranged, Magic
- Equipment affects attack and defence bonuses
- Special abilities unlock at higher levels

### Economy
- Gold-based economy system
- Items have varying values based on rarity and utility
- Trading system between players (future multiplayer)
- Grand Exchange style market (planned)

### Quests
- Story-driven quests with multiple objectives
- Skill requirements and item collection
- Rewards include experience, items, and access to new areas
- Quest points system for tracking progress

## Development Status

### Completed
- [x] Project structure and build system
- [x] Core class definitions and architecture
- [x] Basic game framework
- [x] Input handling system
- [x] Resource management system
- [x] Core gameplay implementation
- [x] Graphics and rendering system
- [x] Audio system implementation
- [x] UI system development
- [x] World generation and management
- [x] Enemy AI and combat system
- [x] Skill system implementation
- [x] Quest system
- [x] Save/load functionality

### In Progress
- [ ] Performance optimization
- [ ] Additional content and features

### Planned
- [ ] Multiplayer support
- [ ] Advanced AI behaviors
- [ ] Modding system
- [ ] Mobile port
- [ ] Console ports




**Note**: This is a work in progress. The game is not yet fully playable but contains a solid foundation for a complete RuneScape-inspired experience. I will continue to make updates on this every so often, if you'd like to see more I will eventually have a discord link here with more screencaps + videos of the devlogs // Thanks ! 

