// TOON-SCAPE - RuneScape Fangame
// Complete singleplayer experience converted to HTML/JavaScript

// Game state
let gameState = 'MAIN_MENU';
let currentLocation = 'LUMBRIDGE';
let gameMode = 'NEWGAME';

// Player data
let player = {
    name: 'TOON-SCAPE Adventurer',
    level: 1,
    maxHP: 10,
    currentHP: 10,
    experience: 0,
    coins: 50,
    inventory: [
        { name: 'Bronze Sword', quantity: 1 },
        { name: 'Wooden Shield', quantity: 1 },
        { name: 'Bread', quantity: 1 },
        { name: 'Health Potion', quantity: 1 }
    ],
    
    // Skills
    attack: 1, strength: 1, defence: 1, hitpoints: 10,
    ranged: 1, magic: 1, woodcutting: 1, fishing: 1,
    mining: 1, cooking: 1, smithing: 1, crafting: 1,
    fletching: 1, herblore: 1, prayer: 1, slayer: 1,
    farming: 1, firemaking: 1, treasure_hunting: 1,
    
    // Housing system
    house_level: 1,
    house_rooms: 'Basic Room',
    house_furniture: 'Wooden Chair',
    house_storage: [], // House storage box (up to 20 items)
    
    // Bank system
    bank_items: [],
    bank_pin: '0000'
};

// Skill experience
let skillXP = {
    attack: 0, strength: 0, defence: 0, hitpoints: 0,
    ranged: 0, magic: 0, woodcutting: 0, fishing: 0,
    mining: 0, cooking: 0, smithing: 0, crafting: 0,
    fletching: 0, herblore: 0, prayer: 0, slayer: 0,
    farming: 0, firemaking: 0, treasure_hunting: 0
};

// Quest status
let quests = {
    cooksAssistant: 0, // 0=available, 1=in progress, 2=completed
    sheepShearer: 0,
    runeMysteries: 0,
    dragonSlayer: 0,
    lostCity: 0,
    restlessGhost: 0,
    impCatcher: 0,
    whiteKnightQuest: 0,
    princeAliRescue: 0,
    piratesTreasure: 0
};

// Combat variables
let enemy = null;
let inCombat = false;

// Game locations
const locations = {
    LUMBRIDGE: 'Lumbridge (Peaceful town)',
    VARROCK: 'Varrock (Major city)',
    FALADOR: 'Falador (Knights\' city)',
    ALKHARID: 'Al Kharid (Desert city)',
    DRAYNOR: 'Draynor Village (Small village)',
    PORTSARIM: 'Port Sarim (Port town)',
    WILDERNESS: 'The Wilderness (Dangerous PvP area)',
    MAGETOWER: 'Mage Tower (Ancient magic studies)'
};

// Shop items by location
const shopItems = {
    LUMBRIDGE: [
        { name: 'Bread', price: 12, type: 'Food' },
        { name: 'Bronze Sword', price: 25, type: 'Weapon' },
        { name: 'Wooden Shield', price: 15, type: 'Armor' },
        { name: 'Fishing Rod', price: 50, type: 'Tool' },
        { name: 'Axe', price: 30, type: 'Tool' },
        { name: 'Pickaxe', price: 40, type: 'Tool' },
        { name: 'Health Potion', price: 35, type: 'Consumable' },
        { name: 'Tinderbox', price: 5, type: 'Tool' },
        { name: 'Clay', price: 10, type: 'Material' },
        { name: 'Leather', price: 20, type: 'Material' },
        { name: 'Rune Essence', price: 20, type: 'Magic' },
        { name: 'Shrimp', price: 15, type: 'Food' },
        { name: 'Sardine', price: 20, type: 'Food' },
        { name: 'Herring', price: 25, type: 'Food' },
        { name: 'Trout', price: 40, type: 'Food' },
        { name: 'Lobster', price: 40, type: 'Food' },
        { name: 'Swordfish', price: 60, type: 'Food' },
        { name: 'Shark', price: 100, type: 'Food' }
    ],
    VARROCK: [
        { name: 'Iron Sword', price: 140, type: 'Weapon' },
        { name: 'Iron Shield', price: 112, type: 'Armor' },
        { name: 'Steel Sword', price: 325, type: 'Weapon' },
        { name: 'Adamant Sword', price: 800, type: 'Weapon' },
        { name: 'Staff of Fire', price: 200, type: 'Magic Weapon' },
        { name: 'Air Rune', price: 5, type: 'Magic' },
        { name: 'Fire Rune', price: 8, type: 'Magic' },
        { name: 'Water Rune', price: 6, type: 'Magic' },
        { name: 'Earth Rune', price: 6, type: 'Magic' },
        { name: 'Chaos Rune', price: 15, type: 'Magic' },
        { name: 'Wizard Hat', price: 100, type: 'Magic Armor' },
        { name: 'Magic Study Book', price: 50, type: 'Study Material' },
        { name: 'Combat Manual', price: 45, type: 'Study Material' },
        { name: 'Crafting Guide', price: 40, type: 'Study Material' },
        { name: 'Cooking Recipe Book', price: 35, type: 'Study Material' },
        { name: 'Health Potion', price: 35, type: 'Consumable' },
        { name: 'Bread', price: 12, type: 'Food' },
        { name: 'Clay', price: 10, type: 'Material' },
        { name: 'Leather', price: 20, type: 'Material' },
        { name: 'Rune Essence', price: 20, type: 'Magic' },
        { name: 'Shrimp', price: 15, type: 'Food' },
        { name: 'Sardine', price: 20, type: 'Food' },
        { name: 'Herring', price: 25, type: 'Food' }
    ]
};

// Wilderness levels and dangers
const wildernessLevels = {
    1: 'Low level - Somewhat safe',
    5: 'Medium risk - Watch out',
    10: 'High risk - Very dangerous',
    15: 'Extreme risk - Deadly area',
    20: 'Maximum risk - Certain death'
};

// Wilderness encounters by level
const wildernessEncounters = {
    1: ['Goblin', 'Giant Rat', 'Chicken', 'Farmer'],
    5: ['Goblin', 'Giant Rat', 'Bandit', 'Dark Wizard'],
    10: ['Bandit', 'Dark Wizard', 'Giant Spider', 'Hill Giant'],
    15: ['Hill Giant', 'Moss Giant', 'Lesser Demon', 'Greater Demon'],
    20: ['Greater Demon', 'Dragon', 'Ancient Dragon', 'Chaos Elemental']
};

// Wilderness special mechanics
let wildernessLevel = 1;
let inWilderness = false;
let pvpEnabled = false;
let wildernessSkull = false;

// Grand Exchange marketplace data
const grandExchangeItems = [
    { name: 'Iron Ore', buyPrice: 50, sellPrice: 45, stock: 1000, type: 'Resource' },
    { name: 'Coal', buyPrice: 30, sellPrice: 25, stock: 2000, type: 'Resource' },
    { name: 'Bronze Bar', buyPrice: 80, sellPrice: 70, stock: 500, type: 'Material' },
    { name: 'Iron Bar', buyPrice: 150, sellPrice: 130, stock: 300, type: 'Material' },
    { name: 'Steel Bar', buyPrice: 300, sellPrice: 280, stock: 200, type: 'Material' },
    { name: 'Rune Essence', buyPrice: 20, sellPrice: 15, stock: 5000, type: 'Magic' },
    { name: 'Air Rune', buyPrice: 5, sellPrice: 4, stock: 10000, type: 'Magic' },
    { name: 'Fire Rune', buyPrice: 8, sellPrice: 7, stock: 8000, type: 'Magic' },
    { name: 'Water Rune', buyPrice: 6, sellPrice: 5, stock: 9000, type: 'Magic' },
    { name: 'Earth Rune', buyPrice: 6, sellPrice: 5, stock: 9000, type: 'Magic' },
    { name: 'Chaos Rune', buyPrice: 15, sellPrice: 13, stock: 3000, type: 'Magic' },
    { name: 'Death Rune', buyPrice: 25, sellPrice: 22, stock: 2000, type: 'Magic' },
    { name: 'Blood Rune', buyPrice: 35, sellPrice: 32, stock: 1500, type: 'Magic' },
    { name: 'Lobster', buyPrice: 40, sellPrice: 35, stock: 1000, type: 'Food' },
    { name: 'Swordfish', buyPrice: 60, sellPrice: 55, stock: 800, type: 'Food' },
    { name: 'Shark', buyPrice: 100, sellPrice: 90, stock: 500, type: 'Food' },
    { name: 'Dragon Bones', buyPrice: 200, sellPrice: 180, stock: 200, type: 'Prayer' },
    { name: 'Willow Logs', buyPrice: 15, sellPrice: 12, stock: 2000, type: 'Resource' },
    { name: 'Maple Logs', buyPrice: 25, sellPrice: 22, stock: 1500, type: 'Resource' },
    { name: 'Yew Logs', buyPrice: 50, sellPrice: 45, stock: 1000, type: 'Resource' },
    { name: 'Shrimp', buyPrice: 15, sellPrice: 12, stock: 2000, type: 'Food' },
    { name: 'Sardine', buyPrice: 20, sellPrice: 17, stock: 1500, type: 'Food' },
    { name: 'Herring', buyPrice: 25, sellPrice: 22, stock: 1200, type: 'Food' },
    { name: 'Trout', buyPrice: 40, sellPrice: 35, stock: 1000, type: 'Food' }
];

// Initialize game
function initGame() {
    loadGame();
    calculateCombatLevel();
    updateUI();
    showMainMenu();
    createSaveMenu();
    createMusicPlayer();
    startBackgroundMusic();
}

// Create save menu (three-dot menu)
function createSaveMenu() {
    // Create the three-dot menu button
    const saveMenuButton = document.createElement('div');
    saveMenuButton.id = 'saveMenuButton';
    saveMenuButton.innerHTML = '⋮';
    saveMenuButton.className = 'save-menu-button';
    saveMenuButton.onclick = toggleSaveMenu;
    
    // Create the save menu dropdown
    const saveMenu = document.createElement('div');
    saveMenu.id = 'saveMenu';
    saveMenu.className = 'save-menu';
    saveMenu.style.display = 'none';
    
    // Add save slots
    for (let i = 1; i <= 3; i++) {
        const saveSlot = document.createElement('div');
        saveSlot.className = 'save-slot';
        saveSlot.innerHTML = `
            <span class="save-slot-label">Save Slot ${i}</span>
            <button class="save-btn" onclick="saveToSlot(${i})">Save</button>
            <button class="load-btn" onclick="loadFromSlot(${i})">Load</button>
            <button class="delete-btn" onclick="deleteSaveSlot(${i})">Delete</button>
        `;
        saveMenu.appendChild(saveSlot);
    }
    
    // Add auto-save option
    const autoSaveOption = document.createElement('div');
    autoSaveOption.className = 'auto-save-option';
    autoSaveOption.innerHTML = `
        <span class="auto-save-label">Auto-save every 5 minutes</span>
        <input type="checkbox" id="autoSaveToggle" onchange="toggleAutoSave()">
    `;
    saveMenu.appendChild(autoSaveOption);
    
    // Add restart game option
    const restartOption = document.createElement('div');
    restartOption.className = 'restart-option';
    restartOption.innerHTML = `
        <span class="restart-label">Restart Game (Reset Progress)</span>
        <button class="restart-btn" onclick="restartGame()">Restart</button>
    `;
    saveMenu.appendChild(restartOption);
    
    // Add to the game container
    const gameContainer = document.getElementById('gameContainer');
    gameContainer.appendChild(saveMenuButton);
    gameContainer.appendChild(saveMenu);
    
    // Load auto-save setting
    const autoSaveEnabled = localStorage.getItem('toonscape_auto_save') === 'true';
    document.getElementById('autoSaveToggle').checked = autoSaveEnabled;
    
    // Start auto-save if enabled
    if (autoSaveEnabled) {
        startAutoSave();
    }
}

// Create music player
function createMusicPlayer() {
    // Create the music button
    const musicButton = document.createElement('div');
    musicButton.id = 'musicButton';
    musicButton.innerHTML = '🎵';
    musicButton.className = 'music-button';
    musicButton.onclick = toggleMusicPlayer;
    
    // Create the music player dropdown
    const musicPlayer = document.createElement('div');
    musicPlayer.id = 'musicPlayer';
    musicPlayer.className = 'music-player';
    musicPlayer.style.display = 'none';
    
    // Add music controls
    musicPlayer.innerHTML = `
        <div class="music-header">
            <h3>🎵 Music Player</h3>
        </div>
        <div class="music-controls">
            <button id="playPauseBtn" onclick="togglePlayPause()">⏸️ Pause</button>
            <button onclick="stopMusic()">⏹️ Stop</button>
            <button onclick="nextTrack()">⏭️ Next</button>
        </div>
        <div class="volume-control">
            <label>Volume: </label>
            <input type="range" id="volumeSlider" min="0" max="100" value="50" onchange="setVolume(this.value)">
            <span id="volumeValue">50%</span>
        </div>
        <div class="current-track">
            <strong>Now Playing:</strong>
            <div id="currentTrackName">Al Kharid Theme</div>
        </div>
        <div class="music-tracks">
            <div class="track-item" onclick="playTrack('alkharid')">
                <span>🏜️ Al Kharid Theme</span>
                <span class="track-duration">2:30</span>
            </div>
            <div class="track-item" onclick="playTrack('combat')">
                <span>⚔️ Combat Theme</span>
                <span class="track-duration">1:45</span>
            </div>
            <div class="track-item" onclick="playTrack('varrock')">
                <span>🏰 Varrock Theme</span>
                <span class="track-duration">3:15</span>
            </div>
            <div class="track-item" onclick="playTrack('wilderness')">
                <span>🌲 Wilderness Theme</span>
                <span class="track-duration">2:55</span>
            </div>
            <div class="track-item" onclick="playTrack('lumbridge')">
                <span>🏘️ Lumbridge Theme</span>
                <span class="track-duration">2:20</span>
            </div>
            <div class="track-item" onclick="playTrack('draynor_manor')">
                <span>🏚️ Draynor Manor Theme</span>
                <span class="track-duration">3:00</span>
            </div>
            <div class="track-item" onclick="playTrack('mage_tower')">
                <span>🔮 Mage Tower Theme</span>
                <span class="track-duration">2:45</span>
            </div>
            <div class="track-item" onclick="playTrack('river_area')">
                <span>🌊 Peaceful River</span>
                <span class="track-duration">2:10</span>
            </div>
        </div>
    `;
    
    // Add to the game container
    const gameContainer = document.getElementById('gameContainer');
    gameContainer.appendChild(musicButton);
    gameContainer.appendChild(musicPlayer);
}

// Toggle save menu visibility
function toggleSaveMenu() {
    const saveMenu = document.getElementById('saveMenu');
    const musicPlayer = document.getElementById('musicPlayer');
    
    // Close music player if open
    if (musicPlayer.style.display === 'block') {
        musicPlayer.style.display = 'none';
    }
    
    if (saveMenu.style.display === 'none') {
        saveMenu.style.display = 'block';
        updateSaveSlotInfo();
    } else {
        saveMenu.style.display = 'none';
    }
}

// Toggle music player visibility
function toggleMusicPlayer() {
    const musicPlayer = document.getElementById('musicPlayer');
    const saveMenu = document.getElementById('saveMenu');
    
    // Close save menu if open
    if (saveMenu.style.display === 'block') {
        saveMenu.style.display = 'none';
    }
    
    if (musicPlayer.style.display === 'none') {
        musicPlayer.style.display = 'block';
    } else {
        musicPlayer.style.display = 'none';
    }
}

// Update save slot information
function updateSaveSlotInfo() {
    for (let i = 1; i <= 3; i++) {
        const saveSlot = document.querySelector(`#saveMenu .save-slot:nth-child(${i})`);
        const saveInfo = localStorage.getItem(`toonscape_save_slot_${i}`);
        
        if (saveInfo) {
            try {
                const data = JSON.parse(saveInfo);
                const saveDate = new Date(data.timestamp);
                const timeAgo = getTimeAgo(saveDate);
                saveSlot.querySelector('.save-slot-label').textContent = `Save Slot ${i} - ${timeAgo}`;
            } catch (e) {
                saveSlot.querySelector('.save-slot-label').textContent = `Save Slot ${i} - Corrupted`;
            }
        } else {
            saveSlot.querySelector('.save-slot-label').textContent = `Save Slot ${i} - Empty`;
        }
    }
}

// Get time ago string
function getTimeAgo(date) {
    const now = new Date();
    const diffMs = now - date;
    const diffMins = Math.floor(diffMs / 60000);
    const diffHours = Math.floor(diffMs / 3600000);
    const diffDays = Math.floor(diffMs / 86400000);
    
    if (diffMins < 1) return 'Just now';
    if (diffMins < 60) return `${diffMins}m ago`;
    if (diffHours < 24) return `${diffHours}h ago`;
    return `${diffDays}d ago`;
}

// Save to specific slot
function saveToSlot(slotNumber) {
    const saveData = {
        gameMode: gameMode,
        currentLocation: currentLocation,
        player: player,
        skillXP: skillXP,
        quests: quests,
        wildernessLevel: wildernessLevel,
        inWilderness: inWilderness,
        pvpEnabled: pvpEnabled,
        wildernessSkull: wildernessSkull,
        timestamp: new Date().toISOString()
    };
    
    localStorage.setItem(`toonscape_save_slot_${slotNumber}`, JSON.stringify(saveData));
    
    // Show save confirmation
    const saveSlot = document.querySelector(`#saveMenu .save-slot:nth-child(${slotNumber})`);
    const originalLabel = saveSlot.querySelector('.save-slot-label').textContent;
    saveSlot.querySelector('.save-slot-label').textContent = `Save Slot ${slotNumber} - Saved!`;
    
    setTimeout(() => {
        updateSaveSlotInfo();
    }, 2000);
    
    displayText(`Game saved to slot ${slotNumber}!`);
}

// Load from specific slot
function loadFromSlot(slotNumber) {
    const saveData = localStorage.getItem(`toonscape_save_slot_${slotNumber}`);
    if (saveData) {
        try {
            const data = JSON.parse(saveData);
            gameMode = data.gameMode || 'NEWGAME';
            currentLocation = data.currentLocation || 'LUMBRIDGE';
            player = data.player || player;
            skillXP = data.skillXP || skillXP;
            quests = data.quests || quests;
            wildernessLevel = data.wildernessLevel || 1;
            inWilderness = data.inWilderness || false;
            pvpEnabled = data.pvpEnabled || false;
            wildernessSkull = data.wildernessSkull || false;
            
            // Load house storage data if it exists
            if (data.player && data.player.house_storage) {
                player.house_storage = data.player.house_storage;
            } else {
                player.house_storage = [];
            }
            
            // Migrate old inventory format if needed
            migrateInventoryFormat();
            
            updateUI();
            displayText(`Game loaded from slot ${slotNumber}!`);
            
            // Close save menu and return to main menu
            document.getElementById('saveMenu').style.display = 'none';
            showMainMenu();
        } catch (e) {
            displayText(`Error loading save slot ${slotNumber}: ${e.message}`);
        }
    } else {
        displayText(`Save slot ${slotNumber} is empty!`);
    }
}

// Delete save slot
function deleteSaveSlot(slotNumber) {
    if (confirm(`Are you sure you want to delete save slot ${slotNumber}?`)) {
        localStorage.removeItem(`toonscape_save_slot_${slotNumber}`);
        updateSaveSlotInfo();
        displayText(`Save slot ${slotNumber} deleted!`);
    }
}

// Toggle auto-save
function toggleAutoSave() {
    const autoSaveEnabled = document.getElementById('autoSaveToggle').checked;
    localStorage.setItem('toonscape_auto_save', autoSaveEnabled);
    
    if (autoSaveEnabled) {
        startAutoSave();
        displayText('Auto-save enabled! Game will save every 5 minutes.');
    } else {
        stopAutoSave();
        displayText('Auto-save disabled!');
    }
}

// Auto-save functionality
let autoSaveInterval = null;

// Music system variables
let currentAudio = null;
let isMusicPlaying = false;
let currentTrack = 'alkharid';
let musicVolume = 0.5;
let musicTracks = {
    alkharid: { file: 'assets/sounds/Al Kharid.wav', name: 'Al Kharid Theme' },
    combat: { file: 'assets/sounds/Attack2.wav', name: 'Combat Theme' },
    varrock: { file: 'assets/sounds/Castlewars_Cryptic_Version.mp3', name: 'Varrock Theme' },
    wilderness: { file: 'assets/sounds/Wilderness.mp3', name: 'Wilderness Theme' },
    lumbridge: { file: 'assets/sounds/lumbridge_theme.wav', name: 'Lumbridge Theme' },
    draynor_manor: { file: 'assets/sounds/draynor_manor.mp3', name: 'Draynor Manor Theme' },
    mage_tower: { file: 'assets/sounds/mage_tower.mp3', name: 'Mage Tower Theme' },
    river_area: { file: 'assets/sounds/river_area.mp3', name: 'Peaceful River' }
};

// Sound effects for specific events
let soundEffects = {
    death: 'assets/sounds/death_soundA.mp3',
    treasure: 'assets/sounds/found_treasure.mp3',
    pk_stole: 'assets/sounds/pk_stole_item.mp3',
    combat_pk: 'assets/sounds/combat_pk_encounter.mp3'
};

function startAutoSave() {
    if (autoSaveInterval) {
        clearInterval(autoSaveInterval);
    }
    
    autoSaveInterval = setInterval(() => {
        // Auto-save to slot 1
        saveToSlot(1);
        displayText('Auto-save completed!');
    }, 300000); // 5 minutes
}

function stopAutoSave() {
    if (autoSaveInterval) {
        clearInterval(autoSaveInterval);
        autoSaveInterval = null;
    }
}

// Restart game function
function restartGame() {
    if (confirm('Are you sure you want to restart the game? This will:\n\n• Reset all player progress\n• Clear all skills and levels\n• Remove all items and coins\n• Reset all quests\n• Cannot be undone!\n\nClick OK to restart or Cancel to keep playing.')) {
        // Stop auto-save
        stopAutoSave();
        
        // Reset all game data to initial values
        gameState = 'MAIN_MENU';
        currentLocation = 'LUMBRIDGE';
        gameMode = 'NEWGAME';
        
        // Reset player data
        player = {
            name: 'TOON-SCAPE Adventurer',
            level: 1,
            maxHP: 10,
            currentHP: 10,
            experience: 0,
            coins: 50,
            inventory: [
                { name: 'Bronze Sword', quantity: 1 },
                { name: 'Wooden Shield', quantity: 1 },
                { name: 'Bread', quantity: 1 },
                { name: 'Health Potion', quantity: 1 }
            ],
            
            // Skills
            attack: 1, strength: 1, defence: 1, hitpoints: 10,
            ranged: 1, magic: 1, woodcutting: 1, fishing: 1,
            mining: 1, cooking: 1, smithing: 1, crafting: 1,
            fletching: 1, herblore: 1, prayer: 1, slayer: 1,
            farming: 1, firemaking: 1, treasure_hunting: 1,
            
            // Housing system
            house_level: 1,
            house_rooms: 'Basic Room',
            house_furniture: 'Wooden Chair',
            house_storage: [],
            
            // Bank system
            bank_items: [],
            bank_pin: '0000'
        };
        
        // Reset skill experience
        skillXP = {
            attack: 0, strength: 0, defence: 0, hitpoints: 0,
            ranged: 0, magic: 0, woodcutting: 0, fishing: 0,
            mining: 0, cooking: 0, smithing: 0, crafting: 0,
            fletching: 0, herblore: 0, prayer: 0, slayer: 0,
            farming: 0, firemaking: 0, treasure_hunting: 0
        };
        
        // Reset quests
        quests = {
            cooksAssistant: 0, sheepShearer: 0, runeMysteries: 0,
            dragonSlayer: 0, lostCity: 0, restlessGhost: 0,
            impCatcher: 0, whiteKnightQuest: 0, princeAliRescue: 0,
            piratesTreasure: 0
        };
        
        // Reset wilderness
        wildernessLevel = 1;
        inWilderness = false;
        pvpEnabled = false;
        wildernessSkull = false;
        
        // Clear all save slots
        localStorage.removeItem('toonscape_save_slot_1');
        localStorage.removeItem('toonscape_save_slot_2');
        localStorage.removeItem('toonscape_save_slot_3');
        localStorage.removeItem('toonscape_save');
        
        // Clear auto-save setting
        localStorage.removeItem('toonscape_auto_save');
        
        // Update UI
        updateUI();
        
        // Show restart confirmation
        clearOutput();
        clearOptions();
        displayText('========================================');
        displayText('         GAME RESTARTED!');
        displayText('========================================');
        displayText('');
        displayText('All progress has been reset!');
        displayText('You are now starting fresh with:');
        displayText('• Level 1 in all skills');
        displayText('• 50 starting coins');
        displayText('• Basic starter equipment');
        displayText('• All quests available again');
        displayText('');
        displayText('Welcome back to TOON-SCAPE!');
        displayText('');
        
        addOption('Start New Adventure', showMainMenu);
        
        // Update save slot info
        updateSaveSlotInfo();
        
        // Reset auto-save toggle
        document.getElementById('autoSaveToggle').checked = false;
        
        // Reset music to default
        if (currentAudio) {
            currentAudio.pause();
            currentAudio = null;
        }
        isMusicPlaying = false;
        currentTrack = 'lumbridge';
        playLocationMusic();
    }
}

// Music control functions
function startBackgroundMusic() {
    // Load music settings from localStorage
    const savedVolume = localStorage.getItem('toonscape_music_volume');
    if (savedVolume) {
        musicVolume = parseFloat(savedVolume);
        document.getElementById('volumeSlider').value = musicVolume * 100;
        document.getElementById('volumeValue').textContent = Math.round(musicVolume * 100) + '%';
    }
    
    // Start with appropriate music for current location
    playLocationMusic();
}

function playLocationMusic() {
    if (inCombat) {
        playTrack('combat');
    } else {
        switch(currentLocation) {
            case 'ALKHARID':
                playTrack('alkharid');
                break;
            case 'VARROCK':
                playTrack('varrock');
                break;
            case 'WILDERNESS':
                playTrack('wilderness');
                break;
            case 'MAGETOWER':
                playTrack('mage_tower');
                break;
            case 'LUMBRIDGE':
            default:
                playTrack('lumbridge');
                break;
        }
    }
}

function playTrack(trackName) {
    if (currentAudio) {
        currentAudio.pause();
        currentAudio = null;
    }
    
    if (trackName && musicTracks[trackName]) {
        currentAudio = new Audio(musicTracks[trackName].file);
        currentAudio.volume = musicVolume;
        currentAudio.loop = true;
        
        currentAudio.play().then(() => {
            isMusicPlaying = true;
            currentTrack = trackName;
            updateMusicUI();
            document.getElementById('playPauseBtn').textContent = '⏸️ Pause';
        }).catch(error => {
            console.log('Error playing music:', error);
        });
    }
}

function togglePlayPause() {
    if (currentAudio) {
        if (isMusicPlaying) {
            currentAudio.pause();
            isMusicPlaying = false;
            document.getElementById('playPauseBtn').textContent = '▶️ Play';
        } else {
            currentAudio.play();
            isMusicPlaying = true;
            document.getElementById('playPauseBtn').textContent = '⏸️ Pause';
        }
    }
}

function stopMusic() {
    if (currentAudio) {
        currentAudio.pause();
        currentAudio = null;
        isMusicPlaying = false;
        currentTrack = '';
        updateMusicUI();
        document.getElementById('playPauseBtn').textContent = '▶️ Play';
    }
}

function nextTrack() {
    const trackNames = Object.keys(musicTracks);
    const currentIndex = trackNames.indexOf(currentTrack);
    const nextIndex = (currentIndex + 1) % trackNames.length;
    playTrack(trackNames[nextIndex]);
}

function setVolume(value) {
    musicVolume = value / 100;
    if (currentAudio) {
        currentAudio.volume = musicVolume;
    }
    document.getElementById('volumeValue').textContent = value + '%';
    localStorage.setItem('toonscape_music_volume', musicVolume);
}

function updateMusicUI() {
    if (currentTrack && musicTracks[currentTrack]) {
        document.getElementById('currentTrackName').textContent = musicTracks[currentTrack].name;
    } else {
        document.getElementById('currentTrackName').textContent = 'No track playing';
    }
}

// Sound effect functions
function playSoundEffect(soundType) {
    if (soundEffects[soundType]) {
        const audio = new Audio(soundEffects[soundType]);
        audio.volume = musicVolume * 0.7; // Sound effects slightly quieter than music
        audio.play().catch(error => {
            console.log('Error playing sound effect:', error);
        });
    }
}

// Function to play river area music specifically
function playRiverAreaMusic() {
    playTrack('river_area');
}

// Calculate combat level
function calculateCombatLevel() {
    const combatLevel = Math.floor((player.attack + player.strength + player.defence + player.hitpoints + player.ranged + player.magic) / 6);
    return combatLevel;
}

// Calculate total level
function calculateTotalLevel() {
    const skillNames = ['attack', 'strength', 'defence', 'hitpoints', 'ranged', 'magic', 'woodcutting', 'fishing', 'mining', 'cooking', 'smithing', 'crafting', 'fletching', 'herblore', 'prayer', 'slayer', 'farming', 'firemaking', 'treasure_hunting'];
    return skillNames.reduce((sum, skill) => sum + player[skill], 0);
}

// Update UI elements
function updateUI() {
    document.getElementById('locationInfo').textContent = `Location: ${locations[currentLocation]}`;
    document.getElementById('playerLevel').textContent = calculateTotalLevel();
    document.getElementById('playerHP').textContent = `${player.currentHP}/${player.maxHP}`;
    document.getElementById('combatLevel').textContent = calculateCombatLevel();
    document.getElementById('playerCoins').textContent = player.coins;
}

// Display text in game output
function displayText(text) {
    const gameOutput = document.getElementById('gameOutput');
    gameOutput.textContent += text + '\n';
    gameOutput.scrollTop = gameOutput.scrollTop + 1000;
}

// Clear game output
function clearOutput() {
    document.getElementById('gameOutput').textContent = '';
}

// Clear game options
function clearOptions() {
    document.getElementById('gameOptions').innerHTML = '';
}

// Add option button
function addOption(text, onClick, className = '') {
    const gameOptions = document.getElementById('gameOptions');
    const button = document.createElement('button');
    button.textContent = text;
    button.className = `option-button ${className}`;
    button.onclick = onClick;
    gameOptions.appendChild(button);
}

// Main menu
function showMainMenu() {
    gameState = 'MAIN_MENU';
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         TOON-SCAPE MAIN MENU');
    displayText('========================================');
    displayText('');
    displayText(`Location: ${currentLocation}`);
    displayText(`Combat Level: ${calculateCombatLevel()} (Player Level: ${calculateTotalLevel()})`);
    displayText(`Hitpoints: ${player.currentHP}/${player.maxHP}`);
    displayText(`Gold: ${player.coins} coins`);
    displayText('');
    displayText('What would you like to do?');
    displayText('');
    displayText('========================================');
    displayText('         MAIN MENU');
    displayText('========================================');
    displayText('');
    
    addOption('View Character Stats', showCharacter);
    addOption('Check Skills', showSkills);
    addOption('Open Inventory', showInventory);
    addOption('Look Around / Explore', exploreArea);
    addOption('Combat Training', combatTraining);
    addOption('Visit Local Shop', visitShop);
    addOption('Train Skills', trainSkills);
    addOption('Quest Journal', showQuests);
    addOption('Quest Hub (Accept New Quests)', showQuestHub);
    
    // Add location-specific options
    if (currentLocation === 'LUMBRIDGE') {
        addOption('Player House', showPlayerHouse);
        addOption('Crafting Workshop', showCraftingWorkshop);
        addOption('Bank', showBank);
    } else if (currentLocation === 'VARROCK') {
        addOption('Grand Exchange (GE)', visitGrandExchange);
        addOption('Crafting Workshop', showCraftingWorkshop);
        addOption('Bank', showBank);
    } else if (currentLocation === 'FALADOR') {
        addOption('Crafting Workshop', showCraftingWorkshop);
        addOption('Bank', showBank);
    } else if (currentLocation === 'ALKHARID') {
        addOption('Crafting Workshop', showCraftingWorkshop);
        addOption('Bank', showBank);
    } else if (currentLocation === 'MAGETOWER') {
        addOption('Magic Shop', showMagicShop);
        addOption('Chat System', showChatSystem);
        addOption('Rune Crafting', showRuneCrafting);
    }
    
    // Add Wilderness option if not already there
    if (currentLocation !== 'WILDERNESS') {
        addOption('Enter the Wilderness (Dangerous!)', enterWilderness);
    }
    
    // Quick access travel button
    addOption('Use a lodestone', travelMenu, 'quick-access');
    
    // Save button removed - replaced with three-dot menu in top corner
}

// Character stats
function showCharacter() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         CHARACTER STATS');
    displayText('========================================');
    displayText('');
    displayText(`Name: ${player.name}`);
    displayText(`Combat Level: ${calculateCombatLevel()}`);
    displayText(`Total Level: ${calculateTotalLevel()}`);
    displayText('');
    displayText(`Hitpoints: ${player.currentHP}/${player.maxHP}`);
    displayText(`Total Experience: ${player.experience} XP`);
    displayText('');
    displayText('Combat Stats:');
    displayText(`Attack: ${player.attack}`);
    displayText(`Strength: ${player.strength}`);
    displayText(`Defence: ${player.defence}`);
    displayText(`Hitpoints: ${player.hitpoints}`);
    displayText(`Ranged: ${player.ranged}`);
    displayText(`Magic: ${player.magic}`);
    displayText('');
    
    addOption('Back to Main Menu', showMainMenu, 'back');
}

// Skills display
function showSkills() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('           SKILLS OVERVIEW');
    displayText('========================================');
    displayText('');
    displayText('Combat Skills:');
    displayText(`Attack: ${player.attack} (${skillXP.attack}/${player.attack * 100} XP)`);
    displayText(`Strength: ${player.strength} (${skillXP.strength}/${player.strength * 100} XP)`);
    displayText(`Defence: ${player.defence} (${skillXP.defence}/${player.defence * 100} XP)`);
    displayText(`Hitpoints: ${player.hitpoints} (${skillXP.hitpoints}/${player.hitpoints * 100} XP)`);
    displayText(`Ranged: ${player.ranged} (${skillXP.ranged}/${player.ranged * 100} XP)`);
    displayText(`Magic: ${player.magic} (${skillXP.magic}/${player.magic * 100} XP)`);
    displayText('');
    displayText('Gathering Skills:');
    displayText(`Woodcutting: ${player.woodcutting} (${skillXP.woodcutting}/${player.woodcutting * 100} XP)`);
    displayText(`Fishing: ${player.fishing} (${skillXP.fishing}/${player.fishing * 100} XP)`);
    displayText(`Mining: ${player.mining} (${skillXP.mining}/${player.mining * 100} XP)`);
    displayText(`Treasure Hunting: ${player.treasure_hunting} (${skillXP.treasure_hunting}/${player.treasure_hunting * 100} XP)`);
    displayText('');
    displayText('Artisan Skills:');
    displayText(`Cooking: ${player.cooking} (${skillXP.cooking}/${player.cooking * 100} XP)`);
    displayText(`Smithing: ${player.smithing} (${skillXP.smithing}/${player.smithing * 100} XP)`);
    displayText(`Crafting: ${player.crafting} (${skillXP.crafting}/${player.crafting * 100} XP)`);
    displayText(`Fletching: ${player.fletching} (${skillXP.fletching}/${player.fletching * 100} XP)`);
    displayText(`Herblore: ${player.herblore} (${skillXP.herblore}/${player.herblore * 100} XP)`);
    displayText('');
    displayText('Support Skills:');
    displayText(`Prayer: ${player.prayer} (${skillXP.prayer}/${player.prayer * 100} XP)`);
    displayText(`Slayer: ${player.slayer} (${skillXP.slayer}/${player.slayer * 100} XP)`);
    displayText(`Farming: ${player.farming} (${skillXP.farming}/${player.farming * 100} XP)`);
    displayText(`Firemaking: ${player.firemaking} (${skillXP.firemaking}/${player.firemaking * 100} XP)`);
    displayText('');
    
    addOption('Back to Main Menu', showMainMenu, 'back');
}

// Inventory display
function showInventory() {
    clearOutput();
    clearOptions();
    
    displayText('Your Inventory:');
    displayText('');
    
    if (player.inventory.length === 0) {
        displayText('Your inventory is empty.');
    } else {
        player.inventory.forEach((item, index) => {
            if (item.quantity > 1) {
                displayText(`${index + 1}. ${item.name} (${item.quantity})`);
            } else {
                displayText(`${index + 1}. ${item.name}`);
            }
        });
        displayText('');
        const totalItems = player.inventory.reduce((total, item) => total + item.quantity, 0);
        displayText(`Inventory slots: ${player.inventory.length}/28 used (${totalItems} total items)`);
    }
    
    displayText('');
    displayText(`Gold Coins: ${player.coins}`);
    displayText('');
    
    addOption('Use Item', useItemFromInventory);
    addOption('Sort by Name', () => { sortInventory('name'); showInventory(); });
    addOption('Sort by Quantity', () => { sortInventory('quantity'); showInventory(); });
    addOption('Sort by Type', () => { sortInventory('type'); showInventory(); });
    addOption('Back to Main Menu', showMainMenu, 'back');
}

// Explore area
function exploreArea() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText(`         EXPLORING ${currentLocation}`);
    displayText('========================================');
    displayText('');
    
    if (currentLocation === 'LUMBRIDGE') {
        displayText('You explore the peaceful town of Lumbridge.');
        displayText('');
        displayText('You see:');
        displayText('1. The castle - Maybe the Duke needs help?');
        displayText('2. The church - Prayer training available');
        displayText('3. The windmill - Strange grinding sounds');
        displayText('4. The river - Good fishing spot');
        displayText('5. The forest - Trees waiting to be cut');
        displayText('6. Chicken coop - You hear clucking sounds');
        displayText('7. Dairy farm - Cows mooing in the distance');
        displayText('8. Mining site - Rocks and ores nearby');
        displayText('9. Lumbridge Catacombs - Underground dungeon');
        displayText('10. Deep Swamp Dungeon - Dangerous swamp lair');
        displayText('11. Random encounter');
        displayText('');
        
        addOption('Visit Castle', exploreCastle);
        addOption('Visit Church', exploreChurch);
        addOption('Visit Windmill', exploreWindmill);
        addOption('Visit River', exploreRiver);
        addOption('Visit Forest', exploreForest);
        addOption('Visit Chicken Coop', exploreChickenCoop);
        addOption('Visit Dairy Farm', exploreDairyFarm);
        addOption('Visit Mining Site', exploreMiningSite);
        addOption('Enter Catacombs', enterCatacombs);
        addOption('Enter Swamp Dungeon', enterSwampDungeon);
        addOption('Random Encounter', randomEncounter);
        addOption('Back to Main Menu', showMainMenu, 'back');
    } else if (currentLocation === 'VARROCK') {
        displayText('You explore the bustling city of Varrock.');
        displayText('');
        displayText('You see:');
        displayText('1. Grand Exchange - Trade with other players');
        displayText('2. Varrock Castle - Royal residence');
        displayText('3. Varrock Museum - Ancient artifacts');
        displayText('4. Varrock Palace - Government building');
        displayText('5. Varrock Square - Central marketplace');
        displayText('6. Varrock Church - Prayer training');
        displayText('7. Varrock Sewers - Underground tunnels');
        displayText('8. Varrock Graveyard - Restless spirits');
        displayText('9. Varrock Library - Study materials');
        displayText('10. Varrock Bank - Store your valuables');
        displayText('11. Random encounter');
        displayText('');
        
        addOption('Visit Grand Exchange', visitGrandExchange);
        addOption('Visit Castle', exploreVarrockCastle);
        addOption('Visit Museum', exploreVarrockMuseum);
        addOption('Visit Palace', exploreVarrockPalace);
        addOption('Visit Square', exploreVarrockSquare);
        addOption('Visit Church', exploreVarrockChurch);
        addOption('Enter Sewers', enterVarrockSewers);
        addOption('Visit Graveyard', exploreVarrockGraveyard);
        addOption('Visit Library', exploreVarrockLibrary);
        addOption('Visit Bank', visitVarrockBank);
        addOption('Random Encounter', randomEncounter);
        addOption('Back to Main Menu', showMainMenu, 'back');
    } else if (currentLocation === 'WILDERNESS') {
        displayText('You venture into the dangerous Wilderness...');
        displayText(`Current Wilderness Level: ${wildernessLevel}`);
        displayText(`Risk Level: ${wildernessLevels[wildernessLevel]}`);
        displayText('');
        displayText('⚠️  WARNING: You are now in the Wilderness! ⚠️');
        displayText('• PvP is enabled - other players can attack you');
        displayText('• Death means losing items and coins');
        displayText('• Higher levels = more dangerous enemies');
        displayText('• You can be skulled (lose everything on death)');
        displayText('');
        displayText('What would you like to do?');
        displayText('');
        
        addOption('Change Wilderness Level', changeWildernessLevel);
        addOption('Search for Resources', searchWildernessResources);
        addOption('Hunt for Rare Items', huntRareItems);
        addOption('Fight Wilderness Creatures', fightWildernessCreatures);
        addOption('Return to Safety', returnFromWilderness);
        addOption('Back to Main Menu', showMainMenu, 'back');
    } else {
        displayText('This area is under development.');
        addOption('Back to Main Menu', showMainMenu, 'back');
    }
}

// Castle exploration
function exploreCastle() {
    clearOutput();
    clearOptions();
    
    displayText('You approach Lumbridge Castle...');
    displayText('You see a busy kitchen area nearby.');
    displayText('A stressed baker is frantically working.');
    displayText('');
    
    if (quests.cooksAssistant === 0) {
        displayText('The baker looks at you desperately.');
        displayText('"Oh no! I\'ve run out of ingredients for the Duke\'s birthday cake!"');
        displayText('"I need an egg, a pot of flour, and a bucket of milk."');
        displayText('"Can you help me find these items?"');
        displayText('');
        
        addOption('Yes, I\'ll help you', startCooksAssistant);
        addOption('No, I\'m busy right now', exploreArea);
    } else if (quests.cooksAssistant === 1) {
        displayText('"Have you found all the ingredients yet?"');
        displayText('"I still need: Egg, Flour, and Milk"');
        displayText('');
        
        addOption('Back to exploring', exploreArea);
    } else {
        displayText('"Thank you again for helping me!"');
        displayText('"The Duke\'s birthday cake was a success!"');
        displayText('');
        
        addOption('Back to exploring', exploreArea);
    }
}

// Start Cook's Assistant quest
function startCooksAssistant() {
    quests.cooksAssistant = 1;
    displayText('');
    displayText('"Wonderful! Please find me:"');
    displayText('- An egg (from the chicken coop)');
    displayText('- A pot of flour (from the windmill)');
    displayText('- A bucket of milk (from the dairy farm)');
    displayText('');
    displayText('The Cook\'s Assistant quest has begun!');
    displayText('');
    
    addOption('Back to exploring', exploreArea);
}

// Church exploration
function exploreChurch() {
    clearOutput();
    clearOptions();
    
    displayText('You enter the Lumbridge Church...');
    displayText('Father Aereck greets you warmly.');
    displayText('You gained 15 Prayer experience!');
    
    skillXP.prayer += 15;
    player.experience += 15;
    checkLevelUp('prayer', skillXP.prayer);
    updateUI();
    
    addOption('Back to exploring', exploreArea);
}

// Windmill exploration
function exploreWindmill() {
    clearOutput();
    clearOptions();
    
    displayText('You approach the windmill...');
    displayText('You hear grinding sounds from inside.');
    displayText('This looks like a good place to train Cooking!');
    displayText('');
    
    addOption('Go inside to get flour', getFlour);
    addOption('Back to exploring', exploreArea);
}

// Get flour
function getFlour() {
    if (!hasItem('Pot of Flour')) {
        displayText('You enter the windmill...');
        displayText('You find sacks of flour ready for use.');
        displayText('You take a Pot of Flour! (+Quest item)');
        addItemToInventory('Pot of Flour');
        updateUI();
    } else {
        displayText('You already have flour for your quest.');
    }
    
    addOption('Back to exploring', exploreArea);
}

// River exploration
function exploreRiver() {
    clearOutput();
    clearOptions();
    
    // Play river area music
    playRiverAreaMusic();
    
    displayText('You walk to the river...');
    displayText('Perfect fishing spot! The water looks calm.');
    displayText('You could catch some fish here.');
    displayText('');
    
    if (hasItem('Fishing Rod')) {
        displayText('You have a fishing rod and can fish here!');
        displayText('');
        addOption('Go Fishing', goFishing);
    } else {
        displayText('You need a fishing rod to fish here.');
        displayText('Visit a shop to buy one.');
    }
    
    addOption('Back to exploring', exploreArea);
}

// Go fishing
function goFishing() {
    clearOutput();
    clearOptions();
    
    displayText('You cast your fishing rod into the river...');
    displayText('The water ripples as you wait for a bite...');
    
    // Fishing success based on fishing level
    const fishingSuccess = Math.random() < (0.4 + player.fishing * 0.03);
    
    if (fishingSuccess) {
        const fishType = Math.random();
        let fishName, xp;
        
        if (fishType < 0.5) {
            fishName = 'Shrimp';
            xp = 25;
        } else if (fishType < 0.8) {
            fishName = 'Sardine';
            xp = 30;
        } else if (fishType < 0.95) {
            fishName = 'Herring';
            xp = 35;
        } else {
            fishName = 'Trout';
            xp = 50;
        }
        
        displayText(`You catch a ${fishName}!`);
        addItemToInventory(fishName);
        skillXP.fishing += xp;
        player.experience += xp;
        checkLevelUp('fishing', skillXP.fishing);
        updateUI();
        
        // Play treasure sound for catching fish
        playSoundEffect('treasure');
        
        displayText(`You gained ${xp} Fishing experience!`);
    } else {
        displayText('Your fishing rod twitches but you don\'t catch anything.');
        displayText('Better luck next time!');
        
        // Still get some experience for trying
        skillXP.fishing += 5;
        player.experience += 5;
        checkLevelUp('fishing', skillXP.fishing);
        updateUI();
    }
    
    displayText('');
    addOption('Fish Again', goFishing);
    addOption('Back to River', exploreRiver);
}

// Forest exploration
function exploreForest() {
    clearOutput();
    clearOptions();
    
    displayText('You enter the Lumbridge forest...');
    displayText('Many trees surround you, perfect for woodcutting.');
    displayText('You see some low-level trees you could practice on.');
    displayText('');
    
    addOption('Back to exploring', exploreArea);
}

// Chicken coop exploration
function exploreChickenCoop() {
    clearOutput();
    clearOptions();
    
    displayText('You approach the chicken coop...');
    displayText('You see several chickens clucking around.');
    
    if (!hasItem('Egg')) {
        displayText('One chicken seems to have laid an egg!');
        displayText('You found an Egg! (+Quest item)');
        addItemToInventory('Egg');
        
        // Play treasure sound for finding quest item
        playSoundEffect('treasure');
        
        updateUI();
    } else {
        displayText('You already have an egg for your quest.');
    }
    
    addOption('Back to exploring', exploreArea);
}

// Dairy farm exploration
function exploreDairyFarm() {
    clearOutput();
    clearOptions();
    
    displayText('You approach the dairy farm...');
    displayText('You see cows grazing peacefully.');
    
    if (!hasItem('Bucket of Milk')) {
        displayText('You notice fresh milk in a bucket nearby.');
        displayText('You found a Bucket of Milk! (+Quest item)');
        addItemToInventory('Bucket of Milk');
        updateUI();
    } else {
        displayText('You already have milk for your quest.');
    }
    
    addOption('Back to exploring', exploreArea);
}

// Mining site exploration
function exploreMiningSite() {
    clearOutput();
    clearOptions();
    
    displayText('You approach the mining site...');
    displayText('You see various rocks and ores that can be mined.');
    
    if (hasItem('Pickaxe')) {
        displayText('You start mining...');
        const success = Math.random() < (0.4 + player.mining * 0.03);
        
        if (success) {
            const oreType = Math.random();
            let oreName, xp;
            
            if (oreType < 0.5) {
                oreName = 'Copper Ore';
                xp = 25;
            } else if (oreType < 0.8) {
                oreName = 'Tin Ore';
                xp = 25;
            } else if (oreType < 0.95) {
                oreName = 'Iron Ore';
                xp = 35;
            } else {
                oreName = 'Coal';
                xp = 50;
            }
            
            displayText(`You successfully mine some ${oreName}!`);
            addItemToInventory(oreName);
            skillXP.mining += xp;
            player.experience += xp;
            checkLevelUp('mining', skillXP.mining);
            updateUI();
        } else {
            displayText('Your pickaxe slips and you fail to mine anything.');
        }
    } else {
        displayText('You need a pickaxe to mine!');
        displayText('Visit a shop to buy one.');
    }
    
    addOption('Back to exploring', exploreArea);
}

// Enter catacombs
function enterCatacombs() {
    clearOutput();
    clearOptions();
    
    displayText('You approach the entrance to the Lumbridge Catacombs...');
    displayText('Dark tunnels lead deep underground.');
    displayText('This dungeon is dangerous - are you sure you want to enter?');
    displayText('');
    
    addOption('Yes, enter the catacombs', () => {
        displayText('You enter the catacombs...');
        displayText('This area is under development.');
        addOption('Back to exploring', exploreArea);
    });
    addOption('No, stay on the surface', exploreArea);
}

// Enter swamp dungeon
function enterSwampDungeon() {
    clearOutput();
    clearOptions();
    
    displayText('You venture into the murky swamp...');
    displayText('You find the entrance to a hidden dungeon.');
    displayText('This place looks extremely dangerous!');
    displayText('');
    
    addOption('Yes, enter the deep swamp dungeon', () => {
        displayText('You enter the swamp dungeon...');
        displayText('This area is under development.');
        addOption('Back to exploring', exploreArea);
    });
    addOption('No, retreat to safety', exploreArea);
}

// Random encounter
function randomEncounter() {
    clearOutput();
    clearOptions();
    
    const encounter = Math.floor(Math.random() * 4);
    
    if (encounter === 0) {
        startCombat('Goblin', 1, 10, 1, 1, 'Small Dagger');
    } else if (encounter === 1) {
        startCombat('Giant Rat', 1, 8, 1, 0, 'Teeth and Claws');
    } else if (encounter === 2) {
        startCombat('Chicken', 1, 3, 0, 0, 'Peck');
    } else {
        displayText('You find a coin on the ground!');
        player.coins += 1;
        updateUI();
        
        // Play treasure sound for finding items
        playSoundEffect('treasure');
        
        addOption('Back to exploring', exploreArea);
    }
}

// Combat training
function combatTraining() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('        COMBAT TRAINING GROUND');
    displayText('========================================');
    displayText('');
    displayText('You enter the Lumbridge Combat Training area.');
    displayText('');
    displayText('What would you like to train against?');
    displayText('');
    
    addOption('Attack Training Dummy (Safe training)', () => trainingDummy('attack'));
    addOption('Strength Training Dummy (Safe training)', () => trainingDummy('strength'));
    addOption('Defence Training Dummy (Safe training)', () => trainingDummy('defence'));
    addOption('Fight Goblins (Low level combat)', () => startCombat('Goblin', 1, 10, 1, 1, 'Small Dagger'));
    addOption('Fight Giant Rats (Easy combat)', () => startCombat('Giant Rat', 1, 8, 1, 0, 'Teeth and Claws'));
    addOption('Fight Chickens (Very easy)', () => startCombat('Chicken', 1, 3, 0, 0, 'Peck'));
    addOption('Back to Main Menu', showMainMenu, 'back');
}

// Training dummy
function trainingDummy(skill) {
    clearOutput();
    clearOptions();
    
    let message, xp;
    
    switch(skill) {
        case 'attack':
            message = 'You practice precise strikes on the dummy...';
            xp = 25;
            break;
        case 'strength':
            message = 'You focus on powerful strikes...';
            xp = 25;
            break;
        case 'defence':
            message = 'You practice defensive maneuvers...';
            xp = 25;
            break;
    }
    
    displayText(message);
    displayText(`You gained ${xp} ${skill} experience!`);
    
    skillXP[skill] += xp;
    player.experience += xp;
    checkLevelUp(skill, skillXP[skill]);
    updateUI();
    
    addOption('Continue Training', () => trainingDummy(skill));
    addOption('Back to Training Menu', combatTraining);
}

// Visit shop
function visitShop() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText(`         ${currentLocation} GENERAL STORE`);
    displayText('========================================');
    displayText('');
    
    if (shopItems[currentLocation]) {
        displayText(`Welcome to ${currentLocation} General Store!`);
        displayText('');
        displayText('Shopkeeper: "Hello adventurer! What can I get for you?"');
        displayText('');
        displayText('Items for sale:');
        displayText('');
        
        shopItems[currentLocation].forEach((item, index) => {
            displayText(`${index + 1}. ${item.name} - ${item.price} coins (${item.type})`);
        });
        displayText('');
        displayText(`Your coins: ${player.coins}`);
        displayText('');
        
        // Add buy buttons for each item
        shopItems[currentLocation].forEach((item) => {
            const canAfford = player.coins >= item.price;
            addOption(`Buy ${item.name} (${item.price} coins)`, () => buyItem(item), canAfford ? '' : 'disabled');
        });
        
        addOption('Exit Shop', showMainMenu, 'back');
    } else {
        displayText('This shop is under development.');
        addOption('Back to Main Menu', showMainMenu, 'back');
    }
}

// Buy item
function buyItem(item) {
    if (player.coins >= item.price) {
        player.coins -= item.price;
        addItemToInventory(item.name);
        displayText(`You bought ${item.name} for ${item.price} coins!`);
        updateUI();
    } else {
        displayText('You don\'t have enough coins for that item!');
    }
    
    setTimeout(() => visitShop(), 2000);
}

// Train skills
function trainSkills() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         SKILL TRAINING MENU');
    displayText('========================================');
    displayText('');
    displayText('Choose a skill to train:');
    displayText('');
    
    addOption('Attack Training', () => trainSkill('attack', 25));
    addOption('Strength Training', () => trainSkill('strength', 25));
    addOption('Defence Training', () => trainSkill('defence', 25));
    addOption('Woodcutting', () => trainSkill('woodcutting', 30));
    addOption('Fishing', () => trainSkill('fishing', 30));
    addOption('Mining', () => trainSkill('mining', 30));
    addOption('Cooking', () => trainSkill('cooking', 35));
    addOption('Smithing', () => trainSkill('smithing', 35));
    addOption('Crafting', () => trainSkill('crafting', 35));
    addOption('Prayer', () => trainSkill('prayer', 40));
    addOption('Farming', () => trainSkill('farming', 30));
    addOption('Firemaking', () => trainSkill('firemaking', 25));
    addOption('Treasure Hunting', () => trainSkill('treasure_hunting', 30));
    addOption('Back to Main Menu', showMainMenu, 'back');
}

// Train skill
function trainSkill(skill, xp) {
    clearOutput();
    clearOptions();
    
    let message;
    switch(skill) {
        case 'attack': message = 'You practice your attack techniques...'; break;
        case 'strength': message = 'You train your strength...'; break;
        case 'defence': message = 'You practice defensive maneuvers...'; break;
        case 'woodcutting': message = 'You practice chopping wood...'; break;
        case 'fishing': message = 'You practice fishing...'; break;
        case 'mining': message = 'You practice mining...'; break;
        case 'cooking': message = 'You practice cooking...'; break;
        case 'smithing': message = 'You practice smithing...'; break;
        case 'crafting': message = 'You practice crafting...'; break;
        case 'prayer': message = 'You practice prayer...'; break;
        case 'farming': message = 'You practice farming...'; break;
        case 'firemaking': message = 'You practice firemaking...'; break;
        case 'treasure_hunting': message = 'You practice treasure hunting...'; break;
    }
    
    displayText(message);
    displayText(`You gained ${xp} ${skill} experience!`);
    
    skillXP[skill] += xp;
    player.experience += xp;
    checkLevelUp(skill, skillXP[skill]);
    updateUI();
    
    addOption('Continue Training', () => trainSkill(skill, xp));
    addOption('Back to Training Menu', trainSkills);
}

// Quest journal
function showQuests() {
    clearOutput();
    clearOptions();
    
    displayText('Active Quests:');
    displayText('');
    
    if (quests.cooksAssistant === 0) {
        displayText('1. [AVAILABLE] Cook\'s Assistant');
        displayText('   Help the Lumbridge baker make a birthday cake!');
        displayText('   Talk to the baker near Lumbridge Castle.');
        displayText('   Requirements: None');
        displayText('   Reward: 300 XP Cooking, 500 coins, Chef\'s Hat');
        displayText('   Status: Available (Talk to baker)');
        displayText('');
    } else if (quests.cooksAssistant === 1) {
        displayText('1. [IN PROGRESS] Cook\'s Assistant');
        displayText('   You need to find: Egg, Flour, Milk');
        
        const hasEgg = hasItem('Egg');
        const hasFlour = hasItem('Pot of Flour');
        const hasMilk = hasItem('Bucket of Milk');
        
        displayText(`   Progress: Egg [${hasEgg ? '1' : '0'}/1] Flour [${hasFlour ? '1' : '0'}/1] Milk [${hasMilk ? '1' : '0'}/1]`);
        displayText('   Status: In Progress');
        displayText('');
        
        if (hasEgg && hasFlour && hasMilk) {
            addOption('Complete Quest', completeCooksAssistant);
        }
    } else if (quests.cooksAssistant === 2) {
        displayText('1. [COMPLETED] Cook\'s Assistant');
        displayText('   You successfully helped the cook!');
        displayText('   Reward: 300 XP Cooking, 500 coins, Chef\'s Hat');
        displayText('   Status: Completed');
        displayText('');
    }
    
    displayText('Available Quests:');
    displayText('');
    displayText('2. [AVAILABLE] Sheep Shearer');
    displayText('   Collect wool from sheep for a farmer');
    displayText('   Talk to the farmer north of Lumbridge');
    displayText('   Requirements: None');
    displayText('   Reward: 60 coins, 150 Crafting XP');
    displayText('');
    
    displayText('3. [AVAILABLE] Rune Mysteries');
    displayText('   Investigate mysterious runes found near Lumbridge');
    displayText('   Talk to the wizard in the Wizards\' Tower');
    displayText('   Requirements: None');
    displayText('   Reward: 1,000 XP in all skills');
    displayText('');
    
    displayText('4. [AVAILABLE] Dragon Slayer');
    displayText('   Prove your worth by slaying a dragon');
    displayText('   Talk to the Guildmaster in Champions\' Guild, Varrock');
    displayText('   Requirements: 32 Quest Points');
    displayText('   Reward: 18,650 XP in Attack and Strength');
    displayText('');
    
    displayText('5. [AVAILABLE] Lost City');
    displayText('   Discover the lost city of Zanaris');
    displayText('   Talk to adventurers near Lumbridge Swamp');
    displayText('   Requirements: 31 Crafting, 36 Woodcutting');
    displayText('   Reward: Access to Zanaris');
    displayText('');
    
    displayText('6. [AVAILABLE] The Restless Ghost');
    displayText('   Help a ghost find peace');
    displayText('   Talk to Father Aereck in Lumbridge Church');
    displayText('   Requirements: None');
    displayText('   Reward: 1,125 XP in Prayer');
    displayText('');
    
    displayText('7. [AVAILABLE] Imp Catcher');
    displayText('   Catch imps for a wizard');
    displayText('   Talk to Wizard Mizgog in the Wizards\' Tower');
    displayText('   Requirements: None');
    displayText('   Reward: 875 XP in Magic');
    displayText('');
    
    displayText('8. [AVAILABLE] White Knight Quest');
    displayText('   Prove your worth to the White Knights');
    displayText('   Talk to Sir Tiffy in Falador Castle');
    displayText('   Requirements: 20 Quest Points');
    displayText('   Reward: 1,000 XP in Attack and Defence');
    displayText('');
    
    displayText('9. [AVAILABLE] Prince Ali Rescue');
    displayText('   Rescue Prince Ali from captivity');
    displayText('   Talk to Osman in Al Kharid Palace');
    displayText('   Requirements: None');
    displayText('   Reward: 700 XP in Crafting');
    displayText('');
    
    displayText('10. [AVAILABLE] Pirate\'s Treasure');
    displayText('   Find the pirate\'s hidden treasure');
    displayText('   Talk to Redbeard Frank in Port Sarim');
    displayText('   Requirements: None');
    displayText('   Reward: 1,000 XP in Thieving');
    displayText('');
    
    addOption('Back to Main Menu', showMainMenu, 'back');
}

// Quest Hub - Accept new quests
function showQuestHub() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         QUEST HUB - ACCEPT NEW QUESTS');
    displayText('========================================');
    displayText('');
    displayText('Welcome to the Quest Hub! Here you can find and accept new quests.');
    displayText('');
    displayText('Available Quest Givers:');
    displayText('');
    displayText('1. [LUMBRIDGE] Cook\'s Assistant - Talk to the baker near Lumbridge Castle');
    displayText('2. [LUMBRIDGE] Sheep Shearer - Talk to Farmer Fred north of Lumbridge');
    displayText('3. [LUMBRIDGE] Rune Mysteries - Talk to Wizard Traiborn in the Wizards\' Tower');
    displayText('4. [VARROCK] Dragon Slayer - Talk to the Guildmaster in Champions\' Guild');
    displayText('5. [LUMBRIDGE] Lost City - Talk to the adventurers near Lumbridge Swamp');
    displayText('6. [LUMBRIDGE] The Restless Ghost - Talk to Father Aereck in Lumbridge Church');
    displayText('7. [LUMBRIDGE] Imp Catcher - Talk to Wizard Mizgog in the Wizards\' Tower');
    displayText('8. [FALADOR] White Knight Quest - Talk to Sir Tiffy in Falador Castle');
    displayText('9. [ALKHARID] Prince Ali Rescue - Talk to Osman in Al Kharid Palace');
    displayText('10. [PORTSARIM] Pirate\'s Treasure - Talk to Redbeard Frank in Port Sarim');
    displayText('');
    
    addOption('Travel to Quest Giver', showQuestTravelMenu);
    addOption('Back to Main Menu', showMainMenu, 'back');
}

// Quest Travel Menu
function showQuestTravelMenu() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         QUEST TRAVEL MENU');
    displayText('========================================');
    displayText('');
    displayText('Which quest giver would you like to visit?');
    displayText('');
    displayText('1. Cook\'s Assistant (Lumbridge)');
    displayText('2. Sheep Shearer (Lumbridge)');
    displayText('3. Rune Mysteries (Lumbridge)');
    displayText('4. Dragon Slayer (Varrock)');
    displayText('5. Lost City (Lumbridge)');
    displayText('6. The Restless Ghost (Lumbridge)');
    displayText('7. Imp Catcher (Lumbridge)');
    displayText('8. White Knight Quest (Falador)');
    displayText('9. Prince Ali Rescue (Al Kharid)');
    displayText('10. Pirate\'s Treasure (Port Sarim)');
    displayText('');
    
    addOption('Cook\'s Assistant', () => travelToQuest('cooksAssistant', 'LUMBRIDGE'));
    addOption('Sheep Shearer', () => travelToQuest('sheepShearer', 'LUMBRIDGE'));
    addOption('Rune Mysteries', () => travelToQuest('runeMysteries', 'LUMBRIDGE'));
    addOption('Dragon Slayer', () => travelToQuest('dragonSlayer', 'VARROCK'));
    addOption('Lost City', () => travelToQuest('lostCity', 'LUMBRIDGE'));
    addOption('The Restless Ghost', () => travelToQuest('restlessGhost', 'LUMBRIDGE'));
    addOption('Imp Catcher', () => travelToQuest('impCatcher', 'LUMBRIDGE'));
    addOption('White Knight Quest', () => travelToQuest('whiteKnightQuest', 'FALADOR'));
    addOption('Prince Ali Rescue', () => travelToQuest('princeAliRescue', 'ALKHARID'));
    addOption('Pirate\'s Treasure', () => travelToQuest('piratesTreasure', 'PORTSARIM'));
    addOption('Back to Quest Hub', showQuestHub);
}

// Travel to quest giver
function travelToQuest(questType, location) {
    currentLocation = location;
    updateUI();
    
    clearOutput();
    displayText(`Traveling to ${locations[location]} for ${questType}...`);
    displayText(`Arrived in ${locations[location]}!`);
    
    setTimeout(() => {
        showQuestGiver(questType);
    }, 2000);
}

// Show quest giver
function showQuestGiver(questType) {
    clearOutput();
    clearOptions();
    
    switch(questType) {
        case 'cooksAssistant':
            displayText('You find the baker near Lumbridge Castle.');
            displayText('"Oh no! I\'ve run out of ingredients for the Duke\'s birthday cake!"');
            displayText('"I need an egg, a pot of flour, and a bucket of milk."');
            displayText('"Can you help me find these items?"');
            
            if (quests.cooksAssistant === 0) {
                addOption('Yes, I\'ll help you', () => startQuest('cooksAssistant'));
            } else if (quests.cooksAssistant === 1) {
                // Check if player has all required items
                        const hasEgg = hasItem('Egg');
        const hasFlour = hasItem('Pot of Flour');
        const hasMilk = hasItem('Bucket of Milk');
                
                if (hasEgg && hasFlour && hasMilk) {
                    displayText('"Oh wonderful! You have all the ingredients!"');
                    displayText('"Let me make the Duke\'s birthday cake right away!"');
                    displayText('');
                    addOption('Give ingredients to the baker', completeCooksAssistant);
                } else {
                    displayText('"Have you found all the ingredients yet?"');
                    displayText('"I still need:');
                    if (!hasEgg) displayText('- Egg');
                    if (!hasFlour) displayText('- Pot of Flour');
                    if (!hasMilk) displayText('- Bucket of Milk');
                    displayText('');
                    displayText('Come back when you have everything!');
                }
            } else {
                displayText('"Thank you again for helping me!"');
                displayText('"The Duke\'s birthday cake was a success!"');
            }
            break;
            
        case 'sheepShearer':
            displayText('You find Farmer Fred north of Lumbridge.');
            displayText('"Hello there! I need help with my sheep."');
            displayText('"Could you collect some wool for me?"');
            
            if (quests.sheepShearer === 0) {
                addOption('Yes, I\'ll help you', () => startQuest('sheepShearer'));
            } else if (quests.sheepShearer === 1) {
                displayText('"Have you collected the wool yet?"');
            } else {
                displayText('"Thank you for the wool! Here\'s your reward."');
            }
            break;
            
        case 'runeMysteries':
            displayText('You find Wizard Traiborn in the Wizards\' Tower.');
            displayText('"Ah, an adventurer! I have a mystery for you to solve."');
            displayText('"Strange runes have been appearing near Lumbridge."');
            
            if (quests.runeMysteries === 0) {
                addOption('I\'ll investigate', () => startQuest('runeMysteries'));
            } else if (quests.runeMysteries === 1) {
                displayText('"Have you found any clues about the runes?"');
            } else {
                displayText('"Excellent work! You\'ve solved the mystery."');
            }
            break;
            
        case 'dragonSlayer':
            displayText('You find the Guildmaster in the Champions\' Guild.');
            displayText('"Only the bravest warriors can join our guild."');
            displayText('"Prove your worth by slaying a dragon!"');
            
            if (quests.dragonSlayer === 0) {
                addOption('I accept the challenge', () => startQuest('dragonSlayer'));
            } else if (quests.dragonSlayer === 1) {
                displayText('"Have you slain the dragon yet?"');
            } else {
                displayText('"You are truly worthy! Welcome to the guild."');
            }
            break;
            
        case 'lostCity':
            displayText('You find adventurers near Lumbridge Swamp.');
            displayText('"We\'ve heard rumors of a lost city called Zanaris."');
            displayText('"But we need someone skilled to find it."');
            
            if (quests.lostCity === 0) {
                addOption('I\'ll search for it', () => startQuest('lostCity'));
            } else if (quests.lostCity === 1) {
                displayText('"Have you found any signs of the lost city?"');
            } else {
                displayText('"Amazing! You actually found Zanaris!"');
            }
            break;
            
        case 'restlessGhost':
            displayText('You find Father Aereck in Lumbridge Church.');
            displayText('"There\'s a restless ghost haunting our graveyard."');
            displayText('"Can you help put it to rest?"');
            
            if (quests.restlessGhost === 0) {
                addOption('I\'ll help the ghost', () => startQuest('restlessGhost'));
            } else if (quests.restlessGhost === 1) {
                displayText('"Have you helped the ghost find peace?"');
            } else {
                displayText('"Thank you! The ghost is now at rest."');
            }
            break;
            
        case 'impCatcher':
            displayText('You find Wizard Mizgog in the Wizards\' Tower.');
            displayText('"Those pesky imps stole my beads!"');
            displayText('"Can you catch them and get my beads back?"');
            
            if (quests.impCatcher === 0) {
                addOption('I\'ll catch the imps', () => startQuest('impCatcher'));
            } else if (quests.impCatcher === 1) {
                displayText('"Have you caught the imps and recovered my beads?"');
            } else {
                displayText('"Wonderful! My beads are safe again."');
            }
            break;
            
        case 'whiteKnightQuest':
            displayText('You find Sir Tiffy in Falador Castle.');
            displayText('"The White Knights are looking for worthy recruits."');
            displayText('"Prove your honor and courage to join us."');
            
            if (quests.whiteKnightQuest === 0) {
                addOption('I\'ll prove my worth', () => startQuest('whiteKnightQuest'));
            } else if (quests.whiteKnightQuest === 1) {
                displayText('"Have you proven your honor and courage?"');
            } else {
                displayText('"You have proven yourself! Welcome to the White Knights."');
            }
            break;
            
        case 'princeAliRescue':
            displayText('You find Osman in Al Kharid Palace.');
            displayText('"Prince Ali has been kidnapped!"');
            displayText('"We need a brave adventurer to rescue him."');
            
            if (quests.princeAliRescue === 0) {
                addOption('I\'ll rescue the prince', () => startQuest('princeAliRescue'));
            } else if (quests.princeAliRescue === 1) {
                displayText('"Have you found and rescued Prince Ali?"');
            } else {
                displayText('"You\'re a hero! Prince Ali is safe thanks to you."');
            }
            break;
            
        case 'piratesTreasure':
            displayText('You find Redbeard Frank in Port Sarim.');
            displayText('"Arr matey! I know where pirate treasure is buried."');
            displayText('"But I need help to get it!"');
            
            if (quests.piratesTreasure === 0) {
                addOption('I\'ll help find the treasure', () => startQuest('piratesTreasure'));
            } else if (quests.piratesTreasure === 1) {
                displayText('"Have you found the pirate\'s treasure yet?"');
            } else {
                displayText('"Shiver me timbers! You actually found it!"');
            }
            break;
            
        default:
            displayText('This quest is under development.');
            break;
    }
    
    addOption('Back to Quest Hub', showQuestHub);
}

// Start quest
function startQuest(questType) {
    quests[questType] = 1;
    displayText('');
    displayText('Quest started! Check your quest journal for details.');
    
    setTimeout(() => showQuestGiver(questType), 2000);
}

// Complete Cook's Assistant quest
function completeCooksAssistant() {
    quests.cooksAssistant = 2;
    
    // Remove quest items
            removeItemFromInventory('Egg');
        removeItemFromInventory('Pot of Flour');
        removeItemFromInventory('Bucket of Milk');
    
    // Give rewards
    skillXP.cooking += 300;
    player.experience += 300;
    player.coins += 500;
            addItemToInventory('Chef\'s Hat');
    
    checkLevelUp('cooking', skillXP.cooking);
    updateUI();
    
    displayText('Quest completed! You gained:');
    displayText('- 300 Cooking XP');
    displayText('- 500 coins');
    displayText('- Chef\'s Hat');
    displayText('');
    
    addOption('Back to Quest Journal', showQuests);
}

// Enter the Wilderness
function enterWilderness() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         ENTERING THE WILDERNESS');
    displayText('========================================');
    displayText('');
    displayText('⚠️  WARNING: You are about to enter the Wilderness! ⚠️');
    displayText('');
    displayText('The Wilderness is a dangerous PvP area where:');
    displayText('• Other players can attack you');
    displayText('• Death means losing items and coins');
    displayText('• Higher levels = more dangerous enemies');
    displayText('• You can be skulled (lose everything on death)');
    displayText('');
    displayText('Are you sure you want to proceed?');
    displayText('');
    
    addOption('Yes, I understand the risks', () => {
        currentLocation = 'WILDERNESS';
        inWilderness = true;
        pvpEnabled = true;
        wildernessLevel = 1;
        displayText('You enter the Wilderness...');
        displayText('The air feels thick with danger.');
        displayText('You are now in a PvP area!');
        updateUI();
        setTimeout(() => exploreArea(), 2000);
    });
    addOption('No, I\'ll stay safe', showMainMenu);
}

// Travel menu
function travelMenu() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         TRAVEL MENU');
    displayText('========================================');
    displayText('');
    displayText('Available Destinations:');
    displayText('');
    
    Object.entries(locations).forEach(([key, name]) => {
        if (key !== currentLocation) {
            if (key === 'WILDERNESS') {
                addOption(`Travel to ${name} (DANGEROUS!)`, () => travelTo(key));
            } else {
                addOption(`Travel to ${name}`, () => travelTo(key));
            }
        }
    });
    
    addOption('Back to Main Menu', showMainMenu, 'back');
}

// Travel to location
function travelTo(location) {
    if (location === 'WILDERNESS') {
        // Special handling for Wilderness travel
        clearOutput();
        clearOptions();
        displayText('========================================');
        displayText('         ENTERING THE WILDERNESS');
        displayText('========================================');
        displayText('');
        displayText('⚠️  WARNING: You are about to enter the Wilderness! ⚠️');
        displayText('');
        displayText('The Wilderness is a dangerous PvP area where:');
        displayText('• Other players can attack you');
        displayText('• Death means losing items and coins');
        displayText('• Higher levels = more dangerous enemies');
        displayText('• You can be skulled (lose everything on death)');
        displayText('');
        displayText('Are you sure you want to proceed?');
        displayText('');
        
        addOption('Yes, I understand the risks', () => {
            currentLocation = location;
            inWilderness = true;
            pvpEnabled = true;
            wildernessLevel = 1;
            displayText('You travel to the Wilderness...');
            displayText('The air feels thick with danger.');
            displayText('You are now in a PvP area!');
            updateUI();
            playLocationMusic(); // Change music for new location
            setTimeout(() => showMainMenu(), 2000);
        });
        addOption('No, I\'ll stay safe', travelMenu);
    } else {
        // Normal travel
        currentLocation = location;
        inWilderness = false;
        pvpEnabled = false;
        wildernessSkull = false;
        displayText(`Traveling to ${locations[location]}...`);
        displayText(`Arrived in ${locations[location]}!`);
        updateUI();
        playLocationMusic(); // Change music for new location
        
        setTimeout(() => showMainMenu(), 2000);
    }
}

// Save game function removed - replaced with save slot system

// Load game
function loadGame() {
    // Try to load from auto-save slot first (slot 1)
    const autoSaveData = localStorage.getItem('toonscape_save_slot_1');
    if (autoSaveData) {
        try {
            const data = JSON.parse(autoSaveData);
            gameMode = data.gameMode || 'NEWGAME';
            currentLocation = data.currentLocation || 'LUMBRIDGE';
            player = data.player || player;
            skillXP = data.skillXP || skillXP;
            quests = data.quests || quests;
            wildernessLevel = data.wildernessLevel || 1;
            inWilderness = data.inWilderness || false;
            pvpEnabled = data.pvpEnabled || false;
            wildernessSkull = data.wildernessSkull || false;
            
            // Initialize house storage if it doesn't exist
            if (!player.house_storage) {
                player.house_storage = [];
            }
            
            // Migrate old inventory format if needed
            migrateInventoryFormat();
            console.log('Game loaded from auto-save slot 1');
        } catch (e) {
            console.log('Error loading auto-save data:', e);
            // Fall back to old save system if auto-save is corrupted
            loadOldSave();
        }
    } else {
        // Try to load from old save system
        loadOldSave();
    }
}

// Load from old save system (for backward compatibility)
function loadOldSave() {
    const saveData = localStorage.getItem('toonscape_save');
    if (saveData) {
        try {
            const data = JSON.parse(saveData);
            gameMode = data.gameMode || 'NEWGAME';
            currentLocation = data.currentLocation || 'LUMBRIDGE';
            player = data.player || player;
            skillXP = data.skillXP || skillXP;
            quests = data.quests || quests;
            wildernessLevel = data.wildernessLevel || 1;
            inWilderness = data.inWilderness || false;
            pvpEnabled = data.pvpEnabled || false;
            wildernessSkull = data.wildernessSkull || false;
            
            // Initialize house storage if it doesn't exist
            if (!player.house_storage) {
                player.house_storage = [];
            }
            
            // Migrate old inventory format if needed
            migrateInventoryFormat();
            console.log('Game loaded from old save system');
        } catch (e) {
            console.log('Error loading old save data:', e);
        }
    }
}

// Migrate old inventory format to new format
function migrateInventoryFormat() {
    if (player.inventory && player.inventory.length > 0) {
        // Check if inventory is in old format (array of strings)
        if (typeof player.inventory[0] === 'string') {
            console.log('Migrating inventory from old format to new format...');
            
            // Convert old format to new format
            const oldInventory = [...player.inventory];
            player.inventory = [];
            
            oldInventory.forEach(itemName => {
                addItemToInventory(itemName);
            });
            
            console.log('Inventory migration completed!');
        }
    }
    
    // Also migrate bank items if they exist
    if (player.bank_items && player.bank_items.length > 0) {
        // Check if bank items are in old format (array of strings)
        if (typeof player.bank_items[0] === 'string') {
            console.log('Migrating bank items from old format to new format...');
            
            // Convert old format to new format
            const oldBankItems = [...player.bank_items];
            player.bank_items = [];
            
            oldBankItems.forEach(itemName => {
                // Check if item already exists in bank
                const existingBankItem = player.bank_items.find(bankItem => bankItem.name === itemName);
                if (existingBankItem && isStackable(itemName)) {
                    // Stack with existing item
                    existingBankItem.quantity += 1;
                } else {
                    // Add as new item
                    player.bank_items.push({ name: itemName, quantity: 1 });
                }
            });
            
            console.log('Bank items migration completed!');
        }
    }
}

// Start combat
function startCombat(enemyName, level, maxHP, attack, defence, weapon) {
    enemy = {
        name: enemyName,
        level: level,
        maxHP: maxHP,
        currentHP: maxHP,
        attack: attack,
        defence: defence,
        weapon: weapon
    };
    
    inCombat = true;
    gameState = 'COMBAT';
    
    // Change music to combat theme
    playLocationMusic();
    
    displayCombatScreen();
}

// Display combat screen with current stats
function displayCombatScreen() {
    clearOutput();
    displayText('========================================');
    displayText(`        COMBAT: ${enemy.name}`);
    displayText('========================================');
    displayText('');
    displayText(`You encounter a ${enemy.name}!`);
    displayText('');
    displayText('Enemy Stats:');
    displayText(`Level: ${enemy.level}`);
    displayText(`Hitpoints: ${enemy.currentHP}/${enemy.maxHP}`);
    displayText(`Attack: ${enemy.attack}`);
    displayText(`Defence: ${enemy.defence}`);
    displayText(`Weapon: ${enemy.weapon}`);
    displayText('');
    displayText('Your Stats:');
    displayText(`Hitpoints: ${player.currentHP}/${player.maxHP}`);
    displayText(`Attack: ${player.attack}`);
    displayText(`Defence: ${player.defence}`);
    displayText('');
    displayText('Combat Options:');
    displayText('');
    
    clearOptions();
    addOption('Attack with weapon', () => combatAction('attack'), 'combat');
    addOption('Eat food to heal', () => combatAction('heal'), 'combat');
    addOption('Attempt to run away', () => combatAction('run'), 'combat');
}

// Combat action
function combatAction(action) {
    if (!inCombat || !enemy) return;
    
    switch(action) {
        case 'attack':
            const playerDamage = calculateDamage(player.attack, enemy.defence);
            if (playerDamage > 0) {
                displayText(`You swing your bronze sword at the ${enemy.name}!`);
                displayText(`You deal ${playerDamage} damage!`);
                enemy.currentHP -= playerDamage;
                
                if (enemy.currentHP <= 0) {
                    displayText(`The ${enemy.name} collapses!`);
                    displayText(`You defeated the ${enemy.name}!`);
                    displayText('You gained 50 combat experience!');
                    
                    // Award experience
                    skillXP.attack += 20;
                    skillXP.strength += 15;
                    skillXP.defence += 10;
                    skillXP.hitpoints += 5;
                    player.experience += 50;
                    
                    checkLevelUp('attack', skillXP.attack);
                    checkLevelUp('strength', skillXP.strength);
                    checkLevelUp('defence', skillXP.defence);
                    checkLevelUp('hitpoints', skillXP.hitpoints);
                    
                    // Random loot - use chicken-specific loot for chickens
                    let loot = null;
                    if (enemy.name === 'Chicken') {
                        loot = getChickenLoot();
                    } else {
                        loot = getRandomLoot();
                    }
                    
                    if (loot) {
                        addItemToInventory(loot);
                        displayText(`You found: ${loot}`);
                        
                        // Play treasure sound for finding loot
                        playSoundEffect('treasure');
                    }
                    
                    updateUI();
                    inCombat = false;
                    enemy = null;
                    
                    // Return to location music
                    playLocationMusic();
                    
                    clearOptions();
                    addOption('Continue', showMainMenu);
                } else {
                    // Enemy attacks back
                    const enemyDamage = calculateDamage(enemy.attack, player.defence);
                    if (enemyDamage > 0) {
                        displayText(`The ${enemy.name} attacks you with its ${enemy.weapon}!`);
                        displayText(`You take ${enemyDamage} damage!`);
                        player.currentHP -= enemyDamage;
                        
                        if (player.currentHP <= 0) {
                            // Player defeated - handle respawn
                            handlePlayerDefeat();
                        } else {
                            displayText('Press any key to continue the fight...');
                            setTimeout(() => displayCombatScreen(), 2000);
                        }
                    } else {
                        displayText(`The ${enemy.name}'s attack misses you!`);
                        setTimeout(() => displayCombatScreen(), 2000);
                    }
                }
            } else {
                displayText(`Your attack misses the ${enemy.name}!`);
                setTimeout(() => displayCombatScreen(), 2000);
            }
            break;
            
        case 'heal':
            if (hasItem('Bread')) {
                displayText('You eat a loaf of bread...');
                displayText('You heal 2 hitpoints!');
                player.currentHP = Math.min(player.maxHP, player.currentHP + 2);
                
                // Remove bread from inventory
                removeItemFromInventory('Bread');
                
                updateUI();
                setTimeout(() => displayCombatScreen(), 2000);
            } else {
                displayText('You don\'t have any food in your inventory!');
                setTimeout(() => displayCombatScreen(), 2000);
            }
            break;
            
        case 'run':
            const runChance = Math.random();
            if (runChance < 0.7) {
                displayText('You successfully run away!');
                inCombat = false;
                enemy = null;
                
                // Return to location music
                playLocationMusic();
                
                showMainMenu();
            } else {
                displayText('You fail to escape!');
                displayText(`The ${enemy.name} attacks you as you try to flee!`);
                const enemyDamage = calculateDamage(enemy.attack, player.defence);
                if (enemyDamage > 0) {
                    displayText(`You take ${enemyDamage} damage from the cowardly attack!`);
                    player.currentHP -= enemyDamage;
                    if (player.currentHP <= 0) {
                        displayText('You collapse from the damage!');
                        player.currentHP = 1;
                        player.coins = Math.max(0, player.coins - 10);
                        updateUI();
                    }
                }
                setTimeout(() => displayCombatScreen(), 2000);
            }
            break;
    }
}

// Handle player defeat and respawn
function handlePlayerDefeat() {
    displayText('You have been defeated!');
    displayText(`The ${enemy.name} stands victorious.`);
    displayText('You lose 10 coins and wake up at the Lumbridge respawn point.');
    
    // Play death sound
    playSoundEffect('death');
    
    // Play PK stole item sound if in wilderness
    if (inWilderness) {
        playSoundEffect('pk_stole');
    }
    
    // Handle respawn
    player.coins = Math.max(0, player.coins - 10);
    player.currentHP = 1;
    currentLocation = 'LUMBRIDGE';
    inWilderness = false;
    pvpEnabled = false;
    wildernessSkull = false;
    inCombat = false;
    
    // Clear enemy data
    enemy = null;
    
    updateUI();
    
    // Return to Lumbridge music
    playLocationMusic();
    
    clearOptions();
    addOption('Continue', showMainMenu);
}

// Calculate damage
function calculateDamage(attack, defence) {
    const attackPower = attack + Math.floor(Math.random() * 5);
    const defencePower = defence + Math.floor(Math.random() * 3);
    const damage = Math.max(0, attackPower - defencePower);
    return Math.min(damage, 15);
}

// Check level up
function checkLevelUp(skill, xp) {
    const currentLevel = player[skill];
    const requiredXP = (currentLevel - 1) * 100;
    
    if (xp >= requiredXP) {
        player[skill] += 1;
        displayText('');
        displayText('*** LEVEL UP! ***');
        displayText(`Your ${skill} level increased to ${player[skill]}!`);
        displayText('*** LEVEL UP! ***');
        displayText('');
        
        // Update max HP if hitpoints leveled up
        if (skill === 'hitpoints') {
            player.maxHP += 1;
            player.currentHP += 1;
        }
        
        updateUI();
    }
}

// Get random loot
function getRandomLoot() {
    const lootTable = [
        'Copper Ore', 'Tin Ore', 'Iron Ore', 'Coal',
        'Bread', 'Health Potion', 'Bronze Arrow', 'Iron Arrow'
    ];
    
    const chance = Math.random();
    if (chance < 0.3) {
        return lootTable[Math.floor(Math.random() * lootTable.length)];
    }
    return null;
}

// Get chicken-specific loot (feathers)
function getChickenLoot() {
    const chickenLootTable = [
        'Feather', 'Feather', 'Feather', // 3x chance for feathers
        'Copper Ore', 'Tin Ore', 'Bread'
    ];
    
    const chance = Math.random();
    if (chance < 0.4) { // 40% chance for chicken loot
        return chickenLootTable[Math.floor(Math.random() * chickenLootTable.length)];
    }
    return null;
}

// Wilderness level change
function changeWildernessLevel() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('        CHANGE WILDERNESS LEVEL');
    displayText('========================================');
    displayText('');
    
    addOption('Level 1 (Safe)', () => {
        wildernessLevel = 1;
        displayText(`You are now in a low-level Wilderness area.`);
        displayText(`Risk Level: ${wildernessLevels[wildernessLevel]}`);
        displayText('');
        addOption('Back to Wilderness', exploreArea);
    });
    addOption('Level 5 (Medium Risk)', () => {
        wildernessLevel = 5;
        displayText(`You are now in a medium-risk Wilderness area.`);
        displayText(`Risk Level: ${wildernessLevels[wildernessLevel]}`);
        displayText('');
        addOption('Back to Wilderness', exploreArea);
    });
    addOption('Level 10 (High Risk)', () => {
        wildernessLevel = 10;
        displayText(`You are now in a high-risk Wilderness area.`);
        displayText(`Risk Level: ${wildernessLevels[wildernessLevel]}`);
        displayText('');
        addOption('Back to Wilderness', exploreArea);
    });
    addOption('Level 15 (Extreme Risk)', () => {
        wildernessLevel = 15;
        displayText(`You are now in an extreme-risk Wilderness area.`);
        displayText(`Risk Level: ${wildernessLevels[wildernessLevel]}`);
        displayText('');
        addOption('Back to Wilderness', exploreArea);
    });
    addOption('Level 20 (Maximum Risk)', () => {
        wildernessLevel = 20;
        displayText(`You are now in a maximum-risk Wilderness area.`);
        displayText(`Risk Level: ${wildernessLevels[wildernessLevel]}`);
        displayText('');
        addOption('Back to Wilderness', exploreArea);
    });
    addOption('Back to Wilderness', exploreArea);
}

// Search for resources in wilderness
function searchWildernessResources() {
    clearOutput();
    clearOptions();
    
    displayText('You search the wilderness for resources...');
    displayText('You find some low-level items.');
    
    const loot = getRandomLoot();
    if (loot) {
        addItemToInventory(loot);
        displayText(`You found: ${loot}`);
        
        // Play treasure sound for finding wilderness resources
        playSoundEffect('treasure');
    }
    
    addOption('Back to Wilderness', exploreArea);
}

// Hunt for rare items in wilderness
function huntRareItems() {
    clearOutput();
    clearOptions();
    
    displayText('You hunt for rare items in the wilderness...');
    displayText('You find a rare item!');
    
    const rareLoot = ['Dragon Bone', 'Ancient Staff', 'Chaos Orb', 'Dragon Egg'];
    const loot = rareLoot[Math.floor(Math.random() * rareLoot.length)];
    addItemToInventory(loot);
    displayText(`You found: ${loot}`);
    
    // Play treasure sound for finding rare items
    playSoundEffect('treasure');
    
    addOption('Back to Wilderness', exploreArea);
}

// Fight wilderness creatures
function fightWildernessCreatures() {
    clearOutput();
    clearOptions();
    
    displayText('You fight some wilderness creatures...');
    
    // Play PK combat music for wilderness fights
    const pkAudio = new Audio(soundEffects.combat_pk);
    pkAudio.volume = musicVolume * 0.7;
    pkAudio.play().catch(error => {
        console.log('Error playing PK combat music:', error);
    });
    
    const enemyName = wildernessEncounters[wildernessLevel][Math.floor(Math.random() * wildernessEncounters[wildernessLevel].length)];
    const level = wildernessLevel;
    const maxHP = 10 + level * 2;
    const attack = 1 + level * 0.5;
    const defence = 1 + level * 0.3;
    const weapon = 'Natural Weapon';
    
    startCombat(enemyName, level, maxHP, attack, defence, weapon);
}

// Return from wilderness
function returnFromWilderness() {
    inWilderness = false;
    wildernessLevel = 1; // Reset to safe level
    wildernessSkull = false; // Reset skull status
    displayText('You return to safety from the Wilderness.');
    displayText(`Current Wilderness Level: ${wildernessLevel}`);
    displayText(`Risk Level: ${wildernessLevels[wildernessLevel]}`);
    displayText('');
    addOption('Back to Main Menu', showMainMenu);
}

// Varrock exploration functions
function exploreVarrockCastle() {
    clearOutput();
    clearOptions();
    
    displayText('You approach Varrock Castle...');
    displayText('The grand castle stands majestically before you.');
    displayText('Royal guards patrol the entrance.');
    displayText('');
    displayText('What would you like to do?');
    displayText('');
    
    addOption('Enter the Castle', () => {
        displayText('You enter Varrock Castle...');
        displayText('The interior is opulent and well-guarded.');
        displayText('You see the throne room and royal chambers.');
        displayText('This area is under development.');
        addOption('Back to Castle Entrance', exploreVarrockCastle);
    });
    addOption('Talk to Guards', () => {
        displayText('You speak with the castle guards.');
        displayText('They tell you about the castle\'s history.');
        displayText('You gain 20 Defence experience!');
        skillXP.defence += 20;
        player.experience += 20;
        checkLevelUp('defence', skillXP.defence);
        updateUI();
        addOption('Back to Castle Entrance', exploreVarrockCastle);
    });
    addOption('Back to Exploring', exploreArea);
}

function exploreVarrockMuseum() {
    clearOutput();
    clearOptions();
    
    displayText('You enter the Varrock Museum...');
    displayText('Ancient artifacts and historical displays fill the halls.');
    displayText('A curator approaches you.');
    displayText('');
    displayText('"Welcome to the Varrock Museum!"');
    displayText('"We have exhibits on ancient civilizations, magic, and more."');
    displayText('');
    
    addOption('View Ancient Artifacts', () => {
        displayText('You examine ancient artifacts...');
        displayText('You learn about the history of Gielinor.');
        displayText('You gain 25 Crafting experience!');
        skillXP.crafting += 25;
        player.experience += 25;
        checkLevelUp('crafting', skillXP.crafting);
        updateUI();
        addOption('Continue Exploring Museum', exploreVarrockMuseum);
    });
    addOption('Study Magic History', () => {
        displayText('You study the history of magic...');
        displayText('You learn about ancient spellcasting techniques.');
        displayText('You gain 30 Magic experience!');
        skillXP.magic += 30;
        player.experience += 30;
        checkLevelUp('magic', skillXP.magic);
        updateUI();
        addOption('Continue Exploring Museum', exploreVarrockMuseum);
    });
    addOption('Back to Exploring', exploreArea);
}

function exploreVarrockPalace() {
    clearOutput();
    clearOptions();
    
    displayText('You approach the Varrock Palace...');
    displayText('Government officials come and go.');
    displayText('This is where the city\'s laws are made.');
    displayText('');
    
    addOption('Enter the Palace', () => {
        displayText('You enter the Varrock Palace...');
        displayText('The halls are filled with bureaucrats and officials.');
        displayText('You see meeting rooms and administrative offices.');
        displayText('This area is under development.');
        addOption('Back to Palace Entrance', exploreVarrockPalace);
    });
    addOption('Back to Exploring', exploreArea);
}

function exploreVarrockSquare() {
    clearOutput();
    clearOptions();
    
    displayText('You enter Varrock Square...');
    displayText('The central marketplace is bustling with activity.');
    displayText('Merchants sell their wares and people gather to trade.');
    displayText('');
    
    addOption('Browse Market Stalls', () => {
        displayText('You browse the market stalls...');
        displayText('You find some interesting items for sale.');
        displayText('You gain 15 Trading experience!');
        skillXP.crafting += 15;
        player.experience += 15;
        checkLevelUp('crafting', skillXP.crafting);
        updateUI();
        addOption('Continue Browsing', exploreVarrockSquare);
    });
    addOption('Back to Exploring', exploreArea);
}

function exploreVarrockChurch() {
    clearOutput();
    clearOptions();
    
    displayText('You enter the Varrock Church...');
    displayText('The church is peaceful and well-maintained.');
    displayText('A priest greets you warmly.');
    displayText('');
    displayText('"Welcome to our church. May Saradomin bless you."');
    displayText('You gained 25 Prayer experience!');
    
    skillXP.prayer += 25;
    player.experience += 25;
    checkLevelUp('prayer', skillXP.prayer);
    updateUI();
    
    addOption('Back to Exploring', exploreArea);
}

function enterVarrockSewers() {
    clearOutput();
    clearOptions();
    
    displayText('You approach the entrance to Varrock Sewers...');
    displayText('Dark tunnels lead underground.');
    displayText('This place looks dangerous - are you sure you want to enter?');
    displayText('');
    
    addOption('Yes, enter the sewers', () => {
        displayText('You enter the Varrock Sewers...');
        displayText('The tunnels are dark and filled with strange sounds.');
        displayText('You encounter some sewer creatures!');
        startCombat('Sewer Rat', 3, 15, 2, 1, 'Diseased Bite');
    });
    addOption('No, stay on the surface', exploreArea);
}

function exploreVarrockGraveyard() {
    clearOutput();
    clearOptions();
    
    displayText('You enter the Varrock Graveyard...');
    displayText('Ancient tombstones stand in rows.');
    displayText('The air feels heavy with spiritual energy.');
    displayText('');
    
    addOption('Search for Spirits', () => {
        displayText('You search for restless spirits...');
        displayText('You encounter a ghost!');
        startCombat('Restless Ghost', 5, 20, 3, 2, 'Ethereal Touch');
    });
    addOption('Back to Exploring', exploreArea);
}

function exploreVarrockLibrary() {
    clearOutput();
    clearOptions();
    
    displayText('You enter the Varrock Library...');
    displayText('Rows of bookshelves fill the large hall.');
    displayText('Scholars study quietly at tables.');
    displayText('');
    
    addOption('Study Magic Books', () => {
        displayText('You study ancient magic books...');
        displayText('You learn new magical techniques.');
        displayText('You gained 35 Magic experience!');
        skillXP.magic += 35;
        player.experience += 35;
        checkLevelUp('magic', skillXP.magic);
        updateUI();
        addOption('Continue Studying', exploreVarrockLibrary);
    });
    addOption('Study Combat Manuals', () => {
        displayText('You study combat manuals...');
        displayText('You learn advanced fighting techniques.');
        displayText('You gained 30 Attack experience!');
        skillXP.attack += 30;
        player.experience += 30;
        checkLevelUp('attack', skillXP.attack);
        updateUI();
        addOption('Continue Studying', exploreVarrockLibrary);
    });
    addOption('Back to Exploring', exploreArea);
}

function visitVarrockBank() {
    clearOutput();
    clearOptions();
    
    displayText('You enter the Varrock Bank...');
    displayText('A banker greets you from behind a counter.');
    displayText('"Welcome to the Bank of Varrock!"');
    displayText('"How may I assist you today?"');
    displayText('');
    
    addOption('Deposit Items', () => {
        currentLocation = 'VARROCK';
        updateUI();
        bankDeposit();
    });
    addOption('Withdraw Items', () => {
        currentLocation = 'VARROCK';
        updateUI();
        bankWithdraw();
    });
    addOption('Check Balance', () => {
        displayText(`Your current coin balance: ${player.coins} coins`);
        addOption('Back to Bank', visitVarrockBank);
    });
    addOption('Back to Exploring', exploreArea);
}

// Visit Grand Exchange
function visitGrandExchange() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         GRAND EXCHANGE (GE)');
    displayText('========================================');
    displayText('');
    displayText('Welcome to the Grand Exchange!');
    displayText('The largest marketplace in all of Gielinor.');
    displayText('');
    displayText(`Your coins: ${player.coins}`);
    displayText('');
    displayText('What would you like to do?');
    displayText('');
    
    addOption('Browse Items (Buy)', browseGEItems);
    addOption('Sell Your Items', sellGEItems);
    addOption('View Market Prices', viewMarketPrices);
    addOption('Check Your Orders', checkGEOrders);
    addOption('Back to Exploring', exploreArea);
}

// Browse GE items
function browseGEItems() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         GRAND EXCHANGE - BUY');
    displayText('========================================');
    displayText('');
    displayText(`Your coins: ${player.coins}`);
    displayText('');
    displayText('Available items:');
    displayText('');
    
    grandExchangeItems.forEach((item, index) => {
        const canAfford = player.coins >= item.buyPrice;
        const stockStatus = item.stock > 0 ? `Stock: ${item.stock}` : 'OUT OF STOCK';
        displayText(`${index + 1}. ${item.name} - ${item.buyPrice} coins (${item.type}) - ${stockStatus}`);
        
        if (canAfford && item.stock > 0) {
            addOption(`Buy ${item.name} (${item.buyPrice} coins)`, () => buyGEItem(item));
        }
    });
    
    addOption('Back to Grand Exchange', visitGrandExchange);
}

// Buy GE item
function buyGEItem(item) {
    if (player.coins >= item.buyPrice && item.stock > 0) {
        player.coins -= item.buyPrice;
        addItemToInventory(item.name);
        item.stock--;
        
        displayText(`You bought ${item.name} for ${item.buyPrice} coins!`);
        displayText(`Stock remaining: ${item.stock}`);
        updateUI();
        
        setTimeout(() => browseGEItems(), 2000);
    } else {
        displayText('You cannot afford this item or it is out of stock!');
        setTimeout(() => browseGEItems(), 2000);
    }
}

// Sell GE items
function sellGEItems() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         GRAND EXCHANGE - SELL');
    displayText('========================================');
    displayText('');
    displayText('Items you can sell:');
    displayText('');
    
    if (player.inventory.length === 0) {
        displayText('Your inventory is empty.');
    } else {
        player.inventory.forEach((item, index) => {
            const geItem = grandExchangeItems.find(geItem => geItem.name === item.name);
            if (geItem) {
                if (item.quantity > 1) {
                    displayText(`${index + 1}. ${item.name} (${item.quantity}) - Sell for ${geItem.sellPrice} coins each`);
                    addOption(`Sell ${item.name} (${item.quantity}) (${geItem.sellPrice * item.quantity} coins)`, () => sellGEItem(item.name, geItem.sellPrice, item.quantity));
                } else {
                    displayText(`${index + 1}. ${item.name} - Sell for ${geItem.sellPrice} coins`);
                    addOption(`Sell ${item.name} (${geItem.sellPrice} coins)`, () => sellGEItem(item.name, geItem.sellPrice, 1));
                }
            }
        });
    }
    
    addOption('Back to Grand Exchange', visitGrandExchange);
}

// Sell GE item
function sellGEItem(itemName, sellPrice, quantity = 1) {
    if (removeItemFromInventory(itemName, quantity)) {
        const totalPrice = sellPrice * quantity;
        player.coins += totalPrice;
        
        if (quantity > 1) {
            displayText(`You sold ${quantity}x ${itemName} for ${totalPrice} coins!`);
        } else {
            displayText(`You sold ${itemName} for ${sellPrice} coins!`);
        }
        updateUI();
        
        setTimeout(() => sellGEItems(), 2000);
    }
}

// View market prices
function viewMarketPrices() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         MARKET PRICES');
    displayText('========================================');
    displayText('');
    displayText('Current Grand Exchange prices:');
    displayText('');
    
    grandExchangeItems.forEach(item => {
        displayText(`${item.name}: Buy ${item.buyPrice} | Sell ${item.sellPrice} | Stock ${item.stock}`);
    });
    
    addOption('Back to Grand Exchange', visitGrandExchange);
}

// Check GE orders
function checkGEOrders() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         YOUR ORDERS');
    displayText('========================================');
    displayText('');
    displayText('You have no active orders at the moment.');
    displayText('All transactions are instant at the Grand Exchange.');
    
    addOption('Back to Grand Exchange', visitGrandExchange);
}

// Initialize game when page loads
document.addEventListener('DOMContentLoaded', () => {
    // Add CSS styles for the save menu
    const style = document.createElement('style');
    style.textContent = `
        .save-menu-button {
            position: fixed;
            top: 20px;
            right: 20px;
            width: 40px;
            height: 40px;
            background: #2c3e50;
            color: white;
            border: none;
            border-radius: 50%;
            font-size: 24px;
            cursor: pointer;
            z-index: 1000;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 2px 10px rgba(0,0,0,0.3);
            transition: all 0.3s ease;
        }
        
        .save-menu-button:hover {
            background: #34495e;
            transform: scale(1.1);
        }
        
        .save-menu {
            position: fixed;
            top: 70px;
            right: 20px;
            width: 280px;
            background: white;
            border: 2px solid #2c3e50;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.3);
            z-index: 999;
            padding: 15px;
            font-family: 'Courier New', monospace;
        }
        
        .save-slot {
            display: flex;
            flex-direction: column;
            gap: 8px;
            margin-bottom: 15px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background: #f9f9f9;
        }
        
        .save-slot-label {
            font-weight: bold;
            color: #2c3e50;
            margin-bottom: 5px;
        }
        
        .save-slot button {
            padding: 5px 10px;
            margin: 2px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            font-size: 12px;
            transition: all 0.2s ease;
        }
        
        .save-btn {
            background: #27ae60;
            color: white;
        }
        
        .save-btn:hover {
            background: #229954;
        }
        
        .load-btn {
            background: #3498db;
            color: white;
        }
        
        .load-btn:hover {
            background: #2980b9;
        }
        
        .delete-btn {
            background: #e74c3c;
            color: white;
        }
        
        .delete-btn:hover {
            background: #c0392b;
        }
        
        .auto-save-option {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px;
            border-top: 1px solid #ddd;
            margin-top: 10px;
        }
        
        .auto-save-label {
            font-size: 12px;
            color: #2c3e50;
        }
        
        #autoSaveToggle {
            width: 20px;
            height: 20px;
        }
        
        .restart-option {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px;
            border-top: 2px solid #e74c3c;
            margin-top: 15px;
            background: #fff5f5;
        }
        
        .restart-label {
            font-size: 14px;
            color: #c0392b;
            font-weight: bold;
        }
        
        .restart-btn {
            background: #e74c3c;
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 12px;
            font-weight: bold;
            transition: all 0.2s ease;
        }
        
        .restart-btn:hover {
            background: #c0392b;
            transform: scale(1.05);
        }
        
        .music-button {
            position: fixed;
            top: 20px;
            right: 70px;
            width: 40px;
            height: 40px;
            background: #8e44ad;
            color: white;
            border: none;
            border-radius: 50%;
            font-size: 24px;
            cursor: pointer;
            z-index: 1000;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 2px 10px rgba(0,0,0,0.3);
            transition: all 0.3s ease;
        }
        
        .music-button:hover {
            background: #9b59b6;
            transform: scale(1.1);
        }
        
        .music-player {
            position: fixed;
            top: 70px;
            right: 70px;
            width: 320px;
            background: white;
            border: 2px solid #8e44ad;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.3);
            z-index: 999;
            padding: 15px;
            font-family: 'Courier New', monospace;
        }
        
        .music-header h3 {
            margin: 0 0 15px 0;
            color: #8e44ad;
            text-align: center;
        }
        
        .music-controls {
            display: flex;
            gap: 8px;
            margin-bottom: 15px;
            justify-content: center;
        }
        
        .music-controls button {
            padding: 8px 12px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 12px;
            background: #3498db;
            color: white;
            transition: all 0.2s ease;
        }
        
        .music-controls button:hover {
            background: #2980b9;
            transform: scale(1.05);
        }
        
        .volume-control {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 15px;
            padding: 10px;
            background: #f8f9fa;
            border-radius: 5px;
        }
        
        .volume-control label {
            font-size: 12px;
            color: #2c3e50;
        }
        
        .volume-control input[type="range"] {
            flex: 1;
        }
        
        .volume-control span {
            font-size: 12px;
            color: #2c3e50;
            min-width: 30px;
        }
        
        .current-track {
            margin-bottom: 15px;
            padding: 10px;
            background: #e8f4fd;
            border-radius: 5px;
            border-left: 3px solid #3498db;
        }
        
        .current-track strong {
            font-size: 12px;
            color: #2c3e50;
        }
        
        .current-track div {
            font-size: 14px;
            color: #3498db;
            font-weight: bold;
            margin-top: 5px;
        }
        
        .music-tracks {
            max-height: 200px;
            overflow-y: auto;
        }
        
        .track-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 8px 10px;
            margin: 5px 0;
            background: #f8f9fa;
            border-radius: 5px;
            cursor: pointer;
            transition: all 0.2s ease;
            border: 1px solid transparent;
        }
        
        .track-item:hover {
            background: #e9ecef;
            border-color: #8e44ad;
            transform: scale(1.02);
        }
        
        .track-duration {
            font-size: 11px;
            color: #6c757d;
        }
    `;
    document.head.appendChild(style);
    
    // Simulate loading
    const loadingProgress = document.getElementById('loadingProgress');
    let progress = 0;
    const loadingInterval = setInterval(() => {
        progress += 10;
        loadingProgress.style.width = progress + '%';
        if (progress >= 100) {
            clearInterval(loadingInterval);
            setTimeout(() => {
                document.getElementById('loadingScreen').style.display = 'none';
                document.getElementById('gameContainer').style.display = 'block';
                initGame();
            }, 500);
        }
    }, 100);
});

// Player House System
function showPlayerHouse() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('           YOUR PLAYER HOUSE');
    displayText('========================================');
    displayText('');
    displayText(`House Level: ${player.house_level}`);
    displayText(`Current Rooms: ${player.house_rooms}`);
    displayText(`Furniture: ${player.house_furniture}`);
    displayText('');
    displayText('House Options:');
    displayText('');
    
    addOption('Enter House', enterPlayerHouse);
    addOption('Build/Upgrade Room', buildRoom);
    addOption('Buy Furniture', buyFurniture);
    addOption('House Storage', houseStorage);
    addOption('House Settings', houseSettings);
    addOption('Back to Main Menu', showMainMenu, 'back');
}

// Enter Player House
function enterPlayerHouse() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         INSIDE YOUR HOUSE');
    displayText('========================================');
    displayText('');
    displayText(`You enter your cozy ${player.house_rooms}.`);
    displayText(`The ${player.house_furniture} provides comfort.`);
    displayText('');
    displayText('House Activities:');
    displayText('');
    
    addOption('Rest (Restore Health)', restInHouse);
    addOption('Study (Gain Experience)', studyInHouse);
    addOption('Organize Storage', organizeStorage);
    addOption('Exit House', showPlayerHouse);
}

// Rest in house
function restInHouse() {
    clearOutput();
    clearOptions();
    
    displayText('You rest comfortably in your house...');
    displayText('You feel completely refreshed!');
    player.currentHP = player.maxHP;
    displayText('Health fully restored!');
    updateUI();
    
    addOption('Continue Resting', restInHouse);
    addOption('Exit House', showPlayerHouse);
}

// Study in house
function studyInHouse() {
    clearOutput();
    clearOptions();
    
    displayText('You study in the peaceful environment of your house...');
    displayText('You gain 25 experience in random skills!');
    
    const skills = ['attack', 'strength', 'defence', 'magic', 'cooking', 'crafting'];
    const randomSkill = skills[Math.floor(Math.random() * skills.length)];
    
    skillXP[randomSkill] += 25;
    player.experience += 25;
    checkLevelUp(randomSkill, skillXP[randomSkill]);
    updateUI();
    
    addOption('Continue Studying', studyInHouse);
    addOption('Exit House', showPlayerHouse);
}

// Build/Upgrade Room
function buildRoom() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         BUILD/UPGRADE ROOMS');
    displayText('========================================');
    displayText('');
    displayText(`Current House Level: ${player.house_level}`);
    displayText(`Current Rooms: ${player.house_rooms}`);
    displayText('');
    displayText('Available Upgrades:');
    displayText('');
    
    if (player.house_level === 1) {
        addOption('Add Kitchen - 500 coins (Level 2)', () => upgradeHouse('kitchen', 500, 2));
        addOption('Add Bedroom - 300 coins (Level 2)', () => upgradeHouse('bedroom', 300, 2));
    } else if (player.house_level === 2) {
        addOption('Add Study - 800 coins (Level 3)', () => upgradeHouse('study', 800, 3));
        addOption('Add Garden - 600 coins (Level 3)', () => upgradeHouse('garden', 600, 3));
    } else if (player.house_level === 3) {
        addOption('Add Workshop - 1200 coins (Level 4)', () => upgradeHouse('workshop', 1200, 4));
        addOption('Add Library - 1000 coins (Level 4)', () => upgradeHouse('library', 1000, 4));
    }
    
    addOption('Back to House Menu', showPlayerHouse);
}

// Upgrade house
function upgradeHouse(roomType, cost, newLevel) {
    if (player.coins >= cost) {
        player.coins -= cost;
        player.house_level = newLevel;
        player.house_rooms = roomType;
        displayText(`You successfully built a ${roomType}!`);
        displayText(`Your house is now level ${newLevel}!`);
        updateUI();
    } else {
        displayText('You don\'t have enough coins for this upgrade!');
    }
    
    setTimeout(() => buildRoom(), 2000);
}

// Buy Furniture
function buyFurniture() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         BUY FURNITURE');
    displayText('========================================');
    displayText('');
    displayText('Available Furniture:');
    displayText('');
    
    addOption('Comfortable Chair - 100 coins', () => buyFurnitureItem('Comfortable Chair', 100));
    addOption('Soft Bed - 200 coins', () => buyFurnitureItem('Soft Bed', 200));
    addOption('Study Desk - 150 coins', () => buyFurnitureItem('Study Desk', 150));
    addOption('Kitchen Stove - 300 coins', () => buyFurnitureItem('Kitchen Stove', 300));
    addOption('Back to House Menu', showPlayerHouse);
}

// Buy furniture item
function buyFurnitureItem(item, cost) {
    if (player.coins >= cost) {
        player.coins -= cost;
        player.house_furniture = item;
        displayText(`You bought a ${item}!`);
        updateUI();
    } else {
        displayText('You don\'t have enough coins for this furniture!');
    }
    
    setTimeout(() => buyFurniture(), 2000);
}

// House Storage
function houseStorage() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         HOUSE STORAGE');
    displayText('========================================');
    displayText('');
    displayText('Welcome to your House Storage Box!');
    displayText('A magical storage container that can hold up to 20 items.');
    displayText('');
    
    // Initialize house storage if it doesn't exist
    if (!player.house_storage) {
        player.house_storage = [];
    }
    
    displayText(`Storage Box Contents: ${player.house_storage.length}/20 items`);
    displayText('');
    
    if (player.house_storage.length === 0) {
        displayText('Your storage box is currently empty.');
    } else {
        displayText('Stored Items:');
        player.house_storage.forEach((item, index) => {
            if (item.quantity > 1) {
                displayText(`${index + 1}. ${item.name} (${item.quantity})`);
            } else {
                displayText(`${index + 1}. ${item.name}`);
            }
        });
    }
    
    displayText('');
    displayText('Storage Options:');
    displayText('');
    
    addOption('Store Items from Inventory', storeItemsInHouse);
    addOption('Withdraw Items from Storage', withdrawItemsFromHouse);
    addOption('View Storage Contents', viewHouseStorage);
    addOption('Sort Storage by Name', () => sortHouseStorage('name'));
    addOption('Sort Storage by Type', () => sortHouseStorage('type'));
    addOption('Sort Storage by Quantity', () => sortHouseStorage('quantity'));
    addOption('Search Storage', searchHouseStorage);
    addOption('Back to House Menu', showPlayerHouse);
}

// House Settings
function houseSettings() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         HOUSE SETTINGS');
    displayText('========================================');
    displayText('');
    displayText('House Configuration:');
    displayText(`House Level: ${player.house_level}`);
    displayText(`Current Rooms: ${player.house_rooms}`);
    displayText(`Furniture: ${player.house_furniture}`);
    displayText('');
    displayText('Settings Options:');
    displayText('');
    
    addOption('Change House Name', changeHouseName);
    addOption('Set House Theme', setHouseTheme);
    addOption('Manage House Access', manageHouseAccess);
    addOption('Back to House Menu', showPlayerHouse);
}

// Crafting Workshop System
function showCraftingWorkshop() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         CRAFTING WORKSHOP');
    displayText('========================================');
    displayText('');
    displayText('Welcome to the Crafting Workshop!');
    displayText('Create useful items from raw materials.');
    displayText('');
    displayText(`Your Crafting Level: ${player.crafting}`);
    displayText('');
    displayText('Available Crafting Recipes:');
    displayText('');
    displayText('1. Bronze Bar (Copper Ore + Tin Ore) - Level 1');
    displayText('2. Iron Bar (Iron Ore) - Level 15');
    displayText('3. Steel Bar (Iron Ore + Coal) - Level 30');
    displayText('4. Leather Boots (Leather) - Level 7');
    displayText('5. Leather Gloves (Leather) - Level 1');
    displayText('6. Leather Armor (2x Leather) - Level 14');
    displayText('7. Hard Leather Armor (3x Leather) - Level 28');
    displayText('8. Studded Leather (Leather + Steel Studs) - Level 41');
    displayText('9. Green Dragonhide (Green D\'hide) - Level 63');
    displayText('10. Jewelry (Gold/Silver + Gems) - Level 5+');
    displayText('11. Pottery (Clay) - Level 1');
    displayText('12. Glass Items (Sand + Soda Ash) - Level 1');
    displayText('13. Bronze Arrows (Feather + Bronze Bar) - Level 1');
    displayText('14. Iron Arrows (Feather + Iron Bar) - Level 15');
    displayText('15. Battlestaves (Battlestaff + Orbs) - Level 54');
    displayText('16. Dragon Battlestaves (Battlestaff + Dragon Stones) - Level 80');
    displayText('17. Godswords (Godsword Shards) - Level 80');
    displayText('');
    
    addOption('Craft Bronze Bar', () => craftItem('bronze_bar'));
    addOption('Craft Iron Bar', () => craftItem('iron_bar'));
    addOption('Craft Steel Bar', () => craftItem('steel_bar'));
    addOption('Craft Leather Gloves', () => craftItem('leather_gloves'));
    addOption('Craft Pottery', () => craftItem('pottery'));
    addOption('Craft Bronze Arrows', () => craftItem('bronze_arrows'));
    addOption('Craft Iron Arrows', () => craftItem('iron_arrows'));
    addOption('Back to Main Menu', showMainMenu, 'back');
}

// Craft item
function craftItem(itemType) {
    clearOutput();
    clearOptions();
    
    switch(itemType) {
        case 'bronze_bar':
            if (hasItem('Copper Ore') && hasItem('Tin Ore')) {
                // Remove materials
                removeItemFromInventory('Copper Ore');
                removeItemFromInventory('Tin Ore');
                
                // Add crafted item
                addItemToInventory('Bronze Bar');
                
                // Award XP
                skillXP.crafting += 50;
                player.experience += 50;
                checkLevelUp('crafting', skillXP.crafting);
                updateUI();
                
                displayText('You successfully craft a Bronze Bar!');
                displayText('You gained 50 Crafting experience!');
            } else {
                displayText('You need 1 Copper Ore and 1 Tin Ore to craft a Bronze Bar!');
            }
            break;
            
        case 'iron_bar':
            if (hasItem('Iron Ore')) {
                removeItemFromInventory('Iron Ore');
                addItemToInventory('Iron Bar');
                
                skillXP.crafting += 75;
                player.experience += 75;
                checkLevelUp('crafting', skillXP.crafting);
                updateUI();
                
                displayText('You successfully craft an Iron Bar!');
                displayText('You gained 75 Crafting experience!');
            } else {
                displayText('You need 1 Iron Ore to craft an Iron Bar!');
            }
            break;
            
        case 'steel_bar':
            if (hasItem('Iron Ore') && hasItem('Coal')) {
                removeItemFromInventory('Iron Ore');
                removeItemFromInventory('Coal');
                addItemToInventory('Steel Bar');
                
                skillXP.crafting += 100;
                player.experience += 100;
                checkLevelUp('crafting', skillXP.crafting);
                updateUI();
                
                displayText('You successfully craft a Steel Bar!');
                displayText('You gained 100 Crafting experience!');
            } else {
                displayText('You need 1 Iron Ore and 1 Coal to craft a Steel Bar!');
            }
            break;
            
        case 'leather_gloves':
            if (hasItem('Leather')) {
                removeItemFromInventory('Leather');
                addItemToInventory('Leather Gloves');
                
                skillXP.crafting += 30;
                player.experience += 30;
                checkLevelUp('crafting', skillXP.crafting);
                updateUI();
                
                displayText('You successfully craft Leather Gloves!');
                displayText('You gained 30 Crafting experience!');
            } else {
                displayText('You need 1 Leather to craft Leather Gloves!');
            }
            break;
            
        case 'pottery':
            if (hasItem('Clay')) {
                removeItemFromInventory('Clay');
                addItemToInventory('Pottery');
                
                skillXP.crafting += 25;
                player.experience += 25;
                checkLevelUp('crafting', skillXP.crafting);
                updateUI();
                
                displayText('You successfully craft Pottery!');
                displayText('You gained 25 Crafting experience!');
            } else {
                displayText('You need 1 Clay to craft Pottery!');
            }
            break;
            
        case 'bronze_arrows':
            if (hasItem('Feather') && hasItem('Bronze Bar')) {
                removeItemFromInventory('Feather');
                removeItemFromInventory('Bronze Bar');
                addItemToInventory('Bronze Arrow');
                
                skillXP.crafting += 30;
                player.experience += 30;
                checkLevelUp('crafting', skillXP.crafting);
                updateUI();
                
                displayText('You successfully craft Bronze Arrows!');
                displayText('You gained 30 Crafting experience!');
            } else {
                displayText('You need 1 Feather and 1 Bronze Bar to craft Bronze Arrows!');
            }
            break;
            
        case 'iron_arrows':
            if (hasItem('Feather') && hasItem('Iron Bar')) {
                removeItemFromInventory('Feather');
                removeItemFromInventory('Iron Bar');
                addItemToInventory('Iron Arrow');
                
                skillXP.crafting += 45;
                player.experience += 45;
                checkLevelUp('crafting', skillXP.crafting);
                updateUI();
                
                displayText('You successfully craft Iron Arrows!');
                displayText('You gained 45 Crafting experience!');
            } else {
                displayText('You need 1 Feather and 1 Iron Bar to craft Iron Arrows!');
            }
            break;
            
        default:
            displayText('This crafting recipe is under development.');
            break;
    }
    
    addOption('Continue Crafting', showCraftingWorkshop);
    addOption('Back to Main Menu', showMainMenu, 'back');
}

// Bank System
function showBank() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         BANK OF RUNESCAPE');
    displayText('========================================');
    displayText('');
    displayText('Welcome to your bank account!');
    displayText('Store and organize your items safely.');
    displayText('');
    displayText('Bank Options:');
    displayText('');
    
    addOption('Deposit Items', bankDeposit);
    addOption('Withdraw Items', bankWithdraw);
    addOption('View Bank Contents', bankView);
    addOption('Bank PIN Settings', bankPinSettings);
    addOption('Back to Main Menu', showMainMenu, 'back');
}

// Bank Deposit
function bankDeposit() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         DEPOSIT ITEMS');
    displayText('========================================');
    displayText('');
    displayText('Your Inventory:');
    displayText('');
    
    if (player.inventory.length === 0) {
        displayText('You have no items to deposit!');
    } else {
        player.inventory.forEach((item, index) => {
            if (item.quantity > 1) {
                displayText(`${index + 1}. ${item.name} (${item.quantity})`);
            } else {
                displayText(`${index + 1}. ${item.name}`);
            }
        });
        displayText('');
        displayText('Choose items to deposit:');
        
        // Add deposit buttons for each item
        player.inventory.forEach((item, index) => {
            if (item.quantity > 1) {
                addOption(`Deposit ${item.name} (${item.quantity})`, () => depositItem(index));
            } else {
                addOption(`Deposit ${item.name}`, () => depositItem(index));
            }
        });
    }
    
    addOption('Back to Bank', showBank);
}

// Deposit item
function depositItem(index) {
    if (index >= 0 && index < player.inventory.length) {
        const item = player.inventory[index];
        
        // Check if item already exists in bank
        const existingBankItem = player.bank_items.find(bankItem => bankItem.name === item.name);
        if (existingBankItem && isStackable(item.name)) {
            // Stack with existing item
            existingBankItem.quantity += item.quantity;
            displayText(`You deposited ${item.quantity}x ${item.name} in the bank! (Total: ${existingBankItem.quantity})`);
        } else {
            // Add as new item
            player.bank_items.push({ name: item.name, quantity: item.quantity });
            displayText(`You deposited ${item.quantity}x ${item.name} in the bank!`);
        }
        
        // Remove from inventory
        player.inventory.splice(index, 1);
        updateUI();
    }
    
    setTimeout(() => bankDeposit(), 2000);
}

// Bank Withdraw
function bankWithdraw() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         WITHDRAW ITEMS');
    displayText('========================================');
    displayText('');
    displayText('Bank Contents:');
    displayText('');
    
    if (player.bank_items.length === 0) {
        displayText('Your bank is currently empty.');
    } else {
        player.bank_items.forEach((item, index) => {
            if (item.quantity > 1) {
                displayText(`${index + 1}. ${item.name} (${item.quantity})`);
            } else {
                displayText(`${index + 1}. ${item.name}`);
            }
        });
        displayText('');
        displayText('Choose items to withdraw:');
        
        // Add withdraw buttons for each item
        player.bank_items.forEach((item, index) => {
            if (item.quantity > 1) {
                addOption(`Withdraw ${item.name} (${item.quantity})`, () => withdrawItem(index));
            } else {
                addOption(`Withdraw ${item.name}`, () => withdrawItem(index));
            }
        });
    }
    
    addOption('Back to Bank', showBank);
}

// Withdraw item
function withdrawItem(index) {
    if (index >= 0 && index < player.bank_items.length) {
        const item = player.bank_items[index];
        
        // Check if item already exists in inventory
        const existingInventoryItem = player.inventory.find(invItem => invItem.name === item.name);
        if (existingInventoryItem && isStackable(item.name)) {
            // Stack with existing item
            existingInventoryItem.quantity += item.quantity;
            displayText(`You withdrew ${item.quantity}x ${item.name} from the bank! (Total: ${existingInventoryItem.quantity})`);
        } else {
            // Add as new item
            addItemToInventory(item.name, item.quantity);
        }
        
        // Remove from bank
        player.bank_items.splice(index, 1);
        updateUI();
    }
    
    setTimeout(() => bankWithdraw(), 2000);
}

// Bank View
function bankView() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         BANK CONTENTS');
    displayText('========================================');
    displayText('');
    
    if (player.bank_items.length === 0) {
        displayText('Your bank is currently empty.');
    } else {
        displayText('Bank Items:');
        player.bank_items.forEach((item, index) => {
            if (item.quantity > 1) {
                displayText(`${index + 1}. ${item.name} (${item.quantity})`);
            } else {
                displayText(`${index + 1}. ${item.name}`);
            }
        });
    }
    
    displayText('');
    displayText(`Total items in bank: ${player.bank_items.length}`);
    
    addOption('Back to Bank', showBank);
}

// Bank PIN Settings
function bankPinSettings() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         BANK PIN SETTINGS');
    displayText('========================================');
    displayText('');
    displayText('Bank PIN provides extra security for your account.');
    displayText(`Current PIN: ${player.bank_pin}`);
    displayText('');
    displayText('PIN settings are under development.');
    
    addOption('Back to Bank', showBank);
}

// Magic Shop (Mage Tower)
function showMagicShop() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         MAGIC SHOP');
    displayText('========================================');
    displayText('');
    displayText('Welcome to the Magic Shop!');
    displayText('Here you can buy magical supplies and runes.');
    displayText('');
    displayText('Available Items:');
    displayText('');
    displayText('1. Air Rune - 5 coins');
    displayText('2. Fire Rune - 8 coins');
    displayText('3. Water Rune - 6 coins');
    displayText('4. Earth Rune - 6 coins');
    displayText('5. Chaos Rune - 15 coins');
    displayText('6. Staff of Fire - 200 coins');
    displayText('7. Wizard Hat - 100 coins');
    displayText('');
    
    addOption('Buy Air Rune (5 coins)', () => buyMagicItem('Air Rune', 5));
    addOption('Buy Fire Rune (8 coins)', () => buyMagicItem('Fire Rune', 8));
    addOption('Buy Water Rune (6 coins)', () => buyMagicItem('Water Rune', 6));
    addOption('Buy Earth Rune (6 coins)', () => buyMagicItem('Earth Rune', 6));
    addOption('Buy Chaos Rune (15 coins)', () => buyMagicItem('Chaos Rune', 15));
    addOption('Buy Staff of Fire (200 coins)', () => buyMagicItem('Staff of Fire', 200));
    addOption('Buy Wizard Hat (100 coins)', () => buyMagicItem('Wizard Hat', 100));
    addOption('Back to Main Menu', showMainMenu, 'back');
}

// Buy magic item
function buyMagicItem(item, cost) {
    if (player.coins >= cost) {
        player.coins -= cost;
        player.inventory.push(item);
        displayText(`You bought ${item} for ${cost} coins!`);
        updateUI();
    } else {
        displayText('You don\'t have enough coins for that item!');
    }
    
    setTimeout(() => showMagicShop(), 2000);
}

// Chat System (Mage Tower)
function showChatSystem() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         CHAT SYSTEM');
    displayText('========================================');
    displayText('');
    displayText('Welcome to the Chat System!');
    displayText('Chat with other mages and share magical knowledge.');
    displayText('');
    displayText('Chat System is under development.');
    displayText('In the future, you will be able to:');
    displayText('- Chat with other players');
    displayText('- Share magical discoveries');
    displayText('- Form study groups');
    displayText('- Trade magical items');
    displayText('');
    
    addOption('Back to Main Menu', showMainMenu, 'back');
}

// Rune Crafting (Mage Tower)
function showRuneCrafting() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         RUNE CRAFTING');
    displayText('========================================');
    displayText('');
    displayText('Welcome to Rune Crafting!');
    displayText('Create magical runes from rune essence.');
    displayText('');
    displayText(`Your Magic Level: ${player.magic}`);
    displayText('');
    displayText('Available Runes to Craft:');
    displayText('');
    displayText('1. Air Rune - Level 1 (Rune Essence)');
    displayText('2. Fire Rune - Level 1 (Rune Essence)');
    displayText('3. Water Rune - Level 5 (Rune Essence)');
    displayText('4. Earth Rune - Level 9 (Rune Essence)');
    displayText('5. Chaos Rune - Level 35 (Rune Essence)');
    displayText('');
    
    addOption('Craft Air Rune', () => craftRune('air'));
    addOption('Craft Fire Rune', () => craftRune('fire'));
    addOption('Craft Water Rune', () => craftRune('water'));
    addOption('Craft Earth Rune', () => craftRune('earth'));
    addOption('Craft Chaos Rune', () => craftRune('chaos'));
    addOption('Back to Main Menu', showMainMenu, 'back');
}

// Craft rune
function craftRune(runeType) {
    if (hasItem('Rune Essence')) {
        removeItemFromInventory('Rune Essence');
        
        let runeName, xp;
        switch(runeType) {
            case 'air':
                runeName = 'Air Rune';
                xp = 25;
                break;
            case 'fire':
                runeName = 'Fire Rune';
                xp = 25;
                break;
            case 'water':
                runeName = 'Water Rune';
                xp = 30;
                break;
            case 'earth':
                runeName = 'Earth Rune';
                xp = 35;
                break;
            case 'chaos':
                runeName = 'Chaos Rune';
                xp = 50;
                break;
        }
        
        addItemToInventory(runeName);
        skillXP.magic += xp;
        player.experience += xp;
        checkLevelUp('magic', skillXP.magic);
        updateUI();
        
        displayText(`You successfully craft a ${runeName}!`);
        displayText(`You gained ${xp} Magic experience!`);
    } else {
        displayText('You need Rune Essence to craft runes!');
    }
    
    setTimeout(() => showRuneCrafting(), 2000);
}

// House Settings Functions
function changeHouseName() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         CHANGE HOUSE NAME');
    displayText('========================================');
    displayText('');
    displayText('House naming system is under development.');
    displayText('Your house will keep its current name for now.');
    
    addOption('Back to House Settings', houseSettings);
}

function setHouseTheme() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         SET HOUSE THEME');
    displayText('========================================');
    displayText('');
    displayText('House theming system is under development.');
    displayText('Your house will keep its current theme for now.');
    
    addOption('Back to House Settings', houseSettings);
}

function manageHouseAccess() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         MANAGE HOUSE ACCESS');
    displayText('========================================');
    displayText('');
    displayText('House access management is under development.');
    displayText('Your house is currently private.');
    
    addOption('Back to House Settings', houseSettings);
}

// Organize storage in house
function organizeStorage() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         HOUSE STORAGE BOX');
    displayText('========================================');
    displayText('');
    displayText('You open your house storage box...');
    displayText('A magical storage container that can hold up to 20 items.');
    displayText('');
    
    // Initialize house storage if it doesn't exist
    if (!player.house_storage) {
        player.house_storage = [];
    }
    
    displayText(`Storage Box Contents: ${player.house_storage.length}/20 items`);
    displayText('');
    
    if (player.house_storage.length === 0) {
        displayText('Your storage box is empty.');
    } else {
        displayText('Stored Items:');
        player.house_storage.forEach((item, index) => {
            if (item.quantity > 1) {
                displayText(`${index + 1}. ${item.name} (${item.quantity})`);
            } else {
                displayText(`${index + 1}. ${item.name}`);
            }
        });
    }
    
    displayText('');
    displayText('Storage Options:');
    displayText('');
    
    addOption('Store Items from Inventory', storeItemsInHouse);
    addOption('Withdraw Items from Storage', withdrawItemsFromHouse);
    addOption('View Storage Contents', viewHouseStorage);
    addOption('Sort Storage by Name', () => sortHouseStorage('name'));
    addOption('Sort Storage by Type', () => sortHouseStorage('type'));
    addOption('Sort Storage by Quantity', () => sortHouseStorage('quantity'));
    addOption('Search Storage', searchHouseStorage);
    addOption('Exit Storage Box', enterPlayerHouse);
}

// Store items from inventory to house storage
function storeItemsInHouse() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         STORE ITEMS IN HOUSE');
    displayText('========================================');
    displayText('');
    
    if (player.inventory.length === 0) {
        displayText('Your inventory is empty!');
        addOption('Back to Storage Box', organizeStorage);
        return;
    }
    
    if (player.house_storage.length >= 20) {
        displayText('Your storage box is full! (20/20 items)');
        displayText('Remove some items before storing new ones.');
        addOption('Back to Storage Box', organizeStorage);
        return;
    }
    
    displayText('Choose items to store in your house storage:');
    displayText('');
    
    player.inventory.forEach((item, index) => {
        if (item.quantity > 1) {
            displayText(`${index + 1}. ${item.name} (${item.quantity})`);
            addOption(`Store ${item.name} (${item.quantity})`, () => storeItemInHouse(index));
        } else {
            displayText(`${index + 1}. ${item.name}`);
            addOption(`Store ${item.name}`, () => storeItemInHouse(index));
        }
    });
    
    addOption('Back to Storage Box', organizeStorage);
}

// Store a specific item in house storage
function storeItemInHouse(inventoryIndex) {
    if (inventoryIndex >= 0 && inventoryIndex < player.inventory.length) {
        const item = player.inventory[inventoryIndex];
        
        // Check if storage is full
        if (player.house_storage.length >= 20) {
            displayText('Storage box is full! Remove some items first.');
            setTimeout(() => storeItemsInHouse(), 2000);
            return;
        }
        
        // Check if item already exists in storage and is stackable
        const existingStorageItem = player.house_storage.find(storageItem => storageItem.name === item.name);
        if (existingStorageItem && isStackable(item.name)) {
            // Stack with existing item
            existingStorageItem.quantity += item.quantity;
            displayText(`You stored ${item.quantity}x ${item.name} in your storage box! (Total: ${existingStorageItem.quantity})`);
        } else {
            // Add as new item
            player.house_storage.push({ name: item.name, quantity: item.quantity });
            displayText(`You stored ${item.quantity}x ${item.name} in your storage box!`);
        }
        
        // Remove from inventory
        player.inventory.splice(inventoryIndex, 1);
        updateUI();
        
        setTimeout(() => storeItemsInHouse(), 2000);
    }
}

// Withdraw items from house storage
function withdrawItemsFromHouse() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         WITHDRAW FROM STORAGE');
    displayText('========================================');
    displayText('');
    
    if (!player.house_storage || player.house_storage.length === 0) {
        displayText('Your storage box is empty!');
        addOption('Back to Storage Box', organizeStorage);
        return;
    }
    
    displayText('Choose items to withdraw from storage:');
    displayText('');
    
    player.house_storage.forEach((item, index) => {
        if (item.quantity > 1) {
            displayText(`${index + 1}. ${item.name} (${item.quantity})`);
            addOption(`Withdraw ${item.name} (${item.quantity})`, () => withdrawItemFromHouse(index));
        } else {
            displayText(`${index + 1}. ${item.name}`);
            addOption(`Withdraw ${item.name}`, () => withdrawItemFromHouse(index));
        }
    });
    
    addOption('Back to Storage Box', organizeStorage);
}

// Withdraw a specific item from house storage
function withdrawItemFromHouse(storageIndex) {
    if (storageIndex >= 0 && storageIndex < player.house_storage.length) {
        const item = player.house_storage[storageIndex];
        
        // Check if inventory is full
        if (player.inventory.length >= 28) {
            displayText('Your inventory is full! Remove some items first.');
            setTimeout(() => withdrawItemsFromHouse(), 2000);
            return;
        }
        
        // Check if item already exists in inventory and is stackable
        const existingInventoryItem = player.inventory.find(invItem => invItem.name === item.name);
        if (existingInventoryItem && isStackable(item.name)) {
            // Stack with existing item
            existingInventoryItem.quantity += item.quantity;
            displayText(`You withdrew ${item.quantity}x ${item.name} from storage! (Total: ${existingInventoryItem.quantity})`);
        } else {
            // Add as new item
            addItemToInventory(item.name, item.quantity);
        }
        
        // Remove from storage
        player.house_storage.splice(storageIndex, 1);
        updateUI();
        
        setTimeout(() => withdrawItemsFromHouse(), 2000);
    }
}

// View house storage contents
function viewHouseStorage() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         STORAGE CONTENTS');
    displayText('========================================');
    displayText('');
    
    if (!player.house_storage || player.house_storage.length === 0) {
        displayText('Your storage box is currently empty.');
    } else {
        displayText('Storage Box Items:');
        displayText('');
        
        let totalItems = 0;
        player.house_storage.forEach((item, index) => {
            if (item.quantity > 1) {
                displayText(`${index + 1}. ${item.name} (${item.quantity})`);
                totalItems += item.quantity;
            } else {
                displayText(`${index + 1}. ${item.name}`);
                totalItems += 1;
            }
        });
        
        displayText('');
        displayText(`Storage slots used: ${player.house_storage.length}/20`);
        displayText(`Total items stored: ${totalItems}`);
    }
    
    addOption('Back to Storage Box', organizeStorage);
}

// Sort house storage
function sortHouseStorage(criteria = 'name') {
    if (!player.house_storage) return;
    
    switch(criteria) {
        case 'name':
            player.house_storage.sort((a, b) => a.name.localeCompare(b.name));
            displayText('Storage sorted by name!');
            break;
        case 'quantity':
            player.house_storage.sort((a, b) => b.quantity - a.quantity);
            displayText('Storage sorted by quantity!');
            break;
        case 'type':
            const typeOrder = ['weapon', 'armor', 'tool', 'food', 'material', 'magic', 'quest'];
            player.house_storage.sort((a, b) => {
                const aType = getItemType(a.name);
                const bType = getItemType(b.name);
                return typeOrder.indexOf(aType) - typeOrder.indexOf(bType);
            });
            displayText('Storage sorted by type!');
            break;
    }
    
    setTimeout(() => organizeStorage(), 1500);
}

// Search house storage
function searchHouseStorage() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         SEARCH STORAGE');
    displayText('========================================');
    displayText('');
    displayText('Enter a search term to find items in your storage:');
    displayText('');
    
    // Create search input
    const searchInput = document.createElement('input');
    searchInput.type = 'text';
    searchInput.placeholder = 'Enter item name...';
    searchInput.id = 'storageSearchInput';
    searchInput.style.width = '200px';
    searchInput.style.padding = '5px';
    searchInput.style.margin = '10px';
    
    const searchButton = document.createElement('button');
    searchButton.textContent = 'Search';
    searchButton.onclick = performStorageSearch;
    searchButton.style.padding = '5px 15px';
    searchButton.style.margin = '5px';
    
    const gameOutput = document.getElementById('gameOutput');
    gameOutput.appendChild(searchInput);
    gameOutput.appendChild(searchButton);
    
    addOption('Search', performStorageSearch);
    addOption('Back to Storage Box', organizeStorage);
}

// Perform storage search
function performStorageSearch() {
    const searchTerm = document.getElementById('storageSearchInput').value.toLowerCase();
    
    if (!searchTerm) {
        displayText('Please enter a search term.');
        return;
    }
    
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText(`         SEARCH RESULTS: "${searchTerm}"`);
    displayText('========================================');
    displayText('');
    
    if (!player.house_storage || player.house_storage.length === 0) {
        displayText('Your storage box is empty.');
    } else {
        const results = player.house_storage.filter(item => 
            item.name.toLowerCase().includes(searchTerm)
        );
        
        if (results.length === 0) {
            displayText(`No items found matching "${searchTerm}".`);
        } else {
            displayText(`Found ${results.length} item(s):`);
            displayText('');
            results.forEach((item, index) => {
                if (item.quantity > 1) {
                    displayText(`${index + 1}. ${item.name} (${item.quantity})`);
                } else {
                    displayText(`${index + 1}. ${item.name}`);
                }
            });
        }
    }
    
    // Remove search input
    const searchInput = document.getElementById('storageSearchInput');
    const searchButton = document.querySelector('button[onclick="performStorageSearch()"]');
    if (searchInput) searchInput.remove();
    if (searchButton) searchButton.remove();
    
    addOption('Back to Storage Box', organizeStorage);
}

// Utility functions for house storage
function isHouseStorageFull() {
    return player.house_storage && player.house_storage.length >= 20;
}

function getHouseStorageSpace() {
    return 20 - (player.house_storage ? player.house_storage.length : 0);
}

function getHouseStorageItemCount() {
    if (!player.house_storage) return 0;
    return player.house_storage.reduce((total, item) => total + item.quantity, 0);
}

function hasItemInHouseStorage(itemName, quantity = 1) {
    if (!player.house_storage) return false;
    const item = player.house_storage.find(storageItem => storageItem.name === itemName);
    return item && item.quantity >= quantity;
}

function getItemQuantityInHouseStorage(itemName) {
    if (!player.house_storage) return 0;
    const item = player.house_storage.find(storageItem => storageItem.name === itemName);
    return item ? item.quantity : 0;
}

// ========================================
// INVENTORY HELPER FUNCTIONS
// ========================================
// 
// NEW INVENTORY STACKING SYSTEM
// =============================
// 
// The inventory system has been upgraded from a simple array of strings
// to an array of objects with 'name' and 'quantity' properties.
// 
// This allows certain items (consumables, fish, wood, materials, etc.)
// to stack together instead of creating infinite separate entries.
// 
// Key Benefits:
// - Prevents inventory from becoming an "infinite list"
// - More realistic item management
// - Better organization and readability
// - Easier to manage large quantities of items
// 
// Stackable Items Include:
// - Consumables: Bread, Health Potion, Prayer Potion, etc.
// - Food: Shrimp, Sardine, Herring, Trout, Lobster, Swordfish, Shark
// - Materials: Clay, Leather, Copper Ore, Tin Ore, Iron Ore, Coal
// - Wood: Logs, Oak Logs, Willow Logs, Maple Logs, Yew Logs, Magic Logs
// - Runes: Air Rune, Fire Rune, Water Rune, Earth Rune, Chaos Rune
// - Quest Items: Egg, Pot of Flour, Bucket of Milk
// 
// Non-Stackable Items:
// - Weapons: Bronze Sword, Iron Sword, Steel Sword, etc.
// - Armor: Wooden Shield, Iron Shield, etc.
// - Tools: Fishing Rod, Axe, Pickaxe, etc.
// - Unique Items: Chef's Hat, etc.
// 
// Usage Examples:
// - addItemToInventory('Bread') - Adds bread, stacks if already exists
// - removeItemFromInventory('Bread', 2) - Removes 2 bread from stack
// - hasItem('Bread', 3) - Checks if player has at least 3 bread
// - getItemQuantity('Bread') - Returns current bread quantity
// 
// Migration:
// - Old save files are automatically converted to new format
// - Existing inventory items are preserved and converted
// - Bank items are also migrated to new format
// 
// ========================================

// Define which items are stackable
const stackableItems = [
    // Consumables
    'Bread', 'Health Potion', 'Prayer Potion', 'Energy Potion', 'Strength Potion',
    // Food items
    'Shrimp', 'Sardine', 'Herring', 'Trout', 'Lobster', 'Swordfish', 'Shark',
    // Materials
    'Clay', 'Leather', 'Copper Ore', 'Tin Ore', 'Iron Ore', 'Coal', 'Bronze Bar', 'Iron Bar', 'Steel Bar',
    // Wood and resources
    'Logs', 'Oak Logs', 'Willow Logs', 'Maple Logs', 'Yew Logs', 'Magic Logs',
    // Runes
    'Air Rune', 'Fire Rune', 'Water Rune', 'Earth Rune', 'Chaos Rune', 'Rune Essence',
    // Quest items (some might be stackable)
    'Egg', 'Pot of Flour', 'Bucket of Milk',
    // Crafting materials
    'Feather',
    // Ammunition
    'Bronze Arrow', 'Iron Arrow'
];

// Check if an item is stackable
function isStackable(itemName) {
    return stackableItems.includes(itemName);
}

// Add item to inventory with stacking support
function addItemToInventory(itemName, quantity = 1) {
    // Check if item is stackable and already exists in inventory
    if (isStackable(itemName)) {
        const existingItem = player.inventory.find(item => item.name === itemName);
        if (existingItem) {
            existingItem.quantity += quantity;
            return true;
        }
    }
    
    // Add as new item
    player.inventory.push({ name: itemName, quantity: quantity });
    return true;
}

// Remove item from inventory
function removeItemFromInventory(itemName, quantity = 1) {
    const itemIndex = player.inventory.findIndex(item => item.name === itemName);
    if (itemIndex === -1) return false;
    
    const item = player.inventory[itemIndex];
    if (item.quantity <= quantity) {
        // Remove entire stack
        player.inventory.splice(itemIndex, 1);
    } else {
        // Reduce quantity
        item.quantity -= quantity;
    }
    return true;
}

// Check if player has an item
function hasItem(itemName, quantity = 1) {
    const item = player.inventory.find(item => item.name === itemName);
    return item && item.quantity >= quantity;
}

// Get item quantity
function getItemQuantity(itemName) {
    const item = player.inventory.find(item => item.name === itemName);
    return item ? item.quantity : 0;
}

// Find item index in inventory
function findItemIndex(itemName) {
    return player.inventory.findIndex(item => item.name === itemName);
}

// Get total inventory weight (if weight system is implemented later)
function getInventoryWeight() {
    // Placeholder for future weight system
    return player.inventory.length;
}

// Check if inventory is full (28 slots)
function isInventoryFull() {
    return player.inventory.length >= 28;
}

// Get inventory space remaining
function getInventorySpace() {
    return 28 - player.inventory.length;
}

// Count total items in inventory (including quantities)
function getTotalItemCount() {
    return player.inventory.reduce((total, item) => total + item.quantity, 0);
}

// Get all items of a specific type
function getItemsByType(type) {
    return player.inventory.filter(item => {
        // This is a simple type checking - could be enhanced with item type data
        if (type === 'food') {
            return ['Bread', 'Shrimp', 'Sardine', 'Herring', 'Trout', 'Lobster', 'Swordfish', 'Shark'].includes(item.name);
        } else if (type === 'weapon') {
            return ['Bronze Sword', 'Iron Sword', 'Steel Sword', 'Adamant Sword'].includes(item.name);
        } else if (type === 'armor') {
            return ['Wooden Shield', 'Iron Shield'].includes(item.name);
        } else if (type === 'tool') {
            return ['Fishing Rod', 'Axe', 'Pickaxe', 'Tinderbox'].includes(item.name);
        } else if (type === 'material') {
            return ['Clay', 'Leather', 'Copper Ore', 'Tin Ore', 'Iron Ore', 'Coal'].includes(item.name);
        }
        return false;
    });
}

// Sort inventory by name, type, or value
function sortInventory(criteria = 'name') {
    switch(criteria) {
        case 'name':
            player.inventory.sort((a, b) => a.name.localeCompare(b.name));
            break;
        case 'quantity':
            player.inventory.sort((a, b) => b.quantity - a.quantity);
            break;
        case 'type':
            // Simple type-based sorting
            const typeOrder = ['weapon', 'armor', 'tool', 'food', 'material', 'magic', 'quest'];
            player.inventory.sort((a, b) => {
                const aType = getItemType(a.name);
                const bType = getItemType(b.name);
                return typeOrder.indexOf(aType) - typeOrder.indexOf(bType);
            });
            break;
    }
}

// Helper function to get item type
function getItemType(itemName) {
    if (['Bronze Sword', 'Iron Sword', 'Steel Sword', 'Adamant Sword'].includes(itemName)) return 'weapon';
    if (['Wooden Shield', 'Iron Shield'].includes(itemName)) return 'armor';
    if (['Fishing Rod', 'Axe', 'Pickaxe', 'Tinderbox'].includes(itemName)) return 'tool';
    if (['Bread', 'Shrimp', 'Sardine', 'Herring', 'Trout', 'Lobster', 'Swordfish', 'Shark'].includes(itemName)) return 'food';
    if (['Clay', 'Leather', 'Copper Ore', 'Tin Ore', 'Iron Ore', 'Coal', 'Feather'].includes(itemName)) return 'material';
    if (['Air Rune', 'Fire Rune', 'Water Rune', 'Earth Rune', 'Chaos Rune', 'Rune Essence'].includes(itemName)) return 'magic';
    if (['Egg', 'Pot of Flour', 'Bucket of Milk'].includes(itemName)) return 'quest';
    if (['Bronze Arrow', 'Iron Arrow'].includes(itemName)) return 'ammunition';
    return 'misc';
}

// Use item from inventory
function useItemFromInventory() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         USE ITEM FROM INVENTORY');
    displayText('========================================');
    displayText('');
    
    if (player.inventory.length === 0) {
        displayText('Your inventory is empty!');
        addOption('Back to Inventory', showInventory);
        return;
    }
    
    displayText('Select an item to use:');
    displayText('');
    
    player.inventory.forEach((item, index) => {
        if (item.quantity > 1) {
            displayText(`${index + 1}. ${item.name} (${item.quantity})`);
        } else {
            displayText(`${index + 1}. ${item.name}`);
        }
    });
    displayText('');
    
    // Add use buttons for each item
    player.inventory.forEach((item, index) => {
        if (item.quantity > 1) {
            addOption(`Use ${item.name} (${item.quantity})`, () => useItem(item, index));
        } else {
            addOption(`Use ${item.name}`, () => useItem(item, index));
        }
    });
    
    addOption('Back to Inventory', showInventory);
}

// Use a specific item
function useItem(item, index) {
    clearOutput();
    clearOptions();
    
    const itemType = getItemType(item.name);
    
    displayText(`Using ${item.name}...`);
    displayText('');
    
    switch(itemType) {
        case 'food':
            useFoodItem(item, index);
            break;
        case 'weapon':
            useWeaponItem(item, index);
            break;
        case 'armor':
            useArmorItem(item, index);
            break;
        case 'tool':
            useToolItem(item, index);
            break;
        case 'magic':
            useMagicItem(item, index);
            break;
        case 'quest':
            useQuestItem(item, index);
            break;
        default:
            displayText(`You don't know how to use ${item.name}.`);
            addOption('Back to Use Item Menu', useItemFromInventory);
            break;
    }
}

// Use food items
function useFoodItem(item, index) {
    let healAmount = 0;
    let message = '';
    
    switch(item.name) {
        case 'Bread':
            healAmount = 2;
            message = 'You eat a loaf of bread. It tastes fresh and wholesome.';
            break;
        case 'Shrimp':
            healAmount = 3;
            message = 'You eat some shrimp. It\'s quite tasty.';
            break;
        case 'Sardine':
            healAmount = 4;
            message = 'You eat a sardine. It\'s salty but good.';
            break;
        case 'Herring':
            healAmount = 5;
            message = 'You eat a herring. It\'s quite filling.';
            break;
        case 'Trout':
            healAmount = 7;
            message = 'You eat a trout. It\'s delicious!';
            break;
        case 'Lobster':
            healAmount = 12;
            message = 'You eat a lobster. It\'s a real treat!';
            break;
        case 'Swordfish':
            healAmount = 14;
            message = 'You eat a swordfish. It\'s very satisfying!';
            break;
        case 'Shark':
            healAmount = 20;
            message = 'You eat a shark. It\'s incredibly filling!';
            break;
        default:
            healAmount = 1;
            message = `You eat some ${item.name}.`;
            break;
    }
    
    displayText(message);
    displayText(`You heal ${healAmount} hitpoints!`);
    
    player.currentHP = Math.min(player.maxHP, player.currentHP + healAmount);
    
    // Remove one item from inventory
    if (item.quantity > 1) {
        item.quantity--;
    } else {
        player.inventory.splice(index, 1);
    }
    
    updateUI();
    
    displayText('');
    addOption('Continue', useItemFromInventory);
}

// Use weapon items
function useWeaponItem(item, index) {
    displayText(`You equip ${item.name}.`);
    displayText('This weapon is now ready for combat!');
    displayText('');
    displayText('Note: Weapon damage is automatically calculated in combat.');
    
    addOption('Continue', useItemFromInventory);
}

// Use armor items
function useArmorItem(item, index) {
    displayText(`You equip ${item.name}.`);
    displayText('This armor provides additional defence in combat!');
    displayText('');
    displayText('Note: Armor defence is automatically calculated in combat.');
    
    addOption('Continue', useItemFromInventory);
}

// Use tool items
function useToolItem(item, index) {
    displayText(`You ready ${item.name}.`);
    displayText('This tool is now available for its specific purpose.');
    displayText('');
    
    switch(item.name) {
        case 'Fishing Rod':
            displayText('Use it at fishing spots to catch fish.');
            break;
        case 'Axe':
            displayText('Use it to cut down trees for woodcutting.');
            break;
        case 'Pickaxe':
            displayText('Use it to mine rocks and ores.');
            break;
        case 'Tinderbox':
            displayText('Use it to light fires and cook food.');
            break;
    }
    
    addOption('Continue', useItemFromInventory);
}

// Use magic items
function useMagicItem(item, index) {
    displayText(`You examine ${item.name}.`);
    displayText('This magical item contains mystical energy.');
    displayText('');
    
    if (item.name === 'Rune Essence') {
        displayText('Rune Essence can be used to craft magical runes.');
    } else {
        displayText('This rune can be used for spellcasting.');
    }
    
    addOption('Continue', useItemFromInventory);
}

// Use quest items
function useQuestItem(item, index) {
    displayText(`You examine ${item.name}.`);
    displayText('This is a quest item with special significance.');
    displayText('');
    
    switch(item.name) {
        case 'Egg':
            displayText('This egg is needed for the Cook\'s Assistant quest.');
            break;
        case 'Pot of Flour':
            displayText('This flour is needed for the Cook\'s Assistant quest.');
            break;
        case 'Bucket of Milk':
            displayText('This milk is needed for the Cook\'s Assistant quest.');
            break;
    }
    
    displayText('Quest items cannot be used directly but are required for quest completion.');
    
    addOption('Continue', useItemFromInventory);
}
