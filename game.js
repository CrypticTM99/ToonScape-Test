function exploreTrollStronghold() {
    clearOutput();
    clearOptions();
    displayText('========================================');
    displayText('         TROLL STRONGHOLD');
    displayText('========================================');
    displayText('');
    displayText('You approach a crude fortress carved into the mountain.');
    displayText('Troll banners flap in the cold wind. This won\'t be easy.');
    displayText('');
    
    addOption('Fight Gate Guards', () => startRoadCombat('Troll Guard', 30, 70, 24, 20, 'Club', 'BURTHORPE'));
    addOption('Sneak Through Side Passage', () => {
        const success = Math.random() < 0.5 + player.agility * 0.01;
        if (success) {
            const xp = awardCappedXP('troll_stronghold_sneak', 'agility', 12, 40);
            displayText(`You slip past some patrols. (+${xp} Agility XP)`);
        } else {
            displayText('You knock a rock loose. A troll hears you!');
            startRoadCombat('Troll Scout', 26, 55, 20, 16, 'Dagger', 'BURTHORPE');
        }
    });
    addOption('Raid the Armory', () => {
        const loot = Math.random() < 0.5 ? 'Iron Bar' : 'Steel Bar';
        addItemToInventory(loot);
        const xp = awardCappedXP('troll_stronghold_raid', 'thieving', 15, 40);
        displayText(`You grab a ${loot} from a rickety shelf. (+${xp} Thieving XP)`);
        updateUI();
        addOption('Back', exploreTrollStronghold);
    });
    addOption('Challenge Troll Captain', () => startRoadCombat('Troll Captain', 36, 90, 28, 24, 'Maul', 'BURTHORPE'));
    addOption('Leave Stronghold', exploreDeathPlateau);
}
function exploreWarriorsGuild() {
    clearOutput();
    clearOptions();
    displayText('========================================');
    displayText('         WARRIORS\' GUILD (UNDER DEVELOPMENT)');
    displayText('========================================');
    displayText('');
    displayText('The guild halls echo with the clashing of practice weapons.');
    displayText('Training dummies await a proper combat system expansion.');
    displayText('For now, the guildmaster nods at you approvingly.');
    addOption('Back to Burthorpe', exploreArea);
}

function visitBurthorpeSupplyStore() {
    clearOutput();
    clearOptions();
    displayText('========================================');
    displayText('         BURTHORPE SUPPLY STORE');
    displayText('========================================');
    displayText('');
    displayText('Basic supplies for frontier adventurers.');
    addOption('General Goods', () => visitSpecificShop('general'));
    addOption('Metals & Ores', () => visitSpecificShop('metals'));
    addOption('Back to Burthorpe', exploreArea);
}

function visitBurthorpeFurnace() {
    clearOutput();
    clearOptions();
    displayText('========================================');
    displayText('         FURNACE & ANVIL');
    displayText('========================================');
    displayText('');
    displayText('A hot furnace roars beside a sturdy anvil.');
    addOption('Smelt Bars (Crafting Workshop)', showCraftingWorkshop);
    addOption('Basic Smithing Practice', () => trainSkill('smithing', 35));
    addOption('Back to Burthorpe', exploreArea);
}

function exploreDeathPlateau() {
    clearOutput();
    clearOptions();
    displayText('========================================');
    displayText('         DEATH PLATEAU');
    displayText('========================================');
    displayText('');
    displayText('You reach the windswept paths of Death Plateau.');
    displayText('The route is safer thanks to your intel, but trolls still lurk nearby.');
    addOption('Search for Trolls', () => {
        deathPlateauProgress += 1;
        startRoadCombat('Mountain Troll', 28, 60, 22, 18, 'Club', 'BURTHORPE');
    });
    addOption('Survey the Pass', () => {
        const xp = awardCappedXP('death_plateau_survey', 'defence', 10, 50);
        displayText(`You study the terrain and defensive lines. (+${xp} Defence XP)`);
        deathPlateauProgress += 1;
        addOption('Back', exploreDeathPlateau);
    });
    if (!trollStrongholdDiscovered && deathPlateauProgress >= 5) {
        trollStrongholdDiscovered = true;
        displayText('You spot a rough trail leading to a fortified Troll Stronghold.');
    }
    if (trollStrongholdDiscovered) {
        addOption('Enter Troll Stronghold (Mini-Dungeon)', exploreTrollStronghold);
    }
    addOption('Back to Burthorpe', exploreArea);
}
function fishAtPortDocks() {
	clearOutput();
	clearOptions();
	
	const hasRod = hasItem('Fishing Rod');
	const hasNet = hasItem('Net') || hasItem('Fishing Net');
	const hasHarpoon = hasItem('Harpoon');
	if (!hasRod && !hasNet && !hasHarpoon) {
		displayText('You need a Fishing Rod, Net, or Harpoon to fish here.');
		addOption('Back to Docks', explorePortDocks);
		return;
	}

	displayText('You prepare your gear at the docks...');
	
	if (hasNet) {
		// Net fishing: shrimp/sardine tier
		const catchTable = ['Raw Shrimp', 'Raw Sardine'];
		const catchItem = catchTable[Math.floor(Math.random() * catchTable.length)];
		addItemToInventory(catchItem);
		const xp = 10;
		const awarded = awardCappedXP('portsarim_fish_net', 'fishing', xp, 60);
		displayText(`You net a ${catchItem}! (+${awarded} Fishing XP)`);
	} else if (hasRod) {
		// Rod fishing: herring/trout tier
		const catchTable = ['Raw Herring', 'Raw Trout'];
		const catchItem = catchTable[Math.floor(Math.random() * catchTable.length)];
		addItemToInventory(catchItem);
		const xp = 15;
		const awarded = awardCappedXP('portsarim_fish_rod', 'fishing', xp, 60);
		displayText(`You catch a ${catchItem}! (+${awarded} Fishing XP)`);
	} 
	if (hasHarpoon && Math.random() < 0.35) {
		// Occasional harpoon catch
		const harpoonCatch = Math.random() < 0.5 ? 'Raw Lobster' : 'Raw Swordfish';
		addItemToInventory(harpoonCatch);
		const xp = harpoonCatch === 'Raw Lobster' ? 25 : 35;
		const awarded = awardCappedXP('portsarim_fish_harpoon', 'fishing', xp, 80);
		displayText(`Harpoon strike! You catch a ${harpoonCatch}. (+${awarded} Fishing XP)`);
	}

	updateUI();
	addOption('Fish Again', fishAtPortDocks);
	addOption('Back to Docks', explorePortDocks);
}
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
    
    // Equipment
    equippedArmor: null,
    equippedWeapon: null,
    
    // Skills
    attack: 1, strength: 1, defence: 1, hitpoints: 10,
    ranged: 1, magic: 1, woodcutting: 1, fishing: 1,
    mining: 1, cooking: 1, smithing: 1, crafting: 1,
    fletching: 1, herblore: 1, prayer: 1, slayer: 1,
    farming: 1, firemaking: 1, treasure_hunting: 1,
    agility: 1, thieving: 1, runecrafting: 1, hunter: 1, construction: 1,
    
    // Housing system
    house_level: 1,
    house_rooms: 'Basic Room',
    house_furniture: 'Wooden Chair',
    house_storage: [], // House storage box (up to 20 items)
    
    // Bank system
    bank_items: [],
    bank_pin: '0000',
    
    // Grand Exchange system
    geOrders: {
        buy: [],
        sell: []
    },
    
    // Notifications system
    notifications: []
};

// Skill experience
let skillXP = {
    attack: 0, strength: 0, defence: 0, hitpoints: 0,
    ranged: 0, magic: 0, woodcutting: 0, fishing: 0,
    mining: 0, cooking: 0, smithing: 0, crafting: 0,
    fletching: 0, herblore: 0, prayer: 0, slayer: 0,
    farming: 0, firemaking: 0, treasure_hunting: 0,
    agility: 0, thieving: 0, runecrafting: 0, hunter: 0, construction: 0
};

// Ensure all skills exist on player and skillXP (for backward compatibility with old saves)
function ensureAllSkillsInitialized() {
    const defaultLevels = {
        attack: 1, strength: 1, defence: 1, hitpoints: 10,
        ranged: 1, magic: 1, woodcutting: 1, fishing: 1,
        mining: 1, cooking: 1, smithing: 1, crafting: 1,
        fletching: 1, herblore: 1, prayer: 1, slayer: 1,
        farming: 1, firemaking: 1, treasure_hunting: 1,
        agility: 1, thieving: 1, runecrafting: 1, hunter: 1, construction: 1
    };
    Object.keys(defaultLevels).forEach(key => {
        if (typeof player[key] !== 'number') player[key] = defaultLevels[key];
        if (typeof skillXP[key] !== 'number') skillXP[key] = 0;
    });
}

// Skill icon + category metadata (emoji placeholders)
const skillInfo = {
    // Combat
    attack: { icon: '⚔️', name: 'Attack', category: 'Combat' },
    strength: { icon: '💪', name: 'Strength', category: 'Combat' },
    defence: { icon: '🛡️', name: 'Defence', category: 'Combat' },
    hitpoints: { icon: '❤️', name: 'Hitpoints', category: 'Combat' },
    ranged: { icon: '🏹', name: 'Ranged', category: 'Combat' },
    magic: { icon: '🔮', name: 'Magic', category: 'Combat' },
    prayer: { icon: '✝️', name: 'Prayer', category: 'Combat' },
    slayer: { icon: '🐍', name: 'Slayer', category: 'Combat' },
    // Gathering
    woodcutting: { icon: '🪓', name: 'Woodcutting', category: 'Gathering' },
    fishing: { icon: '🎣', name: 'Fishing', category: 'Gathering' },
    mining: { icon: '⛏️', name: 'Mining', category: 'Gathering' },
    hunter: { icon: '🐾', name: 'Hunter', category: 'Gathering' },
    farming: { icon: '🌾', name: 'Farming', category: 'Gathering' },
    // Artisan
    cooking: { icon: '🍳', name: 'Cooking', category: 'Artisan' },
    smithing: { icon: '🔨', name: 'Smithing', category: 'Artisan' },
    crafting: { icon: '🧵', name: 'Crafting', category: 'Artisan' },
    fletching: { icon: '🪶', name: 'Fletching', category: 'Artisan' },
    herblore: { icon: '🌿', name: 'Herblore', category: 'Artisan' },
    runecrafting: { icon: '🔷', name: 'Runecrafting', category: 'Artisan' },
    construction: { icon: '🏠', name: 'Construction', category: 'Artisan' },
    // Support
    agility: { icon: '🤸', name: 'Agility', category: 'Support' },
    thieving: { icon: '🗝️', name: 'Thieving', category: 'Support' },
    firemaking: { icon: '🔥', name: 'Firemaking', category: 'Support' },
    treasure_hunting: { icon: '🗺️', name: 'Treasure Hunting', category: 'Support' }
};
const skillCategoriesOrder = ['Combat', 'Gathering', 'Artisan', 'Support'];

// Anti-spam XP cap for low-effort explore actions
let exploreXpTracker = {};
function awardCappedXP(actionKey, skill, amount, cap = 25, windowMs = 60000) {
    const now = Date.now();
    const rec = exploreXpTracker[actionKey] || { start: now, awarded: 0 };
    if (now - rec.start > windowMs) {
        rec.start = now;
        rec.awarded = 0;
    }
    const remaining = Math.max(0, cap - rec.awarded);
    const toAward = Math.min(remaining, amount);
    if (toAward > 0) {
        skillXP[skill] += toAward;
        player.experience += toAward;
        checkLevelUp(skill, skillXP[skill]);
        updateUI();
        rec.awarded += toAward;
    }
    exploreXpTracker[actionKey] = rec;
    return toAward;
}

// Death Plateau progression state
let deathPlateauProgress = 0; // increments while acting on the plateau
let trollStrongholdDiscovered = false; // unlocks optional stronghold dungeon

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
    piratesTreasure: 0,
    wolfCulling: 0, // 0=available, 1=in progress, 2=completed
    deathPlateau: 0
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
    TAVERLEY: 'Taverley (Druid village)',
    BURTHORPE: 'Burthorpe (Frontier town)',
    WILDERNESS: 'The Wilderness (Dangerous PvP area)',
    MAGETOWER: 'Mage Tower (Ancient magic studies)',
    DWARVEN_MINES: 'Dwarven Mines (Mountain tunnels)',
    WOLF_MOUNTAIN: 'Wolf Mountain (Dangerous peaks)'
};

// Shop items by location and type
const shopItems = {
    LUMBRIDGE: {
        general: [
            { name: 'Bread', price: 12, type: 'Food' },
            { name: 'Bronze Sword', price: 25, type: 'Weapon' },
            { name: 'Wooden Shield', price: 15, type: 'Armor' },
            { name: 'Fishing Rod', price: 50, type: 'Tool' },
            { name: 'Axe', price: 30, type: 'Tool' },
            { name: 'Pickaxe', price: 40, type: 'Tool' },
            { name: 'Knife', price: 10, type: 'Tool' },
            { name: 'Health Potion', price: 35, type: 'Consumable' },
            { name: 'Tinderbox', price: 5, type: 'Tool' },
            { name: 'Clay', price: 10, type: 'Material' },
            { name: 'Leather', price: 20, type: 'Material' },
            { name: 'Feather', price: 2, type: 'Material' },
            { name: 'Rune Essence', price: 20, type: 'Magic' }
        ],
        food: [
            { name: 'Bread', price: 12, type: 'Food' },
            { name: 'Shrimp', price: 15, type: 'Food' },
            { name: 'Sardine', price: 20, type: 'Food' },
            { name: 'Herring', price: 25, type: 'Food' },
            { name: 'Trout', price: 40, type: 'Food' },
            { name: 'Lobster', price: 40, type: 'Food' },
            { name: 'Swordfish', price: 60, type: 'Food' },
            { name: 'Shark', price: 100, type: 'Food' }
        ]
    },
    VARROCK: {
        general: [
            { name: 'Bread', price: 12, type: 'Food' },
            { name: 'Health Potion', price: 35, type: 'Consumable' },
            { name: 'Clay', price: 10, type: 'Material' },
            { name: 'Leather', price: 20, type: 'Material' },
            { name: 'Rune Essence', price: 20, type: 'Magic' }
        ],
        weapons: [
            { name: 'Iron Sword', price: 140, type: 'Weapon' },
            { name: 'Steel Sword', price: 325, type: 'Weapon' },
            { name: 'Adamant Sword', price: 800, type: 'Weapon' },
            { name: 'Bronze Arrow', price: 2, type: 'Ammunition' },
            { name: 'Iron Arrow', price: 4, type: 'Ammunition' }
        ],
        armor: [
            { name: 'Iron Shield', price: 112, type: 'Armor' },
            { name: 'Steel Shield', price: 300, type: 'Armor' },
            { name: 'Adamant Shield', price: 800, type: 'Armor' },
            { name: 'Leather Armor', price: 50, type: 'Armor' },
            { name: 'Chainmail', price: 200, type: 'Armor' }
        ],
        magic: [
            { name: 'Staff of Fire', price: 200, type: 'Magic Weapon' },
            { name: 'Air Rune', price: 5, type: 'Magic' },
            { name: 'Fire Rune', price: 8, type: 'Magic' },
            { name: 'Water Rune', price: 6, type: 'Magic' },
            { name: 'Earth Rune', price: 6, type: 'Magic' },
            { name: 'Chaos Rune', price: 15, type: 'Magic' },
            { name: 'Wizard Hat', price: 100, type: 'Magic Armor' },
            { name: 'Robe Top', price: 80, type: 'Magic Armor' },
            { name: 'Robe Bottom', price: 60, type: 'Magic Armor' }
        ],
        books: [
            { name: 'Magic Study Book', price: 50, type: 'Study Material' },
            { name: 'Combat Manual', price: 45, type: 'Study Material' },
            { name: 'Crafting Guide', price: 40, type: 'Study Material' },
            { name: 'Cooking Recipe Book', price: 35, type: 'Study Material' },
            { name: 'Smithing Guide', price: 55, type: 'Study Material' }
        ]
    },
    FALADOR: {
        general: [
            { name: 'Bread', price: 12, type: 'Food' },
            { name: 'Health Potion', price: 35, type: 'Consumable' }
        ],
        armor: [
            { name: 'Steel Shield', price: 300, type: 'Armor' },
            { name: 'Adamant Shield', price: 800, type: 'Armor' },
            { name: 'Rune Shield', price: 1920, type: 'Armor' },
            { name: 'White Shield', price: 1440, type: 'Armor' },
            { name: 'Monk Robes', price: 20, type: 'Clothing' }
        ]
    },
    ALKHARID: {
        general: [
            { name: 'Bread', price: 12, type: 'Food' },
            { name: 'Health Potion', price: 35, type: 'Consumable' }
        ],
        weapons: [
            { name: 'Steel Scimitar', price: 320, type: 'Weapon' },
            { name: 'Adamant Scimitar', price: 800, type: 'Weapon' },
            { name: 'Rune Scimitar', price: 2560, type: 'Weapon' },
            { name: 'Dragon Scimitar', price: 60000, type: 'Weapon' }
        ],
        clothing: [
            { name: 'Desert Robes', price: 40, type: 'Clothing' },
            { name: 'Desert Boots', price: 25, type: 'Clothing' }
        ]
    },
    DRAYNOR: {
        general: [
            { name: 'Bread', price: 12, type: 'Food' },
            { name: 'Health Potion', price: 35, type: 'Consumable' },
            { name: 'Fishing Rod', price: 50, type: 'Tool' },
            { name: 'Net', price: 15, type: 'Tool' }
        ]
    },
    TAVERLEY: {
        general: [
            { name: 'Bread', price: 12, type: 'Food' },
            { name: 'Health Potion', price: 35, type: 'Consumable' },
            { name: 'Nature Rune', price: 25, type: 'Magic' },
            { name: 'Law Rune', price: 30, type: 'Magic' }
        ],
        twohanded: [
            { name: 'Bronze 2H Sword', price: 60, type: 'Weapon' },
            { name: 'Iron 2H Sword', price: 200, type: 'Weapon' },
            { name: 'Steel 2H Sword', price: 500, type: 'Weapon' },
            { name: 'Mithril 2H Sword', price: 1200, type: 'Weapon' },
            { name: 'Adamant 2H Sword', price: 2500, type: 'Weapon' },
            { name: 'Rune 2H Sword', price: 5000, type: 'Weapon' }
        ],
        druid: [
            { name: 'Druid Robe Top', price: 80, type: 'Armor' },
            { name: 'Druid Robe Bottom', price: 60, type: 'Armor' },
            { name: 'Druid Hat', price: 40, type: 'Armor' },
            { name: 'Guthix Staff', price: 150, type: 'Magic Weapon' }
        ]
    }
    ,
    BURTHORPE: {
        general: [
            { name: 'Bread', price: 12, type: 'Food' },
            { name: 'Health Potion', price: 35, type: 'Consumable' },
            { name: 'Tinderbox', price: 5, type: 'Tool' },
            { name: 'Pickaxe', price: 40, type: 'Tool' },
            { name: 'Axe', price: 30, type: 'Tool' },
            { name: 'Fishing Rod', price: 50, type: 'Tool' }
        ],
        metals: [
            { name: 'Copper Ore', price: 10, type: 'Material' },
            { name: 'Tin Ore', price: 10, type: 'Material' },
            { name: 'Iron Ore', price: 25, type: 'Material' },
            { name: 'Coal', price: 30, type: 'Material' }
        ]
    }
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

// Grand Exchange marketplace data with dynamic pricing
const grandExchangeItems = [
    { name: 'Iron Ore', basePrice: 50, buyPrice: 50, sellPrice: 45, stock: 1000, type: 'Resource', volatility: 0.1 },
    { name: 'Coal', basePrice: 30, buyPrice: 30, sellPrice: 25, stock: 2000, type: 'Resource', volatility: 0.1 },
    { name: 'Bronze Bar', basePrice: 80, buyPrice: 80, sellPrice: 70, stock: 500, type: 'Material', volatility: 0.15 },
    { name: 'Iron Bar', basePrice: 150, buyPrice: 150, sellPrice: 130, stock: 300, type: 'Material', volatility: 0.15 },
    { name: 'Steel Bar', basePrice: 300, buyPrice: 300, sellPrice: 280, stock: 200, type: 'Material', volatility: 0.2 },
    { name: 'Rune Essence', basePrice: 20, buyPrice: 20, sellPrice: 15, stock: 5000, type: 'Magic', volatility: 0.1 },
    { name: 'Air Rune', basePrice: 5, buyPrice: 5, sellPrice: 4, stock: 10000, type: 'Magic', volatility: 0.05 },
    { name: 'Fire Rune', basePrice: 8, buyPrice: 8, sellPrice: 7, stock: 8000, type: 'Magic', volatility: 0.05 },
    { name: 'Water Rune', basePrice: 6, buyPrice: 6, sellPrice: 5, stock: 9000, type: 'Magic', volatility: 0.05 },
    { name: 'Earth Rune', basePrice: 6, buyPrice: 6, sellPrice: 5, stock: 9000, type: 'Magic', volatility: 0.05 },
    { name: 'Chaos Rune', basePrice: 15, buyPrice: 15, sellPrice: 13, stock: 3000, type: 'Magic', volatility: 0.1 },
    { name: 'Death Rune', basePrice: 25, buyPrice: 25, sellPrice: 22, stock: 2000, type: 'Magic', volatility: 0.15 },
    { name: 'Blood Rune', basePrice: 35, buyPrice: 35, sellPrice: 32, stock: 1500, type: 'Magic', volatility: 0.2 },
    { name: 'Lobster', basePrice: 40, buyPrice: 40, sellPrice: 35, stock: 1000, type: 'Food', volatility: 0.15 },
    { name: 'Swordfish', basePrice: 60, buyPrice: 60, sellPrice: 55, stock: 800, type: 'Food', volatility: 0.2 },
    { name: 'Shark', basePrice: 100, buyPrice: 100, sellPrice: 90, stock: 500, type: 'Food', volatility: 0.25 },
    { name: 'Dragon Bones', basePrice: 200, buyPrice: 200, sellPrice: 180, stock: 200, type: 'Prayer', volatility: 0.25 },
    { name: 'Willow Logs', basePrice: 15, buyPrice: 15, sellPrice: 12, stock: 2000, type: 'Resource', volatility: 0.1 },
    { name: 'Maple Logs', basePrice: 25, buyPrice: 25, sellPrice: 22, stock: 1500, type: 'Resource', volatility: 0.15 },
    { name: 'Yew Logs', basePrice: 50, buyPrice: 50, sellPrice: 45, stock: 1000, type: 'Resource', volatility: 0.2 },
    { name: 'Shrimp', basePrice: 15, buyPrice: 15, sellPrice: 12, stock: 2000, type: 'Food', volatility: 0.1 },
    { name: 'Sardine', basePrice: 20, buyPrice: 20, sellPrice: 17, stock: 1500, type: 'Food', volatility: 0.1 },
    { name: 'Herring', basePrice: 25, buyPrice: 25, sellPrice: 22, stock: 1200, type: 'Food', volatility: 0.1 },
    { name: 'Trout', basePrice: 40, buyPrice: 40, sellPrice: 35, stock: 1000, type: 'Food', volatility: 0.15 },
    { name: 'Bronze Sword', basePrice: 25, buyPrice: 25, sellPrice: 20, stock: 500, type: 'Weapon', volatility: 0.1 },
    { name: 'Iron Sword', basePrice: 140, buyPrice: 140, sellPrice: 120, stock: 300, type: 'Weapon', volatility: 0.15 },
    { name: 'Steel Sword', basePrice: 325, buyPrice: 325, sellPrice: 280, stock: 150, type: 'Weapon', volatility: 0.2 },
    { name: 'Adamant Sword', basePrice: 800, buyPrice: 800, sellPrice: 700, stock: 50, type: 'Weapon', volatility: 0.25 },
    { name: 'Wooden Shield', basePrice: 15, buyPrice: 15, sellPrice: 12, stock: 400, type: 'Armor', volatility: 0.1 },
    { name: 'Iron Shield', basePrice: 112, buyPrice: 112, sellPrice: 95, stock: 200, type: 'Armor', volatility: 0.15 },
    { name: 'Steel Shield', basePrice: 300, buyPrice: 300, sellPrice: 260, stock: 100, type: 'Armor', volatility: 0.2 },
    { name: 'Health Potion', basePrice: 35, buyPrice: 35, sellPrice: 30, stock: 800, type: 'Consumable', volatility: 0.1 },
    { name: 'Bread', basePrice: 12, buyPrice: 12, sellPrice: 10, stock: 1000, type: 'Food', volatility: 0.05 }
];

// Market price update system
function updateMarketPrices() {
    grandExchangeItems.forEach(item => {
        // Random price fluctuation based on volatility
        const fluctuation = (Math.random() - 0.5) * 2 * item.volatility;
        const newBuyPrice = Math.max(1, Math.round(item.basePrice * (1 + fluctuation)));
        const newSellPrice = Math.max(1, Math.round(newBuyPrice * 0.9));
        
        item.buyPrice = newBuyPrice;
        item.sellPrice = newSellPrice;
        
        // Update stock based on price changes
        if (fluctuation > 0.1) {
            item.stock = Math.max(0, item.stock - Math.floor(Math.random() * 10));
        } else if (fluctuation < -0.1) {
            item.stock = Math.min(item.stock + Math.floor(Math.random() * 20), item.stock * 2);
        }
    });
}

// Process GE orders
function processGEOrders() {
    // Ensure GE structures exist to avoid errors on old saves
    if (!player.geOrders) {
        player.geOrders = { buy: [], sell: [] };
    }
    if (!Array.isArray(player.geOrders.buy)) player.geOrders.buy = [];
    if (!Array.isArray(player.geOrders.sell)) player.geOrders.sell = [];
    // Process buy orders
    player.geOrders.buy.forEach((order, index) => {
        const geItem = grandExchangeItems.find(item => item.name === order.itemName);
        if (geItem && geItem.stock > 0 && geItem.buyPrice <= order.maxPrice) {
            const quantityToBuy = Math.min(order.quantity, geItem.stock);
            const totalCost = quantityToBuy * geItem.buyPrice;
            
            if (player.coins >= totalCost) {
                player.coins -= totalCost;
                addItemToInventory(order.itemName, quantityToBuy);
                geItem.stock -= quantityToBuy;
                order.quantity -= quantityToBuy;
                
                // Add notification
                player.notifications.push({
                    type: 'buy_order',
                    message: `Your buy order for ${quantityToBuy}x ${order.itemName} completed at ${geItem.buyPrice} coins each!`,
                    timestamp: Date.now()
                });
                
                if (order.quantity <= 0) {
                    player.geOrders.buy.splice(index, 1);
                }
            }
        }
    });
    
    // Process sell orders
    player.geOrders.sell.forEach((order, index) => {
        const geItem = grandExchangeItems.find(item => item.name === order.itemName);
        if (geItem && geItem.sellPrice >= order.minPrice) {
            const quantityToSell = Math.min(order.quantity, getItemQuantity(order.itemName));
            
            if (quantityToSell > 0) {
                removeItemFromInventory(order.itemName, quantityToSell);
                const totalEarned = quantityToSell * geItem.sellPrice;
                player.coins += totalEarned;
                order.quantity -= quantityToSell;
                
                // Add notification
                player.notifications.push({
                    type: 'sell_order',
                    message: `Your sell order for ${quantityToSell}x ${order.itemName} completed at ${geItem.sellPrice} coins each!`,
                    timestamp: Date.now()
                });
                
                if (order.quantity <= 0) {
                    player.geOrders.sell.splice(index, 1);
                }
            }
        }
    });
}

// Initialize game
function initGame() {
    loadGame();
    ensureAllSkillsInitialized();
    calculateCombatLevel();
    updateUI();
    showMainMenu();
    createSaveMenu();
    createMusicPlayer();
    startBackgroundMusic();
    
    // Set up periodic market updates and order processing
    setInterval(() => {
        updateMarketPrices();
        processGEOrders();
    }, 300000); // Update every 300 seconds
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
            <button onclick="playRandomTrack()">🎲 Random</button>
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
            <div class="track-item" onclick="playTrack('brimestones')">
                <span>🔥 Brimestones</span>
                <span class="track-duration">2:35</span>
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
        deathPlateauProgress: deathPlateauProgress,
        trollStrongholdDiscovered: trollStrongholdDiscovered,
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
            deathPlateauProgress = data.deathPlateauProgress || 0;
            trollStrongholdDiscovered = data.trollStrongholdDiscovered || false;
            
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
let specialCombatAudio = null; // For wilderness PK combat music
let shuffledPlaylist = []; // Array to store shuffled track order
let currentShuffleIndex = 0; // Current position in shuffled playlist
let musicTracks = {
    alkharid: { file: 'assets/sounds/Al Kharid.wav', name: 'Al Kharid Theme' },
    combat: { file: 'assets/sounds/Attack2.wav', name: 'Combat Theme' },
    varrock: { file: 'assets/sounds/Castlewars_Cryptic_Version.mp3', name: 'Varrock Theme' },
    wilderness: { file: 'assets/sounds/Wilderness_Cryptic_version.mp3', name: 'Wilderness' },
    lumbridge: { file: 'assets/sounds/Lumbridge_Harmony_CrypticTM.mp3', name: 'Lumbridge Harmony' },
    draynor_manor: { file: 'assets/sounds/draynor_manor.mp3', name: 'Draynor Manor Theme' },
    mage_tower: { file: 'assets/sounds/mage_tower.mp3', name: 'Mage Tower Theme' },
    river_area: { file: 'assets/sounds/river_area.mp3', name: 'Peaceful River' },
    hidden_passage: { file: 'assets/sounds/hidden_passage.mp3', name: 'Hidden Journey' },
    brimestones: { file: 'assets/sounds/FireBrimestoness_CrypticVersion.mp3', name: 'Brimestones' }
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
            bank_pin: '0000',
            
            // Grand Exchange system
            geOrders: {
                buy: [],
                sell: []
            },
            
            // Notifications system
            notifications: []
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
    
    // Initialize shuffled playlist
    shufflePlaylist();
    
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
            case 'DRAYNOR':
                playTrack('draynor_manor');
                break;
            case 'DWARVEN_MINES':
                playTrack('hidden_passage');
                break;
            case 'WOLF_MOUNTAIN':
                playTrack('hidden_passage');
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
    
    // Stop any special combat audio when switching tracks
    if (specialCombatAudio) {
        specialCombatAudio.pause();
        specialCombatAudio = null;
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
    
    // Also stop any special combat audio
    if (specialCombatAudio) {
        specialCombatAudio.pause();
        specialCombatAudio = null;
    }
}

function nextTrack() {
    const trackNames = Object.keys(musicTracks);
    const currentIndex = trackNames.indexOf(currentTrack);
    const nextIndex = (currentIndex + 1) % trackNames.length;
    playTrack(trackNames[nextIndex]);
}

// Shuffle the playlist
function shufflePlaylist() {
    const trackNames = Object.keys(musicTracks);
    shuffledPlaylist = [...trackNames]; // Create a copy of track names
    
    // Fisher-Yates shuffle algorithm
    for (let i = shuffledPlaylist.length - 1; i > 0; i--) {
        const j = Math.floor(Math.random() * (i + 1));
        [shuffledPlaylist[i], shuffledPlaylist[j]] = [shuffledPlaylist[j], shuffledPlaylist[i]];
    }
    
    currentShuffleIndex = 0;
    console.log('Playlist shuffled:', shuffledPlaylist);
}

// Play a random track
function playRandomTrack() {
    // If shuffled playlist is empty, create a new shuffle
    if (shuffledPlaylist.length === 0) {
        shufflePlaylist();
    }
    
    // If we've reached the end of the current shuffle, create a new one
    if (currentShuffleIndex >= shuffledPlaylist.length) {
        shufflePlaylist();
    }
    
    // Play the current track in the shuffled playlist
    const randomTrack = shuffledPlaylist[currentShuffleIndex];
    playTrack(randomTrack);
    
    // Move to next track in shuffled playlist
    currentShuffleIndex++;
    
    // Update button to show it's active
    const randomButton = document.querySelector('button[onclick="playRandomTrack()"]');
    if (randomButton) {
        randomButton.textContent = '🎲 Random ✓';
        // Reset button text after 2 seconds
        setTimeout(() => {
            randomButton.textContent = '🎲 Random';
        }, 2000);
    }
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

// Ensure GE arrays before any inventory actions that might trigger GE logic later
function ensureGE() {
    if (!player.geOrders) player.geOrders = { buy: [], sell: [] };
    if (!Array.isArray(player.geOrders.buy)) player.geOrders.buy = [];
    if (!Array.isArray(player.geOrders.sell)) player.geOrders.sell = [];
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
    // Sum all defined skills from skillInfo to keep in sync
    return Object.keys(skillInfo).reduce((sum, skillKey) => {
        const val = typeof player[skillKey] === 'number' ? player[skillKey] : 0;
        return sum + val;
    }, 0);
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
    addOption('Magic Journal', showMagicJournal);
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
    
    // Add Wilderness option if not already there (hidden in Port Sarim)
    if (currentLocation !== 'WILDERNESS' && currentLocation !== 'PORTSARIM') {
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
    ensureAllSkillsInitialized();
    
    displayText('========================================');
    displayText('           SKILLS OVERVIEW');
    displayText('========================================');
    displayText('');
    
    skillCategoriesOrder.forEach(category => {
        // Section header
        displayText(`${category} Skills:`);
        
        // Collect skills in this category in a stable order
        const entries = Object.entries(skillInfo)
            .filter(([, info]) => info.category === category)
            .map(([key, info]) => ({ key, info }))
            .sort((a, b) => a.info.name.localeCompare(b.info.name));
        
        entries.forEach(({ key, info }) => {
            const level = typeof player[key] === 'number' ? player[key] : 1;
            const xp = typeof skillXP[key] === 'number' ? skillXP[key] : 0;
            const xpToLevel = Math.max(1, level * 100);
            displayText(`${info.icon} ${info.name}: ${level} (${xp}/${xpToLevel} XP)`);
        });
        displayText('');
    });
    
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
        displayText('11. Varrock Forest - Chop oaks/willows');
        displayText('12. Random encounter');
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
        addOption('Visit Forest (Varrock)', exploreVarrockForest);
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
    } else if (currentLocation === 'FALADOR') {
        displayText('You explore the white city of Falador.');
        displayText('');
        displayText('You see:');
        displayText('1. Falador Castle - Home of the White Knights');
        displayText('2. Falador Marketplace - Trade and commerce');
        displayText('3. Falador Church - Prayer training');
        displayText('4. White Knights\' Training Grounds - Combat training');
        displayText('5. Falador Endurance Track - Build stamina and health');
        displayText('6. Falador Gardens - Peaceful relaxation');
        displayText('7. Falador Bank - Store your valuables');
        displayText('8. Falador Crafting Workshop - Create items');
        displayText('9. Random encounter');
        displayText('');
        
        addOption('Visit Castle', exploreFaladorCastle);
        addOption('Visit Marketplace', exploreFaladorMarketplace);
        addOption('Visit Church', exploreFaladorChurch);
        addOption('Training Grounds', exploreFaladorTrainingGrounds);
        addOption('Endurance Track', exploreFaladorEnduranceTrack);
        addOption('Visit Gardens', exploreFaladorGardens);
        addOption('Visit Bank', visitFaladorBank);
        addOption('Crafting Workshop', showCraftingWorkshop);
        addOption('Random Encounter', randomEncounter);
        addOption('Back to Main Menu', showMainMenu, 'back');
    } else if (currentLocation === 'ALKHARID') {
        displayText('You explore the desert city of Al Kharid.');
        displayText('');
        displayText('You see:');
        displayText('1. Al Kharid Palace - Royal residence');
        displayText('2. Al Kharid Marketplace - Desert trade');
        displayText('3. Al Kharid Mosque - Prayer and meditation');
        displayText('4. Desert Training Grounds - Combat in the heat');
        displayText('5. Al Kharid Endurance Track - Desert stamina training');
        displayText('6. Oasis Gardens - Cool and refreshing');
        displayText('7. Al Kharid Bank - Store your valuables');
        displayText('8. Al Kharid Crafting Workshop - Create items');
        displayText('9. Random encounter');
        displayText('');
        
        addOption('Visit Palace', exploreAlKharidPalace);
        addOption('Visit Marketplace', exploreAlKharidMarketplace);
        addOption('Visit Mosque', exploreAlKharidMosque);
        addOption('Training Grounds', exploreAlKharidTrainingGrounds);
        addOption('Endurance Track', exploreAlKharidEnduranceTrack);
        addOption('Visit Oasis', exploreAlKharidOasis);
        addOption('Visit Bank', visitAlKharidBank);
        addOption('Crafting Workshop', showCraftingWorkshop);
        addOption('Random Encounter', randomEncounter);
        addOption('Back to Main Menu', showMainMenu, 'back');
    } else if (currentLocation === 'DRAYNOR') {
        displayText('You explore the quiet village of Draynor.');
        displayText('');
        displayText('You see:');
        displayText('1. Draynor Manor - Mysterious and haunted building');
        displayText('2. Draynor Village Market - Local trade');
        displayText('3. Draynor Church - Prayer training');
        displayText('4. Draynor Bank - Store your valuables');
        displayText('5. Draynor Crafting Workshop - Create items');
        displayText('6. Random encounter');
        displayText('');
        
        addOption('Enter Draynor Manor', exploreDraynorManor);
        addOption('Visit Market', exploreDraynorMarket);
        addOption('Visit Church', exploreDraynorChurch);
        addOption('Visit Bank', visitDraynorBank);
        addOption('Crafting Workshop', showCraftingWorkshop);
        addOption('Random Encounter', randomEncounter);
        addOption('Back to Main Menu', showMainMenu, 'back');
    } else if (currentLocation === 'DWARVEN_MINES') {
        displayText('You explore the extensive Dwarven Mines...');
        displayText('');
        displayText('You see:');
        displayText('1. Mining Tunnels - Rich ore deposits');
        displayText('2. Dwarven Workshops - Ancient crafting areas');
        displayText('3. Deep Caverns - Dangerous but rewarding');
        displayText('4. Dwarven Forge - Smithing and crafting');
        displayText('5. Crystal Caves - Rare gem deposits');
        displayText('6. Random encounter');
        displayText('');
        
        addOption('Mine in Tunnels', exploreDwarvenTunnels);
        addOption('Visit Workshops', exploreDwarvenWorkshops);
        addOption('Explore Deep Caverns', exploreDeepCaverns);
        addOption('Use Dwarven Forge', useDwarvenForge);
        addOption('Search Crystal Caves', searchCrystalCaves);
        addOption('Random Encounter', randomEncounter);
        addOption('Back to Main Menu', showMainMenu, 'back');
    } else if (currentLocation === 'WOLF_MOUNTAIN') {
        displayText('You explore the dangerous peaks of Wolf Mountain...');
        displayText('');
        displayText('You see:');
        displayText('1. Mountain Pass - Rocky terrain and wolf sightings');
        displayText('2. Dwarven Cave Entrance - Dwarves seeking help');
        displayText('3. Wolf Dens - Dangerous wolf pack territory');
        displayText('4. Mountain Peak - High altitude exploration');
        displayText('5. Random encounter');
        displayText('');
        
        addOption('Explore Mountain Pass', exploreMountainPass);
        addOption('Visit Dwarven Cave', visitDwarvenCave);
        addOption('Search Wolf Dens', searchWolfDens);
        addOption('Climb Mountain Peak', climbMountainPeak);
        addOption('Random Encounter', randomEncounter);
        addOption('Back to Main Menu', showMainMenu, 'back');
    } else if (currentLocation === 'PORTSARIM') {
        displayText('You explore the bustling port town of Port Sarim.');
        displayText('');
        displayText('You see:');
        displayText('1. Port Docks - Ships arriving and departing');
        displayText('2. Sailor\'s Tavern - Stories and drinks');
        displayText('3. Shipyard - Boat construction and repairs');
        displayText('4. Fish Market - Fresh catches from the sea');
        displayText('5. Lighthouse - Guides ships safely to port');
        displayText('6. Port Authority Office - Official business');
        displayText('7. Seafarer\'s Guild - Maritime training');
        displayText('8. Port Sarim Bank - Store your valuables');
        displayText('9. Random encounter');
        displayText('');
        
        addOption('Visit Port Docks', explorePortDocks);
        addOption('Visit Sailor\'s Tavern', exploreSailorsTavern);
        addOption('Visit Shipyard', exploreShipyard);
        addOption('Visit Fish Market', exploreFishMarket);
        addOption('Visit Lighthouse', exploreLighthouse);
        addOption('Visit Port Authority', explorePortAuthority);
        addOption('Visit Seafarer\'s Guild', exploreSeafarersGuild);
        addOption('Visit Bank', visitPortSarimBank);
        addOption('Visit Rimmington Mine', exploreRimmingtonMine);
        addOption('Random Encounter', randomEncounter);
        addOption('Back to Main Menu', showMainMenu, 'back');
    } else if (currentLocation === 'TAVERLEY') {
        displayText('You explore the peaceful druid village of Taverley.');
        displayText('');
        displayText('You see:');
        displayText('1. Two-Handed Weapons Shop - Massive swords and axes');
        displayText('2. Taverley Lake - Excellent fishing spot');
        displayText('3. Druids\' Circle - Ancient stone circle');
        displayText('4. Taverley Bank - Store your valuables');
        displayText('5. Random encounter');
        displayText('');
        
        addOption('Visit Two-Handed Shop', visitTwoHandedShop);
        addOption('Fish at Taverley Lake', fishAtTaverleyLake);
        addOption('Visit Druids\' Circle', exploreDruidsCircle);
        addOption('Visit Bank', visitTaverleyBank);
        addOption('Random Encounter', randomEncounter);
        addOption('Back to Main Menu', showMainMenu, 'back');
    } else if (currentLocation === 'BURTHORPE') {
        displayText('You explore the frontier town of Burthorpe.');
        displayText('');
        displayText('You see:');
        displayText('1. Warriors\' Guild - Training for the brave (Under development)');
        displayText('2. Burthorpe Supply Store - Basic adventuring gear');
        displayText('3. Furnace & Anvil - Smelt and smith');
        displayText('4. Death Plateau - Mountain pass (Quest required)');
        displayText('5. Burthorpe Bank');
        displayText('6. Random encounter');
        displayText('');
        
        addOption('Visit Warriors\' Guild (WIP)', exploreWarriorsGuild);
        addOption('Visit Supply Store', visitBurthorpeSupplyStore);
        addOption('Use Furnace & Anvil', visitBurthorpeFurnace);
        if (quests.deathPlateau === 2) {
            addOption('Explore Death Plateau', exploreDeathPlateau);
        }
        addOption('Visit Bank', visitBurthorpeBank);
        addOption('Random Encounter', randomEncounter);
        addOption('Back to Main Menu', showMainMenu, 'back');
    } else {
        displayText('========================================');
        displayText(`         EXPLORING ${currentLocation}`);
        displayText('========================================');
        displayText('');
        displayText('This area is still being explored and developed.');
        displayText('More features and activities will be added soon!');
        displayText('');
        displayText('For now, you can:');
        displayText('• Travel to other locations');
        displayText('• Return to Lumbridge for more activities');
        displayText('• Check your character stats and skills');
        displayText('');
        
        addOption('Travel to Another Location', travelMenu);
        addOption('Return to Lumbridge', () => travelTo('LUMBRIDGE'));
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
    displayText('The miller\'s wife runs a cooking school here!');
    displayText('This is the perfect place to learn and practice cooking.');
    displayText('');
    
    addOption('Go inside to get flour', getFlour);
    addOption('Train Cooking', trainCookingAtWindmill);
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

// Train cooking at windmill
function trainCookingAtWindmill() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         WINDMILL COOKING TRAINING');
    displayText('========================================');
    displayText('');
    displayText('You enter the windmill and find a well-equipped kitchen area.');
    displayText('The miller\'s wife is happy to teach you cooking techniques.');
    displayText('');
    displayText(`Your Cooking Level: ${player.cooking}`);
    displayText('');
    displayText('Cooking Training Options:');
    displayText('');
    
    // Check if player has raw food to cook
    const hasRawFood = player.inventory.some(invItem => 
        ['Raw Shrimp', 'Raw Sardine', 'Raw Herring', 'Raw Trout', 'Raw Lobster', 'Raw Swordfish', 'Raw Shark', 'Raw Beef', 'Raw Chicken'].includes(invItem.name)
    );
    
    if (hasRawFood) {
        displayText('You have raw food that can be cooked here!');
        displayText('');
        addOption('Cook Your Raw Food', startCookingAtWindmill);
    } else {
        displayText('You don\'t have any raw food to cook.');
        displayText('Go fishing or hunting to get raw food first.');
    }
    
    // Practice cooking with provided ingredients
    addOption('Practice with Provided Ingredients', practiceCookingAtWindmill);
    addOption('Learn Cooking Techniques', learnCookingTechniques);
    addOption('Back to Windmill', exploreWindmill);
}

// Start cooking at windmill
function startCookingAtWindmill() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         COOKING YOUR FOOD');
    displayText('========================================');
    displayText('');
    displayText('You set up at the windmill\'s kitchen...');
    displayText('');
    
    // Find all raw food in inventory
    const rawFood = player.inventory.filter(invItem => 
        ['Raw Shrimp', 'Raw Sardine', 'Raw Herring', 'Raw Trout', 'Raw Lobster', 'Raw Swordfish', 'Raw Shark', 'Raw Beef', 'Raw Chicken'].includes(invItem.name)
    );
    
    if (rawFood.length === 0) {
        displayText('You don\'t have any raw food to cook.');
        addOption('Back to Cooking Training', trainCookingAtWindmill);
        return;
    }
    
    displayText('Available raw food to cook:');
    displayText('');
    
    rawFood.forEach((food, index) => {
        const canCook = canCookFood(food.name);
        const xpGain = getCookingXP(food.name);
        const successChance = Math.floor(getCookingSuccessChance(food.name) * 100);
        
        if (canCook) {
            displayText(`${index + 1}. ${food.name} (${food.quantity}) - ${xpGain} XP each (${successChance}% success)`);
            addOption(`Cook ${food.name}`, () => cookFoodAtWindmill(food.name, xpGain));
        } else {
            const cookingRequirements = {
                'Raw Shrimp': 1, 'Raw Sardine': 1, 'Raw Herring': 5, 'Raw Trout': 15,
                'Raw Lobster': 40, 'Raw Swordfish': 45, 'Raw Shark': 80, 'Raw Beef': 1, 'Raw Chicken': 1
            };
            const requiredLevel = cookingRequirements[food.name] || 1;
            displayText(`${index + 1}. ${food.name} (${food.quantity}) - Requires Cooking Level ${requiredLevel}`);
        }
    });
    
    displayText('');
    addOption('Back to Cooking Training', trainCookingAtWindmill);
}

// Cook food at windmill
function cookFoodAtWindmill(foodType, xpGain) {
    clearOutput();
    clearOptions();
    
    // Remove one raw food from inventory
    if (!removeItemFromInventory(foodType, 1)) {
        displayText('Error: Could not remove food from inventory.');
        addOption('Back', startCookingAtWindmill);
        return;
    }
    
    displayText('========================================');
    displayText('         COOKING AT WINDMILL');
    displayText('========================================');
    displayText('');
    displayText(`You carefully cook the ${foodType} in the windmill\'s kitchen...`);
    displayText('The miller\'s wife gives you helpful tips as you work.');
    displayText('');
    
    // Start cooking animation with windmill context
    startCookingAnimation(foodType, xpGain, 'windmill');
}

// Practice cooking with provided ingredients
function practiceCookingAtWindmill() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         PRACTICE COOKING');
    displayText('========================================');
    displayText('');
    displayText('The miller\'s wife provides you with basic ingredients to practice.');
    displayText('You learn fundamental cooking techniques.');
    displayText('');
    
    const practiceXP = 25;
    displayText(`You gained ${practiceXP} Cooking experience from practice!`);
    
    skillXP.cooking += practiceXP;
    player.experience += practiceXP;
    checkLevelUp('cooking', skillXP.cooking);
    updateUI();
    
    addOption('Continue Practicing', practiceCookingAtWindmill);
    addOption('Back to Cooking Training', trainCookingAtWindmill);
}

// Learn cooking techniques
function learnCookingTechniques() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         LEARNING COOKING TECHNIQUES');
    displayText('========================================');
    displayText('');
    displayText('The miller\'s wife teaches you advanced cooking methods:');
    displayText('');
    displayText('• Proper temperature control');
    displayText('• Timing for different ingredients');
    displayText('• Seasoning and flavor combinations');
    displayText('• Food safety and hygiene');
    displayText('');
    
    const learningXP = 15;
    displayText(`You gained ${learningXP} Cooking experience from learning!`);
    
    skillXP.cooking += learningXP;
    player.experience += learningXP;
    checkLevelUp('cooking', skillXP.cooking);
    updateUI();
    
    addOption('Learn More Techniques', learnCookingTechniques);
    addOption('Back to Cooking Training', trainCookingAtWindmill);
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
    displayText('');
    displayText(`Fishing Level: ${player.fishing}`);
    
    // Show available fish based on level
    const availableFish = [];
    availableFish.push('Shrimp, Sardine, Herring, Trout');
    if (player.fishing >= 15) availableFish.push('Lobster');
    if (player.fishing >= 25) availableFish.push('Swordfish');
    if (player.fishing >= 40) availableFish.push('Shark');
    
    displayText(`Available fish: ${availableFish.join(', ')}`);
    displayText('');
    
    // Fishing success based on fishing level
    const fishingSuccess = Math.random() < (0.4 + player.fishing * 0.03);
    
    if (fishingSuccess) {
        const fishType = Math.random();
        let fishName, xp;
        
        // Higher fishing level increases chance of better fish
        const fishingLevel = player.fishing;
        
        if (fishType < 0.4) {
            fishName = 'Raw Shrimp';
            xp = 25;
        } else if (fishType < 0.7) {
            fishName = 'Raw Sardine';
            xp = 30;
        } else if (fishType < 0.85) {
            fishName = 'Raw Herring';
            xp = 35;
        } else if (fishType < 0.95) {
            fishName = 'Raw Trout';
            xp = 50;
        } else if (fishType < 0.98 && fishingLevel >= 15) {
            fishName = 'Raw Lobster';
            xp = 90;
        } else if (fishType < 0.995 && fishingLevel >= 25) {
            fishName = 'Raw Swordfish';
            xp = 100;
        } else if (fishingLevel >= 40) {
            fishName = 'Raw Shark';
            xp = 150;
        } else {
            // Fallback to trout if level requirements not met
            fishName = 'Raw Trout';
            xp = 50;
        }
        
        displayText(`You catch a ${fishName}!`);
        displayText('The fish is raw and needs to be cooked before eating.');
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
    displayText('You see low-level trees and some sturdy oaks.');
    displayText('');
    
    // Axe requirement reminder
    if (!hasItem('Axe')) {
        displayText('You need an Axe to chop trees.');
    }
    
    // Chop options
    addOption('Chop low-level tree', () => chopTree('Logs', 1, 25));
    
    // Oak requires level 15 woodcutting
    if (player.woodcutting >= 15) {
        addOption('Chop Oak tree (Lvl 15)', () => chopTree('Oak Logs', 15, 37));
    } else {
        addOption('Chop Oak tree (Requires Woodcutting 15)', () => {
            clearOutput();
            clearOptions();
            displayText('You attempt to chop the oak tree...');
            displayText('But your Woodcutting level is too low. (Requires 15)');
            addOption('Back to Lumbridge Forest', exploreForest);
        }, 'disabled');
    }
    
    addOption('Back to exploring', exploreArea);
}

// Generic tree chopping helper
function chopTree(logType, requiredLevel, xpGain) {
    clearOutput();
    clearOptions();
    
    displayText(`You prepare to chop the ${logType === 'Logs' ? 'tree' : logType.replace(' Logs','').toLowerCase() + ' tree'}...`);
    
    // Requirement checks
    if (!hasItem('Axe')) {
        displayText('You need an Axe to chop trees!');
        addOption('Back', () => {
            if (currentLocation === 'LUMBRIDGE') exploreForest(); else exploreVarrockForest();
        });
        return;
    }
    
    if (player.woodcutting < requiredLevel) {
        displayText(`You need Woodcutting level ${requiredLevel} to chop this tree.`);
        addOption('Back', () => {
            if (currentLocation === 'LUMBRIDGE') exploreForest(); else exploreVarrockForest();
        });
        return;
    }
    
    // Success chance based on woodcutting level
    const success = Math.random() < (0.4 + Math.min(player.woodcutting, 20) * 0.03);
    
    if (success) {
        displayText('You swing your axe and successfully cut a log!');
        addItemToInventory(logType, 1);
        
        // Award woodcutting XP
        skillXP.woodcutting += xpGain;
        player.experience += xpGain;
        checkLevelUp('woodcutting', skillXP.woodcutting);
        updateUI();
        
        // SFX for success
        playSoundEffect('treasure');
        
        displayText(`You gained ${xpGain} Woodcutting experience!`);
    } else {
        displayText('You swing your axe, but fail to get any usable logs.');
        // Small practice XP
        const smallXP = Math.max(1, Math.floor(xpGain * 0.1));
        skillXP.woodcutting += smallXP;
        player.experience += smallXP;
        checkLevelUp('woodcutting', skillXP.woodcutting);
        updateUI();
        displayText(`You still gained ${smallXP} Woodcutting experience for practicing.`);
    }
    
    displayText('');
    addOption('Chop again', () => chopTree(logType, requiredLevel, xpGain));
    if (currentLocation === 'LUMBRIDGE') {
        addOption('Back to Lumbridge Forest', exploreForest);
    } else {
        addOption('Back to Varrock Forest', exploreVarrockForest);
    }
}

// Varrock forest exploration (random tree availability)
function exploreVarrockForest() {
    clearOutput();
    clearOptions();
    
    displayText('You head to the outskirts of Varrock where trees grow.');
    displayText('You search the area for suitable trees to chop...');
    displayText('');
    
    // Random availability each time
    const foundOak = Math.random() < 0.7;    // fairly common near Varrock
    const foundWillow = Math.random() < 0.5; // somewhat common
    
    if (!foundOak && !foundWillow) {
        displayText('You only find scrub and small saplings here.');
    } else {
        if (foundOak) {
            if (player.woodcutting >= 15) {
                addOption('Chop Oak tree (Lvl 15)', () => chopTree('Oak Logs', 15, 37));
            } else {
                addOption('Chop Oak tree (Requires Woodcutting 15)', () => {
                    clearOutput();
                    clearOptions();
                    displayText('Your Woodcutting level is too low to chop oaks here.');
                    addOption('Back to Varrock Forest', exploreVarrockForest);
                }, 'disabled');
            }
        }
        if (foundWillow) {
            if (player.woodcutting >= 25) {
                addOption('Chop Willow tree (Lvl 25)', () => chopTree('Willow Logs', 25, 67));
            } else {
                addOption('Chop Willow tree (Requires Woodcutting 25)', () => {
                    clearOutput();
                    clearOptions();
                    displayText('Your Woodcutting level is too low to chop willows.');
                    addOption('Back to Varrock Forest', exploreVarrockForest);
                }, 'disabled');
            }
        }
    }
    
    displayText('');
    addOption('Search another spot', exploreVarrockForest);
    addOption('Back to Exploring', exploreArea);
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
    
    displayText('========================================');
    displayText('         LUMBRIDGE DAIRY FARM');
    displayText('========================================');
    displayText('');
    displayText('You approach the dairy farm...');
    displayText('You see cows grazing peacefully in the fields.');
    displayText('Farmer Fred tends to his sheep in the nearby pen.');
    displayText('This is a bustling farm with many activities available.');
    displayText('');
    
    // Check for quest items
    if (!hasItem('Bucket of Milk')) {
        displayText('You notice fresh milk in a bucket nearby.');
        displayText('You found a Bucket of Milk! (+Quest item)');
        addItemToInventory('Bucket of Milk');
        updateUI();
    } else {
        displayText('You already have milk for your quest.');
    }
    
    displayText('');
    displayText('Farm Activities:');
    displayText('');
    
    addOption('Fight Cows (Combat Training)', fightCows);
    addOption('Talk to Farmer Fred(Quest)', talkToFarmerFred);
    
    // Only show sheep shearing if quest is in progress
    if (quests.sheepShearer === 1) {
        addOption('Shear Sheep (Quest)', shearSheep);
    }
    
    addOption('Back to exploring', exploreArea);
}

// Fight cows at dairy farm
function fightCows() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         FIGHTING COWS');
    displayText('========================================');
    displayText('');
    displayText('You approach the cow field...');
    displayText('The cows look at you curiously.');
    displayText('Some seem more aggressive than others.');
    displayText('');
    displayText('Cow fighting options:');
    displayText('');
    
    addOption('Fight Young Cow (Easy)', () => startCombat('Young Cow', 1, 8, 1, 0, 'Horns'));
    addOption('Fight Cow (Medium)', () => startCombat('Cow', 2, 12, 2, 1, 'Horns and Hooves'));
    addOption('Fight Bull (Hard)', () => startCombat('Bull', 4, 18, 3, 2, 'Sharp Horns'));
    addOption('Back to Dairy Farm', exploreDairyFarm);
}

// Talk to Farmer Fred
function talkToFarmerFred() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         FARMER FRED');
    displayText('========================================');
    displayText('');
    displayText('You approach Farmer Fred as he tends to his sheep.');
    displayText('"Hello there, young adventurer!" he says warmly.');
    displayText('');
    
    if (quests.sheepShearer === 0) {
        displayText('"I\'ve been having trouble with my sheep lately."');
        displayText('"They need shearing, but I\'m getting too old for it."');
        displayText('"Could you help me collect some wool? I\'ll pay you well!"');
        displayText('');
        displayText('"I need 20 balls of wool. You can borrow my shears if you need them."');
        displayText('');
        
        addOption('Yes, I\'ll help you collect wool', () => startQuest('sheepShearer'));
        addOption('Maybe later', exploreDairyFarm);
    } else if (quests.sheepShearer === 1) {
        const woolCount = getItemQuantity('Wool');
        displayText(`"How\'s the wool collection going?" he asks.`);
        displayText(`"You\'ve collected ${woolCount}/20 balls of wool so far."`);
        displayText('');
        
        if (woolCount >= 20) {
            displayText('"Excellent! You\'ve collected all the wool I need!"');
            displayText('"Here\'s your reward: 60 coins and some crafting experience!"');
            displayText('');
            
            addOption('Complete Quest', completeSheepShearer);
        } else {
            displayText('"Keep at it! The sheep are in the pen over there."');
            displayText('"Remember, you can borrow my shears if you need them."');
        }
        
        addOption('Back to Dairy Farm', exploreDairyFarm);
    } else {
        displayText('"Thank you again for helping with the sheep!"');
        displayText('"The wool is selling well at the market."');
        displayText('');
        addOption('Back to Dairy Farm', exploreDairyFarm);
    }
}

// Shear sheep (only available during quest)
function shearSheep() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         SHEARING SHEEP');
    displayText('========================================');
    displayText('');
    displayText('You approach the sheep pen...');
    displayText('The sheep look at you with curious eyes.');
    displayText('Some seem more cooperative than others.');
    displayText('');
    
    // Check if player has shears
    if (!hasItem('Shears')) {
        displayText('You don\'t have any shears to shear the sheep with.');
        displayText('Farmer Fred offered to lend you some if you need them.');
        displayText('');
        addOption('Ask Farmer Fred for Shears', borrowShears);
        addOption('Back to Dairy Farm', exploreDairyFarm);
        return;
    }
    
    displayText('You have shears and are ready to shear sheep.');
    displayText('Choose a sheep to shear:');
    displayText('');
    
    addOption('Shear Friendly Sheep (Safe)', () => shearSpecificSheep('friendly'));
    addOption('Shear Nervous Sheep (Risky)', () => shearSpecificSheep('nervous'));
    addOption('Shear Aggressive Sheep (Dangerous)', () => shearSpecificSheep('aggressive'));
    addOption('Back to Dairy Farm', exploreDairyFarm);
}

// Borrow shears from Farmer Fred
function borrowShears() {
    clearOutput();
    clearOptions();
    
    displayText('You ask Farmer Fred if you can borrow his shears.');
    displayText('"Of course! Here you go," he says, handing you a pair of shears.');
    displayText('"Just be careful with them, they\'re my good pair."');
    displayText('');
    displayText('You received Shears! (Quest item)');
    addItemToInventory('Shears');
    updateUI();
    
    addOption('Back to Shearing', shearSheep);
}

// Shear a specific type of sheep
function shearSpecificSheep(sheepType) {
    clearOutput();
    clearOptions();
    
    displayText(`You approach the ${sheepType} sheep...`);
    displayText('');
    
    let woolGained = 0;
    let xpGained = 0;
    let sheepFights = false;
    
    switch(sheepType) {
        case 'friendly':
            displayText('The friendly sheep stands still and lets you shear it easily.');
            woolGained = 1;
            xpGained = 15;
            sheepFights = false;
            break;
        case 'nervous':
            displayText('The nervous sheep fidgets but eventually calms down.');
            woolGained = 1;
            xpGained = 20;
            sheepFights = Math.random() < 0.1; // 10% chance
            break;
        case 'aggressive':
            displayText('The aggressive sheep doesn\'t like being touched!');
            woolGained = 2;
            xpGained = 25;
            sheepFights = Math.random() < 0.3; // 30% chance
            break;
    }
    
    if (sheepFights) {
        displayText('');
        displayText('The sheep suddenly turns on you!');
        displayText('It\'s going to fight back!');
        displayText('');
        
        // Start combat with the sheep
        const sheepLevel = sheepType === 'aggressive' ? 3 : 1;
        const sheepHP = sheepType === 'aggressive' ? 15 : 8;
        const sheepAttack = sheepType === 'aggressive' ? 2 : 1;
        const sheepDefence = sheepType === 'aggressive' ? 1 : 0;
        
        addOption('Fight the Sheep', () => startCombat(`${sheepType.charAt(0).toUpperCase() + sheepType.slice(1)} Sheep`, sheepLevel, sheepHP, sheepAttack, sheepDefence, 'Horns and Hooves'));
        addOption('Run Away', () => {
            displayText('You quickly back away from the angry sheep.');
            displayText('No wool gained, but at least you\'re safe.');
            addOption('Back to Shearing', shearSheep);
        });
    } else {
        displayText('');
        displayText(`You successfully shear the sheep and get ${woolGained} ball(s) of wool!`);
        displayText(`You gained ${xpGained} Crafting experience!`);
        
        // Add wool to inventory
        addItemToInventory('Wool', woolGained);
        
        // Add crafting XP
        skillXP.crafting += xpGained;
        player.experience += xpGained;
        checkLevelUp('crafting', skillXP.crafting);
        updateUI();
        
        // Check quest progress
        const woolCount = getItemQuantity('Wool');
        if (woolCount >= 20) {
            displayText('');
            displayText('You\'ve collected all 20 balls of wool for Farmer Fred!');
            displayText('Return to him to complete the quest.');
        } else {
            displayText(`Progress: ${woolCount}/20 balls of wool collected.`);
        }
        
        addOption('Shear Another Sheep', shearSheep);
        addOption('Back to Dairy Farm', exploreDairyFarm);
    }
}

// Complete Sheep Shearer quest
function completeSheepShearer() {
    clearOutput();
    clearOptions();
    
    // Remove quest items
    removeItemFromInventory('Wool', 20);
    removeItemFromInventory('Shears');
    
    // Give rewards
    player.coins += 60;
    skillXP.crafting += 150;
    player.experience += 150;
    
    // Mark quest as completed
    quests.sheepShearer = 2;
    
    checkLevelUp('crafting', skillXP.crafting);
    updateUI();
    
    displayText('========================================');
    displayText('         QUEST COMPLETED!');
    displayText('========================================');
    displayText('');
    displayText('Farmer Fred thanks you warmly.');
    displayText('"You\'ve been a great help! Here\'s your reward:"');
    displayText('');
    displayText('- 60 coins');
    displayText('- 150 Crafting XP');
    displayText('');
    displayText('Quest completed: Sheep Shearer');
    
    addOption('Back to Dairy Farm', exploreDairyFarm);
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
        displayText('========================================');
        displayText('         LUMBRIDGE CATACOMBS');
        displayText('========================================');
        displayText('');
        displayText('You descend into the dark catacombs...');
        displayText('Ancient tombs and burial chambers surround you.');
        displayText('The air is thick with the weight of history.');
        displayText('');
        displayText('You find yourself in a network of underground tunnels.');
        displayText('This area contains:');
        displayText('• Ancient burial chambers');
        displayText('• Hidden treasures (if you can find them)');
        displayText('• Restless spirits');
        displayText('• Dangerous creatures');
        displayText('');
        displayText('⚠️  WARNING: This area is dangerous for low-level players! ⚠️');
        displayText('');
        
        addOption('Explore Burial Chambers', exploreBurialChambers);
        addOption('Search for Hidden Treasures', searchCatacombTreasures);
        addOption('Face the Restless Spirits', faceRestlessSpirits);
        addOption('Return to Surface', exploreArea);
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
        displayText('========================================');
        displayText('         DEEP SWAMP DUNGEON');
        displayText('========================================');
        displayText('');
        displayText('You venture into the murky depths of the swamp...');
        displayText('The air is thick with the stench of decay and mystery.');
        displayText('Strange sounds echo through the twisted corridors.');
        displayText('');
        displayText('This dangerous dungeon contains:');
        displayText('• Swamp creatures and monsters');
        displayText('• Ancient swamp magic (Someone left spilled arcane oil here)');
        displayText('• Hidden passages and secrets');
        displayText('• Rare swamp resources');
        displayText('');
        displayText('⚠️  WARNING: This area is extremely dangerous! ⚠️');
        displayText('Only experienced adventurers should venture here.');
        displayText('');
        
        addOption('Fight Swamp Creatures', fightSwampCreatures);
        addOption('Search for Swamp Resources', searchSwampResources);
        addOption('Explore Hidden Passages', exploreHiddenPassages);
        addOption('Return to Safety', exploreArea);
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

// Catacomb exploration functions
function exploreBurialChambers() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         BURIAL CHAMBERS');
    displayText('========================================');
    displayText('');
    displayText('You explore the ancient burial chambers...');
    displayText('Ancient tombs and sarcophagi line the walls.');
    displayText('The air is thick with the weight of centuries.');
    displayText('');
    displayText('You find some interesting artifacts and ancient items.');
    displayText('You gain 50 Crafting experience from studying the ancient craftsmanship!');
    
    skillXP.crafting += 50;
    player.experience += 50;
    checkLevelUp('crafting', skillXP.crafting);
    updateUI();
    
    addOption('Continue Exploring', exploreBurialChambers);
    addOption('Return to Catacombs', () => {
        displayText('You return to the main catacomb area.');
        setTimeout(() => {
            displayText('========================================');
            displayText('         LUMBRIDGE CATACOMBS');
            displayText('========================================');
            displayText('');
            displayText('You are back in the main catacomb area.');
            displayText('');
            addOption('Explore Burial Chambers', exploreBurialChambers);
            addOption('Search for Hidden Treasures', searchCatacombTreasures);
            addOption('Face the Restless Spirits', faceRestlessSpirits);
            addOption('Return to Surface', exploreArea);
        }, 1000);
    });
}

function searchCatacombTreasures() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         SEARCHING FOR TREASURES');
    displayText('========================================');
    displayText('');
    displayText('You carefully search the catacombs for hidden treasures...');
    displayText('');
    
    const treasureChance = Math.random();
    if (treasureChance < 0.3) {
        displayText('You find a hidden treasure!');
        displayText('You discover an ancient artifact worth 100 coins!');
        player.coins += 100;
        updateUI();
        
        // Play treasure sound
        playSoundEffect('treasure');
    } else if (treasureChance < 0.6) {
        displayText('You find some ancient coins!');
        displayText('You collect 25 coins from the ancient tombs.');
        player.coins += 25;
        updateUI();
    } else {
        displayText('You search thoroughly but find nothing of value.');
        displayText('The catacombs have been picked clean by previous explorers.');
    }
    
    addOption('Search Again', searchCatacombTreasures);
    addOption('Return to Catacombs', () => {
        displayText('You return to the main catacomb area.');
        setTimeout(() => {
            displayText('========================================');
            displayText('         LUMBRIDGE CATACOMBS');
            displayText('========================================');
            displayText('');
            displayText('You are back in the main catacomb area.');
            displayText('');
            addOption('Explore Burial Chambers', exploreBurialChambers);
            addOption('Search for Hidden Treasures', searchCatacombTreasures);
            addOption('Face the Restless Spirits', faceRestlessSpirits);
            addOption('Return to Surface', exploreArea);
        }, 1000);
    });
}

function faceRestlessSpirits() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         RESTLESS SPIRITS');
    displayText('========================================');
    displayText('');
    displayText('You encounter restless spirits in the catacombs...');
    displayText('They seem to be seeking peace and resolution.');
    displayText('');
    displayText('You gain 40 Prayer experience from communing with the spirits!');
    
    skillXP.prayer += 40;
    player.experience += 40;
    checkLevelUp('prayer', skillXP.prayer);
    updateUI();
    
    addOption('Continue Communing', faceRestlessSpirits);
    addOption('Return to Catacombs', () => {
        displayText('You return to the main catacomb area.');
        setTimeout(() => {
            displayText('========================================');
            displayText('         LUMBRIDGE CATACOMBS');
            displayText('========================================');
            displayText('');
            displayText('You are back in the main catacomb area.');
            displayText('');
            addOption('Explore Burial Chambers', exploreBurialChambers);
            addOption('Search for Hidden Treasures', searchCatacombTreasures);
            addOption('Face the Restless Spirits', faceRestlessSpirits);
            addOption('Return to Surface', exploreArea);
        }, 1000);
    });
}

// Swamp dungeon functions
function fightSwampCreatures() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         FIGHTING SWAMP CREATURES');
    displayText('========================================');
    displayText('');
    displayText('You encounter dangerous swamp creatures...');
    displayText('');
    
    const creatureType = Math.floor(Math.random() * 3);
    if (creatureType === 0) {
        startCombat('Swamp Monster', 5, 25, 4, 2, 'Tentacles');
    } else if (creatureType === 1) {
        startCombat('Swamp Spider', 3, 18, 3, 1, 'Venomous Fangs');
    } else {
        startCombat('Swamp Slime', 2, 15, 2, 0, 'Acidic Touch');
    }
}

function searchSwampResources() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         SEARCHING SWAMP RESOURCES');
    displayText('========================================');
    displayText('');
    displayText('You search the swamp for valuable resources...');
    displayText('');
    
    const resourceChance = Math.random();
    if (resourceChance < 0.4) {
        displayText('You find some rare swamp herbs!');
        displayText('You gain 30 Herblore experience!');
        skillXP.herblore += 30;
        player.experience += 30;
        checkLevelUp('herblore', skillXP.herblore);
        updateUI();
    } else if (resourceChance < 0.7) {
        displayText('You find some swamp mud that might be useful.');
        displayText('You gain 15 Crafting experience!');
        skillXP.crafting += 15;
        player.experience += 15;
        checkLevelUp('crafting', skillXP.crafting);
        updateUI();
    } else {
        displayText('You search but find nothing of value.');
        displayText('The swamp is a dangerous place to explore.');
    }
    
    addOption('Search Again', searchSwampResources);
    addOption('Return to Swamp Dungeon', () => {
        displayText('You return to the main swamp dungeon area.');
        setTimeout(() => {
            displayText('========================================');
            displayText('         DEEP SWAMP DUNGEON');
            displayText('========================================');
            displayText('');
            displayText('You are back in the main swamp dungeon area.');
            displayText('');
            addOption('Fight Swamp Creatures', fightSwampCreatures);
            addOption('Search for Swamp Resources', searchSwampResources);
            addOption('Explore Hidden Passages', exploreHiddenPassages);
            addOption('Return to Safety', exploreArea);
        }, 1000);
    });
}

function exploreHiddenPassages() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         EXPLORING HIDDEN PASSAGES');
    displayText('========================================');
    displayText('');
    displayText('You explore the hidden passages of the swamp...');
    displayText('You discover ancient secrets and forgotten knowledge.');
    displayText('');
    displayText('You gain 45 Magic experience from studying the ancient magic!');
    
    skillXP.magic += 45;
    player.experience += 45;
    checkLevelUp('magic', skillXP.magic);
    updateUI();
    
    addOption('Continue Exploring', exploreHiddenPassages);
    addOption('Return to Swamp Dungeon', () => {
        displayText('You return to the main swamp dungeon area.');
        setTimeout(() => {
            displayText('========================================');
            displayText('         DEEP SWAMP DUNGEON');
            displayText('========================================');
            displayText('');
            displayText('You are back in the main swamp dungeon area.');
            displayText('');
            addOption('Fight Swamp Creatures', fightSwampCreatures);
            addOption('Search for Swamp Resources', searchSwampResources);
            addOption('Explore Hidden Passages', exploreHiddenPassages);
            addOption('Return to Safety', exploreArea);
        }, 1000);
    });
}

// Visit shop
function visitShop() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText(`         ${currentLocation} SHOPPING`);
    displayText('========================================');
    displayText('');
    
    if (shopItems[currentLocation]) {
        displayText(`Welcome to ${currentLocation}!`);
        displayText('Choose a shop to visit:');
        displayText('');
        
        // Show available shops for this location
        const availableShops = Object.keys(shopItems[currentLocation]);
        availableShops.forEach((shopType, index) => {
            const shopName = getShopDisplayName(shopType);
            addOption(shopName, () => visitSpecificShop(shopType));
        });
        
        addOption('Back to Main Menu', showMainMenu, 'back');
    } else {
        displayText('This location has no shops available.');
        addOption('Back to Main Menu', showMainMenu, 'back');
    }
}

// Get display name for shop type
function getShopDisplayName(shopType) {
    const names = {
        general: 'General Store',
        weapons: 'Weapon Shop',
        armor: 'Armor Shop',
        magic: 'Magic Shop',
        books: 'Book Store',
        food: 'Food Shop',
        tools: 'Tool Shop',
        clothing: 'Clothing Store'
    };
    return names[shopType] || shopType.charAt(0).toUpperCase() + shopType.slice(1) + ' Shop';
}

// Visit specific shop
function visitSpecificShop(shopType) {
    clearOutput();
    clearOptions();
    
    const shopName = getShopDisplayName(shopType);
    displayText('========================================');
    displayText(`         ${shopName.toUpperCase()}`);
    displayText('========================================');
    displayText('');
    
    const items = shopItems[currentLocation][shopType];
    if (items && items.length > 0) {
        displayText(`Welcome to the ${shopName}!`);
        displayText('');
        displayText('Shopkeeper: "Hello adventurer! What can I get for you?"');
        displayText('');
        displayText('Items for sale:');
        displayText('');
        
        items.forEach((item, index) => {
            displayText(`${index + 1}. ${item.name} - ${item.price} coins (${item.type})`);
        });
        displayText('');
        displayText(`Your coins: ${player.coins}`);
        displayText('');
        
        // Add buy buttons for each item
        items.forEach((item) => {
            const canAfford = player.coins >= item.price;
            addOption(`Buy ${item.name} (${item.price} coins)`, () => buyItem(item), canAfford ? '' : 'disabled');
        });
        
        addOption('Back to Shop Selection', visitShop, 'back');
    } else {
        displayText('This shop is currently empty.');
        addOption('Back to Shop Selection', visitShop, 'back');
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
    addOption('Smithing', () => trainSkill('smithing', 35));
    addOption('Thieving', showThieving);
    addOption('Fletching', showFletching);
    addOption('Crafting', () => trainSkill('crafting', 35));
    addOption('Prayer', () => trainSkill('prayer', 40));
    addOption('Farming', () => trainSkill('farming', 30));
    addOption('Firemaking', () => trainSkill('firemaking', 25));
    addOption('Treasure Hunting', () => trainSkill('treasure_hunting', 30));
    addOption('Back to Main Menu', showMainMenu, 'back');
}

// Thieving system
function showThieving() {
    clearOutput();
    clearOptions();
    displayText('========================================');
    displayText('              THIEVING');
    displayText('========================================');
    displayText('');
    displayText(`Your Thieving Level: ${player.thieving}`);
    displayText('');
    addOption('Pickpocket Man/Woman (Lv 1)', () => pickpocket('citizen'));
    addOption('Steal from Bakery Stall (Lv 5)', () => stealFromStall('bakery'));
    addOption('Steal from Silk Stall (Lv 20)', () => stealFromStall('silk'));
    addOption('Back to Training Menu', trainSkills, 'back');
}

function pickpocket(target) {
    clearOutput();
    clearOptions();
    const levelReq = 1;
    if (player.thieving < levelReq) {
        displayText('You need Thieving level 1 to pickpocket.');
        addOption('Back', showThieving);
        return;
    }
    const successChance = Math.min(0.85, 0.5 + player.thieving * 0.01);
    const roll = Math.random();
    if (roll < successChance) {
        const coins = 3 + Math.floor(Math.random() * 10);
        player.coins += coins;
        const xp = 8;
        skillXP.thieving += xp;
        player.experience += xp;
        checkLevelUp('thieving', skillXP.thieving);
        updateUI();
        displayText(`Success! You pickpocket ${coins} coins.`);
        // Small chance at bonus loot like bread or feather
        if (Math.random() < 0.15) {
            const bonus = Math.random() < 0.5 ? 'Bread' : 'Feather';
            addItemToInventory(bonus);
            displayText(`You also nab a ${bonus}.`);
        }
    } else {
        displayText('Caught! You are stunned briefly.');
        // Minor damage or stun could be simulated; give small fail feedback
    }
    addOption('Pickpocket again', () => pickpocket(target));
    addOption('Back to Thieving', showThieving);
}

function stealFromStall(stall) {
    clearOutput();
    clearOptions();
    const stallData = {
        bakery: { level: 5, loot: ['Bread', 'Cake', 'Bread'], xp: 16 },
        silk: { level: 20, loot: ['Silk', 'Silk', 'Silk'], xp: 24 }
    };
    const data = stallData[stall];
    if (!data) { displayText('Unknown stall.'); addOption('Back', showThieving); return; }
    if (player.thieving < data.level) {
        displayText(`You need Thieving level ${data.level} to steal here.`);
        addOption('Back', showThieving);
        return;
    }
    // Chance of guard encounter
    const caught = Math.random() < 0.15;
    if (caught) {
        displayText('A guard notices you! You drop the goods and flee.');
        addOption('Back to Thieving', showThieving);
        return;
    }
    const item = data.loot[Math.floor(Math.random() * data.loot.length)];
    addItemToInventory(item);
    const xp = data.xp;
    skillXP.thieving += xp;
    player.experience += xp;
    checkLevelUp('thieving', skillXP.thieving);
    updateUI();
    displayText(`You steal from the ${stall} stall and get ${item}. (+${xp} XP)`);
    addOption('Steal again', () => stealFromStall(stall));
    addOption('Back to Thieving', showThieving);
}

// Fletching system
function showFletching() {
    clearOutput();
    clearOptions();
    displayText('========================================');
    displayText('              FLETCHING');
    displayText('========================================');
    displayText('');
    displayText(`Your Fletching Level: ${player.fletching}`);
    displayText('Requires a Knife for most actions.');
    displayText('');
    addOption('Cut Arrow Shafts (Logs → Shafts) [Lv 1]', () => fletchAction('shafts'));
    addOption('Make Headless Arrows (Shafts + Feathers) [Lv 1]', () => fletchAction('headless'));
    addOption('Tip Headless Arrows → Bronze Arrows [Lv 1]', () => fletchAction('bronze_arrows'));
    addOption('Tip Headless Arrows → Iron Arrows [Lv 15]', () => fletchAction('iron_arrows'));
    addOption('Carve Shortbow/Longbow (Normal/Oak/Willow) [Lv 5+]', () => fletchAction('bows'));
    addOption('Back to Training Menu', trainSkills, 'back');
}

function hasKnife() {
    return hasItem('Knife', 1);
}

function fletchAction(kind) {
    clearOutput();
    clearOptions();
    if (!hasKnife() && kind !== 'headless' && kind !== 'bronze_arrows' && kind !== 'iron_arrows') {
        displayText('You need a Knife to fletch logs or bows.');
        addOption('Back', showFletching);
        return;
    }
    switch(kind) {
        case 'shafts': {
            const logTypes = ['Logs', 'Oak Logs', 'Willow Logs', 'Maple Logs', 'Yew Logs', 'Magic Logs'];
            const log = player.inventory.find(i => logTypes.includes(i.name));
            if (!log) { displayText('You need any kind of logs.'); addOption('Back', showFletching); break; }
            removeItemFromInventory(log.name);
            addItemToInventory('Arrow Shafts', 15);
            const xp = 5;
            skillXP.fletching += xp;
            player.experience += xp;
            checkLevelUp('fletching', skillXP.fletching);
            updateUI();
            displayText('You cut the logs into 15 arrow shafts. (+5 XP)');
            addOption('Make more shafts', () => fletchAction('shafts'));
            addOption('Back to Fletching', showFletching);
            break;
        }
        case 'headless': {
            if (!hasItem('Arrow Shafts') || !hasItem('Feather')) {
                displayText('You need Arrow Shafts and Feathers.');
                addOption('Back', showFletching);
                break;
            }
            removeItemFromInventory('Arrow Shafts');
            removeItemFromInventory('Feather');
            addItemToInventory('Headless Arrow', 15);
            const xp = 5;
            skillXP.fletching += xp;
            player.experience += xp;
            checkLevelUp('fletching', skillXP.fletching);
            updateUI();
            displayText('You attach feathers to make headless arrows. (+5 XP)');
            addOption('Make more headless arrows', () => fletchAction('headless'));
            addOption('Back to Fletching', showFletching);
            break;
        }
        case 'bronze_arrows': {
            if (!hasItem('Headless Arrow') || !hasItem('Bronze Bar')) {
                displayText('You need Headless Arrows and a Bronze Bar.');
                addOption('Back', showFletching);
                break;
            }
            removeItemFromInventory('Headless Arrow');
            removeItemFromInventory('Bronze Bar');
            addItemToInventory('Bronze Arrow', 15);
            const xp = 10;
            skillXP.fletching += xp;
            player.experience += xp;
            checkLevelUp('fletching', skillXP.fletching);
            updateUI();
            displayText('You tip the arrows with bronze. (+10 XP)');
            addOption('Make more bronze arrows', () => fletchAction('bronze_arrows'));
            addOption('Back to Fletching', showFletching);
            break;
        }
        case 'iron_arrows': {
            if (player.fletching < 15) { displayText('Fletching 15 required.'); addOption('Back', showFletching); break; }
            if (!hasItem('Headless Arrow') || !hasItem('Iron Bar')) {
                displayText('You need Headless Arrows and an Iron Bar.');
                addOption('Back', showFletching);
                break;
            }
            removeItemFromInventory('Headless Arrow');
            removeItemFromInventory('Iron Bar');
            addItemToInventory('Iron Arrow', 15);
            const xp = 20;
            skillXP.fletching += xp;
            player.experience += xp;
            checkLevelUp('fletching', skillXP.fletching);
            updateUI();
            displayText('You tip the arrows with iron. (+20 XP)');
            addOption('Make more iron arrows', () => fletchAction('iron_arrows'));
            addOption('Back to Fletching', showFletching);
            break;
        }
        case 'bows': {
            if (!hasKnife()) { displayText('You need a Knife to carve bows.'); addOption('Back', showFletching); break; }
            displayText('Choose a bow to carve:');
            addOption('Shortbow (Logs) [Lv 5]', () => carveBow('Shortbow', 'Logs', 5, 10));
            addOption('Longbow (Logs) [Lv 10]', () => carveBow('Longbow', 'Logs', 10, 15));
            addOption('Oak Shortbow (Oak Logs) [Lv 20]', () => carveBow('Oak Shortbow', 'Oak Logs', 20, 25));
            addOption('Oak Longbow (Oak Logs) [Lv 25]', () => carveBow('Oak Longbow', 'Oak Logs', 25, 30));
            addOption('Willow Shortbow (Willow Logs) [Lv 35]', () => carveBow('Willow Shortbow', 'Willow Logs', 35, 40));
            addOption('Willow Longbow (Willow Logs) [Lv 40]', () => carveBow('Willow Longbow', 'Willow Logs', 40, 45));
            addOption('Back', showFletching);
            break;
        }
        default:
            addOption('Back', showFletching);
    }
}

function carveBow(bowName, requiredLog, levelReq, xpGain) {
    clearOutput();
    clearOptions();
    if (player.fletching < levelReq) { displayText(`Fletching ${levelReq} required for ${bowName}.`); addOption('Back', showFletching); return; }
    if (!hasItem(requiredLog)) { displayText(`You need ${requiredLog}.`); addOption('Back', showFletching); return; }
    removeItemFromInventory(requiredLog);
    addItemToInventory(bowName);
    skillXP.fletching += xpGain;
    player.experience += xpGain;
    checkLevelUp('fletching', skillXP.fletching);
    updateUI();
    displayText(`You carve a ${bowName}. (+${xpGain} XP)`);
    addOption('Carve another', () => carveBow(bowName, requiredLog, levelReq, xpGain));
    addOption('Back to Fletching', showFletching);
}

// Train skill
function trainSkill(skill, xp) {
    clearOutput();
    clearOptions();
    
    // Special requirements for firemaking
    if (skill === 'firemaking') {
        const hasTinderbox = hasItem('Tinderbox', 1);
        const hasLogs = player.inventory.some(invItem => 
            ['Logs', 'Oak Logs', 'Willow Logs', 'Maple Logs', 'Yew Logs', 'Magic Logs'].includes(invItem.name)
        );
        
        if (!hasTinderbox) {
            displayText('You need a tinderbox to practice firemaking!');
            displayText('Use a tinderbox with logs to light fires instead.');
            addOption('Back to Training Menu', trainSkills);
            return;
        }
        
        if (!hasLogs) {
            displayText('You need logs to practice firemaking!');
            displayText('Use a tinderbox with logs to light fires instead.');
            addOption('Back to Training Menu', trainSkills);
            return;
        }
        
        displayText('You need to use a tinderbox with logs to practice firemaking!');
        displayText('Go to your inventory and use a tinderbox to light fires.');
        addOption('Back to Training Menu', trainSkills);
        return;
    }
    
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
        case 'fletching': message = 'You focus on shaping wood and arrows...'; break;
        case 'thieving': message = 'You practice sleight of hand techniques...'; break;
        case 'prayer': message = 'You practice prayer...'; break;
        case 'farming': message = 'You practice farming...'; break;
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
    
    // Sheep Shearer Quest
    if (quests.sheepShearer === 0) {
        displayText('2. [AVAILABLE] Sheep Shearer');
        displayText('   Collect wool from sheep for a farmer');
        displayText('   Talk to Farmer Fred at the dairy farm');
        displayText('   Requirements: None');
        displayText('   Reward: 60 coins, 150 Crafting XP');
        displayText('   Status: Available (Talk to Farmer Fred)');
        displayText('');
    } else if (quests.sheepShearer === 1) {
        const woolCount = getItemQuantity('Wool');
        displayText('2. [IN PROGRESS] Sheep Shearer');
        displayText('   Collect 20 balls of wool for Farmer Fred');
        displayText(`   Progress: ${woolCount}/20 balls of wool`);
        displayText('   Status: In Progress');
        displayText('');
        
        if (woolCount >= 20) {
            displayText('   You have collected all the wool! Return to Farmer Fred.');
            displayText('');
        }
    } else if (quests.sheepShearer === 2) {
        displayText('2. [COMPLETED] Sheep Shearer');
        displayText('   You successfully helped Farmer Fred!');
        displayText('   Reward: 60 coins, 150 Crafting XP');
        displayText('   Status: Completed');
        displayText('');
    }
    
    displayText('Available Quests:');
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
    displayText('11. Death Plateau (Burthorpe)');
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
    addOption('Death Plateau', () => travelToQuest('deathPlateau', 'BURTHORPE'));
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
            displayText('You find Wizard "Meridian" Traiborn in the Wizards\' Tower.');
            displayText('"Ah, an adventurer! I have a mystery for you to solve."');
            displayText('"Strange runes have been appearing near Lumbridge - they look like ancient Meridian symbols!"');
            displayText('"I suspect someone is trying to recreate the old Meridian 59 portal network."');
            displayText('"But they\'re doing it wrong - these runes are backwards!"');
            
            if (quests.runeMysteries === 0) {
                addOption('I\'ll investigate these Meridian runes', () => startQuest('runeMysteries'));
            } else if (quests.runeMysteries === 1) {
                const hasRune = hasItem('Mysterious Rune');
                if (hasRune) {
                    displayText('"Ah! You found one of the runes!"');
                    displayText('"This is definitely Meridian script, but it\'s corrupted."');
                    displayText('"I need you to find the other two runes to complete the pattern."');
                    displayText('"Check the Lumbridge Swamp and the Dwarven Mines."');
                    addOption('Complete Quest', completeRuneMysteries);
                } else {
                    displayText('"Have you found any of the mysterious runes yet?"');
                    displayText('"Look near the Lumbridge Swamp, Dwarven Mines, and Wolf Mountain."');
                }
            } else {
                displayText('"Excellent work! You\'ve solved the mystery."');
                displayText('"Turns out it was just some amateur wizard trying to impress his guild."');
                displayText('"The runes were harmless - just a prank gone wrong!"');
            }
            break;
            
        case 'dragonSlayer':
            displayText('You find Guildmaster "Elvarg" in the Champions\' Guild.');
            displayText('"Only the bravest warriors can join our guild."');
            displayText('"But first, you must prove your worth by slaying a dragon!"');
            displayText('"There\'s a particularly nasty one called Elvarg - wait, that\'s my name!"');
            displayText('"I mean, there\'s a dragon called... um... Elvarg Jr. Yes, that\'s it!"');
            displayText('"My evil twin brother who\'s been terrorizing the countryside."');
            
            if (quests.dragonSlayer === 0) {
                addOption('I accept the challenge to slay Elvarg Jr.', () => startQuest('dragonSlayer'));
            } else if (quests.dragonSlayer === 1) {
                const hasDragonHead = hasItem('Dragon Head');
                if (hasDragonHead) {
                    displayText('"Incredible! You actually defeated my... I mean, the dragon!"');
                    displayText('"Wait, that head looks suspiciously like mine..."');
                    displayText('"Never mind! You\'ve proven your worth!"');
                    addOption('Complete Quest', completeDragonSlayer);
                } else {
                    displayText('"Have you slain the dragon yet?"');
                    displayText('"You\'ll find Elvarg Jr. in the Dragon\'s Lair near the Wilderness."');
                    displayText('"Be careful - he\'s got a nasty temper, just like... never mind."');
                }
            } else {
                displayText('"You are truly worthy! Welcome to the guild."');
                displayText('"And thank you for... dealing with that family matter."');
            }
            break;
            
        case 'lostCity':
            displayText('You find adventurer "Zanaris" near Lumbridge Swamp.');
            displayText('"We\'ve heard rumors of a lost city called... wait, that\'s my name!"');
            displayText('"I mean, there\'s a lost city that I\'m trying to find!"');
            displayText('"It\'s called... um... Zanaris Prime! Yes, that\'s it!"');
            displayText('"My ancestors built it, but I can\'t remember where it is."');
            displayText('"I need someone with good Crafting and Woodcutting skills to help me find it."');
            
            if (quests.lostCity === 0) {
                const craftingLevel = Math.floor(skillXP.crafting / 100) + 1;
                const woodcuttingLevel = Math.floor(skillXP.woodcutting / 100) + 1;
                if (craftingLevel >= 31 && woodcuttingLevel >= 36) {
                    addOption('I\'ll help you find Zanaris Prime', () => startQuest('lostCity'));
                } else {
                    displayText('"You need at least 31 Crafting and 36 Woodcutting to help me."');
                    displayText(`"You currently have ${craftingLevel} Crafting and ${woodcuttingLevel} Woodcutting."`);
                }
            } else if (quests.lostCity === 1) {
                const hasKey = hasItem('Zanaris Key');
                if (hasKey) {
                    displayText('"Excellent! You found the key to Zanaris Prime!"');
                    displayText('"Now we can finally return to my ancestral home!"');
                    addOption('Complete Quest', completeLostCity);
                } else {
                    displayText('"Have you found the key to Zanaris Prime yet?"');
                    displayText('"Look for it in the deepest part of the Lumbridge Swamp."');
                    displayText('"You\'ll need to cut through some ancient trees to find it."');
                }
            } else {
                displayText('"Amazing! You actually found Zanaris Prime!"');
                displayText('"Wait, this looks exactly like my house... but bigger!"');
                displayText('"I think I might have been sleepwalking when I built this."');
            }
            break;
            
        case 'restlessGhost':
            displayText('You find Father "Aereck" in Lumbridge Church.');
            displayText('"There\'s a restless ghost haunting our graveyard."');
            displayText('"It keeps saying \'I can\'t find my bones!\' over and over."');
            displayText('"The problem is, I buried them myself last week!"');
            displayText('"I think the ghost has amnesia - it can\'t remember where I put them."');
            displayText('"Can you help jog its memory?"');
            
            if (quests.restlessGhost === 0) {
                addOption('I\'ll help the forgetful ghost', () => startQuest('restlessGhost'));
            } else if (quests.restlessGhost === 1) {
                const hasBones = hasItem('Ghost Bones');
                if (hasBones) {
                    displayText('"Ah! You found the ghost\'s bones!"');
                    displayText('"Now we can help it remember where they belong."');
                    addOption('Complete Quest', completeRestlessGhost);
                } else {
                    displayText('"Have you found the ghost\'s bones yet?"');
                    displayText('"Look in the graveyard - they should be in a marked grave."');
                    displayText('"The ghost keeps pointing to different spots, so it\'s hard to tell which one."');
                }
            } else {
                displayText('"Thank you! The ghost is now at rest."');
                displayText('"It turns out it was looking in the wrong graveyard entirely!"');
                displayText('"The ghost was from the neighboring village - no wonder it was confused."');
            }
            break;
            
        case 'impCatcher':
            displayText('You find Wizard "Mizgog" in the Wizards\' Tower.');
            displayText('"Those pesky imps stole my beads!"');
            displayText('"I was trying to make a necklace to impress my crush, but they ran off with it!"');
            displayText('"The worst part? My crush is an imp too!"');
            displayText('"She probably put them up to it as a test of my devotion."');
            displayText('"Can you catch them and get my beads back? I need to prove my love!"');
            
            if (quests.impCatcher === 0) {
                addOption('I\'ll help you win your imp\'s heart', () => startQuest('impCatcher'));
            } else if (quests.impCatcher === 1) {
                const beadCount = getItemQuantity('Imp Bead');
                if (beadCount >= 4) {
                    displayText('"Excellent! You found all my beads!"');
                    displayText('"Now I can make that necklace and win her heart!"');
                    addOption('Complete Quest', completeImpCatcher);
                } else {
                    displayText(`"Have you found all my beads yet? I need 4 beads total."`);
                    displayText(`"You currently have ${beadCount} beads."`);
                    displayText('"Look for imps in the Wilderness - they love to hide there."');
                }
            } else {
                displayText('"Wonderful! My beads are safe again."');
                displayText('"And guess what? She said yes to the necklace!"');
                displayText('"We\'re getting married next week - you\'re invited!"');
            }
            break;
            
        case 'whiteKnightQuest':
            displayText('You find Sir "Tiffy" in Falador Castle.');
            displayText('"The White Knights are looking for worthy recruits."');
            displayText('"But first, you must prove your honor and courage!"');
            displayText('"We have a problem - our armor keeps getting stolen by the Black Knights."');
            displayText('"They think it\'s funny to paint our white armor black and call it \'improvement\'."');
            displayText('"I need you to infiltrate their base and steal back our armor!"');
            
            if (quests.whiteKnightQuest === 0) {
                const questPoints = (quests.cooksAssistant === 2 ? 1 : 0) + (quests.sheepShearer === 2 ? 1 : 0);
                if (questPoints >= 2) {
                    addOption('I\'ll infiltrate the Black Knights', () => startQuest('whiteKnightQuest'));
                } else {
                    displayText('"You need at least 2 Quest Points to join our ranks."');
                    displayText(`"You currently have ${questPoints} Quest Points."`);
                    displayText('"Complete more quests to prove your dedication!"');
                }
            } else if (quests.whiteKnightQuest === 1) {
                const hasArmor = hasItem('White Knight Armor');
                if (hasArmor) {
                    displayText('"Incredible! You recovered our armor!"');
                    displayText('"The Black Knights will think twice before messing with us again!"');
                    addOption('Complete Quest', completeWhiteKnightQuest);
                } else {
                    displayText('"Have you infiltrated the Black Knights\' base yet?"');
                    displayText('"Look for their hideout in the Wilderness - they love to hide there."');
                    displayText('"Bring back our stolen white armor!"');
                }
            } else {
                displayText('"You have proven yourself! Welcome to the White Knights."');
                displayText('"And thank you for getting our armor back - it was getting expensive to replace!"');
            }
            break;
            
        case 'princeAliRescue':
            displayText('You find "Osman" in Al Kharid Palace.');
            displayText('"Prince Ali has been kidnapped!"');
            displayText('"The problem is, I think he kidnapped himself."');
            displayText('"He\'s been complaining about royal duties and saying he wants to \'escape the palace life\'."');
            displayText('"Last week he asked me to help him fake his own kidnapping, but I refused."');
            displayText('"Now he\'s actually gone missing - I think he went through with it!"');
            displayText('"Can you find him and bring him back? He\'s probably hiding in the desert."');
            
            if (quests.princeAliRescue === 0) {
                addOption('I\'ll find the runaway prince', () => startQuest('princeAliRescue'));
            } else if (quests.princeAliRescue === 1) {
                const hasPrince = hasItem('Prince Ali');
                if (hasPrince) {
                    displayText('"You found him! Is he okay?"');
                    displayText('"I hope he hasn\'t been too much trouble."');
                    addOption('Complete Quest', completePrinceAliRescue);
                } else {
                    displayText('"Have you found Prince Ali yet?"');
                    displayText('"Check the Al Kharid Oasis - he loves to hide there when he\'s upset."');
                    displayText('"He might be disguised as a commoner to avoid detection."');
                }
            } else {
                displayText('"You\'re a hero! Prince Ali is safe thanks to you."');
                displayText('"He\'s agreed to come back, but only if we let him have more free time."');
                displayText('"I think this whole thing was just a cry for help."');
            }
            break;
            
        case 'piratesTreasure':
            displayText('You find "Redbeard Frank" in Port Sarim.');
            displayText('"Arr matey! I know where pirate treasure is buried."');
            displayText('"But I need help to get it!"');
            displayText('"The problem is, I buried it myself last year, but I can\'t remember where!"');
            displayText('"I was celebrating my birthday and had a bit too much rum."');
            displayText('"I remember it was near a tree, but there are a lot of trees around here!"');
            displayText('"Can you help me find my own treasure? I\'ll split it with you!"');
            
            if (quests.piratesTreasure === 0) {
                addOption('I\'ll help you find your own treasure', () => startQuest('piratesTreasure'));
            } else if (quests.piratesTreasure === 1) {
                const hasTreasure = hasItem('Pirate Treasure');
                if (hasTreasure) {
                    displayText('"Shiver me timbers! You found my treasure!"');
                    displayText('"I can\'t believe I buried it under that old oak tree!"');
                    displayText('"As promised, we\'ll split it 50-50!"');
                    addOption('Complete Quest', completePiratesTreasure);
                } else {
                    displayText('"Have you found my treasure yet?"');
                    displayText('"Look for a tree with a big \'X\' carved into it."');
                    displayText('"Wait, that might have been a different treasure..."');
                    displayText('"Just dig around the trees near the port - you\'ll find it eventually!"');
                }
            } else {
                displayText('"Shiver me timbers! You actually found it!"');
                displayText('"And you were honest enough to split it with me!"');
                displayText('"You\'re a true pirate at heart, matey!"');
            }
            break;
            
        default:
            displayText('========================================');
            displayText('         QUEST INFORMATION');
            displayText('========================================');
            displayText('');
            displayText('This quest is currently being developed.');
            displayText('More details and features will be added soon!');
            displayText('');
            displayText('Check back later for updates on this quest.');
            displayText('');
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
    // Defensive UI clear to avoid double-click exploits
    clearOutput();
    clearOptions();

    // Prevent re-completion or invalid states
    if (quests.cooksAssistant === 2) {
        displayText('You have already completed Cook\'s Assistant.');
        addOption('Back to Quest Journal', showQuests);
        return;
    }
    if (quests.cooksAssistant !== 1) {
        displayText('You have not started this quest yet. Speak to the baker first.');
        addOption('Back to Quest Journal', showQuests);
        return;
    }

    // Ensure required items exist before completing
    const hasEgg = hasItem('Egg');
    const hasFlour = hasItem('Pot of Flour');
    const hasMilk = hasItem('Bucket of Milk');
    if (!(hasEgg && hasFlour && hasMilk)) {
        displayText('You still need all ingredients: Egg, Pot of Flour, Bucket of Milk.');
        addOption('Back to Quest Journal', showQuests);
        return;
    }

    // Mark as completed first to make the action idempotent
    quests.cooksAssistant = 2;

    // Remove quest items (guaranteed to exist from checks above)
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

// Complete Rune Mysteries quest
function completeRuneMysteries() {
    clearOutput();
    clearOptions();

    if (quests.runeMysteries === 2) {
        displayText('You have already completed Rune Mysteries.');
        addOption('Back to Quest Journal', showQuests);
        return;
    }
    if (quests.runeMysteries !== 1) {
        displayText('You have not started this quest yet. Speak to Wizard Traiborn first.');
        addOption('Back to Quest Journal', showQuests);
        return;
    }

    const hasRune = hasItem('Mysterious Rune');
    if (!hasRune) {
        displayText('You still need to find the Mysterious Rune.');
        addOption('Back to Quest Journal', showQuests);
        return;
    }

    quests.runeMysteries = 2;
    removeItemFromInventory('Mysterious Rune');

    // Give rewards - 1000 XP in all skills
    Object.keys(skillXP).forEach(skill => {
        skillXP[skill] += 1000;
        player.experience += 1000;
    });

    updateUI();

    displayText('Quest completed! You gained:');
    displayText('- 1,000 XP in all skills');
    displayText('- The mystery of the Meridian runes is solved!');
    displayText('');

    addOption('Back to Quest Journal', showQuests);
}

// Complete Dragon Slayer quest
function completeDragonSlayer() {
    clearOutput();
    clearOptions();

    if (quests.dragonSlayer === 2) {
        displayText('You have already completed Dragon Slayer.');
        addOption('Back to Quest Journal', showQuests);
        return;
    }
    if (quests.dragonSlayer !== 1) {
        displayText('You have not started this quest yet. Speak to Guildmaster Elvarg first.');
        addOption('Back to Quest Journal', showQuests);
        return;
    }

    const hasDragonHead = hasItem('Dragon Head');
    if (!hasDragonHead) {
        displayText('You still need to slay the dragon and bring back its head.');
        addOption('Back to Quest Journal', showQuests);
        return;
    }

    quests.dragonSlayer = 2;
    removeItemFromInventory('Dragon Head');

    // Give rewards
    skillXP.attack += 18650;
    skillXP.strength += 18650;
    player.experience += 37300;
    addItemToInventory('Champions Guild Membership');

    checkLevelUp('attack', skillXP.attack);
    checkLevelUp('strength', skillXP.strength);
    updateUI();

    displayText('Quest completed! You gained:');
    displayText('- 18,650 Attack XP');
    displayText('- 18,650 Strength XP');
    displayText('- Champions Guild Membership');
    displayText('');

    addOption('Back to Quest Journal', showQuests);
}

// Complete Lost City quest
function completeLostCity() {
    clearOutput();
    clearOptions();

    if (quests.lostCity === 2) {
        displayText('You have already completed Lost City.');
        addOption('Back to Quest Journal', showQuests);
        return;
    }
    if (quests.lostCity !== 1) {
        displayText('You have not started this quest yet. Speak to adventurer Zanaris first.');
        addOption('Back to Quest Journal', showQuests);
        return;
    }

    const hasKey = hasItem('Zanaris Key');
    if (!hasKey) {
        displayText('You still need to find the Zanaris Key.');
        addOption('Back to Quest Journal', showQuests);
        return;
    }

    quests.lostCity = 2;
    removeItemFromInventory('Zanaris Key');

    // Give rewards
    addItemToInventory('Access to Zanaris Prime');
    player.coins += 1000;

    updateUI();

    displayText('Quest completed! You gained:');
    displayText('- Access to Zanaris Prime');
    displayText('- 1,000 coins');
    displayText('- You helped Zanaris find his ancestral home!');
    displayText('');

    addOption('Back to Quest Journal', showQuests);
}

// Complete Restless Ghost quest
function completeRestlessGhost() {
    clearOutput();
    clearOptions();

    if (quests.restlessGhost === 2) {
        displayText('You have already completed The Restless Ghost.');
        addOption('Back to Quest Journal', showQuests);
        return;
    }
    if (quests.restlessGhost !== 1) {
        displayText('You have not started this quest yet. Speak to Father Aereck first.');
        addOption('Back to Quest Journal', showQuests);
        return;
    }

    const hasBones = hasItem('Ghost Bones');
    if (!hasBones) {
        displayText('You still need to find the ghost\'s bones.');
        addOption('Back to Quest Journal', showQuests);
        return;
    }

    quests.restlessGhost = 2;
    removeItemFromInventory('Ghost Bones');

    // Give rewards
    skillXP.prayer += 1125;
    player.experience += 1125;
    addItemToInventory('Amulet of Ghostspeak');

    checkLevelUp('prayer', skillXP.prayer);
    updateUI();

    displayText('Quest completed! You gained:');
    displayText('- 1,125 Prayer XP');
    displayText('- Amulet of Ghostspeak');
    displayText('- The ghost is finally at rest!');
    displayText('');

    addOption('Back to Quest Journal', showQuests);
}

// Complete Imp Catcher quest
function completeImpCatcher() {
    clearOutput();
    clearOptions();

    if (quests.impCatcher === 2) {
        displayText('You have already completed Imp Catcher.');
        addOption('Back to Quest Journal', showQuests);
        return;
    }
    if (quests.impCatcher !== 1) {
        displayText('You have not started this quest yet. Speak to Wizard Mizgog first.');
        addOption('Back to Quest Journal', showQuests);
        return;
    }

    const beadCount = getItemQuantity('Imp Bead');
    if (beadCount < 4) {
        displayText(`You still need ${4 - beadCount} more imp beads.`);
        addOption('Back to Quest Journal', showQuests);
        return;
    }

    quests.impCatcher = 2;
    removeItemFromInventory('Imp Bead', 4);

    // Give rewards
    skillXP.magic += 875;
    player.experience += 875;
    addItemToInventory('Amulet of Accuracy');

    checkLevelUp('magic', skillXP.magic);
    updateUI();

    displayText('Quest completed! You gained:');
    displayText('- 875 Magic XP');
    displayText('- Amulet of Accuracy');
    displayText('- You helped Mizgog win his imp\'s heart!');
    displayText('');

    addOption('Back to Quest Journal', showQuests);
}

// Complete White Knight Quest
function completeWhiteKnightQuest() {
    clearOutput();
    clearOptions();

    if (quests.whiteKnightQuest === 2) {
        displayText('You have already completed the White Knight Quest.');
        addOption('Back to Quest Journal', showQuests);
        return;
    }
    if (quests.whiteKnightQuest !== 1) {
        displayText('You have not started this quest yet. Speak to Sir Tiffy first.');
        addOption('Back to Quest Journal', showQuests);
        return;
    }

    const hasArmor = hasItem('White Knight Armor');
    if (!hasArmor) {
        displayText('You still need to recover the White Knight Armor from the Black Knights.');
        addOption('Back to Quest Journal', showQuests);
        return;
    }

    quests.whiteKnightQuest = 2;
    removeItemFromInventory('White Knight Armor');

    // Give rewards
    skillXP.attack += 1000;
    skillXP.defence += 1000;
    player.experience += 2000;
    addItemToInventory('White Knight Membership');

    checkLevelUp('attack', skillXP.attack);
    checkLevelUp('defence', skillXP.defence);
    updateUI();

    displayText('Quest completed! You gained:');
    displayText('- 1,000 Attack XP');
    displayText('- 1,000 Defence XP');
    displayText('- White Knight Membership');
    displayText('');

    addOption('Back to Quest Journal', showQuests);
}

function completeDeathPlateau() {
    clearOutput();
    clearOptions();
    
    if (quests.deathPlateau !== 1) {
        displayText('You have not started this quest yet.');
        addOption('Back to Quest Hub', showQuestHub);
        return;
    }
    
    quests.deathPlateau = 2;
    const xp = 300;
    player.coins += 150;
    skillXP.slayer += xp; // use slayer as a proxy reward
    player.experience += xp;
    checkLevelUp('slayer', skillXP.slayer);
    updateUI();
    
    displayText('You deliver the intel to the Commander.');
    displayText('"Excellent work! With this, we can avoid the troll boulders."');
    displayText('Death Plateau is now safe to traverse.');
    displayText(`Rewards: 150 coins, ${xp} Slayer XP (routing experience).`);
    displayText('You can now explore Death Plateau from Burthorpe.');
    
    addOption('Back to Quest Hub', showQuestHub);
}

// Complete Prince Ali Rescue quest
function completePrinceAliRescue() {
    clearOutput();
    clearOptions();

    if (quests.princeAliRescue === 2) {
        displayText('You have already completed Prince Ali Rescue.');
        addOption('Back to Quest Journal', showQuests);
        return;
    }
    if (quests.princeAliRescue !== 1) {
        displayText('You have not started this quest yet. Speak to Osman first.');
        addOption('Back to Quest Journal', showQuests);
        return;
    }

    const hasPrince = hasItem('Prince Ali');
    if (!hasPrince) {
        displayText('You still need to find and rescue Prince Ali.');
        addOption('Back to Quest Journal', showQuests);
        return;
    }

    quests.princeAliRescue = 2;
    removeItemFromInventory('Prince Ali');

    // Give rewards
    skillXP.crafting += 700;
    player.experience += 700;
    player.coins += 2000;

    checkLevelUp('crafting', skillXP.crafting);
    updateUI();

    displayText('Quest completed! You gained:');
    displayText('- 700 Crafting XP');
    displayText('- 2,000 coins');
    displayText('- You helped Prince Ali return to his duties!');
    displayText('');

    addOption('Back to Quest Journal', showQuests);
}

// Complete Pirate's Treasure quest
function completePiratesTreasure() {
    clearOutput();
    clearOptions();

    if (quests.piratesTreasure === 2) {
        displayText('You have already completed Pirate\'s Treasure.');
        addOption('Back to Quest Journal', showQuests);
        return;
    }
    if (quests.piratesTreasure !== 1) {
        displayText('You have not started this quest yet. Speak to Redbeard Frank first.');
        addOption('Back to Quest Journal', showQuests);
        return;
    }

    const hasTreasure = hasItem('Pirate Treasure');
    if (!hasTreasure) {
        displayText('You still need to find the pirate treasure.');
        addOption('Back to Quest Journal', showQuests);
        return;
    }

    quests.piratesTreasure = 2;
    removeItemFromInventory('Pirate Treasure');

    // Give rewards
    skillXP.thieving += 1000;
    player.experience += 1000;
    player.coins += 5000; // Split treasure

    checkLevelUp('thieving', skillXP.thieving);
    updateUI();

    displayText('Quest completed! You gained:');
    displayText('- 1,000 Thieving XP');
    displayText('- 5,000 coins (your share of the treasure)');
    displayText('- You helped Redbeard Frank find his own treasure!');
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
    displayText('Are you sure you want to proceed? Y/N');
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
        displayText('Are you sure you want to proceed? Y/N');
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
        // Check if traveling between Varrock and Lumbridge (dangerous road)
        const isVarrockLumbridgeRoute = (currentLocation === 'VARROCK' && location === 'LUMBRIDGE') || 
                                       (currentLocation === 'LUMBRIDGE' && location === 'VARROCK');
        
        if (isVarrockLumbridgeRoute) {
            // Travel with potential random encounters
            travelWithEncounters(location);
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
}

// Travel with random encounters (Varrock-Lumbridge road)
function travelWithEncounters(destination) {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         TRAVELING ON THE ROAD');
    displayText('========================================');
    displayText('');
    displayText(`You begin your journey from ${locations[currentLocation]} to ${locations[destination]}...`);
    displayText('The road between these cities is known to be dangerous.');
    displayText('Bandits and barbarians often lurk in the shadows...');
    displayText('');
    
    // 60% chance of encountering something
    const encounterChance = Math.random();
    
    if (encounterChance < 0.6) {
        // Random encounter occurs
        const encounterType = Math.floor(Math.random() * 8); // Increased to 8 for more variety
        
        switch(encounterType) {
            case 0:
                // Bandit encounter
                displayText('⚠️  A bandit steps out from behind a tree! ⚠️');
                displayText('The road bandit looks dangerous and well-armed.');
                displayText('');
                addOption('Fight the Bandit', () => startRoadCombat('Road Bandit', 3, 25, 3, 2, 'Iron Scimitar', destination));
                addOption('Try to Run Away', () => attemptToRun('bandit', destination));
                break;
                
            case 1:
                // Barbarian encounter
                displayText('⚠️  A fierce barbarian blocks your path! ⚠️');
                displayText('The barbarian warrior looks ready for battle.');
                displayText('');
                addOption('Fight the Barbarian', () => startRoadCombat('Barbarian Warrior', 4, 30, 4, 3, 'Steel Battleaxe', destination));
                addOption('Try to Run Away', () => attemptToRun('barbarian', destination));
                break;
                
            case 2:
                // Highwayman encounter
                displayText('⚠️  A highwayman demands your money! ⚠️');
                displayText('The highwayman threatens you with a crossbow.');
                displayText('');
                addOption('Fight the Highwayman', () => startRoadCombat('Highwayman', 2, 20, 2, 1, 'Crossbow', destination));
                addOption('Pay the Toll (10 coins)', () => payToll(destination));
                addOption('Try to Run Away', () => attemptToRun('highwayman', destination));
                break;
                
            case 3:
                // Thief encounter
                displayText('⚠️  A thief attempts to steal from you! ⚠️');
                displayText('The thief is trying to pickpocket your belongings.');
                displayText('');
                addOption('Fight the Thief', () => startRoadCombat('Road Thief', 2, 18, 2, 1, 'Dagger', destination));
                addOption('Try to Run Away', () => attemptToRun('thief', destination));
                break;
                
            case 4:
                // Mercenary encounter
                displayText('⚠️  A mercenary challenges you to combat! ⚠️');
                displayText('The mercenary seeks to test your fighting skills.');
                displayText('');
                addOption('Accept the Challenge', () => startRoadCombat('Mercenary Fighter', 5, 35, 5, 4, 'Steel Longsword', destination));
                addOption('Decline and Run', () => attemptToRun('mercenary', destination));
                break;
                
            case 5:
                // Ambush encounter
                displayText('⚠️  You\'ve been ambushed by multiple enemies! ⚠️');
                displayText('Two bandits and a barbarian surround you!');
                displayText('');
                addOption('Fight the Ambush', () => startRoadCombat('Ambush Group', 6, 45, 6, 5, 'Mixed Weapons', destination));
                addOption('Try to Escape', () => attemptToRun('ambush', destination));
                break;
                
            case 6:
                // Traveling merchant encounter
                displayText('🎒  You encounter a traveling merchant! 🎒');
                displayText('The merchant offers to sell you some supplies for the road.');
                displayText('');
                addOption('Buy Health Potion (15 coins)', () => buyFromMerchant('Health Potion', 15, destination));
                addOption('Buy Bread (8 coins)', () => buyFromMerchant('Bread', 8, destination));
                addOption('Buy Iron Ore (25 coins)', () => buyFromMerchant('Iron Ore', 25, destination));
                addOption('Pass by the merchant', () => completeTravel(destination));
                break;
                
            case 7:
                // Good Samaritan encounter
                displayText('👨‍🌾  A friendly farmer offers you help! 👨‍🌾');
                displayText('The farmer gives you some supplies for your journey.');
                displayText('');
                addOption('Accept the help', () => acceptFarmerHelp(destination));
                addOption('Thank but decline', () => completeTravel(destination));
                break;
        }
    } else {
        // Safe travel
        displayText('The journey is uneventful. You travel safely along the road.');
        displayText('You arrive at your destination without incident.');
        displayText('');
        
        // Complete the travel
        completeTravel(destination);
    }
}

// Start combat on the road
function startRoadCombat(enemyName, level, maxHP, attack, defence, weapon, destination) {
    displayText(`You engage in combat with the ${enemyName}!`);
    displayText('');
    
    // Store destination for after combat
    window.roadTravelDestination = destination;
    
    // Scale enemy stats based on player level for more challenge
    const playerLevel = Math.max(player.attack, player.strength, player.defence);
    const levelScaling = Math.max(1, Math.floor(playerLevel / 10)); // Scale every 10 levels
    
    const scaledLevel = level + levelScaling;
    const scaledMaxHP = maxHP + (levelScaling * 5);
    const scaledAttack = attack + levelScaling;
    const scaledDefence = defence + levelScaling;
    
    // Start combat with scaled enemy stats
    startCombat(enemyName, scaledLevel, scaledMaxHP, scaledAttack, scaledDefence, weapon);
}

// Attempt to run from road encounter
function attemptToRun(encounterType, destination) {
    const runChance = Math.random();
    let successChance = 0.7; // 70% base chance
    
    // Adjust based on encounter type
    switch(encounterType) {
        case 'bandit': successChance = 0.65; break;
        case 'barbarian': successChance = 0.6; break;
        case 'highwayman': successChance = 0.75; break;
        case 'thief': successChance = 0.8; break;
        case 'mercenary': successChance = 0.55; break;
        case 'ambush': successChance = 0.4; break;
    }
    
    if (runChance < successChance) {
        displayText('You successfully escape from the encounter!');
        displayText('You run as fast as you can down the road...');
        displayText('');
        completeTravel(destination);
    } else {
        displayText('You failed to escape! The enemy catches up to you.');
        displayText('You must fight!');
        displayText('');
        
        // Force combat based on encounter type
        switch(encounterType) {
            case 'bandit': startRoadCombat('Road Bandit', 3, 25, 3, 2, 'Iron Scimitar', destination); break;
            case 'barbarian': startRoadCombat('Barbarian Warrior', 4, 30, 4, 3, 'Steel Battleaxe', destination); break;
            case 'highwayman': startRoadCombat('Highwayman', 2, 20, 2, 1, 'Crossbow', destination); break;
            case 'thief': startRoadCombat('Road Thief', 2, 18, 2, 1, 'Dagger', destination); break;
            case 'mercenary': startRoadCombat('Mercenary Fighter', 5, 35, 5, 4, 'Steel Longsword', destination); break;
            case 'ambush': startRoadCombat('Ambush Group', 6, 45, 6, 5, 'Mixed Weapons', destination); break;
        }
    }
}

// Pay toll to highwayman
function payToll(destination) {
    if (player.coins >= 10) {
        player.coins -= 10;
        displayText('You pay the highwayman 10 coins.');
        displayText('He lets you pass safely.');
        displayText('');
        updateUI();
        completeTravel(destination);
    } else {
        displayText('You don\'t have enough coins to pay the toll!');
        displayText('The highwayman becomes angry and attacks!');
        displayText('');
        startRoadCombat('Highwayman', 2, 20, 2, 1, 'Crossbow', destination);
    }
}

// Buy from traveling merchant
function buyFromMerchant(itemName, cost, destination) {
    if (player.coins >= cost) {
        player.coins -= cost;
        addItemToInventory(itemName);
        displayText(`You bought ${itemName} from the merchant for ${cost} coins.`);
        displayText('The merchant wishes you safe travels.');
        displayText('');
        updateUI();
        completeTravel(destination);
    } else {
        displayText('You don\'t have enough coins for that item.');
        displayText('The merchant looks disappointed.');
        displayText('');
        completeTravel(destination);
    }
}

// Accept help from friendly farmer
function acceptFarmerHelp(destination) {
    const helpItems = ['Bread', 'Bread', 'Health Potion', 'Iron Ore', 'Leather'];
    const randomItem = helpItems[Math.floor(Math.random() * helpItems.length)];
    
    addItemToInventory(randomItem);
    displayText(`The farmer gives you ${randomItem}!`);
    displayText('You thank the farmer for their kindness.');
    displayText('');
    updateUI();
    completeTravel(destination);
}

// Complete travel after encounter
function completeTravel(destination) {
    currentLocation = destination;
    inWilderness = false;
    pvpEnabled = false;
    wildernessSkull = false;
    
    displayText(`You arrive in ${locations[destination]}!`);
    displayText('The journey has made you more experienced.');
    displayText('');
    
    // Give some travel experience
    const travelXP = Math.floor(Math.random() * 20) + 10; // 10-30 XP
    skillXP.defence += travelXP;
    player.experience += travelXP;
    displayText(`You gained ${travelXP} Defence experience from the journey!`);
    
    updateUI();
    playLocationMusic();
    
    setTimeout(() => showMainMenu(), 3000);
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
            // Initialize GE structures if missing
            if (!player.geOrders) {
                player.geOrders = { buy: [], sell: [] };
            } else {
                if (!Array.isArray(player.geOrders.buy)) player.geOrders.buy = [];
                if (!Array.isArray(player.geOrders.sell)) player.geOrders.sell = [];
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
            // Initialize GE structures if missing
            if (!player.geOrders) {
                player.geOrders = { buy: [], sell: [] };
            } else {
                if (!Array.isArray(player.geOrders.buy)) player.geOrders.buy = [];
                if (!Array.isArray(player.geOrders.sell)) player.geOrders.sell = [];
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
    
    // Add magic combat option if player has magic equipment
    if (hasMagicEquipment()) {
        addOption('Cast Magic Spell', () => combatAction('magic'), 'combat');
    }
    
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
                    
                    // Check if this is a road encounter for bonus experience
                    const isRoadEncounter = window.roadTravelDestination && 
                        (enemy.name.includes('Road') || enemy.name.includes('Bandit') || 
                         enemy.name.includes('Barbarian') || enemy.name.includes('Highwayman') ||
                         enemy.name.includes('Thief') || enemy.name.includes('Mercenary') ||
                         enemy.name.includes('Ambush'));
                    
                    if (isRoadEncounter) {
                        displayText('You gained 75 combat experience! (Bonus for road encounter)');
                        
                        // Award bonus experience for road encounters
                        skillXP.attack += 30;
                        skillXP.strength += 25;
                        skillXP.defence += 15;
                        skillXP.hitpoints += 5;
                        player.experience += 75;
                    } else if (enemy.name.includes('Count Draynor') || enemy.name.includes('Vampire')) {
                        displayText('You gained 150 combat experience! (Bonus for defeating vampire boss!)');
                        
                        // Award massive bonus experience for vampire boss
                        skillXP.attack += 60;
                        skillXP.strength += 50;
                        skillXP.defence += 30;
                        skillXP.hitpoints += 10;
                        player.experience += 150;
                    } else if (enemy.name.includes('Cave Troll') || enemy.name.includes('Troll')) {
                        displayText('You gained 100 combat experience! (Bonus for defeating cave troll!)');
                        
                        // Award bonus experience for cave troll
                        skillXP.attack += 40;
                        skillXP.strength += 35;
                        skillXP.defence += 20;
                        skillXP.hitpoints += 5;
                        player.experience += 100;
                    } else if (enemy.name.includes('Wolf') || enemy.name.includes('Pack')) {
                        displayText('You gained 80 combat experience! (Bonus for defeating wolf!)');
                        
                        // Award bonus experience for wolves
                        skillXP.attack += 35;
                        skillXP.strength += 30;
                        skillXP.defence += 15;
                        skillXP.hitpoints += 5;
                        player.experience += 80;
                    } else {
                        displayText('You gained 50 combat experience!');
                        
                        // Award normal experience
                        skillXP.attack += 20;
                        skillXP.strength += 15;
                        skillXP.defence += 10;
                        skillXP.hitpoints += 5;
                        player.experience += 50;
                    }
                    
                    checkLevelUp('attack', skillXP.attack);
                    checkLevelUp('strength', skillXP.strength);
                    checkLevelUp('defence', skillXP.defence);
                    checkLevelUp('hitpoints', skillXP.hitpoints);
                    
                    // Random loot - use specific loot for different enemies
                    let loot = null;
                    if (enemy.name === 'Chicken') {
                        loot = getChickenLoot();
                    } else if (enemy.name.includes('Cow') || enemy.name.includes('Bull')) {
                        loot = getCowLoot();
                    } else if (enemy.name.includes('Road') || enemy.name.includes('Bandit') || 
                               enemy.name.includes('Barbarian') || enemy.name.includes('Highwayman') ||
                               enemy.name.includes('Thief') || enemy.name.includes('Mercenary') ||
                               enemy.name.includes('Ambush')) {
                        loot = getRoadLoot();
                    } else if (enemy.name.includes('Count Draynor') || enemy.name.includes('Vampire')) {
                        loot = getVampireLoot();
                    } else if (enemy.name.includes('Cave Troll') || enemy.name.includes('Troll')) {
                        loot = getCaveTrollLoot();
                    } else if (enemy.name.includes('Wolf') || enemy.name.includes('Pack')) {
                        loot = getWolfLoot();
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
                    
                    // Stop any special combat audio
                    if (specialCombatAudio) {
                        specialCombatAudio.pause();
                        specialCombatAudio = null;
                    }
                    
                    // Check if this was a road encounter
                    if (window.roadTravelDestination) {
                        displayText('You continue your journey after the encounter...');
                        displayText('');
                        
                        // Complete the travel after a short delay
                        setTimeout(() => {
                            completeTravel(window.roadTravelDestination);
                            window.roadTravelDestination = null;
                        }, 2000);
                    } else {
                        // Return to location music
                        playLocationMusic();
                        
                        clearOptions();
                        addOption('Continue', showMainMenu);
                    }
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
                
                // Stop any special combat audio
                if (specialCombatAudio) {
                    specialCombatAudio.pause();
                    specialCombatAudio = null;
                }
                
                // Check if this was a road encounter
                if (window.roadTravelDestination) {
                    displayText('You continue your journey after escaping...');
                    displayText('');
                    
                    // Complete the travel after a short delay
                    setTimeout(() => {
                        completeTravel(window.roadTravelDestination);
                        window.roadTravelDestination = null;
                    }, 2000);
                } else {
                    // Return to location music
                    playLocationMusic();
                    
                    showMainMenu();
                }
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
            
        case 'magic':
            showCombatMagicMenu();
            break;
        case 'deathPlateau':
            displayText('You find a Burthorpe Commander near the barracks.');
            displayText('"We\'re trying to secure the Death Plateau pass."');
            displayText('"Trouble is, the local trolls keep throwing rocks at our scouts."');
            displayText('"We could use someone resourceful to help us map a safer route."');
            displayText('');
            if (quests.deathPlateau === 0) {
                addOption('Accept Quest', () => startQuest('deathPlateau'));
            } else if (quests.deathPlateau === 1) {
                displayText('Quest in progress: Find intel and return to the Commander.');
                addOption('Complete Quest', completeDeathPlateau);
            } else {
                displayText('You have already completed this quest.');
            }
            addOption('Back to Quest Hub', showQuestHub);
            break;
        case 'deathPlateau':
            quests.deathPlateau = 1;
            displayText('Quest started: Death Plateau');
            displayText('Objective: Gather intel by exploring Burthorpe and return to the Commander.');
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
    
    // Check if this was a road encounter
    if (window.roadTravelDestination) {
        displayText('You were defeated on the road and wake up in Lumbridge.');
        displayText('Your journey was interrupted by the encounter.');
        displayText('');
        
        // Clear road travel destination since journey was interrupted
        window.roadTravelDestination = null;
    }
    
    currentLocation = 'LUMBRIDGE';
    inWilderness = false;
    pvpEnabled = false;
    wildernessSkull = false;
    inCombat = false;
    
    // Stop any special combat audio
    if (specialCombatAudio) {
        specialCombatAudio.pause();
        specialCombatAudio = null;
    }
    
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

// Get cow-specific loot (leather, beef)
function getCowLoot() {
    const cowLootTable = [
        'Leather', 'Leather', 'Leather', // 3x chance for leather
        'Raw Beef', 'Raw Beef', // 2x chance for beef
        'Copper Ore', 'Tin Ore', 'Bread'
    ];
    
    const chance = Math.random();
    if (chance < 0.5) { // 50% chance for cow loot
        return cowLootTable[Math.floor(Math.random() * cowLootTable.length)];
    }
    return null;
}

// Get road encounter loot (bandits, barbarians, etc.)
function getRoadLoot() {
    const roadLootTable = [
        'Iron Ore', 'Iron Ore', // 2x chance for iron
        'Steel Bar', 'Steel Bar', // 2x chance for steel
        'Coins', 'Coins', 'Coins', // 3x chance for coins
        'Health Potion', 'Health Potion', // 2x chance for potions
        'Bronze Arrow', 'Iron Arrow', // Arrows
        'Leather', 'Leather', // Leather from bandit gear
        'Rune Essence', // Magic items
        'Bread', 'Bread' // Food
    ];
    
    const chance = Math.random();
    if (chance < 0.6) { // 60% chance for road loot (higher than normal)
        const loot = roadLootTable[Math.floor(Math.random() * roadLootTable.length)];
        
        // Special handling for coins
        if (loot === 'Coins') {
            const coinAmount = Math.floor(Math.random() * 20) + 5; // 5-25 coins
            player.coins += coinAmount;
            return `${coinAmount} Coins`;
        }
        
        return loot;
    }
    return null;
}

// Get vampire boss loot (Count Draynor)
function getVampireLoot() {
    const vampireLootTable = [
        'Vampire Dust', 'Vampire Dust', // 2x chance for vampire dust
        'Rune Essence', 'Rune Essence', // 2x chance for rune essence
        'Chaos Rune', 'Chaos Rune', // 2x chance for chaos runes
        'Death Rune', 'Death Rune', // 2x chance for death runes
        'Coins', 'Coins', 'Coins', 'Coins', // 4x chance for coins
        'Health Potion', 'Health Potion', 'Health Potion', // 3x chance for potions
        'Steel Bar', 'Steel Bar', // Steel bars
        'Iron Ore', 'Iron Ore', // Iron ore
        'Ancient Scroll', // Rare ancient scroll
        'Vampire Fang', // Rare vampire fang
        'Dark Crystal' // Very rare dark crystal
    ];
    
    const chance = Math.random();
    if (chance < 0.8) { // 80% chance for vampire loot (very high)
        const loot = vampireLootTable[Math.floor(Math.random() * vampireLootTable.length)];
        
        // Special handling for coins
        if (loot === 'Coins') {
            const coinAmount = Math.floor(Math.random() * 50) + 25; // 25-75 coins
            player.coins += coinAmount;
            return `${coinAmount} Coins`;
        }
        
        return loot;
    }
    return null;
}

// Get cave troll loot
function getCaveTrollLoot() {
    const trollLootTable = [
        'Iron Ore', 'Iron Ore', 'Iron Ore', // 3x chance for iron ore
        'Coal', 'Coal', 'Coal', // 3x chance for coal
        'Mithril Ore', 'Mithril Ore', // 2x chance for mithril
        'Adamantite Ore', // 1x chance for adamantite
        'Coins', 'Coins', 'Coins', // 3x chance for coins
        'Health Potion', 'Health Potion', // 2x chance for potions
        'Stone Club', // Troll's weapon
        'Troll Hide', // Troll hide for crafting
        'Cave Crystal', // Rare cave crystal
        'Ancient Pickaxe' // Very rare ancient pickaxe
    ];
    
    const chance = Math.random();
    if (chance < 0.7) { // 70% chance for troll loot
        const loot = trollLootTable[Math.floor(Math.random() * trollLootTable.length)];
        
        // Special handling for coins
        if (loot === 'Coins') {
            const coinAmount = Math.floor(Math.random() * 30) + 15; // 15-45 coins
            player.coins += coinAmount;
            return `${coinAmount} Coins`;
        }
        
        return loot;
    }
    return null;
}

// Get wolf loot
function getWolfLoot() {
    const wolfLootTable = [
        'Wolf Pelt', 'Wolf Pelt', 'Wolf Pelt', // 3x chance for wolf pelt (quest item)
        'Wolf Fang', 'Wolf Fang', // 2x chance for wolf fang
        'Coins', 'Coins', 'Coins', // 3x chance for coins
        'Health Potion', 'Health Potion', // 2x chance for potions
        'Leather', 'Leather', // Leather from wolf hide
        'Iron Ore', // Iron ore
        'Mountain Herb', // Mountain herb
        'Wolf Claw', // Wolf claw
        'Alpha Wolf Trophy' // Rare alpha wolf trophy
    ];
    
    const chance = Math.random();
    if (chance < 0.8) { // 80% chance for wolf loot (high for quest items)
        const loot = wolfLootTable[Math.floor(Math.random() * wolfLootTable.length)];
        
        // Special handling for coins
        if (loot === 'Coins') {
            const coinAmount = Math.floor(Math.random() * 25) + 10; // 10-35 coins
            player.coins += coinAmount;
            return `${coinAmount} Coins`;
        }
        
        return loot;
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
    if (specialCombatAudio) {
        specialCombatAudio.pause();
        specialCombatAudio = null;
    }
    specialCombatAudio = new Audio(soundEffects.combat_pk);
    specialCombatAudio.volume = musicVolume * 0.7;
    specialCombatAudio.play().catch(error => {
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

// Varrock Castle functions
function visitThroneRoom() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         VARROCK THRONE ROOM');
    displayText('========================================');
    displayText('');
    displayText('You enter the magnificent throne room...');
    displayText('The King of Misthalin sits upon his grand throne.');
    displayText('Royal guards stand at attention around the room.');
    displayText('');
    displayText('You gain 50 Defence experience from observing royal protocol!');
    
    skillXP.defence += 50;
    player.experience += 50;
    checkLevelUp('defence', skillXP.defence);
    updateUI();
    
    addOption('Return to Castle Interior', () => {
        displayText('You return to the castle interior.');
        setTimeout(() => {
            displayText('========================================');
            displayText('         VARROCK CASTLE INTERIOR');
            displayText('========================================');
            displayText('');
            displayText('You are back in the castle interior.');
            displayText('');
            addOption('Visit the Throne Room', visitThroneRoom);
            addOption('Explore Royal Chambers', exploreRoyalChambers);
            addOption('Visit the Treasury', visitTreasury);
            addOption('Walk in Royal Gardens', walkRoyalGardens);
            addOption('Browse Castle Library', browseCastleLibrary);
            addOption('Back to Castle Entrance', exploreVarrockCastle);
        }, 1000);
    });
}

function exploreRoyalChambers() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         ROYAL CHAMBERS');
    displayText('========================================');
    displayText('');
    displayText('You explore the royal chambers...');
    displayText('The rooms are opulently decorated with fine furnishings.');
    displayText('You learn about royal customs and traditions.');
    displayText('');
    displayText('You gain 40 Crafting experience from studying the fine craftsmanship!');
    
    skillXP.crafting += 40;
    player.experience += 40;
    checkLevelUp('crafting', skillXP.crafting);
    updateUI();
    
    addOption('Return to Castle Interior', () => {
        displayText('You return to the castle interior.');
        setTimeout(() => {
            displayText('========================================');
            displayText('         VARROCK CASTLE INTERIOR');
            displayText('========================================');
            displayText('');
            displayText('You are back in the castle interior.');
            displayText('');
            addOption('Visit the Throne Room', visitThroneRoom);
            addOption('Explore Royal Chambers', exploreRoyalChambers);
            addOption('Visit the Treasury', visitTreasury);
            addOption('Walk in Royal Gardens', walkRoyalGardens);
            addOption('Browse Castle Library', browseCastleLibrary);
            addOption('Back to Castle Entrance', exploreVarrockCastle);
        }, 1000);
    });
}

function visitTreasury() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         VARROCK TREASURY');
    displayText('========================================');
    displayText('');
    displayText('You visit the royal treasury...');
    displayText('The vault is heavily guarded and contains vast wealth.');
    displayText('You learn about economics and financial management.');
    displayText('');
    displayText('You gain 35 Crafting experience from studying the precious metals!');
    
    skillXP.crafting += 35;
    player.experience += 35;
    checkLevelUp('crafting', skillXP.crafting);
    updateUI();
    
    addOption('Return to Castle Interior', () => {
        displayText('You return to the castle interior.');
        setTimeout(() => {
            displayText('========================================');
            displayText('         VARROCK CASTLE INTERIOR');
            displayText('========================================');
            displayText('');
            displayText('You are back in the castle interior.');
            displayText('');
            addOption('Visit the Throne Room', visitThroneRoom);
            addOption('Explore Royal Chambers', exploreRoyalChambers);
            addOption('Visit the Treasury', visitTreasury);
            addOption('Walk in Royal Gardens', walkRoyalGardens);
            addOption('Browse Castle Library', browseCastleLibrary);
            addOption('Back to Castle Entrance', exploreVarrockCastle);
        }, 1000);
    });
}

function walkRoyalGardens() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         ROYAL GARDENS');
    displayText('========================================');
    displayText('');
    displayText('You walk through the beautiful royal gardens...');
    displayText('Exotic plants and flowers from across Gielinor grow here.');
    displayText('The gardens are a peaceful retreat from the busy castle.');
    displayText('');
    displayText('You gain 30 Farming experience from studying the rare plants!');
    
    skillXP.farming += 30;
    player.experience += 30;
    checkLevelUp('farming', skillXP.farming);
    updateUI();
    
    addOption('Return to Castle Interior', () => {
        displayText('You return to the castle interior.');
        setTimeout(() => {
            displayText('========================================');
            displayText('         VARROCK CASTLE INTERIOR');
            displayText('========================================');
            displayText('');
            displayText('You are back in the castle interior.');
            displayText('');
            addOption('Visit the Throne Room', visitThroneRoom);
            addOption('Explore Royal Chambers', exploreRoyalChambers);
            addOption('Visit the Treasury', visitTreasury);
            addOption('Walk in Royal Gardens', walkRoyalGardens);
            addOption('Browse Castle Library', browseCastleLibrary);
            addOption('Back to Castle Entrance', exploreVarrockCastle);
        }, 1000);
    });
}

function browseCastleLibrary() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         CASTLE LIBRARY');
    displayText('========================================');
    displayText('');
    displayText('You browse the extensive castle library...');
    displayText('Ancient tomes and royal records fill the shelves.');
    displayText('You learn about the history of Misthalin and its rulers.');
    displayText('');
    displayText('You gain 45 Magic experience from studying ancient texts!');
    
    skillXP.magic += 45;
    player.experience += 45;
    checkLevelUp('magic', skillXP.magic);
    updateUI();
    
    addOption('Return to Castle Interior', () => {
        displayText('You return to the castle interior.');
        setTimeout(() => {
            displayText('========================================');
            displayText('         VARROCK CASTLE INTERIOR');
            displayText('========================================');
            displayText('');
            displayText('You are back in the castle interior.');
            displayText('');
            addOption('Visit the Throne Room', visitThroneRoom);
            addOption('Explore Royal Chambers', exploreRoyalChambers);
            addOption('Visit the Treasury', visitTreasury);
            addOption('Walk in Royal Gardens', walkRoyalGardens);
            addOption('Browse Castle Library', browseCastleLibrary);
            addOption('Back to Castle Entrance', exploreVarrockCastle);
        }, 1000);
    });
}

// Varrock Palace functions
function attendCouncilMeeting() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         COUNCIL MEETING');
    displayText('========================================');
    displayText('');
    displayText('You attend a council meeting...');
    displayText('Government officials discuss important matters of state.');
    displayText('You learn about politics and governance.');
    displayText('');
    displayText('You gain 40 Crafting experience from understanding policy!');
    
    skillXP.crafting += 40;
    player.experience += 40;
    checkLevelUp('crafting', skillXP.crafting);
    updateUI();
    
    addOption('Return to Palace Interior', () => {
        displayText('You return to the palace interior.');
        setTimeout(() => {
            displayText('========================================');
            displayText('         VARROCK PALACE INTERIOR');
            displayText('========================================');
            displayText('');
            displayText('You are back in the palace interior.');
            displayText('');
            addOption('Attend Council Meeting', attendCouncilMeeting);
            addOption('Visit Administrative Offices', visitAdminOffices);
            addOption('Browse Government Records', browseGovernmentRecords);
            addOption('Meet with Officials', meetWithOfficials);
            addOption('Back to Palace Entrance', exploreVarrockPalace);
        }, 1000);
    });
}

function visitAdminOffices() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         ADMINISTRATIVE OFFICES');
    displayText('========================================');
    displayText('');
    displayText('You visit the administrative offices...');
    displayText('Bureaucrats work diligently on government paperwork.');
    displayText('You learn about administration and record-keeping.');
    displayText('');
    displayText('You gain 30 Crafting experience from understanding bureaucracy!');
    
    skillXP.crafting += 30;
    player.experience += 30;
    checkLevelUp('crafting', skillXP.crafting);
    updateUI();
    
    addOption('Return to Palace Interior', () => {
        displayText('You return to the palace interior.');
        setTimeout(() => {
            displayText('========================================');
            displayText('         VARROCK PALACE INTERIOR');
            displayText('========================================');
            displayText('');
            displayText('You are back in the palace interior.');
            displayText('');
            addOption('Attend Council Meeting', attendCouncilMeeting);
            addOption('Visit Administrative Offices', visitAdminOffices);
            addOption('Browse Government Records', browseGovernmentRecords);
            addOption('Meet with Officials', meetWithOfficials);
            addOption('Back to Palace Entrance', exploreVarrockPalace);
        }, 1000);
    });
}

function browseGovernmentRecords() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         GOVERNMENT RECORDS');
    displayText('========================================');
    displayText('');
    displayText('You browse the government records...');
    displayText('Ancient documents and official records fill the archives.');
    displayText('You learn about the history of Varrock\'s government.');
    displayText('');
    displayText('You gain 35 Crafting experience from studying records!');
    
    skillXP.crafting += 35;
    player.experience += 35;
    checkLevelUp('crafting', skillXP.crafting);
    updateUI();
    
    addOption('Return to Palace Interior', () => {
        displayText('You return to the palace interior.');
        setTimeout(() => {
            displayText('========================================');
            displayText('         VARROCK PALACE INTERIOR');
            displayText('========================================');
            displayText('');
            displayText('You are back in the palace interior.');
            displayText('');
            addOption('Attend Council Meeting', attendCouncilMeeting);
            addOption('Visit Administrative Offices', visitAdminOffices);
            addOption('Browse Government Records', browseGovernmentRecords);
            addOption('Meet with Officials', meetWithOfficials);
            addOption('Back to Palace Entrance', exploreVarrockPalace);
        }, 1000);
    });
}

function meetWithOfficials() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         MEETING WITH OFFICIALS');
    displayText('========================================');
    displayText('');
    displayText('You meet with government officials...');
    displayText('They discuss current affairs and government policies.');
    displayText('You learn about diplomacy and public service.');
    displayText('');
    displayText('You gain 25 Crafting experience from diplomatic interaction!');
    
    skillXP.crafting += 25;
    player.experience += 25;
    checkLevelUp('crafting', skillXP.crafting);
    updateUI();
    
    addOption('Return to Palace Interior', () => {
        displayText('You return to the palace interior.');
        setTimeout(() => {
            displayText('========================================');
            displayText('         VARROCK PALACE INTERIOR');
            displayText('========================================');
            displayText('');
            displayText('You are back in the palace interior.');
            displayText('');
            addOption('Attend Council Meeting', attendCouncilMeeting);
            addOption('Visit Administrative Offices', visitAdminOffices);
            addOption('Browse Government Records', browseGovernmentRecords);
            addOption('Meet with Officials', meetWithOfficials);
            addOption('Back to Palace Entrance', exploreVarrockPalace);
        }, 1000);
    });
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
        displayText('========================================');
        displayText('         VARROCK CASTLE INTERIOR');
        displayText('========================================');
        displayText('');
        displayText('You enter the grand halls of Varrock Castle...');
        displayText('The interior is opulent and well-guarded.');
        displayText('Royal guards stand at attention throughout the halls.');
        displayText('');
        displayText('You can see:');
        displayText('• The grand throne room');
        displayText('• Royal chambers and private quarters');
        displayText('• The castle treasury');
        displayText('• Royal gardens');
        displayText('• Castle library');
        displayText('');
        displayText('This is the seat of power for the Kingdom of Misthalin.');
        displayText('');
        
        addOption('Visit the Throne Room', visitThroneRoom);
        addOption('Explore Royal Chambers', exploreRoyalChambers);
        addOption('Visit the Treasury', visitTreasury);
        addOption('Walk in Royal Gardens', walkRoyalGardens);
        addOption('Browse Castle Library', browseCastleLibrary);
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
        displayText('========================================');
        displayText('         VARROCK PALACE INTERIOR');
        displayText('========================================');
        displayText('');
        displayText('You enter the grand Varrock Palace...');
        displayText('The halls are filled with bureaucrats and government officials.');
        displayText('The air buzzes with political activity and administration.');
        displayText('');
        displayText('You can see:');
        displayText('• Government meeting chambers');
        displayText('• Administrative offices');
        displayText('• The council hall');
        displayText('• Records and archives');
        displayText('• Diplomatic reception areas');
        displayText('');
        displayText('This is where the laws of Varrock are made and enforced.');
        displayText('');
        
        addOption('Attend Council Meeting', attendCouncilMeeting);
        addOption('Visit Administrative Offices', visitAdminOffices);
        addOption('Browse Government Records', browseGovernmentRecords);
        addOption('Meet with Officials', meetWithOfficials);
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
    
    // Defensive checks for old save compatibility
    if (!player.geOrders) {
        player.geOrders = { buy: [], sell: [] };
    } else {
        if (!Array.isArray(player.geOrders.buy)) player.geOrders.buy = [];
        if (!Array.isArray(player.geOrders.sell)) player.geOrders.sell = [];
    }

    // Process any pending orders and update prices
    processGEOrders();
    updateMarketPrices();
    
    displayText('========================================');
    displayText('         GRAND EXCHANGE (GE)');
    displayText('========================================');
    displayText('');
    displayText('Welcome to the Grand Exchange!');
    displayText('The largest marketplace in all of Gielinor.');
    displayText('');
    displayText(`Your coins: ${player.coins}`);
    
    // Show notifications if any
    if (player.notifications.length > 0) {
        displayText('');
        displayText('📢 You have new notifications!');
    }
    
    displayText('');
    displayText('What would you like to do?');
    displayText('');
    
    addOption('Browse Items (Buy)', browseGEItems);
    addOption('Sell Your Items', sellGEItems);
    addOption('Post Buy Order', postBuyOrder);
    addOption('Post Sell Order', postSellOrder);
    addOption('View Market Prices', viewMarketPrices);
    addOption('Check Your Orders', checkGEOrders);
    addOption('View Notifications', viewNotifications);
    addOption('Visit Banker', visitGEBanker);
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
    
    // Ensure structures to avoid runtime errors
    if (!player.geOrders) player.geOrders = { buy: [], sell: [] };
    if (!Array.isArray(player.geOrders.buy)) player.geOrders.buy = [];
    if (!Array.isArray(player.geOrders.sell)) player.geOrders.sell = [];

    displayText('========================================');
    displayText('         YOUR ORDERS');
    displayText('========================================');
    displayText('');
    
    const totalOrders = player.geOrders.buy.length + player.geOrders.sell.length;
    
    if (totalOrders === 0) {
        displayText('You have no active orders at the moment.');
    } else {
        displayText(`You have ${totalOrders} active orders:`);
        displayText('');
        
        if (player.geOrders.buy.length > 0) {
            displayText('BUY ORDERS:');
            player.geOrders.buy.forEach((order, index) => {
                displayText(`${index + 1}. ${order.quantity}x ${order.itemName} (max ${order.maxPrice} coins each)`);
            });
            displayText('');
        }
        
        if (player.geOrders.sell.length > 0) {
            displayText('SELL ORDERS:');
            player.geOrders.sell.forEach((order, index) => {
                displayText(`${index + 1}. ${order.quantity}x ${order.itemName} (min ${order.minPrice} coins each)`);
            });
        }
    }
    
    addOption('Back to Grand Exchange', visitGrandExchange);
}

// Post buy order
function postBuyOrder() {
    clearOutput();
    clearOptions();
    
    if (!player.geOrders) player.geOrders = { buy: [], sell: [] };
    if (!Array.isArray(player.geOrders.buy)) player.geOrders.buy = [];
    if (!Array.isArray(player.geOrders.sell)) player.geOrders.sell = [];

    displayText('========================================');
    displayText('         POST BUY ORDER');
    displayText('========================================');
    displayText('');
    displayText('Select an item to place a buy order for:');
    displayText('');
    
    grandExchangeItems.forEach((item, index) => {
        displayText(`${index + 1}. ${item.name} - Current: ${item.buyPrice} coins`);
        addOption(`Buy Order: ${item.name}`, () => createBuyOrder(item));
    });
    
    addOption('Back to Grand Exchange', visitGrandExchange);
}

// Create buy order
function createBuyOrder(item) {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText(`    BUY ORDER: ${item.name.toUpperCase()}`);
    displayText('========================================');
    displayText('');
    displayText(`Current market price: ${item.buyPrice} coins`);
    displayText(`Your coins: ${player.coins}`);
    displayText('');
    displayText('Enter order details:');
    displayText('');
    
    // Simple order creation - in a real implementation, you'd have input fields
    const maxPrice = Math.min(item.buyPrice + 5, player.coins);
    const quantity = Math.min(10, Math.floor(player.coins / maxPrice));
    
    if (quantity > 0 && maxPrice > 0) {
        displayText(`Suggested order: ${quantity}x ${item.name} at ${maxPrice} coins each`);
        displayText(`Total cost: ${quantity * maxPrice} coins`);
        displayText('');
        
        addOption(`Place Order (${quantity}x at ${maxPrice} coins)`, () => {
            const order = {
                itemName: item.name,
                quantity: quantity,
                maxPrice: maxPrice,
                timestamp: Date.now()
            };
            player.geOrders.buy.push(order);
            displayText(`Buy order placed for ${quantity}x ${item.name}!`);
            setTimeout(() => visitGrandExchange(), 2000);
        });
    } else {
        displayText('You cannot afford to place a buy order for this item.');
    }
    
    addOption('Back to Buy Orders', postBuyOrder);
}

// Post sell order
function postSellOrder() {
    clearOutput();
    clearOptions();
    
    if (!player.geOrders) player.geOrders = { buy: [], sell: [] };
    if (!Array.isArray(player.geOrders.buy)) player.geOrders.buy = [];
    if (!Array.isArray(player.geOrders.sell)) player.geOrders.sell = [];

    displayText('========================================');
    displayText('         POST SELL ORDER');
    displayText('========================================');
    displayText('');
    displayText('Select an item from your inventory to sell:');
    displayText('');
    
    if (player.inventory.length === 0) {
        displayText('Your inventory is empty!');
    } else {
        player.inventory.forEach((item, index) => {
            const geItem = grandExchangeItems.find(geItem => geItem.name === item.name);
            if (geItem) {
                displayText(`${index + 1}. ${item.name} (${item.quantity}) - Current: ${geItem.sellPrice} coins`);
                addOption(`Sell Order: ${item.name}`, () => createSellOrder(item, geItem));
            }
        });
    }
    
    addOption('Back to Grand Exchange', visitGrandExchange);
}

// Create sell order
function createSellOrder(item, geItem) {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText(`    SELL ORDER: ${item.name.toUpperCase()}`);
    displayText('========================================');
    displayText('');
    displayText(`Current market price: ${geItem.sellPrice} coins`);
    displayText(`You have: ${item.quantity}x ${item.name}`);
    displayText('');
    
    const minPrice = Math.max(1, geItem.sellPrice - 2);
    const quantity = Math.min(item.quantity, 10);
    
    displayText(`Suggested order: ${quantity}x ${item.name} at ${minPrice} coins each`);
    displayText(`Total earnings: ${quantity * minPrice} coins`);
    displayText('');
    
    addOption(`Place Order (${quantity}x at ${minPrice} coins)`, () => {
        const order = {
            itemName: item.name,
            quantity: quantity,
            minPrice: minPrice,
            timestamp: Date.now()
        };
        player.geOrders.sell.push(order);
        displayText(`Sell order placed for ${quantity}x ${item.name}!`);
        setTimeout(() => visitGrandExchange(), 2000);
    });
    
    addOption('Back to Sell Orders', postSellOrder);
}

// View notifications
function viewNotifications() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         NOTIFICATIONS');
    displayText('========================================');
    displayText('');
    
    if (player.notifications.length === 0) {
        displayText('You have no notifications.');
    } else {
        player.notifications.forEach((notification, index) => {
            displayText(`${index + 1}. ${notification.message}`);
        });
        displayText('');
        addOption('Clear All Notifications', () => {
            player.notifications = [];
            visitGrandExchange();
        });
    }
    
    addOption('Back to Grand Exchange', visitGrandExchange);
}

// Visit GE Banker
function visitGEBanker() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         GRAND EXCHANGE BANKER');
    displayText('========================================');
    displayText('');
    displayText('Banker: "Welcome to the Grand Exchange Bank!"');
    displayText('"I can help you store items and manage your wealth."');
    displayText('');
    displayText(`Your coins: ${player.coins}`);
    displayText(`Bank items: ${player.bank_items.length}`);
    displayText('');
    
    addOption('Deposit Items', () => {
        displayText('Banker: "What would you like to deposit?"');
        // This would open the bank deposit interface
        setTimeout(() => visitGEBanker(), 2000);
    });
    
    addOption('Withdraw Items', () => {
        displayText('Banker: "What would you like to withdraw?"');
        // This would open the bank withdrawal interface
        setTimeout(() => visitGEBanker(), 2000);
    });
    
    addOption('View Bank Contents', () => {
        displayText('Banker: "Here are your stored items:"');
        if (player.bank_items.length === 0) {
            displayText('Your bank is empty.');
        } else {
            player.bank_items.forEach((item, index) => {
                displayText(`${index + 1}. ${item.name} (${item.quantity})`);
            });
        }
        setTimeout(() => visitGEBanker(), 3000);
    });
    
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
    
    // Loading is now handled by the title screen interaction
});

// Magic Journal System
function showMagicJournal() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('           MAGIC JOURNAL');
    displayText('========================================');
    displayText('');
    displayText(`Magic Level: ${player.magic} (${player.magicXP} XP)`);
    displayText('');
    
    // Display runes inventory
    displayText('Runes Inventory:');
    displayText('');
    
    if (!player.runes) {
        player.runes = {};
    }
    
    const runeTypes = ['air', 'water', 'earth', 'fire', 'mind', 'body', 'chaos', 'death', 'blood', 'soul'];
    let hasRunes = false;
    
    runeTypes.forEach(rune => {
        const quantity = player.runes[rune] || 0;
        if (quantity > 0) {
            displayText(`${rune.charAt(0).toUpperCase() + rune.slice(1)} Runes: ${quantity}`);
            hasRunes = true;
        }
    });
    
    if (!hasRunes) {
        displayText('No runes in inventory');
    }
    
    displayText('');
    displayText('Available Spells:');
    displayText('');
    
    // Basic spells available at low levels
    if (player.magic >= 1) {
        displayText('Wind Strike (Level 1) - 1 Air, 1 Mind');
    }
    if (player.magic >= 3) {
        displayText('Water Strike (Level 3) - 1 Water, 1 Mind');
    }
    if (player.magic >= 5) {
        displayText('Earth Strike (Level 5) - 1 Earth, 1 Mind');
    }
    if (player.magic >= 7) {
        displayText('Fire Strike (Level 7) - 1 Fire, 1 Mind');
    }
    if (player.magic >= 9) {
        displayText('Wind Bolt (Level 9) - 2 Air, 1 Chaos');
    }
    if (player.magic >= 11) {
        displayText('Water Bolt (Level 11) - 2 Water, 1 Chaos');
    }
    if (player.magic >= 13) {
        displayText('Earth Bolt (Level 13) - 2 Earth, 1 Chaos');
    }
    if (player.magic >= 15) {
        displayText('Fire Bolt (Level 15) - 2 Fire, 1 Chaos');
    }
    
    displayText('');
    
    addOption('View Rune Crafting', showRuneCrafting);
    addOption('Back to Main Menu', showMainMenu, 'back');
}

// Spell Menu
function showSpellMenu() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('           CAST SPELL');
    displayText('========================================');
    displayText('');
    displayText('Select a spell to cast:');
    displayText('');
    
    if (player.magic >= 1 && hasRunes('air', 1) && hasRunes('mind', 1)) {
        addOption('Wind Strike (1 Air, 1 Mind)', () => castSpell('wind_strike'));
    }
    if (player.magic >= 3 && hasRunes('water', 1) && hasRunes('mind', 1)) {
        addOption('Water Strike (1 Water, 1 Mind)', () => castSpell('water_strike'));
    }
    if (player.magic >= 5 && hasRunes('earth', 1) && hasRunes('mind', 1)) {
        addOption('Earth Strike (1 Earth, 1 Mind)', () => castSpell('earth_strike'));
    }
    if (player.magic >= 7 && hasRunes('fire', 1) && hasRunes('mind', 1)) {
        addOption('Fire Strike (1 Fire, 1 Mind)', () => castSpell('fire_strike'));
    }
    if (player.magic >= 9 && hasRunes('air', 2) && hasRunes('chaos', 1)) {
        addOption('Wind Bolt (2 Air, 1 Chaos)', () => castSpell('wind_bolt'));
    }
    if (player.magic >= 11 && hasRunes('water', 2) && hasRunes('chaos', 1)) {
        addOption('Water Bolt (2 Water, 1 Chaos)', () => castSpell('water_bolt'));
    }
    if (player.magic >= 13 && hasRunes('earth', 2) && hasRunes('chaos', 1)) {
        addOption('Earth Bolt (2 Earth, 1 Chaos)', () => castSpell('earth_bolt'));
    }
    if (player.magic >= 15 && hasRunes('fire', 2) && hasRunes('chaos', 1)) {
        addOption('Fire Bolt (2 Fire, 1 Chaos)', () => castSpell('fire_bolt'));
    }
    
    addOption('Back to Magic Journal', showMagicJournal, 'back');
}

// Cast Spell Function
function castSpell(spellName) {
    const spells = {
        'wind_strike': { runes: { air: 1, mind: 1 }, xp: 5.5, damage: 2 },
        'water_strike': { runes: { water: 1, mind: 1 }, xp: 7.5, damage: 4 },
        'earth_strike': { runes: { earth: 1, mind: 1 }, xp: 9.5, damage: 6 },
        'fire_strike': { runes: { fire: 1, mind: 1 }, xp: 11.5, damage: 8 },
        'wind_bolt': { runes: { air: 2, chaos: 1 }, xp: 13.5, damage: 9 },
        'water_bolt': { runes: { water: 2, chaos: 1 }, xp: 16.5, damage: 10 },
        'earth_bolt': { runes: { earth: 2, chaos: 1 }, xp: 19.5, damage: 11 },
        'fire_bolt': { runes: { fire: 2, chaos: 1 }, xp: 22.5, damage: 12 }
    };
    
    const spell = spells[spellName];
    if (!spell) return;
    
    // Check if player has required runes
    for (const [rune, amount] of Object.entries(spell.runes)) {
        if (!hasRunes(rune, amount)) {
            displayText(`You don't have enough ${rune} runes!`);
            addOption('Back to Spell Menu', showSpellMenu, 'back');
            return;
        }
    }
    
    // Consume runes
    for (const [rune, amount] of Object.entries(spell.runes)) {
        player.runes[rune] -= amount;
    }
    
    // Gain XP and show result
    player.magicXP += spell.xp;
    checkLevelUp('magic', spell.xp);
    
    displayText(`You cast ${spellName.replace('_', ' ')}!`);
    displayText(`Magic XP gained: ${spell.xp}`);
    displayText(`Spell damage: ${spell.damage}`);
    
    addOption('Cast Another Spell', showSpellMenu);
    addOption('Back to Magic Journal', showMagicJournal, 'back');
}

// Helper function to check if player has enough runes
function hasRunes(runeType, amount) {
    if (!player.runes) player.runes = {};
    return (player.runes[runeType] || 0) >= amount;
}

// Add runes to inventory (separate from regular inventory)
function addRunes(runeType, amount) {
    if (!player.runes) player.runes = {};
    player.runes[runeType] = (player.runes[runeType] || 0) + amount;
}

// Check if player has magic equipment (staff or wizard robes)
function hasMagicEquipment() {
    const magicWeapons = ['staff', 'magic_staff', 'wizard_staff', 'mystic_staff'];
    const magicArmor = ['wizard_robes', 'mystic_robes', 'magic_robes', 'wizard hat'];
    
    // Check for magic weapon in inventory
    const hasMagicWeapon = player.inventory.some(item => 
        magicWeapons.some(weapon => item.name.toLowerCase().includes(weapon))
    );
    
    // Check for magic armor in inventory
    const hasMagicArmor = player.inventory.some(item => 
        magicArmor.some(armor => item.name.toLowerCase().includes(armor))
    );
    
    // Check for equipped magic armor
    const hasEquippedMagicArmor = player.equippedArmor && 
        magicArmor.some(armor => player.equippedArmor.toLowerCase().includes(armor));
    
    return hasMagicWeapon || hasMagicArmor || hasEquippedMagicArmor;
}

// Combat Magic Menu
function showCombatMagicMenu() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('           COMBAT MAGIC');
    displayText('========================================');
    displayText('');
    displayText(`Enemy: ${enemy.name} (${enemy.currentHP}/${enemy.maxHP} HP)`);
    displayText('');
    displayText('Select a spell to cast:');
    displayText('');
    
    if (player.magic >= 1 && hasRunes('air', 1) && hasRunes('mind', 1)) {
        addOption('Wind Strike (1 Air, 1 Mind)', () => castCombatSpell('wind_strike'));
    }
    if (player.magic >= 3 && hasRunes('water', 1) && hasRunes('mind', 1)) {
        addOption('Water Strike (1 Water, 1 Mind)', () => castCombatSpell('water_strike'));
    }
    if (player.magic >= 5 && hasRunes('earth', 1) && hasRunes('mind', 1)) {
        addOption('Earth Strike (1 Earth, 1 Mind)', () => castCombatSpell('earth_strike'));
    }
    if (player.magic >= 7 && hasRunes('fire', 1) && hasRunes('mind', 1)) {
        addOption('Fire Strike (1 Fire, 1 Mind)', () => castCombatSpell('fire_strike'));
    }
    if (player.magic >= 9 && hasRunes('air', 2) && hasRunes('chaos', 1)) {
        addOption('Wind Bolt (2 Air, 1 Chaos)', () => castCombatSpell('wind_bolt'));
    }
    if (player.magic >= 11 && hasRunes('water', 2) && hasRunes('chaos', 1)) {
        addOption('Water Bolt (2 Water, 1 Chaos)', () => castCombatSpell('water_bolt'));
    }
    if (player.magic >= 13 && hasRunes('earth', 2) && hasRunes('chaos', 1)) {
        addOption('Earth Bolt (2 Earth, 1 Chaos)', () => castCombatSpell('earth_bolt'));
    }
    if (player.magic >= 15 && hasRunes('fire', 2) && hasRunes('chaos', 1)) {
        addOption('Fire Bolt (2 Fire, 1 Chaos)', () => castCombatSpell('fire_bolt'));
    }
    
    addOption('Back to Combat', displayCombatScreen, 'back');
}

// Cast spell in combat
function castCombatSpell(spellName) {
    const spells = {
        'wind_strike': { runes: { air: 1, mind: 1 }, xp: 5.5, damage: 2 },
        'water_strike': { runes: { water: 1, mind: 1 }, xp: 7.5, damage: 4 },
        'earth_strike': { runes: { earth: 1, mind: 1 }, xp: 9.5, damage: 6 },
        'fire_strike': { runes: { fire: 1, mind: 1 }, xp: 11.5, damage: 8 },
        'wind_bolt': { runes: { air: 2, chaos: 1 }, xp: 13.5, damage: 9 },
        'water_bolt': { runes: { water: 2, chaos: 1 }, xp: 16.5, damage: 10 },
        'earth_bolt': { runes: { earth: 2, chaos: 1 }, xp: 19.5, damage: 11 },
        'fire_bolt': { runes: { fire: 2, chaos: 1 }, xp: 22.5, damage: 12 }
    };
    
    const spell = spells[spellName];
    if (!spell) return;
    
    // Check if player has required runes
    for (const [rune, amount] of Object.entries(spell.runes)) {
        if (!hasRunes(rune, amount)) {
            displayText(`You don't have enough ${rune} runes!`);
            setTimeout(() => displayCombatScreen(), 2000);
            return;
        }
    }
    
    // Consume runes
    for (const [rune, amount] of Object.entries(spell.runes)) {
        player.runes[rune] -= amount;
    }
    
    // Calculate magic damage (magic level affects damage)
    const magicDamage = Math.floor(spell.damage + (player.magic * 0.5));
    const actualDamage = Math.max(1, magicDamage - Math.floor(enemy.defence * 0.3));
    
    // Deal damage to enemy
    enemy.currentHP -= actualDamage;
    
    // Gain XP
    player.magicXP += spell.xp;
    checkLevelUp('magic', spell.xp);
    
    displayText(`You cast ${spellName.replace('_', ' ')}!`);
    displayText(`The spell deals ${actualDamage} damage to the ${enemy.name}!`);
    displayText(`Magic XP gained: ${spell.xp}`);
    
    if (enemy.currentHP <= 0) {
        displayText(`The ${enemy.name} collapses from the magical attack!`);
        displayText(`You defeated the ${enemy.name} with magic!`);
        
        // Award combat experience
        skillXP.attack += 15;
        skillXP.magic += 25;
        skillXP.hitpoints += 5;
        player.experience += 40;
        
        // Get loot
        const loot = getRandomLoot();
        if (loot) {
            displayText(`You find: ${loot.name}`);
            addItemToInventory(loot.name, loot.quantity);
        }
        
        // Add some runes as magic combat reward
        const runeRewards = ['air', 'water', 'earth', 'fire', 'mind'];
        const randomRune = runeRewards[Math.floor(Math.random() * runeRewards.length)];
        const runeAmount = Math.floor(Math.random() * 3) + 1;
        addRunes(randomRune, runeAmount);
        displayText(`You find ${runeAmount} ${randomRune} runes!`);
        
        inCombat = false;
        enemy = null;
        updateUI();
        setTimeout(() => showMainMenu(), 3000);
    } else {
        // Enemy attacks back
        setTimeout(() => {
            const enemyDamage = calculateDamage(enemy.attack, player.defence);
            if (enemyDamage > 0) {
                displayText(`The ${enemy.name} attacks you!`);
                displayText(`You take ${enemyDamage} damage!`);
                player.currentHP -= enemyDamage;
                
                if (player.currentHP <= 0) {
                    handlePlayerDefeat();
                } else {
                    updateUI();
                    setTimeout(() => displayCombatScreen(), 2000);
                }
            } else {
                displayText(`The ${enemy.name}'s attack misses!`);
                setTimeout(() => displayCombatScreen(), 2000);
            }
        }, 2000);
    }
}

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
            displayText('========================================');
            displayText('         CRAFTING RECIPE');
            displayText('========================================');
            displayText('');
            displayText('This crafting recipe is currently being developed.');
            displayText('More advanced crafting options will be added soon!');
            displayText('');
            displayText('For now, focus on the basic recipes available.');
            displayText('');
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
    displayText('========================================');
    displayText('         BANK PIN FEATURES');
    displayText('========================================');
    displayText('');
    displayText('Enhanced PIN security features are being developed.');
    displayText('Future features will include:');
    displayText('• Custom PIN creation and management');
    displayText('• PIN recovery options');
    displayText('• Enhanced security measures');
    displayText('• PIN change functionality');
    displayText('');
    displayText('For now, your account is protected with the default PIN.');
    displayText('');
    
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
    displayText('2. Mind Rune - 6 coins');
    displayText('3. Fire Rune - 8 coins');
    displayText('4. Water Rune - 6 coins');
    displayText('5. Earth Rune - 6 coins');
    displayText('6. Chaos Rune - 15 coins');
    displayText('7. Staff of Fire - 200 coins');
    displayText('8. Wizard Hat - 100 coins');
    displayText('');
    
    addOption('Buy Air Rune (5 coins)', () => buyMagicItem('Air Rune', 5));
    addOption('Buy Mind Rune (6 coins)', () => buyMagicItem('Mind Rune', 6));
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
        
        // Check if it's a rune and add to runes inventory
        const runeTypes = ['Air Rune', 'Mind Rune', 'Fire Rune', 'Water Rune', 'Earth Rune', 'Chaos Rune'];
        if (runeTypes.includes(item)) {
            const runeType = item.toLowerCase().replace(' rune', '');
            addRunes(runeType, 1);
            displayText(`You bought ${item} for ${cost} coins!`);
        } else {
            // Regular items go to normal inventory
            addItemToInventory(item, 1);
            displayText(`You bought ${item} for ${cost} coins!`);
        }
        
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
    displayText('         MAGE TOWER CHAT SYSTEM');
    displayText('========================================');
    displayText('');
    displayText('Welcome to the Chat System!');
    displayText('Connect with other mages and share magical knowledge.');
    displayText('');
    displayText('Available Chat Channels:');
    displayText('');
    
    addOption('General Chat', () => enterChatChannel('general'));
    addOption('Magic Discussion', () => enterChatChannel('magic'));
    addOption('Quest Help', () => enterChatChannel('quests'));
    addOption('Trading Channel', () => enterChatChannel('trading'));
    addOption('Study Groups', () => enterChatChannel('study'));
    addOption('Private Messages', showPrivateMessages);
    addOption('Chat Settings', showChatSettings);
    addOption('Back to Main Menu', showMainMenu, 'back');
}

// Chat channels data
let chatChannels = {
    general: {
        name: 'General Chat',
        messages: [
            { user: 'Wizard_Merlin', message: 'Welcome to the Mage Tower, young apprentices!' },
            { user: 'Vioel_119', message: 'Anyone know a good fire spell for beginners?' },
            { user: 'RainbowPants', message: 'Just crafted my first chaos rune! So excited!' },
            { user: 'Magic_Student', message: 'The library here is amazing for studying.' }
        ]
    },
    magic: {
        name: 'Magic Discussion',
        messages: [
            { user: 'Archmage_Elara', message: 'Today we\'ll discuss advanced spellcasting techniques.' },
            { user: 'Lemonwater88', message: 'Has anyone tried combining air and fire runes?' },
            { user: 'Magic_Leeroy', message: 'I believe there\'s a connection between prayer and magic.' },
            { user: 'Runegate59', message: 'Remember, rune crafting requires patience and precision.' }
        ]
    },
    quests: {
        name: 'Quest Help',
        messages: [
            { user: 'Helper_899', message: 'Need help with Cook\'s Assistant? I can guide you!' },
            { user: 'Adventure_Seeker43', message: 'Anyone want to team up for the Sheep Shearer quest?' },
            { user: 'Quest_Master79', message: 'Tips: Always check your quest journal for updates.' },
            { user: 'TOONSCAPE_player8109', message: 'How do I start the White Knight quest?' }
        ]
    },
    trading: {
        name: 'Trading Channel',
        messages: [
            { user: 'Merchant_Mike', message: 'Selling rune essence, 50 coins each!' },
            { user: 'Trade_Expert', message: 'Looking to buy magic robes, anyone selling?' },
            { user: 'collectorsReborn', message: 'WTB: Ancient staff, paying well!' },
            { user: 'Magic_Dealer', message: 'Buying all types of runes, fair prices!' }
        ]
    },
    study: {
        name: 'Study Groups',
        messages: [
            { user: 'Study_Leader', message: 'Magic theory study session starting in 10 minutes!' },
            { user: 'Group_Organizer', message: 'Looking for group for Swamp dungeon, will pay in rune crafting.' },
            { user: 'Knowledge_Seeker', message: 'Anyone want to practice spellcasting together?' },
            { user: 'Academic_Mage', message: 'Remember to take breaks while studying!' }
        ]
    }
};

// Enter a chat channel
function enterChatChannel(channelName) {
    clearOutput();
    clearOptions();
    
    const channel = chatChannels[channelName];
    
    displayText('========================================');
    displayText(`         ${channel.name.toUpperCase()}`);
    displayText('========================================');
    displayText('');
    
    // Display recent messages
    displayText('Recent Messages:');
    displayText('');
    
    channel.messages.forEach(msg => {
        displayText(`[${msg.user}]: ${msg.message}`);
    });
    
    displayText('');
    displayText('========================================');
    displayText('');
    
    // Add some interactive options
    addOption('Send Message', () => sendChatMessage(channelName));
    addOption('Ask for Help', () => askForHelp(channelName));
    addOption('Share Knowledge', () => shareKnowledge(channelName));
    addOption('Find Study Partner', () => findStudyPartner(channelName));
    addOption('Back to Chat Menu', showChatSystem);
}

// Send a chat message
function sendChatMessage(channelName) {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         SEND MESSAGE');
    displayText('========================================');
    displayText('');
    displayText('What would you like to say?');
    displayText('');
    
    // Simulate different message types based on channel
    const messageOptions = getMessageOptions(channelName);
    
    messageOptions.forEach(option => {
        addOption(option.text, () => {
            const newMessage = {
                user: player.name,
                message: option.message
            };
            chatChannels[channelName].messages.push(newMessage);
            
            displayText(`Message sent: "${option.message}"`);
            displayText('You gained 5 Magic experience for social interaction!');
            
            skillXP.magic += 5;
            player.experience += 5;
            checkLevelUp('magic', skillXP.magic);
            updateUI();
            
            setTimeout(() => enterChatChannel(channelName), 2000);
        });
    });
    
    addOption('Back to Channel', () => enterChatChannel(channelName));
}

// Get message options based on channel
function getMessageOptions(channelName) {
    const options = {
        general: [
            { text: 'Greet everyone', message: 'Hello everyone! Nice to meet you all!' },
            { text: 'Ask about the tower', message: 'This Mage Tower is amazing! How long have you been here?' },
            { text: 'Share your experience', message: 'I\'m learning so much about magic here!' }
        ],
        magic: [
            { text: 'Ask about spells', message: 'Can anyone recommend good spells for my level?' },
            { text: 'Share spell discovery', message: 'I just learned a new spell combination!' },
            { text: 'Discuss magic theory', message: 'What do you think about the connection between elements?' }
        ],
        quests: [
            { text: 'Ask for quest help', message: 'I\'m stuck on a quest, can anyone help?' },
            { text: 'Offer quest help', message: 'I can help with quests if anyone needs assistance!' },
            { text: 'Share quest progress', message: 'Just completed a quest, it was great!' }
        ],
        trading: [
            { text: 'Offer to sell items', message: 'Selling some magic items, PM me for details!' },
            { text: 'Ask to buy items', message: 'Looking to buy some magic equipment, anyone selling?' },
            { text: 'Discuss prices', message: 'What\'s a fair price for rune essence these days?' }
        ],
        study: [
            { text: 'Organize study session', message: 'Anyone want to study magic theory together?' },
            { text: 'Ask for study tips', message: 'What\'s the best way to practice spellcasting?' },
            { text: 'Share study progress', message: 'Made great progress with my studies today!' }
        ]
    };
    
    return options[channelName] || options.general;
}

// Ask for help
function askForHelp(channelName) {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         ASK FOR HELP');
    displayText('========================================');
    displayText('');
    displayText('You ask for help in the chat...');
    displayText('');
    
    const helpResponses = [
        'Several mages respond with helpful advice!',
        'You receive some useful tips from experienced players.',
        'A kind wizard offers to guide you through your problem.',
        'The community is very supportive and helpful!'
    ];
    
    const response = helpResponses[Math.floor(Math.random() * helpResponses.length)];
    displayText(response);
    displayText('');
    displayText('You gained 10 Magic experience for seeking knowledge!');
    
    skillXP.magic += 10;
    player.experience += 10;
    checkLevelUp('magic', skillXP.magic);
    updateUI();
    
    addOption('Continue Chatting', () => enterChatChannel(channelName));
}

// Share knowledge
function shareKnowledge(channelName) {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         SHARE KNOWLEDGE');
    displayText('========================================');
    displayText('');
    displayText('You share some of your magical knowledge...');
    displayText('');
    displayText('The other mages appreciate your contribution!');
    displayText('You gain respect in the magical community.');
    displayText('');
    displayText('You gained 15 Magic experience for sharing knowledge!');
    
    skillXP.magic += 15;
    player.experience += 15;
    checkLevelUp('magic', skillXP.magic);
    updateUI();
    
    addOption('Continue Chatting', () => enterChatChannel(channelName));
}

// Find study partner
function findStudyPartner(channelName) {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         FIND STUDY PARTNER');
    displayText('========================================');
    displayText('');
    displayText('You look for a study partner...');
    displayText('');
    
    const partnerFound = Math.random() < 0.7;
    
    if (partnerFound) {
        displayText('You find a study partner!');
        displayText('Together you practice magic and learn from each other.');
        displayText('Your magical abilities improve through collaboration.');
        displayText('');
        displayText('You gained 20 Magic experience from studying together!');
        
        skillXP.magic += 20;
        player.experience += 20;
        checkLevelUp('magic', skillXP.magic);
        updateUI();
    } else {
        displayText('No study partners are available right now.');
        displayText('You practice magic on your own instead.');
        displayText('');
        displayText('You gained 10 Magic experience from solo practice!');
        
        skillXP.magic += 10;
        player.experience += 10;
        checkLevelUp('magic', skillXP.magic);
        updateUI();
    }
    
    addOption('Continue Chatting', () => enterChatChannel(channelName));
}

// Show private messages
function showPrivateMessages() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         PRIVATE MESSAGES');
    displayText('========================================');
    displayText('');
    displayText('Your Private Messages:');
    displayText('');
    displayText('1. From Wizard_Merlin: "Welcome to the tower! Let me know if you need help."');
    displayText('2. From Spellcaster_Sarah: "Thanks for the spell advice earlier!"');
    displayText('3. From RuneMaster_Tom: "Want to trade some runes?"');
    displayText('');
    displayText('Private messaging allows you to have personal conversations.');
    displayText('');
    
    addOption('Send Private Message', sendPrivateMessage);
    addOption('Reply to Messages', replyToMessages);
    addOption('Back to Chat Menu', showChatSystem);
}

// Send private message
function sendPrivateMessage() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         SEND PRIVATE MESSAGE');
    displayText('========================================');
    displayText('');
    displayText('Choose a recipient:');
    displayText('');
    
    const contacts = ['Wizard_Merlin', 'Spellcaster_Sarah', 'RuneMaster_Tom', 'Archmage_Elara'];
    
    contacts.forEach(contact => {
        addOption(`Message ${contact}`, () => {
            displayText(`Message sent to ${contact}!`);
            displayText('You gained 5 Magic experience for networking!');
            
            skillXP.magic += 5;
            player.experience += 5;
            checkLevelUp('magic', skillXP.magic);
            updateUI();
            
            setTimeout(() => showPrivateMessages(), 2000);
        });
    });
    
    addOption('Back to Private Messages', showPrivateMessages);
}

// Reply to messages
function replyToMessages() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         REPLY TO MESSAGES');
    displayText('========================================');
    displayText('');
    displayText('You reply to the messages...');
    displayText('');
    displayText('Your replies are sent successfully!');
    displayText('You maintain good relationships with other mages.');
    displayText('');
    displayText('You gained 10 Magic experience for social interaction!');
    
    skillXP.magic += 10;
    player.experience += 10;
    checkLevelUp('magic', skillXP.magic);
    updateUI();
    
    addOption('Back to Private Messages', showPrivateMessages);
}

// Show chat settings
function showChatSettings() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         CHAT SETTINGS');
    displayText('========================================');
    displayText('');
    displayText('Chat Settings:');
    displayText('');
    displayText('• Message Notifications: ON');
    displayText('• Auto-Reply: OFF');
    displayText('• Privacy Level: Standard');
    displayText('• Language Filter: ON');
    displayText('• Sound Effects: ON');
    displayText('');
    displayText('These settings help you customize your chat experience.');
    displayText('');
    
    addOption('Toggle Notifications', toggleNotifications);
    addOption('Change Privacy Level', changePrivacyLevel);
    addOption('Back to Chat Menu', showChatSystem);
}

// Toggle notifications
function toggleNotifications() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         TOGGLE NOTIFICATIONS');
    displayText('========================================');
    displayText('');
    displayText('You toggle your message notifications.');
    displayText('This will help you stay updated with chat activity.');
    displayText('');
    displayText('You gained 5 Magic experience for managing your settings!');
    
    skillXP.magic += 5;
    player.experience += 5;
    checkLevelUp('magic', skillXP.magic);
    updateUI();
    
    addOption('Back to Chat Settings', showChatSettings);
}

// Change privacy level
function changePrivacyLevel() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         CHANGE PRIVACY LEVEL');
    displayText('========================================');
    displayText('');
    displayText('You adjust your privacy settings.');
    displayText('This helps you control who can contact you.');
    displayText('');
    displayText('You gained 5 Magic experience for managing your settings!');
    
    skillXP.magic += 5;
    player.experience += 5;
    checkLevelUp('magic', skillXP.magic);
    updateUI();
    
    addOption('Back to Chat Settings', showChatSettings);
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
    displayText('2. Mind Rune - Level 2 (Rune Essence)');
    displayText('3. Fire Rune - Level 1 (Rune Essence)');
    displayText('4. Water Rune - Level 5 (Rune Essence)');
    displayText('5. Earth Rune - Level 9 (Rune Essence)');
    displayText('6. Chaos Rune - Level 35 (Rune Essence)');
    displayText('');
    
    addOption('Craft Air Rune', () => craftRune('air'));
    addOption('Craft Mind Rune', () => craftRune('mind'));
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
            case 'mind':
                runeName = 'Mind Rune';
                xp = 27;
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
        
        // Add runes to separate runes inventory
        addRunes(runeType, 1);
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
    displayText('========================================');
    displayText('         HOUSE NAMING FEATURES');
    displayText('========================================');
    displayText('');
    displayText('The house naming system is currently being developed.');
    displayText('Future features will include:');
    displayText('• Custom house names and titles');
    displayText('• House name display for visitors');
    displayText('• Name change functionality');
    displayText('• Special naming themes and options');
    displayText('• House name history and records');
    displayText('');
    displayText('For now, your house uses the default naming system.');
    displayText('');
    
    addOption('Back to House Settings', houseSettings);
}

function setHouseTheme() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         SET HOUSE THEME');
    displayText('========================================');
    displayText('');
    displayText('========================================');
    displayText('         HOUSE THEMING FEATURES');
    displayText('========================================');
    displayText('');
    displayText('The house theming system is currently being developed.');
    displayText('Future features will include:');
    displayText('• Multiple house themes and styles');
    displayText('• Custom color schemes and decorations');
    displayText('• Seasonal and holiday themes');
    displayText('• Theme-specific furniture and items');
    displayText('• Theme preview and customization');
    displayText('• Theme sharing with other players');
    displayText('');
    displayText('For now, your house uses the default theme.');
    displayText('');
    
    addOption('Back to House Settings', houseSettings);
}

function manageHouseAccess() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         MANAGE HOUSE ACCESS');
    displayText('========================================');
    displayText('');
    displayText('========================================');
    displayText('         HOUSE ACCESS FEATURES');
    displayText('========================================');
    displayText('');
    displayText('The house access management system is being developed.');
    displayText('Future features will include:');
    displayText('• Guest access permissions');
    displayText('• Public house tours');
    displayText('• Friend-only access settings');
    displayText('• Access logs and visitor tracking');
    displayText('• Temporary access codes');
    displayText('• House security settings');
    displayText('• Visitor messaging system');
    displayText('');
    displayText('For now, your house is private and secure.');
    displayText('');
    
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
    'Raw Mackerel', 'Raw Cod', 'Raw Bass', 'Cooked Mackerel', 'Cooked Cod', 'Cooked Bass',
    // Materials
    'Clay', 'Leather', 'Copper Ore', 'Tin Ore', 'Iron Ore', 'Coal', 'Gold Ore', 'Bronze Bar', 'Iron Bar', 'Steel Bar',
    // Wood and resources
    'Logs', 'Oak Logs', 'Willow Logs', 'Maple Logs', 'Yew Logs', 'Magic Logs',
    // Runes
    'Air Rune', 'Fire Rune', 'Water Rune', 'Earth Rune', 'Chaos Rune', 'Rune Essence',
    // Quest items (some might be stackable)
    'Egg', 'Pot of Flour', 'Bucket of Milk', 'Wool', 'Shears',
    // Crafting materials
    'Feather', 'Arrow Shafts', 'Headless Arrow',
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
    if (['Wooden Shield', 'Iron Shield', 'Wizard Hat'].includes(itemName)) return 'armor';
    if (['Fishing Rod', 'Axe', 'Pickaxe', 'Tinderbox', 'Knife'].includes(itemName)) return 'tool';
    if (['Bread', 'Shrimp', 'Sardine', 'Herring', 'Trout', 'Lobster', 'Swordfish', 'Shark',
         'Raw Shrimp', 'Raw Sardine', 'Raw Herring', 'Raw Trout', 'Raw Lobster', 'Raw Swordfish', 'Raw Shark', 'Raw Beef', 'Raw Chicken',
         'Cooked Shrimp', 'Cooked Sardine', 'Cooked Herring', 'Cooked Trout', 'Cooked Lobster', 'Cooked Swordfish', 'Cooked Shark', 'Cooked Beef', 'Cooked Chicken',
         'Burnt Shrimp', 'Burnt Sardine', 'Burnt Herring', 'Burnt Trout', 'Burnt Lobster', 'Burnt Swordfish', 'Burnt Shark', 'Burnt Beef', 'Burnt Chicken',
         'Raw Mackerel', 'Raw Cod', 'Raw Bass', 'Cooked Mackerel', 'Cooked Cod', 'Cooked Bass', 'Burnt Mackerel', 'Burnt Cod', 'Burnt Bass'].includes(itemName)) return 'food';
    if (['Clay', 'Leather', 'Copper Ore', 'Tin Ore', 'Iron Ore', 'Coal', 'Gold Ore', 'Feather', 'Ashes', 'Logs', 'Oak Logs', 'Willow Logs', 'Maple Logs', 'Yew Logs', 'Magic Logs', 'Arrow Shafts', 'Headless Arrow'].includes(itemName)) return 'material';
    if (['Air Rune', 'Mind Rune', 'Fire Rune', 'Water Rune', 'Earth Rune', 'Chaos Rune', 'Rune Essence'].includes(itemName)) return 'magic';
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
    // Check if it's raw food that needs cooking
    const rawFoods = ['Raw Shrimp', 'Raw Sardine', 'Raw Herring', 'Raw Trout', 'Raw Lobster', 'Raw Swordfish', 'Raw Shark', 'Raw Beef', 'Raw Chicken'];
    
    if (rawFoods.includes(item.name)) {
        displayText(`You can't eat ${item.name} raw!`);
        displayText('You need to cook it first using a fire.');
        displayText('Visit the firemaking section to cook your food.');
        displayText('');
        addOption('Continue', useItemFromInventory);
        return;
    }
    
    // Check if it's burnt food
    const burntFoods = ['Burnt Shrimp', 'Burnt Sardine', 'Burnt Herring', 'Burnt Trout', 'Burnt Lobster', 'Burnt Swordfish', 'Burnt Shark', 'Burnt Beef', 'Burnt Chicken'];
    
    if (burntFoods.includes(item.name)) {
        displayText(`You try to eat the ${item.name}...`);
        displayText('It tastes terrible and makes you feel sick!');
        displayText('You lose 1 hitpoint from eating burnt food.');
        displayText('');
        
        player.currentHP = Math.max(1, player.currentHP - 1);
        
        // Remove one item from inventory
        if (item.quantity > 1) {
            item.quantity--;
        } else {
            player.inventory.splice(index, 1);
        }
        
        updateUI();
        addOption('Continue', useItemFromInventory);
        return;
    }
    
    let healAmount = 0;
    let message = '';
    
    switch(item.name) {
        case 'Bread':
            healAmount = 2;
            message = 'You eat a loaf of bread. It tastes fresh and wholesome.';
            break;
        case 'Cooked Shrimp':
            healAmount = 3;
            message = 'You eat some cooked shrimp. It\'s quite tasty.';
            break;
        case 'Cooked Sardine':
            healAmount = 4;
            message = 'You eat a cooked sardine. It\'s salty but good.';
            break;
        case 'Cooked Herring':
            healAmount = 5;
            message = 'You eat a cooked herring. It\'s quite filling.';
            break;
        case 'Cooked Trout':
            healAmount = 7;
            message = 'You eat a cooked trout. It\'s delicious!';
            break;
        case 'Cooked Lobster':
            healAmount = 12;
            message = 'You eat a cooked lobster. It\'s a real treat!';
            break;
        case 'Cooked Swordfish':
            healAmount = 14;
            message = 'You eat a cooked swordfish. It\'s very satisfying!';
            break;
        case 'Cooked Shark':
            healAmount = 20;
            message = 'You eat a cooked shark. It\'s incredibly filling!';
            break;
        case 'Cooked Beef':
            healAmount = 6;
            message = 'You eat some cooked beef. It\'s very satisfying!';
            break;
        case 'Cooked Chicken':
            healAmount = 4;
            message = 'You eat some cooked chicken. It\'s tender and delicious!';
            break;
        // Legacy support for old cooked fish names
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
    // Initialize equippedArmor if it doesn't exist
    if (!player.equippedArmor) {
        player.equippedArmor = null;
    }
    
    // Remove the item from inventory
    const removed = removeItemFromInventory(item.name, 1);
    
    if (!removed) {
        displayText(`Error: Could not remove ${item.name} from inventory.`);
        addOption('Continue', useItemFromInventory);
        return;
    }
    
    // Equip the armor
    if (item.name === 'Wizard Hat') {
        player.equippedArmor = 'Wizard Hat';
        displayText(`You equip the ${item.name}.`);
        displayText('The wizard hat enhances your magical abilities!');
        displayText('You can now use magic in combat!');
    } else {
        player.equippedArmor = item.name;
        displayText(`You equip ${item.name}.`);
        displayText('This armor provides additional defence in combat!');
    }
    
    displayText('');
    displayText('Note: Armor effects are automatically applied in combat.');
    
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
            displayText('');
            // Check if player has logs to make a fire
            const hasLogs = player.inventory.some(invItem => 
                ['Logs', 'Oak Logs', 'Willow Logs', 'Maple Logs', 'Yew Logs', 'Magic Logs'].includes(invItem.name)
            );
            
            if (hasLogs) {
                addOption('Light a Fire (Firemaking)', () => startFiremakingMinigame());
            } else {
                displayText('You need logs to light a fire.');
            }
            break;
        case 'Knife':
            displayText('Use it to fletch logs into shafts and bows.');
            addOption('Open Fletching Menu', showFletching);
            break;
    }
    
    addOption('Continue', useItemFromInventory);
}

// Firemaking minigame
function startFiremakingMinigame() {
    clearOutput();
    clearOptions();
    
    // Check requirements again
    const hasTinderbox = hasItem('Tinderbox', 1);
    const availableLogs = player.inventory.filter(invItem => 
        ['Logs', 'Oak Logs', 'Willow Logs', 'Maple Logs', 'Yew Logs', 'Magic Logs'].includes(invItem.name)
    );
    
    // Check for cookable food
    const cookableFood = player.inventory.filter(invItem => 
        ['Raw Shrimp', 'Raw Sardine', 'Raw Herring', 'Raw Trout', 'Raw Lobster', 'Raw Swordfish', 'Raw Shark', 'Raw Beef', 'Raw Chicken'].includes(invItem.name)
    );
    
    if (!hasTinderbox) {
        displayText('You need a tinderbox to light fires!');
        addOption('Back', useItemFromInventory);
        return;
    }
    
    if (availableLogs.length === 0 && cookableFood.length === 0) {
        displayText('You need logs to light a fire or cookable food to cook!');
        addOption('Back', useItemFromInventory);
        return;
    }
    
    displayText('========================================');
    displayText('         FIRE & COOKING STATION');
    displayText('========================================');
    displayText('');
    
    if (availableLogs.length > 0) {
        displayText('🔥 FIREMAKING OPTIONS:');
        displayText('Select logs to burn:');
        displayText('');
        
        availableLogs.forEach((log, index) => {
            const logType = log.name;
            const xpGain = getFiremakingXP(logType);
            displayText(`${index + 1}. ${logType} (${log.quantity}) - ${xpGain} XP each`);
            addOption(`Burn ${logType}`, () => burnLog(logType, xpGain));
        });
        displayText('');
    }
    
    if (cookableFood.length > 0) {
        displayText('🍳 COOKING OPTIONS:');
        displayText(`Cooking Level: ${player.cooking}`);
        displayText('Select food to cook:');
        displayText('');
        
        cookableFood.forEach((food, index) => {
            const foodType = food.name;
            const xpGain = getCookingXP(foodType);
            const successChance = Math.floor(getCookingSuccessChance(foodType) * 100);
            const canCook = canCookFood(foodType);
            
            if (canCook) {
                displayText(`${availableLogs.length + index + 1}. ${foodType} (${food.quantity}) - ${xpGain} XP each (${successChance}% success)`);
                addOption(`Cook ${foodType}`, () => startCookingMinigame(foodType, xpGain));
            } else {
                const cookingRequirements = {
                    'Raw Shrimp': 1, 'Raw Sardine': 1, 'Raw Herring': 5, 'Raw Trout': 15,
                    'Raw Lobster': 40, 'Raw Swordfish': 45, 'Raw Shark': 80, 'Raw Beef': 1, 'Raw Chicken': 1
                };
                const requiredLevel = cookingRequirements[foodType] || 1;
                displayText(`${availableLogs.length + index + 1}. ${foodType} (${food.quantity}) - Requires Cooking Level ${requiredLevel}`);
            }
        });
        displayText('');
    }
    
    addOption('Cancel', useItemFromInventory);
}

// Get firemaking XP for different log types
function getFiremakingXP(logType) {
    const xpValues = {
        'Logs': 25,
        'Oak Logs': 37,
        'Willow Logs': 67,
        'Maple Logs': 100,
        'Yew Logs': 175,
        'Magic Logs': 250
    };
    return xpValues[logType] || 25;
}

// Get cooking XP for different food types
function getCookingXP(foodType) {
    const xpValues = {
        'Raw Shrimp': 30,
        'Raw Sardine': 40,
        'Raw Herring': 50,
        'Raw Trout': 70,
        'Raw Lobster': 120,
        'Raw Swordfish': 140,
        'Raw Shark': 210,
        'Raw Beef': 30,
        'Raw Chicken': 25
    };
    return xpValues[foodType] || 30;
}

// Burn a log and start the fire animation
function burnLog(logType, xpGain) {
    clearOutput();
    clearOptions();
    
    // Remove one log from inventory
    if (!removeItemFromInventory(logType, 1)) {
        displayText('Error: Could not remove log from inventory.');
        addOption('Back', startFiremakingMinigame);
        return;
    }
    
    displayText('========================================');
    displayText('         LIGHTING FIRE...');
    displayText('========================================');
    displayText('');
    displayText('You strike your tinderbox...');
    displayText('The sparks catch on the dry wood...');
    displayText('');
    
    // Start the fire animation
    startFireAnimation(logType, xpGain);
}

// Fire animation and burning simulation
function startFireAnimation(logType, xpGain) {
    let fireStage = 0;
    const fireStages = [
        '🔥 Small flames begin to flicker...',
        '🔥🔥 The fire grows stronger...',
        '🔥🔥🔥 The fire burns brightly!',
        '🔥🔥🔥🔥 The fire roars with heat!',
        '🔥🔥🔥🔥🔥 The fire reaches its peak!',
        '🔥🔥🔥🔥 The fire begins to die down...',
        '🔥🔥 The flames grow smaller...',
        '🔥 The fire burns low...',
        '💨 The fire goes out, leaving only ashes...'
    ];
    
    const animateFire = () => {
        if (fireStage < fireStages.length) {
            displayText(fireStages[fireStage]);
            fireStage++;
            
            if (fireStage < fireStages.length) {
                setTimeout(animateFire, 800); // 800ms between stages
            } else {
                // Fire is complete
                completeFiremaking(logType, xpGain);
            }
        }
    };
    
    animateFire();
}

// Complete the firemaking process
function completeFiremaking(logType, xpGain) {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         FIREMAKING COMPLETE!');
    displayText('========================================');
    displayText('');
    displayText(`You successfully burned ${logType}!`);
    displayText(`You gained ${xpGain} Firemaking experience!`);
    
    // Add firemaking XP
    skillXP.firemaking += xpGain;
    player.experience += xpGain;
    
    // Check for level up
    checkLevelUp('firemaking', skillXP.firemaking);
    
    // Chance to get ashes (30% chance)
    if (Math.random() < 0.3) {
        displayText('');
        displayText('You collected some ashes from the burnt logs!');
        addItemToInventory('Ashes', 1);
    }
    
    displayText('');
    displayText('The fire has burned out completely.');
    displayText('');
    
    // Check if player has more logs to burn
    const hasMoreLogs = player.inventory.some(invItem => 
        ['Logs', 'Oak Logs', 'Willow Logs', 'Maple Logs', 'Yew Logs', 'Magic Logs'].includes(invItem.name)
    );
    
    if (hasMoreLogs) {
        addOption('Light Another Fire', startFiremakingMinigame);
    }
    
    addOption('Continue', useItemFromInventory);
    updateUI();
}

// Cooking minigame
function startCookingMinigame(foodType, xpGain) {
    clearOutput();
    clearOptions();
    
    // Remove one raw food from inventory
    if (!removeItemFromInventory(foodType, 1)) {
        displayText('Error: Could not remove food from inventory.');
        addOption('Back', startFiremakingMinigame);
        return;
    }
    
    displayText('========================================');
    displayText('         COOKING MINIGAME');
    displayText('========================================');
    displayText('');
    displayText(`You place the ${foodType} over the fire...`);
    displayText('Watch the cooking process carefully!');
    displayText('');
    
    // Start the cooking animation based on food type
    startCookingAnimation(foodType, xpGain);
}

// Cooking animation and success/failure simulation
function startCookingAnimation(foodType, xpGain, context = 'firemaking') {
    let cookingStage = 0;
    const cookingStages = getCookingStages(foodType);
    const successChance = getCookingSuccessChance(foodType);
    
    const animateCooking = () => {
        if (cookingStage < cookingStages.length) {
            displayText(cookingStages[cookingStage]);
            cookingStage++;
            
            if (cookingStage < cookingStages.length) {
                setTimeout(animateCooking, 1000); // 1000ms between stages
            } else {
                // Cooking is complete
                completeCooking(foodType, xpGain, successChance, context);
            }
        }
    };
    
    animateCooking();
}

// Get cooking stages for different food types
function getCookingStages(foodType) {
    const stages = {
        'Raw Shrimp': [
            '🦐 The shrimp starts to turn pink...',
            '🦐🦐 The shrimp is cooking nicely...',
            '🦐🦐🦐 The shrimp is almost done...',
            '🦐🦐🦐🦐 Perfect! The shrimp is cooked!'
        ],
        'Raw Sardine': [
            '🐟 The sardine begins to sizzle...',
            '🐟🐟 The sardine is cooking well...',
            '🐟🐟🐟 The sardine looks delicious...',
            '🐟🐟🐟🐟 Excellent! The sardine is ready!'
        ],
        'Raw Herring': [
            '🐟 The herring starts cooking...',
            '🐟🐟 The herring is browning nicely...',
            '🐟🐟🐟 The herring smells great...',
            '🐟🐟🐟🐟 Perfect! The herring is cooked!'
        ],
        'Raw Trout': [
            '🐟 The trout begins to cook...',
            '🐟🐟 The trout is sizzling nicely...',
            '🐟🐟🐟 The trout is almost ready...',
            '🐟🐟🐟🐟 Excellent! The trout is perfectly cooked!'
        ],
        'Raw Lobster': [
            '🦞 The lobster starts to turn red...',
            '🦞🦞 The lobster is cooking slowly...',
            '🦞🦞🦞 The lobster is almost done...',
            '🦞🦞🦞🦞 Perfect! The lobster is ready!'
        ],
        'Raw Swordfish': [
            '🐟 The swordfish begins to cook...',
            '🐟🐟 The swordfish is sizzling...',
            '🐟🐟🐟 The swordfish looks great...',
            '🐟🐟🐟🐟 Excellent! The swordfish is cooked!'
        ],
        'Raw Shark': [
            '🦈 The shark starts cooking...',
            '🦈🦈 The shark is browning well...',
            '🦈🦈🦈 The shark is almost ready...',
            '🦈🦈🦈🦈 Perfect! The shark is cooked!'
        ],
        'Raw Beef': [
            '🥩 The beef starts to sizzle...',
            '🥩🥩 The beef is cooking nicely...',
            '🥩🥩🥩 The beef is almost done...',
            '🥩🥩🥩🥩 Perfect! The beef is cooked!'
        ],
        'Raw Chicken': [
            '🐔 The chicken begins to cook...',
            '🐔🐔 The chicken is browning...',
            '🐔🐔🐔 The chicken is almost ready...',
            '🐔🐔🐔🐔 Excellent! The chicken is cooked!'
        ]
    };
    return stages[foodType] || stages['Raw Shrimp'];
}

// Get cooking success chance based on cooking level and food type
function getCookingSuccessChance(foodType) {
    const baseChance = 0.7; // 70% base chance
    const levelBonus = player.cooking * 0.02; // 2% per cooking level
    const foodDifficulty = {
        'Raw Shrimp': 0.1,
        'Raw Sardine': 0.1,
        'Raw Herring': 0.15,
        'Raw Trout': 0.2,
        'Raw Lobster': 0.25,
        'Raw Swordfish': 0.3,
        'Raw Shark': 0.35,
        'Raw Beef': 0.1,
        'Raw Chicken': 0.1
    };
    
    const difficulty = foodDifficulty[foodType] || 0.1;
    return Math.min(0.95, baseChance + levelBonus - difficulty); // Max 95% chance
}

// Check if player can cook a specific food type
function canCookFood(foodType) {
    const cookingRequirements = {
        'Raw Shrimp': 1,
        'Raw Sardine': 1,
        'Raw Herring': 5,
        'Raw Trout': 15,
        'Raw Lobster': 40,
        'Raw Swordfish': 45,
        'Raw Shark': 80,
        'Raw Beef': 1,
        'Raw Chicken': 1
    };
    
    const requiredLevel = cookingRequirements[foodType] || 1;
    return player.cooking >= requiredLevel;
}

// Complete the cooking process
function completeCooking(foodType, xpGain, successChance, context = 'firemaking') {
    clearOutput();
    clearOptions();
    
    const success = Math.random() < successChance;
    
    if (success) {
        displayText('========================================');
        displayText('         COOKING SUCCESS!');
        displayText('========================================');
        displayText('');
        displayText(`You successfully cooked the ${foodType}!`);
        displayText(`You gained ${xpGain} Cooking experience!`);
        
        // Add cooking XP
        skillXP.cooking += xpGain;
        player.experience += xpGain;
        
        // Check for level up
        checkLevelUp('cooking', skillXP.cooking);
        
        // Add cooked food to inventory
        const cookedFood = getCookedFoodName(foodType);
        addItemToInventory(cookedFood, 1);
        displayText(`You receive ${cookedFood}!`);
        
    } else {
        displayText('========================================');
        displayText('         COOKING FAILED!');
        displayText('========================================');
        displayText('');
        displayText(`You burned the ${foodType}!`);
        displayText('It\'s completely charred and inedible.');
        displayText(`You still gained ${Math.floor(xpGain * 0.3)} Cooking experience from trying.`);
        
        // Add reduced XP for failure
        const failureXP = Math.floor(xpGain * 0.3);
        skillXP.cooking += failureXP;
        player.experience += failureXP;
        checkLevelUp('cooking', skillXP.cooking);
        
        // Add burnt food to inventory
        const burntFood = getBurntFoodName(foodType);
        addItemToInventory(burntFood, 1);
        displayText(`You receive ${burntFood}!`);
    }
    
    displayText('');
    
    // Check if player has more food to cook
    const hasMoreFood = player.inventory.some(invItem => 
        ['Raw Shrimp', 'Raw Sardine', 'Raw Herring', 'Raw Trout', 'Raw Lobster', 'Raw Swordfish', 'Raw Shark', 'Raw Beef', 'Raw Chicken'].includes(invItem.name)
    );
    
    // Check if player has more food to cook
    if (hasMoreFood) {
        if (context === 'windmill') {
            addOption('Cook More Food', startCookingAtWindmill);
        } else {
            addOption('Cook More Food', startFiremakingMinigame);
        }
    }
    
    if (context === 'windmill') {
        addOption('Back to Cooking Training', trainCookingAtWindmill);
    } else {
        addOption('Continue', useItemFromInventory);
    }
    updateUI();
}

// Get cooked food name from raw food name
function getCookedFoodName(rawFood) {
    const cookedNames = {
        'Raw Shrimp': 'Cooked Shrimp',
        'Raw Sardine': 'Cooked Sardine',
        'Raw Herring': 'Cooked Herring',
        'Raw Trout': 'Cooked Trout',
        'Raw Lobster': 'Cooked Lobster',
        'Raw Swordfish': 'Cooked Swordfish',
        'Raw Shark': 'Cooked Shark',
        'Raw Beef': 'Cooked Beef',
        'Raw Chicken': 'Cooked Chicken'
    };
    return cookedNames[rawFood] || 'Cooked Food';
}

// Get burnt food name from raw food name
function getBurntFoodName(rawFood) {
    const burntNames = {
        'Raw Shrimp': 'Burnt Shrimp',
        'Raw Sardine': 'Burnt Sardine',
        'Raw Herring': 'Burnt Herring',
        'Raw Trout': 'Burnt Trout',
        'Raw Lobster': 'Burnt Lobster',
        'Raw Swordfish': 'Burnt Swordfish',
        'Raw Shark': 'Burnt Shark',
        'Raw Beef': 'Burnt Beef',
        'Raw Chicken': 'Burnt Chicken'
    };
    return burntNames[rawFood] || 'Burnt Food';
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

// Falador exploration functions
function exploreFaladorCastle() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         FALADOR CASTLE');
    displayText('========================================');
    displayText('');
    displayText('You enter the grand Falador Castle...');
    displayText('White Knights patrol the halls in their gleaming armor.');
    displayText('The castle is a symbol of order and justice.');
    displayText('');
    displayText('You gain 30 Defence experience from observing the knights!');
    
    skillXP.defence += 30;
    player.experience += 30;
    checkLevelUp('defence', skillXP.defence);
    updateUI();
    
    addOption('Back to Exploring', exploreArea);
}

function exploreFaladorMarketplace() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         FALADOR MARKETPLACE');
    displayText('========================================');
    displayText('');
    displayText('You explore the bustling Falador marketplace...');
    displayText('Merchants sell their wares and people gather to trade.');
    displayText('The market is well-organized and clean.');
    displayText('');
    displayText('You gain 20 Crafting experience from observing trade!');
    
    skillXP.crafting += 20;
    player.experience += 20;
    checkLevelUp('crafting', skillXP.crafting);
    updateUI();
    
    addOption('Back to Exploring', exploreArea);
}

function exploreFaladorChurch() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         FALADOR CHURCH');
    displayText('========================================');
    displayText('');
    displayText('You enter the peaceful Falador Church...');
    displayText('The church is well-maintained and welcoming.');
    displayText('You feel a sense of peace and tranquility.');
    displayText('');
    displayText('You gain 25 Prayer experience from prayer and meditation!');
    
    skillXP.prayer += 25;
    player.experience += 25;
    checkLevelUp('prayer', skillXP.prayer);
    updateUI();
    
    addOption('Back to Exploring', exploreArea);
}

function exploreFaladorTrainingGrounds() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         WHITE KNIGHTS TRAINING GROUNDS');
    displayText('========================================');
    displayText('');
    displayText('You enter the White Knights\' training grounds...');
    displayText('Knights practice their combat skills with discipline.');
    displayText('The training area is well-equipped and organized.');
    displayText('');
    displayText('You gain 35 Attack experience from observing combat training!');
    
    skillXP.attack += 35;
    player.experience += 35;
    checkLevelUp('attack', skillXP.attack);
    updateUI();
    
    addOption('Back to Exploring', exploreArea);
}

function exploreFaladorEnduranceTrack() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         FALADOR ENDURANCE TRACK');
    displayText('========================================');
    displayText('');
    displayText('You approach the Falador Endurance Track...');
    displayText('This is a well-maintained running track used by the White Knights.');
    displayText('The track winds through the city with various obstacles and challenges.');
    displayText('');
    displayText('Running this track will build your stamina and health!');
    displayText('');
    displayText('Track Features:');
    displayText('• Paved running paths');
    displayText('• Obstacle courses');
    displayText('• Strength training stations');
    displayText('• Rest areas with water fountains');
    displayText('');
    
    addOption('Run the Track (Easy - 15 HP XP)', () => runEnduranceTrack('falador', 'easy'));
    addOption('Run the Track (Medium - 25 HP XP)', () => runEnduranceTrack('falador', 'medium'));
    addOption('Run the Track (Hard - 40 HP XP)', () => runEnduranceTrack('falador', 'hard'));
    addOption('Back to Exploring', exploreArea);
}

function exploreFaladorGardens() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         FALADOR GARDENS');
    displayText('========================================');
    displayText('');
    displayText('You walk through the beautiful Falador Gardens...');
    displayText('Well-manicured lawns and colorful flowers surround you.');
    displayText('The gardens provide a peaceful retreat from the city.');
    displayText('');
    displayText('You gain 15 Farming experience from studying the plants!');
    
    skillXP.farming += 15;
    player.experience += 15;
    checkLevelUp('farming', skillXP.farming);
    updateUI();
    
    addOption('Back to Exploring', exploreArea);
}

function visitFaladorBank() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         FALADOR BANK');
    displayText('========================================');
    displayText('');
    displayText('You enter the Falador Bank...');
    displayText('The bank is well-secured and professionally managed.');
    displayText('White Knights provide security for the bank.');
    displayText('');
    displayText('Bank services are available here.');
    displayText('');
    
    addOption('Access Bank', showBank);
    addOption('Back to Exploring', exploreArea);
}

// Al Kharid exploration functions
function exploreAlKharidPalace() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         AL KHARID PALACE');
    displayText('========================================');
    displayText('');
    displayText('You enter the magnificent Al Kharid Palace...');
    displayText('The palace is beautifully decorated with desert motifs.');
    displayText('Royal guards stand at attention in their desert armor.');
    displayText('');
    displayText('You gain 30 Defence experience from observing royal protocol!');
    
    skillXP.defence += 30;
    player.experience += 30;
    checkLevelUp('defence', skillXP.defence);
    updateUI();
    
    addOption('Back to Exploring', exploreArea);
}

function exploreAlKharidMarketplace() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         AL KHARID MARKETPLACE');
    displayText('========================================');
    displayText('');
    displayText('You explore the bustling Al Kharid marketplace...');
    displayText('Desert merchants sell exotic goods and spices.');
    displayText('The market is colorful and full of life.');
    displayText('');
    displayText('You gain 20 Crafting experience from observing trade!');
    
    skillXP.crafting += 20;
    player.experience += 20;
    checkLevelUp('crafting', skillXP.crafting);
    updateUI();
    
    addOption('Back to Exploring', exploreArea);
}

function exploreAlKharidMosque() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         AL KHARID MOSQUE');
    displayText('========================================');
    displayText('');
    displayText('You enter the peaceful Al Kharid Mosque...');
    displayText('The mosque is beautifully designed with desert architecture.');
    displayText('You feel a sense of spiritual peace and tranquility.');
    displayText('');
    displayText('You gain 25 Prayer experience from prayer and meditation!');
    
    skillXP.prayer += 25;
    player.experience += 25;
    checkLevelUp('prayer', skillXP.prayer);
    updateUI();
    
    addOption('Back to Exploring', exploreArea);
}

function exploreAlKharidTrainingGrounds() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         DESERT TRAINING GROUNDS');
    displayText('========================================');
    displayText('');
    displayText('You enter the Desert Training Grounds...');
    displayText('Warriors train in the intense desert heat.');
    displayText('The training area is adapted to the harsh desert conditions.');
    displayText('');
    displayText('You gain 35 Strength experience from observing strength training!');
    
    skillXP.strength += 35;
    player.experience += 35;
    checkLevelUp('strength', skillXP.strength);
    updateUI();
    
    addOption('Back to Exploring', exploreArea);
}

function exploreAlKharidEnduranceTrack() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         AL KHARID ENDURANCE TRACK');
    displayText('========================================');
    displayText('');
    displayText('You approach the Al Kharid Endurance Track...');
    displayText('This is a challenging desert running track that tests your stamina.');
    displayText('The track winds through sand dunes and desert terrain.');
    displayText('');
    displayText('Running this track in the desert heat will greatly improve your health!');
    displayText('');
    displayText('Track Features:');
    displayText('• Sand dune running paths');
    displayText('• Desert obstacle courses');
    displayText('• Heat resistance training');
    displayText('• Oasis rest stations');
    displayText('');
    
    addOption('Run the Track (Easy - 20 HP XP)', () => runEnduranceTrack('alkharid', 'easy'));
    addOption('Run the Track (Medium - 35 HP XP)', () => runEnduranceTrack('alkharid', 'medium'));
    addOption('Run the Track (Hard - 50 HP XP)', () => runEnduranceTrack('alkharid', 'hard'));
    addOption('Back to Exploring', exploreArea);
}

function exploreAlKharidOasis() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         AL KHARID OASIS');
    displayText('========================================');
    displayText('');
    displayText('You visit the beautiful Al Kharid Oasis...');
    displayText('Palm trees surround a crystal-clear spring.');
    displayText('The oasis provides a cool refuge from the desert heat.');
    displayText('');
    displayText('You gain 20 Farming experience from studying the oasis plants!');
    
    skillXP.farming += 20;
    player.experience += 20;
    checkLevelUp('farming', skillXP.farming);
    updateUI();
    
    addOption('Back to Exploring', exploreArea);
}

function visitAlKharidBank() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         AL KHARID BANK');
    displayText('========================================');
    displayText('');
    displayText('You enter the Al Kharid Bank...');
    displayText('The bank is designed with beautiful desert architecture.');
    displayText('Royal guards provide security for the bank.');
    displayText('');
    displayText('Bank services are available here.');
    displayText('');
    
    addOption('Access Bank', showBank);
    addOption('Back to Exploring', exploreArea);
}

// Draynor Manor exploration
function exploreDraynorManor() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         DRAYNOR MANOR');
    displayText('========================================');
    displayText('');
    displayText('You approach the imposing Draynor Manor...');
    displayText('The old mansion looms before you, its windows dark and foreboding.');
    displayText('A cold wind whispers through the trees surrounding the manor.');
    displayText('Local legends speak of strange occurrences within these walls.');
    displayText('');
    displayText('The manor has multiple levels to explore:');
    displayText('1. Ground Floor - Abandoned rooms and corridors');
    displayText('2. Upper Floor - Master bedroom and study');
    displayText('3. Lower Level - Dark basement and crypt');
    displayText('');
    
    addOption('Explore Ground Floor', exploreManorGroundFloor);
    addOption('Explore Upper Floor', exploreManorUpperFloor);
    addOption('Descend to Lower Level', exploreManorLowerLevel);
    addOption('Back to Draynor', exploreArea);
}

// Ground floor exploration
function exploreManorGroundFloor() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         MANOR GROUND FLOOR');
    displayText('========================================');
    displayText('');
    displayText('You enter the grand foyer of Draynor Manor...');
    displayText('Dust covers the elegant furniture and paintings.');
    displayText('The air is thick with the scent of old wood and decay.');
    displayText('You hear the creaking of floorboards above you.');
    displayText('');
    displayText('You explore the abandoned rooms and find:');
    displayText('• An old library with dusty books');
    displayText('• A dining room with a long table');
    displayText('• A kitchen with rusted cooking equipment');
    displayText('• Various corridors and storage rooms');
    displayText('');
    displayText('You gain 25 Crafting experience from studying the manor\'s architecture!');
    
    skillXP.crafting += 25;
    player.experience += 25;
    checkLevelUp('crafting', skillXP.crafting);
    updateUI();
    
    addOption('Explore Upper Floor', exploreManorUpperFloor);
    addOption('Descend to Lower Level', exploreManorLowerLevel);
    addOption('Back to Manor Entrance', exploreDraynorManor);
}

// Upper floor exploration
function exploreManorUpperFloor() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         MANOR UPPER FLOOR');
    displayText('========================================');
    displayText('');
    displayText('You climb the grand staircase to the upper floor...');
    displayText('The master bedroom contains an ornate four-poster bed.');
    displayText('A study holds ancient books and mysterious artifacts.');
    displayText('You find evidence of the manor\'s former inhabitants.');
    displayText('');
    displayText('You discover:');
    displayText('• A master bedroom with luxurious furnishings');
    displayText('• A study with ancient tomes and scrolls');
    displayText('• A balcony overlooking the manor grounds');
    displayText('• Various guest rooms and sitting areas');
    displayText('');
    displayText('You gain 30 Magic experience from studying the ancient texts!');
    
    skillXP.magic += 30;
    player.experience += 30;
    checkLevelUp('magic', skillXP.magic);
    updateUI();
    
    addOption('Explore Ground Floor', exploreManorGroundFloor);
    addOption('Descend to Lower Level', exploreManorLowerLevel);
    addOption('Back to Manor Entrance', exploreDraynorManor);
}

// Lower level exploration with vampire boss
function exploreManorLowerLevel() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         MANOR LOWER LEVEL');
    displayText('========================================');
    displayText('');
    displayText('You descend the stone stairs into the manor\'s lower level...');
    displayText('The air becomes cold and damp as you enter the basement.');
    displayText('Torches flicker on the walls, casting eerie shadows.');
    displayText('You hear strange sounds echoing through the corridors.');
    displayText('');
    displayText('You explore the dark basement and find:');
    displayText('• Ancient crypts and burial chambers');
    displayText('• A wine cellar with aged bottles');
    displayText('• Storage rooms filled with forgotten treasures');
    displayText('• A hidden passage leading deeper underground');
    displayText('');
    displayText('⚠️  Suddenly, you hear a deep, menacing voice... ⚠️');
    displayText('"Who dares to enter my domain?"');
    displayText('A figure emerges from the shadows - Count Draynor himself!');
    displayText('');
    displayText('The vampire lord blocks your path, his eyes glowing with hunger.');
    displayText('You must face this powerful undead creature!');
    displayText('');
    
    addOption('Fight Count Draynor', () => startManorBossFight());
    addOption('Try to Escape', attemptManorEscape);
    addOption('Back to Upper Floor', exploreManorUpperFloor);
}

// Start the vampire boss fight
function startManorBossFight() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         BOSS FIGHT: COUNT DRAYNOR');
    displayText('========================================');
    displayText('');
    displayText('Count Draynor, the Vampire Lord of Draynor Manor!');
    displayText('Level: 15 | HP: 120 | Attack: 8 | Defence: 6');
    displayText('Weapon: Vampiric Claws | Special: Life Drain');
    displayText('');
    displayText('The vampire lord lunges at you with supernatural speed!');
    displayText('His claws gleam with dark magic as he prepares to drain your life force!');
    displayText('');
    
    // Start combat with the vampire boss
    startCombat('Count Draynor', 15, 120, 8, 6, 'Vampiric Claws');
}

// Attempt to escape from the manor
function attemptManorEscape() {
    const escapeChance = Math.random();
    
    if (escapeChance < 0.6) {
        displayText('You quickly run back up the stairs and escape the manor!');
        displayText('The vampire\'s angry roar echoes behind you as you flee.');
        displayText('You gain 15 Defence experience from the narrow escape!');
        displayText('');
        
        skillXP.defence += 15;
        player.experience += 15;
        checkLevelUp('defence', skillXP.defence);
        updateUI();
        
        addOption('Back to Draynor', exploreArea);
    } else {
        displayText('Count Draynor blocks your escape route!');
        displayText('"You cannot escape me, mortal!"');
        displayText('The vampire lord forces you into combat!');
        displayText('');
        
        addOption('Fight Count Draynor', () => startManorBossFight());
    }
}

// Draynor Market exploration
function exploreDraynorMarket() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         DRAYNOR MARKET');
    displayText('========================================');
    displayText('');
    displayText('You visit the small Draynor Village Market...');
    displayText('Local farmers and craftsmen sell their wares.');
    displayText('The market has a quiet, rural atmosphere.');
    displayText('');
    displayText('You gain 10 Farming experience from observing the local produce!');
    
    skillXP.farming += 10;
    player.experience += 10;
    checkLevelUp('farming', skillXP.farming);
    updateUI();
    
    addOption('Back to Exploring', exploreArea);
}

// Draynor Church exploration
function exploreDraynorChurch() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         DRAYNOR CHURCH');
    displayText('========================================');
    displayText('');
    displayText('You enter the peaceful Draynor Church...');
    displayText('The church provides a sanctuary from the manor\'s darkness.');
    displayText('You can train your Prayer skill here.');
    displayText('');
    displayText('You gain 15 Prayer experience from the spiritual atmosphere!');
    
    skillXP.prayer += 15;
    player.experience += 15;
    checkLevelUp('prayer', skillXP.prayer);
    updateUI();
    
    addOption('Back to Exploring', exploreArea);
}

// Draynor Bank
function visitDraynorBank() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         DRAYNOR BANK');
    displayText('========================================');
    displayText('');
    displayText('You enter the Draynor Bank...');
    displayText('The bank provides secure storage for your valuables.');
    displayText('Bank services are available here.');
    displayText('');
    
    addOption('Access Bank', showBank);
    addOption('Back to Exploring', exploreArea);
}

// Dwarven Mines exploration functions
function exploreDwarvenTunnels() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         DWARVEN MINING TUNNELS');
    displayText('========================================');
    displayText('');
    displayText('You enter the rich mining tunnels of the Dwarven Mines...');
    displayText('The walls are lined with various ores and minerals.');
    displayText('You can hear the distant sound of pickaxes striking stone.');
    displayText('The tunnels are well-lit with magical torches.');
    displayText('');
    displayText('You find rich deposits of:');
    displayText('• Iron Ore - Common but valuable');
    displayText('• Coal - Essential for smithing');
    displayText('• Mithril Ore - Rare and valuable');
    displayText('• Adamantite Ore - Very rare');
    displayText('');
    displayText('You gain 40 Mining experience from the rich deposits!');
    
    skillXP.mining += 40;
    player.experience += 40;
    checkLevelUp('mining', skillXP.mining);
    updateUI();
    
    // Random chance to find rare ore
    const rareChance = Math.random();
    if (rareChance < 0.3) {
        const rareOres = ['Mithril Ore', 'Adamantite Ore', 'Coal'];
        const foundOre = rareOres[Math.floor(Math.random() * rareOres.length)];
        addItemToInventory(foundOre);
        displayText(`You found ${foundOre}!`);
    }
    
    addOption('Continue Mining', exploreDwarvenTunnels);
    addOption('Back to Mines', exploreArea);
}

function exploreDwarvenWorkshops() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         DWARVEN WORKSHOPS');
    displayText('========================================');
    displayText('');
    displayText('You explore the ancient Dwarven Workshops...');
    displayText('The workshops contain sophisticated crafting equipment.');
    displayText('Ancient blueprints and tools line the walls.');
    displayText('You can see evidence of master craftsmanship.');
    displayText('');
    displayText('You discover:');
    displayText('• Advanced crafting tools');
    displayText('• Ancient blueprints and schematics');
    displayText('• Masterwork equipment');
    displayText('• Dwarven engineering secrets');
    displayText('');
    displayText('You gain 35 Crafting experience from studying the workshops!');
    
    skillXP.crafting += 35;
    player.experience += 35;
    checkLevelUp('crafting', skillXP.crafting);
    updateUI();
    
    // Chance to find dwarven tools
    const toolChance = Math.random();
    if (toolChance < 0.4) {
        addItemToInventory('Dwarven Tools');
        displayText('You found some Dwarven Tools!');
    }
    
    addOption('Back to Mines', exploreArea);
}

function exploreDeepCaverns() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         DEEP CAVERNS');
    displayText('========================================');
    displayText('');
    displayText('You venture into the dangerous Deep Caverns...');
    displayText('The air is thick with the scent of precious metals.');
    displayText('Strange sounds echo through the dark passages.');
    displayText('This area is known for its valuable but dangerous deposits.');
    displayText('');
    displayText('⚠️  You encounter a Cave Troll! ⚠️');
    displayText('The troll guards a rich vein of precious ore.');
    displayText('You must defeat it to access the valuable minerals!');
    displayText('');
    
    addOption('Fight the Cave Troll', () => startCombat('Cave Troll', 8, 60, 6, 4, 'Stone Club'));
    addOption('Try to Sneak Past', attemptCaveSneak);
    addOption('Retreat to Safety', exploreArea);
}

function attemptCaveSneak() {
    const sneakChance = Math.random();
    
    if (sneakChance < 0.4) {
        displayText('You successfully sneak past the troll!');
        displayText('You find a rich vein of precious ore.');
        displayText('You gain 50 Mining experience and valuable minerals!');
        displayText('');
        
        skillXP.mining += 50;
        player.experience += 50;
        checkLevelUp('mining', skillXP.mining);
        
        // Find valuable ore
        const valuableOres = ['Mithril Ore', 'Adamantite Ore', 'Runite Ore'];
        const foundOre = valuableOres[Math.floor(Math.random() * valuableOres.length)];
        addItemToInventory(foundOre);
        displayText(`You found ${foundOre}!`);
        
        updateUI();
        addOption('Back to Mines', exploreArea);
    } else {
        displayText('The troll spots you!');
        displayText('It charges at you with its stone club!');
        displayText('');
        
        addOption('Fight the Cave Troll', () => startCombat('Cave Troll', 8, 60, 6, 4, 'Stone Club'));
    }
}

function useDwarvenForge() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         DWARVEN FORGE');
    displayText('========================================');
    displayText('');
    displayText('You approach the ancient Dwarven Forge...');
    displayText('The forge burns with magical blue flames.');
    displayText('You can feel the heat and power of the ancient smithing equipment.');
    displayText('This is where the dwarves created their legendary weapons.');
    displayText('');
    displayText('You can use the forge to:');
    displayText('• Smelt ores into bars');
    displayText('• Craft weapons and armor');
    displayText('• Study ancient smithing techniques');
    displayText('');
    displayText('You gain 30 Smithing experience from the forge!');
    
    skillXP.smithing += 30;
    player.experience += 30;
    checkLevelUp('smithing', skillXP.smithing);
    updateUI();
    
    addOption('Back to Mines', exploreArea);
}

function searchCrystalCaves() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         CRYSTAL CAVES');
    displayText('========================================');
    displayText('');
    displayText('You enter the beautiful Crystal Caves...');
    displayText('The walls sparkle with precious gems and crystals.');
    displayText('The air shimmers with magical energy.');
    displayText('This is where the rarest gems are found.');
    displayText('');
    displayText('You search for precious gems and find:');
    displayText('• Sapphires - Beautiful blue gems');
    displayText('• Emeralds - Valuable green stones');
    displayText('• Rubies - Precious red crystals');
    displayText('• Diamonds - The rarest of all');
    displayText('');
    displayText('You gain 45 Crafting experience from gem cutting!');
    
    skillXP.crafting += 45;
    player.experience += 45;
    checkLevelUp('crafting', skillXP.crafting);
    updateUI();
    
    // Chance to find precious gems
    const gemChance = Math.random();
    if (gemChance < 0.5) {
        const gems = ['Sapphire', 'Emerald', 'Ruby', 'Diamond'];
        const foundGem = gems[Math.floor(Math.random() * gems.length)];
        addItemToInventory(foundGem);
        displayText(`You found a ${foundGem}!`);
    }
    
    addOption('Continue Searching', searchCrystalCaves);
    addOption('Back to Mines', exploreArea);
}

// Wolf Mountain exploration functions
function exploreMountainPass() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         MOUNTAIN PASS');
    displayText('========================================');
    displayText('');
    displayText('You traverse the rocky mountain pass...');
    displayText('The wind howls through the narrow passage.');
    displayText('You can see wolf tracks in the snow and mud.');
    displayText('The terrain is treacherous but passable.');
    displayText('');
    displayText('You gain 25 Defence experience from navigating the difficult terrain!');
    
    skillXP.defence += 25;
    player.experience += 25;
    checkLevelUp('defence', skillXP.defence);
    updateUI();
    
    // Chance to encounter a lone wolf
    const wolfChance = Math.random();
    if (wolfChance < 0.4) {
        displayText('');
        displayText('⚠️  A lone wolf appears from behind the rocks! ⚠️');
        displayText('The wolf snarls and prepares to attack!');
        displayText('');
        
        addOption('Fight the Wolf', () => startCombat('Mountain Wolf', 5, 35, 4, 2, 'Sharp Fangs'));
        addOption('Try to Run', attemptWolfEscape);
    } else {
        addOption('Continue Exploring', exploreMountainPass);
        addOption('Back to Mountain', exploreArea);
    }
}

function attemptWolfEscape() {
    const escapeChance = Math.random();
    
    if (escapeChance < 0.6) {
        displayText('You successfully escape from the wolf!');
        displayText('You run back to safer ground.');
        displayText('');
        addOption('Back to Mountain', exploreArea);
    } else {
        displayText('The wolf catches up to you!');
        displayText('You must fight!');
        displayText('');
        
        addOption('Fight the Wolf', () => startCombat('Mountain Wolf', 5, 35, 4, 2, 'Sharp Fangs'));
    }
}

function visitDwarvenCave() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         DWARVEN CAVE ENTRANCE');
    displayText('========================================');
    displayText('');
    displayText('You approach the entrance to a dwarven cave...');
    displayText('Two dwarven guards stand watch at the entrance.');
    displayText('They look concerned and are discussing something.');
    displayText('');
    
    if (quests.wolfCulling === 0) {
        displayText('One of the dwarves notices you and approaches.');
        displayText('"Greetings, traveler! We have a problem that needs solving."');
        displayText('"A pack of wolves has been harassing our cave entrance."');
        displayText('"They\'re making it dangerous for our miners to come and go."');
        displayText('"Could you help us by culling the wolf pack?"');
        displayText('');
        displayText('"We\'ll reward you with 100 coins and some valuable items."');
        displayText('');
        
        addOption('Accept the Quest', startWolfCullingQuest);
        addOption('Ask for More Details', askWolfQuestDetails);
        addOption('Decline for Now', exploreArea);
    } else if (quests.wolfCulling === 1) {
        displayText('"Have you dealt with those troublesome wolves yet?"');
        displayText('"We need 5 wolf pelts as proof of your work."');
        displayText('');
        
        if (getItemQuantity('Wolf Pelt') >= 5) {
            addOption('Turn in Wolf Pelts', completeWolfCullingQuest);
        } else {
            displayText(`You have ${getItemQuantity('Wolf Pelt')} wolf pelts. You need 5.`);
            addOption('Continue Hunting', exploreArea);
        }
    } else {
        displayText('"Thank you again for helping us with the wolf problem!"');
        displayText('"Our miners can now work in peace."');
        displayText('');
        addOption('Back to Mountain', exploreArea);
    }
}

function askWolfQuestDetails() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         QUEST DETAILS');
    displayText('========================================');
    displayText('');
    displayText('The dwarf explains the situation:');
    displayText('');
    displayText('"The wolf pack has been growing bolder lately."');
    displayText('"They\'ve been attacking our miners and blocking the cave entrance."');
    displayText('"We need you to hunt down the wolves and bring us 5 wolf pelts."');
    displayText('');
    displayText('"The wolves can be found in the wolf dens and mountain pass."');
    displayText('"Be careful - they\'re dangerous in packs!"');
    displayText('');
    displayText('"Rewards: 100 coins, Dwarven Steel, and Mountain Climbing Gear"');
    displayText('');
    
    addOption('Accept the Quest', startWolfCullingQuest);
    addOption('Back to Dwarves', visitDwarvenCave);
}

function startWolfCullingQuest() {
    quests.wolfCulling = 1;
    displayText('');
    displayText('"Excellent! We knew we could count on you."');
    displayText('"Bring us 5 wolf pelts and we\'ll reward you handsomely."');
    displayText('"Good luck, and watch out for the alpha wolf!"');
    displayText('');
    displayText('*** QUEST STARTED: Culling the Wolf Pack ***');
    displayText('');
    
    addOption('Back to Mountain', exploreArea);
}

function completeWolfCullingQuest() {
    quests.wolfCulling = 2;
    removeItemFromInventory('Wolf Pelt', 5);
    
    displayText('');
    displayText('"Wonderful! You\'ve done it!"');
    displayText('"The wolf pack has been dealt with."');
    displayText('"Here\'s your reward as promised."');
    displayText('');
    displayText('*** QUEST COMPLETED: Culling the Wolf Pack ***');
    displayText('You receive: 100 coins, Dwarven Steel, Mountain Climbing Gear');
    displayText('');
    
    // Give rewards
    player.coins += 100;
    addItemToInventory('Dwarven Steel');
    addItemToInventory('Mountain Climbing Gear');
    
    // Give experience
    skillXP.attack += 50;
    skillXP.strength += 40;
    skillXP.defence += 30;
    player.experience += 120;
    
    checkLevelUp('attack', skillXP.attack);
    checkLevelUp('strength', skillXP.strength);
    checkLevelUp('defence', skillXP.defence);
    
    updateUI();
    
    addOption('Back to Mountain', exploreArea);
}

function searchWolfDens() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         WOLF DENS');
    displayText('========================================');
    displayText('');
    displayText('You approach the dangerous wolf dens...');
    displayText('The air is thick with the scent of wolves.');
    displayText('You can hear growling and howling in the distance.');
    displayText('This is the heart of the wolf pack territory.');
    displayText('');
    
    if (quests.wolfCulling === 1) {
        displayText('⚠️  A pack of wolves emerges from the dens! ⚠️');
        displayText('The alpha wolf leads the pack with fierce determination.');
        displayText('You must fight the entire wolf pack!');
        displayText('');
        
        addOption('Fight the Wolf Pack', () => startCombat('Wolf Pack', 7, 80, 6, 3, 'Pack Tactics'));
        addOption('Try to Escape', attemptPackEscape);
    } else {
        displayText('The wolf dens are quiet now.');
        displayText('You can explore the area safely.');
        displayText('');
        displayText('You gain 20 Defence experience from exploring the dens.');
        
        skillXP.defence += 20;
        player.experience += 20;
        checkLevelUp('defence', skillXP.defence);
        updateUI();
        
        addOption('Back to Mountain', exploreArea);
    }
}

function attemptPackEscape() {
    const escapeChance = Math.random();
    
    if (escapeChance < 0.3) { // Lower chance due to pack
        displayText('You miraculously escape from the wolf pack!');
        displayText('You run back to safer ground.');
        displayText('');
        addOption('Back to Mountain', exploreArea);
    } else {
        displayText('The wolf pack surrounds you!');
        displayText('There\'s no escape - you must fight!');
        displayText('');
        
        addOption('Fight the Wolf Pack', () => startCombat('Wolf Pack', 7, 80, 6, 3, 'Pack Tactics'));
    }
}

function climbMountainPeak() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         MOUNTAIN PEAK');
    displayText('========================================');
    displayText('');
    displayText('You climb to the highest peak of Wolf Mountain...');
    displayText('The view is breathtaking from this altitude.');
    displayText('You can see for miles in every direction.');
    displayText('The thin air makes breathing difficult.');
    displayText('');
    displayText('You gain 30 Defence experience from the challenging climb!');
    
    skillXP.defence += 30;
    player.experience += 30;
    checkLevelUp('defence', skillXP.defence);
    updateUI();
    
    // Chance to find rare mountain items
    const rareChance = Math.random();
    if (rareChance < 0.3) {
        const rareItems = ['Mountain Crystal', 'Eagle Feather', 'Alpine Herb'];
        const foundItem = rareItems[Math.floor(Math.random() * rareItems.length)];
        addItemToInventory(foundItem);
        displayText(`You found a ${foundItem}!`);
    }
    
    addOption('Continue Climbing', climbMountainPeak);
    addOption('Back to Mountain', exploreArea);
}

// Endurance track running function
function runEnduranceTrack(location, difficulty) {
    clearOutput();
    clearOptions();
    
    const trackNames = {
        'falador': 'Falador',
        'alkharid': 'Al Kharid'
    };
    
    const difficultyNames = {
        'easy': 'Easy',
        'medium': 'Medium',
        'hard': 'Hard'
    };
    
    const xpRewards = {
        'falador': { easy: 15, medium: 25, hard: 40 },
        'alkharid': { easy: 20, medium: 35, hard: 50 }
    };
    
    const xpGain = xpRewards[location][difficulty];
    
    displayText('========================================');
    displayText(`         ${trackNames[location]} ENDURANCE TRACK`);
    displayText('========================================');
    displayText('');
    displayText(`You begin running the ${difficultyNames[difficulty]} track...`);
    displayText('');
    
    if (location === 'falador') {
        displayText('You run through the well-maintained paths of Falador...');
        displayText('The cool breeze and clean air invigorate you.');
        displayText('You navigate through obstacle courses and training stations.');
        displayText('The track is challenging but enjoyable.');
    } else if (location === 'alkharid') {
        displayText('You run through the challenging desert terrain...');
        displayText('The intense heat tests your endurance and stamina.');
        displayText('You climb sand dunes and navigate desert obstacles.');
        displayText('The harsh conditions make this a true test of health.');
    }
    
    displayText('');
    displayText('🏃‍♂️ Running... 🏃‍♂️');
    displayText('');
    displayText('Get ready to jump over obstacles!');
    displayText('');
    
    // Start the interactive minigame
    startEnduranceMinigame(location, difficulty, xpGain);
}

// Port Sarim specific functions
function explorePortDocks() {
	clearOutput();
	clearOptions();
	
	displayText('========================================');
	displayText('         PORT DOCKS');
	displayText('========================================');
	displayText('');
	displayText('You walk along the bustling docks of Port Sarim.');
	displayText('Sailors load and unload cargo from various ships.');
	displayText('The salty sea air fills your lungs.');
	displayText('');
	displayText('You see several ships at dock:');
	displayText('• Merchant vessels carrying goods');
	displayText('• Fishing boats returning with their catch');
	displayText('• Naval ships preparing for patrol');
	displayText('');
	
    addOption('Talk to Sailors', () => {
        displayText('You chat with some weathered sailors.');
        displayText('They tell tales of distant lands and sea monsters.');
        const awarded = awardCappedXP('portsarim_docks_talk', 'fishing', 5);
        if (awarded > 0) displayText(`You learn about maritime navigation (+${awarded} Fishing XP)`);
        addOption('Continue', explorePortDocks);
    });
	
    addOption('Look for Work', () => {
		displayText('You ask around for maritime work.');
		if (Math.random() < 0.6) {
			const coins = 20 + Math.floor(Math.random() * 30);
			player.coins += coins;
			displayText(`You find work loading cargo and earn ${coins} coins!`);
            const s = awardCappedXP('portsarim_docks_work', 'strength', 3);
            if (s > 0) displayText(`You also gain some strength from the heavy lifting (+${s} Strength XP)`);
		} else {
			displayText('No work is available right now.');
		}
		addOption('Continue', explorePortDocks);
	});

    addOption('Fish at the Docks', fishAtPortDocks);
	
    addOption('Back to Port Sarim', exploreArea);
}

function exploreSailorsTavern() {
	clearOutput();
	clearOptions();
	
	displayText('========================================');
	displayText('         SAILOR\'S TAVERN');
	displayText('========================================');
	displayText('');
	displayText('You enter the Sailor\'s Tavern, a lively establishment.');
	displayText('The air is thick with the smell of ale and sea stories.');
	displayText('Rough sailors laugh and share tales of adventure.');
	displayText('');
	
    addOption('Buy a Drink (15g)', () => {
		if (player.coins >= 15) {
			player.coins -= 15;
			displayText('You buy a mug of ale and listen to sea stories.');
            const p = awardCappedXP('portsarim_tavern_drink', 'prayer', 2);
            if (p > 0) displayText(`You feel more relaxed and gain some wisdom. (+${p} Prayer XP)`);
		} else {
			displayText('You don\'t have enough coins for a drink.');
		}
		addOption('Continue', exploreSailorsTavern);
	});
	
    addOption('Listen to Stories', () => {
		displayText('You listen intently to the sailors\' tales.');
		displayText('You learn about distant ports and sea routes.');
        const c = awardCappedXP('portsarim_tavern_listen', 'crafting', 3);
        if (c > 0) displayText(`Your knowledge of maritime life expands (+${c} Crafting XP)`);
		addOption('Continue', exploreSailorsTavern);
	});
	
	addOption('Play Dice (10g)', () => {
		if (player.coins >= 10) {
			const bet = 10;
			player.coins -= bet;
			if (Math.random() < 0.4) {
				const winnings = bet * 2;
				player.coins += winnings;
				displayText(`You win ${winnings} coins!`);
			} else {
				displayText('You lose your bet.');
			}
			updateUI();
		} else {
			displayText('You need at least 10 coins to play.');
		}
		addOption('Continue', exploreSailorsTavern);
	});
	
	addOption('Back to Port Sarim', exploreArea);
}

function exploreShipyard() {
	clearOutput();
	clearOptions();
	
	displayText('========================================');
	displayText('         SHIPYARD');
	displayText('========================================');
	displayText('');
	displayText('You enter the busy shipyard where vessels are built and repaired.');
	displayText('Skilled craftsmen work on wooden hulls and rigging.');
	displayText('The sound of hammering and sawing fills the air.');
	displayText('');
	
    addOption('Watch Shipbuilding', () => {
		displayText('You observe the skilled shipwrights at work.');
		displayText('You learn about woodworking and maritime construction.');
        const c = awardCappedXP('portsarim_shipyard_watch_craft', 'crafting', 5);
        const s = awardCappedXP('portsarim_shipyard_watch_smith', 'smithing', 3);
        if (c + s > 0) displayText(`(+${c} Crafting XP, +${s} Smithing XP)`);
		addOption('Continue', exploreShipyard);
	});
	
    addOption('Offer to Help', () => {
		if (player.strength >= 5) {
			displayText('You offer to help with heavy lifting and manual labor.');
			displayText('The shipwrights appreciate your assistance.');
			const coins = 15 + Math.floor(Math.random() * 20);
			player.coins += coins;
			displayText(`You earn ${coins} coins for your work!`);
            const s = awardCappedXP('portsarim_shipyard_help', 'strength', 5);
            if (s > 0) displayText(`(+${s} Strength XP)`);
		} else {
			displayText('You need Strength level 5 to help with shipbuilding.');
		}
		addOption('Continue', exploreShipyard);
	});
	
	addOption('Buy Ship Supplies', () => {
		displayText('You browse the shipbuilding supplies.');
		displayText('Available items: Rope (25g), Tar (15g), Sail Cloth (30g)');
		displayText('These items are also available at the local shop.');
		addOption('Continue', exploreShipyard);
	});
	
	addOption('Back to Port Sarim', exploreArea);
}

function exploreFishMarket() {
	clearOutput();
	clearOptions();
	
	displayText('========================================');
	displayText('         FISH MARKET');
	displayText('========================================');
	displayText('');
	displayText('You visit the bustling fish market.');
	displayText('Fresh catches from the morning\'s fishing trips are on display.');
	displayText('The smell of the sea and fresh fish fills the air.');
	displayText('');
	
	addOption('Buy Fresh Fish', () => {
		const fishOptions = [
			{ name: 'Fresh Sardine', price: 25, xp: 5 },
			{ name: 'Fresh Herring', price: 30, xp: 7 },
			{ name: 'Fresh Lobster', price: 60, xp: 12 },
			{ name: 'Fresh Crab', price: 45, xp: 10 }
		];
		
		displayText('Available fresh fish:');
		fishOptions.forEach((fish, index) => {
			displayText(`${index + 1}. ${fish.name} - ${fish.price} coins`);
		});
		
		// Simple random selection for now
		const selectedFish = fishOptions[Math.floor(Math.random() * fishOptions.length)];
		if (player.coins >= selectedFish.price) {
			player.coins -= selectedFish.price;
			addItemToInventory(selectedFish.name);
			displayText(`You buy ${selectedFish.name} for ${selectedFish.price} coins.`);
			displayText('(+5 Fishing XP)');
			skillXP.fishing += 5;
			player.experience += 5;
			checkLevelUp('fishing', skillXP.fishing);
			updateUI();
		} else {
			displayText(`You need ${selectedFish.price} coins to buy ${selectedFish.name}.`);
		}
		addOption('Continue', exploreFishMarket);
	});
	
	addOption('Sell Your Catch', () => {
		const fishItems = player.inventory.filter(item => 
			['Raw Sardine', 'Raw Herring', 'Raw Lobster', 'Raw Crab', 'Raw Shark'].includes(item.name)
		);
		
		if (fishItems.length > 0) {
			const fish = fishItems[0];
			const sellPrice = fish.name === 'Raw Shark' ? 80 : 
							 fish.name === 'Raw Lobster' ? 50 :
							 fish.name === 'Raw Crab' ? 35 :
							 fish.name === 'Raw Herring' ? 20 : 15;
			
			player.coins += sellPrice;
			removeItemFromInventory(fish.name);
			displayText(`You sell ${fish.name} for ${sellPrice} coins.`);
			updateUI();
		} else {
			displayText('You don\'t have any fish to sell.');
		}
		addOption('Continue', exploreFishMarket);
	});
	
	addOption('Learn Fishing Tips', () => {
		displayText('You talk to experienced fishermen about their techniques.');
		displayText('You learn about different fishing spots and bait.');
		displayText('(+8 Fishing XP)');
		skillXP.fishing += 8;
		player.experience += 8;
		checkLevelUp('fishing', skillXP.fishing);
		updateUI();
		addOption('Continue', exploreFishMarket);
	});
	
	addOption('Back to Port Sarim', exploreArea);
}

function exploreLighthouse() {
	clearOutput();
	clearOptions();
	
	displayText('========================================');
	displayText('         LIGHTHOUSE');
	displayText('========================================');
	displayText('');
	displayText('You climb the tall lighthouse overlooking Port Sarim.');
	displayText('From this height, you can see ships approaching from miles away.');
	displayText('The lighthouse keeper tends to the beacon that guides sailors.');
	displayText('');
	
    addOption('Talk to Lighthouse Keeper', () => {
		displayText('You speak with the lighthouse keeper.');
		displayText('\"Welcome to Port Sarim\'s lighthouse,\" he says.');
		displayText('\"I\'ve been guiding ships safely to port for 20 years.\"');
		displayText('\"The beacon must never go out, or ships could run aground.\"');
		displayText('You learn about maritime safety and navigation.');
        const p = awardCappedXP('portsarim_lighthouse_keeper_p', 'prayer', 5);
        const c = awardCappedXP('portsarim_lighthouse_keeper_c', 'crafting', 3);
        if (p + c > 0) displayText(`(+${p} Prayer XP, +${c} Crafting XP)`);
		addOption('Continue', exploreLighthouse);
	});
	
    addOption('Help Maintain the Lighthouse', () => {
		if (player.crafting >= 3) {
			displayText('You offer to help maintain the lighthouse.');
			displayText('You clean the lens and check the beacon mechanism.');
			displayText('The keeper appreciates your help.');
			const coins = 20 + Math.floor(Math.random() * 15);
			player.coins += coins;
			displayText(`You earn ${coins} coins for your assistance!`);
            const c = awardCappedXP('portsarim_lighthouse_help', 'crafting', 4);
            if (c > 0) displayText(`(+${c} Crafting XP)`);
		} else {
			displayText('You need Crafting level 3 to help maintain the lighthouse.');
		}
		addOption('Continue', exploreLighthouse);
	});
	
    addOption('Enjoy the View', () => {
		displayText('You take in the magnificent view from the lighthouse.');
		displayText('You can see the entire port and ships on the horizon.');
		displayText('The peaceful scene calms your mind.');
        const p = awardCappedXP('portsarim_lighthouse_view', 'prayer', 2);
        if (p > 0) displayText(`(+${p} Prayer XP)`);
		addOption('Continue', exploreLighthouse);
	});
	
	addOption('Back to Port Sarim', exploreArea);
}

function explorePortAuthority() {
	clearOutput();
	clearOptions();
	
	displayText('========================================');
	displayText('         PORT AUTHORITY OFFICE');
	displayText('========================================');
	displayText('');
	displayText('You enter the official Port Authority building.');
	displayText('Clerks process shipping manifests and port fees.');
	displayText('This is where all maritime business is conducted.');
	displayText('');
	
    addOption('Apply for Work Permit (50g)', () => {
		if (player.coins >= 50) {
			player.coins -= 50;
			displayText('You apply for a maritime work permit.');
			displayText('The clerk processes your application.');
			displayText('You are now authorized to work on ships!');
            const c = awardCappedXP('portsarim_permit', 'crafting', 3);
            if (c > 0) displayText(`(+${c} Crafting XP)`);
		} else {
			displayText('You need 50 coins to apply for a work permit.');
		}
		addOption('Continue', explorePortAuthority);
	});
	
    addOption('Check Shipping Schedules', () => {
		displayText('You check the shipping schedules.');
		displayText('You learn about upcoming voyages and trade routes.');
		displayText('This knowledge could be useful for future adventures.');
        const c = awardCappedXP('portsarim_schedules', 'crafting', 4);
        if (c > 0) displayText(`(+${c} Crafting XP)`);
		addOption('Continue', explorePortAuthority);
	});
	
    addOption('Report Maritime Issues', () => {
		displayText('You speak with port officials about maritime concerns.');
		displayText('They appreciate citizens who help maintain port safety.');
		displayText('You gain recognition in the community.');
        const p = awardCappedXP('portsarim_report', 'prayer', 3);
        if (p > 0) displayText(`(+${p} Prayer XP)`);
		addOption('Continue', explorePortAuthority);
	});
	
	addOption('Back to Port Sarim', exploreArea);
}

function exploreSeafarersGuild() {
	clearOutput();
	clearOptions();
	
	displayText('========================================');
	displayText('         SEAFARER\'S GUILD');
	displayText('========================================');
	displayText('');
	displayText('You enter the Seafarer\'s Guild, a prestigious organization.');
	displayText('Experienced sailors and navigators gather here.');
	displayText('This is where maritime skills are taught and honed.');
	displayText('');
	
    addOption('Take Navigation Course (100g)', () => {
		if (player.coins >= 100) {
			player.coins -= 100;
			displayText('You enroll in an advanced navigation course.');
			displayText('You learn about celestial navigation and sea charts.');
			displayText('Your maritime knowledge greatly improves!');
            const c = awardCappedXP('portsarim_nav_course_c', 'crafting', 15, 50);
            const p = awardCappedXP('portsarim_nav_course_p', 'prayer', 10, 50);
            if (c + p > 0) displayText(`(+${c} Crafting XP, +${p} Prayer XP)`);
		} else {
			displayText('You need 100 coins to take the navigation course.');
		}
		addOption('Continue', exploreSeafarersGuild);
	});
	
	addOption('Learn Knot Tying', () => {
		displayText('You learn various maritime knots and rope work.');
		displayText('These skills are essential for any sailor.');
		displayText('(+8 Crafting XP)');
		skillXP.crafting += 8;
		player.experience += 8;
		checkLevelUp('crafting', skillXP.crafting);
		updateUI();
		addOption('Continue', exploreSeafarersGuild);
	});
	
	addOption('Study Maritime Law', () => {
		displayText('You study maritime law and shipping regulations.');
		displayText('This knowledge helps you understand port operations.');
		displayText('(+6 Prayer XP)');
		skillXP.prayer += 6;
		player.experience += 6;
		checkLevelUp('prayer', skillXP.prayer);
		updateUI();
		addOption('Continue', exploreSeafarersGuild);
	});
	
	addOption('Back to Port Sarim', exploreArea);
}

function visitPortSarimBank() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         PORT SARIM BANK');
    displayText('========================================');
    displayText('');
    displayText('You enter the Port Sarim Bank, a secure facility.');
    displayText('This bank specializes in maritime trade and shipping.');
    displayText('Sailors and merchants store their valuables here.');
    displayText('');
    
    addOption('Deposit Items', bankDeposit);
    addOption('Withdraw Items', bankWithdraw);
    addOption('View Bank Contents', bankView);
    addOption('Bank Settings', bankPinSettings);
    addOption('Back to Port Sarim', exploreArea);
}

// Taverley specific functions
function visitTwoHandedShop() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         TWO-HANDED WEAPONS SHOP');
    displayText('========================================');
    displayText('');
    displayText('You enter a shop specializing in massive two-handed weapons.');
    displayText('The shopkeeper, a burly dwarf, greets you warmly.');
    displayText('"Welcome! We\'ve got the biggest swords this side of Falador!"');
    displayText('');
    
    const shopTypes = ['general', 'twohanded', 'druid'];
    shopTypes.forEach(shopType => {
        const items = shopItems.TAVERLEY[shopType];
        if (items && items.length > 0) {
            displayText(`--- ${shopType.toUpperCase()} ---`);
            items.forEach(item => {
                displayText(`${item.name} - ${item.price} coins`);
            });
            displayText('');
        }
    });
    
    addOption('Buy General Items', () => visitSpecificShop('general'));
    addOption('Buy Two-Handed Weapons', () => visitSpecificShop('twohanded'));
    addOption('Buy Druid Equipment', () => visitSpecificShop('druid'));
    addOption('Back to Taverley', exploreArea);
}

function fishAtTaverleyLake() {
    clearOutput();
    clearOptions();
    
    const hasRod = hasItem('Fishing Rod');
    const hasNet = hasItem('Net') || hasItem('Fishing Net');
    const hasHarpoon = hasItem('Harpoon');
    
    if (!hasRod && !hasNet && !hasHarpoon) {
        displayText('You need a Fishing Rod, Net, or Harpoon to fish here.');
        addOption('Back to Taverley', exploreArea);
        return;
    }
    
    displayText('========================================');
    displayText('         TAVERLEY LAKE');
    displayText('========================================');
    displayText('');
    displayText('You cast your line into the crystal-clear waters of Taverley Lake.');
    displayText('The lake is known for its excellent fishing.');
    displayText('');
    
    let catchItem = '';
    let xpGain = 0;
    let rarity = '';
    
    if (hasNet) {
        // Net fishing: mackerel
        catchItem = 'Raw Mackerel';
        xpGain = 12;
        rarity = 'common';
    } else if (hasRod) {
        // Rod fishing: cod, bass
        const rodCatch = Math.random() < 0.7 ? 'Raw Cod' : 'Raw Bass';
        catchItem = rodCatch;
        xpGain = rodCatch === 'Raw Cod' ? 18 : 25;
        rarity = 'common';
    }
    
    // Rare shark catch (5% chance with any method)
    if (Math.random() < 0.05) {
        catchItem = 'Raw Shark';
        xpGain = 50;
        rarity = 'rare';
    }
    
    if (catchItem) {
        addItemToInventory(catchItem);
        const awarded = awardCappedXP('taverley_fishing', 'fishing', xpGain, 100);
        
        if (rarity === 'rare') {
            displayText(`🎉 RARE CATCH! You hook a massive ${catchItem}! 🎉`);
            displayText(`The fish puts up an incredible fight! (+${awarded} Fishing XP)`);
        } else {
            displayText(`You catch a ${catchItem}! (+${awarded} Fishing XP)`);
        }
        updateUI();
    } else {
        displayText('You don\'t get a bite this time.');
    }
    
    addOption('Fish Again', fishAtTaverleyLake);
    addOption('Back to Taverley', exploreArea);
}

function exploreDruidsCircle() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         DRUIDS\' CIRCLE');
    displayText('========================================');
    displayText('');
    displayText('You approach the ancient stone circle of Taverley.');
    displayText('Moss-covered stones stand in perfect alignment.');
    displayText('In the center sits a weathered altar dedicated to Guthix.');
    displayText('');
    displayText('A druid approaches you, his robes slightly askew.');
    displayText('"Welcome, traveler. You seek the wisdom of Guthix?"');
    displayText('"Well, you\'ve come to the right place... sort of."');
    displayText('');
    
    addOption('Ask About Guthix', () => {
        displayText('The druid scratches his beard thoughtfully.');
        displayText('"Ah yes, Guthix. The god of balance, nature, and... uh..."');
        displayText('"Well, he\'s supposed to be sleeping, but honestly,"');
        displayText('"I think he\'s just really good at avoiding paperwork."');
        displayText('"Last time we tried to contact him, he sent back a note"');
        displayText('"saying \'Do not disturb - having a really good nap.\'"');
        displayText('');
        displayText('You learn about the complexities of divine bureaucracy.');
        const p = awardCappedXP('taverley_guthix_lore', 'prayer', 8);
        if (p > 0) displayText(`(+${p} Prayer XP)`);
        addOption('Continue', exploreDruidsCircle);
    });
    
    addOption('Pray at Altar', () => {
        displayText('You kneel before the altar of Guthix.');
        displayText('You feel... well, not much actually.');
        displayText('The altar seems to be in "maintenance mode."');
        displayText('A small sign reads: "Altar temporarily out of order."');
        displayText('"Sorry about that," the druid says sheepishly.');
        displayText('"We\'re waiting for a divine technician to fix it."');
        displayText('');
        displayText('You gain some spiritual insight anyway.');
        const p = awardCappedXP('taverley_altar_pray', 'prayer', 5);
        if (p > 0) displayText(`(+${p} Prayer XP)`);
        addOption('Continue', exploreDruidsCircle);
    });
    
    addOption('Learn Druidic Ways', () => {
        displayText('The druid teaches you about nature magic.');
        displayText('"You see, the key to druidic magic is..."');
        displayText('"Actually, let me check my notes."');
        displayText('*rustles through scrolls*');
        displayText('"Ah yes! The key is to... um... be one with nature?"');
        displayText('"Look, I\'m still learning this myself."');
        displayText('"The last druid left me a sticky note that just says"');
        displayText('"\'Remember: trees are friends, not food.\'"');
        displayText('');
        displayText('You gain some understanding of natural magic.');
        const c = awardCappedXP('taverley_druid_magic', 'crafting', 6);
        if (c > 0) displayText(`(+${c} Crafting XP)`);
        addOption('Continue', exploreDruidsCircle);
    });
    
    addOption('Back to Taverley', exploreArea);
}

function visitTaverleyBank() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         TAVERLEY BANK');
    displayText('========================================');
    displayText('');
    displayText('You enter the Taverley Bank, a rustic building.');
    displayText('The bank clerk, wearing druidic robes, greets you.');
    displayText('"Welcome! Your valuables are safe with us."');
    displayText('"We keep them in harmony with nature... in vaults."');
    displayText('');
    
    addOption('Deposit Items', bankDeposit);
    addOption('Withdraw Items', bankWithdraw);
    addOption('View Bank Contents', bankView);
    addOption('Bank Settings', bankPinSettings);
    addOption('Back to Taverley', exploreArea);
}

function visitBurthorpeBank() {
    clearOutput();
    clearOptions();
    
    displayText('========================================');
    displayText('         BURTHORPE BANK');
    displayText('========================================');
    displayText('');
    displayText('You enter the Burthorpe Bank.');
    
    addOption('Deposit Items', bankDeposit);
    addOption('Withdraw Items', bankWithdraw);
    addOption('View Bank Contents', bankView);
    addOption('Bank Settings', bankPinSettings);
    addOption('Back to Burthorpe', exploreArea);
}

// Rimmington Mine (near Port Sarim)
function exploreRimmingtonMine() {
	clearOutput();
	clearOptions();
	
	displayText('========================================');
	displayText('         RIMMINGTON MINE');
	displayText('========================================');
	displayText('');
	displayText('You arrive at the Rimmington Mine, southwest of Port Sarim.');
	displayText('Rocky outcrops reveal veins of useful ores.');
	displayText('');
	displayText('Available rocks:');
	displayText('• Copper (Lv 1)');
	displayText('• Tin (Lv 1)');
	displayText('• Iron (Lv 15)');
	displayText('• Gold (Lv 40)');
	displayText('');

	addOption('Mine Copper Ore', () => attemptMineOre('Copper Ore', 1, 15));
	addOption('Mine Tin Ore', () => attemptMineOre('Tin Ore', 1, 15));
	addOption('Mine Iron Ore', () => attemptMineOre('Iron Ore', 15, 25));
	addOption('Mine Gold Ore', () => attemptMineOre('Gold Ore', 40, 45));
	addOption('Back to Port Sarim', exploreArea);
}

function attemptMineOre(oreName, levelReq, xpGain) {
	clearOutput();
	clearOptions();
	
	if (!hasItem('Pickaxe')) {
		displayText('You need a Pickaxe to mine ores.');
		addOption('Back to Rimmington Mine', exploreRimmingtonMine);
		return;
	}
	if (player.mining < levelReq) {
		displayText(`You need Mining level ${levelReq} to mine ${oreName}.`);
		addOption('Back to Rimmington Mine', exploreRimmingtonMine);
		return;
	}

	displayText(`You swing your pickaxe at the ${oreName} rock...`);
	const success = Math.random() < 0.8; // 80% base success at req level
	if (success) {
		addItemToInventory(oreName);
		const awarded = awardCappedXP(`rimmington_${oreName.replace(/\s+/g,'_')}`,'mining', xpGain, 80);
		displayText(`You mine some ${oreName}! (+${awarded} Mining XP)`);
		updateUI();
	} else {
		displayText('Your pickaxe strikes sparks but fails to dislodge any ore.');
	}
	addOption('Mine again', () => attemptMineOre(oreName, levelReq, xpGain));
	addOption('Back to Rimmington Mine', exploreRimmingtonMine);
}

// Interactive endurance track minigame
function startEnduranceMinigame(location, difficulty, baseXpGain) {
    let gameState = {
        playerPosition: 0,
        obstacles: [],
        score: 0,
        lives: 3,
        gameRunning: true,
        trackLength: difficulty === 'easy' ? 20 : difficulty === 'medium' ? 30 : 40,
        obstacleFrequency: difficulty === 'easy' ? 0.3 : difficulty === 'medium' ? 0.5 : 0.7
    };
    
    // Generate obstacles based on difficulty
    for (let i = 0; i < gameState.trackLength; i++) {
        if (Math.random() < gameState.obstacleFrequency) {
            gameState.obstacles.push({
                position: i,
                type: Math.random() < 0.5 ? 'rock' : 'log',
                height: Math.random() < 0.3 ? 'high' : 'low'
            });
        }
    }
    
    function renderTrack() {
        clearOutput();
        clearOptions();
        
        displayText('========================================');
        displayText(`         ${location === 'falador' ? 'FALADOR' : 'AL KHARID'} ENDURANCE TRACK`);
        displayText('========================================');
        displayText('');
        displayText(`🏃‍♂️ Progress: ${gameState.playerPosition}/${gameState.trackLength} | Score: ${gameState.score} | Lives: ${'❤️'.repeat(gameState.lives)}`);
        displayText('');
        
        // Render the track with ASCII art
        const trackWidth = 20;
        const trackHeight = 5;
        
        for (let row = 0; row < trackHeight; row++) {
            let trackLine = '';
            for (let col = 0; col < trackWidth; col++) {
                const worldPos = gameState.playerPosition + col - 10; // Center view on player
                
                if (worldPos === gameState.playerPosition && row === 2) {
                    trackLine += '🏃‍♂️'; // Player
                } else if (worldPos >= 0 && worldPos < gameState.trackLength) {
                    const obstacle = gameState.obstacles.find(obs => obs.position === worldPos);
                    if (obstacle) {
                        if (obstacle.type === 'rock') {
                            if (obstacle.height === 'high' && row <= 2) {
                                trackLine += '🪨';
                            } else if (obstacle.height === 'low' && row >= 3) {
                                trackLine += '🪨';
                            } else {
                                trackLine += '  ';
                            }
                        } else if (obstacle.type === 'log') {
                            if (row === 3) {
                                trackLine += '🪵';
                            } else {
                                trackLine += '  ';
                            }
                        }
                    } else {
                        trackLine += '  ';
                    }
                } else {
                    trackLine += '  ';
                }
            }
            displayText(trackLine);
        }
        
        displayText('');
        displayText('Track: ' + '='.repeat(Math.floor((gameState.playerPosition / gameState.trackLength) * 20)) + '🏁');
        displayText('');
        
        if (gameState.gameRunning) {
            // Check for obstacles at current position
            const currentObstacle = gameState.obstacles.find(obs => obs.position === gameState.playerPosition);
            
            if (currentObstacle) {
                displayText(`⚠️  OBSTACLE AHEAD: ${currentObstacle.type.toUpperCase()} (${currentObstacle.height}) ⚠️`);
                displayText('');
                
                if (currentObstacle.type === 'rock' && currentObstacle.height === 'high') {
                    displayText('A tall rock blocks your path!');
                    addOption('Jump High', () => handleJump('high', currentObstacle));
                    addOption('Try to Run Through', () => handleJump('low', currentObstacle));
                } else if (currentObstacle.type === 'rock' && currentObstacle.height === 'low') {
                    displayText('A low rock is in your way!');
                    addOption('Jump High', () => handleJump('high', currentObstacle));
                    addOption('Jump Low', () => handleJump('low', currentObstacle));
                } else if (currentObstacle.type === 'log') {
                    displayText('A log lies across the track!');
                    addOption('Jump High', () => handleJump('high', currentObstacle));
                    addOption('Try to Run Through', () => handleJump('low', currentObstacle));
                }
            } else {
                displayText('Clear path ahead!');
                addOption('Continue Running', () => advancePlayer());
            }
            
            addOption('Quit Track', () => endMinigame(false));
        }
    }
    
    function handleJump(jumpType, obstacle) {
        let success = false;
        
        if (obstacle.type === 'rock' && obstacle.height === 'high') {
            success = jumpType === 'high';
        } else if (obstacle.type === 'rock' && obstacle.height === 'low') {
            success = jumpType === 'high' || jumpType === 'low';
        } else if (obstacle.type === 'log') {
            success = jumpType === 'high';
        }
        
        if (success) {
            displayText('✅ Perfect jump! You cleared the obstacle!');
            gameState.score += 10;
        } else {
            displayText('❌ Ouch! You hit the obstacle!');
            gameState.lives--;
            gameState.score -= 5;
        }
        
        setTimeout(() => {
            advancePlayer();
        }, 1000);
    }
    
    function advancePlayer() {
        gameState.playerPosition++;
        gameState.score += 1;
        
        if (gameState.playerPosition >= gameState.trackLength) {
            endMinigame(true);
        } else if (gameState.lives <= 0) {
            endMinigame(false);
        } else {
            setTimeout(renderTrack, 500);
        }
    }
    
    function endMinigame(completed) {
        clearOutput();
        clearOptions();
        
        displayText('========================================');
        displayText(`         TRACK COMPLETED!`);
        displayText('========================================');
        displayText('');
        
        if (completed) {
            displayText('🏁 Congratulations! You completed the track! 🏁');
            displayText('');
            displayText(`Final Score: ${gameState.score}`);
            displayText(`Lives Remaining: ${gameState.lives}`);
            displayText('');
            
            // Calculate bonus XP based on performance
            const bonusMultiplier = Math.max(0.5, gameState.score / (gameState.trackLength * 2));
            const finalXpGain = Math.floor(baseXpGain * bonusMultiplier);
            
            displayText(`You gained ${finalXpGain} Hitpoints experience!`);
            displayText('');
            
            if (bonusMultiplier > 1.2) {
                displayText('🌟 Excellent performance! Bonus XP awarded! 🌟');
            } else if (bonusMultiplier > 0.8) {
                displayText('👍 Good run! You performed well! 👍');
            } else {
                displayText('💪 You made it! Keep practicing to improve! 💪');
            }
            
            skillXP.hitpoints += finalXpGain;
            player.experience += finalXpGain;
            checkLevelUp('hitpoints', skillXP.hitpoints);
            updateUI();
            
        } else {
            displayText('💀 You failed to complete the track! We believed in you!');
            displayText('');
            displayText(`Final Score: ${gameState.score}`);
            displayText('You need to practice more to improve your endurance!');
            displayText('');
            displayText('You gained 5 Hitpoints experience for trying.');
            
            skillXP.hitpoints += 5;
            player.experience += 5;
            checkLevelUp('hitpoints', skillXP.hitpoints);
            updateUI();
        }
        
        displayText('');
        displayText('Track Benefits:');
        displayText('• Improved stamina and endurance');
        displayText('• Better health and vitality');
        displayText('• Increased resistance to fatigue');
        displayText('• Enhanced physical conditioning');
        displayText('');
        
        addOption('Run Again', () => runEnduranceTrack(location, difficulty));
        addOption('Try Different Difficulty', () => {
            if (location === 'falador') {
                exploreFaladorEnduranceTrack();
            } else {
                exploreAlKharidEnduranceTrack();
            }
        });
        addOption('Back to Exploring', exploreArea);
    }
    
    // Start the game
    renderTrack();
}
