@echo off
setlocal enabledelayedexpansion
title TOON-SCAPE - RuneScape in Batch!

:start_game
color 0A

REM ============================================
REM     TOON-SCAPE - CrypticTM 
REM ============================================
REM A complete RuneScape-like experience in batch!
REM With ASCII graphics, real combat, and full progression!

REM Initialize random seed for better randomness
set /a "random_seed=%random%"
set "random=!random_seed!"

REM ============================================
REM      VERSION 0.1.6
REM ============================================
REM A complete RuneScape-like experience in batch!

REM Show login screen first
call :show_login_screen

:show_login_screen
cls
color 0A
echo.
echo ========================================
echo         TOON-SCAPE LOGIN SCREEN
echo ========================================
echo.
echo Welcome to TOON-SCAPE - RuneScape in Batch!
echo.
echo This is a fan-made game by CrypticTM
echo  You may notice some familiar characters, places, and items from Runescape
echo.
echo ========================================
echo.
echo Please enter your credentials(or create an "account"):
echo.
set /p "username=Username: "
set /p "password=Password: "
echo.
echo [Authenticating...]
timeout /t 2 >nul
echo.
echo Welcome back, !username! ^(or new player^)!
echo.
echo Press any key to continue to the game...
pause >nul
cls
call :draw_title_screen

REM Initialize game data
if not exist "savegame.dat" (
    REM Create new game save
    set "gamemode=NEWGAME"
    (
    echo !gamemode!^>LUMBRIDGE^>1^>10^>10^>0^>1^>1^>1^>1^>1^>1^>1^>1^>1^>1^>1^>1^>1^>1^>1^>1^>1^>1^>1^>1^>1^>1^>1^>1^>1^>1^>1^>1^>50^>Bronze Sword,Wooden Shield,Bread,Health Potion,Tinderbox^>0^>0^>0^>0^>0^>0^>0^>0^>0^>0^>0^>0^>0^>0^>0^>0^>0^>0^>0^>0^>0^>0^>0^>0^>0^>0^>0^>0^>1^>0^>0^>0^>0^>0^>0^>0^>0^>0^>0^>1^>50^>Lumbridge_Harmony_CrypticTM
    ) > savegame.dat
)

REM Check if character data exists
if not exist "character.dat" (
    set "character_created=0"
) else (
    set "character_created=1"
    for /f "tokens=1-4 delims=>" %%a in (character.dat) do (
        set "player_name=%%a"
        set "player_gender=%%b"
        set "player_identity=%%c"
        set "player_hair_color=%%d"
    )
)

REM Load game data
for /f "tokens=1-44 delims=>" %%a in (savegame.dat) do (
    set "gamemode=%%a"
    set "location=%%b"
    set "level=%%c"
    set "maxhp=%%d"
    set "currenthp=%%e"
    set "experience=%%f"
    set "attack=%%g"
    set "strength=%%h"
    set "defence=%%i"
    set "hitpoints=%%j"
    set "ranged=%%k"
    set "magic=%%l"
    set "woodcutting=%%m"
    set "fishing=%%n"
    set "mining=%%o"
    set "cooking=%%p"
    set "smithing=%%q"
    set "crafting=%%r"
    set "fletching=%%s"
    set "herblore=%%t"
    set "prayer=%%u"
    set "slayer=%%v"
    set "farming=%%w"
    set "firemaking=%%x"
    set "treasure_hunting=%%y"
    set "coins=%%z"
    set "inventory=%%{"
    set "quest_cook=%%|"
    set "air_runes=%%}"
    set "water_runes=%%~"
    set "earth_runes=%%!"
    set "fire_runes=%%@"
    set "mind_runes=%%#"
    set "body_runes=%%$"
    set "chaos_runes=%%%"
    set "death_runes=%%^"
    set "blood_runes=%%&"
    set "soul_runes=%%*"
    set "music_enabled=%%+"
    set "music_volume=%%="
    set "current_track=%%-"
)



REM Set default values if variables are empty or 0
if "!gamemode!"=="" set "gamemode=NEWGAME"
if "!location!"=="" set "location=LUMBRIDGE"
if "!level!"=="" set "level=1"
if "!level!"=="0" set "level=1"
if "!maxhp!"=="" set "maxhp=10"
if "!maxhp!"=="0" set "maxhp=10"
if "!currenthp!"=="" set "currenthp=10"
if "!currenthp!"=="0" set "currenthp=10"
if "!experience!"=="" set "experience=0"
if "!attack!"=="" set "attack=1"
if "!attack!"=="0" set "attack=1"
if "!strength!"=="" set "strength=1"
if "!strength!"=="0" set "strength=1"
if "!defence!"=="" set "defence=1"
if "!defence!"=="0" set "defence=1"
if "!hitpoints!"=="" set "hitpoints=1"
if "!hitpoints!"=="0" set "hitpoints=1"
if "!ranged!"=="" set "ranged=1"
if "!ranged!"=="0" set "ranged=1"
if "!magic!"=="" set "magic=1"
if "!magic!"=="0" set "magic=1"
if "!woodcutting!"=="" set "woodcutting=1"
if "!woodcutting!"=="0" set "woodcutting=1"
if "!fishing!"=="" set "fishing=1"
if "!fishing!"=="0" set "fishing=1"
if "!mining!"=="" set "mining=1"
if "!mining!"=="0" set "mining=1"
if "!cooking!"=="" set "cooking=1"
if "!cooking!"=="0" set "cooking=1"
if "!smithing!"=="" set "smithing=1"
if "!smithing!"=="0" set "smithing=1"
if "!crafting!"=="" set "crafting=1"
if "!crafting!"=="0" set "crafting=1"
if "!fletching!"=="" set "fletching=1"
if "!fletching!"=="0" set "fletching=1"
if "!herblore!"=="" set "herblore=1"
if "!herblore!"=="0" set "herblore=1"
if "!prayer!"=="" set "prayer=1"
if "!prayer!"=="0" set "prayer=1"
if "!slayer!"=="" set "slayer=1"
if "!slayer!"=="0" set "slayer=1"
if "!farming!"=="" set "farming=1"
if "!farming!"=="0" set "farming=1"
if "!firemaking!"=="" set "firemaking=1"
if "!firemaking!"=="0" set "firemaking=1"
if "!treasure_hunting!"=="" set "treasure_hunting=1"
if "!treasure_hunting!"=="0" set "treasure_hunting=1"
if "!coins!"=="" set "coins=50"
if "!inventory!"=="" set "inventory=Bronze Sword,Wooden Shield,Bread,Health Potion"
if "!quest_cook!"=="" set "quest_cook=0"
if "!knowledge_tokens!"=="" set "knowledge_tokens=0"

REM Initialize XP tracking variables (calculate from levels)
REM Calculate XP for all skills based on current levels
set /a "attack_xp=(!attack! - 1) * 100"
set /a "strength_xp=(!strength! - 1) * 100"
set /a "defence_xp=(!defence! - 1) * 100"
set /a "hitpoints_xp=(!hitpoints! - 1) * 100"
set /a "ranged_xp=(!ranged! - 1) * 100"
set /a "magic_xp=(!magic! - 1) * 100"
set /a "woodcutting_xp=(!woodcutting! - 1) * 100"
set /a "fishing_xp=(!fishing! - 1) * 100"
set /a "mining_xp=(!mining! - 1) * 100"
set /a "cooking_xp=(!cooking! - 1) * 100"
set /a "smithing_xp=(!smithing! - 1) * 100"
set /a "crafting_xp=(!crafting! - 1) * 100"
set /a "fletching_xp=(!fletching! - 1) * 100"
set /a "herblore_xp=(!herblore! - 1) * 100"
set /a "prayer_xp=(!prayer! - 1) * 100"
set /a "slayer_xp=(!slayer! - 1) * 100"
set /a "farming_xp=(!farming! - 1) * 100"
set /a "firemaking_xp=(!firemaking! - 1) * 100"
set /a "treasure_hunting_xp=(!treasure_hunting! - 1) * 100"

REM Calculate combat level
set /a "combat_level=(!attack!+!strength!+!defence!+!hitpoints!+!ranged!+!magic!)/6"

REM Calculate total level
call :calculate_total_level

REM Show appropriate intro screen
cls
if "!gamemode!"=="NEWGAME" (
    call :draw_title_screen
) else (
    REM Show loading screen for saved games
    echo.
    echo ========================================
    echo      TOON-SCAPE 0.0.6 - RuneScape in Batch!
    echo ========================================
    echo.
    echo Loading your saved adventure...
    echo.
    echo [Please wait while we load your progress]
    timeout /t 2 >nul
    cls
)

REM Check if new game
if "!gamemode!"=="NEWGAME" (
echo.
echo ========================================
    echo      WELCOME TO TOON-SCAPE!
echo ========================================
echo.
echo Welcome to a familiar world in Batch format! This is a fan made game by CrypticTM that is not affiliated with Jagex or RuneScape.
echo.
    echo You awaken in Lumbridge, a peaceful town.
    echo The sun is shining and birds are chirping.
echo.
    echo Starting gold: 50 coins
    echo You feel ready for adventure!
echo.
    echo This is your first time playing.
    echo Your progress will be automatically saved.
echo.
    echo Press any key to begin your journey...
    pause >nul

    REM Update save file to mark as started
    set "gamemode=STARTED"
    (
    echo !gamemode!^>!location!^>!level!^>!maxhp!^>!currenthp!^>!experience!^>!attack!^>!strength!^>!defence!^>!hitpoints!^>!ranged!^>!magic!^>!woodcutting!^>!fishing!^>!mining!^>!cooking!^>!smithing!^>!crafting!^>!fletching!^>!herblore!^>!prayer!^>!slayer!^>!farming!^>!firemaking!^>!treasure_hunting!^>!coins!^>!inventory!^>!quest_cook!^>!air_runes!^>!water_runes!^>!earth_runes!^>!fire_runes!^>!mind_runes!^>!body_runes!^>!chaos_runes!^>!death_runes!^>!blood_runes!^>!soul_runes!^>!music_enabled!^>!music_volume!^>!current_track!
    ) > savegame.dat
) else (
echo.
    echo ========================================
    echo      WELCOME BACK, ADVENTURER!
echo ========================================
echo.
    echo Your save file has been loaded successfully!
    echo.
    echo You will be placed back in !location! where you left off.
    echo.
    echo Current Status:
    echo - Combat Level: !combat_level!
    echo - Gold Coins: !coins!
    echo - Total Experience: !experience! XP
    echo.
    echo Ready to continue your RuneScape adventure?
    echo.
    echo Press any key to continue...
    pause >nul
)

REM Go to main menu (both for new games and loaded games)
goto main_menu

:main_menu
cls
call :draw_location_header
echo.
echo ========================================
echo         TOON-SCAPE MAIN MENU
echo ========================================
echo.
echo Location: !location!
echo Combat Level: !combat_level! (Player Level: !level!)
echo Hitpoints: !currenthp!/!maxhp!
echo Gold: !coins! coins
if defined xp_boost_active echo [XP BOOST ACTIVE] Next training gives +25%% XP!
if defined knowledge_tokens if !knowledge_tokens! gtr 0 echo Knowledge Tokens: !knowledge_tokens!

REM Show active quest status only
if "%quest_cook%"=="1" (
    echo Active Quest: Cook's Assistant (Collect: Egg, Flour, Milk)
)
echo.
echo What would you like to do?
echo.
echo ========================================
echo         MAIN MENU
echo ========================================
echo.
echo 1. View Character Stats
echo 2. Check Skills
echo 3. Open Inventory
echo 4. Look Around / Explore
echo 5. Combat Training
echo 6. Visit Local Shop
echo 7. Train Skills
echo 8. Quest Journal
echo 9. Magic Journal
echo 10. Quest Hub (Accept New Quests)
echo 11. Travel to Another Location

REM Location-specific options
if "!location!"=="VARROCK" echo 12. Grand Exchange (GE)
if "!location!"=="LUMBRIDGE" echo 12. Player House
if "!location!"=="LUMBRIDGE" echo 13. Crafting Workshop
if "!location!"=="VARROCK" echo 13. Crafting Workshop
if "!location!"=="FALADOR" echo 12. Crafting Workshop
if "!location!"=="ALKHARID" echo 12. Crafting Workshop
if "!location!"=="LUMBRIDGE" echo 14. Bank
if "!location!"=="VARROCK" echo 14. Bank
if "!location!"=="FALADOR" echo 13. Bank
if "!location!"=="ALKHARID" echo 13. Bank
if "!location!"=="MAGETOWER" echo 12. Magic Shop
if "!location!"=="MAGETOWER" echo 13. Chat System
if "!location!"=="MAGETOWER" echo 14. Rune Crafting
if "!location!"=="WOLFMOUNTAIN" echo 12. Wolf Pack Territory
if "!location!"=="WOLFMOUNTAIN" echo 13. Mountain Caves
if "!location!"=="WOLFMOUNTAIN" echo 14. Mining Spots

echo 0. Save and Exit Game
echo.

REM Set prompt based on available options
if "!location!"=="VARROCK" (
    set /p choice="Choose option (0-14): "
) else if "!location!"=="LUMBRIDGE" (
    set /p choice="Choose option (0-14): "
) else if "!location!"=="MAGETOWER" (
    set /p choice="Choose option (0-14): "
) else if "!location!"=="WOLFMOUNTAIN" (
    set /p choice="Choose option (0-14): "
) else (
    set /p choice="Choose option (0-11): "
)

if "%choice%"=="1" goto view_character
if "%choice%"=="2" goto check_skills
if "%choice%"=="3" goto open_inventory
if "%choice%"=="4" goto explore_area
if "%choice%"=="5" goto combat_training
if "%choice%"=="6" goto visit_shop
if "%choice%"=="7" goto train_skills
if "%choice%"=="8" goto quest_log
if "%choice%"=="9" goto magic_journal
if "%choice%"=="10" goto quest_hub
if "%choice%"=="11" goto travel_menu

REM Handle location-specific options
if "!location!"=="VARROCK" (
    if "%choice%"=="12" goto grand_exchange
    if "%choice%"=="13" goto crafting_workshop
    if "%choice%"=="14" goto bank
) else if "!location!"=="LUMBRIDGE" (
    if "%choice%"=="12" goto player_house
    if "%choice%"=="13" goto crafting_workshop
    if "%choice%"=="14" goto bank
) else if "!location!"=="FALADOR" (
    if "%choice%"=="12" goto crafting_workshop
    if "%choice%"=="13" goto bank
) else if "!location!"=="ALKHARID" (
    if "%choice%"=="12" goto crafting_workshop
    if "%choice%"=="13" goto bank
) else if "!location!"=="MAGETOWER" (
    if "%choice%"=="12" goto magic_shop
    if "%choice%"=="13" goto chat_system
    if "%choice%"=="14" goto rune_crafting
) else if "!location!"=="WOLFMOUNTAIN" (
    if "%choice%"=="12" goto wolf_pack_territory
    if "%choice%"=="13" goto mountain_caves
    if "%choice%"=="14" goto wolf_mountain_mining
)

if "%choice%"=="0" goto exit_game

echo Invalid choice! Press any key to continue...
pause >nul
goto main_menu

REM ============================================
REM     MAIN MENU OPTIONS
REM ============================================

:view_character
cls
call :draw_character_portrait
echo.
echo ========================================
echo         CHARACTER STATS
echo ========================================
echo.
echo Name: TOON-SCAPE Adventurer
echo Combat Level: !combat_level!
echo Total Level: !level!
echo.
echo Hitpoints: !currenthp!/!maxhp!
echo Total Experience: !experience! XP
echo.
echo Combat Stats:
echo Attack: !attack!
echo Strength: !strength!
echo Defence: !defence!
echo Hitpoints: !hitpoints!
echo Ranged: !ranged!
echo Magic: !magic!
echo.
echo Settings:
echo Music: Disabled (Music system removed)
echo.
echo Press any key to return to main menu...
pause >nul
goto main_menu

:check_skills
cls
call :draw_skills_header
echo.
echo ========================================
echo           SKILLS OVERVIEW
echo ========================================
echo.
echo Combat Skills:
set /a "attack_next=!attack! * 100"
set /a "strength_next=!strength! * 100"
set /a "defence_next=!defence! * 100"
set /a "hitpoints_next=!hitpoints! * 100"
set /a "ranged_next=!ranged! * 100"
set /a "magic_next=!magic! * 100"
echo Attack: !attack! (!attack_xp!/!attack_next! XP)
echo Strength: !strength! (!strength_xp!/!strength_next! XP)
echo Defence: !defence! (!defence_xp!/!defence_next! XP)
echo Hitpoints: !hitpoints! (!hitpoints_xp!/!hitpoints_next! XP)
echo Ranged: !ranged! (!ranged_xp!/!ranged_next! XP)
echo Magic: !magic! (!magic_xp!/!magic_next! XP)
echo.
echo Gathering Skills:
set /a "woodcutting_next=!woodcutting! * 100"
set /a "fishing_next=!fishing! * 100"
set /a "mining_next=!mining! * 100"
set /a "treasure_hunting_next=!treasure_hunting! * 100"
echo Woodcutting: !woodcutting! (!woodcutting_xp!/!woodcutting_next! XP)
echo Fishing: !fishing! (!fishing_xp!/!fishing_next! XP)
echo Mining: !mining! (!mining_xp!/!mining_next! XP)
echo Treasure Hunting: !treasure_hunting! (!treasure_hunting_xp!/!treasure_hunting_next! XP)
echo.
echo Artisan Skills:
set /a "cooking_next=!cooking! * 100"
set /a "smithing_next=!smithing! * 100"
set /a "crafting_next=!crafting! * 100"
set /a "fletching_next=!fletching! * 100"
set /a "herblore_next=!herblore! * 100"
echo Cooking: !cooking! (!cooking_xp!/!cooking_next! XP)
echo Smithing: !smithing! (!smithing_xp!/!smithing_next! XP)
echo Crafting: !crafting! (!crafting_xp!/!crafting_next! XP)
echo Fletching: !fletching! (!fletching_xp!/!fletching_next! XP)
echo Herblore: !herblore! (!herblore_xp!/!herblore_next! XP)
echo.
echo Support Skills:
set /a "prayer_next=!prayer! * 100"
set /a "slayer_next=!slayer! * 100"
set /a "farming_next=!farming! * 100"
set /a "firemaking_next=!firemaking! * 100"
echo Prayer: !prayer! (!prayer_xp!/!prayer_next! XP)
echo Slayer: !slayer! (!slayer_xp!/!slayer_next! XP)
echo Farming: !farming! (!farming_xp!/!farming_next! XP)
echo Firemaking: !firemaking! (!firemaking_xp!/!firemaking_next! XP)
echo.
echo Press any key to return to main menu...
pause >nul
goto main_menu

:open_inventory
cls
call :draw_inventory_header
echo.
echo Your Inventory:
echo.

REM Parse inventory items
set "item_count=0"
call :parse_inventory

echo.
if !item_count! equ 0 (
    echo Your inventory is empty.
) else (
    echo Inventory slots: !item_count!/28 used
)
echo.
echo Gold Coins: !coins!
echo.
echo [I]nventory Management - [U]se Item - [D]rop Item - [B]ack
set /p inv_choice="Choose action: "

if /i "!inv_choice!"=="i" goto inventory_management
if /i "!inv_choice!"=="u" goto use_item
if /i "!inv_choice!"=="d" goto drop_item
if /i "!inv_choice!"=="b" goto main_menu

echo Invalid choice!
pause >nul
goto open_inventory

:combat_training
cls
call :draw_combat_arena
echo.
echo ========================================
echo        COMBAT TRAINING GROUND
echo ========================================
echo.
echo You enter the Lumbridge Combat Training area.
echo.
echo What would you like to train against?
echo.
echo 1. Attack Training Dummy (Safe training)
echo 2. Fight Goblins (Low level combat)
echo 3. Fight Giant Rats (Easy combat)
echo 4. Fight Chickens (Very easy)
echo 5. Back to main menu
echo.
set /p train_choice="Choose training: "

if "%train_choice%"=="1" goto dummy_training
if "%train_choice%"=="2" goto goblin_combat
if "%train_choice%"=="3" goto rat_combat
if "%train_choice%"=="4" goto chicken_combat
if "%train_choice%"=="5" goto main_menu

echo Invalid choice!
pause >nul
goto combat_training

:dummy_training
cls
echo ========================================
echo        TRAINING DUMMY
echo ========================================
echo.
echo You approach a sturdy training dummy.
echo.
echo Training Options:
echo 1. Attack Practice (Attack skill)
echo 2. Strength Training (Strength skill)
echo 3. Defensive Practice (Defence skill)
echo 4. Back to training menu
echo.
set /p dummy_choice="Choose action: "

if "%dummy_choice%"=="1" (
    echo.
    echo You practice precise strikes on the dummy...
    timeout /t 1 >nul
    echo You land several accurate hits!
    echo.
    echo You gained 25 Attack experience!

    REM Add experience and update save
    set /a "attack_xp+=25"
    set /a "experience+=25"
    call :check_level_up attack !attack_xp!

    echo.
    echo Press any key to continue training...
    pause >nul
    goto dummy_training
)

if "%dummy_choice%"=="2" (
    echo.
    echo You focus on powerful strikes...
    timeout /t 1 >nul
    echo The dummy shakes from your mighty blows!
    echo.
    echo You gained 25 Strength experience!

    set /a "strength_xp+=25"
    set /a "experience+=25"
    call :check_level_up strength !strength_xp!

    echo.
    echo Press any key to continue training...
    pause >nul
    goto dummy_training
)

if "%dummy_choice%"=="3" (
    echo.
    echo You practice defensive maneuvers...
    timeout /t 1 >nul
    echo You successfully block imaginary attacks!
    echo.
    echo You gained 25 Defence experience!

    set /a "defence_xp+=25"
    set /a "experience+=25"
    call :check_level_up defence !defence_xp!

    echo.
    echo Press any key to continue training...
    pause >nul
    goto dummy_training
)

if "%dummy_choice%"=="4" goto combat_training
goto dummy_training

:goblin_combat
REM Initialize goblin fight
set "enemy_name=Goblin"
set "enemy_level=1"
set "enemy_maxhp=10"
set "enemy_currenthp=10"
set "enemy_attack=1"
set "enemy_defence=1"
set "enemy_weapon=Small Dagger"
goto real_combat

:rat_combat
set "enemy_name=Giant Rat"
set "enemy_level=1"
set "enemy_maxhp=8"
set "enemy_currenthp=8"
set "enemy_attack=1"
set "enemy_defence=0"
set "enemy_weapon=Teeth and Claws"
goto real_combat

:chicken_combat
set "enemy_name=Chicken"
set "enemy_level=1"
set "enemy_maxhp=3"
set "enemy_currenthp=3"
set "enemy_attack=0"
set "enemy_defence=0"
set "enemy_weapon=Peck"
goto real_combat

:real_combat
cls
call :draw_combat_scene
echo.
echo ========================================
echo        COMBAT: !enemy_name!
echo ========================================
echo.
echo You encounter a !enemy_name!!

echo Enemy Stats:
echo Level: !enemy_level!
echo Hitpoints: !enemy_currenthp!/!enemy_maxhp!
echo Attack: !enemy_attack!
echo Defence: !enemy_defence!
echo Weapon: !enemy_weapon!
echo.
echo Your Stats:
echo Hitpoints: !currenthp!/!maxhp!
echo Attack: !attack!
echo Defence: !defence!
echo.
echo Combat Options:
echo 1. Attack with weapon

REM Check if player has any weapon equipped
set "has_weapon=0"
echo !inventory! | findstr /i "Bronze Sword" >nul && set "has_weapon=1"
echo !inventory! | findstr /i "Iron Sword" >nul && set "has_weapon=1"
echo !inventory! | findstr /i "Steel Sword" >nul && set "has_weapon=1"
echo !inventory! | findstr /i "Adamant Sword" >nul && set "has_weapon=1"

if !has_weapon! equ 1 (
    echo 2. Special Attack (available)
) else (
    echo 2. Special Attack (no weapon equipped)
)
echo 3. Cast Magic Spell
echo 4. Eat food to heal
echo 5. Attempt to run away
echo.

set /p combat_choice="Choose action: "

if "!combat_choice!"=="1" (
    REM Player attacks
    call :calculate_damage attack enemy_defence
    set "player_damage=!damage!"

    if !player_damage! gtr 0 (
    echo.
        echo You swing your bronze sword at the !enemy_name!!
        timeout /t 1 >nul
        echo You deal !player_damage! damage!
        set /a "enemy_currenthp-=!player_damage!"

        if !enemy_currenthp! leq 0 (
            echo The !enemy_name! collapses!
            echo.
            echo You defeated the !enemy_name!!
            
            REM Special rewards for Player Killer defeats
            if "!enemy_name!"=="Player Killer" (
                echo.
                echo ========================================
                echo      WILDERNESS PVP VICTORY!
                echo ========================================
                echo You have successfully defeated a Player Killer!
                echo.
                
                REM High XP rewards for PvP
                set /a "pvp_xp_bonus=!enemy_level! * 5"
                echo You gained !pvp_xp_bonus! combat experience!
                set /a "attack_xp+=!pvp_xp_bonus!"
                set /a "strength_xp+=!pvp_xp_bonus!"
                set /a "defence_xp+=!pvp_xp_bonus!/2"
                set /a "experience+=!pvp_xp_bonus!"
                
                REM PvP loot - Player Killers drop better items
                call :wilderness_pvp_loot
                
                echo.
                echo You return to safety...
                pause >nul
                goto main_menu
            ) else (
                echo You gained 50 combat experience!

                REM Award experience
                set /a "attack_xp+=20"
                set /a "strength_xp+=15"
                set /a "defence_xp+=10"
                set /a "hitpoints_xp+=5"
                set /a "experience+=50"

                REM Random loot
                call :random_loot

                echo.
                echo Press any key to return to training...
                pause >nul
                goto combat_training
            )

            REM Check level ups
            call :check_level_up attack !attack_xp!
            call :check_level_up strength !strength_xp!
            call :check_level_up defence !defence_xp!
            call :check_level_up hitpoints !hitpoints_xp!
        )
    ) else (
        echo.
        echo Your attack misses the !enemy_name!!
    )

    REM Enemy attacks back
    if !enemy_currenthp! gtr 0 (
        echo.
        call :calculate_damage_direct !enemy_attack! !defence!
        set "enemy_damage=!damage!"

        if !enemy_damage! gtr 0 (
            echo The !enemy_name! attacks you with its !enemy_weapon!!
            timeout /t 1 >nul
            echo You take !enemy_damage! damage!
            set /a "currenthp-=!enemy_damage!"

            if !currenthp! leq 0 (
                echo.
                echo You have been defeated!
                echo The !enemy_name! stands victorious.
                echo.
                
                REM Special death handling for Player Killer defeats
                if "!enemy_name!"=="Player Killer" (
                    echo ========================================
                    echo      WILDERNESS PVP DEFEAT!
                    echo ========================================
                    echo The Player Killer has defeated you in combat!
                    echo You lose items and coins as per Wilderness rules!
                    echo.
                    call :wilderness_penalty
                    set "currenthp=1"
                    echo.
                    echo You respawn in Lumbridge, having learned a hard lesson...
                    echo.
                    pause >nul
                    goto main_menu
                ) else (
                    echo You lose 10 coins and wake up at the Lumbridge respawn point.
                    set /a "coins-=10"
                    if !coins! lss 0 set "coins=0"
                    set "currenthp=1"
                    echo.
                    echo Press any key to continue...
                    pause >nul
                    goto main_menu
                )
            )
        ) else (
            echo The !enemy_name!'s attack misses you!
        )
    )

    echo.
    echo Press any key to continue the fight...
    pause >nul
    goto real_combat
)

if "!combat_choice!"=="2" (
    REM Special Attack System
    if not defined attack_xp set "attack_xp=0"
    if not defined strength_xp set "strength_xp=0"
    if not defined defence_xp set "defence_xp=0"
    if not defined hitpoints_xp set "hitpoints_xp=0"
    
    REM Check if player has a weapon equipped
    set "has_weapon=0"
    echo !inventory! | findstr /i "Bronze Sword" >nul && set "has_weapon=1"
    echo !inventory! | findstr /i "Iron Sword" >nul && set "has_weapon=1"
    echo !inventory! | findstr /i "Steel Sword" >nul && set "has_weapon=1"
    echo !inventory! | findstr /i "Adamant Sword" >nul && set "has_weapon=1"
    
    if !has_weapon! equ 0 (
        echo.
        echo You need a weapon equipped to use special attacks!
        echo.
        pause >nul
        goto real_combat
    )
    
    call :special_attack
    goto real_combat
)

if "!combat_choice!"=="3" (
    REM Magic Combat System
    call :cast_magic_spell
    goto real_combat
)

if "!combat_choice!"=="4" (
    REM Check for food
    call :count_item "Bread"
    if !item_count! equ 0 (
    echo.
        echo You don't have any food in your inventory!
        echo.
        pause >nul
        goto real_combat
    ) else (
        echo.
        echo You eat a loaf of bread...
        timeout /t 1 >nul
    echo You heal 2 hitpoints!
        set /a "currenthp+=2"
        if !currenthp! gtr !maxhp! set "currenthp=!maxhp!"

        REM Remove bread from inventory
        call :remove_item "Bread"

        echo.
        echo Press any key to continue...
        pause >nul
        goto real_combat
    )
)

if "!combat_choice!"=="5" (
    REM Attempt to run
    set /a "run_chance=!random! %% 100"
    if !run_chance! lss 70 (
    echo.
        echo You successfully run away!
        echo.
        pause >nul
        goto combat_training
    ) else (
        echo.
        echo You fail to escape!
        echo The !enemy_name! attacks you as you try to flee!
        echo.
        call :calculate_damage_direct !enemy_attack! !defence!
        set "enemy_damage=!damage!"

        if !enemy_damage! gtr 0 (
            echo You take !enemy_damage! damage from the cowardly attack!
            set /a "currenthp-=!enemy_damage!"
            if !currenthp! leq 0 (
                echo You collapse from the damage!
                set "currenthp=1"
                set /a "coins-=10"
                if !coins! lss 0 set "coins=0"
            )
        )
echo.
pause >nul
        goto real_combat
    )
)

) else (
    echo Invalid choice! Please select 1-5.
    timeout /t 2 >nul
    goto real_combat
)

:special_attack
cls
echo.
echo ========================================
echo         COMBAT - SPECIAL ATTACKS
echo ========================================
echo.
echo Enemy: !enemy_name! (Level !enemy_level!)
echo Enemy HP: !enemy_currenthp!/!enemy_maxhp!
echo Your HP: !currenthp!/!maxhp!
echo.
echo Choose your special attack:
echo.

REM Determine weapon type for special attacks
set "weapon_type=Basic"
echo !inventory! | findstr /i "Adamant Sword" >nul && set "weapon_type=Adamant"
echo !inventory! | findstr /i "Steel Sword" >nul && set "weapon_type=Steel"
echo !inventory! | findstr /i "Iron Sword" >nul && set "weapon_type=Iron"
echo !inventory! | findstr /i "Bronze Sword" >nul && set "weapon_type=Bronze"

if "!weapon_type!"=="Adamant" (
    echo 1. Dragon Slash (Strength XP +20) - Devastating strike with high accuracy
    echo 2. Berserker Rage (Attack XP +30) - Massive damage, temporary defence loss
    echo 3. Blade Storm (Attack XP +25, Strength XP +15) - Multiple rapid strikes
    echo 4. Counter Strike (Defence XP +25, Attack XP +20) - Perfect counter attack
) else if "!weapon_type!"=="Steel" (
    echo 1. Steel Strike (Strength XP +15) - Powerful strike with good accuracy
    echo 2. Charge Attack (Attack XP +25) - Extra damage, uses energy
    echo 3. Defensive Stance (Defence XP +25) - Reduce damage, lower attack
    echo 4. Counter Attack (Defence XP +20, Attack XP +15) - Strike when dodging
) else if "!weapon_type!"=="Iron" (
    echo 1. Iron Strike (Strength XP +13) - Strong strike with moderate accuracy
    echo 2. Charge Attack (Attack XP +20) - Extra damage, uses energy
    echo 3. Defensive Stance (Defence XP +20) - Reduce damage, lower attack
    echo 4. Counter Attack (Defence XP +15, Attack XP +10) - Strike when dodging
) else (
    echo 1. Power Strike (Strength XP +10) - High damage, lower accuracy
    echo 2. Charge Attack (Attack XP +15) - Extra damage, uses energy
    echo 3. Defensive Stance (Defence XP +15) - Reduce damage, lower attack
    echo 4. Counter Attack (Defence XP +10, Attack XP +8) - Strike when dodging
)

echo 5. Back to combat
echo.
set /p special_choice="Choose special attack: "

if "%special_choice%"=="1" (
    REM Power Strike variants based on weapon type
    if "!weapon_type!"=="Adamant" (
        echo.
        echo You channel the power of your Adamant Sword!
        timeout /t 1 >nul
        echo You unleash a devastating Dragon Slash!
        
        REM Calculate damage with high bonus and accuracy
        call :calculate_damage_direct !attack! !enemy_defence!
        set /a "power_damage=!damage! + 25"
        set /a "accuracy_check=!random! %% 100"
        
        if !accuracy_check! lss 85 (
            echo The Dragon Slash cuts through your enemy!
            echo You deal !power_damage! damage!
            set /a "enemy_currenthp-=!power_damage!"
            
            REM Award Strength XP bonus
            set /a "strength_xp+=20"
            set /a "experience+=30"
            echo You gained 20 Strength experience!
        ) else (
            echo Your Dragon Slash misses!
            echo The !enemy_name! dodges your attack!
        )
    ) else if "!weapon_type!"=="Steel" (
        echo.
        echo You gather your strength for a powerful Steel Strike!
        timeout /t 1 >nul
        echo You unleash a devastating Steel Strike!
        
        REM Calculate damage with good bonus and accuracy
        call :calculate_damage_direct !attack! !enemy_defence!
        set /a "power_damage=!damage! + 20"
        set /a "accuracy_check=!random! %% 100"
        
        if !accuracy_check! lss 80 (
            echo The Steel Strike hits with incredible force!
            echo You deal !power_damage! damage!
            set /a "enemy_currenthp-=!power_damage!"
            
            REM Award Strength XP bonus
            set /a "strength_xp+=15"
            set /a "experience+=25"
            echo You gained 15 Strength experience!
        ) else (
            echo Your Steel Strike misses!
            echo The !enemy_name! dodges your attack!
        )
    ) else if "!weapon_type!"=="Iron" (
        echo.
        echo You gather your strength for a powerful Iron Strike!
        timeout /t 1 >nul
        echo You unleash a devastating Iron Strike!
        
        REM Calculate damage with moderate bonus and accuracy
        call :calculate_damage_direct !attack! !enemy_defence!
        set /a "power_damage=!damage! + 18"
        set /a "accuracy_check=!random! %% 100"
        
        if !accuracy_check! lss 75 (
            echo The Iron Strike hits with great force!
            echo You deal !power_damage! damage!
            set /a "enemy_currenthp-=!power_damage!"
            
            REM Award Strength XP bonus
            set /a "strength_xp+=13"
            set /a "experience+=20"
            echo You gained 13 Strength experience!
        ) else (
            echo Your Iron Strike misses!
            echo The !enemy_name! dodges your attack!
        )
    ) else (
        echo.
        echo You gather your strength for a powerful strike!
        timeout /t 1 >nul
        echo You unleash a devastating Power Strike!
        
        REM Calculate damage with bonus but lower accuracy
        call :calculate_damage_direct !attack! !enemy_defence!
        set /a "power_damage=!damage! + 15"
        set /a "accuracy_check=!random! %% 100"
        
        if !accuracy_check! lss 70 (
            echo The attack hits with incredible force!
            echo You deal !power_damage! damage!
            set /a "enemy_currenthp-=!power_damage!"
            
            REM Award Strength XP bonus
            set /a "strength_xp+=10"
            set /a "experience+=15"
            echo You gained 10 Strength experience!
        ) else (
            echo Your Power Strike misses!
            echo The !enemy_name! dodges your attack!
        )
        
        if !enemy_currenthp! leq 0 (
            echo The !enemy_name! is completely destroyed! Look at you go! 
            echo.
            echo You defeated the !enemy_name!!
            echo You gained 75 combat experience!
            set /a "attack_xp+=25"
            set /a "strength_xp+=25"
            set /a "defence_xp+=15"
            set /a "experience+=75"
            call :random_loot
            pause >nul
            goto combat_training
        )
    )
    
    REM Enemy attacks back
    if !enemy_currenthp! gtr 0 (
        echo.
        call :calculate_damage_direct !enemy_attack! !defence!
        set "enemy_damage=!damage!"
        if !enemy_damage! gtr 0 (
            echo The !enemy_name! attacks you!
            echo You take !enemy_damage! damage!
            set /a "currenthp-=!enemy_damage!"
        )
    )
    
) else if "%special_choice%"=="2" (
    REM Charge Attack variants based on weapon type
    if "!weapon_type!"=="Adamant" (
        echo.
        echo You enter Berserker Rage with your Adamant Sword!
        timeout /t 1 >nul
        echo You unleash a devastating Berserker Rage attack!
        
        REM Calculate damage with massive bonus
        call :calculate_damage_direct !attack! !enemy_defence!
        set /a "charge_damage=!damage! + 35"
        set /a "accuracy_check=!random! %% 100"
        
        if !accuracy_check! lss 75 (
            echo Your Berserker Rage devastates the enemy!
            echo You deal !charge_damage! damage!
            set /a "enemy_currenthp-=!charge_damage!"
            
            REM Award Attack XP bonus
            set /a "attack_xp+=30"
            set /a "experience+=40"
            echo You gained 30 Attack experience!
        ) else (
            echo Your Berserker Rage misses!
            echo The !enemy_name! dodges your attack!
        )
    ) else if "!weapon_type!"=="Steel" (
        echo.
        echo You charge forward with incredible speed!
        timeout /t 1 >nul
        echo You perform a lightning-fast Charge Attack!
        
        REM Calculate damage with speed bonus
        call :calculate_damage_direct !attack! !enemy_defence!
        set /a "charge_damage=!damage! + 25"
        set /a "accuracy_check=!random! %% 100"
        
        if !accuracy_check! lss 80 (
            echo Your charge connects perfectly!
            echo You deal !charge_damage! damage!
            set /a "enemy_currenthp-=!charge_damage!"
            
            REM Award Attack XP bonus
            set /a "attack_xp+=25"
            set /a "experience+=25"
            echo You gained 25 Attack experience!
        ) else (
            echo Your charge misses!
            echo The !enemy_name! sidesteps your attack!
        )
    ) else if "!weapon_type!"=="Iron" (
        echo.
        echo You charge forward with good speed!
        timeout /t 1 >nul
        echo You perform a Charge Attack!
        
        REM Calculate damage with moderate bonus
        call :calculate_damage_direct !attack! !enemy_defence!
        set /a "charge_damage=!damage! + 22"
        set /a "accuracy_check=!random! %% 100"
        
        if !accuracy_check! lss 78 (
            echo Your charge connects well!
            echo You deal !charge_damage! damage!
            set /a "enemy_currenthp-=!charge_damage!"
            
            REM Award Attack XP bonus
            set /a "attack_xp+=20"
            set /a "experience+=20"
            echo You gained 20 Attack experience!
        ) else (
            echo Your charge misses!
            echo The !enemy_name! sidesteps your attack!
        )
    ) else (
        echo.
        echo You charge forward with speed!
        timeout /t 1 >nul
        echo You perform a Charge Attack!
        
        REM Calculate damage with basic bonus
        call :calculate_damage_direct !attack! !enemy_defence!
        set /a "charge_damage=!damage! + 20"
        set /a "accuracy_check=!random! %% 100"
        
        if !accuracy_check! lss 75 (
            echo Your charge connects!
            echo You deal !charge_damage! damage!
            set /a "enemy_currenthp-=!charge_damage!"
            
            REM Award Attack XP bonus
            set /a "attack_xp+=15"
            set /a "experience+=15"
            echo You gained 15 Attack experience!
        ) else (
            echo Your charge misses!
            echo The !enemy_name! sidesteps your attack!
        )
    )
    
    if !enemy_currenthp! leq 0 (
            echo The !enemy_name! falls to your charge!
            echo.
            echo You defeated the !enemy_name!!
            echo You gained 75 combat experience!
            set /a "attack_xp+=25"
            set /a "strength_xp+=25"
            set /a "defence_xp+=15"
            set /a "experience+=75"
            call :random_loot
            pause >nul
            goto combat_training
        )
    ) else (
        echo Your charge misses the target!
        echo The !enemy_name! sidesteps your attack!
    )
    
    REM Enemy attacks back
    if !enemy_currenthp! gtr 0 (
        echo.
        call :calculate_damage_direct !enemy_attack! !defence!
        set "enemy_damage=!damage!"
        if !enemy_damage! gtr 0 (
            echo The !enemy_name! attacks you!
            echo You take !enemy_damage! damage!
            set /a "currenthp-=!enemy_damage!"
        )
    )
    
) else if "%special_choice%"=="3" (
    REM Defensive Stance - Reduce damage, lower attack
    echo.
    echo You assume a defensive stance!
    timeout /t 1 >nul
    echo You enter Defensive Stance - damage reduced, attack lowered!
    
    REM Set defensive mode for next enemy attack
    set "defensive_mode=1"
    set "defence_bonus=15"
    
    REM Award Defence XP bonus
    set /a "defence_xp+=25"
    set /a "experience+=25"
    echo You gained 25 Defence experience!
    echo Your defence is increased for the next attack!
    
    REM Enemy attacks with reduced damage
    if !enemy_currenthp! gtr 0 (
        echo.
        call :calculate_damage_direct !enemy_attack! !defence!
        set /a "enemy_damage=!damage! - !defence_bonus!"
        if !enemy_damage! lss 0 set "enemy_damage=0"
        
        if !enemy_damage! gtr 0 (
            echo The !enemy_name! attacks, but your defence reduces the damage!
            echo You take !enemy_damage! damage (reduced from !damage! damage)!
            set /a "currenthp-=!enemy_damage!"
        ) else (
            echo The !enemy_name!'s attack is completely blocked!
            echo You take no damage!
        )
    )
    
    REM Reset defensive mode
    set "defensive_mode=0"
    
) else if "%special_choice%"=="4" (
    REM Counter Attack - Strike when dodging
    echo.
    echo You prepare for a Counter Attack!
    timeout /t 1 >nul
    echo You attempt to dodge and counter!
    
    REM Calculate dodge chance
    set /a "dodge_chance=!defence! * 2"
    set /a "dodge_check=!random! %% 100"
    
    if !dodge_chance! gtr !dodge_check! (
        echo You successfully dodge the attack!
        echo You counter with a precise strike!
        
        REM Calculate counter damage
        call :calculate_damage_direct !attack! !enemy_defence!
        set /a "counter_damage=!damage! + 10"
        echo You deal !counter_damage! counter damage!
        set /a "enemy_currenthp-=!counter_damage!"
        
        REM Award Defence and Attack XP bonus
        set /a "defence_xp+=20"
        set /a "attack_xp+=15"
        set /a "experience+=35"
        echo You gained 20 Defence and 15 Attack experience!
        
        if !enemy_currenthp! leq 0 (
            echo The !enemy_name! falls to your counter!
            echo.
            echo You defeated the !enemy_name!!
            echo You gained 75 combat experience!
            set /a "attack_xp+=25"
            set /a "strength_xp+=25"
            set /a "defence_xp+=15"
            set /a "experience+=75"
            call :random_loot
            pause >nul
            goto combat_training
        )
    ) else (
        echo You fail to dodge the attack!
        echo The !enemy_name! hits you!
        
        REM Enemy attacks normally
        call :calculate_damage_direct !enemy_attack! !defence!
        set "enemy_damage=!damage!"
        if !enemy_damage! gtr 0 (
            echo You take !enemy_damage! damage!
            set /a "currenthp-=!enemy_damage!"
        )
    )
    
) else if "%special_choice%"=="5" (
    goto real_combat
) else (
    echo Invalid choice!
    pause >nul
    goto special_attack
)

echo.
echo Press any key to continue combat...
pause >nul
goto real_combat

:explore_area
cls
call :draw_location_scene
echo.
echo ========================================
echo         EXPLORING !location!
echo ========================================
echo.
if "!location!"=="LUMBRIDGE" (
    echo You explore the peaceful town of Lumbridge.
    echo.
    echo You see:
    echo 1. The castle - Maybe the Duke needs help?
    echo 2. The church - Prayer training available
    echo 3. The windmill - Strange grinding sounds
    echo 4. The river - Good fishing spot
    echo 5. The forest - Trees waiting to be cut
    echo 6. Chicken coop - You hear clucking sounds
    echo 7. Dairy farm - Cows mooing in the distance
    echo 8. Mining site - Rocks and ores nearby
    echo 9. Lumbridge Catacombs - Underground dungeon
    echo 10. Deep Swamp Dungeon - Dangerous swamp lair
    echo 11. Treasure Hunting Spot - Search for hidden treasures
    echo 12. Random encounter
    echo 13. Back to main menu
    echo.
    set /p explore_choice="What do you investigate? "
    
    if "!explore_choice!"=="1" (
        echo.
        echo You approach Lumbridge Castle...
        timeout /t 1 >nul
        echo You see a busy kitchen area nearby.
        echo A stressed baker is frantically working.
        echo.
        echo [T]alk to the baker
        echo [L]eave the castle area
        echo.
        set /p castle_choice="What do you do? "

        if /i "!castle_choice!"=="t" (
            echo.
            echo You approach the baker...
            timeout /t 1 >nul
            echo "Oh no! I've run out of ingredients for the Duke's birthday cake!"
            echo "I need an egg, a pot of flour, and a bucket of milk."
            echo "Can you help me find these items?"
            echo.
            echo [Y]es, I'll help you
            echo [N]o, I'm busy right now
            echo.
            set /p quest_choice="Your choice: "

            if /i "!quest_choice!"=="y" (
                if "%quest_cook%"=="0" (
                    echo.
                    echo "Wonderful! Please find me:"
                    echo "- An egg (from the chicken coop)"
                    echo "- A pot of flour (from the windmill)"
                    echo "- A bucket of milk (from the dairy farm)"
                    echo.
                    echo The Cook's Assistant quest has begun!
                    set "quest_cook=1"
                    echo.
                    pause >nul
                    goto explore_area
                ) else if "%quest_cook%"=="1" (
                    echo.
                    echo "Have you found all the ingredients yet?"
                    echo "I still need: Egg, Flour, and Milk"
                    echo.
                    pause >nul
                    goto explore_area
                ) else (
                    echo.
                    echo "Thank you again for helping me!"
                    echo "The Duke's birthday cake was a success!"
                    echo.
                    pause >nul
                    goto explore_area
                )
            ) else (
                echo.
                echo "Oh... well, if you change your mind..."
                echo.
                pause >nul
                goto explore_area
            )
        )
        goto explore_area
    )
    if "!explore_choice!"=="11" (
        call :lumbridge_treasure_hunting
    ) else if "!explore_choice!"=="2" (
        echo.
        echo You enter the Lumbridge Church...
        timeout /t 1 >nul
        echo Father Aereck greets you warmly.
        echo You gained 15 Prayer experience!
        set /a "prayer_xp+=15"
        set /a "experience+=15"
        pause >nul
        goto explore_area
    )
    if "!explore_choice!"=="3" (
        echo.
        echo You approach the windmill...
        timeout /t 1 >nul
        echo You hear grinding sounds from inside.
        pause >nul
        goto explore_area
    )
    if "!explore_choice!"=="4" (
        call :lumbridge_river_fishing
    )
    if "!explore_choice!"=="5" (
        call :lumbridge_forest_woodcutting
    )
    if "!explore_choice!"=="6" (
        echo.
        echo You approach the chicken coop...
        timeout /t 1 >nul
        echo You see several chickens clucking around.
        pause >nul
        goto explore_area
    )
    if "!explore_choice!"=="7" (
        echo.
        echo You approach the dairy farm...
        timeout /t 1 >nul
        echo You see cows grazing peacefully.
        pause >nul
        goto explore_area
    )
    if "!explore_choice!"=="8" (
        echo.
        echo You approach the mining site...
        timeout /t 1 >nul
        echo Rocks and ores are scattered around.
        pause >nul
        goto explore_area
    )
    if "!explore_choice!"=="9" (
        echo.
        echo You approach the entrance to the Lumbridge Catacombs...
        timeout /t 1 >nul
        echo Dark tunnels lead deep underground.
        echo This dungeon is dangerous - are you sure you want to enter?
        echo.
        echo [Y]es, enter the catacombs
        echo [N]o, stay on the surface
        echo.
        set /p dungeon_confirm="Your choice: "
        if /i "!dungeon_confirm!"=="y" (
            call :lumbridge_catacombs
        ) else (
            echo You decide not to enter the catacombs.
            pause >nul
            goto explore_area
        )
    )
    if "!explore_choice!"=="10" (
        echo.
        echo You venture into the murky swamp...
        timeout /t 1 >nul
        echo You find the entrance to a hidden dungeon.
        echo This place looks extremely dangerous!
        echo.
        echo [Y]es, enter the deep swamp dungeon
        echo [N]o, retreat to safety
        echo.
        set /p dungeon_confirm="Your choice: "
        if /i "!dungeon_confirm!"=="y" (
            call :deep_swamp_dungeon
        ) else (
            echo You decide not to enter the swamp dungeon.
            pause >nul
            goto explore_area
        )
    )
    if "!explore_choice!"=="11" (
        echo.
        echo You encounter a random event!
        timeout /t 1 >nul
        echo You find a coin on the ground!
        set /a "coins+=1"
        pause >nul
        goto explore_area
    )
    if "!explore_choice!"=="12" goto main_menu
    goto explore_area
)

if "!location!"=="VARROCK" (
    echo You explore the busy city of Varrock.
    echo.
    echo You see:
    echo 1. The castle - King Roald's throne room
    echo 2. The church - Saradomin's temple
    echo 3. The market - Various shops and stalls
    echo 4. The museum - Historical artifacts
    echo 5. The wilderness wall - Dangerous area
    echo 6. Varrock Sewers - Underground tunnels
    echo 7. Random encounter
    echo 8. Back to main menu
    echo.
    set /p explore_choice="What do you investigate? "
    
    if "!explore_choice!"=="1" (
        echo.
        echo You approach Varrock Castle...
        timeout /t 1 >nul
        echo The guards allow you to enter.
        echo You see King Roald on his throne.
        pause >nul
        goto explore_area
    )
    if "!explore_choice!"=="2" (
        echo.
        echo You enter the Varrock Church...
        timeout /t 1 >nul
        echo The priest welcomes you to pray.
        echo You gained 20 Prayer experience!
        set /a "prayer_xp+=20"
        set /a "experience+=20"
        pause >nul
        goto explore_area
    )
    if "!explore_choice!"=="3" (
        echo.
        echo You visit the Varrock market...
        timeout /t 1 >nul
        echo Many merchants call out to you.
        pause >nul
        goto explore_area
    )
    if "!explore_choice!"=="4" (
        echo.
        echo You visit the Varrock Museum...
        timeout /t 1 >nul
        echo Interesting artifacts from RuneScape's history.
        echo You gained 15 experience!
        set /a "experience+=15"
        pause >nul
        goto explore_area
    )
    if "!explore_choice!"=="5" (
        echo.
        echo You approach the wilderness wall...
        timeout /t 1 >nul
        echo The wall separates civilization from danger.
        pause >nul
        goto explore_area
    )
    if "!explore_choice!"=="6" (
        echo.
        echo You find a manhole leading to the Varrock Sewers...
        timeout /t 1 >nul
        echo The sewers are dark and smell terrible.
        echo.
        echo [Y]es, enter the sewers
        echo [N]o, stay on the surface
        echo.
        set /p dungeon_confirm="Your choice: "
        if /i "!dungeon_confirm!"=="y" (
            call :varrock_sewers
        ) else (
            echo You decide not to enter the sewers.
            pause >nul
            goto explore_area
        )
    )
    if "!explore_choice!"=="7" (
        echo.
        echo You encounter a friendly merchant!
        echo He gives you 10 coins as a gift.
        set /a "coins+=10"
        pause >nul
        goto explore_area
    )
    if "!explore_choice!"=="8" goto main_menu
    goto explore_area
)

if "!location!"=="FALADOR" (
    echo You explore the white city of Falador.
    echo.
    echo You see:
    echo 1. The castle - White Knights' headquarters
    echo 2. The church - Monastery nearby
    echo 3. The marketplace - Premium goods
    echo 4. The mining guild - Elite miners
    echo 5. The party room - Celebration area
    echo 6. Taverley Dungeon - Underground complex
    echo 7. Dwarven Mines - Mountain tunnels
    echo 8. Endurance Track - Build stamina and health
    echo 9. Random encounter
    echo 10. Back to main menu
    echo.
    set /p explore_choice="What do you investigate? "
    
    if "!explore_choice!"=="1" (
        echo.
        echo You approach Falador Castle...
        timeout /t 1 >nul
        echo The White Knights guard the entrance.
        pause >nul
        goto explore_area
    )
    if "!explore_choice!"=="2" (
        echo.
        echo You visit the Monastery...
        timeout /t 1 >nul
        echo The monks welcome you to pray.
        echo You gained 25 Prayer experience!
        set /a "prayer_xp+=25"
        set /a "experience+=25"
        pause >nul
        goto explore_area
    )
    if "!explore_choice!"=="3" (
        echo.
        echo You explore the Falador marketplace...
        timeout /t 1 >nul
        echo Premium goods from all over RuneScape!
        pause >nul
        goto explore_area
    )
    if "!explore_choice!"=="4" (
        echo.
        echo You visit the Mining Guild...
        timeout /t 1 >nul
        echo Elite miners work tirelessly here.
        echo You gained 20 Mining experience!
        set /a "mining_xp+=20"
        set /a "experience+=20"
        pause >nul
        goto explore_area
    )
    if "!explore_choice!"=="5" (
        echo.
        echo You visit the Party Room...
        timeout /t 1 >nul
        echo People are celebrating and having fun!
        echo You gained 10 experience!
        set /a "experience+=10"
        pause >nul
        goto explore_area
    )
    if "!explore_choice!"=="6" (
        echo.
        echo You find the entrance to Taverley Dungeon...
        timeout /t 1 >nul
        echo This dungeon is known for its dangerous monsters.
        echo.
        echo [Y]es, enter Taverley Dungeon
        echo [N]o, stay in Falador
        echo.
        set /p dungeon_confirm="Your choice: "
        if /i "!dungeon_confirm!"=="y" (
            call :taverley_dungeon
        ) else (
            echo You decide not to enter Taverley Dungeon.
            pause >nul
            goto explore_area
        )
    )
    if "!explore_choice!"=="7" (
        echo.
        echo You find the entrance to the Dwarven Mines...
        timeout /t 1 >nul
        echo The dwarves allow skilled adventurers to mine here.
        echo.
        echo [Y]es, enter the Dwarven Mines
        echo [N]o, stay in Falador
        echo.
        set /p dungeon_confirm="Your choice: "
        if /i "!dungeon_confirm!"=="y" (
            call :dwarven_mines
        ) else (
            echo You decide not to enter the Dwarven Mines.
            pause >nul
            goto explore_area
        )
    )
    if "!explore_choice!"=="8" goto falador_endurance_track
    if "!explore_choice!"=="9" (
        echo.
        echo A White Knight gives you a quest tip!
        echo "Check the quest journal for new adventures."
        pause >nul
        goto explore_area
    )
    if "!explore_choice!"=="10" goto main_menu
    goto explore_area
)

if "!location!"=="ALKHARID" (
    echo You explore the desert city of Al Kharid.
    echo.
    echo You see:
    echo 1. The palace - Emir's residence
    echo 2. The duel arena - Combat tournaments
    echo 3. The scorpion pit - Dangerous attraction
    echo 4. The mining site - Valuable resources
    echo 5. The desert - Vast sand dunes
    echo 6. Endurance Track - Desert stamina training
    echo 7. Random encounter
    echo 8. Back to main menu
    echo.
    set /p explore_choice="What do you investigate? "
    
    if "!explore_choice!"=="1" (
        echo.
        echo You approach the Al Kharid Palace...
        timeout /t 1 >nul
        echo The guards let you enter the palace grounds.
        pause >nul
        goto explore_area
    )
    if "!explore_choice!"=="2" (
        echo.
        echo You visit the duel arena...
        timeout /t 1 >nul
        echo Warriors are training for combat tournaments.
        echo You gained 15 experience from watching the training!
        set /a "experience+=15"
        pause >nul
        goto explore_area
    )
    if "!explore_choice!"=="3" (
        echo.
        echo You approach the scorpion pit...
        timeout /t 1 >nul
        echo This dangerous attraction is not for the faint-hearted.
        echo You gained 10 experience from the thrill!
        set /a "experience+=10"
        pause >nul
        goto explore_area
    )
    if "!explore_choice!"=="4" (
        echo.
        echo You visit the mining site...
        timeout /t 1 >nul
        echo Valuable ores are being extracted from the desert.
        
        REM Check if player has a pickaxe
        call :count_item "Pickaxe"
        if !item_count! gtr 0 (
            echo You observe the mining techniques and learn from them.
            echo You gained 15 Mining experience!
            set /a "mining_xp+=15"
            set /a "experience+=15"
        ) else (
            echo You watch the mining operations but can't practice without a pickaxe.
            echo You gained 3 experience from observing.
            set /a "experience+=3"
        )
        pause >nul
        goto explore_area
    )
    if "!explore_choice!"=="5" (
        echo.
        echo You venture into the desert...
        timeout /t 1 >nul
        echo The vast sand dunes stretch as far as the eye can see.
        echo You gained 10 experience from the exploration!
        set /a "experience+=10"
        pause >nul
        goto explore_area
    )
    if "!explore_choice!"=="6" goto alkharid_endurance_track
    if "!explore_choice!"=="7" (
        echo.
        echo You encounter a random event!
        timeout /t 1 >nul
        echo A desert nomad gives you a water skin worth 2 coins!
        set /a "coins+=2"
        echo You gained 2 coins!
        pause >nul
        goto explore_area
    )
    if "!explore_choice!"=="8" goto main_menu
    goto explore_area
)

if "!location!"=="DRAYNOR" (
    echo You explore the quiet village of Draynor.
    echo.
    echo You see:
    echo 1. The village - Local community
    echo 2. Draynor Manor - Mysterious building
    echo 3. Farming fields - Growing crops
    echo 4. Swamp area - Dangerous waters
    echo 5. Random encounter
    echo 6. Back to main menu
    echo.
    set /p explore_choice="What do you investigate? "
    
    if "!explore_choice!"=="1" (
        echo.
        echo You explore the village of Draynor...
        timeout /t 1 >nul
        echo The village is quiet and somewhat spooky.
        pause >nul
        goto explore_area
    )
    if "!explore_choice!"=="2" (
        echo.
        echo You approach Draynor Manor...
        timeout /t 1 >nul
        echo The manor looks abandoned and mysterious.
        echo You gained 10 experience from exploring!
        set /a "experience+=10"
        pause >nul
        goto explore_area
    )
    if "!explore_choice!"=="3" (
        echo.
        echo You visit the farming fields...
        timeout /t 1 >nul
        echo Crops are growing well in the fertile soil.
        
        REM Check if player has farming tools (seeds or farming equipment)
        call :count_item "Seeds"
        set "has_seeds=!item_count!"
        call :count_item "Watering Can"
        set "has_watering_can=!item_count!"
        
        if !has_seeds! gtr 0 (
            echo You study the farming techniques and learn from the crops.
            echo You gained 10 Farming experience!
            set /a "farming_xp+=10"
            set /a "experience+=10"
        ) else (
            echo You observe the farming methods but can't practice without seeds.
            echo You gained 3 experience from observing.
            set /a "experience+=3"
        )
        pause >nul
        goto explore_area
    )
    if "!explore_choice!"=="4" (
        echo.
        echo You approach the swamp area...
        timeout /t 1 >nul
        echo The waters look dark and dangerous.
        echo You gained 5 experience from the exploration!
        set /a "experience+=5"
        pause >nul
        goto explore_area
    )
    if "!explore_choice!"=="5" (
        echo.
        echo You encounter a random event!
        timeout /t 1 >nul
        echo You find a small treasure chest with 3 coins!
        set /a "coins+=3"
        echo You gained 3 coins!
        pause >nul
        goto explore_area
    )
    if "!explore_choice!"=="6" goto main_menu
    goto explore_area
)

if "!location!"=="PORTSARIM" (
    echo You explore the bustling port of Port Sarim.
    echo.
    echo You see:
    echo 1. The docks - Ships and sailors
    echo 2. The shipyard - Ship building
    echo 3. The harbor - Fishing boats
    echo 4. The marketplace - Exotic goods
    echo 5. The beach - Sea and sand
    echo 6. Random encounter
    echo 7. Back to main menu
    echo.
    set /p explore_choice="What do you investigate? "
    
    if "!explore_choice!"=="1" (
        echo.
        echo You explore the busy docks...
        timeout /t 1 >nul
        echo Ships come and go from distant lands.
        pause >nul
        goto explore_area
    )
    if "!explore_choice!"=="2" (
        echo.
        echo You visit the shipyard...
        timeout /t 1 >nul
        echo Workers are building and repairing ships.
        echo You gained 15 experience from watching the construction!
        set /a "experience+=15"
        pause >nul
        goto explore_area
    )
    if "!explore_choice!"=="3" (
        echo.
        echo You walk to the harbor...
        timeout /t 1 >nul
        echo Fishing boats are returning with their catch.
        
        REM Check if player has a fishing rod
        call :count_item "Fishing Rod"
        if !item_count! gtr 0 (
            echo You watch the fishing boats and learn from their techniques.
            echo You gained 10 Fishing experience!
            set /a "fishing_xp+=10"
            set /a "experience+=10"
        ) else (
            echo You watch the fishing boats but can't practice without a fishing rod.
            echo You gained 2 experience from observing.
            set /a "experience+=2"
        )
        pause >nul
        goto explore_area
    )
    if "!explore_choice!"=="4" (
        echo.
        echo You explore the marketplace...
        timeout /t 1 >nul
        echo Exotic goods from distant lands are on display.
        echo You gained 10 experience from browsing!
        set /a "experience+=10"
        pause >nul
        goto explore_area
    )
    if "!explore_choice!"=="5" (
        echo.
        echo You walk along the beach...
        timeout /t 1 >nul
        echo The sea air is refreshing and the view is beautiful.
        echo You gained 5 experience from the peaceful walk!
        set /a "experience+=5"
        pause >nul
        goto explore_area
    )
    if "!explore_choice!"=="6" (
        echo.
        echo You encounter a random event!
        timeout /t 1 >nul
        echo A merchant gives you a small gift of 5 coins!
        set /a "coins+=5"
        echo You gained 5 coins!
        pause >nul
        goto explore_area
    )
    if "!explore_choice!"=="7" goto main_menu
    goto explore_area
)

if "!location!"=="MAGETOWER" (
    echo You explore the ancient Mage Tower.
    echo.
    echo You see:
    echo 1. The library - Ancient spell books
    echo 2. The training room - Practice magic
    echo 3. The rune altar - Create runes
    echo 4. The tower top - Study the stars
    echo 5. The mage shop - Magic supplies
    echo 6. Chat with other mages
    echo 7. Back to main menu
    echo.
    set /p explore_choice="What do you investigate? "
    
    if "!explore_choice!"=="1" (
        echo.
        echo You enter the ancient library...
        timeout /t 1 >nul
        echo Dusty tomes contain forgotten spells and knowledge.
        echo You gained 30 Magic experience!
        set /a "magic_xp+=30"
        set /a "experience+=30"
        pause >nul
        goto explore_area
    )
    if "!explore_choice!"=="2" (
        echo.
        echo You enter the training room...
        timeout /t 1 >nul
        echo You practice basic magic spells.
        echo You gained 25 Magic experience!
        set /a "magic_xp+=25"
        set /a "experience+=25"
        pause >nul
        goto explore_area
    )
    if "!explore_choice!"=="3" (
        echo.
        echo You approach the rune altar...
        timeout /t 1 >nul
        echo The altar hums with magical energy.
        echo You can create runes here if you have the materials.
        pause >nul
        goto explore_area
    )
    if "!explore_choice!"=="4" (
        echo.
        echo You climb to the tower top...
        timeout /t 1 >nul
        echo The view is spectacular! You can see for miles.
        echo You gained 15 experience from the climb!
        set /a "experience+=15"
        pause >nul
        goto explore_area
    )
    if "!explore_choice!"=="5" (
        echo.
        echo You visit the mage shop...
        timeout /t 1 >nul
        echo The shopkeeper offers magical supplies and runes.
        pause >nul
        goto explore_area
    )
    if "!explore_choice!"=="6" (
        echo.
        echo You join a conversation with other mages...
        timeout /t 1 >nul
        echo They discuss advanced spells and magical theory.
        echo You gained 20 Magic experience from the discussion!
        set /a "magic_xp+=20"
        set /a "experience+=20"
        pause >nul
        goto explore_area
    )
    if "!explore_choice!"=="7" goto main_menu
    goto explore_area
)

if "!location!"=="WILDERNESS" (
    echo You explore the dangerous Wilderness.
    echo.
    echo You see:
    echo 1. The wilderness wall - Border with civilization
    echo 2. Dangerous creatures - Monsters and beasts
    echo 3. Resource nodes - Mining and woodcutting spots
    echo 4. PvP hotspots - Areas where players fight
    echo 5. Ancient ruins - Mysterious structures
    echo 6. Wilderness caves - Underground exploration
    echo 7. Wilderness lake - Fishing and water activities
    echo 8. Back to main menu
    echo.
    set /p explore_choice="What do you investigate? "
    
    if "!explore_choice!"=="1" (
        echo.
        echo You approach the wilderness wall...
        timeout /t 1 >nul
        echo The wall separates the safe world from danger.
        echo You can see the safety of civilization beyond.
        pause >nul
        goto explore_area
    )
    if "!explore_choice!"=="2" (
        call :wilderness_monster_encounter
        pause >nul
        goto explore_area
    )
    if "!explore_choice!"=="3" (
        call :wilderness_resource_gathering
        pause >nul
        goto explore_area
    )
    if "!explore_choice!"=="4" (
        call :wilderness_pvp_hotspot
        pause >nul
        goto explore_area
    )
    if "!explore_choice!"=="5" (
        call :wilderness_ancient_ruins
        pause >nul
        goto explore_area
    )
    if "!explore_choice!"=="6" (
        call :wilderness_caves
        pause >nul
        goto explore_area
    )
    if "!explore_choice!"=="7" (
        call :wilderness_lake
        pause >nul
        goto explore_area
    )
    if "!explore_choice!"=="8" goto main_menu
    goto explore_area
)

if "!location!"=="WOLFMOUNTAIN" (
    echo You explore the dangerous Wolf Mountain.
    echo.
    echo You see:
    echo 1. Wolf Pack Territory - Dangerous wolf encounters
    echo 2. Mountain Caves - Underground exploration
    echo 3. Mining Spots - Rich ore deposits
    echo 4. Wolf Den - Alpha wolf territory
    echo 5. Mountain Peak - High altitude challenges
    echo 6. Ancient Ruins - Mysterious structures
    echo 7. Back to main menu
    echo.
    set /p explore_choice="What do you investigate? "
    
    if "!explore_choice!"=="1" (
        call :wolf_pack_territory
    )
    if "!explore_choice!"=="2" (
        call :mountain_caves
    )
    if "!explore_choice!"=="3" (
        call :wolf_mountain_mining
    )
    if "!explore_choice!"=="4" (
        call :wolf_den
    )
    if "!explore_choice!"=="5" (
        call :mountain_peak
    )
    if "!explore_choice!"=="6" (
        call :wolf_mountain_ruins
    )
    if "!explore_choice!"=="7" goto main_menu
    goto explore_area
)

REM Invalid choice fallback
echo Invalid choice!
pause >nul
goto explore_area

REM Invalid exploration choice fallback
echo.
echo Invalid choice! Please select a valid option.
pause >nul
goto explore_area

:lumbridge_treasure_hunting
cls
call :draw_treasure_hunting_header
echo.
echo ========================================
echo      LUMBRIDGE TREASURE HUNTING
echo ========================================
echo.
echo You search around Lumbridge for hidden treasures...
echo.
echo [Searching near the castle walls...]
timeout /t 1 >nul
echo [Checking the old well...]
timeout /t 1 >nul
echo [Exploring the church grounds...]
timeout /t 1 >nul
echo.

REM Treasure hunting success based on treasure hunting level
set /a "treasure_success=!random! %% 100"
set /a "success_chance=50 + !treasure_hunting! * 3"

if !treasure_success! lss !success_chance! (
    REM Successful treasure find
    set /a "treasure_type=!random! %% 100"
    
    if !treasure_type! lss 60 (
        echo You found some old coins near the castle!
        set /a "coins_found=!random! %% 15 + 5"
        set /a "coins+=!coins_found!"
        echo You gained !coins_found! coins!
        set /a "treasure_hunting_xp+=20"
        set /a "experience+=20"
        echo You gained 20 Treasure Hunting experience!
        
    ) else if !treasure_type! lss 85 (
        echo You found a mysterious old key in the well!
        if defined inventory (
            set "inventory=!inventory!,Mysterious Key"
        ) else (
            set "inventory=Mysterious Key"
        )
        echo You gained 25 Treasure Hunting experience!
        set /a "treasure_hunting_xp+=25"
        set /a "experience+=25"
        
    ) else (
        echo You found an ancient artifact in the church grounds!
        if defined inventory (
            set "inventory=!inventory!,Ancient Artifact"
        ) else (
            set "inventory=Ancient Artifact"
        )
        echo You gained 35 Treasure Hunting experience!
        set /a "treasure_hunting_xp+=35"
        set /a "experience+=35"
    )
    
    call :check_level_up treasure_hunting !treasure_hunting_xp!
    
) else (
    echo You search thoroughly but find nothing of value.
    echo The area seems to have been picked clean already.
    echo.
    echo You gained 5 Treasure Hunting experience from searching.
    set /a "treasure_hunting_xp+=5"
    set /a "experience+=5"
)

echo.
pause >nul
goto explore_area

:travel_menu
cls
call :draw_travel_header
echo.
echo Available Destinations:
echo.
if not "!location!"=="LUMBRIDGE" echo 1. Lumbridge (Peaceful town)
if not "!location!"=="VARROCK" echo 2. Varrock (Major city)
if not "!location!"=="FALADOR" echo 3. Falador (Knights' city)
if not "!location!"=="ALKHARID" echo 4. Al Kharid (Desert city)
if not "!location!"=="DRAYNOR" echo 5. Draynor Village (Small village)
if not "!location!"=="PORTSARIM" echo 6. Port Sarim (Harbor town)
echo 7. The Wilderness (Dangerous PvP area)
echo 8. Mage Tower (Ancient magic studies)
if not "!location!"=="WOLFMOUNTAIN" echo 9. Wolf Mountain (Dangerous wolf territory)
echo 10. Back to main menu
echo.
set /p travel_choice="Choose location to travel to: "

if "!travel_choice!"=="1" if not "!location!"=="LUMBRIDGE" (
    echo.
    echo Traveling to Lumbridge...
    timeout /t 3 >nul
    set "location=LUMBRIDGE"
    echo Arrived in Lumbridge! The peaceful town welcomes you.
    echo.
    pause >nul
    goto main_menu
)

if "!travel_choice!"=="2" if not "!location!"=="VARROCK" (
    echo.
    echo Traveling to Varrock...
    timeout /t 3 >nul
    set "location=VARROCK"
    echo Arrived in Varrock! The busy city bustles with activity.
    echo.
    pause >nul
    goto main_menu
)

if "!travel_choice!"=="3" if not "!location!"=="FALADOR" (
    echo.
    echo Traveling to Falador...
    timeout /t 3 >nul
    set "location=FALADOR"
    echo Arrived in Falador! The white city of knights.
    echo.
    pause >nul
    goto main_menu
)

if "!travel_choice!"=="4" if not "!location!"=="ALKHARID" (
    echo.
    echo Traveling to Al Kharid...
    timeout /t 3 >nul
    set "location=ALKHARID"
    echo Arrived in Al Kharid! The desert heat is intense.
    echo.
    pause >nul
    goto main_menu
)

if "!travel_choice!"=="5" if not "!location!"=="DRAYNOR" (
    echo.
    echo Traveling to Draynor Village...
    timeout /t 3 >nul
    set "location=DRAYNOR"
    echo Arrived in Draynor Village! A quiet, somewhat spooky place.
    echo.
    pause >nul
    goto main_menu
)

if "!travel_choice!"=="6" if not "!location!"=="PORTSARIM" (
    echo.
    echo Traveling to Port Sarim...
    timeout /t 3 >nul
    set "location=PORTSARIM"
    echo Arrived in Port Sarim! The sea air fills your lungs.
    echo.
    pause >nul
    goto main_menu
)

if "!travel_choice!"=="7" if not "!location!"=="WILDERNESS" (
    echo.
    echo Traveling to The Wilderness...
    timeout /t 3 >nul
    set "location=WILDERNESS"
    echo Arrived in The Wilderness! This dangerous area is filled with PvP combat.
    echo.
    pause >nul
    goto main_menu
)

if "!travel_choice!"=="8" if not "!location!"=="MAGETOWER" (
    echo.
    echo Traveling to the Mage Tower...
    timeout /t 3 >nul
    set "location=MAGETOWER"
    echo Arrived at the Mage Tower! Ancient magic fills the air.
    echo.
    pause >nul
    goto main_menu
)

if "!travel_choice!"=="9" if not "!location!"=="WOLFMOUNTAIN" (
    echo.
    echo Traveling to Wolf Mountain...
    timeout /t 3 >nul
    set "location=WOLFMOUNTAIN"
    echo Arrived at Wolf Mountain! You hear howling in the distance.
    echo.
    pause >nul
    goto main_menu
)

if "!travel_choice!"=="10" goto main_menu

echo Invalid choice!
pause >nul
goto travel_menu

REM END OF BROKEN CODE SECTION
            echo.
            echo You approach the baker...
            timeout /t 1 >nul
            echo "Oh no! I've run out of ingredients for the Duke's birthday cake!"
            echo "I need an egg, a pot of flour, and a bucket of milk."
            echo "Can you help me find these items?"
            echo.
            echo [Y]es, I'll help you
            echo [N]o, I'm busy right now
            echo.
            set /p quest_choice="Your choice: "

            if /i "!quest_choice!"=="y" (
                if "%quest_cook%"=="0" (
                    echo.
                    echo "Wonderful! Please find me:"
                    echo "- An egg (from the chicken coop)"
                    echo "- A pot of flour (from the windmill)"
                    echo "- A bucket of milk (from the dairy farm)"
                    echo.
                    echo The Cook's Assistant quest has begun!
                    set "quest_cook=1"
                    echo.
                    pause >nul
                    goto explore_area
                ) else if "%quest_cook%"=="1" (
                    echo.
                    echo "Have you found all the ingredients yet?"
                    echo "I still need: Egg, Flour, and Milk"
                    echo.
                    pause >nul
                    goto explore_area
                ) else (
                    echo.
                    echo "Thank you again for helping me!"
                    echo "The Duke's birthday cake was a success!"
                    echo.
                    pause >nul
                    goto explore_area
                )
            ) else (
                echo.
                echo "Oh... well, if you change your mind..."
                echo.
                pause >nul
                goto explore_area
            )
        )
        goto explore_area
    )

    if "!explore_choice!"=="2" (
        echo.
        echo You enter the Lumbridge Church...
        timeout /t 1 >nul
        echo Father Aereck greets you warmly.
        echo "Welcome to Saradomin's house!"
        echo.
        echo You spend some time praying...
        echo You gained 15 Prayer experience!
        set /a "prayer_xp+=15"
        set /a "experience+=15"
        call :check_level_up prayer !prayer_xp!
        echo.
        pause >nul
        goto explore_area
    )

    if "!explore_choice!"=="3" (
        echo.
        echo You approach the windmill...
        timeout /t 1 >nul
        echo You hear grinding sounds from inside.
        echo This looks like a good place to train Cooking!
        echo.
        echo [G]o inside the windmill to get flour
        echo [B]ack to exploring
        echo.
        set /p mill_choice="What do you do? "

        if /i "!mill_choice!"=="g" (
            echo.
            echo You enter the windmill...
            timeout /t 1 >nul
            echo You find sacks of flour ready for use.
            echo.

            REM Check if player already has flour using direct method
            set "has_flour=0"
            if defined inventory (
                if "!inventory!" neq "!inventory:Pot of Flour=!" set "has_flour=1"
            )

            if !has_flour! equ 0 (
                echo You take a Pot of Flour! (+Quest item)
                if defined inventory (
                    set "inventory=!inventory!,Pot of Flour"
                ) else (
                    set "inventory=Pot of Flour"
                )
            ) else (
                echo You already have flour for your quest.
            )
            echo.
        )
        pause >nul
        goto explore_area
    )

    if "!explore_choice!"=="4" (
        call :lumbridge_river_fishing
    )

    if "!explore_choice!"=="5" (
        call :lumbridge_forest_woodcutting
    )

    if "!explore_choice!"=="6" (
        echo.
        echo You approach the chicken coop...
        timeout /t 1 >nul
        echo You see several chickens clucking around.
        echo One chicken seems to have laid an egg!
        echo.

        REM Check if player already has egg using direct method
        set "has_egg=0"
        if defined inventory (
            if "!inventory!" neq "!inventory:Egg=!" set "has_egg=1"
        )

        if !has_egg! equ 0 (
            echo You found an Egg! (+Quest item)
            if defined inventory (
                set "inventory=!inventory!,Egg"
            ) else (
                set "inventory=Egg"
            )
        ) else (
            echo You already have an egg for your quest.
        )
        echo.
        pause >nul
        goto explore_area
    )

    if "!explore_choice!"=="7" (
        echo.
        echo You approach the dairy farm...
        timeout /t 1 >nul
        echo You see cows grazing peacefully.
        echo You notice fresh milk in a bucket nearby.
        echo.

        REM Check if player already has milk using direct method
        set "has_milk=0"
        if defined inventory (
            if "!inventory!" neq "!inventory:Bucket of Milk=!" set "has_milk=1"
        )

        if !has_milk! equ 0 (
            echo You found a Bucket of Milk! (+Quest item)
            if defined inventory (
                set "inventory=!inventory!,Bucket of Milk"
            ) else (
                set "inventory=Bucket of Milk"
            )
        ) else (
            echo You already have milk for your quest.
        )
        echo.
        pause >nul
        goto explore_area
    )

    if "!explore_choice!"=="8" (
        echo.
        echo You approach the mining site...
        timeout /t 1 >nul
        echo You see various rocks and ores that can be mined.
        echo.
        echo [M]ine for ores (requires pickaxe)
        echo [B]ack to exploring
        echo.
        set /p mine_choice="What do you do? "

        if /i "!mine_choice!"=="m" (
            echo.
            echo You start mining...
            timeout /t 2 >nul

            REM Check if player has pickaxe using direct method
            set "has_pickaxe=0"
            if defined inventory (
                if "!inventory!" neq "!inventory:Pickaxe=!" set "has_pickaxe=1"
            )

            if !has_pickaxe! equ 0 (
                echo You need a pickaxe to mine!
                echo Visit a shop to buy one.
                echo.
                pause >nul
                goto explore_area
            )

            REM Mining success based on mining level
            set /a "mine_success=!random! %% 100"
            set /a "success_chance=40 + !mining! * 3"

            if !mine_success! lss !success_chance! (
                REM Mining success
                set /a "ore_type=!random! %% 100"
                if !ore_type! lss 50 (
                    echo You successfully mine some Copper Ore!
                    if defined inventory (
                        set "inventory=!inventory!,Copper Ore"
                    ) else (
                        set "inventory=Copper Ore"
                    )
                    set /a "mining_xp+=25"
                ) else if !ore_type! lss 80 (
                    echo You successfully mine some Tin Ore!
                    if defined inventory (
                        set "inventory=!inventory!,Tin Ore"
                    ) else (
                        set "inventory=Tin Ore"
                    )
                    set /a "mining_xp+=25"
                ) else if !ore_type! lss 95 (
                    echo You successfully mine some Iron Ore!
                    if defined inventory (
                        set "inventory=!inventory!,Iron Ore"
                    ) else (
                        set "inventory=Iron Ore"
                    )
                    set /a "mining_xp+=35"
                ) else (
                    echo You successfully mine some Coal!
                    if defined inventory (
                        set "inventory=!inventory!,Coal"
                    ) else (
                        set "inventory=Coal"
                    )
                    set /a "mining_xp+=50"
                )

                set /a "experience+=25"
                echo.
                echo You gained mining experience!
                call :check_level_up mining !mining_xp!
            ) else (
                echo Your pickaxe slips and you fail to mine anything.
                echo Better luck next time!
            )
            echo.
            pause >nul
            goto explore_area
        )
        goto explore_area
    )

    if "!explore_choice!"=="9" (
        REM Lumbridge Catacombs
        echo.
        echo You approach the entrance to the Lumbridge Catacombs...
        timeout /t 1 >nul
        echo Dark tunnels lead deep underground.
        echo This dungeon is dangerous - are you sure you want to enter?
        echo.
        echo [Y]es, enter the catacombs
        echo [N]o, stay on the surface
        echo.
        set /p dungeon_confirm="Your choice: "

        if /i "!dungeon_confirm!"=="y" (
            call :lumbridge_catacombs
        ) else (
            echo You decide not to enter the catacombs.
            echo.
            pause >nul
            goto explore_area
        )
    )

    if "!explore_choice!"=="10" (
        REM Deep Swamp Dungeon
        echo.
        echo You venture into the murky swamp...
        timeout /t 1 >nul
        echo The air is thick with mist and the ground is treacherous.
        echo You find the entrance to a hidden dungeon.
        echo This place looks extremely dangerous!
        echo.
        echo [Y]es, enter the deep swamp dungeon
        echo [N]o, retreat to safety
        echo.
        set /p dungeon_confirm="Your choice: "

        if /i "!dungeon_confirm!"=="y" (
            call :deep_swamp_dungeon
        ) else (
            echo You decide not to enter the swamp dungeon.
            echo.
            pause >nul
            goto explore_area
        )
    )

    if "!explore_choice!"=="11" (
        REM Random encounter
        set /a "encounter=!random! %% 4"
        if !encounter! equ 0 goto goblin_combat
        if !encounter! equ 1 goto rat_combat
        if !encounter! equ 2 goto chicken_combat
        if !encounter! equ 3 (
            echo.
            echo You find a coin on the ground!
            set /a "coins+=1"
            echo You now have !coins! coins.
            echo.
            pause >nul
            goto explore_area
        )
    )

    if "!explore_choice!"=="12" goto main_menu
) else if "!location!"=="VARROCK" (
    REM Varrock exploration choices
    if "!explore_choice!"=="1" (
        echo.
        echo You approach Varrock Castle...
        timeout /t 1 >nul
        echo The guards allow you to enter.
        echo You see King Roald on his throne.
        echo "Welcome to Varrock, adventurer!"
        echo.
        pause >nul
        goto explore_area
    )

    if "!explore_choice!"=="2" (
        echo.
        echo You enter the Varrock Church...
        timeout /t 1 >nul
        echo The priest welcomes you to pray.
        echo You feel at peace here.
        echo.
        echo You gained 20 Prayer experience!
        set /a "prayer_xp+=20"
        set /a "experience+=20"
        call :check_level_up prayer !prayer_xp!
        echo.
        pause >nul
        goto explore_area
    )

    if "!explore_choice!"=="3" (
        echo.
        echo You visit the Varrock market...
        timeout /t 1 >nul
        echo Many merchants call out to you.
        echo This is a great place to shop!
        echo.
        pause >nul
        goto explore_area
    )

    if "!explore_choice!"=="4" (
        echo.
        echo You visit the Varrock Museum...
        timeout /t 1 >nul
        echo Interesting artifacts from RuneScape's history.
        echo You learn about the world around you.
        echo.
        echo You gained 15 experience in random skills!
        set /a "experience+=15"
        echo.
        pause >nul
        goto explore_area
    )

    if "!explore_choice!"=="5" (
        echo.
        echo You approach the wilderness wall...
        timeout /t 1 >nul
        echo The wall separates civilization from danger.
        echo You can see player killers lurking beyond.
        echo.
        pause >nul
        goto explore_area
    )

    if "!explore_choice!"=="6" (
        REM Varrock Sewers
        echo.
        echo You find a manhole leading to the Varrock Sewers...
        timeout /t 1 >nul
        echo The sewers are dark and smell terrible.
        echo Rats and worse creatures lurk in the darkness.
        echo.
        echo [Y]es, enter the sewers
        echo [N]o, stay on the surface
        echo.
        set /p dungeon_confirm="Your choice: "

        if /i "!dungeon_confirm!"=="y" (
            call :varrock_sewers
        ) else (
            echo You decide not to enter the sewers.
            echo.
            pause >nul
            goto explore_area
        )
    )

    if "!explore_choice!"=="7" (
        REM Random encounter in Varrock
        set /a "encounter=!random! %% 3"
        if !encounter! equ 0 (
            echo.
            echo You encounter a friendly merchant!
            echo He gives you 10 coins as a gift.
            set /a "coins+=10"
            echo.
            pause >nul
            goto explore_area
        ) else if !encounter! equ 1 (
            echo.
            echo You find a lost wallet on the ground!
            set /a "coins+=25"
            echo You gained 25 coins!
            echo.
            pause >nul
            goto explore_area
        ) else (
            echo.
            echo A pickpocket tries to steal from you!
            echo You catch him and he runs away.
            echo.
            pause >nul
            goto explore_area
        )
    )

    if "!explore_choice!"=="8" goto main_menu
) else if "!location!"=="FALADOR" (
    REM Falador exploration choices
    if "!explore_choice!"=="1" (
        echo.
        echo You approach Falador Castle...
        timeout /t 1 >nul
        echo The White Knights guard the entrance.
        echo "Hail, adventurer! The castle is open to you."
        echo.
        pause >nul
        goto explore_area
    )

    if "!explore_choice!"=="2" (
        echo.
        echo You visit the Monastery...
        timeout /t 1 >nul
        echo The monks welcome you to pray.
        echo You feel extremely peaceful here.
        echo.
        echo You gained 25 Prayer experience!
        set /a "prayer_xp+=25"
        set /a "experience+=25"
        call :check_level_up prayer !prayer_xp!
        echo.
        pause >nul
        goto explore_area
    )

    if "!explore_choice!"=="3" (
        echo.
        echo You explore the Falador marketplace...
        timeout /t 1 >nul
        echo Premium goods from all over RuneScape!
        echo The quality here is excellent.
        echo.
        pause >nul
        goto explore_area
    )

    if "!explore_choice!"=="4" (
        echo.
        echo You visit the Mining Guild...
        timeout /t 1 >nul
        echo Elite miners work tirelessly here.
        echo You learn some mining techniques.
        echo.
        echo You gained 20 Mining experience!
        set /a "mining_xp+=20"
        set /a "experience+=20"
        call :check_level_up mining !mining_xp!
        echo.
        pause >nul
        goto explore_area
    )

    if "!explore_choice!"=="5" (
        echo.
        echo You visit the Party Room...
        timeout /t 1 >nul
        echo People are celebrating and having fun!
        echo You join in the festivities.
        echo.
        echo You gained 10 experience in random skills!
        set /a "experience+=10"
        echo.
        pause >nul
        goto explore_area
    )

    if "!explore_choice!"=="6" (
        REM Taverley Dungeon
        echo.
        echo You find the entrance to Taverley Dungeon...
        timeout /t 1 >nul
        echo This dungeon is known for its dangerous monsters.
        echo Many adventurers have entered but few return.
        echo.
        echo [Y]es, enter Taverley Dungeon
        echo [N]o, stay in Falador
        echo.
        set /p dungeon_confirm="Your choice: "

        if /i "!dungeon_confirm!"=="y" (
            call :taverley_dungeon
        ) else (
            echo You decide not to enter Taverley Dungeon.
            echo.
            pause >nul
            goto explore_area
        )
    )

    if "!explore_choice!"=="7" (
        REM Dwarven Mines
        echo.
        echo You find the entrance to the Dwarven Mines...
        timeout /t 1 >nul
        echo The dwarves allow skilled adventurers to mine here.
        echo But beware of the creatures that lurk in the depths.
        echo.
        echo [Y]es, enter the Dwarven Mines
        echo [N]o, stay in Falador
        echo.
        set /p dungeon_confirm="Your choice: "

        if /i "!dungeon_confirm!"=="y" (
            call :dwarven_mines
        ) else (
            echo You decide not to enter the Dwarven Mines.
            echo.
            pause >nul
            goto explore_area
        )
    )

    if "!explore_choice!"=="8" (
        REM Random encounter in Falador
        set /a "encounter=!random! %% 2"
        if !encounter! equ 0 (
            echo.
            echo A White Knight gives you a quest tip!
            echo "Check the quest journal for new adventures."
            echo.
            pause >nul
            goto explore_area
        ) else (
            echo.
            echo You find a training sword on the ground!
            echo This could be useful for combat training.
            if defined inventory (
                set "inventory=!inventory!,Training Sword"
            ) else (
                set "inventory=Training Sword"
            )
            echo.
            pause >nul
            goto explore_area
        )
    )

    if "!explore_choice!"=="9" goto main_menu
) else if "!location!"=="ALKHARID" (
    REM Al Kharid exploration choices
    if "!explore_choice!"=="1" (
        echo.
        echo You approach the Al Kharid Palace...
        timeout /t 1 >nul
        echo The guards let you enter the palace grounds.
        echo The Emir's palace is beautiful.
        echo.
        pause >nul
        goto explore_area
    )

    if "!explore_choice!"=="2" (
        echo.
        echo You visit the Duel Arena...
        timeout /t 1 >nul
        echo Warriors fight in organized combat.
        echo You watch and learn some techniques.
        echo.
        echo You gained 15 Attack experience!
        set /a "attack_xp+=15"
        set /a "experience+=15"
        call :check_level_up attack !attack_xp!
        echo.
        pause >nul
        goto explore_area
    )

    if "!explore_choice!"=="3" (
        echo.
        echo You visit the Scorpion Pit...
        timeout /t 1 >nul
        echo A dangerous attraction with giant scorpions!
        echo You watch from a safe distance.
        echo.
        pause >nul
        goto explore_area
    )

    if "!explore_choice!"=="4" (
        echo.
        echo You explore the mining site...
        timeout /t 1 >nul
        echo Rich mineral deposits here.
        echo You could mine some valuable ores.
        echo.
        pause >nul
        goto explore_area
    )

    if "!explore_choice!"=="5" (
        echo.
        echo You walk through the desert...
        timeout /t 1 >nul
        echo The hot sun beats down on you.
        echo Sand dunes stretch as far as the eye can see.
        echo.
        pause >nul
        goto explore_area
    )

    if "!explore_choice!"=="6" (
        REM Random encounter in Al Kharid
        set /a "encounter=!random! %% 2"
        if !encounter! equ 0 (
            echo.
            echo A desert merchant offers you a deal!
            echo You buy some supplies for 15 coins.
            set /a "coins-=15"
            if !coins! lss 0 set "coins=0"
            echo.
            pause >nul
            goto explore_area
        ) else (
            echo.
            echo You find an oasis with fresh water!
            echo You rest and recover some health.
            set /a "currenthp+=10"
            if !currenthp! gtr !maxhp! set "currenthp=!maxhp!"
            echo You healed 10 hitpoints!
            echo.
            pause >nul
            goto explore_area
        )
    )

    if "!explore_choice!"=="7" goto main_menu
) else if "!location!"=="DRAYNOR" (
    REM Draynor exploration choices
    if "!explore_choice!"=="1" (
        echo.
        echo You explore the village of Draynor...
        timeout /t 1 >nul
        echo The village is quiet and somewhat spooky.
        echo You see villagers going about their daily tasks.
        echo.
        pause >nul
        goto explore_area
    )

    if "!explore_choice!"=="2" (
        echo.
        echo You approach Draynor Manor...
        timeout /t 1 >nul
        echo Strange sounds come from the old manor.
        echo The building looks abandoned and mysterious.
        echo.
        echo [Y]es, investigate the manor
        echo [N]o, stay away from it
        echo.
        set /p manor_choice="Your choice: "

        if /i "!manor_choice!"=="y" (
            echo.
            echo You enter the manor carefully...
            echo You find some old furniture and dusty rooms.
            echo This place has seen better days.
            echo.
            pause >nul
            goto explore_area
        ) else (
            echo You decide not to investigate the manor.
            echo.
            pause >nul
            goto explore_area
        )
    )

    if "!explore_choice!"=="3" (
        echo.
        echo You visit the farming fields...
        timeout /t 1 >nul
        echo Crops are growing in the fertile soil.
        echo You could practice farming here.
        echo.
        pause >nul
        goto explore_area
    )

    if "!explore_choice!"=="4" (
        echo.
        echo You approach the swamp area...
        timeout /t 1 >nul
        echo Dark waters hide dangerous creatures.
        echo You hear strange sounds from the depths.
        echo.
        pause >nul
        goto explore_area
    )

    if "!explore_choice!"=="5" (
        REM Random encounter in Draynor
        set /a "encounter=!random! %% 2"
        if !encounter! equ 0 (
            echo.
            echo A local farmer gives you some food!
            echo "Welcome to our village, stranger."
            set /a "currenthp+=8"
            if !currenthp! gtr !maxhp! set "currenthp=!maxhp!"
            echo You healed 8 hitpoints!
            echo.
            pause >nul
            goto explore_area
        ) else (
            echo.
            echo You find some coins in the village!
            set /a "coins+=20"
            echo You gained 20 coins!
            echo.
            pause >nul
            goto explore_area
        )
    )

    if "!explore_choice!"=="6" goto main_menu
) else if "!location!"=="PORTSARIM" (
    REM Port Sarim exploration choices
    if "!explore_choice!"=="1" (
        echo.
        echo You explore the busy docks...
        timeout /t 1 >nul
        echo Ships come and go from distant lands.
        echo Sailors and merchants bustle about.
        echo.
        pause >nul
        goto explore_area
    )

    if "!explore_choice!"=="2" (
        echo.
        echo You visit the shipyard...
        timeout /t 1 >nul
        echo Workers are building and repairing ships.
        echo The craftsmanship is impressive.
        echo.
        pause >nul
        goto explore_area
    )

    if "!explore_choice!"=="3" (
        echo.
        echo You explore the harbor area...
        timeout /t 1 >nul
        echo Fishing boats return with their catch.
        echo You could learn fishing techniques here.
        echo.
        pause >nul
        goto explore_area
    )

    if "!explore_choice!"=="4" (
        echo.
        echo You visit the marketplace...
        timeout /t 1 >nul
        echo Exotic goods from across the seas.
        echo The prices are reasonable for port goods.
        echo.
        pause >nul
        goto explore_area
    )

    if "!explore_choice!"=="5" (
        echo.
        echo You walk along the beach...
        timeout /t 1 >nul
        echo The sea air is refreshing.
        echo You could collect shells or practice fishing.
        echo.
        pause >nul
        goto explore_area
    )

    if "!explore_choice!"=="6" (
        REM Random encounter in Port Sarim
        set /a "encounter=!random! %% 2"
        if !encounter! equ 0 (
            echo.
            echo A friendly sailor shares his rations!
            echo "The sea is rough today, friend."
            set /a "currenthp+=6"
            if !currenthp! gtr !maxhp! set "currenthp=!maxhp!"
            echo You healed 6 hitpoints!
            echo.
            pause >nul
            goto explore_area
        ) else (
            echo.
            echo You find a lost coin purse on the docks!
            set /a "coins+=30"
            echo You gained 30 coins!
            echo.
            pause >nul
            goto explore_area
        )
    )

    if "!explore_choice!"=="7" goto main_menu
)

REM Handle invalid choices
echo Invalid choice!
pause >nul
goto explore_area

:travel_menu
cls
call :draw_travel_header
echo.
echo Available Destinations:
echo.
if not "%location%"=="LUMBRIDGE" echo 1. Lumbridge (Peaceful town)
if not "%location%"=="VARROCK" echo 2. Varrock (Major city)
if not "%location%"=="FALADOR" echo 3. Falador (Knights' city)
if not "%location%"=="ALKHARID" echo 4. Al Kharid (Desert city)
if not "%location%"=="DRAYNOR" echo 5. Draynor Village (Small village)
if not "%location%"=="PORTSARIM" echo 6. Port Sarim (Port town)
echo 7. Wilderness (Very dangerous!)
echo 8. Back to main menu
echo.
set /p travel_choice="Where would you like to travel? "

if "!travel_choice!"=="1" if not "!location!"=="LUMBRIDGE" (
    echo.
    echo Traveling to Lumbridge...
    timeout /t 3 >nul
    set "location=LUMBRIDGE"
    echo Arrived in Lumbridge! The peaceful town welcomes you.
    echo.
    pause >nul
    goto main_menu
)

if "!travel_choice!"=="2" if not "!location!"=="VARROCK" (
    echo.
    echo Traveling to Varrock...
    timeout /t 3 >nul
    set "location=VARROCK"
    echo Arrived in Varrock! The busy city bustles with activity.
    echo.
    pause >nul
    goto main_menu
)

if "!travel_choice!"=="3" if not "!location!"=="FALADOR" (
    echo.
    echo Traveling to Falador...
    timeout /t 3 >nul
    set "location=FALADOR"
    echo Arrived in Falador! The white city of knights.
    echo.
    pause >nul
    goto main_menu
)

if "!travel_choice!"=="4" if not "!location!"=="ALKHARID" (
    echo.
    echo Traveling to Al Kharid...
    timeout /t 3 >nul
    set "location=ALKHARID"
    echo Arrived in Al Kharid! The desert heat is intense.
    echo.
    pause >nul
    goto main_menu
)

if "!travel_choice!"=="5" if not "!location!"=="DRAYNOR" (
    echo.
    echo Traveling to Draynor Village...
    timeout /t 3 >nul
    set "location=DRAYNOR"
    echo Arrived in Draynor Village! A quiet, somewhat spooky place.
    echo.
    pause >nul
    goto main_menu
)

if "!travel_choice!"=="6" if not "!location!"=="PORTSARIM" (
    echo.
    echo Traveling to Port Sarim...
    timeout /t 3 >nul
    set "location=PORTSARIM"
    echo Arrived in Port Sarim! The sea air fills your lungs.
    echo.
    pause >nul
    goto main_menu
)

if "!travel_choice!"=="7" (
    echo.
    echo ========================================
    echo         WARNING: WILDERNESS
    echo ========================================
    echo.
    echo You are about to enter the Wilderness!
    echo.
    echo DANGER LEVEL: EXTREME
    echo.
    echo In the Wilderness you may encounter:
    echo - Other players who can attack you
    echo - Higher level monsters
    echo - Risk of losing your items and coins
    echo - No safe zones or protection
    echo.
    echo Your current inventory and coins may be lost
    echo if you are defeated by other players!
    echo.
    echo Are you sure you want to continue?
    echo.
    echo [Y]es, enter the Wilderness
    echo [N]o, stay safe in town
    echo.
    set /p wilderness_confirm="Your choice: "

    if /i "!wilderness_confirm!"=="y" (
        echo.
        echo Traveling to the Wilderness...
        timeout /t 2 >nul
        set /a "wilderness_encounter=!random! %% 100"

        REM Enhanced wilderness encounters based on player combat level
        if !combat_level! geq 20 (
            REM High-level player encounters (more dangerous)
            if !wilderness_encounter! lss 25 (
                REM Elite Player Killer encounter (25% chance)
                goto :elite_pk_encounter
            ) else if !wilderness_encounter! lss 45 (
                REM Regular Player Killer encounter (20% chance)
                goto :wilderness_pk_encounter
            ) else if !wilderness_encounter! lss 60 (
                REM Wilderness Boss encounter (15% chance)
                goto :wilderness_boss_encounter
            ) else if !wilderness_encounter! lss 75 (
                REM Dangerous escape (15% chance)
                goto :dangerous_escape
            ) else if !wilderness_encounter! lss 90 (
                REM Bandit ambush (15% chance)
                goto :bandit_ambush
            ) else (
                REM Safe exploration with high-value loot (10% chance)
                goto :wilderness_safe_exploration
            )
        ) else (
            REM Low-level player encounters (original system)
            if !wilderness_encounter! lss 40 (
            REM Player killer encounter
            :wilderness_pk_encounter
            cls
            echo.
            echo ========================================
            echo        PLAYER KILLER ENCOUNTER!
            echo ========================================
            echo.
            echo A dangerous player killer appears!
            echo They demand your items and coins!
            echo.
            REM Make wilderness level 15+ zone with challenging PKers
            set /a "pk_level=!random! %% 15 + 15"
            set /a "pk_attack=!pk_level!"
            set /a "pk_defence=!pk_level! - 2"
            if !pk_defence! lss 5 set "pk_defence=5"
            
            REM Give PKers better weapons based on level
            if !pk_level! lss 20 (
                set "pk_weapon=Iron Sword"
            ) else if !pk_level! lss 25 (
                set "pk_weapon=Steel Sword"
            ) else (
                set "pk_weapon=Adamant Sword"
            )
            
            echo Player Killer Stats:
            echo Combat Level: !pk_level!
            echo Attack: !pk_attack!
            echo Defence: !pk_defence!
            echo Weapon: !pk_weapon!
            echo.
            echo [F]ight back
            echo [R]un away (may lose some coins)
            echo [S]urrender (lose all items and coins)
            echo.
            set /p pk_choice="What do you do? "

            if /i "!pk_choice!"=="f" (
                REM Fight the player killer
                echo.
                echo You draw your weapon and prepare for PvP combat!
                timeout /t 1 >nul
                echo The Player Killer attacks!
                echo.
                
                REM Set up enemy stats for combat system
                set "enemy_name=Player Killer"
                set "enemy_level=!pk_level!"
                set /a "enemy_maxhp=!pk_level! * 3 + 10"
                set "enemy_currenthp=!enemy_maxhp!"
                set "enemy_attack=!pk_attack!"
                set "enemy_defence=!pk_defence!"
                set "enemy_weapon=!pk_weapon!"
                
                REM Add some special wilderness combat text
                echo ========================================
                echo     WILDERNESS PVP COMBAT!
                echo ========================================
                echo You: Level !combat_level! vs Player Killer: Level !pk_level!
                echo This is a fight to the death!
                echo.
                
                goto real_combat
            ) else if /i "!pk_choice!"=="r" (
                echo.
                echo You try to run away!
                set /a "escape_chance=!random! %% 100"
                if !escape_chance! lss 60 (
                    echo You manage to escape, but drop some coins in your haste!
                    set /a "coins_lost=!coins! / 4"
                    if !coins_lost! lss 5 set "coins_lost=5"
                    set /a "coins-=coins_lost"
                    if !coins! lss 0 set "coins=0"
                    echo You lost !coins_lost! coins.
                ) else (
                    echo The player killer catches you and robs you!
                    set /a "coins_lost=!coins! / 2"
                    set /a "coins-=coins_lost"
                    if !coins! lss 0 set "coins=0"
                    echo You lost !coins_lost! coins.
                )
                echo.
                pause >nul
                goto main_menu
            ) else if /i "!pk_choice!"=="s" (
                echo.
                echo You surrender to the Player Killer!
                echo "Smart choice," they say as they loot your items.
                echo You lose items and coins, but keep your life.
                echo.
                set "coins=0"
                REM Remove some random items from inventory
                call :wilderness_penalty
                echo.
                echo You are allowed to leave the Wilderness alive.
                pause >nul
                goto main_menu
            ) else (
                echo.
                echo Invalid choice! The Player Killer attacks while you hesitate!
                echo You must choose: [F]ight, [R]un, or [S]urrender!
                pause >nul
                goto wilderness_pk_encounter
            )
        ) else if !wilderness_encounter! lss 70 (
            echo You barely escape with your life!
            echo You lose 25 coins from the encounter.
            set /a "coins-=25"
            if !coins! lss 0 set "coins=0"
            echo.
            pause >nul
            goto main_menu
        ) else (
            echo You manage to escape safely... this time.
            echo You found some valuable items in the Wilderness!
            echo.

            REM Random wilderness loot
            set /a "wild_loot=!random! %% 100"
            if !wild_loot! lss 30 (
                echo You found 50 coins!
                set /a "coins+=50"
            ) else if !wild_loot! lss 60 (
                echo You found a rare herb!
                if defined inventory (
                    set "inventory=!inventory!,Rare Herb"
                ) else (
                    set "inventory=Rare Herb"
                )
            ) else if !wild_loot! lss 80 (
                echo You found some ore!
                if defined inventory (
                    set "inventory=!inventory!,Iron Ore"
                ) else (
                    set "inventory=Iron Ore"
                )
            ) else (
                echo You found nothing of value.
            )
            echo.
            pause >nul
            goto main_menu
            )
        )
    ) else (
        echo.
        echo You decide to stay in the safety of town.
        echo.
        pause >nul
        goto main_menu
    )
)

if "!travel_choice!"=="8" goto main_menu

echo Invalid choice!
pause >nul
goto travel_menu

:visit_shop
cls
call :draw_shop_scene
echo.
echo ========================================
echo         !location! GENERAL STORE
echo ========================================
echo.
if "!location!"=="LUMBRIDGE" goto lumbridge_shop
if "!location!"=="VARROCK" goto varrock_shop
if "!location!"=="FALADOR" goto falador_shop
if "!location!"=="ALKHARID" goto alkharid_shop
if "!location!"=="MAGETOWER" goto magetower_shop
echo This shop is not available at this location.
echo.
echo 0. Exit shop
goto shop_continue

:lumbridge_shop
echo Welcome to Lumbridge General Store!
echo.
echo Shopkeeper: "Hello adventurer! What can I get for you?"
echo.
echo Items for sale:
echo 1. Bread - 12 coins (Food)
echo 2. Bronze Sword - 25 coins (Weapon)
echo 3. Wooden Shield - 15 coins (Armor)
echo 4. Fishing Rod - 50 coins (Tool)
echo 5. Axe - 30 coins (Tool)
echo 6. Pickaxe - 40 coins (Tool)
echo 7. Health Potion - 35 coins (Consumable)
echo 8. Tinderbox - 5 coins (Tool)
echo 0. Exit shop
goto shop_continue

:varrock_shop
echo Welcome to Varrock Magic & Sword Shop!
echo.
echo Shopkeeper: "Finest weapons and magic in Misthalin!"
echo.
echo Items for sale:
echo 1. Iron Sword - 140 coins (Weapon)
echo 2. Iron Shield - 112 coins (Armor)
echo 3. Steel Sword - 325 coins (Weapon)
echo 4. Adamant Sword - 800 coins (Weapon)
echo 5. Staff of Fire - 200 coins (Magic Weapon)
echo 6. Air Rune - 5 coins (Magic)
echo 7. Fire Rune - 8 coins (Magic)
echo 8. Water Rune - 6 coins (Magic)
echo 9. Earth Rune - 6 coins (Magic)
echo 10. Chaos Rune - 15 coins (Magic)
echo 11. Wizard Hat - 100 coins (Magic Armor)
echo 12. Magic Study Book - 50 coins (Study Material)
echo 13. Combat Manual - 45 coins (Study Material)
echo 14. Crafting Guide - 40 coins (Study Material)
echo 15. Cooking Recipe Book - 35 coins (Study Material)
echo 16. Health Potion - 35 coins (Consumable)
echo 17. Bread - 12 coins (Food)
echo 0. Exit shop
goto shop_continue

:falador_shop
echo Welcome to Falador Shield Shop!
echo.
echo Shopkeeper: "Protection for the noble!"
echo.
echo Items for sale:
echo 1. Steel Shield - 300 coins (Armor)
echo 2. Adamant Shield - 800 coins (Armor)
echo 3. Rune Shield - 1920 coins (Armor)
echo 4. White Shield - 1440 coins (Armor)
echo 5. Health Potion - 35 coins (Consumable)
echo 6. Monk Robes - 20 coins (Clothing)
echo 0. Exit shop
goto shop_continue

:alkharid_shop
echo Welcome to Al Kharid Scimitar Shop!
echo.
echo Shopkeeper: "Finest curved blades!"
echo.
echo Items for sale:
echo 1. Steel Scimitar - 320 coins (Weapon)
echo 2. Adamant Scimitar - 800 coins (Weapon)
echo 3. Rune Scimitar - 2560 coins (Weapon)
echo 4. Dragon Scimitar - 60000 coins (Weapon)
echo 5. Health Potion - 35 coins (Consumable)
echo 6. Desert Robes - 40 coins (Clothing)
echo 0. Exit shop
goto shop_continue

:magetower_shop
echo Welcome to the Mage Tower Shop!
echo.
echo Shopkeeper: "Ancient magic awaits you, young apprentice!"
echo.
echo Items for sale:
echo 1. Air Rune - 5 coins (Magic)
echo 2. Fire Rune - 8 coins (Magic)
echo 3. Water Rune - 6 coins (Magic)
echo 4. Earth Rune - 6 coins (Magic)
echo 5. Mind Rune - 4 coins (Magic)
echo 6. Chaos Rune - 15 coins (Magic)
echo 7. Death Rune - 25 coins (Magic)
echo 8. Blood Rune - 50 coins (Magic)
echo 9. Staff of Air - 150 coins (Magic Weapon)
echo 10. Staff of Fire - 200 coins (Magic Weapon)
echo 11. Wizard Hat - 100 coins (Magic Armor)
echo 12. Magic Robes - 200 coins (Magic Armor)
echo 13. Magic Study Book - 50 coins (Study Material)
echo 14. Health Potion - 35 coins (Consumable)
echo 0. Exit shop
goto shop_continue

:shop_continue



echo.
echo Your coins: !coins!
    echo.
set /p shop_choice="What would you like to buy? "

if "%shop_choice%"=="0" goto main_menu

REM Handle purchases based on location and choice
call :handle_purchase !shop_choice! !location!
goto visit_shop

:train_skills
cls
call :draw_training_scene
echo.
echo ========================================
echo         SKILL TRAINING MENU
echo ========================================
echo.
echo Choose a skill to train:
echo.
echo Combat Skills:
echo 1. Attack Training
echo 2. Strength Training
echo 3. Defence Training
echo.
echo Gathering Skills:
echo 4. Woodcutting
echo 5. Fishing
echo 6. Mining
echo.
echo Artisan Skills:
echo 7. Cooking
echo 8. Smithing
echo 9. Crafting
    echo.
echo Support Skills:
echo 10. Prayer
echo 11. Farming
echo 12. Firemaking
    echo.
echo 0. Back to main menu
    echo.
set /p skill_choice="Choose skill to train: "

if "!skill_choice!"=="1" call :train_attack
if "!skill_choice!"=="2" call :train_strength
if "!skill_choice!"=="3" call :train_defence
if "!skill_choice!"=="4" call :train_woodcutting
if "!skill_choice!"=="5" call :train_fishing
if "!skill_choice!"=="6" call :train_mining
if "!skill_choice!"=="7" call :train_cooking
if "!skill_choice!"=="8" call :train_smithing
if "!skill_choice!"=="9" call :train_crafting
if "!skill_choice!"=="10" call :train_prayer
if "!skill_choice!"=="11" call :train_farming
if "!skill_choice!"=="12" call :train_firemaking
if "!skill_choice!"=="0" goto main_menu

echo Invalid choice!
pause >nul
goto train_skills

:quest_log
cls
call :draw_quest_header
    echo.
echo Active Quests:
    echo.

if "%quest_cook%"=="0" (
    echo 1. [AVAILABLE] Cook's Assistant
    echo    Help the Lumbridge baker make a birthday cake!
    echo    Talk to the baker near Lumbridge Castle.
    echo    Requirements: None
    echo    Reward: 300 XP Cooking, 500 coins, Chef's Hat
    echo    Status: Available (Talk to baker)
    echo.
)

if "%quest_cook%"=="1" (
    echo 1. [IN PROGRESS] Cook's Assistant
    echo    You need to find: Egg, Flour, Milk
    set "has_egg=0"
    set "has_flour=0"
    set "has_milk=0"

    REM Check inventory for quest items
    call :count_item "Egg"
    if !item_count! gtr 0 set "has_egg=1"

    call :count_item "Pot of Flour"
    if !item_count! gtr 0 set "has_flour=1"

    call :count_item "Bucket of Milk"
    if !item_count! gtr 0 set "has_milk=1"

    echo    Progress: Egg [!has_egg!/1] Flour [!has_flour!/1] Milk [!has_milk!/1]
    echo    Status: In Progress
    echo.
)

if "%quest_cook%"=="2" (
    echo 1. [COMPLETED] Cook's Assistant
    echo    You successfully helped the cook!
    echo    Reward: 300 XP Cooking, 500 coins, Chef's Hat
    echo    Status: Completed
    echo.
)

REM Show other active quests
if defined quest_sheep_shearer if "%quest_sheep_shearer%"=="1" (
    echo 2. [IN PROGRESS] Sheep Shearer
    echo    You need to collect: 20 Balls of Wool
    echo    Status: In Progress
    echo.
)

if defined quest_rune_mysteries if "%quest_rune_mysteries%"=="1" (
    echo 3. [IN PROGRESS] Rune Mysteries
    echo    You need to collect: 10 Air Runes, 5 Mind Runes, 3 Chaos Runes
    echo    Status: In Progress
    echo.
)

if defined quest_dragon_slayer if "%quest_dragon_slayer%"=="1" (
    echo 4. [IN PROGRESS] Dragon Slayer
    echo    You need to defeat the dragon in Crandor
    echo    Status: In Progress
    echo.
)

if defined quest_lost_city if "%quest_lost_city%"=="1" (
    echo 5. [IN PROGRESS] Lost City
    echo    You need to craft special items and cut ancient trees
    echo    Status: In Progress
    echo.
)

if defined quest_restless_ghost if "%quest_restless_ghost%"=="1" (
    echo 6. [IN PROGRESS] The Restless Ghost
    echo    You need to help the ghost find peace
    echo    Status: In Progress
    echo.
)

if defined quest_imp_catcher if "%quest_imp_catcher%"=="1" (
    echo 7. [IN PROGRESS] Imp Catcher
    echo    You need to collect: Red, Yellow, Blue, and Black Beads
    echo    Status: In Progress
    echo.
)

if defined quest_white_knight if "%quest_white_knight%"=="1" (
    echo 8. [IN PROGRESS] White Knight Quest
    echo    You need to investigate dark magic reports
    echo    Status: In Progress
    echo.
)

if defined quest_prince_ali if "%quest_prince_ali%"=="1" (
    echo 9. [IN PROGRESS] Prince Ali Rescue
    echo    You need to rescue Prince Ali from kidnappers
    echo    Status: In Progress
    echo.
)

if defined quest_pirates_treasure if "%quest_pirates_treasure%"=="1" (
    echo 10. [IN PROGRESS] Pirate's Treasure
    echo    You need to find the missing map pieces and solve riddles
    echo    Status: In Progress
    echo.
)

echo Available Quests:
echo.
REM Sheep Shearer
if defined quest_sheep_shearer if "%quest_sheep_shearer%"=="2" (
    echo 2. [COMPLETED] Sheep Shearer
    echo    You successfully collected the wool!
    echo    Reward: 60 coins, 150 Crafting XP
    echo    Status: Completed
) else (
    echo 2. [AVAILABLE] Sheep Shearer
    echo    Collect wool from sheep for a farmer
    echo    Talk to Farmer Fred north of Lumbridge
    echo    Requirements: None
    echo    Reward: 60 coins, 150 Crafting XP
)
echo.
REM Rune Mysteries
if defined quest_rune_mysteries if "%quest_rune_mysteries%"=="2" (
    echo 3. [COMPLETED] Rune Mysteries
    echo    You successfully investigated the runes!
    echo    Reward: 1,000 XP in all skills
    echo    Status: Completed
) else (
    echo 3. [AVAILABLE] Rune Mysteries
    echo    Investigate mysterious runes found near Lumbridge
    echo    Talk to Wizard Traiborn in the Wizards' Tower
    echo    Requirements: None
    echo    Reward: 1,000 XP in all skills
)
echo.
REM Dragon Slayer
if defined quest_dragon_slayer if "%quest_dragon_slayer%"=="2" (
    echo 4. [COMPLETED] Dragon Slayer
    echo    You successfully defeated the dragon!
    echo    Reward: Dragon Slayer Cape, 18,650 XP
    echo    Status: Completed
) else (
    echo 4. [AVAILABLE] Dragon Slayer
    echo    Slay the dragon in Crandor
    echo    Talk to the Guildmaster in Champions' Guild
    echo    Requirements: Combat level 30+
    echo    Reward: Dragon Slayer Cape, 18,650 XP
)
echo.
REM Lost City
if defined quest_lost_city if "%quest_lost_city%"=="2" (
    echo 5. [COMPLETED] Lost City
    echo    You successfully found Zanaris!
    echo    Reward: Dramen Staff, 5,000 XP
    echo    Status: Completed
) else (
    echo 5. [AVAILABLE] Lost City
    echo    Find the legendary lost city of Zanaris
    echo    Talk to the adventurers near Lumbridge Swamp
    echo    Requirements: Crafting level 31+, Woodcutting level 36+
    echo    Reward: Dramen Staff, 5,000 XP
)
echo.
REM The Restless Ghost
if defined quest_restless_ghost if "%quest_restless_ghost%"=="2" (
    echo 6. [COMPLETED] The Restless Ghost
    echo    You successfully helped the ghost find peace!
    echo    Reward: 125 Prayer XP, Amulet of Ghostspeak
    echo    Status: Completed
) else (
    echo 6. [AVAILABLE] The Restless Ghost
    echo    Help a ghost find peace in Lumbridge
    echo    Talk to Father Aereck in the Lumbridge Church
    echo    Requirements: None
    echo    Reward: 125 Prayer XP, Amulet of Ghostspeak
)
echo.
REM Imp Catcher
if defined quest_imp_catcher if "%quest_imp_catcher%"=="2" (
    echo 7. [COMPLETED] Imp Catcher
    echo    You successfully caught all the imps!
    echo    Reward: 875 Magic XP, Amulet of Accuracy
    echo    Status: Completed
) else (
    echo 7. [AVAILABLE] Imp Catcher
    echo    Catch imps and return their beads
    echo    Talk to Wizard Mizgog in the Wizards' Tower
    echo    Requirements: None
    echo    Reward: 875 Magic XP, Amulet of Accuracy
)
echo.
REM White Knight Quest
if defined quest_white_knight if "%quest_white_knight%"=="2" (
    echo 8. [COMPLETED] White Knight Quest
    echo    You successfully investigated the dark magic!
    echo    Reward: White Knight Armor, 1,000 XP
    echo    Status: Completed
) else (
    echo 8. [AVAILABLE] White Knight Quest
    echo    Investigate dark magic reports for the White Knights
    echo    Talk to Sir Tiffy in Falador Castle
    echo    Requirements: Combat level 20+
    echo    Reward: White Knight Armor, 1,000 XP
)
echo.
REM Prince Ali Rescue
if defined quest_prince_ali if "%quest_prince_ali%"=="2" (
    echo 9. [COMPLETED] Prince Ali Rescue
    echo    You successfully rescued Prince Ali!
    echo    Reward: 1,000 coins, 500 XP
    echo    Status: Completed
) else (
    echo 9. [AVAILABLE] Prince Ali Rescue
    echo    Rescue Prince Ali from kidnappers
    echo    Talk to Osman in Al Kharid Palace
    echo    Requirements: None
    echo    Reward: 1,000 coins, 500 XP
)
echo.
REM Pirate's Treasure
if defined quest_pirates_treasure if "%quest_pirates_treasure%"=="2" (
    echo 10. [COMPLETED] Pirate's Treasure
    echo    You successfully found the pirate's treasure!
    echo    Reward: 2,000 coins, Pirate's Hat, 1,000 XP
    echo    Status: Completed
) else (
    echo 10. [AVAILABLE] Pirate's Treasure
    echo    Find a pirate's treasure on a mysterious island
    echo    Talk to Redbeard Frank in Port Sarim
    echo    Requirements: None
    echo    Reward: 2,000 coins, Pirate's Hat, 1,000 XP
)
echo.
echo [C]omplete Quest - [B]ack to main menu
set /p quest_choice="Choose action: "



if /i "!quest_choice!"=="c" (
    set /p quest_number="Which quest number to complete? "
    if "!quest_number!"=="1" if "%quest_cook%"=="1" (
        call :check_quest_completion
    ) else if "!quest_number!"=="2" if defined quest_sheep_shearer if "%quest_sheep_shearer%"=="1" (
        call :check_sheep_shearer_completion
    ) else if "!quest_number!"=="3" if defined quest_rune_mysteries if "%quest_rune_mysteries%"=="1" (
        call :check_rune_mysteries_completion
    ) else if "!quest_number!"=="4" if defined quest_dragon_slayer if "%quest_dragon_slayer%"=="1" (
        call :check_dragon_slayer_completion
    ) else if "!quest_number!"=="5" if defined quest_lost_city if "%quest_lost_city%"=="1" (
        call :check_lost_city_completion
    ) else if "!quest_number!"=="6" if defined quest_restless_ghost if "%quest_restless_ghost%"=="1" (
        call :check_restless_ghost_completion
    ) else if "!quest_number!"=="7" if defined quest_imp_catcher if "%quest_imp_catcher%"=="1" (
        call :check_imp_catcher_completion
    ) else if "!quest_number!"=="8" if defined quest_white_knight if "%quest_white_knight%"=="1" (
        call :check_white_knight_completion
    ) else if "!quest_number!"=="9" if defined quest_prince_ali if "%quest_prince_ali%"=="1" (
        call :check_prince_ali_completion
    ) else if "!quest_number!"=="10" if defined quest_pirates_treasure if "%quest_pirates_treasure%"=="1" (
        call :check_pirates_treasure_completion
    ) else (
        echo.
        echo You can't complete that quest yet, or it's not in progress.
        echo.
        pause >nul
    )
)

if /i "!quest_choice!"=="b" goto main_menu

goto quest_log

:magic_journal
cls
call :draw_location_header
echo.
echo ========================================
echo           MAGIC JOURNAL
echo ========================================
echo.
echo Magic Level: !magic! (!magic_xp! XP)
echo.

REM Display runes inventory
echo Runes Inventory:
echo.

REM Check if runes variables exist, if not initialize them
if not defined air_runes set "air_runes=0"
if not defined water_runes set "water_runes=0"
if not defined earth_runes set "earth_runes=0"
if not defined fire_runes set "fire_runes=0"
if not defined mind_runes set "mind_runes=0"
if not defined body_runes set "body_runes=0"
if not defined chaos_runes set "chaos_runes=0"
if not defined death_runes set "death_runes=0"
if not defined blood_runes set "blood_runes=0"
if not defined soul_runes set "soul_runes=0"

set "has_runes=0"
if !air_runes! gtr 0 (
    echo Air Runes: !air_runes!
    set "has_runes=1"
)
if !water_runes! gtr 0 (
    echo Water Runes: !water_runes!
    set "has_runes=1"
)
if !earth_runes! gtr 0 (
    echo Earth Runes: !earth_runes!
    set "has_runes=1"
)
if !fire_runes! gtr 0 (
    echo Fire Runes: !fire_runes!
    set "has_runes=1"
)
if !mind_runes! gtr 0 (
    echo Mind Runes: !mind_runes!
    set "has_runes=1"
)
if !body_runes! gtr 0 (
    echo Body Runes: !body_runes!
    set "has_runes=1"
)
if !chaos_runes! gtr 0 (
    echo Chaos Runes: !chaos_runes!
    set "has_runes=1"
)
if !death_runes! gtr 0 (
    echo Death Runes: !death_runes!
    set "has_runes=1"
)
if !blood_runes! gtr 0 (
    echo Blood Runes: !blood_runes!
    set "has_runes=1"
)
if !soul_runes! gtr 0 (
    echo Soul Runes: !soul_runes!
    set "has_runes=1"
)

if !has_runes!==0 (
    echo No runes in inventory
)
echo.

echo Available Spells:
echo.

REM Display available spells based on magic level
if !magic! geq 1 (
    echo Wind Strike (Level 1) - 1 Air, 1 Mind
)
if !magic! geq 3 (
    echo Water Strike (Level 3) - 1 Water, 1 Mind
)
if !magic! geq 5 (
    echo Earth Strike (Level 5) - 1 Earth, 1 Mind
)
if !magic! geq 7 (
    echo Fire Strike (Level 7) - 1 Fire, 1 Mind
)
if !magic! geq 9 (
    echo Wind Bolt (Level 9) - 2 Air, 1 Chaos
)
if !magic! geq 11 (
    echo Water Bolt (Level 11) - 2 Water, 1 Chaos
)
if !magic! geq 13 (
    echo Earth Bolt (Level 13) - 2 Earth, 1 Chaos
)
if !magic! geq 15 (
    echo Fire Bolt (Level 15) - 2 Fire, 1 Chaos
)

echo.
echo 1. Cast Spell
echo 2. View Rune Crafting
echo 3. Back to Main Menu
echo.
set /p magic_choice="Choose option: "

if "%magic_choice%"=="1" goto cast_spell
if "%magic_choice%"=="2" goto rune_crafting
if "%magic_choice%"=="3" goto main_menu

echo Invalid choice! Press any key to continue...
pause >nul
goto magic_journal

:cast_spell
cls
call :draw_location_header
echo.
echo ========================================
echo           CAST SPELL
echo ========================================
echo.
echo Select a spell to cast:
echo.

set "spell_available=0"

REM Check available spells and runes
if !magic! geq 1 if !air_runes! geq 1 if !mind_runes! geq 1 (
    echo 1. Wind Strike (1 Air, 1 Mind)
    set "spell_available=1"
)
if !magic! geq 3 if !water_runes! geq 1 if !mind_runes! geq 1 (
    echo 2. Water Strike (1 Water, 1 Mind)
    set "spell_available=1"
)
if !magic! geq 5 if !earth_runes! geq 1 if !mind_runes! geq 1 (
    echo 3. Earth Strike (1 Earth, 1 Mind)
    set "spell_available=1"
)
if !magic! geq 7 if !fire_runes! geq 1 if !mind_runes! geq 1 (
    echo 4. Fire Strike (1 Fire, 1 Mind)
    set "spell_available=1"
)
if !magic! geq 9 if !air_runes! geq 2 if !chaos_runes! geq 1 (
    echo 5. Wind Bolt (2 Air, 1 Chaos)
    set "spell_available=1"
)
if !magic! geq 11 if !water_runes! geq 2 if !chaos_runes! geq 1 (
    echo 6. Water Bolt (2 Water, 1 Chaos)
    set "spell_available=1"
)
if !magic! geq 13 if !earth_runes! geq 2 if !chaos_runes! geq 1 (
    echo 7. Earth Bolt (2 Earth, 1 Chaos)
    set "spell_available=1"
)
if !magic! geq 15 if !fire_runes! geq 2 if !chaos_runes! geq 1 (
    echo 8. Fire Bolt (2 Fire, 1 Chaos)
    set "spell_available=1"
)

if !spell_available!==0 (
    echo No spells available. You need higher magic level or more runes.
    echo.
    echo Press any key to continue...
    pause >nul
    goto magic_journal
)

echo.
echo 0. Back to Magic Journal
echo.
set /p spell_choice="Choose spell: "

if "%spell_choice%"=="0" goto magic_journal
if "%spell_choice%"=="1" if !magic! geq 1 if !air_runes! geq 1 if !mind_runes! geq 1 goto cast_wind_strike
if "%spell_choice%"=="2" if !magic! geq 3 if !water_runes! geq 1 if !mind_runes! geq 1 goto cast_water_strike
if "%spell_choice%"=="3" if !magic! geq 5 if !earth_runes! geq 1 if !mind_runes! geq 1 goto cast_earth_strike
if "%spell_choice%"=="4" if !magic! geq 7 if !fire_runes! geq 1 if !mind_runes! geq 1 goto cast_fire_strike
if "%spell_choice%"=="5" if !magic! geq 9 if !air_runes! geq 2 if !chaos_runes! geq 1 goto cast_wind_bolt
if "%spell_choice%"=="6" if !magic! geq 11 if !water_runes! geq 2 if !chaos_runes! geq 1 goto cast_water_bolt
if "%spell_choice%"=="7" if !magic! geq 13 if !earth_runes! geq 2 if !chaos_runes! geq 1 goto cast_earth_bolt
if "%spell_choice%"=="8" if !magic! geq 15 if !fire_runes! geq 2 if !chaos_runes! geq 1 goto cast_fire_bolt

echo Invalid choice! Press any key to continue...
pause >nul
goto cast_spell

:cast_wind_strike
set /a "air_runes-=1"
set /a "mind_runes-=1"
set /a "magic_xp+=5"
call :check_level_up magic !magic_xp!
echo You cast Wind Strike! You gained 5 Magic XP.
echo.
echo Press any key to continue...
pause >nul
goto magic_journal

:cast_water_strike
set /a "water_runes-=1"
set /a "mind_runes-=1"
set /a "magic_xp+=7"
call :check_level_up magic !magic_xp!
echo You cast Water Strike! You gained 7 Magic XP.
echo.
echo Press any key to continue...
pause >nul
goto magic_journal

:cast_earth_strike
set /a "earth_runes-=1"
set /a "mind_runes-=1"
set /a "magic_xp+=9"
call :check_level_up magic !magic_xp!
echo You cast Earth Strike! You gained 9 Magic XP.
echo.
echo Press any key to continue...
pause >nul
goto magic_journal

:cast_fire_strike
set /a "fire_runes-=1"
set /a "mind_runes-=1"
set /a "magic_xp+=11"
call :check_level_up magic !magic_xp!
echo You cast Fire Strike! You gained 11 Magic XP.
echo.
echo Press any key to continue...
pause >nul
goto magic_journal

:cast_wind_bolt
set /a "air_runes-=2"
set /a "chaos_runes-=1"
set /a "magic_xp+=15"
call :check_level_up magic !magic_xp!
echo You cast Wind Bolt! You gained 15 Magic XP.
echo.
echo Press any key to continue...
pause >nul
goto magic_journal

:cast_water_bolt
set /a "water_runes-=2"
set /a "chaos_runes-=1"
set /a "magic_xp+=18"
call :check_level_up magic !magic_xp!
echo You cast Water Bolt! You gained 18 Magic XP.
echo.
echo Press any key to continue...
pause >nul
goto magic_journal

:cast_earth_bolt
set /a "earth_runes-=2"
set /a "chaos_runes-=1"
set /a "magic_xp+=21"
call :check_level_up magic !magic_xp!
echo You cast Earth Bolt! You gained 21 Magic XP.
echo.
echo Press any key to continue...
pause >nul
goto magic_journal

:cast_fire_bolt
set /a "fire_runes-=2"
set /a "chaos_runes-=1"
set /a "magic_xp+=24"
call :check_level_up magic !magic_xp!
echo You cast Fire Bolt! You gained 24 Magic XP.
echo.
echo Press any key to continue...
pause >nul
goto magic_journal

:quest_hub
cls
call :draw_quest_hub_header
echo.
echo ========================================
echo         QUEST HUB - ACCEPT NEW QUESTS
echo ========================================
echo.
echo Welcome to the Quest Hub! Here you can find and accept new quests.
echo.
echo Available Quest Givers:
echo.
echo 1. [LUMBRIDGE] Cook's Assistant - Talk to the baker near Lumbridge Castle
echo 2. [LUMBRIDGE] Sheep Shearer - Talk to Farmer Fred north of Lumbridge
echo 3. [LUMBRIDGE] Rune Mysteries - Talk to Wizard Traiborn in the Wizards' Tower
echo 4. [VARROCK] Dragon Slayer - Talk to the Guildmaster in Champions' Guild
echo 5. [LUMBRIDGE] Lost City - Talk to the adventurers near Lumbridge Swamp
echo 6. [LUMBRIDGE] The Restless Ghost - Talk to Father Aereck in Lumbridge Church
echo 7. [LUMBRIDGE] Imp Catcher - Talk to Wizard Mizgog in the Wizards' Tower
echo 8. [FALADOR] White Knight Quest - Talk to Sir Tiffy in Falador Castle
echo 9. [ALKHARID] Prince Ali Rescue - Talk to Osman in Al Kharid Palace
echo 10. [PORTSARIM] Pirate's Treasure - Talk to Redbeard Frank in Port Sarim
echo.
echo [T]ravel to quest giver - [B]ack to main menu
set /p hub_choice="Choose action: "

if /i "!hub_choice!"=="t" (
    echo.
    echo Which quest giver would you like to visit?
    echo.
    echo 1. Cook's Assistant (Lumbridge)
    echo 2. Sheep Shearer (Lumbridge)
    echo 3. Rune Mysteries (Lumbridge)
    echo 4. Dragon Slayer (Varrock)
    echo 5. Lost City (Lumbridge)
    echo 6. The Restless Ghost (Lumbridge)
    echo 7. Imp Catcher (Lumbridge)
    echo 8. White Knight Quest (Falador)
    echo 9. Prince Ali Rescue (Al Kharid)
    echo 10. Pirate's Treasure (Port Sarim)
    echo 0. Back to quest hub
    echo.
    set /p travel_quest="Choose quest to travel to: "
    
    if "!travel_quest!"=="1" (
        echo.
        echo Traveling to Lumbridge Castle for Cook's Assistant...
        timeout /t 2 >nul
        set "location=LUMBRIDGE"
        echo You arrive at Lumbridge Castle and find the baker.
        echo.
        call :cooks_assistant_quest_giver
    ) else if "!travel_quest!"=="2" (
        echo.
        echo Traveling to Lumbridge for Sheep Shearer...
        timeout /t 2 >nul
        set "location=LUMBRIDGE"
        echo You arrive north of Lumbridge and find Farmer Fred.
        echo.
        call :sheep_shearer_quest_giver
    ) else if "!travel_quest!"=="3" (
        echo.
        echo Traveling to Wizards' Tower for Rune Mysteries...
        timeout /t 2 >nul
        set "location=LUMBRIDGE"
        echo You arrive at the Wizards' Tower and find Wizard Traiborn.
        echo.
        call :rune_mysteries_quest_giver
    ) else if "!travel_quest!"=="4" (
        echo.
        echo Traveling to Varrock for Dragon Slayer...
        timeout /t 2 >nul
        echo You arrive at the Champions' Guild and find the Guildmaster.
        echo.
        call :dragon_slayer_quest_giver
    ) else if "!travel_quest!"=="5" (
        echo.
        echo Traveling to Lumbridge Swamp for Lost City...
        timeout /t 2 >nul
        set "location=LUMBRIDGE"
        echo You arrive at Lumbridge Swamp and find the adventurers.
        echo.
        call :lost_city_quest_giver
    ) else if "!travel_quest!"=="6" (
        echo.
        echo Traveling to Lumbridge Church for The Restless Ghost...
        timeout /t 2 >nul
        set "location=LUMBRIDGE"
        echo You arrive at Lumbridge Church and find Father Aereck.
        echo.
        call :restless_ghost_quest_giver
    ) else if "!travel_quest!"=="7" (
        echo.
        echo Traveling to Wizards' Tower for Imp Catcher...
        timeout /t 2 >nul
        set "location=LUMBRIDGE"
        echo You arrive at the Wizards' Tower and find Wizard Mizgog.
        echo.
        call :imp_catcher_quest_giver
    ) else if "!travel_quest!"=="8" (
        echo.
        echo Traveling to Falador for White Knight Quest...
        timeout /t 2 >nul
        set "location=FALADOR"
        echo You arrive at Falador Castle and find Sir Tiffy.
        echo.
        call :white_knight_quest_giver
    ) else if "!travel_quest!"=="9" (
        echo.
        echo Traveling to Al Kharid for Prince Ali Rescue...
        timeout /t 2 >nul
        set "location=ALKHARID"
        echo You arrive at Al Kharid Palace and find Osman.
        echo.
        call :prince_ali_quest_giver
    ) else if "!travel_quest!"=="10" (
        echo.
        echo Traveling to Port Sarim for Pirate's Treasure...
        timeout /t 2 >nul
        set "location=PORTSARIM"
        echo You arrive at Port Sarim and find Redbeard Frank.
        echo.
        call :prince_ali_quest_giver
    ) else if "!travel_quest!"=="0" (
        goto quest_hub
    ) else (
        echo Invalid choice!
        pause >nul
        goto quest_hub
    )
) else if /i "!hub_choice!"=="b" (
    goto main_menu
) else (
    echo Invalid choice!
    pause >nul
    goto quest_hub
)

goto quest_hub

:inventory_management
cls
echo.
echo  +================================================+
echo  ^|           INVENTORY MANAGEMENT               ^|
echo  ^|                                                ^|
echo  ^|    Organize your items and equipment!        ^|
echo  ^|                                                ^|
echo  +================================================+
echo.
echo Your Inventory:
echo.

REM Display items with management options
call :parse_inventory

echo.
echo [U]se item - [D]rop item - [E]xamine item - [B]ack
set /p inv_manage_choice="Choose action: "

if /i "!inv_manage_choice!"=="u" goto use_item
if /i "!inv_manage_choice!"=="d" goto drop_item
if /i "!inv_manage_choice!"=="e" goto examine_item
if /i "!inv_manage_choice!"=="b" goto open_inventory

goto inventory_management

:use_item
echo.
set /p item_number="Which item number to use? "

REM Get the item from inventory
call :get_item_by_number !item_number!
if defined selected_item (
    call :use_item_function "!selected_item!"
) else (
    echo Invalid item number!
    pause >nul
)
goto inventory_management

:drop_item
echo.
set /p item_number="Which item number to drop? "

REM Get the item first to show what was dropped
call :get_item_by_number !item_number!
if defined selected_item (
    call :remove_item "!selected_item!"
    echo !selected_item! dropped!
) else (
    echo Invalid item number!
)
pause >nul
goto inventory_management

:examine_item
echo.
set /p item_number="Which item number to examine? "

REM Examine item
call :get_item_by_number !item_number!
if defined selected_item (
    call :examine_item_function "!selected_item!"
) else (
    echo Invalid item number!
    pause >nul
)
goto inventory_management

:falador_endurance_track
cls
call :draw_location_header
echo.
echo ========================================
echo      FALADOR ENDURANCE TRACK
echo ========================================
echo.
echo You approach the Falador Endurance Track...
echo.
echo The track is designed to test your stamina and endurance.
echo Choose your difficulty level:
echo.
echo 1. Easy Track (15 HP XP) - Simple obstacles
echo 2. Medium Track (25 HP XP) - Moderate challenges
echo 3. Hard Track (40 HP XP) - Extreme difficulty
echo 4. Back to Exploration
echo.
set /p track_choice="Choose difficulty: "

if "%track_choice%"=="1" goto run_falador_track_easy
if "%track_choice%"=="2" goto run_falador_track_medium
if "%track_choice%"=="3" goto run_falador_track_hard
if "%track_choice%"=="4" goto explore_area

echo Invalid choice! Press any key to continue...
pause >nul
goto falador_endurance_track

:run_falador_track_easy
cls
call :draw_location_header
echo.
echo ========================================
echo    FALADOR ENDURANCE TRACK - EASY
echo ========================================
echo.
echo You start the easy track...
echo.
echo Track Progress: [                    ] 0%%
echo.
echo You approach the first obstacle: Low Hurdle
echo.
echo Press SPACE to jump over the hurdle!
echo Press any other key to fail the jump.
echo.
set /p jump_input="Press a key: "
if "!jump_input!"==" " (
    echo ✓ Successfully jumped over the hurdle!
    echo Track Progress: [####                ] 25%%
    echo.
    timeout /t 1 >nul
    echo You approach the second obstacle: Small Wall
    echo.
    echo Press W to climb the wall!
    echo Press any other key to fail the climb.
    echo.
    set /p climb_input="Press a key: "
    if "!climb_input!"=="w" (
        echo ✓ Successfully climbed the wall!
        echo Track Progress: [########            ] 50%%
        echo.
        timeout /t 1 >nul
        echo You approach the third obstacle: Balance Beam
        echo.
        echo Press B to balance across the beam!
        echo Press any other key to fall off.
        echo.
        set /p balance_input="Press a key: "
        if "!balance_input!"=="b" (
            echo ✓ Successfully balanced across the beam!
            echo Track Progress: [############        ] 75%%
            echo.
            timeout /t 1 >nul
            echo You approach the final obstacle: Finish Line
            echo.
            echo Press F to sprint to the finish!
            echo Press any other key to slow down.
            echo.
            set /p finish_input="Press a key: "
            if "!finish_input!"=="f" (
                echo ✓ You completed the easy track perfectly!
                echo Track Progress: [####################] 100%%
                echo.
                echo You gained 20 Hitpoints experience! (Bonus for perfect run!)
                set /a "hitpoints_xp+=20"
                set /a "experience+=20"
            ) else (
                echo You completed the easy track!
                echo Track Progress: [####################] 100%%
                echo.
                echo You gained 15 Hitpoints experience!
                set /a "hitpoints_xp+=15"
                set /a "experience+=15"
            )
        ) else (
            echo ✗ You fell off the balance beam!
            echo You still completed the track but with difficulty.
            echo Track Progress: [####################] 100%%
            echo.
            echo You gained 10 Hitpoints experience!
            set /a "hitpoints_xp+=10"
            set /a "experience+=10"
        )
    ) else (
        echo ✗ You failed to climb the wall!
        echo You still completed the track but with difficulty.
        echo Track Progress: [####################] 100%%
        echo.
        echo You gained 10 Hitpoints experience!
        set /a "hitpoints_xp+=10"
        set /a "experience+=10"
    )
) else (
    echo ✗ You failed to jump over the hurdle!
    echo You still completed the track but with difficulty.
    echo Track Progress: [####################] 100%%
    echo.
    echo You gained 10 Hitpoints experience!
    set /a "hitpoints_xp+=10"
    set /a "experience+=10"
)
call :check_level_up hitpoints !hitpoints_xp!
echo.
echo Press any key to continue...
pause >nul
goto falador_endurance_track

:run_falador_track_medium
cls
call :draw_location_header
echo.
echo ========================================
echo   FALADOR ENDURANCE TRACK - MEDIUM
echo ========================================
echo.
echo You start the medium track...
echo.
echo Track Progress: [                    ] 0%%
echo.
echo You approach the first obstacle: Medium Hurdle
echo.
echo Press SPACE twice quickly to jump over the hurdle!
echo You have 3 seconds to press SPACE again.
echo.
set /p jump_input="Press SPACE: "
if "!jump_input!"==" " (
    echo ✓ First jump successful! Press SPACE again quickly!
    timeout /t 3 >nul
    set /p jump_input2="Press SPACE again: "
    if "!jump_input2!"==" " (
        echo ✓ Successfully jumped over the medium hurdle!
        echo Track Progress: [####                ] 25%%
        echo.
        timeout /t 1 >nul
        echo You approach the second obstacle: Climbing Wall
        echo.
        echo Press W, A, S, D in sequence to climb!
        echo Press W to start climbing...
        echo.
        set /p climb_input="Press W: "
        if "!climb_input!"=="w" (
            echo ✓ Started climbing! Press A to move left...watch out for the obstacles..
            set /p climb_input2="Press A: "
            if "!climb_input2!"=="a" (
                echo ✓ Moved left! Press S to continue...
                set /p climb_input3="Press S: "
                if "!climb_input3!"=="s" (
                    echo ✓ Continued climbing! Press D to finish...
                    set /p climb_input4="Press D: "
                    if "!climb_input4!"=="d" (
                        echo ✓ Successfully climbed the wall!
                        echo Track Progress: [########            ] 50%%
                        echo.
                        timeout /t 1 >nul
                        echo You approach the third obstacle: Rope Swing
                        echo.
                        echo Press R to grab the rope and swing!
                        echo Press any other key to miss the rope.
                        echo.
                        set /p rope_input="Press R: "
                        if "!rope_input!"=="r" (
                            echo ✓ Successfully grabbed the rope!
                            echo Track Progress: [############        ] 75%%
                            echo.
                            timeout /t 1 >nul
                            echo You approach the final obstacle: Sprint Finish
                            echo.
                            echo Press F three times quickly to sprint!
                            echo.
                            set /p sprint_input="Press F: "
                            if "!sprint_input!"=="f" (
                                set /p sprint_input2="Press F again: "
                                if "!sprint_input2!"=="f" (
                                    set /p sprint_input3="Press F one more time: "
                                    if "!sprint_input3!"=="f" (
                                        echo ✓ You completed the medium track perfectly!
                                        echo Track Progress: [####################] 100%%
                                        echo.
                                        echo You gained 35 Hitpoints experience! (Bonus for perfect run!)
                                        set /a "hitpoints_xp+=35"
                                        set /a "experience+=35"
                                    ) else (
                                        echo You completed the medium track!
                                        echo Track Progress: [####################] 100%%
                                        echo.
                                        echo You gained 25 Hitpoints experience!
                                        set /a "hitpoints_xp+=25"
                                        set /a "experience+=25"
                                    )
                                ) else (
                                    echo You completed the medium track!
                                    echo Track Progress: [####################] 100%%
                                    echo.
                                    echo You gained 25 Hitpoints experience!
                                    set /a "hitpoints_xp+=25"
                                    set /a "experience+=25"
                                )
                            ) else (
                                echo You completed the medium track!
                                echo Track Progress: [####################] 100%%
                                echo.
                                echo You gained 25 Hitpoints experience!
                                set /a "hitpoints_xp+=25"
                                set /a "experience+=25"
                            )
                        ) else (
                            echo ✗ You missed the rope!
                            echo You still completed the track but with difficulty.
                            echo Track Progress: [####################] 100%%
                            echo.
                            echo You gained 20 Hitpoints experience!
                            set /a "hitpoints_xp+=20"
                            set /a "experience+=20"
                        )
                    ) else (
                        echo ✗ You failed to finish climbing!
                        echo You still completed the track but with difficulty.
                        echo Track Progress: [####################] 100%%
                        echo.
                        echo You gained 20 Hitpoints experience!
                        set /a "hitpoints_xp+=20"
                        set /a "experience+=20"
                    )
                ) else (
                    echo ✗ You failed to continue climbing!
                    echo You still completed the track but with difficulty.
                    echo Track Progress: [####################] 100%%
                    echo.
                    echo You gained 20 Hitpoints experience!
                    set /a "hitpoints_xp+=20"
                    set /a "experience+=20"
                )
            ) else (
                echo ✗ You failed to move left!
                echo You still completed the track but with difficulty.
                echo Track Progress: [####################] 100%%
                echo.
                echo You gained 20 Hitpoints experience!
                set /a "hitpoints_xp+=20"
                set /a "experience+=20"
            )
        ) else (
            echo ✗ You failed to start climbing!
            echo You still completed the track but with difficulty.
            echo Track Progress: [####################] 100%%
            echo.
            echo You gained 20 Hitpoints experience!
            set /a "hitpoints_xp+=20"
            set /a "experience+=20"
        )
    ) else (
        echo ✗ You failed the second jump!
        echo You still completed the track but with difficulty.
        echo Track Progress: [####################] 100%%
        echo.
        echo You gained 20 Hitpoints experience!
        set /a "hitpoints_xp+=20"
        set /a "experience+=20"
    )
) else (
    echo ✗ You failed the first jump!
    echo You still completed the track but with difficulty.
    echo Track Progress: [####################] 100%%
    echo.
    echo You gained 20 Hitpoints experience!
    set /a "hitpoints_xp+=20"
    set /a "experience+=20"
)
call :check_level_up hitpoints !hitpoints_xp!
echo.
echo Press any key to continue...
pause >nul
goto falador_endurance_track

:run_falador_track_hard
cls
call :draw_location_header
echo.
echo ========================================
echo    FALADOR ENDURANCE TRACK - HARD
echo ========================================
echo.
echo You start the hard track...
echo.
echo Track Progress: [                    ] 0%%
echo.
echo You approach the first obstacle: High Hurdle
echo.
echo Press SPACE three times in sequence to jump!
echo You have 2 seconds between each press.
echo.
set /p jump_input="Press SPACE: "
if "!jump_input!"==" " (
    echo ✓ First jump! Press SPACE again quickly!
    timeout /t 2 >nul
    set /p jump_input2="Press SPACE: "
    if "!jump_input2!"==" " (
        echo ✓ Second jump! Press SPACE one more time!
        timeout /t 2 >nul
        set /p jump_input3="Press SPACE: "
        if "!jump_input3!"==" " (
            echo ✓ Successfully jumped over the high hurdle!
            echo Track Progress: [####                ] 25%%
            echo.
            timeout /t 1 >nul
            echo You approach the second obstacle: Extreme Climbing Wall
            echo.
            echo Press W, A, S, D, W, A in sequence to climb!
            echo Press W to start...
            echo.
            set /p climb_input="Press W: "
            if "!climb_input!"=="w" (
                echo ✓ Started! Press A...
                set /p climb_input2="Press A: "
                if "!climb_input2!"=="a" (
                    echo ✓ Moved left! Press S...
                    set /p climb_input3="Press S: "
                    if "!climb_input3!"=="s" (
                        echo ✓ Continued! Press D...
                        set /p climb_input4="Press D: "
                        if "!climb_input4!"=="d" (
                            echo ✓ Moved right! Press W...
                            set /p climb_input5="Press W: "
                            if "!climb_input5!"=="w" (
                                echo ✓ Climbed up! Press A to finish...
                                set /p climb_input6="Press A: "
                                if "!climb_input6!"=="a" (
                                    echo ✓ Successfully climbed the extreme wall!
                                    echo Track Progress: [########            ] 50%%
                                    echo.
                                    timeout /t 1 >nul
                                    echo You approach the third obstacle: Rope Swing + Balance
                                    echo.
                                    echo Press R to grab rope, then B to balance!
                                    echo.
                                    set /p rope_input="Press R: "
                                    if "!rope_input!"=="r" (
                                        echo ✓ Grabbed rope! Press B to balance...
                                        set /p balance_input="Press B: "
                                        if "!balance_input!"=="b" (
                                            echo ✓ Successfully swung and balanced!
                                            echo Track Progress: [############        ] 75%%
                                            echo.
                                            timeout /t 1 >nul
                                            echo You approach the final obstacle: Extreme Sprint
                                            echo.
                                            echo Press F, F, F, F, F in rapid succession!
                                            echo.
                                            set /p sprint_input="Press F: "
                                            if "!sprint_input!"=="f" (
                                                set /p sprint_input2="Press F: "
                                                if "!sprint_input2!"=="f" (
                                                    set /p sprint_input3="Press F: "
                                                    if "!sprint_input3!"=="f" (
                                                        set /p sprint_input4="Press F: "
                                                        if "!sprint_input4!"=="f" (
                                                            set /p sprint_input5="Press F: "
                                                            if "!sprint_input5!"=="f" (
                                                                echo ✓ You completed the hard track perfectly!
                                                                echo Track Progress: [####################] 100%%
                                                                echo.
                                                                echo You gained 60 Hitpoints experience! (Perfect run bonus!)
                                                                set /a "hitpoints_xp+=60"
                                                                set /a "experience+=60"
                                                            ) else (
                                                                echo You completed the hard track!
                                                                echo Track Progress: [####################] 100%%
                                                                echo.
                                                                echo You gained 40 Hitpoints experience!
                                                                set /a "hitpoints_xp+=40"
                                                                set /a "experience+=40"
                                                            )
                                                        ) else (
                                                            echo You completed the hard track!
                                                            echo Track Progress: [####################] 100%%
                                                            echo.
                                                            echo You gained 40 Hitpoints experience!
                                                            set /a "hitpoints_xp+=40"
                                                            set /a "experience+=40"
                                                        )
                                                    ) else (
                                                        echo You completed the hard track!
                                                        echo Track Progress: [####################] 100%%
                                                        echo.
                                                        echo You gained 40 Hitpoints experience!
                                                        set /a "hitpoints_xp+=40"
                                                        set /a "experience+=40"
                                                    )
                                                ) else (
                                                    echo You completed the hard track!
                                                    echo Track Progress: [####################] 100%%
                                                    echo.
                                                    echo You gained 40 Hitpoints experience!
                                                    set /a "hitpoints_xp+=40"
                                                    set /a "experience+=40"
                                                )
                                            ) else (
                                                echo You completed the hard track!
                                                echo Track Progress: [####################] 100%%
                                                echo.
                                                echo You gained 40 Hitpoints experience!
                                                set /a "hitpoints_xp+=40"
                                                set /a "experience+=40"
                                            )
                                        ) else (
                                            echo ✗ You failed to balance!
                                            echo You still completed the track but with difficulty.
                                            echo Track Progress: [####################] 100%%
                                            echo.
                                            echo You gained 30 Hitpoints experience!
                                            set /a "hitpoints_xp+=30"
                                            set /a "experience+=30"
                                        )
                                    ) else (
                                        echo ✗ You missed the rope!
                                        echo You still completed the track but with difficulty.
                                        echo Track Progress: [####################] 100%%
                                        echo.
                                        echo You gained 30 Hitpoints experience!
                                        set /a "hitpoints_xp+=30"
                                        set /a "experience+=30"
                                    )
                                ) else (
                                    echo ✗ You failed to finish climbing!
                                    echo You still completed the track but with difficulty.
                                    echo Track Progress: [####################] 100%%
                                    echo.
                                    echo You gained 30 Hitpoints experience!
                                    set /a "hitpoints_xp+=30"
                                    set /a "experience+=30"
                                )
                            ) else (
                                echo ✗ You failed to climb up!
                                echo You still completed the track but with difficulty.
                                echo Track Progress: [####################] 100%%
                                echo.
                                echo You gained 30 Hitpoints experience!
                                set /a "hitpoints_xp+=30"
                                set /a "experience+=30"
                            )
                        ) else (
                            echo ✗ You failed to move right!
                            echo You still completed the track but with difficulty.
                            echo Track Progress: [####################] 100%%
                            echo.
                            echo You gained 30 Hitpoints experience!
                            set /a "hitpoints_xp+=30"
                            set /a "experience+=30"
                        )
                    ) else (
                        echo ✗ You failed to continue!
                        echo You still completed the track but with difficulty.
                        echo Track Progress: [####################] 100%%
                        echo.
                        echo You gained 30 Hitpoints experience!
                        set /a "hitpoints_xp+=30"
                        set /a "experience+=30"
                    )
                ) else (
                    echo ✗ You failed to move left!
                    echo You still completed the track but with difficulty.
                    echo Track Progress: [####################] 100%%
                    echo.
                    echo You gained 30 Hitpoints experience!
                    set /a "hitpoints_xp+=30"
                    set /a "experience+=30"
                )
            ) else (
                echo ✗ You failed to start climbing!
                echo You still completed the track but with difficulty.
                echo Track Progress: [####################] 100%%
                echo.
                echo You gained 30 Hitpoints experience!
                set /a "hitpoints_xp+=30"
                set /a "experience+=30"
            )
        ) else (
            echo ✗ You failed the third jump!
            echo You still completed the track but with difficulty.
            echo Track Progress: [####################] 100%%
            echo.
            echo You gained 30 Hitpoints experience!
            set /a "hitpoints_xp+=30"
            set /a "experience+=30"
        )
    ) else (
        echo ✗ You failed the second jump!
        echo You still completed the track but with difficulty.
        echo Track Progress: [####################] 100%%
        echo.
        echo You gained 30 Hitpoints experience!
        set /a "hitpoints_xp+=30"
        set /a "experience+=30"
    )
) else (
    echo ✗ You failed the first jump!
    echo You still completed the track but with difficulty.
    echo Track Progress: [####################] 100%%
    echo.
    echo You gained 30 Hitpoints experience!
    set /a "hitpoints_xp+=30"
    set /a "experience+=30"
)
call :check_level_up hitpoints !hitpoints_xp!
echo.
echo Press any key to continue...
pause >nul
goto falador_endurance_track

:alkharid_endurance_track
cls
call :draw_location_header
echo.
echo ========================================
echo     AL KHARID ENDURANCE TRACK
echo ========================================
echo.
echo You approach the Al Kharid Endurance Track...
echo.
echo The desert track tests your stamina in extreme heat.
echo Choose your difficulty level:
echo.
echo 1. Easy Track (20 HP XP) - Simple desert obstacles
echo 2. Medium Track (35 HP XP) - Moderate heat challenges
echo 3. Hard Track (50 HP XP) - Extreme desert difficulty
echo 4. Back to Exploration
echo.
set /p track_choice="Choose difficulty: "

if "%track_choice%"=="1" goto run_alkharid_track_easy
if "%track_choice%"=="2" goto run_alkharid_track_medium
if "%track_choice%"=="3" goto run_alkharid_track_hard
if "%track_choice%"=="4" goto explore_area

echo Invalid choice! Press any key to continue...
pause >nul
goto alkharid_endurance_track

:run_alkharid_track_easy
echo.
echo You start the easy desert track...
timeout /t 2 >nul
echo Running through simple sand dunes...
timeout /t 2 >nul
echo Jumping over low sand barriers...
timeout /t 2 >nul
echo Climbing small rock formations...
timeout /t 2 >nul
echo You complete the easy desert track!
echo You gained 20 Hitpoints experience!
set /a "hitpoints_xp+=20"
set /a "experience+=20"
call :check_level_up hitpoints !hitpoints_xp!
echo.
echo Press any key to continue...
pause >nul
goto alkharid_endurance_track

:run_alkharid_track_medium
echo.
echo You start the medium desert track...
timeout /t 2 >nul
echo Running through moderate sand dunes...
timeout /t 2 >nul
echo Jumping over medium sand barriers...
timeout /t 2 >nul
echo Climbing challenging rock formations...
timeout /t 2 >nul
echo You complete the medium desert track!
echo You gained 35 Hitpoints experience!
set /a "hitpoints_xp+=35"
set /a "experience+=35"
call :check_level_up hitpoints !hitpoints_xp!
echo.
echo Press any key to continue...
pause >nul
goto alkharid_endurance_track

:run_alkharid_track_hard
echo.
echo You start the hard desert track...
timeout /t 2 >nul
echo Running through extreme sand dunes...
timeout /t 2 >nul
echo Jumping over high sand barriers...
timeout /t 2 >nul
echo Climbing difficult rock formations...
timeout /t 2 >nul
echo You complete the hard desert track!
echo You gained 50 Hitpoints experience!
set /a "hitpoints_xp+=50"
set /a "experience+=50"
call :check_level_up hitpoints !hitpoints_xp!
echo.
echo Press any key to continue...
pause >nul
goto alkharid_endurance_track

:exit_game
cls
call :draw_exit_scene
echo.
echo ========================================
echo         SAVING GAME...
echo ========================================
echo.

REM Save all game data
(
echo !gamemode!^>!location!^>!level!^>!maxhp!^>!currenthp!^>!experience!^>!attack!^>!strength!^>!defence!^>!hitpoints!^>!ranged!^>!magic!^>!woodcutting!^>!fishing!^>!mining!^>!cooking!^>!smithing!^>!crafting!^>!fletching!^>!herblore!^>!prayer!^>!slayer!^>!farming!^>!firemaking!^>!treasure_hunting!^>!coins!^>!inventory!^>!quest_cook!^>!air_runes!^>!water_runes!^>!earth_runes!^>!fire_runes!^>!mind_runes!^>!body_runes!^>!chaos_runes!^>!death_runes!^>!blood_runes!^>!soul_runes!^>!music_enabled!^>!music_volume!^>!current_track!
) > savegame.dat

REM Verify save file was created
if exist "savegame.dat" (
    echo Game saved successfully to savegame.dat!
    for /f %%A in ("savegame.dat") do echo File size: %%~zA bytes
) else (
    echo ERROR: Save file was not created!
)
echo.
echo ========================================
echo         GAME EXITED SUCCESSFULLY
echo ========================================
echo.
echo Thank you for playing RuneScape Fan Game!
echo.
echo Final Statistics:
echo -----------------
echo Combat Level: !combat_level!
echo Total Level: !level!
echo Total Experience: !experience!
echo Gold Coins: !coins!
echo Current Location: !location!
echo.
echo Skills Summary:
echo Attack: !attack! ^| Strength: !strength! ^| Defence: !defence!
echo Hitpoints: !hitpoints! ^| Ranged: !ranged! ^| Magic: !magic!
echo Woodcutting: !woodcutting! ^| Fishing: !fishing! ^| Mining: !mining!
echo Cooking: !cooking! ^| Smithing: !smithing! ^| Crafting: !crafting!
echo Prayer: !prayer! ^| Slayer: !slayer! ^| Farming: !farming!
echo Firemaking: !firemaking! ^| Treasure Hunting: !treasure_hunting!
echo.
echo ========================================
echo.
echo Your progress has been saved automatically.
echo.
echo Would you like to play again? Run RuneScapeFangame.bat
echo.
echo ========================================
echo Press any key to close...
pause >nul
exit /b 0

REM ============================================
REM     HELPER FUNCTIONS
REM ============================================

:parse_inventory
REM Parse comma-separated inventory items
if not defined inventory (
    echo Your inventory is empty.
    goto :eof
)
setlocal enabledelayedexpansion
set "temp_inventory=!inventory!"
set "item_counter=0"
:parse_loop
for /f "tokens=1,* delims=," %%a in ("!temp_inventory!") do (
    set /a "item_counter+=1"
    echo !item_counter!. %%a
    set "temp_inventory=%%b"
    if defined temp_inventory goto parse_loop
)
endlocal & set "item_count=%item_counter%"
goto :eof

:get_item_by_number
REM Parameters: %1 = item number to get
REM Returns: selected_item variable
set "selected_item="
if not defined inventory goto :eof
setlocal enabledelayedexpansion
set "temp_inventory=!inventory!"
set "current_num=0"
:get_item_loop
for /f "tokens=1,* delims=," %%a in ("!temp_inventory!") do (
    set /a "current_num+=1"
    if !current_num! equ %1 (
        endlocal & set "selected_item=%%a"
        goto :eof
    )
    set "temp_inventory=%%b"
    if defined temp_inventory goto get_item_loop
)
endlocal
goto :eof

:count_item
REM Parameters: %1 = item name to count
REM Returns: item_count variable
set "item_count=0"
if not defined inventory goto :eof
setlocal enabledelayedexpansion
set "temp_inventory=!inventory!"
:count_loop
for /f "tokens=1,* delims=," %%a in ("!temp_inventory!") do (
    if "%%a"=="%~1" set /a "item_count+=1"
    set "temp_inventory=%%b"
    if defined temp_inventory goto count_loop
)
endlocal & set "item_count=%item_count%"
goto :eof

:calculate_total_level
REM Calculate total level as sum of all skill levels
set /a "level=!attack!+!strength!+!defence!+!hitpoints!+!ranged!+!magic!+!woodcutting!+!fishing!+!mining!+!cooking!+!smithing!+!crafting!+!fletching!+!herblore!+!prayer!+!slayer!+!farming!+!firemaking!+!treasure_hunting!"
goto :eof

:calculate_damage
REM Parameters: %1 = attack variable name, %2 = defence variable name
REM Enhanced combat with equipment bonuses
call :get_equipment_bonus
set /a "attack_power=!%1! + !weapon_bonus! + (!random! %% 5)"
set /a "defence_power=!%2! + !armor_bonus! + (!random! %% 3)"
set /a "damage=attack_power - defence_power"
if !damage! lss 0 set "damage=0"
if !damage! gtr 15 set "damage=15"
goto :eof

:get_equipment_bonus
REM Calculate bonuses from equipped items
set "weapon_bonus=0"
set "armor_bonus=0"
set "magic_bonus=0"

REM Check for weapons in inventory
if defined inventory (
    if "!inventory!" neq "!inventory:Dragon Scimitar=!" set "weapon_bonus=8"
    if "!inventory!" neq "!inventory:Rune Scimitar=!" set "weapon_bonus=6"
    if "!inventory!" neq "!inventory:Adamant Scimitar=!" set "weapon_bonus=5"
    if "!inventory!" neq "!inventory:Steel Scimitar=!" set "weapon_bonus=4"
    if "!inventory!" neq "!inventory:Adamant Sword=!" set "weapon_bonus=5"
    if "!inventory!" neq "!inventory:Steel Sword=!" set "weapon_bonus=3"
    if "!inventory!" neq "!inventory:Iron Sword=!" set "weapon_bonus=2"
    if "!inventory!" neq "!inventory:Bronze Sword=!" set "weapon_bonus=1"
    
    REM Check for armor/shields
    if "!inventory!" neq "!inventory:Rune Shield=!" set "armor_bonus=6"
    if "!inventory!" neq "!inventory:Adamant Shield=!" set "armor_bonus=4"
    if "!inventory!" neq "!inventory:Steel Shield=!" set "armor_bonus=3"
    if "!inventory!" neq "!inventory:Iron Shield=!" set "armor_bonus=2"
    if "!inventory!" neq "!inventory:Wooden Shield=!" set "armor_bonus=1"
    
    REM Check for armor sets
    if "!inventory!" neq "!inventory:Hard Leather Armor=!" set "armor_bonus=!armor_bonus!+3"
    if "!inventory!" neq "!inventory:Leather Armor=!" set "armor_bonus=!armor_bonus!+2"
    if "!inventory!" neq "!inventory:Studded Leather=!" set "armor_bonus=!armor_bonus!+4"
    if "!inventory!" neq "!inventory:Green Dragonhide=!" set "armor_bonus=!armor_bonus!+5"
    
    REM Check for magic equipment
    if "!inventory!" neq "!inventory:Staff of Fire=!" set "magic_bonus=3"
    if "!inventory!" neq "!inventory:Staff of Water=!" set "magic_bonus=3"
    if "!inventory!" neq "!inventory:Staff of Earth=!" set "magic_bonus=3"
    if "!inventory!" neq "!inventory:Staff of Air=!" set "magic_bonus=3"
    if "!inventory!" neq "!inventory:Wizard Hat=!" set "magic_bonus=!magic_bonus!+2"
    if "!inventory!" neq "!inventory:Wizard Robes=!" set "magic_bonus=!magic_bonus!+2"
)
goto :eof

:calculate_damage_direct
REM Parameters: %1 = attack value, %2 = defence value
set /a "attack_power=%1 + (!random! %% 5)"
set /a "defence_power=%2 + (!random! %% 3)"
set /a "damage=attack_power - defence_power"
if !damage! lss 0 set "damage=0"
if !damage! gtr 5 set "damage=5"
goto :eof

:check_level_up
REM Parameters: %1 = skill name, %2 = current xp
set "skill_name=%1"
set "current_xp=%2"

REM Calculate required XP for next level (simple formula)
set "current_level=!%skill_name%!"
set /a "required_xp=(!current_level! - 1) * 100"

if !current_xp! geq !required_xp! (
    set /a "%skill_name%+=1"
    echo.
    echo *** LEVEL UP! ***
    echo Your !skill_name! level increased to !%skill_name! !
    echo *** LEVEL UP! ***
    echo.

    REM Recalculate total level
    call :calculate_total_level

    REM Update max HP if hitpoints leveled up
    if "!skill_name!"=="hitpoints" (
        set /a "maxhp+=1"
        set /a "currenthp+=1"
    )
    
    REM Special handling for treasure hunting level ups
    if "!skill_name!"=="treasure_hunting" (
        echo You've become better at finding hidden treasures!
        echo Your treasure hunting skills have improved!
    )
)

goto :eof



:cast_magic_spell
REM Magic Combat System with runes
echo.
echo ========================================
echo         MAGIC SPELLBOOK
echo ========================================
echo.

REM Safety check - ensure we're in combat mode
if not defined enemy_name (
    echo ERROR: You must be in combat to cast magic spells!
    echo Please enter combat training first.
    pause >nul
    goto :eof
)

if not defined enemy_currenthp (
    echo ERROR: Combat variables not properly initialized!
    echo Please restart combat training.
    pause >nul
    goto :eof
)

if not defined enemy_maxhp (
    echo ERROR: Enemy health not properly set!
    echo Please restart combat training.
    pause >nul
    goto :eof
)

echo Available Spells (Level !magic!):
echo.

if !magic! geq 1 (
    echo 1. Wind Strike (Level 1) - Requires Air Rune
)
if !magic! geq 5 (
    echo 2. Water Strike (Level 5) - Requires Water Rune + Air Rune
)
if !magic! geq 9 (
    echo 3. Earth Strike (Level 9) - Requires Earth Rune + Air Rune
)
if !magic! geq 13 (
    echo 4. Fire Strike (Level 13) - Requires Fire Rune + Air Rune
)
if !magic! geq 17 (
    echo 5. Wind Bolt (Level 17) - Requires Air Rune + Chaos Rune
)
if !magic! geq 23 (
    echo 6. Water Bolt (Level 23) - Requires Water + Air + Chaos Runes
)
echo 0. Back to combat

echo.
set /p spell_choice="Choose spell: "

if "!spell_choice!"=="1" (
    if !magic! geq 1 (
        call :cast_wind_strike
    ) else (
        echo You need level 1 Magic to cast Wind Strike!
        pause >nul
    )
)

if "!spell_choice!"=="2" (
    if !magic! geq 5 (
        call :cast_water_strike
    ) else (
        echo You need level 5 Magic to cast Water Strike!
        pause >nul
    )
)

if "!spell_choice!"=="3" (
    if !magic! geq 9 (
        call :cast_earth_strike
    ) else (
        echo You need level 9 Magic to cast Earth Strike!
        pause >nul
    )
)

if "!spell_choice!"=="4" (
    if !magic! geq 13 (
        call :cast_fire_strike
    ) else (
        echo You need level 13 Magic to cast Fire Strike!
        pause >nul
    )
)

if "!spell_choice!"=="5" (
    if !magic! geq 17 (
        call :cast_wind_bolt
    ) else (
        echo You need level 17 Magic to cast Wind Bolt!
        pause >nul
    )
)

if "!spell_choice!"=="6" (
    if !magic! geq 23 (
        call :cast_water_bolt
    ) else (
        echo You need level 23 Magic to cast Water Bolt!
        pause >nul
    )
)

if "!spell_choice!"=="0" goto :eof

if "!spell_choice!" neq "1" if "!spell_choice!" neq "2" if "!spell_choice!" neq "3" if "!spell_choice!" neq "4" if "!spell_choice!" neq "5" if "!spell_choice!" neq "6" if "!spell_choice!" neq "0" (
    echo Invalid choice!
    pause >nul
)
goto :eof

:cast_wind_strike
REM Safety check - ensure we're in combat
if not defined enemy_name (
    echo ERROR: Combat not initialized properly!
    pause >nul
    goto :eof
)

REM Check for Air Rune
call :count_item "Air Rune"
if !item_count! lss 1 (
    echo You need an Air Rune to cast Wind Strike!
    pause >nul
    goto :eof
)

echo.
echo You cast Wind Strike!
timeout /t 1 >nul
echo A gust of wind strikes your enemy!

call :get_equipment_bonus
set /a "magic_damage=2 + !magic_bonus! + (!random! %% 3)"
echo You deal !magic_damage! magic damage!

REM Safety check before modifying enemy health
if defined enemy_currenthp (
    set /a "enemy_currenthp-=!magic_damage!"
    if !enemy_currenthp! lss 0 set "enemy_currenthp=0"
) else (
    echo ERROR: Enemy health not set!
    pause >nul
    goto :eof
)

REM Use the rune
call :remove_item "Air Rune"

REM Gain magic XP
set /a "magic_xp+=7"
set /a "experience+=7"
echo You gained 7 Magic experience!
call :check_level_up magic !magic_xp!

if !enemy_currenthp! leq 0 (
    if defined enemy_name (
        echo The !enemy_name! is defeated by your magic!
    ) else (
        echo The enemy is defeated by your magic!
    )
    echo You gained 50 total experience!
    set /a "experience+=50"
    call :random_loot
    pause >nul
    goto combat_training
)
pause >nul
goto :eof

:cast_fire_strike
REM Check for Fire Rune and Air Rune
call :count_item "Fire Rune"
if !item_count! lss 1 (
    echo You need a Fire Rune to cast Fire Strike!
    pause >nul
    goto :eof
)
call :count_item "Air Rune"
if !item_count! lss 1 (
    echo You need an Air Rune to cast Fire Strike!
    pause >nul
    goto :eof
)

echo.
echo You cast Fire Strike!
timeout /t 1 >nul
echo Flames engulf your enemy!

call :get_equipment_bonus
set /a "magic_damage=4 + !magic_bonus! + (!random! %% 4)"
echo You deal !magic_damage! fire damage!
set /a "enemy_currenthp-=!magic_damage!"

REM Use the runes
call :remove_item "Fire Rune"
call :remove_item "Air Rune"

REM Gain magic XP
set /a "magic_xp+=11"
set /a "experience+=11"
echo You gained 11 Magic experience!
call :check_level_up magic !magic_xp!

if !enemy_currenthp! leq 0 (
    echo The !enemy_name! burns away from your magic!
    echo You gained 60 total experience!
    set /a "experience+=60"
    call :random_loot
    pause >nul
    goto combat_training
)
pause >nul
goto :eof

:cast_water_strike
REM Check for Water Rune and Air Rune
call :count_item "Water Rune"
if !item_count! lss 1 (
    echo You need a Water Rune to cast Water Strike!
    pause >nul
    goto :eof
)
call :count_item "Air Rune"
if !item_count! lss 1 (
    echo You need an Air Rune to cast Water Strike!
    pause >nul
    goto :eof
)

echo.
echo You cast Water Strike!
timeout /t 1 >nul
echo A blast of water strikes your enemy!

call :get_equipment_bonus
set /a "magic_damage=3 + !magic_bonus! + (!random! %% 3)"
echo You deal !magic_damage! water damage!
set /a "enemy_currenthp-=!magic_damage!"

REM Use the runes
call :remove_item "Water Rune"
call :remove_item "Air Rune"

REM Gain magic XP
set /a "magic_xp+=8"
set /a "experience+=8"
echo You gained 8 Magic experience!
call :check_level_up magic !magic_xp!

if !enemy_currenthp! leq 0 (
    echo The !enemy_name! is washed away by your magic!
    echo You gained 55 total experience!
    set /a "experience+=55"
    call :random_loot
    pause >nul
    goto combat_training
)
pause >nul
goto :eof

:cast_earth_strike
REM Check for Earth Rune and Air Rune
call :count_item "Earth Rune"
if !item_count! lss 1 (
    echo You need an Earth Rune to cast Earth Strike!
    pause >nul
    goto :eof
)
call :count_item "Air Rune"
if !item_count! lss 1 (
    echo You need an Air Rune to cast Earth Strike!
    pause >nul
    goto :eof
)

echo.
echo You cast Earth Strike!
timeout /t 1 >nul
echo Rocks and earth pummel your enemy!

call :get_equipment_bonus
set /a "magic_damage=3 + !magic_bonus! + (!random! %% 4)"
echo You deal !magic_damage! earth damage!
set /a "enemy_currenthp-=!magic_damage!"

REM Use the runes
call :remove_item "Earth Rune"
call :remove_item "Air Rune"

REM Gain magic XP
set /a "magic_xp+=9"
set /a "experience+=9"
echo You gained 9 Magic experience!
call :check_level_up magic !magic_xp!

if !enemy_currenthp! leq 0 (
    echo The !enemy_name! is crushed by your magic!
    echo You gained 55 total experience!
    set /a "experience+=55"
    call :random_loot
    pause >nul
    goto combat_training
)
pause >nul
goto :eof

:cast_wind_bolt
REM Check for Air Rune and Chaos Rune
call :count_item "Air Rune"
if !item_count! lss 1 (
    echo You need an Air Rune to cast Wind Bolt!
    pause >nul
    goto :eof
)
call :count_item "Chaos Rune"
if !item_count! lss 1 (
    echo You need a Chaos Rune to cast Wind Bolt!
    pause >nul
    goto :eof
)

echo.
echo You cast Wind Bolt!
timeout /t 1 >nul
echo A powerful gust of wind slams into your enemy!

call :get_equipment_bonus
set /a "magic_damage=5 + !magic_bonus! + (!random! %% 4)"
echo You deal !magic_damage! wind damage!
set /a "enemy_currenthp-=!magic_damage!"

REM Use the runes
call :remove_item "Air Rune"
call :remove_item "Chaos Rune"

REM Gain magic XP
set /a "magic_xp+=13"
set /a "experience+=13"
echo You gained 13 Magic experience!
call :check_level_up magic !magic_xp!

if !enemy_currenthp! leq 0 (
    echo The !enemy_name! is blown away by your magic!
    echo You gained 65 total experience!
    set /a "experience+=65"
    call :random_loot
    pause >nul
    goto combat_training
)
pause >nul
goto :eof

:cast_water_bolt
REM Check for Water, Air, and Chaos Runes
call :count_item "Water Rune"
if !item_count! lss 1 (
    echo You need a Water Rune to cast Water Bolt!
    pause >nul
    goto :eof
)
call :count_item "Air Rune"
if !item_count! lss 1 (
    echo You need an Air Rune to cast Water Bolt!
    pause >nul
    goto :eof
)
call :count_item "Chaos Rune"
if !item_count! lss 1 (
    echo You need a Chaos Rune to cast Water Bolt!
    pause >nul
    goto :eof
)

echo.
echo You cast Water Bolt!
timeout /t 1 >nul
echo A powerful torrent of water crashes into your enemy!

call :get_equipment_bonus
set /a "magic_damage=6 + !magic_bonus! + (!random! %% 5)"
echo You deal !magic_damage! water damage!
set /a "enemy_currenthp-=!magic_damage!"

REM Use the runes
call :remove_item "Water Rune"
call :remove_item "Air Rune"
call :remove_item "Chaos Rune"

REM Gain magic XP
set /a "magic_xp+=16"
set /a "experience+=16"
echo You gained 16 Magic experience!
call :check_level_up magic !magic_xp!

if !enemy_currenthp! leq 0 (
    echo The !enemy_name! is swept away by your magic!
    echo You gained 70 total experience!
    set /a "experience+=70"
    call :random_loot
    pause >nul
    goto combat_training
)
pause >nul
goto :eof

:random_loot
set /a "loot_roll=!random! %% 100"

if !loot_roll! lss 15 (
    echo You find some coins on the enemy!
    set /a "coins+=5"
) else if !loot_roll! lss 30 (
    echo You find a health potion!
    if defined inventory (
        set "inventory=!inventory!,Health Potion"
    ) else (
        set "inventory=Health Potion"
    )
) else if !loot_roll! lss 50 (
    REM Random bone type drop
    set /a "bone_type=!random! %% 100"
    if !bone_type! lss 40 (
        echo You find some regular bones!
        if defined inventory (
            set "inventory=!inventory!,Bones"
        ) else (
            set "inventory=Bones"
        )
    ) else if !bone_type! lss 70 (
        echo You find some big bones!
        if defined inventory (
            set "inventory=!inventory!,Big Bones"
        ) else (
            set "inventory=Big Bones"
        )
    ) else if !bone_type! lss 85 (
        echo You find some baby dragon bones!
        if defined inventory (
            set "inventory=!inventory!,Baby Dragon Bones"
        ) else (
            set "inventory=Baby Dragon Bones"
        )
    ) else (
        echo You find some wolf bones!
        if defined inventory (
            set "inventory=!inventory!,Wolf Bones"
        ) else (
            set "inventory=Wolf Bones"
        )
    )
) else if !loot_roll! lss 70 (
    echo You find 2 coins!
    set /a "coins+=2"
) else (
    echo You find 3 coins!
    set /a "coins+=3"
)

goto :eof

:remove_item
REM Parameters: %1 = item name to remove
set "item_to_remove=%1"
set "new_inventory="
if not defined inventory goto :eof

setlocal enabledelayedexpansion
set "temp_inventory=!inventory!"
set "first_item=true"
:remove_loop
for /f "tokens=1,* delims=," %%a in ("!temp_inventory!") do (
    if not "%%a"=="!item_to_remove!" (
        if defined first_item (
            set "new_inventory=%%a"
            set "first_item="
        ) else (
            set "new_inventory=!new_inventory!,%%a"
        )
    )
    set "temp_inventory=%%b"
    if defined temp_inventory goto remove_loop
)
endlocal & set "inventory=%new_inventory%"
goto :eof

:add_item
REM Parameters: %1 = item name to add
set "item_to_add=%1"
if not defined inventory (
    set "inventory=%item_to_add%"
) else (
    set "inventory=%inventory%,%item_to_add%"
)
goto :eof

:check_quest_completion
REM Check if Cook's Assistant quest can be completed
set "has_egg=0"
set "has_flour=0"
set "has_milk=0"

REM Check inventory for quest items
call :count_item "Egg"
if !item_count! gtr 0 set "has_egg=1"

call :count_item "Pot of Flour"
if !item_count! gtr 0 set "has_flour=1"

call :count_item "Bucket of Milk"
if !item_count! gtr 0 set "has_milk=1"

if !has_egg! equ 1 if !has_flour! equ 1 if !has_milk! equ 1 (
    echo.
    echo Congratulations! You have all the ingredients!
    echo You return to the Lumbridge cook and deliver the items.
    echo.
    echo "Thank you so much, adventurer!" says the cook.
    echo "You've saved my job! Here's your reward:"
    echo.
    echo You gained 300 Cooking XP!
    echo You gained 500 coins!
    echo You received a Chef's Hat!
    echo.

    REM Award rewards
    set /a "cooking_xp+=300"
    set /a "experience+=300"
    set /a "coins+=500"
    set "quest_cook=2"

    REM Add Chef's Hat to inventory
    if defined inventory (
        set "inventory=!inventory!,Chef's Hat"
    ) else (
        set "inventory=Chef's Hat"
    )

    REM Remove quest items
    call :remove_item "Egg"
    call :remove_item "Flour"
    call :remove_item "Milk"

    REM Check for level up
    call :check_level_up cooking !cooking_xp!

    echo.
    pause >nul
) else (
    echo.
    echo You don't have all the required items yet!
    echo You still need:
    if !has_egg! equ 0 echo - Egg
    if !has_flour! equ 0 echo - Flour
    if !has_milk! equ 0 echo - Milk
    echo.
    pause >nul
)
goto :eof

:wilderness_penalty
REM Apply penalty for surrendering to player killer
echo The player killer takes some of your items!
echo.

REM Count items in inventory
set "item_count=0"
if defined inventory (
    for %%a in (!inventory!) do set /a "item_count+=1"
)

if !item_count! gtr 0 (
    set /a "items_to_lose=!random! %% 3 + 1"
    if !items_to_lose! gtr !item_count! set "items_to_lose=!item_count!"

    echo You lost !items_to_lose! item(s) to the player killer:

    REM Remove random items
    for /l %%i in (1,1,!items_to_lose!) do (
        if defined inventory (
            REM Get first item to remove
            for /f "tokens=1,* delims=," %%a in ("!inventory!") do (
                echo - %%a
                call :remove_item "%%a"
                goto :next_penalty_item
            )
            :next_penalty_item
        )
    )
) else (
    echo You had no items to lose.
)
goto :eof

:wilderness_pvp_loot
REM Special loot for defeating Player Killers
echo.
echo Searching the defeated Player Killer...
timeout /t 1 >nul

set /a "pvp_loot_roll=!random! %% 100"

if !pvp_loot_roll! lss 25 (
    REM High value coin drop
    set /a "coin_drop=!enemy_level! * 10 + (!random! %% 50)"
    echo You found !coin_drop! coins on the Player Killer!
    set /a "coins+=!coin_drop!"
) else if !pvp_loot_roll! lss 45 (
    REM Weapon drop based on PKer level
    if !enemy_level! geq 25 (
        echo The Player Killer dropped an Adamant Sword!
        if defined inventory (
            set "inventory=!inventory!,Adamant Sword"
        ) else (
            set "inventory=Adamant Sword"
        )
    ) else if !enemy_level! geq 20 (
        echo The Player Killer dropped a Steel Sword!
        if defined inventory (
            set "inventory=!inventory!,Steel Sword"
        ) else (
            set "inventory=Steel Sword"
        )
    ) else (
        echo The Player Killer dropped an Iron Sword!
        if defined inventory (
            set "inventory=!inventory!,Iron Sword"
        ) else (
            set "inventory=Iron Sword"
        )
    )
) else if !pvp_loot_roll! lss 65 (
    REM Magic runes for high-level PKers
    if !enemy_level! geq 20 (
        echo The Player Killer had some Chaos Runes!
        if defined inventory (
            set "inventory=!inventory!,Chaos Rune,Chaos Rune"
        ) else (
            set "inventory=Chaos Rune,Chaos Rune"
        )
    ) else (
        echo The Player Killer had some Fire Runes!
        if defined inventory (
            set "inventory=!inventory!,Fire Rune,Fire Rune,Fire Rune"
        ) else (
            set "inventory=Fire Rune,Fire Rune,Fire Rune"
        )
    )
) else if !pvp_loot_roll! lss 80 (
    REM Rare wilderness items
    echo The Player Killer had rare wilderness herbs!
    if defined inventory (
        set "inventory=!inventory!,Wilderness Herb"
    ) else (
        set "inventory=Wilderness Herb"
    )
) else (
    REM Standard loot
    set /a "small_coins=!enemy_level! * 3"
    echo You found !small_coins! coins and some bones.
    set /a "coins+=!small_coins!"
    if defined inventory (
        set "inventory=!inventory!,Big Bones"
    ) else (
        set "inventory=Big Bones"
    )
)

echo.
echo The risks of the Wilderness have paid off!
goto :eof

:elite_pk_encounter
REM Elite Player Killer encounter for high-level players
cls
echo.
echo ========================================
echo        ELITE PLAYER KILLER ENCOUNTER!
echo ========================================
echo.
echo A legendary Player Killer appears!
echo This is one of the most dangerous PKers in the Wilderness!
echo.
REM Elite PKers are level 30-50
set /a "elite_pk_level=!random! %% 21 + 30"
set /a "elite_pk_attack=!elite_pk_level! + 5"
set /a "elite_pk_defence=!elite_pk_level! + 3"
set /a "elite_pk_strength=!elite_pk_level! + 4"

REM Elite weapons based on level
if !elite_pk_level! lss 35 (
    set "elite_pk_weapon=Rune Sword"
) else if !elite_pk_level! lss 45 (
    set "elite_pk_weapon=Dragon Sword"
) else (
    set "elite_pk_weapon=Godsword"
)

echo Elite Player Killer Stats:
echo Combat Level: !elite_pk_level!
echo Attack: !elite_pk_attack!
echo Defence: !elite_pk_defence!
echo Strength: !elite_pk_strength!
echo Weapon: !elite_pk_weapon!
echo.
echo [F]ight back (Very dangerous!)
echo [R]un away (May lose significant coins)
echo [S]urrender (Lose all items and coins)
echo.
set /p elite_pk_choice="What do you do? "

if /i "!elite_pk_choice!"=="f" (
    REM Fight the elite player killer
    echo.
    echo You draw your weapon and prepare for elite PvP combat!
    timeout /t 1 >nul
    echo The Elite Player Killer attacks with incredible skill!
    echo.
    
    REM Set up enemy stats for combat system
    set "enemy_name=Elite Player Killer"
    set "enemy_level=!elite_pk_level!"
    set /a "enemy_maxhp=!elite_pk_level! * 4 + 20"
    set "enemy_currenthp=!enemy_maxhp!"
    set "enemy_attack=!elite_pk_attack!"
    set "enemy_defence=!elite_pk_defence!"
    set "enemy_weapon=!elite_pk_weapon!"
    
    REM Enhanced combat with elite PKer
    call :enhanced_combat_system
    
    if !enemy_currenthp! leq 0 (
        echo.
        echo      ELITE WILDERNESS PVP VICTORY!
        echo You have defeated the legendary Elite Player Killer!
        echo.
        call :elite_pvp_loot
        echo.
        echo You return to safety...
        pause >nul
        goto main_menu
    ) else (
        echo.
        echo      ELITE WILDERNESS PVP DEFEAT!
        echo The Elite Player Killer was too powerful!
        echo You lose items and coins as per Wilderness rules!
        echo.
        call :elite_wilderness_penalty
        set "currenthp=1"
        echo.
        echo You respawn in Lumbridge, having learned a hard lesson...
        echo.
        pause >nul
        goto main_menu
    )
) else if /i "!elite_pk_choice!"=="r" (
    echo.
    echo You attempt to flee from the Elite Player Killer!
    set /a "escape_roll=!random! %% 100"
    if !escape_roll! lss 30 (
        echo You successfully escape, but lose 100 coins in the process!
        set /a "coins-=100"
        if !coins! lss 0 set "coins=0"
    ) else (
        echo The Elite Player Killer catches you!
        call :elite_wilderness_penalty
        set "currenthp=1"
        echo.
        echo You are allowed to leave the Wilderness alive.
        pause >nul
        goto main_menu
    )
) else if /i "!elite_pk_choice!"=="s" (
    echo.
    echo You surrender to the Elite Player Killer!
    call :elite_wilderness_penalty
    set "currenthp=1"
    echo.
    echo You are allowed to leave the Wilderness alive.
    pause >nul
    goto main_menu
) else (
    echo.
    echo Invalid choice! The Elite Player Killer attacks while you hesitate!
    echo You must choose: [F]ight, [R]un, or [S]urrender!
    pause >nul
    goto :elite_pk_encounter
)
echo.
pause >nul
goto main_menu

:wilderness_boss_encounter
REM Wilderness Boss encounter for high-level players
cls
echo.
echo ========================================
echo         WILDERNESS BOSS ENCOUNTER!
echo ========================================
echo.
echo A massive Wilderness Boss appears!
echo This ancient creature guards valuable treasures!
echo.
REM Boss level based on player level
set /a "boss_level=!combat_level! + !random! %% 10 + 5"
set /a "boss_attack=!boss_level! + 8"
set /a "boss_defence=!boss_level! + 6"
set /a "boss_strength=!boss_level! + 10"

echo Wilderness Boss Stats:
echo Combat Level: !boss_level!
echo Attack: !boss_attack!
echo Defence: !boss_defence!
echo Strength: !boss_strength!
echo.
echo [F]ight the boss (High risk, high reward!)
echo [R]un away (Safe but no rewards)
echo.
set /p boss_choice="What do you do? "

if /i "!boss_choice!"=="f" (
    REM Fight the wilderness boss
    echo.
    echo You prepare to battle the Wilderness Boss!
    timeout /t 2 >nul
    echo The boss roars and attacks with incredible power!
    echo.
    
    REM Set up boss stats for combat system
    set "enemy_name=Wilderness Boss"
    set "enemy_level=!boss_level!"
    set /a "enemy_maxhp=!boss_level! * 6 + 50"
    set "enemy_currenthp=!enemy_maxhp!"
    set "enemy_attack=!boss_attack!"
    set "enemy_defence=!boss_defence!"
    set "enemy_weapon=Ancient Claws"
    
    REM Boss combat with special mechanics
    call :boss_combat_system
    
    if !enemy_currenthp! leq 0 (
        echo.
        echo      WILDERNESS BOSS VICTORY!
        echo You have defeated the mighty Wilderness Boss!
        echo.
        call :wilderness_boss_loot
        echo.
        echo You return to safety with your treasures...
        pause >nul
        goto main_menu
    ) else (
        echo.
        echo      WILDERNESS BOSS DEFEAT!
        echo The boss was too powerful for you!
        echo You lose some items and respawn in Lumbridge.
        echo.
        call :wilderness_penalty
        set "currenthp=1"
        echo.
        pause >nul
        goto main_menu
    )
) else if /i "!boss_choice!"=="r" (
    echo.
    echo You wisely retreat from the Wilderness Boss.
    echo You escape safely but gain no rewards.
    echo.
    pause >nul
    goto main_menu
) else (
    echo.
    echo Invalid choice! The boss attacks while you hesitate!
    echo You must choose: [F]ight or [R]un!
    pause >nul
    goto :wilderness_boss_encounter
)

:dangerous_escape
REM Dangerous escape scenario for high-level players
echo.
echo You encounter a group of hostile bandits!
echo They demand your valuables and attack!
echo.
echo [F]ight the bandits
echo [R]un away (Lose coins but escape)
echo [S]urrender (Lose items but stay alive)
echo.
set /p bandit_choice="What do you do? "

if /i "!bandit_choice!"=="f" (
    echo.
    echo You fight back against the bandits!
    set /a "bandit_roll=!random! %% 100"
    if !bandit_roll! lss 60 (
        echo You defeat the bandits and take their loot!
        set /a "bandit_loot=!random! %% 200 + 100"
        echo You gained !bandit_loot! coins!
        set /a "coins+=!bandit_loot!"
        echo You gained 100 combat experience!
        set /a "attack_xp+=50"
        set /a "strength_xp+=30"
        set /a "defence_xp+=20"
        set /a "experience+=100"
    ) else (
        echo The bandits overpower you!
        echo You lose 150 coins and some items.
        set /a "coins-=150"
        if !coins! lss 0 set "coins=0"
        call :wilderness_penalty
    )
) else if /i "!bandit_choice!"=="r" (
    echo.
    echo You attempt to flee from the bandits!
    set /a "escape_roll=!random! %% 100"
    if !escape_roll! lss 70 (
        echo You escape but lose 100 coins in the process!
        set /a "coins-=100"
        if !coins! lss 0 set "coins=0"
    ) else (
        echo The bandits catch you!
        echo You lose 200 coins and some items.
        set /a "coins-=200"
        if !coins! lss 0 set "coins=0"
        call :wilderness_penalty
    )
) else if /i "!bandit_choice!"=="s" (
    echo.
    echo You surrender to the bandits!
    echo They take 250 coins and some items but let you go.
    set /a "coins-=250"
    if !coins! lss 0 set "coins=0"
    call :wilderness_penalty
) else (
    echo.
    echo Invalid choice! The bandits attack while you hesitate!
    echo You lose 200 coins and some items.
    set /a "coins-=200"
    if !coins! lss 0 set "coins=0"
    call :wilderness_penalty
)
echo.
pause >nul
goto main_menu

:bandit_ambush
REM Bandit ambush encounter
echo.
echo You are ambushed by a group of bandits!
echo They block your path and demand your valuables!
echo.
echo [F]ight the bandits
echo [R]un away (May lose coins)
echo [S]urrender (Lose items but stay alive)
echo.
set /p ambush_choice="What do you do? "

if /i "!ambush_choice!"=="f" (
    echo.
    echo You fight back against the bandits!
    set /a "ambush_roll=!random! %% 100"
    if !ambush_roll! lss 55 (
        echo You defeat the bandits and take their loot!
        set /a "ambush_loot=!random! %% 150 + 75"
        echo You gained !ambush_loot! coins!
        set /a "coins+=!ambush_loot!"
        echo You gained 75 combat experience!
        set /a "attack_xp+=40"
        set /a "strength_xp+=25"
        set /a "defence_xp+=10"
        set /a "experience+=75"
    ) else (
        echo The bandits overpower you!
        echo You lose 125 coins and some items.
        set /a "coins-=125"
        if !coins! lss 0 set "coins=0"
        call :wilderness_penalty
    )
) else if /i "!ambush_choice!"=="r" (
    echo.
    echo You attempt to flee from the bandits!
    set /a "escape_roll=!random! %% 100"
    if !escape_roll! lss 65 (
        echo You escape but lose 75 coins in the process!
        set /a "coins-=75"
        if !coins! lss 0 set "coins=0"
    ) else (
        echo The bandits catch you!
        echo You lose 150 coins and some items.
        set /a "coins-=150"
        if !coins! lss 0 set "coins=0"
        call :wilderness_penalty
    )
) else if /i "!ambush_choice!"=="s" (
    echo.
    echo You surrender to the bandits!
    echo They take 175 coins and some items but let you go.
    set /a "coins-=175"
    if !coins! lss 0 set "coins=0"
    call :wilderness_penalty
) else (
    echo.
    echo Invalid choice! The bandits attack while you hesitate!
    echo You lose 150 coins and some items.
    set /a "coins-=150"
    if !coins! lss 0 set "coins=0"
    call :wilderness_penalty
)
echo.
pause >nul
goto main_menu

:wilderness_safe_exploration
REM Safe exploration with high-value loot for high-level players
echo.
echo You manage to explore the Wilderness safely... this time.
echo You found some extremely valuable items in the Wilderness!
echo.

REM High-value wilderness loot for high-level players
set /a "high_loot=!random! %% 100"
if !high_loot! lss 20 (
    echo You found 500 coins!
    set /a "coins+=500"
) else if !high_loot! lss 40 (
    echo You found a rare gem!
    if defined inventory (
        set "inventory=!inventory!,Rare Gem"
    ) else (
        set "inventory=Rare Gem"
    )
) else if !high_loot! lss 60 (
    echo You found some runite ore!
    if defined inventory (
        set "inventory=!inventory!,Runite Ore"
    ) else (
        set "inventory=Runite Ore"
    )
) else if !high_loot! lss 80 (
    echo You found ancient artifacts!
    set /a "artifact_value=!random! %% 300 + 200"
    echo They're worth !artifact_value! coins!
    set /a "coins+=!artifact_value!"
) else (
    echo You found a mysterious scroll!
    if defined inventory (
        set "inventory=!inventory!,Mysterious Scroll"
    ) else (
        set "inventory=Mysterious Scroll"
    )
)
echo.
pause >nul
goto main_menu

:elite_pvp_loot
REM Special loot for defeating Elite Player Killers
echo.
echo Searching the defeated Elite Player Killer...
timeout /t 1 >nul

set /a "elite_loot_roll=!random! %% 100"

if !elite_loot_roll! lss 30 (
    REM High value coin drop
    set /a "elite_coin_drop=!enemy_level! * 20 + (!random! %% 100)"
    echo You found !elite_coin_drop! coins on the Elite Player Killer!
    set /a "coins+=!elite_coin_drop!"
) else if !elite_loot_roll! lss 50 (
    REM Elite weapon drop
    if !enemy_level! geq 45 (
        echo The Elite Player Killer dropped a Godsword!
        if defined inventory (
            set "inventory=!inventory!,Godsword"
        ) else (
            set "inventory=Godsword"
        )
    ) else if !enemy_level! geq 35 (
        echo The Elite Player Killer dropped a Dragon Sword!
        if defined inventory (
            set "inventory=!inventory!,Dragon Sword"
        ) else (
            set "inventory=Dragon Sword"
        )
    ) else (
        echo The Elite Player Killer dropped a Rune Sword!
        if defined inventory (
            set "inventory=!inventory!,Rune Sword"
        ) else (
            set "inventory=Rune Sword"
        )
    )
) else if !elite_loot_roll! lss 70 (
    REM Elite armor drop
    echo The Elite Player Killer dropped Elite Armor!
    if defined inventory (
        set "inventory=!inventory!,Elite Armor"
    ) else (
        set "inventory=Elite Armor"
    )
) else if !elite_loot_roll! lss 85 (
    REM High-level runes
    echo The Elite Player Killer had Death Runes!
    if defined inventory (
        set "inventory=!inventory!,Death Rune,Death Rune,Death Rune"
    ) else (
        set "inventory=Death Rune,Death Rune,Death Rune"
    )
) else (
    REM Rare item
    echo The Elite Player Killer had a rare artifact!
    if defined inventory (
        set "inventory=!inventory!,Rare Artifact"
    ) else (
        set "inventory=Rare Artifact"
    )
)
echo.
echo The risks of the Elite Wilderness have paid off!
goto :eof

:elite_wilderness_penalty
REM Enhanced penalty for surrendering to Elite Player Killers
echo The Elite Player Killer takes most of your valuable items!
echo.

REM Count items in inventory
set "item_count=0"
if defined inventory (
    for %%a in (!inventory!) do set /a "item_count+=1"
)

REM Remove more items for elite encounters
if !item_count! gtr 0 (
    set /a "items_to_remove=!item_count! * 3 / 4"
    if !items_to_remove! lss 1 set "items_to_remove=1"
    
    for /l %%i in (1,1,!items_to_remove!) do (
        call :remove_random_item
    )
    
    echo You lost !items_to_remove! items to the Elite Player Killer!
) else (
    echo You had no items to lose.
)

REM Take more coins
set /a "coin_penalty=!coins! * 2 / 3"
if !coin_penalty! lss 100 set "coin_penalty=100"
set /a "coins-=!coin_penalty!"
if !coins! lss 0 set "coins=0"
echo You lost !coin_penalty! coins to the Elite Player Killer!
goto :eof

:wilderness_boss_loot
REM Special loot for defeating Wilderness Boss
echo.
echo Searching the defeated Wilderness Boss...
timeout /t 2 >nul

set /a "boss_loot_roll=!random! %% 100"

if !boss_loot_roll! lss 25 (
    REM Massive coin drop
    set /a "boss_coin_drop=!enemy_level! * 50 + (!random! %% 500)"
    echo You found !boss_coin_drop! coins in the boss's treasure!
    set /a "coins+=!boss_coin_drop!"
) else if !boss_loot_roll! lss 45 (
    REM Boss weapon
    echo The boss dropped a Boss Weapon!
    if defined inventory (
        set "inventory=!inventory!,Boss Weapon"
    ) else (
        set "inventory=Boss Weapon"
    )
) else if !boss_loot_roll! lss 65 (
    REM Boss armor
    echo The boss dropped Boss Armor!
    if defined inventory (
        set "inventory=!inventory!,Boss Armor"
    ) else (
        set "inventory=Boss Armor"
    )
) else if !boss_loot_roll! lss 80 (
    REM Rare materials
    echo The boss dropped rare crafting materials!
    if defined inventory (
        set "inventory=!inventory!,Rare Materials"
    ) else (
        set "inventory=Rare Materials"
    )
) else (
    REM Legendary item
    echo The boss dropped a legendary item!
    if defined inventory (
        set "inventory=!inventory!,Legendary Item"
    ) else (
        set "inventory=Legendary Item"
    )
)
echo.
echo You have claimed the boss's treasure!
goto :eof

:remove_random_item
REM Remove a random item from inventory
if not defined inventory goto :eof
setlocal enabledelayedexpansion
set "temp_inventory=!inventory!"
set "item_count=0"
for %%a in (!inventory!) do set /a "item_count+=1"
if !item_count! equ 0 goto :eof
set /a "random_item=!random! %% !item_count! + 1"
set "current_num=0"
set "new_inventory="
for %%a in (!temp_inventory!) do (
    set /a "current_num+=1"
    if !current_num! neq !random_item! (
        if defined new_inventory (
            set "new_inventory=!new_inventory!,%%a"
        ) else (
            set "new_inventory=%%a"
        )
    )
    set "temp_inventory=%%b"
)
endlocal & set "inventory=%new_inventory%"
goto :eof

:enhanced_combat_system
REM Enhanced combat system for elite encounters
echo.
echo ========================================
echo        ENHANCED PVP COMBAT!
echo ========================================
echo.
echo Your HP: !currenthp!/!maxhp!
echo !enemy_name! HP: !enemy_currenthp!/!enemy_maxhp!
echo.

REM Player attacks first
call :calculate_damage !attack! !enemy_defence!
if !damage! gtr 0 (
    echo You attack the !enemy_name! with your weapon!
    timeout /t 1 >nul
    echo You deal !damage! damage!
    set /a "enemy_currenthp-=!damage!"
    
    if !enemy_currenthp! leq 0 (
        echo The !enemy_name! has been defeated!
        goto :eof
    )
) else (
    echo Your attack misses the !enemy_name!!
)

REM Enemy attacks back
if !enemy_currenthp! gtr 0 (
    echo.
    call :calculate_damage_direct !enemy_attack! !defence!
    set "enemy_damage=!damage!"
    
    if !enemy_damage! gtr 0 (
        echo The !enemy_name! attacks you with its !enemy_weapon!!
        timeout /t 1 >nul
        echo You take !enemy_damage! damage!
        set /a "currenthp-=!enemy_damage!"
        
        if !currenthp! leq 0 (
            echo.
            echo You have been defeated by the !enemy_name!!
            goto :eof
        )
    ) else (
        echo The !enemy_name!'s attack misses you!
    )
)
goto :eof

:boss_combat_system
REM Boss combat system with special mechanics
echo.
echo ========================================
echo        BOSS COMBAT!
echo ========================================
echo.
echo Your HP: !currenthp!/!maxhp!
echo !enemy_name! HP: !enemy_currenthp!/!enemy_maxhp!
echo.

REM Player attacks first
call :calculate_damage !attack! !enemy_defence!
if !damage! gtr 0 (
    echo You attack the !enemy_name! with your weapon!
    timeout /t 1 >nul
    echo You deal !damage! damage!
    set /a "enemy_currenthp-=!damage!"
    
    if !enemy_currenthp! leq 0 (
        echo The !enemy_name! has been defeated!
        goto :eof
    )
) else (
    echo Your attack misses the !enemy_name!!
)

REM Boss attacks back with enhanced damage
if !enemy_currenthp! gtr 0 (
    echo.
    call :calculate_damage_direct !enemy_attack! !defence!
    set "enemy_damage=!damage!"
    
    REM Boss gets damage bonus
    set /a "enemy_damage+=2"
    
    if !enemy_damage! gtr 0 (
        echo The !enemy_name! attacks you with incredible power!
        timeout /t 1 >nul
        echo You take !enemy_damage! damage!
        set /a "currenthp-=!enemy_damage!"
        
        if !currenthp! leq 0 (
            echo.
            echo You have been defeated by the !enemy_name!!
            goto :eof
        )
    ) else (
        echo The !enemy_name!'s attack misses you!
    )
)
goto :eof

:wilderness_monster_encounter
REM Wilderness monster encounter
echo.
echo ========================================
echo        WILDERNESS MONSTER ENCOUNTER!
echo ========================================
echo.
echo You encounter dangerous creatures in the wilderness!
echo.

REM Random monster selection
set /a "monster_roll=!random! %% 100"

if !monster_roll! lss 25 (
    REM Giant Spider
    echo A Giant Spider blocks your path!
    echo It hisses menacingly and prepares to attack.
    echo.
    echo [F]ight the spider
    echo [R]un away
    echo.
    set /p monster_choice="What do you do? "
    
    if /i "!monster_choice!"=="f" (
        echo.
        echo You engage the Giant Spider in combat!
        set "enemy_name=Giant Spider"
        set "enemy_level=12"
        set /a "enemy_maxhp=25"
        set "enemy_currenthp=25"
        set "enemy_attack=8"
        set "enemy_defence=6"
        set "enemy_weapon=Poisonous Fangs"
        
        call :enhanced_combat_system
        
        if !enemy_currenthp! leq 0 (
            echo.
            echo You defeated the Giant Spider!
            echo You gained 50 combat experience!
            set /a "attack_xp+=25"
            set /a "strength_xp+=15"
            set /a "defence_xp+=10"
            set /a "experience+=50"
            
            REM Spider loot
            set /a "spider_loot=!random! %% 3"
            if !spider_loot! equ 0 (
                echo You found Spider Silk!
                if defined inventory (
                    set "inventory=!inventory!,Spider Silk"
                ) else (
                    set "inventory=Spider Silk"
                )
            )
        ) else (
            echo The Giant Spider defeats you!
            echo You lose 30 coins and respawn in Lumbridge.
            set /a "coins-=30"
            if !coins! lss 0 set "coins=0"
            set "currenthp=1"
        )
    ) else if /i "!monster_choice!"=="r" (
        echo.
        echo You successfully flee from the Giant Spider!
        echo You lose 10 coins in the escape.
        set /a "coins-=10"
        if !coins! lss 0 set "coins=0"
    ) else (
        echo Invalid choice! The spider attacks while you hesitate!
        echo You take 5 damage!
        set /a "currenthp-=5"
    )
) else if !monster_roll! lss 50 (
    REM Wild Boar
    echo A Wild Boar charges at you!
    echo It snorts angrily and lowers its tusks.
    echo.
    echo [F]ight the boar
    echo [R]un away
    echo.
    set /p monster_choice="What do you do? "
    
    if /i "!monster_choice!"=="f" (
        echo.
        echo You engage the Wild Boar in combat!
        set "enemy_name=Wild Boar"
        set "enemy_level=8"
        set /a "enemy_maxhp=18"
        set "enemy_currenthp=18"
        set "enemy_attack=6"
        set "enemy_defence=4"
        set "enemy_weapon=Tusks"
        
        call :enhanced_combat_system
        
        if !enemy_currenthp! leq 0 (
            echo.
            echo You defeated the Wild Boar!
            echo You gained 35 combat experience!
            set /a "attack_xp+=20"
            set /a "strength_xp+=10"
            set /a "defence_xp+=5"
            set /a "experience+=35"
            
            REM Boar loot
            set /a "boar_loot=!random! %% 2"
            if !boar_loot! equ 0 (
                echo You found Raw Boar Meat!
                if defined inventory (
                    set "inventory=!inventory!,Raw Boar Meat"
                ) else (
                    set "inventory=Raw Boar Meat"
                )
            )
        ) else (
            echo The Wild Boar defeats you!
            echo You lose 20 coins and respawn in Lumbridge.
            set /a "coins-=20"
            if !coins! lss 0 set "coins=0"
            set "currenthp=1"
        )
    ) else if /i "!monster_choice!"=="r" (
        echo.
        echo You successfully flee from the Wild Boar!
        echo You lose 5 coins in the escape.
        set /a "coins-=5"
        if !coins! lss 0 set "coins=0"
    ) else (
        echo Invalid choice! The boar attacks while you hesitate!
        echo You take 3 damage!
        set /a "currenthp-=3"
    )
) else if !monster_roll! lss 75 (
    REM Bandit
    echo A Bandit emerges from behind a rock!
    echo "Hand over your valuables!" he demands.
    echo.
    echo [F]ight the bandit
    echo [R]un away
    echo [S]urrender (Lose coins but stay alive)
    echo.
    set /p monster_choice="What do you do? "
    
    if /i "!monster_choice!"=="f" (
        echo.
        echo You engage the Bandit in combat!
        set "enemy_name=Bandit"
        set "enemy_level=15"
        set /a "enemy_maxhp=30"
        set "enemy_currenthp=30"
        set "enemy_attack=10"
        set "enemy_defence=8"
        set "enemy_weapon=Iron Sword"
        
        call :enhanced_combat_system
        
        if !enemy_currenthp! leq 0 (
            echo.
            echo You defeated the Bandit!
            echo You gained 75 combat experience!
            set /a "attack_xp+=40"
            set /a "strength_xp+=25"
            set /a "defence_xp+=10"
            set /a "experience+=75"
            
            REM Bandit loot
            set /a "bandit_coins=!random! %% 50 + 25"
            echo You found !bandit_coins! coins on the bandit!
            set /a "coins+=!bandit_coins!"
        ) else (
            echo The Bandit defeats you!
            echo You lose 50 coins and some items.
            set /a "coins-=50"
            if !coins! lss 0 set "coins=0"
            call :wilderness_penalty
            set "currenthp=1"
        )
    ) else if /i "!monster_choice!"=="r" (
        echo.
        echo You attempt to flee from the Bandit!
        set /a "escape_roll=!random! %% 100"
        if !escape_roll! lss 60 (
            echo You successfully escape!
            echo You lose 25 coins in the escape.
            set /a "coins-=25"
            if !coins! lss 0 set "coins=0"
        ) else (
            echo The Bandit catches you!
            echo You lose 40 coins and some items.
            set /a "coins-=40"
            if !coins! lss 0 set "coins=0"
            call :wilderness_penalty
        )
    ) else if /i "!monster_choice!"=="s" (
        echo.
        echo You surrender to the Bandit!
        set /a "surrender_coins=!coins! / 3"
        echo The bandit takes !surrender_coins! coins and lets you go.
        set /a "coins-=!surrender_coins!"
        if !coins! lss 0 set "coins=0"
    ) else (
        echo Invalid choice! The bandit attacks while you hesitate!
        echo You lose 30 coins and some items.
        set /a "coins-=30"
        if !coins! lss 0 set "coins=0"
        call :wilderness_penalty
    )
) else (
    REM Safe exploration
    echo You explore the wilderness carefully...
    echo You don't encounter any dangerous creatures this time.
    echo You found some useful items!
    
    set /a "safe_loot=!random! %% 100"
    if !safe_loot! lss 30 (
        echo You found 25 coins!
        set /a "coins+=25"
    ) else if !safe_loot! lss 60 (
        echo You found a Health Potion!
        if defined inventory (
            set "inventory=!inventory!,Health Potion"
        ) else (
            set "inventory=Health Potion"
        )
    ) else (
        echo You found some Wilderness Herbs!
        if defined inventory (
            set "inventory=!inventory!,Wilderness Herbs"
        ) else (
            set "inventory=Wilderness Herbs"
        )
    )
)
goto :eof

:wilderness_resource_gathering
REM Wilderness resource gathering with tool requirements
echo.
echo ========================================
echo        WILDERNESS RESOURCE GATHERING!
echo ========================================
echo.
echo You find various resource nodes in the wilderness.
echo.

echo Available resources:
echo 1. Mining spots - Various ores and gems
echo 2. Woodcutting areas - Ancient trees
echo 3. Fishing spots - Wilderness lake
echo 4. Herb gathering - Medicinal plants
echo 5. Back to exploration
echo.
set /p resource_choice="What do you gather? "

if "!resource_choice!"=="1" (
    call :wilderness_mining
) else if "!resource_choice!"=="2" (
    call :wilderness_woodcutting
) else if "!resource_choice!"=="3" (
    call :wilderness_fishing
) else if "!resource_choice!"=="4" (
    call :wilderness_herb_gathering
) else if "!resource_choice!"=="5" (
    goto :eof
) else (
    echo Invalid choice!
)
goto :eof

:wilderness_mining
REM Wilderness mining with pickaxe requirement
echo.
echo You approach the mining spots...
echo.

REM Check if player has a pickaxe
call :count_item "Pickaxe"
if !item_count! equ 0 (
    echo You need a pickaxe to mine here!
    echo You can buy one from the general store or smith one yourself.
    echo.
    goto :eof
)

echo You begin mining in the wilderness...
timeout /t 2 >nul

REM Random mining results
set /a "mining_roll=!random! %% 100"

if !mining_roll! lss 20 (
    echo You found Iron Ore!
    if defined inventory (
        set "inventory=!inventory!,Iron Ore"
    ) else (
        set "inventory=Iron Ore"
    )
    echo You gained 25 Mining experience!
    set /a "mining_xp+=25"
    set /a "experience+=25"
) else if !mining_roll! lss 40 (
    echo You found Coal!
    if defined inventory (
        set "inventory=!inventory!,Coal"
    ) else (
        set "inventory=Coal"
    )
    echo You gained 30 Mining experience!
    set /a "mining_xp+=30"
    set /a "experience+=30"
) else if !mining_roll! lss 60 (
    echo You found Silver Ore!
    if defined inventory (
        set "inventory=!inventory!,Silver Ore"
    ) else (
        set "inventory=Silver Ore"
    )
    echo You gained 40 Mining experience!
    set /a "mining_xp+=40"
    set /a "experience+=40"
) else if !mining_roll! lss 80 (
    echo You found Gold Ore!
    if defined inventory (
        set "inventory=!inventory!,Gold Ore"
    ) else (
        set "inventory=Gold Ore"
    )
    echo You gained 50 Mining experience!
    set /a "mining_xp+=50"
    set /a "experience+=50"
) else if !mining_roll! lss 95 (
    echo You found a rare gem!
    if defined inventory (
        set "inventory=!inventory!,Rare Gem"
    ) else (
        set "inventory=Rare Gem"
    )
    echo You gained 75 Mining experience!
    set /a "mining_xp+=75"
    set /a "experience+=75"
) else (
    echo You found nothing valuable this time.
    echo You gained 10 Mining experience!
    set /a "mining_xp+=10"
    set /a "experience+=10"
)

REM Check for level up
call :check_level_up mining !mining_xp!
goto :eof

:wilderness_woodcutting
REM Wilderness woodcutting
echo.
echo You approach the ancient trees...
echo.

REM Check if player has an axe
call :count_item "Axe"
if !item_count! equ 0 (
    echo You need an axe to cut wood here!
    echo You can buy one from the general store or smith one yourself.
    echo.
    goto :eof
)

echo You begin cutting the ancient trees...
timeout /t 2 >nul

REM Random woodcutting results
set /a "woodcutting_roll=!random! %% 100"

if !woodcutting_roll! lss 30 (
    echo You cut some Oak Logs!
    if defined inventory (
        set "inventory=!inventory!,Oak Logs"
    ) else (
        set "inventory=Oak Logs"
    )
    echo You gained 20 Woodcutting experience!
    set /a "woodcutting_xp+=20"
    set /a "experience+=20"
) else if !woodcutting_roll! lss 60 (
    echo You cut some Willow Logs!
    if defined inventory (
        set "inventory=!inventory!,Willow Logs"
    ) else (
        set "inventory=Willow Logs"
    )
    echo You gained 30 Woodcutting experience!
    set /a "woodcutting_xp+=30"
    set /a "experience+=30"
) else if !woodcutting_roll! lss 85 (
    echo You cut some Maple Logs!
    if defined inventory (
        set "inventory=!inventory!,Maple Logs"
    ) else (
        set "inventory=Maple Logs"
    )
    echo You gained 45 Woodcutting experience!
    set /a "woodcutting_xp+=45"
    set /a "experience+=45"
) else (
    echo You cut some Yew Logs!
    if defined inventory (
        set "inventory=!inventory!,Yew Logs"
    ) else (
        set "inventory=Yew Logs"
    )
    echo You gained 60 Woodcutting experience!
    set /a "woodcutting_xp+=60"
    set /a "experience+=60"
)

REM Check for level up
call :check_level_up woodcutting !woodcutting_xp!
goto :eof

:wilderness_fishing
REM Wilderness fishing
echo.
echo You approach the wilderness lake...
echo.

REM Check if player has a fishing rod
call :count_item "Fishing Rod"
if !item_count! equ 0 (
    echo You need a fishing rod to fish here!
    echo You can buy one from the general store or craft one yourself.
    echo.
    goto :eof
)

echo You begin fishing in the wilderness lake...
timeout /t 2 >nul

REM Random fishing results
set /a "fishing_roll=!random! %% 100"

if !fishing_roll! lss 25 (
    echo You caught a Trout!
    if defined inventory (
        set "inventory=!inventory!,Trout"
    ) else (
        set "inventory=Trout"
    )
    echo You gained 20 Fishing experience!
    set /a "fishing_xp+=20"
    set /a "experience+=20"
) else if !fishing_roll! lss 50 (
    echo You caught a Salmon!
    if defined inventory (
        set "inventory=!inventory!,Salmon"
    ) else (
        set "inventory=Salmon"
    )
    echo You gained 30 Fishing experience!
    set /a "fishing_xp+=30"
    set /a "experience+=30"
) else if !fishing_roll! lss 75 (
    echo You caught a Pike!
    if defined inventory (
        set "inventory=!inventory!,Pike"
    ) else (
        set "inventory=Pike"
    )
    echo You gained 40 Fishing experience!
    set /a "fishing_xp+=40"
    set /a "experience+=40"
) else if !fishing_roll! lss 95 (
    echo You caught a rare fish!
    if defined inventory (
        set "inventory=!inventory!,Rare Fish"
    ) else (
        set "inventory=Rare Fish"
    )
    echo You gained 60 Fishing experience!
    set /a "fishing_xp+=60"
    set /a "experience+=60"
) else (
    echo You caught nothing this time.
    echo You gained 5 Fishing experience!
    set /a "fishing_xp+=5"
    set /a "experience+=5"
)

REM Check for level up
call :check_level_up fishing !fishing_xp!
goto :eof

:wilderness_herb_gathering
REM Wilderness herb gathering
echo.
echo You search for medicinal herbs...
echo.

echo You begin gathering herbs in the wilderness...
timeout /t 2 >nul

REM Random herb gathering results
set /a "herb_roll=!random! %% 100"

if !herb_roll! lss 30 (
    echo You found Marrentill!
    if defined inventory (
        set "inventory=!inventory!,Marrentill"
    ) else (
        set "inventory=Marrentill"
    )
    echo You gained 15 Herblore experience!
    set /a "herblore_xp+=15"
    set /a "experience+=15"
) else if !herb_roll! lss 60 (
    echo You found Tarromin!
    if defined inventory (
        set "inventory=!inventory!,Tarromin"
    ) else (
        set "inventory=Tarromin"
    )
    echo You gained 25 Herblore experience!
    set /a "herblore_xp+=25"
    set /a "experience+=25"
) else if !herb_roll! lss 85 (
    echo You found Harralander!
    if defined inventory (
        set "inventory=!inventory!,Harralander"
    ) else (
        set "inventory=Harralander"
    )
    echo You gained 35 Herblore experience!
    set /a "herblore_xp+=35"
    set /a "experience+=35"
) else (
    echo You found a rare herb!
    if defined inventory (
        set "inventory=!inventory!,Rare Herb"
    ) else (
        set "inventory=Rare Herb"
    )
    echo You gained 50 Herblore experience!
    set /a "herblore_xp+=50"
    set /a "experience+=50"
)

REM Check for level up
call :check_level_up herblore !herblore_xp!
goto :eof

:wilderness_pvp_hotspot
REM Wilderness PvP hotspot
echo.
echo ========================================
echo        WILDERNESS PVP HOTSPOT!
echo ========================================
echo.
echo You approach a known PvP hotspot...
echo This area is notorious for player combat and high-stakes battles.
echo.

echo [E]ngage in PvP combat
echo [O]bserve the area
echo [L]eave the hotspot
echo.
set /p hotspot_choice="What do you do? "

if /i "!hotspot_choice!"=="e" (
    echo.
    echo You prepare for PvP combat in the hotspot!
    echo This will trigger a random PvP encounter...
    timeout /t 2 >nul
    call :wilderness_pk_encounter
) else if /i "!hotspot_choice!"=="o" (
    echo.
    echo You observe the PvP hotspot from a safe distance...
    echo You see evidence of recent battles and valuable loot scattered about.
    echo You gain 10 experience from observing combat techniques.
    set /a "experience+=10"
) else if /i "!hotspot_choice!"=="l" (
    echo.
    echo You wisely leave the PvP hotspot.
    echo You return to safer areas of the wilderness.
) else (
    echo Invalid choice!
)
goto :eof

:wilderness_ancient_ruins
REM Wilderness ancient ruins exploration
echo.
echo ========================================
echo        WILDERNESS ANCIENT RUINS!
echo ========================================
echo.
echo You discover ancient ruins in the wilderness...
echo These mysterious structures hold secrets and treasures.
echo.

echo [E]xplore the ruins
echo [S]earch for treasure
echo [L]eave the ruins
echo.
set /p ruins_choice="What do you do? "

if /i "!ruins_choice!"=="e" (
    echo.
    echo You carefully explore the ancient ruins...
    timeout /t 2 >nul
    
    set /a "ruins_roll=!random! %% 100"
    
    if !ruins_roll! lss 30 (
        echo You find ancient artifacts!
        if defined inventory (
            set "inventory=!inventory!,Ancient Artifacts"
        ) else (
            set "inventory=Ancient Artifacts"
        )
        echo You gained 50 experience!
        set /a "experience+=50"
    ) else if !ruins_roll! lss 60 (
        echo You discover a hidden chamber with coins!
        set /a "ruins_coins=!random! %% 100 + 50"
        echo You found !ruins_coins! coins!
        set /a "coins+=!ruins_coins!"
        echo You gained 30 experience!
        set /a "experience+=30"
    ) else if !ruins_roll! lss 85 (
        echo You find ancient runes!
        if defined inventory (
            set "inventory=!inventory!,Ancient Runes"
        ) else (
            set "inventory=Ancient Runes"
        )
        echo You gained 40 experience!
        set /a "experience+=40"
    ) else (
        echo You find nothing of value in the ruins.
        echo You gained 10 experience from exploring.
        set /a "experience+=10"
    )
) else if /i "!ruins_choice!"=="s" (
    echo.
    echo You search for treasure in the ruins...
    timeout /t 2 >nul
    
    set /a "treasure_roll=!random! %% 100"
    
    if !treasure_roll! lss 25 (
        echo You find a treasure chest!
        set /a "treasure_coins=!random! %% 200 + 100"
        echo You found !treasure_coins! coins!
        set /a "coins+=!treasure_coins!"
        echo You gained 75 experience!
        set /a "experience+=75"
    ) else if !treasure_roll! lss 50 (
        echo You find ancient jewelry!
        if defined inventory (
            set "inventory=!inventory!,Ancient Jewelry"
        ) else (
            set "inventory=Ancient Jewelry"
        )
        echo You gained 60 experience!
        set /a "experience+=60"
    ) else if !treasure_roll! lss 75 (
        echo You find a mysterious scroll!
        if defined inventory (
            set "inventory=!inventory!,Mysterious Scroll"
        ) else (
            set "inventory=Mysterious Scroll"
        )
        echo You gained 45 experience!
        set /a "experience+=45"
    ) else (
        echo You find nothing valuable in your search.
        echo You gained 15 experience from searching.
        set /a "experience+=15"
    )
) else if /i "!ruins_choice!"=="l" (
    echo.
    echo You leave the ancient ruins.
    echo You return to the wilderness.
) else (
    echo Invalid choice!
)
goto :eof

:wilderness_caves
REM Wilderness caves exploration
echo.
echo ========================================
echo        WILDERNESS CAVES!
echo ========================================
echo.
echo You discover a cave entrance in the wilderness...
echo The cave looks dark and mysterious.
echo.

echo [E]nter the cave
echo [P]eer inside
echo [L]eave the cave
echo.
set /p cave_choice="What do you do? "

if /i "!cave_choice!"=="e" (
    echo.
    echo You enter the wilderness cave...
    timeout /t 2 >nul
    
    set /a "cave_roll=!random! %% 100"
    
    if !cave_roll! lss 20 (
        echo You encounter a cave monster!
        echo A Giant Bat attacks you!
        echo.
        echo [F]ight the bat
        echo [R]un away
        echo.
        set /p bat_choice="What do you do? "
        
        if /i "!bat_choice!"=="f" (
            echo.
            echo You fight the Giant Bat!
            set "enemy_name=Giant Bat"
            set "enemy_level=10"
            set /a "enemy_maxhp=20"
            set "enemy_currenthp=20"
            set "enemy_attack=7"
            set "enemy_defence=5"
            set "enemy_weapon=Sharp Claws"
            
            call :enhanced_combat_system
            
            if !enemy_currenthp! leq 0 (
                echo.
                echo You defeated the Giant Bat!
                echo You gained 40 combat experience!
                set /a "attack_xp+=20"
                set /a "strength_xp+=15"
                set /a "defence_xp+=5"
                set /a "experience+=40"
            ) else (
                echo The Giant Bat defeats you!
                echo You lose 25 coins and respawn in Lumbridge.
                set /a "coins-=25"
                if !coins! lss 0 set "coins=0"
                set "currenthp=1"
            )
        ) else if /i "!bat_choice!"=="r" (
            echo.
            echo You flee from the Giant Bat!
            echo You escape safely but gain no rewards.
        ) else (
            echo Invalid choice! The bat attacks while you hesitate!
            echo You take 4 damage!
            set /a "currenthp-=4"
        )
    ) else if !cave_roll! lss 50 (
        echo You find valuable minerals in the cave!
        if defined inventory (
            set "inventory=!inventory!,Cave Minerals"
        ) else (
            set "inventory=Cave Minerals"
        )
        echo You gained 35 experience!
        set /a "experience+=35"
    ) else if !cave_roll! lss 80 (
        echo You discover a hidden treasure in the cave!
        set /a "cave_coins=!random! %% 150 + 75"
        echo You found !cave_coins! coins!
        set /a "coins+=!cave_coins!"
        echo You gained 50 experience!
        set /a "experience+=50"
    ) else (
        echo You explore the cave but find nothing of value.
        echo You gained 20 experience from exploring.
        set /a "experience+=20"
    )
) else if /i "!cave_choice!"=="p" (
    echo.
    echo You peer inside the cave...
    echo You can see it's dark and potentially dangerous.
    echo You decide not to enter without proper preparation.
    echo You gained 5 experience from observing.
    set /a "experience+=5"
) else if /i "!cave_choice!"=="l" (
    echo.
    echo You leave the cave entrance.
    echo You return to the wilderness.
) else (
    echo Invalid choice!
)
goto :eof

:wilderness_lake
REM Wilderness lake activities
echo.
echo ========================================
echo        WILDERNESS LAKE!
echo ========================================
echo.
echo You approach a peaceful lake in the wilderness...
echo The water looks clear and inviting.
echo.

echo [F]ish in the lake
echo [D]rink from the lake
echo [S]wim in the lake
echo [L]eave the lake
echo.
set /p lake_choice="What do you do? "

if /i "!lake_choice!"=="f" (
    call :wilderness_fishing
) else if /i "!lake_choice!"=="d" (
    echo.
    echo You drink from the clear lake water...
    echo You feel refreshed and restored!
    set /a "heal_amount=!random! %% 10 + 5"
    set /a "currenthp+=!heal_amount!"
    if !currenthp! gtr !maxhp! set "currenthp=!maxhp!"
    echo You restored !heal_amount! hitpoints!
    echo You gained 10 experience!
    set /a "experience+=10"
) else if /i "!lake_choice!"=="s" (
    echo.
    echo You swim in the wilderness lake...
    timeout /t 2 >nul
    echo You feel refreshed and energized!
    set /a "heal_amount=!random! %% 15 + 10"
    set /a "currenthp+=!heal_amount!"
    if !currenthp! gtr !maxhp! set "currenthp=!maxhp!"
    echo You restored !heal_amount! hitpoints!
    echo You gained 20 experience!
    set /a "experience+=20"
) else if /i "!lake_choice!"=="l" (
    echo.
    echo You leave the wilderness lake.
    echo You return to the wilderness.
) else (
    echo Invalid choice!
)
goto :eof

:handle_purchase
REM Parameters: %1 = choice number, %2 = location
set "choice=%1"
set "shop_location=%2"

if "!shop_location!"=="LUMBRIDGE" (
    if "!choice!"=="1" (
        if !coins! geq 12 (
            set /a "coins-=12"
            if defined inventory (
                set "inventory=!inventory!,Bread"
            ) else (
                set "inventory=Bread"
            )
            echo You bought bread for 12 coins!
        ) else (
            echo Not enough coins!
        )
    )

    if "!choice!"=="2" (
        if !coins! geq 25 (
            set /a "coins-=25"
            if defined inventory (
                set "inventory=!inventory!,Bronze Sword"
            ) else (
                set "inventory=Bronze Sword"
            )
            echo You bought a bronze sword for 25 coins!
        ) else (
            echo Not enough coins!
        )
    )

    if "!choice!"=="3" (
        if !coins! geq 15 (
            set /a "coins-=15"
            if defined inventory (
                set "inventory=!inventory!,Wooden Shield"
            ) else (
                set "inventory=Wooden Shield"
            )
            echo You bought a wooden shield for 15 coins!
        ) else (
            echo Not enough coins!
        )
    )

    if "!choice!"=="4" (
        if !coins! geq 50 (
            set /a "coins-=50"
            if defined inventory (
                set "inventory=!inventory!,Fishing Rod"
            ) else (
                set "inventory=Fishing Rod"
            )
            echo You bought a fishing rod for 50 coins!
        ) else (
            echo Not enough coins!
        )
    )

    if "!choice!"=="5" (
        if !coins! geq 30 (
            set /a "coins-=30"
            if defined inventory (
                set "inventory=!inventory!,Axe"
            ) else (
                set "inventory=Axe"
            )
            echo You bought an axe for 30 coins!
        ) else (
            echo Not enough coins!
        )
    )

    if "!choice!"=="6" (
        if !coins! geq 40 (
            set /a "coins-=40"
            if defined inventory (
                set "inventory=!inventory!,Pickaxe"
            ) else (
                set "inventory=Pickaxe"
            )
            echo You bought a pickaxe for 40 coins!
        ) else (
            echo Not enough coins!
        )
    )

    if "!choice!"=="7" (
        if !coins! geq 35 (
            set /a "coins-=35"
            if defined inventory (
                set "inventory=!inventory!,Health Potion"
            ) else (
                set "inventory=Health Potion"
            )
            echo You bought a health potion for 35 coins!
        ) else (
            echo Not enough coins!
        )
    )

    if "!choice!"=="8" (
        if !coins! geq 5 (
            set /a "coins-=5"
            if defined inventory (
                set "inventory=!inventory!,Tinderbox"
            ) else (
                set "inventory=Tinderbox"
            )
            echo You bought a tinderbox for 5 coins!
        ) else (
            echo Not enough coins!
        )
    )
) else if "!shop_location!"=="VARROCK" (
    REM Handle Varrock shop purchases
    if "!choice!"=="1" (
        if !coins! geq 140 (
            set /a "coins-=140"
            if defined inventory (
                set "inventory=!inventory!,Iron Sword"
            ) else (
                set "inventory=Iron Sword"
            )
            echo You bought an iron sword for 140 coins!
        ) else (
            echo Not enough coins!
        )
    )

    if "!choice!"=="2" (
        if !coins! geq 112 (
            set /a "coins-=112"
            if defined inventory (
                set "inventory=!inventory!,Iron Shield"
            ) else (
                set "inventory=Iron Shield"
            )
            echo You bought an iron shield for 112 coins!
        ) else (
            echo Not enough coins!
        )
    )

    if "!choice!"=="3" (
        if !coins! geq 325 (
            set /a "coins-=325"
            if defined inventory (
                set "inventory=!inventory!,Steel Sword"
            ) else (
                set "inventory=Steel Sword"
            )
            echo You bought a steel sword for 325 coins!
        ) else (
            echo Not enough coins!
        )
    )

    if "!choice!"=="4" (
        if !coins! geq 800 (
            set /a "coins-=800"
            if defined inventory (
                set "inventory=!inventory!,Adamant Sword"
            ) else (
                set "inventory=Adamant Sword"
            )
            echo You bought an adamant sword for 800 coins!
        ) else (
            echo Not enough coins!
        )
    )

    if "!choice!"=="5" (
        if !coins! geq 200 (
            set /a "coins-=200"
            if defined inventory (
                set "inventory=!inventory!,Staff of Fire"
            ) else (
                set "inventory=Staff of Fire"
            )
            echo You bought a staff of fire for 200 coins!
        ) else (
            echo Not enough coins!
        )
    )

    if "!choice!"=="6" (
        if !coins! geq 5 (
            set /a "coins-=5"
            if defined inventory (
                set "inventory=!inventory!,Air Rune"
            ) else (
                set "inventory=Air Rune"
            )
            echo You bought an air rune for 5 coins!
        ) else (
            echo Not enough coins!
        )
    )

    if "!choice!"=="7" (
        if !coins! geq 8 (
            set /a "coins-=8"
            if defined inventory (
                set "inventory=!inventory!,Fire Rune"
            ) else (
                set "inventory=Fire Rune"
            )
            echo You bought a fire rune for 8 coins!
        ) else (
            echo Not enough coins!
        )
    )

    if "!choice!"=="8" (
        if !coins! geq 6 (
            set /a "coins-=6"
            if defined inventory (
                set "inventory=!inventory!,Water Rune"
            ) else (
                set "inventory=Water Rune"
            )
            echo You bought a water rune for 6 coins!
        ) else (
            echo Not enough coins!
        )
    )

    if "!choice!"=="9" (
        if !coins! geq 6 (
            set /a "coins-=6"
            if defined inventory (
                set "inventory=!inventory!,Earth Rune"
            ) else (
                set "inventory=Earth Rune"
            )
            echo You bought an earth rune for 6 coins!
        ) else (
            echo Not enough coins!
        )
    )

    if "!choice!"=="10" (
        if !coins! geq 15 (
            set /a "coins-=15"
            if defined inventory (
                set "inventory=!inventory!,Chaos Rune"
            ) else (
                set "inventory=Chaos Rune"
            )
            echo You bought a chaos rune for 15 coins!
        ) else (
            echo Not enough coins!
        )
    )

    if "!choice!"=="11" (
        if !coins! geq 100 (
            set /a "coins-=100"
            if defined inventory (
                set "inventory=!inventory!,Wizard Hat"
            ) else (
                set "inventory=Wizard Hat"
            )
            echo You bought a wizard hat for 100 coins!
        ) else (
            echo Not enough coins!
        )
    )

    if "!choice!"=="12" (
        if !coins! geq 50 (
            set /a "coins-=50"
            if defined inventory (
                set "inventory=!inventory!,Magic Study Book"
            ) else (
                set "inventory=Magic Study Book"
            )
            echo You bought a Magic Study Book for 50 coins!
        ) else (
            echo Not enough coins!
        )
    )

    if "!choice!"=="13" (
        if !coins! geq 45 (
            set /a "coins-=45"
            if defined inventory (
                set "inventory=!inventory!,Combat Manual"
            ) else (
                set "inventory=Combat Manual"
            )
            echo You bought a Combat Manual for 45 coins!
        ) else (
            echo Not enough coins!
        )
    )

    if "!choice!"=="14" (
        if !coins! geq 40 (
            set /a "coins-=40"
            if defined inventory (
                set "inventory=!inventory!,Crafting Guide"
            ) else (
                set "inventory=Crafting Guide"
            )
            echo You bought a Crafting Guide for 40 coins!
        ) else (
            echo Not enough coins!
        )
    )

    if "!choice!"=="15" (
        if !coins! geq 35 (
            set /a "coins-=35"
            if defined inventory (
                set "inventory=!inventory!,Cooking Recipe Book"
            ) else (
                set "inventory=Cooking Recipe Book"
            )
            echo You bought a Cooking Recipe Book for 35 coins!
        ) else (
            echo Not enough coins!
        )
    )

    if "!choice!"=="16" (
        if !coins! geq 35 (
            set /a "coins-=35"
            if defined inventory (
                set "inventory=!inventory!,Health Potion"
            ) else (
                set "inventory=Health Potion"
            )
            echo You bought a health potion for 35 coins!
        ) else (
            echo Not enough coins!
        )
    )

    if "!choice!"=="17" (
        if !coins! geq 12 (
            set /a "coins-=12"
            if defined inventory (
                set "inventory=!inventory!,Bread"
            ) else (
                set "inventory=Bread"
            )
            echo You bought bread for 12 coins!
        ) else (
            echo Not enough coins!
        )
    )
) else if "!shop_location!"=="FALADOR" (
    REM Handle Falador shop purchases
    if "!choice!"=="1" (
        if !coins! geq 300 (
            set /a "coins-=300"
            if defined inventory (
                set "inventory=!inventory!,Steel Shield"
            ) else (
                set "inventory=Steel Shield"
            )
            echo You bought a steel shield for 300 coins!
        ) else (
            echo Not enough coins!
        )
    )

    if "!choice!"=="2" (
        if !coins! geq 800 (
            set /a "coins-=800"
            if defined inventory (
                set "inventory=!inventory!,Adamant Shield"
            ) else (
                set "inventory=Adamant Shield"
            )
            echo You bought an adamant shield for 800 coins!
        ) else (
            echo Not enough coins!
        )
    )

    if "!choice!"=="3" (
        if !coins! geq 1920 (
            set /a "coins-=1920"
            if defined inventory (
                set "inventory=!inventory!,Rune Shield"
            ) else (
                set "inventory=Rune Shield"
            )
            echo You bought a rune shield for 1920 coins!
        ) else (
            echo Not enough coins!
        )
    )

    if "!choice!"=="4" (
        if !coins! geq 1440 (
            set /a "coins-=1440"
            if defined inventory (
                set "inventory=!inventory!,White Shield"
            ) else (
                set "inventory=White Shield"
            )
            echo You bought a white shield for 1440 coins!
        ) else (
            echo Not enough coins!
        )
    )

    if "!choice!"=="5" (
        if !coins! geq 35 (
            set /a "coins-=35"
            if defined inventory (
                set "inventory=!inventory!,Health Potion"
            ) else (
                set "inventory=Health Potion"
            )
            echo You bought a health potion for 35 coins!
        ) else (
            echo Not enough coins!
        )
    )

    if "!choice!"=="6" (
        if !coins! geq 20 (
            set /a "coins-=20"
            if defined inventory (
                set "inventory=!inventory!,Monk Robes"
            ) else (
                set "inventory=Monk Robes"
            )
            echo You bought monk robes for 20 coins!
        ) else (
            echo Not enough coins!
        )
    )
) else if "!shop_location!"=="ALKHARID" (
    REM Handle Al Kharid shop purchases
    if "!choice!"=="1" (
        if !coins! geq 320 (
            set /a "coins-=320"
            if defined inventory (
                set "inventory=!inventory!,Steel Scimitar"
            ) else (
                set "inventory=Steel Scimitar"
            )
            echo You bought a steel scimitar for 320 coins!
        ) else (
            echo Not enough coins!
        )
    )

    if "!choice!"=="2" (
        if !coins! geq 800 (
            set /a "coins-=800"
            if defined inventory (
                set "inventory=!inventory!,Adamant Scimitar"
            ) else (
                set "inventory=Adamant Scimitar"
            )
            echo You bought an adamant scimitar for 800 coins!
        ) else (
            echo Not enough coins!
        )
    )

    if "!choice!"=="3" (
        if !coins! geq 2560 (
            set /a "coins-=2560"
            if defined inventory (
                set "inventory=!inventory!,Rune Scimitar"
            ) else (
                set "inventory=Rune Scimitar"
            )
            echo You bought a rune scimitar for 2560 coins!
        ) else (
            echo Not enough coins!
        )
    )

    if "!choice!"=="4" (
        if !coins! geq 60000 (
            set /a "coins-=60000"
            if defined inventory (
                set "inventory=!inventory!,Dragon Scimitar"
            ) else (
                set "inventory=Dragon Scimitar"
            )
            echo You bought a dragon scimitar for 60000 coins!
        ) else (
            echo Not enough coins!
        )
    )

    if "!choice!"=="5" (
        if !coins! geq 35 (
            set /a "coins-=35"
            if defined inventory (
                set "inventory=!inventory!,Health Potion"
            ) else (
                set "inventory=Health Potion"
            )
            echo You bought a health potion for 35 coins!
        ) else (
            echo Not enough coins!
        )
    )

    if "!choice!"=="6" (
        if !coins! geq 40 (
            set /a "coins-=40"
            if defined inventory (
                set "inventory=!inventory!,Desert Robes"
            ) else (
                set "inventory=Desert Robes"
            )
            echo You bought desert robes for 40 coins!
        ) else (
            echo Not enough coins!
        )
    )
) else if "!shop_location!"=="MAGETOWER" (
    REM Handle Mage Tower shop purchases
    if "!choice!"=="1" (
        if !coins! geq 5 (
            set /a "coins-=5"
            if defined inventory (
                set "inventory=!inventory!,Air Rune"
            ) else (
                set "inventory=Air Rune"
            )
            echo You bought an air rune for 5 coins!
        ) else (
            echo Not enough coins!
        )
    )

    if "!choice!"=="2" (
        if !coins! geq 8 (
            set /a "coins-=8"
            if defined inventory (
                set "inventory=!inventory!,Fire Rune"
            ) else (
                set "inventory=Fire Rune"
            )
            echo You bought a fire rune for 8 coins!
        ) else (
            echo Not enough coins!
        )
    )

    if "!choice!"=="3" (
        if !coins! geq 6 (
            set /a "coins-=6"
            if defined inventory (
                set "inventory=!inventory!,Water Rune"
            ) else (
                set "inventory=Water Rune"
            )
            echo You bought a water rune for 6 coins!
        ) else (
            echo Not enough coins!
        )
    )

    if "!choice!"=="4" (
        if !coins! geq 6 (
            set /a "coins-=6"
            if defined inventory (
                set "inventory=!inventory!,Earth Rune"
            ) else (
                set "inventory=Earth Rune"
            )
            echo You bought an earth rune for 6 coins!
        ) else (
            echo Not enough coins!
        )
    )

    if "!choice!"=="5" (
        if !coins! geq 4 (
            set /a "coins-=4"
            if defined inventory (
                set "inventory=!inventory!,Mind Rune"
            ) else (
                set "inventory=Mind Rune"
            )
            echo You bought a mind rune for 4 coins!
        ) else (
            echo Not enough coins!
        )
    )

    if "!choice!"=="6" (
        if !coins! geq 15 (
            set /a "coins-=15"
            if defined inventory (
                set "inventory=!inventory!,Chaos Rune"
            ) else (
                set "inventory=Chaos Rune"
            )
            echo You bought a chaos rune for 15 coins!
        ) else (
            echo Not enough coins!
        )
    )

    if "!choice!"=="7" (
        if !coins! geq 25 (
            set /a "coins-=25"
            if defined inventory (
                set "inventory=!inventory!,Death Rune"
            ) else (
                set "inventory=Death Rune"
            )
            echo You bought a death rune for 25 coins!
        ) else (
            echo Not enough coins!
        )
    )

    if "!choice!"=="8" (
        if !coins! geq 50 (
            set /a "coins-=50"
            if defined inventory (
                set "inventory=!inventory!,Blood Rune"
            ) else (
                set "inventory=Blood Rune"
            )
            echo You bought a blood rune for 50 coins!
        ) else (
            echo Not enough coins!
        )
    )

    if "!choice!"=="9" (
        if !coins! geq 150 (
            set /a "coins-=150"
            if defined inventory (
                set "inventory=!inventory!,Staff of Air"
            ) else (
                set "inventory=Staff of Air"
            )
            echo You bought a staff of air for 150 coins!
        ) else (
            echo Not enough coins!
        )
    )

    if "!choice!"=="10" (
        if !coins! geq 200 (
            set /a "coins-=200"
            if defined inventory (
                set "inventory=!inventory!,Staff of Fire"
            ) else (
                set "inventory=Staff of Fire"
            )
            echo You bought a staff of fire for 200 coins!
        ) else (
            echo Not enough coins!
        )
    )

    if "!choice!"=="11" (
        if !coins! geq 100 (
            set /a "coins-=100"
            if defined inventory (
                set "inventory=!inventory!,Wizard Hat"
            ) else (
                set "inventory=Wizard Hat"
            )
            echo You bought a wizard hat for 100 coins!
        ) else (
            echo Not enough coins!
        )
    )

    if "!choice!"=="12" (
        if !coins! geq 200 (
            set /a "coins-=200"
            if defined inventory (
                set "inventory=!inventory!,Magic Robes"
            ) else (
                set "inventory=Magic Robes"
            )
            echo You bought magic robes for 200 coins!
        ) else (
            echo Not enough coins!
        )
    )

    if "!choice!"=="13" (
        if !coins! geq 50 (
            set /a "coins-=50"
            if defined inventory (
                set "inventory=!inventory!,Magic Study Book"
            ) else (
                set "inventory=Magic Study Book"
            )
            echo You bought a magic study book for 50 coins!
        ) else (
            echo Not enough coins!
        )
    )

    if "!choice!"=="14" (
        if !coins! geq 35 (
            set /a "coins-=35"
            if defined inventory (
                set "inventory=!inventory!,Health Potion"
            ) else (
                set "inventory=Health Potion"
            )
            echo You bought a health potion for 35 coins!
        ) else (
            echo Not enough coins!
        )
    )
)

pause >nul
goto :eof

:train_attack
echo.
echo You practice attacking with precision...
timeout /t 1 >nul
echo You swing your sword at the training dummy!
echo.

REM Apply XP boost if active
set "base_xp=25"
if defined xp_boost_active (
    set /a "boosted_xp=!base_xp! * 125 / 100"
    echo [KNOWLEDGE BOOST ACTIVE] You gained !boosted_xp! Attack experience!
    set /a "attack_xp+=!boosted_xp!"
    set /a "experience+=!boosted_xp!"
    set "xp_boost_active="
    echo Knowledge boost consumed!
) else (
    echo You gained !base_xp! Attack experience!
    set /a "attack_xp+=!base_xp!"
    set /a "experience+=!base_xp!"
)

call :check_level_up attack !attack_xp!
echo.
pause >nul
goto train_skills

:train_strength
echo.
echo You focus on building muscle strength...
timeout /t 1 >nul
echo You lift heavy weights and feel stronger!
echo.
echo You gained 25 Strength experience!
set /a "strength_xp+=25"
set /a "experience+=25"
call :check_level_up strength !strength_xp!
echo.
pause >nul
goto train_skills

:train_defence
echo.
echo You practice defensive techniques...
timeout /t 1 >nul
echo You block imaginary attacks perfectly!
echo.
echo You gained 25 Defence experience!
set /a "defence_xp+=25"
set /a "experience+=25"
call :check_level_up defence !defence_xp!
echo.
pause >nul
goto train_skills

:train_woodcutting
REM Check if player has axe
call :count_item "Axe"
if !item_count! lss 1 (
    echo.
    echo You need an axe to chop wood!
    echo Visit the shop to buy one.
    echo.
    pause >nul
    goto train_skills
)

echo.
echo You find a suitable tree and start chopping...
timeout /t 2 >nul
echo You successfully chop down the tree!
echo You gained some logs and woodcutting experience!
echo.
echo You gained 35 Woodcutting experience!
set /a "woodcutting_xp+=35"
set /a "experience+=35"

REM Add logs to inventory
if defined inventory (
    set "inventory=!inventory!,Logs"
) else (
    set "inventory=Logs"
)

call :check_level_up woodcutting !woodcutting_xp!
echo.
pause >nul
goto train_skills

:train_fishing
REM Check if player has fishing rod
call :count_item "Fishing Rod"
if !item_count! lss 1 (
    echo.
    echo You need a fishing rod to fish!
    echo Visit the shop to buy one.
    echo.
    pause >nul
    goto train_skills
)

echo.
echo You cast your line into the water...
timeout /t 2 >nul
echo You feel a tug! You reel in a fish!
echo You caught a sardine!
echo.
echo You gained 30 Fishing experience!
set /a "fishing_xp+=30"
set /a "experience+=30"

REM Add fish to inventory
if defined inventory (
    set "inventory=!inventory!,Sardine"
) else (
    set "inventory=Sardine"
)

call :check_level_up fishing !fishing_xp!
echo.
pause >nul
goto train_skills

:train_mining
REM Check if player has pickaxe
call :count_item "Pickaxe"
if !item_count! lss 1 (
    echo.
    echo You need a pickaxe to mine!
    echo Visit the shop to buy one.
    echo.
    pause >nul
    goto train_skills
)

echo.
echo You find some rocks and start mining...
timeout /t 2 >nul
echo You successfully mine the rocks!
echo You gained some ore and mining experience!
echo.
echo You gained 35 Mining experience!
set /a "mining_xp+=35"
set /a "experience+=35"

REM Add ore to inventory
if defined inventory (
    set "inventory=!inventory!,Copper Ore"
) else (
    set "inventory=Copper Ore"
)

call :check_level_up mining !mining_xp!
echo.
pause >nul
goto train_skills

:train_cooking
cls
call :draw_training_scene
echo.
echo ========================================
echo         COOKING MINIGAME
echo ========================================
echo.

REM Check if player has raw fish or meat
call :count_item "Sardine"
set "has_sardine=!item_count!"
call :count_item "Chicken"
set "has_chicken=!item_count!"
call :count_item "Beef"
set "has_beef=!item_count!"

if !has_sardine! equ 0 if !has_chicken! equ 0 if !has_beef! equ 0 (
    echo You need raw food to cook!
    echo Try fishing or defeating monsters first.
    echo.
    pause >nul
    goto train_skills
)

echo You prepare to cook some food...
echo.
echo Choose your cooking approach:
echo.
echo 1. Quick Cook (Easy - 25 XP) - Simple cooking
echo 2. Careful Cook (Medium - 40 XP) - Precise timing
echo 3. Master Cook (Hard - 60 XP) - Advanced techniques
echo 4. Cancel
echo.
set /p cook_approach="Choose approach: "

if "%cook_approach%"=="1" goto quick_cook
if "%cook_approach%"=="2" goto careful_cook
if "%cook_approach%"=="3" goto master_cook
if "%cook_approach%"=="4" goto train_skills

echo Invalid choice!
pause >nul
goto train_cooking

:quick_cook
cls
call :draw_training_scene
echo.
echo ========================================
echo         QUICK COOK - EASY
echo ========================================
echo.
echo You quickly prepare to cook some food...
echo.
echo Cooking Progress: [                    ] 0%%
echo.
echo Press C to start cooking!
echo.
set /p cook_input="Press C: "
if "!cook_input!"=="c" (
    echo ✓ Heat applied! Press S to season...
    echo Cooking Progress: [####                ] 25%%
    echo.
    set /p season_input="Press S: "
    if "!season_input!"=="s" (
        echo ✓ Seasoned! Press T to turn the food...
        echo Cooking Progress: [########            ] 50%%
        echo.
        set /p turn_input="Press T: "
        if "!turn_input!"=="t" (
            echo ✓ Turned! Press F to finish...
            echo Cooking Progress: [############        ] 75%%
            echo.
            set /p finish_input="Press F: "
            if "!finish_input!"=="f" (
                echo ✓ Perfect quick cook!
                echo Cooking Progress: [####################] 100%%
                echo.
                echo You successfully cooked the food!
                echo You gained 30 Cooking experience! (Perfect cook bonus!)
                set /a "cooking_xp+=30"
                set /a "experience+=30"
                call :cook_food
            ) else (
                echo You cooked the food!
                echo Cooking Progress: [####################] 100%%
                echo.
                echo You gained 25 Cooking experience!
                set /a "cooking_xp+=25"
                set /a "experience+=25"
                call :cook_food
            )
        ) else (
            echo You cooked the food!
            echo Cooking Progress: [####################] 100%%
            echo.
            echo You gained 20 Cooking experience!
            set /a "cooking_xp+=20"
            set /a "experience+=20"
            call :cook_food
        )
    ) else (
        echo You cooked the food!
        echo Cooking Progress: [####################] 100%%
        echo.
        echo You gained 15 Cooking experience!
        set /a "cooking_xp+=15"
        set /a "experience+=15"
        call :cook_food
    )
) else (
    echo You burned the food!
    echo Cooking Progress: [####################] 100%%
    echo.
    echo You gained 5 Cooking experience for trying.
    set /a "cooking_xp+=5"
    set /a "experience+=5"
    call :remove_item "Sardine"
    call :remove_item "Chicken"
    call :remove_item "Beef"
)
call :check_level_up cooking !cooking_xp!
echo.
pause >nul
goto train_skills

:careful_cook
cls
call :draw_training_scene
echo.
echo ========================================
echo       CAREFUL COOK - MEDIUM
echo ========================================
echo.
echo You carefully prepare to cook some food...
echo.
echo Cooking Progress: [                    ] 0%%
echo.
echo Press C to start cooking carefully...
echo.
set /p cook_input="Press C: "
if "!cook_input!"=="c" (
    echo ✓ Heat applied carefully! Press S to season precisely...
    echo Cooking Progress: [####                ] 25%%
    echo.
    set /p season_input="Press S: "
    if "!season_input!"=="s" (
        echo ✓ Seasoned perfectly! Press T to turn carefully...
        echo Cooking Progress: [########            ] 50%%
        echo.
        set /p turn_input="Press T: "
        if "!turn_input!"=="t" (
            echo ✓ Turned expertly! Press F to finish with care...
            echo Cooking Progress: [############        ] 75%%
            echo.
            set /p finish_input="Press F: "
            if "!finish_input!"=="f" (
                echo ✓ Perfect careful cook!
                echo Cooking Progress: [####################] 100%%
                echo.
                echo You created a perfectly cooked meal!
                echo You gained 50 Cooking experience! (Perfect careful cook!)
                set /a "cooking_xp+=50"
                set /a "experience+=50"
                call :cook_food
            ) else (
                echo You cooked the food carefully!
                echo Cooking Progress: [####################] 100%%
                echo.
                echo You gained 40 Cooking experience!
                set /a "cooking_xp+=40"
                set /a "experience+=40"
                call :cook_food
            )
        ) else (
            echo You cooked the food!
            echo Cooking Progress: [####################] 100%%
            echo.
            echo You gained 30 Cooking experience!
            set /a "cooking_xp+=30"
            set /a "experience+=30"
            call :cook_food
        )
    ) else (
        echo You cooked the food!
        echo Cooking Progress: [####################] 100%%
        echo.
        echo You gained 25 Cooking experience!
        set /a "cooking_xp+=25"
        set /a "experience+=25"
        call :cook_food
    )
) else (
    echo You burned the food!
    echo Cooking Progress: [####################] 100%%
    echo.
    echo You gained 10 Cooking experience for trying.
    set /a "cooking_xp+=10"
    set /a "experience+=10"
    call :remove_item "Sardine"
    call :remove_item "Chicken"
    call :remove_item "Beef"
)
call :check_level_up cooking !cooking_xp!
echo.
pause >nul
goto train_skills

:master_cook
cls
call :draw_training_scene
echo.
echo ========================================
echo        MASTER COOK - HARD
echo ========================================
echo.
echo You prepare to create a masterful dish...
echo.
echo Cooking Progress: [                    ] 0%%
echo.
echo Press M to start master cooking...
echo.
set /p cook_input="Press M: "
if "!cook_input!"=="m" (
    echo ✓ Heat applied masterfully! Press S to season expertly...
    echo Cooking Progress: [####                ] 25%%
    echo.
    set /p season_input="Press S: "
    if "!season_input!"=="s" (
        echo ✓ Seasoned masterfully! Press T to turn with skill...
        echo Cooking Progress: [########            ] 50%%
        echo.
        set /p turn_input="Press T: "
        if "!turn_input!"=="t" (
            echo ✓ Turned expertly! Press F to finish masterfully...
            echo Cooking Progress: [############        ] 75%%
            echo.
            set /p finish_input="Press F: "
            if "!finish_input!"=="f" (
                echo ✓ Flawless master cook!
                echo Cooking Progress: [####################] 100%%
                echo.
                echo You created a masterful dish!
                echo You gained 80 Cooking experience! (Master cook bonus!)
                set /a "cooking_xp+=80"
                set /a "experience+=80"
                call :cook_food
            ) else (
                echo You created an excellent dish!
                echo Cooking Progress: [####################] 100%%
                echo.
                echo You gained 60 Cooking experience!
                set /a "cooking_xp+=60"
                set /a "experience+=60"
                call :cook_food
            )
        ) else (
            echo You created a good dish!
            echo Cooking Progress: [####################] 100%%
            echo.
            echo You gained 45 Cooking experience!
            set /a "cooking_xp+=45"
            set /a "experience+=45"
            call :cook_food
        )
    ) else (
        echo You created a decent dish!
        echo Cooking Progress: [####################] 100%%
        echo.
        echo You gained 35 Cooking experience!
        set /a "cooking_xp+=35"
        set /a "experience+=35"
        call :cook_food
    )
) else (
    echo You burned the food!
    echo Cooking Progress: [####################] 100%%
    echo.
    echo You gained 15 Cooking experience for trying.
    set /a "cooking_xp+=15"
    set /a "experience+=15"
    call :remove_item "Sardine"
    call :remove_item "Chicken"
    call :remove_item "Beef"
)
call :check_level_up cooking !cooking_xp!
echo.
pause >nul
goto train_skills

:train_smithing
REM Check if player has ore
call :count_item "Copper Ore"
set "has_copper=!item_count!"
call :count_item "Tin Ore"
set "has_tin=!item_count!"
call :count_item "Iron Ore"
set "has_iron=!item_count!"
call :count_item "Coal"
set "has_coal=!item_count!"

if !has_copper! equ 0 if !has_tin! equ 0 if !has_iron! equ 0 if !has_coal! equ 0 (
    echo.
    echo You need ore to smith!
    echo Try mining first.
    echo.
    pause >nul
    goto train_skills
)

echo.
echo You place the ore in the furnace...
timeout /t 2 >nul
echo You successfully smith a bronze bar!
echo.
echo You gained 25 Smithing experience!
set /a "smithing_xp+=25"
set /a "experience+=25"

REM Replace ore with bar
call :remove_item "Copper Ore"
call :remove_item "Tin Ore"
if defined inventory (
    set "inventory=!inventory!,Bronze Bar"
) else (
    set "inventory=Bronze Bar"
)

call :check_level_up smithing !smithing_xp!
echo.
pause >nul
goto train_skills

:train_crafting
REM Check if player has materials
call :count_item "Wool"
set "has_wool=!item_count!"
call :count_item "Leather"
set "has_leather=!item_count!"
call :count_item "Bronze Bar"
set "has_bar=!item_count!"

if !has_wool! equ 0 if !has_leather! equ 0 if !has_bar! equ 0 (
    echo.
    echo You need crafting materials!
    echo Try other skills first.
    echo.
    pause >nul
    goto train_skills
)

echo.
echo You work with the materials...
timeout /t 1 >nul
echo You create a useful item!
echo.
echo You gained 25 Crafting experience!
set /a "crafting_xp+=25"
set /a "experience+=25"
call :check_level_up crafting !crafting_xp!
echo.
pause >nul
goto train_skills

:train_prayer
echo.
echo You pray at the altar...
timeout /t 1 >nul
echo You feel at peace with the gods.
echo.
echo You gained 20 Prayer experience!
set /a "prayer_xp+=20"
set /a "experience+=20"
call :check_level_up prayer !prayer_xp!
echo.
pause >nul
goto train_skills

:train_farming
echo.
echo You tend to some plants...
timeout /t 1 >nul
echo Your crops grow healthier!
echo.
echo You gained 25 Farming experience!
set /a "farming_xp+=25"
set /a "experience+=25"
call :check_level_up farming !farming_xp!
echo.
pause >nul
goto train_skills

:train_firemaking
REM Enhanced firemaking with tinderbox requirement and minigame
echo.
echo ========================================
echo           FIREMAKING TRAINING
echo ========================================
echo.

REM Check if player has a tinderbox
call :count_item "Tinderbox"
if !item_count! equ 0 (
    echo You need a tinderbox to start fires!
    echo You can buy one from the general store for 5 coins.
    echo.
    pause >nul
    goto train_skills
)

REM Check for different types of logs
call :count_item "Oak Logs"
set "has_oak=!item_count!"
call :count_item "Willow Logs"
set "has_willow=!item_count!"
call :count_item "Maple Logs"
set "has_maple=!item_count!"
call :count_item "Yew Logs"
set "has_yew=!item_count!"
call :count_item "Logs"
set "has_regular=!item_count!"

REM Determine what logs are available
set "log_type="
set "log_name="
set "log_xp=0"
set "log_level_req=0"

if !has_yew! gtr 0 if !firemaking! geq 60 (
    set "log_type=Yew Logs"
    set "log_name=Yew"
    set "log_xp=200"
    set "log_level_req=60"
) else if !has_maple! gtr 0 if !firemaking! geq 45 (
    set "log_type=Maple Logs"
    set "log_name=Maple"
    set "log_xp=135"
    set "log_level_req=45"
) else if !has_willow! gtr 0 if !firemaking! geq 15 (
    set "log_type=Willow Logs"
    set "log_name=Willow"
    set "log_xp=90"
    set "log_level_req=15"
) else if !has_oak! gtr 0 if !firemaking! geq 15 (
    set "log_type=Oak Logs"
    set "log_name=Oak"
    set "log_xp=60"
    set "log_level_req=15"
) else if !has_regular! gtr 0 (
    set "log_type=Logs"
    set "log_name=Regular"
    set "log_xp=40"
    set "log_level_req=1"
)

if "!log_type!"=="" (
    echo You need logs to burn for firemaking!
    echo Available log types and requirements:
    echo - Regular Logs: Level 1+ (40 XP)
    echo - Oak Logs: Level 15+ (60 XP)
    echo - Willow Logs: Level 15+ (90 XP)
    echo - Maple Logs: Level 45+ (135 XP)
    echo - Yew Logs: Level 60+ (200 XP)
    echo.
    echo Get some logs from woodcutting first.
    echo.
    pause >nul
    goto train_skills
)

echo You have !log_type! available for burning.
echo !log_name! logs require Firemaking level !log_level_req! and give !log_xp! XP.
echo.

echo [B]urn !log_name! logs
echo [C]hoose different logs
echo [B]ack to skills
echo.
set /p fire_choice="What do you do? "

if /i "!fire_choice!"=="b" (
    call :firemaking_minigame "!log_type!" "!log_xp!" "!log_name!"
) else if /i "!fire_choice!"=="c" (
    goto :train_firemaking
) else if /i "!fire_choice!"=="back" (
    goto train_skills
) else (
    echo Invalid choice!
    pause >nul
    goto :train_firemaking
)

echo.
pause >nul
goto train_skills

:train_treasure_hunting
cls
call :draw_treasure_hunting_header
echo.
echo ========================================
echo        TREASURE HUNTING TRAINING
echo ========================================
echo.
echo Welcome to the Treasure Hunting Academy!
echo.
echo Choose your treasure hunting method:
echo.
echo 1. Metal Detecting (Basic treasure hunting)
echo 2. Ancient Ruins Exploration (Advanced)
echo 3. Hidden Cave Search (Expert level)
echo 4. Back to skills menu
echo.
set /p treasure_choice="Choose method: "

if "%treasure_choice%"=="1" (
    call :metal_detecting
) else if "%treasure_choice%"=="2" (
    call :ancient_ruins_exploration
) else if "%treasure_choice%"=="3" (
    call :hidden_cave_search
) else if "%treasure_choice%"=="4" (
    goto train_skills
) else (
    echo Invalid choice!
    pause >nul
    goto train_treasure_hunting
)

:metal_detecting
cls
call :draw_treasure_hunting_header
echo.
echo ========================================
echo         METAL DETECTING
echo ========================================
echo.
echo You grab your metal detector and start searching...
echo.
echo [Beep... Beep... Beep...]
timeout /t 2 >nul
echo.
echo You found something! Digging...
timeout /t 1 >nul

REM Metal detecting success based on treasure hunting level
set /a "detect_success=!random! %% 100"
set /a "success_chance=60 + !treasure_hunting! * 3"

if !detect_success! lss !success_chance! (
    REM Successful find
    set /a "find_type=!random! %% 100"
    
    if !find_type! lss 40 (
        echo You found some old coins!
        set /a "coins_found=!random! %% 20 + 5"
        set /a "coins+=!coins_found!"
        echo You gained !coins_found! coins!
        set /a "treasure_hunting_xp+=25"
        set /a "experience+=25"
        echo You gained 25 Treasure Hunting experience!
        
    ) else if !find_type! lss 70 (
        echo You found a rusty key!
        if defined inventory (
            set "inventory=!inventory!,Rusty Key"
        ) else (
            set "inventory=Rusty Key"
        )
        echo You gained 30 Treasure Hunting experience!
        set /a "treasure_hunting_xp+=30"
        set /a "experience+=30"
        
    ) else if !find_type! lss 90 (
        echo You found an ancient coin!
        if defined inventory (
            set "inventory=!inventory!,Ancient Coin"
        ) else (
            set "inventory=Ancient Coin"
        )
        echo You gained 35 Treasure Hunting experience!
        set /a "treasure_hunting_xp+=35"
        set /a "experience+=35"
        
    ) else (
        echo You found a valuable artifact!
        if defined inventory (
            set "inventory=!inventory!,Valuable Artifact"
        ) else (
            set "inventory=Valuable Artifact"
        )
        echo You gained 50 Treasure Hunting experience!
        set /a "treasure_hunting_xp+=50"
        set /a "experience+=50"
    )
    
    call :check_level_up treasure_hunting !treasure_hunting_xp!
    
) else (
    echo The metal detector was a false alarm.
    echo You found nothing but dirt.
    echo.
    echo You gained 5 Treasure Hunting experience from trying.
    set /a "treasure_hunting_xp+=5"
    set /a "experience+=5"
)

echo.
pause >nul
goto train_treasure_hunting

:ancient_ruins_exploration
cls
call :draw_treasure_hunting_header
echo.
echo ========================================
echo      ANCIENT RUINS EXPLORATION
echo ========================================
echo.
echo You explore ancient ruins looking for hidden treasures...
echo.
echo [Searching through crumbling walls...]
timeout /t 2 >nul
echo [Examining old inscriptions...]
timeout /t 1 >nul
echo [Checking for secret passages...]
timeout /t 1 >nul
echo.

REM Ruins exploration success based on treasure hunting level
set /a "ruins_success=!random! %% 100"
set /a "success_chance=40 + !treasure_hunting! * 4"

if !ruins_success! lss !success_chance! (
    REM Successful exploration
    set /a "ruins_find=!random! %% 100"
    
    if !ruins_find! lss 50 (
        echo You found ancient scrolls!
        if defined inventory (
            set "inventory=!inventory!,Ancient Scrolls"
        ) else (
            set "inventory=Ancient Scrolls"
        )
        echo You gained 40 Treasure Hunting experience!
        set /a "treasure_hunting_xp+=40"
        set /a "experience+=40"
        
    ) else if !ruins_find! lss 80 (
        echo You found a mysterious gem!
        if defined inventory (
            set "inventory=!inventory!,Mysterious Gem"
        ) else (
            set "inventory=Mysterious Gem"
        )
        echo You gained 50 Treasure Hunting experience!
        set /a "treasure_hunting_xp+=50"
        set /a "experience+=50"
        
    ) else (
        echo You found a legendary artifact!
        if defined inventory (
            set "inventory=!inventory!,Legendary Artifact"
        ) else (
            set "inventory=Legendary Artifact"
        )
        echo You gained 75 Treasure Hunting experience!
        set /a "treasure_hunting_xp+=75"
        set /a "experience+=75"
    )
    
    call :check_level_up treasure_hunting !treasure_hunting_xp!
    
) else (
    echo The ruins are too dangerous to explore further.
    echo You found nothing but dust and cobwebs.
    echo.
    echo You gained 10 Treasure Hunting experience from exploring.
    set /a "treasure_hunting_xp+=10"
    set /a "experience+=10"
)

echo.
pause >nul
goto train_treasure_hunting

:hidden_cave_search
cls
call :draw_treasure_hunting_header
echo.
echo ========================================
echo        HIDDEN CAVE SEARCH
echo ========================================
echo.
echo You venture into a hidden cave system...
echo.
echo [Crawling through narrow passages...]
timeout /t 2 >nul
echo [Using your torch to light the way...]
timeout /t 1 >nul
echo [Listening for the sound of water...]
timeout /t 1 >nul
echo.

REM Cave search success based on treasure hunting level
set /a "cave_success=!random! %% 100"
set /a "success_chance=30 + !treasure_hunting! * 5"

if !cave_success! lss !success_chance! (
    REM Successful cave exploration
    set /a "cave_find=!random! %% 100"
    
    if !cave_find! lss 60 (
        echo You found a hidden treasure chest!
        set /a "chest_coins=!random! %% 100 + 50"
        set /a "coins+=!chest_coins!"
        echo You found !chest_coins! coins in the chest!
        set /a "treasure_hunting_xp+=60"
        set /a "experience+=60"
        
    ) else if !cave_find! lss 90 (
        echo You found a rare mineral deposit!
        if defined inventory (
            set "inventory=!inventory!,Rare Mineral"
        ) else (
            set "inventory=Rare Mineral"
        )
        echo You gained 70 Treasure Hunting experience!
        set /a "treasure_hunting_xp+=70"
        set /a "experience+=70"
        
    ) else (
        echo You found a dragon's hoard!
        set /a "dragon_coins=!random! %% 500 + 200"
        set /a "coins+=!dragon_coins!"
        echo You found !dragon_coins! coins in the dragon's hoard!
        if defined inventory (
            set "inventory=!inventory!,Dragon Scale"
        ) else (
            set "inventory=Dragon Scale"
        )
        echo You also found a dragon scale!
        echo You gained 100 Treasure Hunting experience!
        set /a "treasure_hunting_xp+=100"
        set /a "experience+=100"
    )
    
    call :check_level_up treasure_hunting !treasure_hunting_xp!
    
) else (
    echo The cave is too dangerous to explore further.
    echo You found nothing but darkness and danger.
    echo.
    echo You gained 15 Treasure Hunting experience from trying.
    set /a "treasure_hunting_xp+=15"
    set /a "experience+=15"
)

echo.
pause >nul
goto train_treasure_hunting

:lumbridge_catacombs
cls
echo.
echo ========================================
echo        LUMBRIDGE CATACOMBS
echo ========================================
echo.
echo You descend into the dark catacombs beneath Lumbridge.
echo The air is damp and musty. Torches flicker on the walls.
echo.
echo What would you like to do?
echo.
echo 1. Explore deeper (Combat encounter)
echo 2. Search for treasure
echo 3. Exit the catacombs
echo.
set /p catacomb_choice="Choose action: "

if "%catacomb_choice%"=="1" (
    REM Dungeon combat encounter
    set /a "dungeon_encounter=!random! %% 3"
    if !dungeon_encounter! equ 0 (
        set "enemy_name=Skeleton"
        set "enemy_level=2"
        set "enemy_maxhp=15"
        set "enemy_currenthp=15"
        set "enemy_attack=2"
        set "enemy_defence=1"
        set "enemy_weapon=Bone Club"
        goto real_combat
    ) else if !dungeon_encounter! equ 1 (
        set "enemy_name=Zombie"
        set "enemy_level=3"
        set "enemy_maxhp=20"
        set "enemy_currenthp=20"
        set "enemy_attack=3"
        set "enemy_defence=2"
        set "enemy_weapon=Rotten Fist"
        goto real_combat
    ) else (
        set "enemy_name=Giant Rat"
        set "enemy_level=1"
        set "enemy_maxhp=8"
        set "enemy_currenthp=8"
        set "enemy_attack=1"
        set "enemy_defence=0"
        set "enemy_weapon=Teeth and Claws"
        goto real_combat
    )
)

if "%catacomb_choice%"=="2" (
    REM Treasure search
    set /a "treasure_roll=!random! %% 100"
    if !treasure_roll! lss 30 (
        echo.
        echo You search the dark corners...
        timeout /t 1 >nul
        echo You find some coins hidden in a skull!
        set /a "coins+=15"
        echo You gained 15 coins!
        echo.
    ) else if !treasure_roll! lss 60 (
        echo.
        echo You search the ancient tombs...
        timeout /t 1 >nul
        echo You find some bones!
        if defined inventory (
            set "inventory=!inventory!,Big Bones"
        ) else (
            set "inventory=Big Bones"
        )
        echo Added Big Bones to your inventory!
        echo.
    ) else if !treasure_roll! lss 80 (
        echo.
        echo You rummage through old chests...
        timeout /t 1 >nul
        echo You find a health potion!
        if defined inventory (
            set "inventory=!inventory!,Health Potion"
        ) else (
            set "inventory=Health Potion"
        )
        echo Added Health Potion to your inventory!
        echo.
    ) else (
        echo.
        echo You search thoroughly but find nothing of value.
        echo Better luck next time!
        echo.
    )
    pause >nul
    goto lumbridge_catacombs
)

if "%catacomb_choice%"=="3" (
    echo.
    echo You climb back up to the surface...
    timeout /t 1 >nul
    echo You exit the catacombs safely.
    echo.
    pause >nul
    goto explore_area
)

goto lumbridge_catacombs

:deep_swamp_dungeon
cls
echo.
echo ========================================
echo        DEEP SWAMP DUNGEON
echo ========================================
echo.
echo You enter the treacherous swamp dungeon.
echo Water drips from the ceiling and strange noises echo.
echo This place is much more dangerous than the catacombs!
echo.
echo What would you like to do?
echo.
echo 1. Venture deeper (Dangerous combat)
echo 2. Search the murky waters
echo 3. Exit the dungeon
echo.
set /p swamp_choice="Choose action: "

if "!swamp_choice!"=="1" (
    REM Dangerous dungeon combat
    set /a "danger_encounter=!random! %% 3"
    if !danger_encounter! equ 0 (
        set "enemy_name=Swamp Snake"
        set "enemy_level=5"
        set "enemy_maxhp=25"
        set "enemy_currenthp=25"
        set "enemy_attack=5"
        set "enemy_defence=2"
        set "enemy_weapon=Fangs"
        goto real_combat
    ) else if !danger_encounter! equ 1 (
        set "enemy_name=Poison Spider"
        set "enemy_level=4"
        set "enemy_maxhp=20"
        set "enemy_currenthp=20"
        set "enemy_attack=4"
        set "enemy_defence=3"
        set "enemy_weapon=Venomous Bite"
        goto real_combat
    ) else (
        set "enemy_name=Crocodile"
        set "enemy_level=6"
        set "enemy_maxhp=30"
        set "enemy_currenthp=30"
        set "enemy_attack=6"
        set "enemy_defence=4"
        set "enemy_weapon=Jaws"
        goto real_combat
    )
)

if "!swamp_choice!"=="2" (
    REM Treasure in swamp
    set /a "swamp_treasure=!random! %% 100"
    if !swamp_treasure! lss 20 (
        echo.
        echo You search the murky waters...
        timeout /t 1 >nul
        echo You find a treasure chest underwater!
        set /a "coins+=50"
        echo You gained 50 coins!
        echo.
    ) else if !swamp_treasure! lss 50 (
        echo.
        echo You wade through the swamp...
        timeout /t 1 >nul
        echo You find some rare swamp herbs!
        if defined inventory (
            set "inventory=!inventory!,Swamp Herb"
        ) else (
            set "inventory=Swamp Herb"
        )
        echo Added Swamp Herb to your inventory!
        echo.
    ) else if !swamp_treasure! lss 75 (
        echo.
        echo You search the dungeon walls...
        timeout /t 1 >nul
        echo You find some baby dragon bones!
        if defined inventory (
            set "inventory=!inventory!,Baby Dragon Bones"
        ) else (
            set "inventory=Baby Dragon Bones"
        )
        echo Added Baby Dragon Bones to your inventory!
        echo.
    ) else (
        echo.
        echo The swamp is too dangerous to search thoroughly.
        echo You retreat without finding anything.
        echo.
    )
    pause >nul
    goto deep_swamp_dungeon
)

if "!swamp_choice!"=="3" (
    echo.
    echo You make your way back through the swamp...
    timeout /t 1 >nul
    echo You exit the dungeon, relieved to be in fresh air.
    echo.
    pause >nul
    goto explore_area
)

) else (
    echo Invalid choice! Please select 1-3.
    timeout /t 2 >nul
    goto deep_swamp_dungeon
)

:varrock_sewers
cls
echo.
echo ========================================
echo        VARROCK SEWERS
echo ========================================
echo.
echo You descend into the filthy Varrock Sewers.
echo The air is thick with the stench of decay.
echo Rats scurry in the darkness and strange noises echo.
echo.
echo What would you like to do?
echo.
echo 1. Explore the tunnels (Combat encounter)
echo 2. Search the sewers
echo 3. Exit the sewers
echo.
set /p sewer_choice="Choose action: "

if "!sewer_choice!"=="1" (
    REM Sewer combat encounter
    set /a "sewer_encounter=!random! %% 4"
    if !sewer_encounter! equ 0 (
        set "enemy_name=Giant Rat"
        set "enemy_level=3"
        set "enemy_maxhp=18"
        set "enemy_currenthp=18"
        set "enemy_attack=3"
        set "enemy_defence=1"
        set "enemy_weapon=Teeth and Claws"
        goto real_combat
    ) else if !sewer_encounter! equ 1 (
        set "enemy_name=Sewer Crawler"
        set "enemy_level=4"
        set "enemy_maxhp=22"
        set "enemy_currenthp=22"
        set "enemy_attack=4"
        set "enemy_defence=2"
        set "enemy_weapon=Pincers"
        goto real_combat
    ) else if !sewer_encounter! equ 2 (
        set "enemy_name=Zombie"
        set "enemy_level=3"
        set "enemy_maxhp=20"
        set "enemy_currenthp=20"
        set "enemy_attack=3"
        set "enemy_defence=2"
        set "enemy_weapon=Rotten Fist"
        goto real_combat
    ) else if !sewer_encounter! equ 3 (
        set "enemy_name=Poison Slug"
        set "enemy_level=4"
        set "enemy_maxhp=24"
        set "enemy_currenthp=24"
        set "enemy_attack=4"
        set "enemy_defence=3"
        set "enemy_weapon=Acid Spit"
        goto real_combat
    ) else (
        set "enemy_name=Moss Giant"
        set "enemy_level=7"
        set "enemy_maxhp=35"
        set "enemy_currenthp=35"
        set "enemy_attack=7"
        set "enemy_defence=5"
        set "enemy_weapon=Club"
        goto real_combat
    )
)

if "!sewer_choice!"=="2" (
    REM Treasure in sewers
    set /a "sewer_treasure=!random! %% 100"
    if !sewer_treasure! lss 25 (
        echo.
        echo You wade through the filthy water...
        timeout /t 1 >nul
        echo You find a small treasure chest!
        set /a "coins+=30"
        echo You gained 30 coins!
        echo.
    ) else if !sewer_treasure! lss 50 (
        echo.
        echo You search the sewer walls...
        timeout /t 1 >nul
        echo You find some mysterious runes!
        if defined inventory (
            set "inventory=!inventory!,Mysterious Rune"
        ) else (
            set "inventory=Mysterious Rune"
        )
        echo Added Mysterious Rune to your inventory!
        echo.
    ) else if !sewer_treasure! lss 75 (
        echo.
        echo You rummage through the garbage...
        timeout /t 1 >nul
        echo You find some big bones!
        if defined inventory (
            set "inventory=!inventory!,Big Bones"
        ) else (
            set "inventory=Big Bones"
        )
        echo Added Big Bones to your inventory!
        echo.
    ) else (
        echo.
        echo You search thoroughly but the sewers are too disgusting.
        echo You retreat without finding anything useful.
        echo.
    )
    pause >nul
    goto varrock_sewers
)

if "%sewer_choice%"=="3" (
    echo.
    echo You climb back up to Varrock...
    timeout /t 1 >nul
    echo You exit the sewers, glad to be in fresh air.
    echo.
    pause >nul
    goto explore_area
)

goto varrock_sewers

:taverley_dungeon
cls
echo.
echo ========================================
echo        TAVERLEY DUNGEON
echo ========================================
echo.
echo You enter the legendary Taverley Dungeon.
echo This place is filled with powerful monsters and ancient treasures.
echo The air is heavy with magic and danger.
echo.
echo What would you like to do?
echo.
echo 1. Venture into the depths (Elite combat)
echo 2. Search the ancient chambers
echo 3. Exit the dungeon
echo.
set /p taverley_choice="Choose action: "

if "!taverley_choice!"=="1" (
    REM Elite dungeon combat
    set /a "elite_encounter=!random! %% 3"
    if !elite_encounter! equ 0 (
        set "enemy_name=Hellhound"
        set "enemy_level=10"
        set "enemy_maxhp=50"
        set "enemy_currenthp=50"
        set "enemy_attack=10"
        set "enemy_defence=7"
        set "enemy_weapon=Fire Breath"
        goto real_combat
    ) else if !elite_encounter! equ 1 (
        set "enemy_name=Blue Dragon"
        set "enemy_level=12"
        set "enemy_maxhp=60"
        set "enemy_currenthp=60"
        set "enemy_attack=12"
        set "enemy_defence=8"
        set "enemy_weapon=Dragon Breath"
        goto real_combat
    ) else (
        set "enemy_name=Dungeon Crawler"
        set "enemy_level=8"
        set "enemy_maxhp=40"
        set "enemy_currenthp=40"
        set "enemy_attack=8"
        set "enemy_defence=5"
        set "enemy_weapon=Venomous Bite"
        goto real_combat
    )
)

if "!taverley_choice!"=="2" (
    REM Treasure in Taverley
    set /a "taverley_treasure=!random! %% 100"
    if !taverley_treasure! lss 15 (
        echo.
        echo You explore the ancient chambers...
        timeout /t 1 >nul
        echo You find a legendary treasure chest!
        set /a "coins+=100"
        echo You gained 100 coins!
        echo.
    ) else if !taverley_treasure! lss 40 (
        echo.
        echo You search the magical runes...
        timeout /t 1 >nul
        echo You find some dragon bones!
        if defined inventory (
            set "inventory=!inventory!,Baby Dragon Bones"
        ) else (
            set "inventory=Baby Dragon Bones"
        )
        echo Added Baby Dragon Bones to your inventory!
        echo.
    ) else if !taverley_treasure! lss 70 (
        echo.
        echo You examine the ancient artifacts...
        timeout /t 1 >nul
        echo You find a magical orb!
        if defined inventory (
            set "inventory=!inventory!,Magical Orb"
        ) else (
            set "inventory=Magical Orb"
        )
        echo Added Magical Orb to your inventory!
        echo.
    ) else (
        echo.
        echo The dungeon's magic makes it hard to find anything.
        echo You retreat without finding treasure.
        echo.
    )
    pause >nul
    goto taverley_dungeon
)

if "!taverley_choice!"=="3" (
    echo.
    echo You make your way back to the surface...
    timeout /t 1 >nul
    echo You exit Taverley Dungeon safely.
    echo.
    pause >nul
    goto explore_area
)

) else (
    echo Invalid choice! Please select 1-3.
    timeout /t 2 >nul
    goto taverley_dungeon
)

:dwarven_mines
cls
echo.
echo ========================================
echo        DWARVEN MINES
echo ========================================
echo.
echo You enter the extensive Dwarven Mines.
echo The dwarves have carved vast tunnels deep into the mountains.
echo Pickaxes echo in the distance as dwarves work tirelessly.
echo.
echo What would you like to do?
echo.
echo 1. Mine in the dwarven tunnels (Mining encounter)
echo 2. Search for dwarven artifacts
echo 3. Exit the mines
echo.
set /p dwarven_choice="Choose action: "

if "!dwarven_choice!"=="1" (
    REM Mining encounter
    set /a "mine_encounter=!random! %% 4"
    if !mine_encounter! equ 0 (
        set "enemy_name=Rock Crab"
        set "enemy_level=5"
        set "enemy_maxhp=25"
        set "enemy_currenthp=25"
        set "enemy_attack=5"
        set "enemy_defence=4"
        set "enemy_weapon=Pincers"
        goto real_combat
    ) else if !mine_encounter! equ 1 (
        set "enemy_name=Dwarf"
        set "enemy_level=6"
        set "enemy_maxhp=28"
        set "enemy_currenthp=28"
        set "enemy_attack=6"
        set "enemy_defence=5"
        set "enemy_weapon=Pickaxe"
        goto real_combat
    ) else if !mine_encounter! equ 2 (
        set "enemy_name=Ice Warrior"
        set "enemy_level=7"
        set "enemy_maxhp=32"
        set "enemy_currenthp=32"
        set "enemy_attack=7"
        set "enemy_defence=6"
        set "enemy_weapon=Spear"
        goto real_combat
    ) else (
        REM Mining success instead of combat
        echo.
        echo You find a rich mineral vein!
        timeout /t 1 >nul
        echo You mine successfully and gain ore!
        if defined inventory (
            set "inventory=!inventory!,Mithril Ore"
        ) else (
            set "inventory=Mithril Ore"
        )
        set /a "mining_xp+=75"
        set /a "experience+=75"
        call :check_level_up mining !mining_xp!
        echo You gained 75 Mining experience!
        echo.
        pause >nul
        goto dwarven_mines
    )
)

if "!dwarven_choice!"=="2" (
    REM Dwarven artifacts
    set /a "dwarven_treasure=!random! %% 100"
    if !dwarven_treasure! lss 30 (
        echo.
        echo You search the dwarven workshops...
        timeout /t 1 >nul
        echo You find some dwarven tools!
        if defined inventory (
            set "inventory=!inventory!,Dwarven Tools"
        ) else (
            set "inventory=Dwarven Tools"
        )
        echo Added Dwarven Tools to your inventory!
        echo.
    ) else if !dwarven_treasure! lss 60 (
        echo.
        echo You examine the ancient dwarven forges...
        timeout /t 1 >nul
        echo You find some coal!
        if defined inventory (
            set "inventory=!inventory!,Coal"
        ) else (
            set "inventory=Coal"
        )
        echo Added Coal to your inventory!
        echo.
    ) else if !dwarven_treasure! lss 80 (
        echo.
        echo You search the storage areas...
        timeout /t 1 >nul
        echo You find some wolf bones!
        if defined inventory (
            set "inventory=!inventory!,Wolf Bones"
        ) else (
            set "inventory=Wolf Bones"
        )
        echo Added Wolf Bones to your inventory!
        echo.
    ) else (
        echo.
        echo The dwarves guard their secrets well.
        echo You find nothing of interest.
        echo.
    )
    pause >nul
    goto dwarven_mines
)

if "!dwarven_choice!"=="3" (
    echo.
    echo You head back to the surface...
    timeout /t 1 >nul
    echo You exit the Dwarven Mines.
    echo.
    pause >nul
    goto explore_area
)

) else (
    echo Invalid choice! Please select 1-3.
    timeout /t 2 >nul
    goto dwarven_mines
)

:cook_food
REM Replace raw food with cooked food
if "!inventory!" findstr "Sardine" >nul (
    call :remove_item "Sardine"
    if defined inventory (
        set "inventory=!inventory!,Cooked Sardine"
    ) else (
        set "inventory=Cooked Sardine"
    )
)

if "!inventory!" findstr "Chicken" >nul (
    call :remove_item "Chicken"
    if defined inventory (
        set "inventory=!inventory!,Cooked Chicken"
    ) else (
        set "inventory=Cooked Chicken"
    )
)

if "!inventory!" findstr "Beef" >nul (
    call :remove_item "Beef"
    if defined inventory (
        set "inventory=!inventory!,Cooked Beef"
    ) else (
        set "inventory=Cooked Beef"
    )
)
goto :eof

:use_item_function
REM Parameters: %1 = item name
set "item_name=%1"

if "!item_name!"=="Bread" (
    echo You eat the bread...
    timeout /t 1 >nul
    echo You heal 2 hitpoints!
    set /a "currenthp+=2"
    if !currenthp! gtr %maxhp% set "currenthp=%maxhp%"
    call :remove_item "Bread"
)

if "!item_name!"=="Health Potion" (
    echo You drink the health potion...
    timeout /t 1 >nul
    echo You heal 5 hitpoints!
    set /a "currenthp+=5"
    if !currenthp! gtr %maxhp% set "currenthp=%maxhp%"
    call :remove_item "Health Potion"
)

if "!item_name!"=="Cooked Sardine" (
    echo You eat the cooked sardine...
    timeout /t 1 >nul
    echo You heal 3 hitpoints!
    set /a "currenthp+=3"
    if !currenthp! gtr %maxhp% set "currenthp=%maxhp%"
    call :remove_item "Cooked Sardine"
)

if "!item_name!"=="Cooked Chicken" (
    echo You eat the cooked chicken...
    timeout /t 1 >nul
    echo You heal 4 hitpoints!
    set /a "currenthp+=4"
    if !currenthp! gtr %maxhp% set "currenthp=%maxhp%"
    call :remove_item "Cooked Chicken"
)

if "!item_name!"=="Bones" (
    echo You bury the bones...
    timeout /t 1 >nul
    echo You gain 5 Prayer experience!
    set /a "prayer_xp+=5"
    set /a "experience+=5"
    call :check_level_up prayer !prayer_xp!
    call :remove_item "Bones"
)

if "!item_name!"=="Big Bones" (
    echo You bury the big bones...
    timeout /t 1 >nul
    echo You gain 15 Prayer experience!
    set /a "prayer_xp+=15"
    set /a "experience+=15"
    call :check_level_up prayer !prayer_xp!
    call :remove_item "Big Bones"
)

if "!item_name!"=="Wolf Bones" (
    echo You bury the wolf bones...
    timeout /t 1 >nul
    echo You gain 25 Prayer experience!
    set /a "prayer_xp+=25"
    set /a "experience+=25"
    call :check_level_up prayer !prayer_xp!
    call :remove_item "Wolf Bones"
)

if "!item_name!"=="Baby Dragon Bones" (
    echo You bury the baby dragon bones...
    timeout /t 1 >nul
    echo You gain 30 Prayer experience!
    set /a "prayer_xp+=30"
    set /a "experience+=30"
    call :check_level_up prayer !prayer_xp!
    call :remove_item "Baby Dragon Bones"
)

if "!item_name!"=="Tinderbox" (
    echo You use the tinderbox...
    timeout /t 1 >nul
    echo.
    echo You can use the tinderbox to light fires!
    echo.
    echo Do you want to start a firemaking minigame?
    echo 1. Yes, start firemaking minigame
    echo 2. No, cancel
    echo.
    set /p fire_choice="Choose option: "
    if "!fire_choice!"=="1" (
        call :start_firemaking_minigame
    ) else (
        echo You put the tinderbox away.
    )
)

pause >nul
goto :eof

:examine_item_function
REM Parameters: %1 = item name
set "item_name=%1"

if "!item_name!"=="Bread" (
    echo A loaf of fresh bread. Restores 2 hitpoints when eaten.
)

if "!item_name!"=="Bronze Sword" (
    echo A basic bronze sword. Good for low-level combat.
)

if "!item_name!"=="Wooden Shield" (
    echo A simple wooden shield. Provides basic protection.
)

if "!item_name!"=="Fishing Rod" (
    echo A fishing rod. Used for catching fish.
)

if "!item_name!"=="Axe" (
    echo A woodcutting axe. Used for chopping trees.
)

if "!item_name!"=="Pickaxe" (
    echo A mining pickaxe. Used for mining ore.
)

if "!item_name!"=="Health Potion" (
    echo A red potion that restores 5 hitpoints when drunk.
)

if "!item_name!"=="Logs" (
    echo Freshly cut logs. Can be used for firemaking or construction.
)

if "!item_name!"=="Copper Ore" (
    echo Copper ore. Can be smelted into bars.
)

if "!item_name!"=="Bronze Bar" (
    echo A bronze bar. Can be used for smithing weapons and armor.
)

if "!item_name!"=="Bones" (
    echo Bones from a defeated enemy. Can be buried for prayer experience.
)

if "!item_name!"=="Big Bones" (
    echo Large bones from bigger creatures. Worth more prayer experience when buried.
)

if "!item_name!"=="Wolf Bones" (
    echo Bones from a wolf. Very valuable and give good prayer experience.
)

if "!item_name!"=="Baby Dragon Bones" (
    echo Rare bones from a baby dragon. Extremely valuable for prayer training.
)

if "!item_name!"=="Ashes" (
    echo Ashes from burnt logs. Can be collected and sold for profit.
)

if "!item_name!"=="Tinderbox" (
    echo A small metal box containing flint and steel. Used to light fires for firemaking training.
)

pause >nul
goto :eof

:start_firemaking_minigame
cls
call :draw_location_header
echo.
echo ========================================
echo         FIREMAKING MINIGAME
echo ========================================
echo.
echo You prepare to light a fire using your tinderbox...
echo.

REM Check if player has logs
call :count_item "Logs"
if !item_count! lss 1 (
    echo You need logs to make a fire!
    echo Get some logs from woodcutting first.
    echo.
    pause >nul
    goto :eof
)

echo You have !item_count! logs available.
echo.
echo Choose your firemaking approach:
echo.
echo 1. Quick Fire (Easy - 25 XP) - Simple fire lighting
echo 2. Controlled Fire (Medium - 40 XP) - Careful fire management
echo 3. Master Fire (Hard - 60 XP) - Advanced firemaking technique
echo 4. Cancel
echo.
set /p fire_approach="Choose approach: "

if "%fire_approach%"=="1" goto quick_fire
if "%fire_approach%"=="2" goto controlled_fire
if "%fire_approach%"=="3" goto master_fire
if "%fire_approach%"=="4" goto :eof

echo Invalid choice!
pause >nul
goto start_firemaking_minigame

:quick_fire
cls
call :draw_location_header
echo.
echo ========================================
echo         QUICK FIRE - EASY
echo ========================================
echo.
echo You quickly arrange the logs and strike your tinderbox...
echo.
echo Fire Progress: [                    ] 0%%
echo.
echo Press SPACE to strike the flint!
echo.
set /p strike_input="Press SPACE: "
if "!strike_input!"==" " (
    echo ✓ Spark created! Press F to fan the flames...
    echo Fire Progress: [####                ] 25%%
    echo.
    set /p fan_input="Press F: "
    if "!fan_input!"=="f" (
        echo ✓ Flames growing! Press A to add more fuel...
        echo Fire Progress: [########            ] 50%%
        echo.
        set /p fuel_input="Press A: "
        if "!fuel_input!"=="a" (
            echo ✓ Fire established! Press B to build it up...
            echo Fire Progress: [############        ] 75%%
            echo.
            set /p build_input="Press B: "
            if "!build_input!"=="b" (
                echo ✓ Perfect fire created!
                echo Fire Progress: [####################] 100%%
                echo.
                echo You successfully lit a fire!
                echo You gained 30 Firemaking experience! (Bonus for perfect fire!)
                set /a "firemaking_xp+=30"
                set /a "experience+=30"
                call :remove_item "Logs"
                call :add_item "Ashes"
            ) else (
                echo You created a decent fire!
                echo Fire Progress: [####################] 100%%
                echo.
                echo You gained 25 Firemaking experience!
                set /a "firemaking_xp+=25"
                set /a "experience+=25"
                call :remove_item "Logs"
                call :add_item "Ashes"
            )
        ) else (
            echo You created a small fire!
            echo Fire Progress: [####################] 100%%
            echo.
            echo You gained 20 Firemaking experience!
            set /a "firemaking_xp+=20"
            set /a "experience+=20"
            call :remove_item "Logs"
            call :add_item "Ashes"
        )
    ) else (
        echo You created a weak fire!
        echo Fire Progress: [####################] 100%%
        echo.
        echo You gained 15 Firemaking experience!
        set /a "firemaking_xp+=15"
        set /a "experience+=15"
        call :remove_item "Logs"
        call :add_item "Ashes"
    )
) else (
    echo You failed to create a fire!
    echo The logs remain unlit.
    echo.
    echo You gained 5 Firemaking experience for trying.
    set /a "firemaking_xp+=5"
    set /a "experience+=5"
)
call :check_level_up firemaking !firemaking_xp!
echo.
echo Press any key to continue...
pause >nul
goto :eof

:controlled_fire
cls
call :draw_location_header
echo.
echo ========================================
echo       CONTROLLED FIRE - MEDIUM
echo ========================================
echo.
echo You carefully arrange the logs in a proper fire structure...
echo.
echo Fire Progress: [                    ] 0%%
echo.
echo Press S to strike the flint carefully...
echo.
set /p strike_input="Press S: "
if "!strike_input!"=="s" (
    echo ✓ Good spark! Press F to fan gently...
    echo Fire Progress: [####                ] 25%%
    echo.
    set /p fan_input="Press F: "
    if "!fan_input!"=="f" (
        echo ✓ Flames steady! Press A to add fuel carefully...
        echo Fire Progress: [########            ] 50%%
        echo.
        set /p fuel_input="Press A: "
        if "!fuel_input!"=="a" (
            echo ✓ Fire stable! Press B to control the heat...
            echo Fire Progress: [############        ] 75%%
            echo.
            set /p control_input="Press B: "
            if "!control_input!"=="b" (
                echo ✓ Excellent controlled fire!
                echo Fire Progress: [####################] 100%%
                echo.
                echo You created a perfectly controlled fire!
                echo You gained 50 Firemaking experience! (Perfect control!)
                set /a "firemaking_xp+=50"
                set /a "experience+=50"
                call :remove_item "Logs"
                call :add_item "Ashes"
            ) else (
                echo You created a good controlled fire!
                echo Fire Progress: [####################] 100%%
                echo.
                echo You gained 40 Firemaking experience!
                set /a "firemaking_xp+=40"
                set /a "experience+=40"
                call :remove_item "Logs"
                call :add_item "Ashes"
            )
        ) else (
            echo You created a decent fire!
            echo Fire Progress: [####################] 100%%
            echo.
            echo You gained 30 Firemaking experience!
            set /a "firemaking_xp+=30"
            set /a "experience+=30"
            call :remove_item "Logs"
            call :add_item "Ashes"
        )
    ) else (
        echo You created a basic fire!
        echo Fire Progress: [####################] 100%%
        echo.
        echo You gained 25 Firemaking experience!
        set /a "firemaking_xp+=25"
        set /a "experience+=25"
        call :remove_item "Logs"
        call :add_item "Ashes"
    )
) else (
    echo You failed to create a proper fire!
    echo The logs remain unlit.
    echo.
    echo You gained 10 Firemaking experience for trying.
    set /a "firemaking_xp+=10"
    set /a "experience+=10"
)
call :check_level_up firemaking !firemaking_xp!
echo.
echo Press any key to continue...
pause >nul
goto :eof

:master_fire
cls
call :draw_location_header
echo.
echo ========================================
echo         MASTER FIRE - HARD
echo ========================================
echo.
echo You prepare to create a masterful fire using advanced techniques...
echo.
echo Fire Progress: [                    ] 0%%
echo.
echo Press M to strike with master technique...
echo.
set /p strike_input="Press M: "
if "!strike_input!"=="m" (
    echo ✓ Perfect spark! Press F to fan with precision...
    echo Fire Progress: [####                ] 25%%
    echo.
    set /p fan_input="Press F: "
    if "!fan_input!"=="f" (
        echo ✓ Flames perfect! Press A to add fuel masterfully...
        echo Fire Progress: [########            ] 50%%
        echo.
        set /p fuel_input="Press A: "
        if "!fuel_input!"=="a" (
            echo ✓ Fire optimal! Press B to master the heat...
            echo Fire Progress: [############        ] 75%%
            echo.
            set /p master_input="Press B: "
            if "!master_input!"=="b" (
                echo ✓ Flawless fire mastery!
                echo Fire Progress: [####################] 100%%
                echo.
                echo You created a masterful fire!
                echo You gained 80 Firemaking experience! (Master fire bonus!)
                set /a "firemaking_xp+=80"
                set /a "experience+=80"
                call :remove_item "Logs"
                call :add_item "Ashes"
            ) else (
                echo You created an excellent fire!
                echo Fire Progress: [####################] 100%%
                echo.
                echo You gained 60 Firemaking experience!
                set /a "firemaking_xp+=60"
                set /a "experience+=60"
                call :remove_item "Logs"
                call :add_item "Ashes"
            )
        ) else (
            echo You created a good fire!
            echo Fire Progress: [####################] 100%%
            echo.
            echo You gained 45 Firemaking experience!
            set /a "firemaking_xp+=45"
            set /a "experience+=45"
            call :remove_item "Logs"
            call :add_item "Ashes"
        )
    ) else (
        echo You created a decent fire!
        echo Fire Progress: [####################] 100%%
        echo.
        echo You gained 35 Firemaking experience!
        set /a "firemaking_xp+=35"
        set /a "experience+=35"
        call :remove_item "Logs"
        call :add_item "Ashes"
    )
) else (
    echo You failed to create a master fire!
    echo The logs remain unlit.
    echo.
    echo You gained 15 Firemaking experience for trying.
    set /a "firemaking_xp+=15"
    set /a "experience+=15"
)
call :check_level_up firemaking !firemaking_xp!
echo.
echo Press any key to continue...
pause >nul
goto :eof

:grand_exchange
cls
call :draw_ge_header
echo.
echo ========================================
echo         GRAND EXCHANGE
echo ========================================
echo.
echo Welcome to the Grand Exchange!
echo Here you can buy and sell items with other players.
echo.
echo 1. View Market Prices
echo 2. Buy Items
echo 3. Sell Items
echo 4. View My Offers
echo 5. Collect Items
echo 0. Back to main menu
echo.
set /p ge_choice="Choose option: "

if "%ge_choice%"=="1" goto ge_prices
if "%ge_choice%"=="2" goto ge_buy
if "%ge_choice%"=="3" goto ge_sell
if "%ge_choice%"=="4" goto ge_offers
if "%ge_choice%"=="5" goto ge_collect
if "%ge_choice%"=="0" goto main_menu

goto grand_exchange

:ge_prices
cls
echo ========================================
echo         MARKET PRICES
echo ========================================
echo.
echo Current Grand Exchange Prices:
echo.
echo Weapons & Armor:
echo Iron Sword: 140-160 coins
echo Iron Shield: 112-130 coins
echo Steel Sword: 325-375 coins
echo.
echo Tools & Supplies:
echo Bronze Sword: 25-35 coins
echo Wooden Shield: 15-25 coins
echo Fishing Rod: 50-65 coins
echo Axe: 30-40 coins
echo Pickaxe: 40-50 coins
echo.
echo Food & Potions:
echo Bread: 12-15 coins
echo Health Potion: 35-45 coins
echo Cooked Sardine: 25-30 coins
echo.
echo Materials:
echo Copper Ore: 20-25 coins
echo Tin Ore: 15-20 coins
echo Bronze Bar: 30-35 coins
echo Logs: 20-25 coins
echo.
echo Bones & Ashes:
echo Bones: 25-30 coins
echo Big Bones: 60-70 coins
echo Wolf Bones: 150-180 coins
echo Baby Dragon Bones: 300-360 coins
echo Ashes: 8-10 coins
echo.
echo Press any key to return...
pause >nul
goto grand_exchange

:ge_buy
cls
echo ========================================
echo         BUY ITEMS
echo ========================================
echo.
echo Your coins: !coins!
echo.
echo Available items to buy:
echo.
echo 1. Bread - 15 coins
echo 2. Bronze Sword - 30 coins
echo 3. Wooden Shield - 20 coins
echo 4. Fishing Rod - 60 coins
echo 5. Axe - 35 coins
echo 6. Pickaxe - 45 coins
echo 7. Health Potion - 40 coins
echo 8. Copper Ore - 22 coins
echo 9. Tin Ore - 18 coins
echo 10. Logs - 22 coins
echo 11. Bones - 30 coins
echo 12. Big Bones - 70 coins
echo 13. Wolf Bones - 180 coins
echo 14. Baby Dragon Bones - 360 coins
echo 15. Ashes - 10 coins
echo 0. Back
echo.
set /p buy_choice="What would you like to buy? "

if "%buy_choice%"=="0" goto grand_exchange

REM Handle purchases
call :ge_buy_item !buy_choice!
goto ge_buy

:ge_sell
cls
echo ========================================
echo         SELL ITEMS
echo ========================================
echo.
echo Your Inventory:
set "sell_count=0"
call :parse_inventory
if !item_count! equ 0 (
    echo You have no items to sell!
    echo.
    pause >nul
    goto grand_exchange
)
echo.
echo Choose an item number to sell (or 0 to go back):
set /p sell_choice="Sell item number: "

if "%sell_choice%"=="0" goto grand_exchange

REM Handle selling
call :ge_sell_item !sell_choice!
goto ge_sell

:ge_offers
cls
echo ========================================
echo         MY OFFERS
echo ========================================
echo.
echo You have no active offers.
echo (Offers system coming in future update!)
echo.
pause >nul
goto grand_exchange

:ge_collect
cls
echo ========================================
echo         COLLECT ITEMS
echo ========================================
echo.
echo You have no items to collect.
echo (Collection system coming in future update!)
echo.
pause >nul
goto grand_exchange

:crafting_workshop
cls
call :draw_crafting_header
echo.
echo ========================================
echo         CRAFTING WORKSHOP
echo ========================================
echo.
echo Welcome to the Crafting Workshop!
echo Create useful items from raw materials.
echo.
echo Your Crafting Level: !crafting!
echo.
echo Available Crafting Recipes:
echo.
echo 1. Bronze Bar (Copper Ore + Tin Ore) - Level 1
echo 2. Iron Bar (Iron Ore) - Level 15
echo 3. Steel Bar (Iron Ore + Coal) - Level 30
echo 4. Leather Boots (Leather) - Level 7
echo 5. Leather Gloves (Leather) - Level 1
echo 6. Leather Armor (2x Leather) - Level 14
echo 7. Hard Leather Armor (3x Leather) - Level 28
echo 8. Studded Leather (Leather + Steel Studs) - Level 41
echo 9. Green Dragonhide (Green D'hide) - Level 63
echo 10. Jewelry (Gold/Silver + Gems) - Level 5+
echo 11. Pottery (Clay) - Level 1
echo 12. Glass Items (Sand + Soda Ash) - Level 1
echo 13. Battlestaves (Battlestaff + Orbs) - Level 54
echo 14. Dragon Battlestaves (Battlestaff + Dragon Stones) - Level 80
echo 15. Godswords (Godsword Shards) - Level 80
echo 0. Back to main menu
echo.
set /p craft_choice="Choose recipe: "

if "%craft_choice%"=="0" goto main_menu

REM Handle crafting
call :craft_item !craft_choice!
goto crafting_workshop

:bank
cls
call :draw_bank_header
echo.
echo ========================================
echo         BANK OF RUNESCAPE
echo ========================================
echo.
echo Welcome to your bank account!
echo Store and organize your items safely.
echo.
echo Bank Options:
echo.
echo 1. Deposit Items
echo 2. Withdraw Items
echo 3. View Bank Contents
echo 4. Bank PIN Settings
echo 0. Back to main menu
echo.
set /p bank_choice="Choose option: "

if "%bank_choice%"=="1" goto bank_deposit
if "%bank_choice%"=="2" goto bank_withdraw
if "%bank_choice%"=="3" goto bank_view
if "%bank_choice%"=="4" goto bank_pin
if "%bank_choice%"=="0" goto main_menu

goto bank

:bank_deposit
cls
echo ========================================
echo         DEPOSIT ITEMS
echo ========================================
echo.
echo Your Inventory:
call :parse_inventory
if !item_count! equ 0 (
    echo You have no items to deposit!
    echo.
    pause >nul
    goto bank
)
echo.
echo Choose item number to deposit (or 0 to go back):
set /p dep_choice="Deposit item number: "

if "%dep_choice%"=="0" goto bank

REM Handle deposit
call :bank_deposit_item !dep_choice!
goto bank_deposit

:bank_withdraw
cls
echo ========================================
echo         WITHDRAW ITEMS
echo ========================================
echo.
echo Bank Contents: Empty
echo (Bank system will be expanded in future updates!)
echo.
pause >nul
goto bank

:bank_view
cls
echo ========================================
echo         BANK CONTENTS
echo ========================================
echo.
echo Your bank is currently empty.
echo Items deposited here are safe and accessible from anywhere!
echo.
pause >nul
goto bank

:bank_pin
cls
echo ========================================
echo         BANK PIN SETTINGS
echo ========================================
echo.
echo Bank PIN provides extra security for your account.
echo (PIN system coming in future update!)
echo.
pause >nul
goto bank

REM ============================================
REM     ASCII GRAPHICS FUNCTIONS
REM ============================================

:draw_title_screen
cls
color 0A
echo.
echo.
echo    ========================================    ========================================
echo    ========================================    ========================================
echo    ========================================    ========================================
echo    ========================================    ========================================
echo    ========================================    ========================================
echo    ========================================    ========================================
echo.
echo                                    ==   TOON-SCAPE   ==
echo.
echo                                  RUNESCAPE IN BATCH FORMAT
echo.
echo                            ========================================
echo                            ========================================
echo                            ========================================
echo.
echo                                    Created by CrypticTM
echo                              Fan-made- Not affiliated
echo                                   w/ Jagex or RuneScape
echo.
echo.
echo                           ========================================
echo.
echo                                    [1] Start New Game
echo                                    [2] Load Saved Game
echo                                    [3] View Credits
echo                                    [4] Exit Game
echo.
echo                           ========================================
echo.
set /p "title_choice=Choose an option (1-4): "

if "!title_choice!"=="1" (
    echo.
    echo Starting new adventure...
    timeout /t 2 >nul
    cls
    goto :eof
) else if "!title_choice!"=="2" (
    echo.
    echo Loading saved game...
    timeout /t 2 >nul
    cls
    goto :eof
) else if "!title_choice!"=="3" (
    cls
    echo.
    echo ========================================
    echo                CREDITS
    echo ========================================
    echo.
    echo Game Design and Programming: CrypticTM
    echo Game Concept: RuneScape Fan Game
    echo Platform: Windows Batch Script
    echo Version: 0.0.6
    echo.
    echo This is a fan-made game created for educational
    echo and entertainment purposes. It is not affiliated
    echo with Jagex Ltd. or RuneScape.
    echo.
    echo Press any key to return to title screen...
    pause >nul
    call :draw_title_screen
) else if "!title_choice!"=="4" (
    echo.
    echo Thank you for playing TOON-SCAPE!
    echo.
    pause >nul
    exit
) else (
    echo Invalid choice! Please select 1-4.
    timeout /t 2 >nul
    call :draw_title_screen
)
goto :eof

:draw_location_header
if "!location!"=="LUMBRIDGE" (
    echo.
    echo    _     _     _     _     _     _     _     _     _
    echo   ^| ^|   ^| ^|   ^| ^|   ^| ^|   ^| ^|   ^| ^|   ^^^_^| ^|   ^| ^|
    echo   ^| ^|   ^| ^| ^^  ^| ^|   ^| ^|   ^| ^|   ^| ^|   ^| ^|   ^| ^|
    echo   ^| ^|_^^^__^| ^|___^| ^|___^| ^|___^| ^|___^| ^|__^^_^| ^|___^| ^|___^|
    echo   ^|_____^|__%%__^_%%^|_____^|_____^|_____^|_____^|_____^|_____^|_____^|
    echo     L     U     M     B     R     I     D     G     E
    echo.
    echo  +================================================+
    echo  ^|              LUMBRIDGE TOWN                  ^|
    echo  ^|            The peaceful starting town        ^|
    echo  +================================================+
)
if "!location!"=="VARROCK" (
    echo.
    echo   _____     _____     _____     _____     _____
    echo  ^|     ^|   ^|     ^|   ^|     ^|   ^|     ^|   ^|     ^|
    echo  ^|     ^|   ^|     ^|   ^|     ^|   ^|     ^|   ^|     ^|
    echo  ^|_____^|   ^|_____^|   ^|_____^|   ^|_____^|   ^|_____^|
    echo     V     A     R     R     O     C     K
    echo.
    echo  +================================================+
    echo  ^|                VARROCK CITY                  ^|
    echo  ^|          The busy capital of Misthalin       ^|
    echo  +================================================+
)
goto :eof

:draw_character_portrait
echo.
echo  +================================================+
echo  ^|                 CHARACTER STATS               ^|
echo  ^|                                                ^|
echo  ^|  [O]  Adventurer          Level: !level!       ^|
echo  ^|  [NPC] Combat Level: !combat_level!           ^|
echo  ^|  [NPC] HP: !currenthp!/!maxhp!                ^|
echo  ^|       Gold: !coins! coins    XP: !experience!  ^|
echo  ^|                                                ^|
echo  ^|  +==========================================+  ^|
echo  ^|  ^|              EQUIPMENT                 ^|  ^|
echo  ^|  ^|  Weapon: Bronze Sword                   ^|  ^|
echo  ^|  ^|  Shield: Wooden Shield                   ^|  ^|
echo  ^|  ^|  Armor: Basic Clothing                   ^|  ^|
echo  ^|  +==========================================+  ^|
echo  +================================================+
goto :eof

:draw_combat_scene
echo.
echo  +================================================+
echo  ^|                    BATTLE!                    ^|
echo  ^|                                                ^|
echo  ^|  [O]  You            [O]  !enemy_name!         ^|
echo  ^|  [NPC] HP: !currenthp!/!maxhp!                ^|
echo  ^|  [NPC] Attack: !attack! ^|  HP: !enemy_currenthp!/!enemy_maxhp! ^|
echo  ^|                        ^|  Attack: !enemy_attack! ^|
echo  ^|                                                ^|
echo  ^|  Weapon: Bronze Sword  ^|  Weapon: !enemy_weapon! ^|
echo  +================================================+
goto :eof

:draw_location_scene
if "!location!"=="LUMBRIDGE" (
    echo.
    echo  +================================================+
    echo  ^|              LUMBRIDGE TOWN                  ^|
    echo  ^|                                                ^|
    echo  ^|  [O]  Castle          [O]  Church             ^|
    echo  ^|  [NPC] Guards         [NPC] Father Aereck     ^|
    echo  ^|  [NPC] Duke Horacio   [NPC] Prayer Training   ^|
    echo  ^|                                                ^|
    echo  ^|  [OBJ] Windmill       [OBJ] River             ^|
    echo  ^|  [OBJ] Grinding       [OBJ] Fishing Spot      ^|
    echo  ^|  [OBJ] Cooking        [OBJ] Sardines          ^|
    echo  ^|                                                ^|
    echo  ^|  [OBJ] Forest         [OBJ] Training          ^|
    echo  ^|  [OBJ] Trees          [OBJ] Combat Dummies    ^|
    echo  ^|  [OBJ] Woodcutting    [OBJ] Skill Training    ^|
    echo  +================================================+
) else if "!location!"=="VARROCK" (
    echo.
    echo  +================================================+
    echo  ^|              VARROCK CITY                     ^|
    echo  ^|                                                ^|
    echo  ^|  [O]  Castle          [O]  Church             ^|
    echo  ^|  [NPC] King Roald     [NPC] Priest            ^|
    echo  ^|  [NPC] Royal Guards   [NPC] Prayer Training   ^|
    echo  ^|                                                ^|
    echo  ^|  [OBJ] Market         [OBJ] Museum            ^|
    echo  ^|  [OBJ] Shops          [OBJ] Artifacts         ^|
    echo  ^|  [OBJ] Trading        [OBJ] History           ^|
    echo  ^|                                                ^|
    echo  ^|  [OBJ] Wilderness     [OBJ] Sewers            ^|
    echo  ^|  [OBJ] Wall           [OBJ] Underground       ^|
    echo  ^|  [OBJ] Danger         [OBJ] Tunnels           ^|
    echo  +================================================+
) else if "!location!"=="FALADOR" (
    echo.
    echo  +================================================+
    echo  ^|              FALADOR CITY                     ^|
    echo  ^|                                                ^|
    echo  ^|  [O]  Castle          [O]  Monastery          ^|
    echo  ^|  [NPC] White Knights  [NPC] Monks             ^|
    echo  ^|  [NPC] Headquarters   [NPC] Prayer Training   ^|
    echo  ^|                                                ^|
    echo  ^|  [OBJ] Marketplace    [OBJ] Mining Guild      ^|
    echo  ^|  [OBJ] Premium Goods  [OBJ] Elite Miners      ^|
    echo  ^|  [OBJ] Quality Items  [OBJ] Mining Training   ^|
    echo  ^|                                                ^|
    echo  ^|  [OBJ] Party Room     [OBJ] Taverley          ^|
    echo  ^|  [OBJ] Celebrations   [OBJ] Dungeon           ^|
    echo  ^|  [OBJ] Festivities    [OBJ] Underground       ^|
    echo  +================================================+
) else if "!location!"=="ALKHARID" (
    echo.
    echo  +================================================+
    echo  ^|              AL KHARID CITY                   ^|
    echo  ^|                                                ^|
    echo  ^|  [O]  Palace          [O]  Duel Arena         ^|
    echo  ^|  [NPC] Emir           [NPC] Warriors          ^|
    echo  ^|  [NPC] Royal Guards   [NPC] Combat Training   ^|
    echo  ^|                                                ^|
    echo  ^|  [OBJ] Scorpion Pit   [OBJ] Mining Site       ^|
    echo  ^|  [OBJ] Dangerous      [OBJ] Valuable Ores     ^|
    echo  ^|  [OBJ] Attraction     [OBJ] Rich Deposits     ^|
    echo  ^|                                                ^|
    echo  ^|  [OBJ] Desert         [OBJ] Sand Dunes        ^|
    echo  ^|  [OBJ] Hot Sun        [OBJ] Vast Expanse      ^|
    echo  ^|  [OBJ] Heat           [OBJ] Endless Sands     ^|
    echo  +================================================+
) else if "!location!"=="DRAYNOR" (
    echo.
    echo  +================================================+
    echo  ^|            DRAYNOR VILLAGE                    ^|
    echo  ^|                                                ^|
    echo  ^|  [O]  Village         [O]  Manor              ^|
    echo  ^|  [NPC] Villagers      [NPC] Strange Sounds    ^|
    echo  ^|  [NPC] Quiet Place    [NPC] Mysterious        ^|
    echo  ^|                                                ^|
    echo  ^|  [OBJ] Fields         [OBJ] Swamp             ^|
    echo  ^|  [OBJ] Farming        [OBJ] Dangerous Waters  ^|
    echo  ^|  [OBJ] Crops          [OBJ] Hidden Dangers    ^|
    echo  +================================================+
) else if "!location!"=="PORTSARIM" (
    echo.
    echo  +================================================+
    echo  ^|              PORT SARIM                       ^|
    echo  ^|                                                ^|
    echo  ^|  [O]  Docks           [O]  Ships              ^|
    echo  ^|  [NPC] Sailors        [NPC] Merchants         ^|
    echo  ^|  [NPC] Sea Air        [NPC] Trading           ^|
    echo  ^|                                                ^|
    echo  ^|  [OBJ] Harbor         [OBJ] Fishing           ^|
    echo  ^|  [OBJ] Boats          [OBJ] Sea Creatures     ^|
    echo  ^|  [OBJ] Maritime       [OBJ] Ocean Life        ^|
    echo  +================================================+
) else if "!location!"=="MAGETOWER" (
    echo.
    echo  +================================================+
    echo  ^|              MAGE TOWER                       ^|
    echo  ^|                                                ^|
    echo  ^|  [O]  Tower           [O]  You               ^|
    echo  ^|  [NPC] Ancient Magic  [NPC] Level !level!     ^|
    echo  ^|  [NPC] Knowledge      [NPC] Gold: !coins!     ^|
    echo  ^|                                                ^|
    echo  ^|  [OBJ] Library        [OBJ] Training Room     ^|
    echo  ^|  [OBJ] Spell Books    [OBJ] Magic Practice    ^|
    echo  ^|  [OBJ] Ancient Tomes  [OBJ] Spell Casting     ^|
    echo  ^|                                                ^|
    echo  ^|  [OBJ] Rune Altar     [OBJ] Tower Top         ^|
    echo  ^|  [OBJ] Rune Crafting  [OBJ] Star Gazing       ^|
    echo  ^|  [OBJ] Magic Energy   [OBJ] Spectacular View  ^|
    echo  +================================================+
) else if "!location!"=="WILDERNESS" (
    echo.
    echo  +================================================+
    echo  ^|              THE WILDERNESS                   ^|
    echo  ^|                                                ^|
    echo  ^|  [O]  You             [O]  Danger             ^|
    echo  ^|  [NPC] PvP Combat     [NPC] Player Killers    ^|
    echo  ^|  [NPC] High Risk      [NPC] High Reward       ^|
    echo  ^|                                                ^|
    echo  ^|  [OBJ] Wilderness     [OBJ] Resource Nodes    ^|
    echo  ^|  [OBJ] Wall           [OBJ] Valuable Items    ^|
    echo  ^|  [OBJ] Border         [OBJ] Rich Deposits     ^|
    echo  ^|                                                ^|
    echo  ^|  [OBJ] PvP Hotspots   [OBJ] Monsters          ^|
    echo  ^|  [OBJ] Player Combat  [OBJ] Dangerous Beasts  ^|
    echo  ^|  [OBJ] High Stakes    [OBJ] Lawless Land      ^|
    echo  +================================================+
) else if "!location!"=="WOLFMOUNTAIN" (
    echo.
    echo  +================================================+
    echo  ^|             WOLF MOUNTAIN                     ^|
    echo  ^|                                                ^|
    echo  ^|  [O]  You             [O]  Wolves             ^|
    echo  ^|  [NPC] Pack Leader    [NPC] Alpha Wolf        ^|
    echo  ^|  [NPC] Dangerous      [NPC] Ferocious         ^|
    echo  ^|                                                ^|
    echo  ^|  [OBJ] Mountain       [OBJ] Wolf Den          ^|
    echo  ^|  [OBJ] Caves          [OBJ] Pack Territory    ^|
    echo  ^|  [OBJ] Peak           [OBJ] Ancient Ruins     ^|
    echo  ^|                                                ^|
    echo  ^|  [OBJ] Mining Spots   [OBJ] Rich Ores         ^|
    echo  ^|  [OBJ] High Altitude  [OBJ] Dangerous Paths   ^|
    echo  ^|  [OBJ] Wolf Territory [OBJ] Wild Beasts       ^|
    echo  +================================================+
)
goto :eof

:draw_shop_scene
echo.
echo  +================================================+
echo  ^|                GENERAL STORE                  ^|
echo  ^|                                                ^|
echo  ^|  [O]  Shopkeeper       [O]  You               ^|
echo  ^|  [NPC] "Hello adventurer!"                     ^|
echo  ^|  [NPC] "What can I get?"   Gold: !coins!       ^|
echo  ^|                                                ^|
echo  ^|  +==========================================+  ^|
echo  ^|  ^|            SHOP ITEMS                 ^|  ^|
echo  ^|  ^|  [Sword] [Shield] [Food] [Tools]      ^|  ^|
echo  ^|  +==========================================+  ^|
echo  +================================================+
goto :eof

:draw_training_scene
echo.
echo  +================================================+
echo  ^|              SKILL TRAINING                  ^|
echo  ^|                                                ^|
echo  ^|  [O]  Training Master   [O]  You              ^|
echo  ^|  [NPC] "Choose your skill!"                     ^|
echo  ^|  [NPC] "Practice makes perfect" Level: !level! ^|
echo  ^|                                                ^|
echo  ^|  +==========================================+  ^|
echo  ^|  ^|           TRAINING OPTIONS            ^|  ^|
echo  ^|  ^|  [Combat] [Gathering] [Artisan]       ^|  ^|
echo  ^|  ^|  [Attack] [Woodcut]  [Cooking]        ^|  ^|
echo  ^|  +==========================================+  ^|
echo  +================================================+
goto :eof

:draw_exit_scene
echo.
echo  +================================================+
echo  ^|                 GAME EXIT                     ^|
echo  ^|                                                ^|
echo  ^|  [O]  You              [O]  Save Game         ^|
echo  ^|  [NPC] "Goodbye!"      [NPC] Progress Saved   ^|
echo  ^|  [NPC] Thanks for playing [NPC] Come back soon! ^|
echo  ^|                                                ^|
echo  ^|  +==========================================+  ^|
echo  ^|  ^|            FINAL STATS                ^|  ^|
echo  ^|  ^|  Combat Level: !combat_level!          ^|  ^|
echo  ^|  ^|  Total Level: !level!                  ^|  ^|
echo  ^|  ^|  Experience: !experience!              ^|  ^|
echo  ^|  +==========================================+  ^|
echo  +================================================+
goto :eof

:calculate_xp_variables
REM Calculate XP for all skills based on current levels
set /a "attack_xp=!attack! * 100 - 100"
set /a "strength_xp=!strength! * 100 - 100"
set /a "defence_xp=!defence! * 100 - 100"
set /a "hitpoints_xp=!hitpoints! * 100 - 100"
set /a "ranged_xp=!ranged! * 100 - 100"
set /a "magic_xp=!magic! * 100 - 100"
set /a "woodcutting_xp=!woodcutting! * 100 - 100"
set /a "fishing_xp=!fishing! * 100 - 100"
set /a "mining_xp=!mining! * 100 - 100"
set /a "cooking_xp=!cooking! * 100 - 100"
set /a "smithing_xp=!smithing! * 100 - 100"
set /a "crafting_xp=!crafting! * 100 - 100"
set /a "fletching_xp=!fletching! * 100 - 100"
set /a "herblore_xp=!herblore! * 100 - 100"
set /a "prayer_xp=!prayer! * 100 - 100"
set /a "slayer_xp=!slayer! * 100 - 100"
set /a "farming_xp=!farming! * 100 - 100"
goto :eof

:calculate_combat_level
REM Calculate combat level from combat skills
set /a "combat_level=(!attack!+!strength!+!defence!+!hitpoints!+!ranged!+!magic!)/6"
goto :eof

:ge_buy_item
REM Parameters: %1 = item choice
set "item_choice=%1"

if "%item_choice%"=="1" (
    if !coins! geq 15 (
        set /a "coins-=15"
        if defined inventory (
            set "inventory=!inventory!,Bread"
        ) else (
            set "inventory=Bread"
        )
        echo You bought bread for 15 coins!
    ) else (
        echo Not enough coins!
    )
)

if "%item_choice%"=="11" (
    if !coins! geq 30 (
        set /a "coins-=30"
        if defined inventory (
            set "inventory=!inventory!,Bones"
        ) else (
            set "inventory=Bones"
        )
        echo You bought bones for 30 coins!
    ) else (
        echo Not enough coins!
    )
)

if "%item_choice%"=="12" (
    if !coins! geq 70 (
        set /a "coins-=70"
        if defined inventory (
            set "inventory=!inventory!,Big Bones"
        ) else (
            set "inventory=Big Bones"
        )
        echo You bought big bones for 70 coins!
    ) else (
        echo Not enough coins!
    )
)

if "%item_choice%"=="13" (
    if !coins! geq 180 (
        set /a "coins-=180"
        if defined inventory (
            set "inventory=!inventory!,Wolf Bones"
        ) else (
            set "inventory=Wolf Bones"
        )
        echo You bought wolf bones for 180 coins!
    ) else (
        echo Not enough coins!
    )
)

if "%item_choice%"=="14" (
    if !coins! geq 360 (
        set /a "coins-=360"
        if defined inventory (
            set "inventory=!inventory!,Baby Dragon Bones"
        ) else (
            set "inventory=Baby Dragon Bones"
        )
        echo You bought baby dragon bones for 360 coins!
    ) else (
        echo Not enough coins!
    )
)

if "%item_choice%"=="15" (
    if !coins! geq 10 (
        set /a "coins-=10"
        if defined inventory (
            set "inventory=!inventory!,Ashes"
        ) else (
            set "inventory=Ashes"
        )
        echo You bought ashes for 10 coins!
    ) else (
        echo Not enough coins!
    )
)

if "%item_choice%"=="2" (
    if !coins! geq 30 (
        set /a "coins-=30"
        if defined inventory (
            set "inventory=!inventory!,Bronze Sword"
        ) else (
            set "inventory=Bronze Sword"
        )
        echo You bought a bronze sword for 30 coins!
    ) else (
        echo Not enough coins!
    )
)

if "%item_choice%"=="3" (
    if !coins! geq 20 (
        set /a "coins-=20"
        if defined inventory (
            set "inventory=!inventory!,Wooden Shield"
        ) else (
            set "inventory=Wooden Shield"
        )
        echo You bought a wooden shield for 20 coins!
    ) else (
        echo Not enough coins!
    )
)

if "%item_choice%"=="4" (
    if !coins! geq 60 (
        set /a "coins-=60"
        if defined inventory (
            set "inventory=!inventory!,Fishing Rod"
        ) else (
            set "inventory=Fishing Rod"
        )
        echo You bought a fishing rod for 60 coins!
    ) else (
        echo Not enough coins!
    )
)

if "%item_choice%"=="5" (
    if !coins! geq 35 (
        set /a "coins-=35"
        if defined inventory (
            set "inventory=!inventory!,Axe"
        ) else (
            set "inventory=Axe"
        )
        echo You bought an axe for 35 coins!
    ) else (
        echo Not enough coins!
    )
)

if "%item_choice%"=="6" (
    if !coins! geq 45 (
        set /a "coins-=45"
        if defined inventory (
            set "inventory=!inventory!,Pickaxe"
        ) else (
            set "inventory=Pickaxe"
        )
        echo You bought a pickaxe for 45 coins!
    ) else (
        echo Not enough coins!
    )
)

if "%item_choice%"=="7" (
    if !coins! geq 40 (
        set /a "coins-=40"
        if defined inventory (
            set "inventory=!inventory!,Health Potion"
        ) else (
            set "inventory=Health Potion"
        )
        echo You bought a health potion for 40 coins!
    ) else (
        echo Not enough coins!
    )
)

if "%item_choice%"=="8" (
    if !coins! geq 22 (
        set /a "coins-=22"
        if defined inventory (
            set "inventory=!inventory!,Copper Ore"
        ) else (
            set "inventory=Copper Ore"
        )
        echo You bought copper ore for 22 coins!
    ) else (
        echo Not enough coins!
    )
)

if "%item_choice%"=="9" (
    if !coins! geq 18 (
        set /a "coins-=18"
        if defined inventory (
            set "inventory=!inventory!,Tin Ore"
        ) else (
            set "inventory=Tin Ore"
        )
        echo You bought tin ore for 18 coins!
    ) else (
        echo Not enough coins!
    )
)

if "%item_choice%"=="10" (
    if !coins! geq 22 (
        set /a "coins-=22"
        if defined inventory (
            set "inventory=!inventory!,Logs"
        ) else (
            set "inventory=Logs"
        )
        echo You bought logs for 22 coins!
    ) else (
        echo Not enough coins!
    )
)

pause >nul
goto :eof

:ge_sell_item
REM Parameters: %1 = item choice
set "item_choice=%1"
call :get_item_by_number !item_choice!
set "item_to_sell=!selected_item!"

if "!item_to_sell!"=="" (
    echo Invalid item number!
    pause >nul
    goto :eof
)

REM Calculate sell price (lower than buy price)
if "!item_to_sell!"=="Bread" set "sell_price=8"
if "!item_to_sell!"=="Bronze Sword" set "sell_price=15"
if "!item_to_sell!"=="Wooden Shield" set "sell_price=10"
if "!item_to_sell!"=="Fishing Rod" set "sell_price=30"
if "!item_to_sell!"=="Axe" set "sell_price=18"
if "!item_to_sell!"=="Pickaxe" set "sell_price=22"
if "!item_to_sell!"=="Health Potion" set "sell_price=20"
if "!item_to_sell!"=="Copper Ore" set "sell_price=12"
if "!item_to_sell!"=="Tin Ore" set "sell_price=10"
if "!item_to_sell!"=="Bronze Bar" set "sell_price=18"
if "!item_to_sell!"=="Logs" set "sell_price=12"
if "!item_to_sell!"=="Sardine" set "sell_price=6"
if "!item_to_sell!"=="Cooked Sardine" set "sell_price=15"
if "!item_to_sell!"=="Bones" set "sell_price=25"
if "!item_to_sell!"=="Big Bones" set "sell_price=60"
if "!item_to_sell!"=="Wolf Bones" set "sell_price=150"
if "!item_to_sell!"=="Baby Dragon Bones" set "sell_price=300"
if "!item_to_sell!"=="Ashes" set "sell_price=8"
if not defined sell_price set "sell_price=5"

set /a "coins+=!sell_price!"
call :remove_item "!item_to_sell!"
echo You sold !item_to_sell! for !sell_price! coins!
pause >nul
goto :eof

:craft_item
REM Parameters: %1 = craft choice
set "craft_choice=%1"

if "%craft_choice%"=="1" (
    REM Bronze Bar - Copper Ore + Tin Ore
    call :count_item "Copper Ore"
    if !item_count! lss 1 (
        echo You need copper ore to craft bronze bars!
        pause >nul
        goto :eof
    )
    call :count_item "Tin Ore"
    if !item_count! lss 1 (
        echo You need tin ore to craft bronze bars!
        pause >nul
        goto :eof
    )

    if !crafting! lss 1 (
        echo You need level 1 Crafting to make bronze bars!
        pause >nul
        goto :eof
    )

    echo You successfully craft a bronze bar!
    call :remove_item "Copper Ore"
    call :remove_item "Tin Ore"

    if defined inventory (
        set "inventory=!inventory!,Bronze Bar"
    ) else (
        set "inventory=Bronze Bar"
    )

    set /a "crafting_xp+=25"
    set /a "experience+=25"
    call :check_level_up crafting !crafting_xp!
)

if "%craft_choice%"=="2" (
    REM Leather Boots
    echo "!inventory!" | findstr /i "Leather" >nul
    if errorlevel 1 (
        echo You need leather to craft leather boots!
        pause >nul
        goto :eof
    )

    if !crafting! lss 7 (
        echo You need level 7 Crafting to make leather boots!
        pause >nul
        goto :eof
    )

    echo You successfully craft leather boots!
    call :remove_item "Leather"

    if defined inventory (
        set "inventory=!inventory!,Leather Boots"
    ) else (
        set "inventory=Leather Boots"
    )

    set /a "crafting_xp+=35"
    set /a "experience+=35"
    call :check_level_up crafting !crafting_xp!
)

if "%craft_choice%"=="3" (
    REM Leather Gloves
    call :count_item "Leather"
    if !item_count! lss 1 (
        echo You need leather to craft leather gloves!
        pause >nul
        goto :eof
    )

    if !crafting! lss 1 (
        echo You need level 1 Crafting to make leather gloves!
        pause >nul
        goto :eof
    )

    echo You successfully craft leather gloves!
    call :remove_item "Leather"

    if defined inventory (
        set "inventory=!inventory!,Leather Gloves"
    ) else (
        set "inventory=Leather Gloves"
    )

    set /a "crafting_xp+=20"
    set /a "experience+=20"
    call :check_level_up crafting !crafting_xp!
)

if "%craft_choice%"=="4" (
    REM Leather Armor - requires 2 leather
    call :count_item "Leather"
    set "leather_count=!item_count!"

    if !leather_count! lss 2 (
        echo You need 2 pieces of leather to craft leather armor!
        pause >nul
        goto :eof
    )

    if !crafting! lss 14 (
        echo You need level 14 Crafting to make leather armor!
        pause >nul
        goto :eof
    )

    echo You successfully craft leather armor!
    call :remove_item "Leather"
    call :remove_item "Leather"

    if defined inventory (
        set "inventory=!inventory!,Leather Armor"
    ) else (
        set "inventory=Leather Armor"
    )

    set /a "crafting_xp+=50"
    set /a "experience+=50"
    call :check_level_up crafting !crafting_xp!
)

if "%craft_choice%"=="2" (
    REM Iron Bar - Iron Ore
    echo "!inventory!" | findstr /i "Iron Ore" >nul
    if errorlevel 1 (
        echo You need iron ore to craft iron bars!
        pause >nul
        goto :eof
    )

    if !crafting! lss 15 (
        echo You need level 15 Crafting to make iron bars!
        pause >nul
        goto :eof
    )

    echo You successfully craft an iron bar!
    call :remove_item "Iron Ore"

    if defined inventory (
        set "inventory=!inventory!,Iron Bar"
    ) else (
        set "inventory=Iron Bar"
    )

    set /a "crafting_xp+=35"
    set /a "experience+=35"
    call :check_level_up crafting !crafting_xp!
)

if "%craft_choice%"=="3" (
    REM Steel Bar - Iron Ore + Coal
    call :count_item "Iron Ore"
    if !item_count! lss 1 (
        echo You need iron ore to craft steel bars!
        pause >nul
        goto :eof
    )
    call :count_item "Coal"
    if !item_count! lss 1 (
        echo You need coal to craft steel bars!
        pause >nul
        goto :eof
    )

    if !crafting! lss 30 (
        echo You need level 30 Crafting to make steel bars!
        pause >nul
        goto :eof
    )

    echo You successfully craft a steel bar!
    call :remove_item "Iron Ore"
    call :remove_item "Coal"

    if defined inventory (
        set "inventory=!inventory!,Steel Bar"
    ) else (
        set "inventory=Steel Bar"
    )

    set /a "crafting_xp+=75"
    set /a "experience+=75"
    call :check_level_up crafting !crafting_xp!
)

if "%craft_choice%"=="7" (
    REM Hard Leather Armor - requires 3 leather
    call :count_item "Leather"
    set "leather_count=!item_count!"

    if !leather_count! lss 3 (
        echo You need 3 pieces of leather to craft hard leather armor!
        pause >nul
        goto :eof
    )

    if !crafting! lss 28 (
        echo You need level 28 Crafting to make hard leather armor!
        pause >nul
        goto :eof
    )

    echo You successfully craft hard leather armor!
    call :remove_item "Leather"
    call :remove_item "Leather"
    call :remove_item "Leather"

    if defined inventory (
        set "inventory=!inventory!,Hard Leather Armor"
    ) else (
        set "inventory=Hard Leather Armor"
    )

    set /a "crafting_xp+=100"
    set /a "experience+=100"
    call :check_level_up crafting !crafting_xp!
)

if "%craft_choice%"=="8" (
    REM Studded Leather - Leather + Steel Studs
    echo "!inventory!" | findstr /i "Leather" >nul
    if errorlevel 1 (
        echo You need leather to craft studded leather!
        pause >nul
        goto :eof
    )
    echo "!inventory!" | findstr /i "Steel Studs" >nul
    if errorlevel 1 (
        echo You need steel studs to craft studded leather!
        pause >nul
        goto :eof
    )

    if !crafting! lss 41 (
        echo You need level 41 Crafting to make studded leather!
        pause >nul
        goto :eof
    )

    echo You successfully craft studded leather armor!
    call :remove_item "Leather"
    call :remove_item "Steel Studs"

    if defined inventory (
        set "inventory=!inventory!,Studded Leather"
    ) else (
        set "inventory=Studded Leather"
    )

    set /a "crafting_xp+=150"
    set /a "experience+=150"
    call :check_level_up crafting !crafting_xp!
)

if "%craft_choice%"=="9" (
    REM Green Dragonhide
    echo "!inventory!" | findstr /i "Green D'hide" >nul
    if errorlevel 1 (
        echo You need green dragonhide to craft this!
        pause >nul
        goto :eof
    )

    if !crafting! lss 63 (
        echo You need level 63 Crafting to work with dragonhide!
        pause >nul
        goto :eof
    )

    echo You successfully craft green dragonhide armor!
    call :remove_item "Green D'hide"

    if defined inventory (
        set "inventory=!inventory!,Green Dragonhide"
    ) else (
        set "inventory=Green Dragonhide"
    )

    set /a "crafting_xp+=200"
    set /a "experience+=200"
    call :check_level_up crafting !crafting_xp!
)

pause >nul
goto :eof

:bank_deposit_item
REM Parameters: %1 = item choice
set "item_choice=%1"
call :get_item_by_number !item_choice!
set "item_to_deposit=!selected_item!"

if "!item_to_deposit!"=="" (
    echo Invalid item number!
    pause >nul
    goto :eof
)

echo You deposited !item_to_deposit! in the bank!
call :remove_item "!item_to_deposit!"
pause >nul
goto :eof

:draw_inventory_header
echo.
echo  +================================================+
echo  ^|                 INVENTORY                     ^|
echo  ^|                                                ^|
echo  ^|  Gold: !coins! coins        Weight: Light     ^|
echo  ^|                                                ^|
echo  +================================================+
echo.
goto :eof

:draw_skills_header
echo.
echo  +================================================+
echo  ^|              SKILLS OVERVIEW                 ^|
echo  ^|                                                ^|
echo  ^|   Level up your character to become stronger! ^|
echo  ^|                                                ^|
echo  +================================================+
goto :eof

:draw_combat_arena
echo.
echo  +================================================+
echo  ^|             COMBAT TRAINING ARENA            ^|
echo  ^|                                                ^|
echo  ^|  [O]  You            [O]  Training Dummy     ^|
echo  ^|  [NPC] HP: !currenthp!/!maxhp! [NPC] HP: INF  ^|
echo  ^|  [NPC] Attack: !attack!  [NPC] Defence: 5     ^|
echo  ^|                                                ^|
echo  ^|  +==========================================+  ^|
echo  ^|  ^|          FIGHTING STANCE              ^|  ^|
echo  ^|  ^|     Ready to train combat skills!      ^|  ^|
echo  ^|  +==========================================+  ^|
echo  +================================================+
goto :eof

:draw_quest_header
echo.
echo  +================================================+
echo  ^|               QUEST JOURNAL                  ^|
echo  ^|                                                ^|
echo  ^|    Track your adventures and story progress!  ^|
echo  ^|                                                ^|
echo  +================================================+
goto :eof

:draw_travel_header
echo.
echo  +================================================+
echo  ^|                 WORLD MAP                     ^|
echo  ^|                                                ^|
echo  ^|  Current Location: !location!                  ^|
echo  ^|  Choose your destination wisely!              ^|
echo  ^|                                                ^|
echo  +================================================+
goto :eof

:draw_ge_header
echo.
echo  +================================================+
echo  ^|             GRAND EXCHANGE                   ^|
echo  ^|                                                ^|
echo  ^|  [O]  Exchange Clerk   [O]  You               ^|
echo  ^|  [NPC] "Best prices!"   [NPC] Gold: !coins!    ^|
echo  ^|  [NPC] "Trade wisely!"  [NPC] Browse items     ^|
echo  ^|                                                ^|
echo  ^|  +==========================================+  ^|
echo  ^|  ^|         TRADE ITEMS                  ^|  ^|
echo  ^|  ^|  [Buy] [Sell] [Prices] [Offers]      ^|  ^|
echo  ^|  +==========================================+  ^|
echo  +================================================+
goto :eof

:draw_crafting_header
echo.
echo  +================================================+
echo  ^|           CRAFTING WORKSHOP                  ^|
echo  ^|                                                ^|
echo  ^|  [O]  Master Crafter   [O]  You               ^|
echo  ^|  [NPC] "Create items!"  [NPC] Level: !crafting! ^|
echo  ^|  [NPC] "Use materials"  [NPC] Materials needed ^|
echo  ^|                                                ^|
echo  ^|  +==========================================+  ^|
echo  ^|  ^|         CRAFTING TOOLS                ^|  ^|
echo  ^|  ^|  [Hammer] [Needle] [Chisel] [Mould]   ^|  ^|
echo  ^|  +==========================================+  ^|
echo  +================================================+
goto :eof

:draw_bank_header
echo.
echo  +================================================+
echo  ^|           BANK OF RUNESCAPE                  ^|
echo  ^|                                                ^|
echo  ^|  [O]  Banker           [O]  You               ^|
echo  ^|  [NPC] "Safe storage!"  [NPC] Gold: !coins!    ^|
echo  ^|  [NPC] "Your valuables" [NPC] Deposit/Withdraw ^|
echo  ^|                                                ^|
echo  ^|  +==========================================+  ^|
echo  ^|  ^|           BANK VAULT                   ^|  ^|
echo  ^|  ^|  [Deposit] [Withdraw] [View] [PIN]     ^|  ^|
echo  ^|  +==========================================+  ^|
echo  +================================================+
goto :eof

:draw_treasure_hunting_header
echo.
echo  +================================================+
echo  ^|           TREASURE HUNTING                    ^|
echo  ^|                                                ^|
echo  ^|  [X]  Metal Detector      [O]  Adventurer     ^|
echo  ^|  [X]  Treasure Map        [O]  Searching...   ^|
echo  ^|  [X]  Ancient Ruins       [O]  Hidden Caves   ^|
echo  ^|                                                ^|
echo  ^|  +==========================================+  ^|
echo  ^|  ^|           TREASURE VAULT               ^|  ^|
echo  ^|  ^|  [Detect] [Explore] [Search] [Dig]    ^|  ^|
echo  ^|  +==========================================+  ^|
echo  +================================================+
goto :eof

:draw_welcome_scene
echo.
echo  +================================================+
echo  ^|           WELCOME TO TOON-SCAPE!             ^|
echo  ^|                                                ^|
echo  ^|  [O]  Adventurer        [O]  Lumbridge        ^|
echo  ^|  /|\  Ready for adventure! /|\  Peaceful town  ^|
echo  ^|  / \  Starting gold: 50   / \  Journey begins! ^|
echo  ^|                                                ^|
echo  +================================================+
goto :eof

:player_house
REM Player Housing System
cls
call :draw_house_header
echo.
echo ========================================
echo           YOUR PLAYER HOUSE
echo ========================================
echo.

REM Initialize house variables if not set
if not defined house_level set "house_level=1"
if not defined house_rooms set "house_rooms=Basic Room"
if not defined house_furniture set "house_furniture=Wooden Chair"

echo House Level: !house_level!
echo Current Rooms: !house_rooms!
echo Furniture: !house_furniture!
echo.
echo House Options:
echo.
echo 1. Enter House
echo 2. Build/Upgrade Room
echo 3. Buy Furniture
echo 4. House Storage
echo 5. Invite Friends (Coming Soon)
echo 6. House Settings
echo 0. Back to main menu
echo.
set /p house_choice="Choose option: "

if "%house_choice%"=="1" goto enter_house
if "%house_choice%"=="2" goto build_room
if "%house_choice%"=="3" goto buy_furniture
if "%house_choice%"=="4" goto house_storage
if "%house_choice%"=="6" goto house_settings
if "%house_choice%"=="0" goto main_menu

echo Invalid choice!
pause >nul
goto player_house

:enter_house
cls
echo.
echo ========================================
echo         INSIDE YOUR HOUSE
echo ========================================
echo.
echo You enter your cozy !house_rooms!.
echo The !house_furniture! provides comfort.
echo.
echo House Activities:
echo.
echo 1. Rest (Restore Health)
echo 2. Study (Gain Experience)
echo 3. Organize Storage
echo 4. Invite Guests
echo 5. Exit House
echo.
set /p inside_choice="What do you do? "

if "%inside_choice%"=="1" (
    echo.
    echo You rest comfortably in your house...
    timeout /t 2 >nul
    echo You feel completely refreshed!
    set "currenthp=!maxhp!"
    echo Health fully restored!
    pause >nul
    goto enter_house
)

if "%inside_choice%"=="2" (
    call :house_study_system
    goto enter_house
)

if "%inside_choice%"=="5" goto player_house

echo Invalid choice!
pause >nul
goto enter_house

:build_room
cls
echo.
echo ========================================
echo         BUILD/UPGRADE ROOMS
echo ========================================
echo.
echo Current House Level: !house_level!
echo Current Rooms: !house_rooms!
echo.
echo Available Upgrades:
echo.

if !house_level! equ 1 (
    echo 1. Add Kitchen - 500 coins (Level 2)
    echo    Requires: 10 Construction XP
)
if !house_level! equ 2 (
    echo 1. Add Study Room - 1000 coins (Level 3)
    echo    Requires: 25 Construction XP
)
if !house_level! equ 3 (
    echo 1. Add Workshop - 2000 coins (Level 4)
    echo    Requires: 50 Construction XP
)
if !house_level! equ 4 (
    echo 1. Add Garden - 3000 coins (Level 5)
    echo    Requires: 100 Construction XP
)

echo 2. Repair House (Free)
echo 0. Back to house menu
echo.
set /p build_choice="Choose option: "

if "%build_choice%"=="1" (
    if !house_level! equ 1 (
        if !coins! geq 500 (
            echo.
            echo You hire builders to add a kitchen!
            timeout /t 2 >nul
            set /a "coins-=500"
            set "house_level=2"
            set "house_rooms=!house_rooms!, Kitchen"
            set /a "construction_xp+=50"
            set /a "experience+=50"
            echo Kitchen added! House is now level 2!
            echo You gained 50 Construction experience!
            call :check_level_up construction !construction_xp!
        ) else (
            echo You need 500 coins to build a kitchen!
        )
    ) else if !house_level! equ 2 (
        if !coins! geq 1000 (
            echo.
            echo You hire builders to add a study room!
            timeout /t 2 >nul
            set /a "coins-=1000"
            set "house_level=3"
            set "house_rooms=!house_rooms!, Study"
            set /a "construction_xp+=75"
            set /a "experience+=75"
            echo Study added! House is now level 3!
            echo You gained 75 Construction experience!
            call :check_level_up construction !construction_xp!
        ) else (
            echo You need 1000 coins to build a study room!
        )
    )
    pause >nul
)

if "%build_choice%"=="0" goto player_house

echo Invalid choice!
pause >nul
goto build_room

:buy_furniture
cls
echo.
echo ========================================
echo         FURNITURE SHOP
echo ========================================
echo.
echo Current Furniture: !house_furniture!
echo.
echo Available Furniture:
echo.
echo 1. Comfortable Chair - 100 coins
echo 2. Bookshelf - 200 coins
echo 3. Dining Table - 150 coins
echo 4. Magic Altar - 500 coins
echo 5. Training Dummy - 300 coins
echo 6. Cooking Range - 250 coins
echo 7. Crafting Table - 400 coins
echo 0. Back to house menu
echo.
set /p furniture_choice="Choose furniture: "

if "%furniture_choice%"=="1" (
    if !coins! geq 100 (
        set /a "coins-=100"
        set "house_furniture=!house_furniture!, Comfortable Chair"
        echo You bought a comfortable chair!
    ) else (
        echo Not enough coins!
    )
    pause >nul
)

if "%furniture_choice%"=="4" (
    if !coins! geq 500 (
        set /a "coins-=500"
        set "house_furniture=!house_furniture!, Magic Altar"
        echo You bought a magic altar!
        echo You can now train magic at home!
    ) else (
        echo Not enough coins!
    )
    pause >nul
)

if "%furniture_choice%"=="0" goto player_house

echo Invalid choice!
pause >nul
goto buy_furniture

:draw_house_header
echo.
echo  +================================================+
echo  ^|               PLAYER HOUSE                    ^|
echo  ^|                                                ^|
echo  ^|  [O]  House          [O]  You                 ^|
echo  ^|  [NPC] Level !house_level!  [NPC] Owner        ^|
echo  ^|  [NPC] Welcome home! [NPC] Gold: !coins!      ^|
echo  ^|                                                ^|
echo  ^|  +==========================================+  ^|
echo  ^|  ^|           YOUR PROPERTY                ^|  ^|
echo  ^|  ^|  [Build] [Furnish] [Store] [Rest]     ^|  ^|
echo  ^|  +==========================================+  ^|
echo  +================================================+
goto :eof

:house_study_system
cls
echo.
echo ========================================
echo         HOUSE STUDY SYSTEM
echo ========================================
echo.
echo Knowledge Tokens: !knowledge_tokens!
echo (Tokens provide 25%% XP boost when used during skill training)
echo.
echo Study Options:
echo.

REM Check for study books
call :count_item "Magic Study Book"
if !item_count! gtr 0 echo 1. Study Magic (!item_count! book(s) available)

call :count_item "Combat Manual"
if !item_count! gtr 0 echo 2. Study Combat (!item_count! manual(s) available)

call :count_item "Crafting Guide"
if !item_count! gtr 0 echo 3. Study Crafting (!item_count! guide(s) available)

call :count_item "Cooking Recipe Book"
if !item_count! gtr 0 echo 4. Study Cooking (!item_count! book(s) available)

echo 5. Use Knowledge Tokens (Boost next skill training)
echo 6. Back to house activities
echo.
set /p study_choice="Choose study option: "

if "!study_choice!"=="1" (
    call :count_item "Magic Study Book"
    if !item_count! gtr 0 (
        echo.
        echo You study the magic tome carefully...
        timeout /t 2 >nul
        echo You understand the theoretical aspects of magic!
        call :remove_item "Magic Study Book"
        set /a "knowledge_tokens+=2"
        echo You gained 2 Knowledge Tokens!
        echo Current tokens: !knowledge_tokens!
    ) else (
        echo You need a Magic Study Book to study magic!
    )
    pause >nul
)

if "!study_choice!"=="2" (
    call :count_item "Combat Manual"
    if !item_count! gtr 0 (
        echo.
        echo You study combat techniques and tactics...
        timeout /t 2 >nul
        echo You learn theoretical combat knowledge!
        call :remove_item "Combat Manual"
        set /a "knowledge_tokens+=2"
        echo You gained 2 Knowledge Tokens!
        echo Current tokens: !knowledge_tokens!
    ) else (
        echo You need a Combat Manual to study combat!
    )
    pause >nul
)

if "!study_choice!"=="3" (
    call :count_item "Crafting Guide"
    if !item_count! gtr 0 (
        echo.
        echo You study crafting patterns and techniques...
        timeout /t 2 >nul
        echo You understand the theory behind crafting!
        call :remove_item "Crafting Guide"
        set /a "knowledge_tokens+=2"
        echo You gained 2 Knowledge Tokens!
        echo Current tokens: !knowledge_tokens!
    ) else (
        echo You need a Crafting Guide to study crafting!
    )
    pause >nul
)

if "!study_choice!"=="4" (
    call :count_item "Cooking Recipe Book"
    if !item_count! gtr 0 (
        echo.
        echo You study recipes and cooking methods...
        timeout /t 2 >nul
        echo You learn culinary theory!
        call :remove_item "Cooking Recipe Book"
        set /a "knowledge_tokens+=2"
        echo You gained 2 Knowledge Tokens!
        echo Current tokens: !knowledge_tokens!
    ) else (
        echo You need a Cooking Recipe Book to study cooking!
    )
    pause >nul
)

if "!study_choice!"=="5" (
    if !knowledge_tokens! geq 3 (
        echo.
        echo You prepare to apply your knowledge!
        echo Your next skill training will give 25%% bonus XP!
        set /a "knowledge_tokens-=3"
        set "xp_boost_active=1"
        echo Tokens remaining: !knowledge_tokens!
        echo XP Boost Status: ACTIVE
    ) else (
        echo You need at least 3 Knowledge Tokens to activate an XP boost!
        echo (Study books to earn more tokens)
    )
    pause >nul
)

if "!study_choice!"=="6" goto :eof

goto :eof

REM ============================================
REM     MAGE TOWER FUNCTIONS
REM ============================================

:magic_shop
cls
call :draw_mage_tower_header
echo.
echo ========================================
echo         MAGE TOWER SHOP
echo ========================================
echo.
echo Welcome to the Mage Tower Shop!
echo.
echo Shopkeeper: "Ancient magic awaits you, young apprentice!"
echo.
echo Items for sale:
echo 1. Air Rune - 5 coins (Magic)
echo 2. Fire Rune - 8 coins (Magic)
echo 3. Water Rune - 6 coins (Magic)
echo 4. Earth Rune - 6 coins (Magic)
echo 5. Mind Rune - 4 coins (Magic)
echo 6. Chaos Rune - 15 coins (Magic)
echo 7. Death Rune - 25 coins (Magic)
echo 8. Blood Rune - 50 coins (Magic)
echo 9. Staff of Air - 150 coins (Magic Weapon)
echo 10. Staff of Fire - 200 coins (Magic Weapon)
echo 11. Wizard Hat - 100 coins (Magic Armor)
echo 12. Magic Robes - 200 coins (Magic Armor)
echo 13. Magic Study Book - 50 coins (Study Material)
echo 14. Health Potion - 35 coins (Consumable)
echo 0. Exit shop
echo.
echo Your coins: !coins!
echo.
set /p shop_choice="What would you like to buy? "

if "%shop_choice%"=="0" goto main_menu

REM Handle purchases based on location and choice
call :handle_purchase !shop_choice! !location!
goto magic_shop

:chat_system
cls
call :draw_mage_tower_header
echo.
echo ========================================
echo         MAGE TOWER CHAT SYSTEM
echo ========================================
echo.
echo Welcome to the magical communication network!
echo.
echo Chat Channels:
echo 1. Local Chat (!location!)
echo 2. Trade Chat (Buying/Selling)
echo 3. Magic Chat (Spells & Runes)
echo 4. General Chat (Random)
echo 5. Back to main menu
echo.
set /p chat_choice="Choose chat channel: "

if "!chat_choice!"=="1" (
    call :local_chat
) else if "!chat_choice!"=="2" (
    call :trade_chat
) else if "!chat_choice!"=="3" (
    call :magic_chat
) else if "!chat_choice!"=="4" (
    call :general_chat
) else if "!chat_choice!"=="5" (
    goto main_menu
) else (
    echo Invalid choice!
    pause >nul
    goto chat_system
)

:local_chat
cls
call :draw_mage_tower_header
echo.
echo ========================================
echo         LOCAL CHAT - !location!
echo ========================================
echo.
echo Recent messages in your area:
echo.
echo [NPC] Shopkeeper: "Welcome to !location! How can I help you?"
echo [NPC] Guard: "Stay safe, adventurer!"
echo [Player] You: "Hello everyone!"
echo [NPC] Local: "Nice weather today!"
echo.
echo [T]ype a message
echo [R]efresh chat
echo [B]ack to chat menu
echo.
set /p chat_action="What do you do? "

if /i "!chat_action!"=="t" (
    echo.
    set /p "chat_message="Type your message: "
    echo [Player] You: "!chat_message!"
    echo Message sent to local chat!
    pause >nul
    goto local_chat
) else if /i "!chat_action!"=="r" (
    echo.
    echo Refreshing chat...
    timeout /t 1 >nul
    echo [NPC] New messages appear...
    pause >nul
    goto local_chat
) else if /i "!chat_action!"=="b" (
    goto chat_system
) else (
    echo Invalid choice!
    pause >nul
    goto local_chat
)

:trade_chat
cls
call :draw_mage_tower_header
echo.
echo ========================================
echo         TRADE CHAT
echo ========================================
echo.
echo Recent trade messages:
echo.
echo [WTB] Looking for: Steel Sword, paying 300 coins
echo [WTS] Selling: Iron Ore x10, 50 coins each
echo [WTB] Need: Magic Runes, any type
echo [WTS] Selling: Health Potions x5, 30 coins each
echo [WTB] Looking for: Woodcutting Axe
echo.
echo [P]ost a trade message
echo [R]efresh chat
echo [B]ack to chat menu
echo.
set /p trade_action="What do you do? "

if /i "!trade_action!"=="p" (
    echo.
    echo What type of trade message?
    echo [B]uy - Want to Buy (WTB)
    echo [S]ell - Want to Sell (WTS)
    echo [C]ancel - Back to trade chat
    echo.
    set /p trade_type="Choose type (B/S/C): "
    
    if /i "!trade_type!"=="b" (
        echo.
        set /p "wtb_item="What do you want to buy? "
        set /p "wtb_price="How much will you pay? "
        echo [WTB] Looking for: !wtb_item!, paying !wtb_price! coins
        echo Trade message posted!
        pause >nul
        goto trade_chat
    ) else if /i "!trade_type!"=="s" (
        echo.
        set /p "wts_item="What do you want to sell? "
        set /p "wts_price="How much do you want? "
        echo [WTS] Selling: !wts_item!, !wts_price! coins
        echo Trade message posted!
        pause >nul
        goto trade_chat
    ) else if /i "!trade_type!"=="c" (
        goto trade_chat
    ) else (
        echo Invalid choice!
        pause >nul
        goto trade_chat
    )
) else if /i "!trade_action!"=="r" (
    echo.
    echo Refreshing trade chat...
    timeout /t 1 >nul
    echo [NPC] New trade offers appear...
    pause >nul
    goto trade_chat
) else if /i "!trade_action!"=="c" (
    goto chat_system
) else if /i "!trade_action!"=="4" (
    echo.
    echo Secret option activated! Returning to chat menu...
    timeout /t 1 >nul
    goto chat_system
) else (
    echo Invalid choice!
    pause >nul
    goto trade_chat
)

:magic_chat
cls
call :draw_mage_tower_header
echo.
echo ========================================
echo         MAGIC CHAT
echo ========================================
echo.
echo Recent magic discussions:
echo.
echo [Mage] "Anyone know the best way to train Magic?"
echo [Mage] "I'm looking for Death Runes, anyone selling?"
echo [Mage] "Just learned Fire Bolt spell!"
echo [Mage] "Magic training at the tower is great!"
echo [Mage] "Anyone want to practice PvP magic?"
echo.
echo [P]ost a magic message
echo [R]efresh chat
echo [B]ack to chat menu
echo.
set /p magic_action="What do you do? "

if /i "!magic_action!"=="p" (
    echo.
    set /p "magic_message="Type your magic message: "
    echo [Mage] You: "!magic_message!"
    echo Message sent to magic chat!
    pause >nul
    goto magic_chat
) else if /i "!magic_action!"=="r" (
    echo.
    echo Refreshing magic chat...
    timeout /t 1 >nul
    echo [NPC] New magic discussions appear...
    pause >nul
    goto magic_chat
) else if /i "!magic_action!"=="b" (
    goto chat_system
) else (
    echo Invalid choice!
    pause >nul
    goto magic_chat
)

:general_chat
cls
call :draw_mage_tower_header
echo.
echo ========================================
echo         GENERAL CHAT
echo ========================================
echo.
echo Recent general messages:
echo.
echo [Player] "Anyone want to go slaying together?"
echo [Player] "Just completed Cook's Assistant quest!"
echo [Player] "The Grand Exchange is so busy today!"
echo [Player] "Anyone know where to find iron ore?"
echo [Player] "Great XP rates at the training grounds!"
echo.
echo [T]ype a message
echo [R]efresh chat
echo [B]ack to chat menu
echo.
set /p general_action="What do you do? "

if /i "!general_action!"=="t" (
    echo.
    set /p "general_message="Type your message: "
    echo [Player] You: "!general_message!"
    echo Message sent to general chat!
    pause >nul
    goto general_chat
) else if /i "!general_action!"=="r" (
    echo.
    echo Refreshing general chat...
    timeout /t 1 >nul
    echo [NPC] New messages appear...
    pause >nul
    goto general_chat
) else if /i "!general_action!"=="b" (
    goto chat_system
) else (
    echo Invalid choice!
    pause >nul
    goto general_chat
)

:rune_crafting
cls
call :draw_mage_tower_header
echo.
echo ========================================
echo         RUNE CRAFTING
echo ========================================
echo.
echo Welcome to the Rune Crafting Altar!
echo.
echo You can create runes here if you have the materials.
echo.
echo Available Rune Types:
echo 1. Air Rune (Requires: Pure Essence)
echo 2. Fire Rune (Requires: Pure Essence)
echo 3. Water Rune (Requires: Pure Essence)
echo 4. Earth Rune (Requires: Pure Essence)
echo 5. Mind Rune (Requires: Pure Essence)
echo 6. Chaos Rune (Requires: Pure Essence)
echo 7. Death Rune (Requires: Pure Essence)
echo 8. Blood Rune (Requires: Pure Essence)
echo 0. Back to main menu
echo.
set /p rune_choice="Choose rune to craft: "

if "!rune_choice!"=="0" goto main_menu

REM Check if player has Pure Essence
call :count_item "Pure Essence"
if !item_count! lss 1 (
    echo You need Pure Essence to craft runes!
    echo You can buy it from the shop or find it while mining.
    pause >nul
    goto rune_crafting
)

REM Craft the chosen rune
if "!rune_choice!"=="1" (
    call :remove_item "Pure Essence"
    if defined inventory (
        set "inventory=!inventory!,Air Rune"
    ) else (
        set "inventory=Air Rune"
    )
    echo You successfully crafted an Air Rune!
    set /a "runecrafting_xp+=15"
    set /a "experience+=15"
    echo You gained 15 Runecrafting experience!
) else if "!rune_choice!"=="2" (
    call :remove_item "Pure Essence"
    if defined inventory (
        set "inventory=!inventory!,Fire Rune"
    ) else (
        set "inventory=Fire Rune"
    )
    echo You successfully crafted a Fire Rune!
    set /a "runecrafting_xp+=15"
    set /a "experience+=15"
    echo You gained 15 Runecrafting experience!
) else if "!rune_choice!"=="3" (
    call :remove_item "Pure Essence"
    if defined inventory (
        set "inventory=!inventory!,Water Rune"
    ) else (
        set "inventory=Water Rune"
    )
    echo You successfully crafted a Water Rune!
    set /a "runecrafting_xp+=15"
    set /a "experience+=15"
    echo You gained 15 Runecrafting experience!
) else if "!rune_choice!"=="4" (
    call :remove_item "Pure Essence"
    if defined inventory (
        set "inventory=!inventory!,Earth Rune"
    ) else (
        set "inventory=Earth Rune"
    )
    echo You successfully crafted an Earth Rune!
    set /a "runecrafting_xp+=15"
    set /a "experience+=15"
    echo You gained 15 Runecrafting experience!
) else if "!rune_choice!"=="5" (
    call :remove_item "Pure Essence"
    if defined inventory (
        set "inventory=!inventory!,Mind Rune"
    ) else (
        set "inventory=Mind Rune"
    )
    echo You successfully crafted a Mind Rune!
    set /a "runecrafting_xp+=15"
    set /a "experience+=15"
    echo You gained 15 Runecrafting experience!
) else if "!rune_choice!"=="6" (
    call :remove_item "Pure Essence"
    call :remove_item "Pure Essence"
    if defined inventory (
        set "inventory=!inventory!,Chaos Rune"
    ) else (
        set "inventory=Chaos Rune"
    )
    echo You successfully crafted a Chaos Rune!
    set /a "runecrafting_xp+=25"
    set /a "experience+=25"
    echo You gained 25 Runecrafting experience!
) else if "!rune_choice!"=="7" (
    call :remove_item "Pure Essence"
    call :remove_item "Pure Essence"
    if defined inventory (
        set "inventory=!inventory!,Death Rune"
    ) else (
        set "inventory=Death Rune"
    )
    echo You successfully crafted a Death Rune!
    set /a "runecrafting_xp+=35"
    set /a "experience+=35"
    echo You gained 35 Runecrafting experience!
) else if "!rune_choice!"=="8" (
    call :remove_item "Pure Essence"
    call :remove_item "Pure Essence"
    call :remove_item "Pure Essence"
    if defined inventory (
        set "inventory=!inventory!,Blood Rune"
    ) else (
        set "inventory=Blood Rune"
    )
    echo You successfully crafted a Blood Rune!
    set /a "runecrafting_xp+=50"
    set /a "experience+=50"
    echo You gained 50 Runecrafting experience!
) else (
    echo Invalid choice!
    pause >nul
    goto rune_crafting
)

pause >nul
goto rune_crafting

:music_player
cls
call :draw_music_header
echo.
echo ========================================
echo         MUSIC PLAYER
echo ========================================
echo.
REM Initialize music variables if not set
if not defined music_volume set "music_volume=50"
if not defined current_track set "current_track=Lumbridge"

echo Current Status: 
if "!music_enabled!"=="1" (
    echo Music: [ON] - Background music is playing
    echo Current Track: !current_track! Theme
    echo Volume: !music_volume!%%
    echo Status: Running with admin privileges
) else (
    echo Music: [OFF] - Background music is disabled
    echo Last Track: !current_track! Theme
    echo Volume: !music_volume!%%
    echo Status: No admin privileges - Music requires admin access
    echo.
    echo Note: To enable music, restart the game and choose 'Y' for admin privileges
)
echo.
echo Music Options:
echo 1. Toggle Music On/Off
echo 2. Change Music Track
echo 3. Adjust Volume
echo 4. Back to main menu
echo.
set /p music_choice="Choose option: "

if "%music_choice%"=="1" (
    if "!music_enabled!"=="1" (
        set "music_enabled=0"
        echo.
        echo Music turned OFF
        echo Background music has been disabled.
        call :stop_music
    ) else (
        echo.
        echo Cannot enable music without admin privileges!
        echo.
        echo To enable music:
        echo 1. Exit the game
        echo 2. Restart the game
        echo 3. Choose 'Y' when asked about admin privileges
        echo.
        echo Music will remain disabled for this session.
        pause >nul
        goto music_player
    )
    echo.
    echo Music settings saved automatically.
    REM Save game to persist music settings
    call :save_game_settings
    pause >nul
    goto music_player
)

if "%music_choice%"=="2" (
    echo.
    echo Available Music Tracks:
    echo 1. Lumbridge Theme (Peaceful town music)
    echo 2. Varrock Theme (Busy city music)
    echo 3. Combat Theme (Battle music)
    echo 4. Wilderness Theme (Dangerous area music)
    echo 5. Mage Tower Theme (Magical music)
    echo 6. Random Track
    echo 7. Back to music player
    echo.
    set /p track_choice="Choose track: "
    
    if "!track_choice!"=="1" (
        set "current_track=Lumbridge"
        echo.
        echo Now playing: Lumbridge Theme
        if "!music_enabled!"=="1" call :play_lumbridge_music
        echo Track changed to Lumbridge Theme
    ) else if "!track_choice!"=="2" (
        set "current_track=Varrock"
        echo.
        echo Now playing: Varrock Theme
        if "!music_enabled!"=="1" call :play_varrock_music
        echo Track changed to Varrock Theme
    ) else if "!track_choice!"=="3" (
        set "current_track=Combat"
        echo.
        echo Now playing: Combat Theme
        if "!music_enabled!"=="1" call :play_combat_music
        echo Track changed to Combat Theme
    ) else if "!track_choice!"=="4" (
        set "current_track=Wilderness"
        echo.
        echo Now playing: Wilderness Theme
        if "!music_enabled!"=="1" call :play_wilderness_music
        echo Track changed to Wilderness Theme
    ) else if "!track_choice!"=="5" (
        set "current_track=MageTower"
        echo.
        echo Now playing: Mage Tower Theme
        if "!music_enabled!"=="1" call :play_magetower_music
        echo Track changed to Mage Tower Theme
    ) else if "!track_choice!"=="6" (
        set /a "random_track=!random! %% 5 + 1"
        if !random_track! equ 1 (
            set "current_track=Lumbridge"
            echo.
            echo Now playing: Lumbridge Theme (Random)
            if "!music_enabled!"=="1" call :play_lumbridge_music
            echo Random track selected: Lumbridge Theme
        ) else if !random_track! equ 2 (
            set "current_track=Varrock"
            echo.
            echo Now playing: Varrock Theme (Random)
            if "!music_enabled!"=="1" call :play_varrock_music
            echo Random track selected: Varrock Theme
        ) else if !random_track! equ 3 (
            set "current_track=Combat"
            echo.
            echo Now playing: Combat Theme (Random)
            if "!music_enabled!"=="1" call :play_combat_music
            echo Random track selected: Combat Theme
        ) else if !random_track! equ 4 (
            set "current_track=Wilderness"
            echo.
            echo Now playing: Wilderness Theme (Random)
            if "!music_enabled!"=="1" call :play_wilderness_music
            echo Random track selected: Wilderness Theme
        ) else (
            set "current_track=MageTower"
            echo.
            echo Now playing: Mage Tower Theme (Random)
            if "!music_enabled!"=="1" call :play_magetower_music
            echo Random track selected: Mage Tower Theme
        )
    ) else if "!track_choice!"=="7" (
        goto music_player
    ) else (
        echo Invalid choice!
        pause >nul
        goto music_player
    )
    echo.
    echo Track selection saved automatically.
    REM Save game to persist track selection
    call :save_game_settings
    pause >nul
    goto music_player
)

if "%music_choice%"=="3" (
    echo.
    echo Volume Control:
    echo 1. Low Volume (25%%)
    echo 2. Medium Volume (50%%)
    echo 3. High Volume (75%%)
    echo 4. Maximum Volume (100%%)
    echo 5. Back to music player
    echo.
    set /p volume_choice="Choose volume level: "
    
    if "!volume_choice!"=="1" (
        set "music_volume=25"
        echo.
        echo Volume set to 25%%
        echo Note: Volume control affects future music playback
    ) else if "!volume_choice!"=="2" (
        set "music_volume=50"
        echo.
        echo Volume set to 50%%
        echo Note: Volume control affects future music playback
    ) else if "!volume_choice!"=="3" (
        set "music_volume=75"
        echo.
        echo Volume set to 75%%
        echo Note: Volume control affects future music playback
    ) else if "!volume_choice!"=="4" (
        set "music_volume=100"
        echo.
        echo Volume set to 100%%
        echo Note: Volume control affects future music playback
    ) else if "!volume_choice!"=="5" (
        goto music_player
    ) else (
        echo Invalid choice!
        pause >nul
        goto music_player
    )
    echo.
    echo Volume settings saved automatically.
    REM Save game to persist volume settings
    call :save_game_settings
    pause >nul
    goto music_player
)

if "%music_choice%"=="4" goto main_menu

echo Invalid choice!
pause >nul
goto music_player

:draw_music_header
echo.
echo  +================================================+
echo  ^|               MUSIC PLAYER                   ^|
echo  ^|                                                ^|
echo  ^|  [♪]  Music       [♪]  Volume Control        ^|
echo  ^|  [♪]  Tracks      [♪]  Playlist              ^|
echo  ^|  [♪]  Settings    [♪]  Now Playing           ^|
echo  ^|                                                ^|
echo  ^|  +==========================================+  ^|
echo  ^|  ^|           AUDIO CONTROLS                ^|  ^|
echo  ^|  ^|  [ON/OFF] [Track] [Vol] [Back]        ^|  ^|
echo  ^|  +==========================================+  ^|
echo  +================================================+
goto :eof

:play_music
REM Play background music based on current location
REM Only play if music is enabled
if "!music_enabled!"=="1" (
    if "!location!"=="LUMBRIDGE" (
        call :play_lumbridge_music
    ) else if "!location!"=="VARROCK" (
        call :play_varrock_music
    ) else if "!location!"=="WILDERNESS" (
        call :play_wilderness_music
    ) else if "!location!"=="MAGETOWER" (
        call :play_magetower_music
    ) else if "!location!"=="WOLFMOUNTAIN" (
        call :play_wolf_mountain_music
    ) else (
        call :play_combat_music
    )
) else (
    echo [♪] Music is disabled for this session.
)
goto :eof

:play_lumbridge_music
REM Play peaceful Lumbridge theme using PowerShell SoundPlayer (working method)
REM Skip if audio system is disabled
if "!audio_system!"=="disabled" (
    echo [♪] Audio system disabled - running without admin privileges
    timeout /t 2 >nul
    goto :eof
)

echo [♪] Playing: Lumbridge Theme - Peaceful town music
if exist "assets\sounds\lumbridge_theme.wav" (
    powershell -Command "try { (New-Object Media.SoundPlayer 'assets\sounds\lumbridge_theme.wav').PlaySync() } catch { $null }" 2>nul
) else (
    REM Fallback to system sounds for peaceful theme
    rundll32 user32.dll,MessageBeep 0x40
    timeout /t 1 >nul
    rundll32 user32.dll,MessageBeep 0x40
    echo [♪] A gentle melody fills the air...
)
timeout /t 2 >nul
goto :eof

:play_varrock_music
REM Play busy city theme using PowerShell SoundPlayer (working method)
REM Skip if audio system is disabled
if "!audio_system!"=="disabled" (
    echo [♪] Audio system disabled - running without admin privileges
    timeout /t 2 >nul
    goto :eof
)

echo [♪] Playing: Varrock Theme - Busy city music
if exist "assets\sounds\varrock_theme.mp3" (
    powershell -Command "try { (New-Object Media.SoundPlayer 'assets\sounds\varrock_theme.mp3').PlaySync() } catch { $null }" 2>nul
) else (
    REM Fallback to system sounds for busy city theme
    rundll32 user32.dll,MessageBeep 0x30
    timeout /t 1 >nul
    rundll32 user32.dll,MessageBeep 0x30
    echo [♪] The sounds of a bustling marketplace echo around you...
)
timeout /t 2 >nul
goto :eof

:play_combat_music
REM Play combat theme using PowerShell SoundPlayer (working method)
REM Skip if audio system is disabled
if "!audio_system!"=="disabled" (
    echo [♪] Audio system disabled - running without admin privileges
    timeout /t 2 >nul
    goto :eof
)

echo [♪] Playing: Combat Theme - Battle music
if exist "assets\sounds\combat_theme.mp3" (
    powershell -Command "try { (New-Object Media.SoundPlayer 'assets\sounds\combat_theme.mp3').PlaySync() } catch { $null }" 2>nul
) else (
    REM Fallback to system sounds for combat theme
    rundll32 user32.dll,MessageBeep 0x40
    timeout /t 1 >nul
    rundll32 user32.dll,MessageBeep 0x30
    echo [♪] The drums of war beat in your ears...
)
timeout /t 2 >nul
goto :eof

:play_wilderness_music
REM Play dangerous wilderness theme using PowerShell SoundPlayer (working method)
REM Skip if audio system is disabled
if "!audio_system!"=="disabled" (
    echo [♪] Audio system disabled - running without admin privileges
    timeout /t 2 >nul
    goto :eof
)

echo [♪] Playing: Wilderness Theme - Dangerous area music
if exist "assets\sounds\wilderness_theme.mp3" (
    powershell -Command "try { (New-Object Media.SoundPlayer 'assets\sounds\wilderness_theme.mp3').PlaySync() } catch { $null }" 2>nul
) else (
    REM Fallback to system sounds for wilderness theme
    rundll32 user32.dll,MessageBeep 0x20
    timeout /t 1 >nul
    rundll32 user32.dll,MessageBeep 0x20
    echo [♪] Dark and foreboding tones surround you...
)
timeout /t 2 >nul
goto :eof

REM ============================================
REM     QUEST HUB FUNCTIONS
REM ============================================

:draw_quest_hub_header
echo.
echo  +================================================+
echo  ^|               QUEST HUB                      ^|
echo  ^|                                                ^|
echo  ^|  [Q]  Quest      [Q]  You                    ^|
echo  ^|  [NPC] Givers    [NPC] Level !level!          ^|
echo  ^|  [NPC] Hub       [NPC] Gold: !coins!          ^|
echo  ^|                                                ^|
echo  ^|  +==========================================+  ^|
echo  ^|  ^|           QUEST ACCEPTANCE              ^|  ^|
echo  ^|  ^|  [Travel] [Accept] [Info] [Back]       ^|  ^|
echo  ^|  +==========================================+  ^|
echo  +================================================+
goto :eof

:cooks_assistant_quest_giver
echo ========================================
echo         COOK'S ASSISTANT QUEST
echo ========================================
echo.
echo You approach the baker in Lumbridge Castle...
echo.
echo Baker: "Oh, thank goodness you're here!"
echo "I've run out of ingredients for the Duke's birthday cake!"
echo "I need an egg, a pot of flour, and a bucket of milk."
echo "Can you help me find these items?"
echo.
echo Quest Requirements: None
echo Quest Reward: 300 XP Cooking, 500 coins, Chef's Hat
echo.
if "%quest_cook%"=="0" (
    echo [A]ccept quest
    echo [D]ecline quest
    echo [B]ack to quest hub
    echo.
    set /p cook_choice="What do you do? "
    
    if /i "!cook_choice!"=="a" (
        echo.
        echo "Wonderful! Please find me:"
        echo "- An egg (from the chicken coop)"
        echo "- A pot of flour (from the windmill)"
        echo "- A bucket of milk (from the dairy farm)"
        echo.
        echo The Cook's Assistant quest has begun!
        set "quest_cook=1"
        echo.
        pause >nul
        goto quest_hub
    ) else if /i "!cook_choice!"=="d" (
        echo.
        echo "Oh... well, if you change your mind..."
        echo.
        pause >nul
        goto quest_hub
    ) else if /i "!cook_choice!"=="b" (
        goto main_menu
    ) else (
        echo Invalid choice!
        pause >nul
        goto main_menu
    )
) else if "%quest_cook%"=="1" (
    echo "Have you found all the ingredients yet?"
    echo "I still need: Egg, Flour, and Milk"
    echo.
    echo [C]heck progress - [B]ack to quest hub
    set /p cook_choice="What do you do? "
    
    if /i "!cook_choice!"=="c" (
        call :check_quest_completion
        pause >nul
        goto quest_hub
    ) else if /i "!cook_choice!"=="b" (
        goto main_menu
    ) else (
        echo Invalid choice!
        pause >nul
        goto main_menu
    )
) else (
    echo "Thank you again for helping me!"
    echo "The Duke's birthday cake was a success!"
    echo.
    echo [B]ack to quest hub
    set /p cook_choice="What do you do? "
    
    if /i "!cook_choice!"=="b" (
        goto main_menu
    ) else (
        echo Invalid choice!
        pause >nul
        goto main_menu
    )
)

:sheep_shearer_quest_giver
echo ========================================
echo         SHEEP SHEARER QUEST
echo ========================================
echo.
echo You find Farmer Fred north of Lumbridge...
echo.
echo Farmer Fred: "Hello there, young adventurer!"
echo "I need help with my sheep. They're getting wooly and need shearing."
echo "Could you collect 20 balls of wool for me?"
echo.
echo Quest Requirements: None
echo Quest Reward: 60 coins, 150 Crafting XP
echo.
if not defined quest_sheep_shearer set "quest_sheep_shearer=0"
if "%quest_sheep_shearer%"=="0" (
    echo [A]ccept quest
    echo [D]ecline quest
    echo [B]ack to quest hub
    echo.
    set /p sheep_choice="What do you do? "
    
    if /i "!sheep_choice!"=="a" (
        echo.
        echo "Excellent! You'll need to shear sheep to get wool."
        echo "You can find sheep in the fields north of Lumbridge."
        echo "Use shears if you have them, or buy some from the shop."
        echo.
        echo The Sheep Shearer quest has begun!
        set "quest_sheep_shearer=1"
        echo.
        pause >nul
        goto quest_hub
    ) else if /i "!sheep_choice!"=="d" (
        echo.
        echo "No problem, maybe another time..."
        echo.
        pause >nul
        goto quest_hub
    ) else if /i "!sheep_choice!"=="b" (
        goto main_menu
    ) else (
        echo Invalid choice!
        pause >nul
        goto main_menu
    )
) else if "%quest_sheep_shearer%"=="1" (
    echo "How's the wool collecting going?"
    echo "I need 20 balls of wool."
    echo.
    echo [C]heck progress - [B]ack to quest hub
    set /p sheep_choice="What do you do? "
    
    if /i "!sheep_choice!"=="c" (
        call :check_sheep_shearer_completion
        pause >nul
        goto quest_hub
    ) else if /i "!sheep_choice!"=="b" (
        goto main_menu
    ) else (
        echo Invalid choice!
        pause >nul
        goto main_menu
    )
) else (
    echo "Thanks for all that wool! My sheep are much happier now."
    echo.
    echo [B]ack to quest hub
    set /p sheep_choice="What do you do? "
    
    if /i "!sheep_choice!"=="b" (
        goto main_menu
    ) else (
        echo Invalid choice!
        pause >nul
        goto main_menu
    )
)

:rune_mysteries_quest_giver
echo ========================================
echo         RUNE MYSTERIES QUEST
echo ========================================
echo.
echo You find Wizard Traiborn in the Wizards' Tower...
echo.
echo Wizard Traiborn: "Ah, a curious mind!"
echo "I've been studying mysterious runes found near Lumbridge."
echo "Could you investigate these runes and bring me some samples?"
echo "I need 10 air runes, 5 mind runes, and 3 chaos runes."
echo.
echo Quest Requirements: None
echo Quest Reward: 1,000 XP in all skills
echo.
if not defined quest_rune_mysteries set "quest_rune_mysteries=0"
if "%quest_rune_mysteries%"=="0" (
    echo [A]ccept quest
    echo [D]ecline quest
    echo [B]ack to quest hub
    echo.
    set /p rune_choice="What do you do? "
    
    if /i "!rune_choice!"=="a" (
        echo.
        echo "Wonderful! You can find runes by mining essence and crafting them,"
        echo "or by defeating monsters. The Wizards' Tower has a rune shop too."
        echo.
        echo The Rune Mysteries quest has begun!
        set "quest_rune_mysteries=1"
        echo.
        pause >nul
        goto quest_hub
    ) else if /i "!rune_choice!"=="d" (
        echo.
        echo "Perhaps magic isn't your calling..."
        echo.
        pause >nul
        goto quest_hub
    ) else if /i "!rune_choice!"=="b" (
        goto main_menu
    ) else (
        echo Invalid choice!
        pause >nul
        goto main_menu
    )
) else if "%quest_rune_mysteries%"=="1" (
    echo "Have you found the runes I need?"
    echo "I need: 10 Air Runes, 5 Mind Runes, 3 Chaos Runes"
    echo.
    echo [C]heck progress - [B]ack to quest hub
    set /p rune_choice="What do you do? "
    
    if /i "!rune_choice!"=="c" (
        call :check_rune_mysteries_completion
        pause >nul
        goto quest_hub
    ) else if /i "!rune_choice!"=="b" (
        goto main_menu
    ) else (
        echo Invalid choice!
        pause >nul
        goto main_menu
    )
) else (
    echo "Excellent work! These runes will help my research greatly."
    echo.
    echo [B]ack to quest hub
    set /p rune_choice="What do you do? "
    
    if /i "!rune_choice!"=="b" (
        goto main_menu
    ) else (
        echo Invalid choice!
        pause >nul
        goto main_menu
    )
)

:dragon_slayer_quest_giver
echo ========================================
echo         DRAGON SLAYER QUEST
echo ========================================
echo.
echo You find the Guildmaster in the Champions' Guild...
echo.
echo Guildmaster: "Ah, a brave warrior approaches!"
echo "I have a quest that only the strongest can undertake."
echo "There's a dragon terrorizing the island of Crandor."
echo "You'll need to be at least combat level 30 to attempt this."
echo.
echo Quest Requirements: Combat level 30+
echo Quest Reward: Dragon Slayer Cape, 18,650 XP
echo.
echo Your current combat level: !combat_level!
echo.
if not defined quest_dragon_slayer set "quest_dragon_slayer=0"
if "%quest_dragon_slayer%"=="0" (
    if !combat_level! geq 30 (
        echo [A]ccept quest
        echo [D]ecline quest
        echo [B]ack to quest hub
        echo.
        set /p dragon_choice="What do you do? "
        
        if /i "!dragon_choice!"=="a" (
            echo.
            echo "Brave indeed! You'll need to gather supplies and prepare for battle."
            echo "The dragon is on the island of Crandor, accessible by boat from Port Sarim."
            echo.
            echo The Dragon Slayer quest has begun!
            set "quest_dragon_slayer=1"
            echo.
            pause >nul
            goto quest_hub
        ) else if /i "!dragon_choice!"=="d" (
            echo.
            echo "Perhaps you're not ready for such a challenge yet..."
            echo.
            pause >nul
            goto quest_hub
        ) else if /i "!dragon_choice!"=="b" (
            goto main_menu
        ) else (
            echo Invalid choice!
            pause >nul
            goto main_menu
        )
    ) else (
        echo You need to reach combat level 30 before accepting this quest.
        echo.
        echo [B]ack to quest hub
        set /p dragon_choice="What do you do? "
        
        if /i "!dragon_choice!"=="b" (
            goto main_menu
        ) else (
            echo Invalid choice!
            pause >nul
            goto main_menu
        )
    )
) else if "%quest_dragon_slayer%"=="1" (
    echo "How goes the dragon hunt?"
    echo "Remember, you'll need strong armor and weapons for this fight."
    echo.
    echo [C]heck progress - [B]ack to quest hub
    set /p dragon_choice="What do you do? "
    
    if /i "!dragon_choice!"=="c" (
        call :check_dragon_slayer_completion
        pause >nul
        goto quest_hub
    ) else if /i "!dragon_choice!"=="b" (
        goto quest_hub
    ) else (
        echo Invalid choice!
        pause >nul
        goto quest_hub
    )
) else (
    echo "You've done it! You're a true dragon slayer!"
    echo "Wear that cape with pride, warrior."
    echo.
    echo [B]ack to quest hub
    set /p dragon_choice="What do you do? "
    
    if /i "!dragon_choice!"=="b" (
        goto quest_hub
    ) else (
        echo Invalid choice!
        pause >nul
        goto quest_hub
    )
)

REM ============================================
REM     QUEST COMPLETION FUNCTIONS
REM ============================================

:check_sheep_shearer_completion
REM Check if Sheep Shearer quest can be completed
call :count_item "Ball of Wool"
if !item_count! geq 20 (
    echo.
    echo Congratulations! You have collected 20 balls of wool!
    echo You return to Farmer Fred and deliver the wool.
    echo.
    echo "Perfect! Thank you so much!" says Farmer Fred.
    echo "Here's your reward:"
    echo.
    echo You gained 60 coins!
    echo You gained 150 Crafting XP!
    echo.

    REM Award rewards
    set /a "coins+=60"
    set /a "crafting_xp+=150"
    set /a "experience+=150"
    set "quest_sheep_shearer=2"

    REM Remove quest items
    for /l %%i in (1,1,20) do (
        call :remove_item "Ball of Wool"
    )

    REM Check for level up
    call :check_level_up crafting !crafting_xp!

    echo.
    echo Quest completed successfully!
) else (
    echo.
    echo You don't have enough wool yet!
    echo You have !item_count! balls of wool, but need 20.
    echo.
    echo You can get wool by shearing sheep in the fields north of Lumbridge.
)
goto :eof

:check_rune_mysteries_completion
REM Check if Rune Mysteries quest can be completed
call :count_item "Air Rune"
set "air_runes=!item_count!"
call :count_item "Mind Rune"
set "mind_runes=!item_count!"
call :count_item "Chaos Rune"
set "chaos_runes=!item_count!"

if !air_runes! geq 10 if !mind_runes! geq 5 if !chaos_runes! geq 3 (
    echo.
    echo Excellent! You have all the runes I need!
    echo You return to Wizard Traiborn and deliver the runes.
    echo.
    echo "Marvelous! These runes are perfect for my research!" says Traiborn.
    echo "Here's your reward:"
    echo.
    echo You gained 1,000 XP in all skills!
    echo.

    REM Award XP to all skills
    set /a "attack_xp+=1000"
    set /a "strength_xp+=1000"
    set /a "defence_xp+=1000"
    set /a "hitpoints_xp+=1000"
    set /a "ranged_xp+=1000"
    set /a "magic_xp+=1000"
    set /a "woodcutting_xp+=1000"
    set /a "fishing_xp+=1000"
    set /a "mining_xp+=1000"
    set /a "cooking_xp+=1000"
    set /a "smithing_xp+=1000"
    set /a "crafting_xp+=1000"
    set /a "fletching_xp+=1000"
    set /a "herblore_xp+=1000"
    set /a "prayer_xp+=1000"
    set /a "slayer_xp+=1000"
    set /a "farming_xp+=1000"
    set /a "firemaking_xp+=1000"
    set /a "treasure_hunting_xp+=1000"
    set /a "experience+=19000"

    REM Remove quest items
    for /l %%i in (1,1,10) do (
        call :remove_item "Air Rune"
    )
    for /l %%i in (1,1,5) do (
        call :remove_item "Mind Rune"
    )
    for /l %%i in (1,1,3) do (
        call :remove_item "Chaos Rune"
    )

    REM Check for level ups
    call :check_level_up attack !attack_xp!
    call :check_level_up strength !strength_xp!
    call :check_level_up defence !defence_xp!
    call :check_level_up hitpoints !hitpoints_xp!
    call :check_level_up ranged !ranged_xp!
    call :check_level_up magic !magic_xp!
    call :check_level_up woodcutting !woodcutting_xp!
    call :check_level_up fishing !fishing_xp!
    call :check_level_up mining !mining_xp!
    call :check_level_up cooking !cooking_xp!
    call :check_level_up smithing !smithing_xp!
    call :check_level_up crafting !crafting_xp!
    call :check_level_up fletching !fletching_xp!
    call :check_level_up herblore !herblore_xp!
    call :check_level_up prayer !prayer_xp!
    call :check_level_up slayer !slayer_xp!
    call :check_level_up farming !farming_xp!
    call :check_level_up firemaking !firemaking_xp!
    call :check_level_up treasure_hunting !treasure_hunting_xp!

    echo.
    echo Quest completed successfully!
    echo All your skills have improved significantly!
) else (
    echo.
    echo You don't have all the runes I need yet!
    echo.
    echo You have:
    echo - Air Runes: !air_runes!/10
    echo - Mind Runes: !mind_runes!/5
    echo - Chaos Runes: !chaos_runes!/3
    echo.
    echo You can get runes by mining essence and crafting them,"
    echo "or by defeating monsters. The Wizards' Tower has a rune shop too.
)
goto :eof

:check_dragon_slayer_completion
REM Check if Dragon Slayer quest can be completed
REM Check if player has defeated the dragon (simplified - just check combat level and some items)
if !combat_level! geq 30 (
    REM Check if player has some basic combat equipment
    call :count_item "Iron Sword"
    set "has_sword=!item_count!"
    call :count_item "Iron Armor"
    set "has_armor=!item_count!"
    call :count_item "Lobster"
    set "has_food=!item_count!"
    
    if !has_sword! gtr 0 if !has_armor! gtr 0 if !has_food! gtr 0 (
        echo.
        echo Congratulations! You have prepared well and are ready to face the dragon!
        echo You travel to Crandor and engage in an epic battle with the dragon.
        echo.
        echo After a fierce fight, you emerge victorious!
        echo The dragon's scales shimmer as it falls, and you claim your reward.
        echo.
        echo "Incredible! You've done what few dare to attempt!" says the Guildmaster.
        echo "Here's your reward:"
        echo.
        echo You gained 18,650 XP in all combat skills!
        echo You received a Dragon Slayer Cape!
        echo You gained 5,000 coins!
        echo.
        
        REM Award rewards
        set /a "attack_xp+=18650"
        set /a "strength_xp+=18650"
        set /a "defence_xp+=18650"
        set /a "hitpoints_xp+=18650"
        set /a "ranged_xp+=18650"
        set /a "magic_xp+=18650"
        set /a "experience+=111900"
        set /a "coins+=5000"
        set "quest_dragon_slayer=2"
        
        REM Add Dragon Slayer Cape to inventory
        if defined inventory (
            set "inventory=!inventory!,Dragon Slayer Cape"
        ) else (
            set "inventory=Dragon Slayer Cape"
        )
        
        REM Remove some food as consumed in battle
        call :remove_item "Lobster"
        
        REM Check for level ups
        call :check_level_up attack !attack_xp!
        call :check_level_up strength !strength_xp!
        call :check_level_up defence !defence_xp!
        call :check_level_up hitpoints !hitpoints_xp!
        call :check_level_up ranged !ranged_xp!
        call :check_level_up magic !magic_xp!
        
        echo.
        echo Quest completed successfully!
        echo You are now known as a true Dragon Slayer!
    ) else (
        echo.
        echo You need better equipment to face the dragon!
        echo You need: Iron Sword, Iron Armor, and Lobster (food)
        echo.
        echo Current equipment:
        if !has_sword! gtr 0 (echo - Iron Sword: ✓) else (echo - Iron Sword: ✗)
        if !has_armor! gtr 0 (echo - Iron Armor: ✓) else (echo - Iron Armor: ✗)
        if !has_food! gtr 0 (echo - Lobster: ✓) else (echo - Lobster: ✗)
        echo.
        echo You can get these items from shops or by crafting them.
    )
) else (
    echo.
    echo You need to reach combat level 30 before attempting this quest!
    echo Your current combat level: !combat_level!
    echo Required combat level: 30
    echo.
)
goto :eof

:lost_city_quest_giver
echo ========================================
echo         LOST CITY QUEST
echo ========================================
echo.
echo You find a group of adventurers near Lumbridge Swamp...
echo.
echo Adventurer: "Hey there! We've been searching for the legendary lost city of Zanaris."
echo "It's said to be hidden somewhere in the swamps, but we need someone with"
echo "crafting and woodcutting skills to help us find it."
echo "You'll need at least level 31 Crafting and level 36 Woodcutting."
echo.
echo Quest Requirements: Crafting level 31+, Woodcutting level 36+
echo Quest Reward: Dramen Staff, 5,000 XP
echo.
echo Your current levels:
echo - Crafting: !crafting!
echo - Woodcutting: !woodcutting!
echo.
if not defined quest_lost_city set "quest_lost_city=0"
if "%quest_lost_city%"=="0" (
    if !crafting! geq 31 if !woodcutting! geq 36 (
        echo [A]ccept quest
        echo [D]ecline quest
        echo [B]ack to quest hub
        echo.
        set /p lost_choice="What do you do? "
        
        if /i "!lost_choice!"=="a" (
            echo.
            echo "Perfect! You have the skills we need."
            echo "The lost city is hidden in the deep swamps. You'll need to craft"
            echo "special items and cut down ancient trees to reveal the path."
            echo.
            echo The Lost City quest has begun!
            set "quest_lost_city=1"
            echo.
            pause >nul
            goto quest_hub
        ) else if /i "!lost_choice!"=="d" (
            echo.
            echo "Maybe you'll change your mind when you're stronger..."
            echo.
            pause >nul
            goto quest_hub
        ) else if /i "!lost_choice!"=="b" (
            goto main_menu
        ) else (
            echo Invalid choice!
            pause >nul
            goto main_menu
        )
    ) else (
        echo You need to improve your skills before accepting this quest.
        echo.
        echo [B]ack to quest hub
        set /p lost_choice="What do you do? "
        
        if /i "!lost_choice!"=="b" (
            goto main_menu
        ) else (
            echo Invalid choice!
            pause >nul
            goto main_menu
        )
    )
) else if "%quest_lost_city%"=="1" (
    echo "How goes the search for Zanaris?"
    echo "Remember, you need to craft special items and cut ancient trees."
    echo.
    echo [C]heck progress - [B]ack to quest hub
    set /p lost_choice="What do you do? "
    
    if /i "!lost_choice!"=="c" (
        call :check_lost_city_completion
        pause >nul
        goto quest_hub
    ) else if /i "!lost_choice!"=="b" (
        goto main_menu
    ) else (
        echo Invalid choice!
        pause >nul
        goto main_menu
    )
) else (
    echo "You found Zanaris! The lost city is no longer lost thanks to you!"
    echo.
    echo [B]ack to quest hub
    set /p lost_choice="What do you do? "
    
    if /i "!lost_choice!"=="b" (
        goto main_menu
    ) else (
        echo Invalid choice!
        pause >nul
        goto main_menu
    )
)

:restless_ghost_quest_giver
echo ========================================
echo         THE RESTLESS GHOST QUEST
echo ========================================
echo.
echo You find Father Aereck in the Lumbridge Church...
echo.
echo Father Aereck: "Ah, a visitor! I have a spiritual matter that needs attention."
echo "There's a ghost haunting the graveyard who can't find peace."
echo "I need someone to help the ghost move on to the afterlife."
echo "This will require prayer and understanding."
echo.
echo Quest Requirements: None
echo Quest Reward: 125 Prayer XP, Amulet of Ghostspeak
echo.
if not defined quest_restless_ghost set "quest_restless_ghost=0"
if "%quest_restless_ghost%"=="0" (
    echo [A]ccept quest
    echo [D]ecline quest
    echo [B]ack to quest hub
    echo.
    set /p ghost_choice="What do you do? "
    
    if /i "!ghost_choice!"=="a" (
        echo.
        echo "Bless you, child. The ghost is in the graveyard behind the church."
        echo "You'll need to speak with it and help it find peace."
        echo "The Amulet of Ghostspeak will help you communicate with spirits."
        echo.
        echo The Restless Ghost quest has begun!
        set "quest_restless_ghost=1"
        echo.
        pause >nul
        goto quest_hub
    ) else if /i "!ghost_choice!"=="d" (
        echo.
        echo "Perhaps you're not ready for spiritual matters..."
        echo.
        pause >nul
        goto quest_hub
    ) else if /i "!ghost_choice!"=="b" (
        goto main_menu
    ) else (
        echo Invalid choice!
        pause >nul
        goto main_menu
    )
) else if "%quest_restless_ghost%"=="1" (
    echo "Have you helped the restless ghost find peace?"
    echo "Check the graveyard behind the church."
    echo.
    echo [C]heck progress - [B]ack to quest hub
    set /p ghost_choice="What do you do? "
    
    if /i "!ghost_choice!"=="c" (
        call :check_restless_ghost_completion
        pause >nul
        goto quest_hub
    ) else if /i "!ghost_choice!"=="b" (
        goto main_menu
    ) else (
        echo Invalid choice!
        pause >nul
        goto main_menu
    )
) else (
    echo "You've done a great service to the spirit world."
    echo "The ghost is now at peace, thanks to you."
    echo.
    echo [B]ack to quest hub
    set /p ghost_choice="What do you do? "
    
    if /i "!ghost_choice!"=="b" (
        goto main_menu
    ) else (
        echo Invalid choice!
        pause >nul
        goto main_menu
    )
)

:imp_catcher_quest_giver
echo ========================================
echo         IMP CATCHER QUEST
echo ========================================
echo.
echo You find Wizard Mizgog in the Wizards' Tower...
echo.
echo Wizard Mizgog: "Ah, a fellow magic user! I have a problem with imps."
echo "These mischievous creatures have stolen my magical beads."
echo "I need you to catch them and return the beads to me."
echo "You'll need to hunt imps in the wilderness and collect their beads."
echo.
echo Quest Requirements: None
echo Quest Reward: 875 Magic XP, Amulet of Accuracy
echo.
if not defined quest_imp_catcher set "quest_imp_catcher=0"
if "%quest_imp_catcher%"=="0" (
    echo [A]ccept quest
    echo [D]ecline quest
    echo [B]ack to quest hub
    echo.
    set /p imp_choice="What do you do? "
    
    if /i "!imp_choice!"=="a" (
        echo.
        echo "Excellent! The imps can be found in the wilderness areas."
        echo "They drop different colored beads: red, yellow, blue, and black."
        echo "I need one of each color to restore my magical items."
        echo.
        echo The Imp Catcher quest has begun!
        set "quest_imp_catcher=1"
        echo.
        pause >nul
        goto quest_hub
    ) else if /i "!imp_choice!"=="d" (
        echo.
        echo "Perhaps you're not ready for magical quests..."
        echo.
        pause >nul
        goto quest_hub
    ) else if /i "!imp_choice!"=="b" (
        goto main_menu
    ) else (
        echo Invalid choice!
        pause >nul
        goto main_menu
    )
) else if "%quest_imp_catcher%"=="1" (
    echo "How goes the imp hunting?"
    echo "I need: Red bead, Yellow bead, Blue bead, Black bead"
    echo.
    echo [C]heck progress - [B]ack to quest hub
    set /p imp_choice="What do you do? "
    
    if /i "!imp_choice!"=="c" (
        call :check_imp_catcher_completion
        pause >nul
        goto quest_hub
    ) else if /i "!imp_choice!"=="b" (
        goto main_menu
    ) else (
        echo Invalid choice!
        pause >nul
        goto main_menu
    )
) else (
    echo "Perfect! My magical items are restored thanks to you."
    echo "The Amulet of Accuracy will serve you well in combat."
    echo.
    echo [B]ack to quest hub
    set /p imp_choice="What do you do? "
    
    if /i "!imp_choice!"=="b" (
        goto main_menu
    ) else (
        echo Invalid choice!
        pause >nul
        goto main_menu
    )
)

:white_knight_quest_giver
echo ========================================
echo         WHITE KNIGHT QUEST
echo ========================================
echo.
echo You find Sir Tiffy in Falador Castle...
echo.
echo Sir Tiffy: "Hail, noble adventurer! I have a quest for a true knight."
echo "The White Knights are investigating reports of dark magic in the area."
echo "We need someone to investigate and report back to us."
echo "This quest requires courage and combat skills."
echo.
echo Quest Requirements: Combat level 20+
echo Quest Reward: White Knight Armor, 1,000 XP
echo.
echo Your current combat level: !combat_level!
echo.
if not defined quest_white_knight set "quest_white_knight=0"
if "%quest_white_knight%"=="0" (
    if !combat_level! geq 20 (
        echo [A]ccept quest
        echo [D]ecline quest
        echo [B]ack to quest hub
        echo.
        set /p knight_choice="What do you do? "
        
        if /i "!knight_choice!"=="a" (
            echo.
            echo "Brave knight! You'll need to investigate the dark magic reports."
            echo "Check the areas around Falador for any suspicious activity."
            echo "Report back to me with your findings."
            echo.
            echo The White Knight Quest has begun!
            set "quest_white_knight=1"
            echo.
            pause >nul
            goto quest_hub
        ) else if /i "!knight_choice!"=="d" (
            echo.
            echo "Perhaps you're not ready for knightly duties..."
            echo.
            pause >nul
            goto quest_hub
        ) else if /i "!knight_choice!"=="b" (
            goto main_menu
        ) else (
            echo Invalid choice!
            pause >nul
            goto main_menu
        )
    ) else (
        echo You need to reach combat level 20 before accepting this quest.
        echo.
        echo [B]ack to quest hub
        set /p knight_choice="What do you do? "
        
        if /i "!knight_choice!"=="b" (
            goto main_menu
        ) else (
            echo Invalid choice!
            pause >nul
            goto main_menu
        )
    )
) else if "%quest_white_knight%"=="1" (
    echo "How goes the investigation?"
    echo "Have you found any evidence of dark magic?"
    echo.
    echo [C]heck progress - [B]ack to quest hub
    set /p knight_choice="What do you do? "
    
    if /i "!knight_choice!"=="c" (
        call :check_white_knight_completion
        pause >nul
        goto quest_hub
    ) else if /i "!knight_choice!"=="b" (
        goto main_menu
    ) else (
        echo Invalid choice!
        pause >nul
        goto main_menu
    )
) else (
    echo "Excellent work, knight! You've proven yourself worthy."
    echo "Wear the White Knight Armor with pride."
    echo.
    echo [B]ack to quest hub
    set /p knight_choice="What do you do? "
    
    if /i "!knight_choice!"=="b" (
        goto main_menu
    ) else (
        echo Invalid choice!
        pause >nul
        goto main_menu
    )
)

:prince_ali_quest_giver
echo ========================================
echo         PRINCE ALI RESCUE QUEST
echo ========================================
echo.
echo You find Osman in Al Kharid Palace...
echo.
echo Osman: "Ah, a visitor from the outside world!"
echo "I have a delicate matter that requires discretion."
echo "Prince Ali has been kidnapped and is being held for ransom."
echo "I need someone to help rescue him without causing a diplomatic incident."
echo.
echo Quest Requirements: None
echo Quest Reward: 1,000 coins, 500 XP
echo.
if not defined quest_prince_ali set "quest_prince_ali=0"
if "%quest_prince_ali%"=="0" (
    echo [A]ccept quest
    echo [D]ecline quest
    echo [B]ack to quest hub
    echo.
    set /p prince_choice="What do you do? "
    
    if /i "!prince_choice!"=="a" (
        echo.
        echo "Thank you! Prince Ali is being held in a secret location."
        echo "You'll need to gather information and plan a rescue."
        echo "Be careful not to alert the kidnappers."
        echo.
        echo The Prince Ali Rescue quest has begun!
        set "quest_prince_ali=1"
        echo.
        pause >nul
        goto quest_hub
    ) else if /i "!prince_choice!"=="d" (
        echo.
        echo "I understand. This is a dangerous mission..."
        echo.
        pause >nul
        goto quest_hub
    ) else if /i "!prince_choice!"=="b" (
        goto main_menu
    ) else (
        echo Invalid choice!
        pause >nul
        goto main_menu
    )
) else if "%quest_prince_ali%"=="1" (
    echo "How goes the rescue mission?"
    echo "Have you found Prince Ali's location?"
    echo.
    echo [C]heck progress - [B]ack to quest hub
    set /p prince_choice="What do you do? "
    
    if /i "!prince_choice!"=="c" (
        call :check_prince_ali_completion
        pause >nul
        goto quest_hub
    ) else if /i "!prince_choice!"=="b" (
        goto main_menu
    ) else (
        echo Invalid choice!
        pause >nul
        goto main_menu
    )
) else (
    echo "You've done it! Prince Ali is safe and back in the palace."
    echo "The kingdom owes you a great debt."
    echo.
    echo [B]ack to quest hub
    set /p prince_choice="What do you do? "
    
    if /i "!prince_choice!"=="b" (
        goto main_menu
    ) else (
        echo Invalid choice!
        pause >nul
        goto main_menu
    )
)

:pirates_treasure_quest_giver
echo ========================================
echo         PIRATE'S TREASURE QUEST
echo ========================================
echo.
echo You find Redbeard Frank in Port Sarim...
echo.
echo Redbeard Frank: "Arr, matey! Looking for adventure on the high seas?"
echo "I have a map to a pirate's treasure, but I need help to find it."
echo "The treasure is hidden on a mysterious island, but the map is incomplete."
echo "You'll need to piece together the clues and brave the dangers."
echo.
echo Quest Requirements: None
echo Quest Reward: 2,000 coins, Pirate's Hat, 1,000 XP
echo.
if not defined quest_pirates_treasure set "quest_pirates_treasure=0"
if "%quest_pirates_treasure%"=="0" (
    echo [A]ccept quest
    echo [D]ecline quest
    echo [B]ack to quest hub
    echo.
    set /p pirate_choice="What do you do? "
    
    if /i "!pirate_choice!"=="a" (
        echo.
        echo "Excellent! Here's the treasure map, but it's missing some pieces."
        echo "You'll need to find the missing map fragments and solve the riddles."
        echo "The treasure is said to be guarded by sea monsters!"
        echo.
        echo The Pirate's Treasure quest has begun!
        set "quest_pirates_treasure=1"
        echo.
        pause >nul
        goto quest_hub
    ) else if /i "!pirate_choice!"=="d" (
        echo.
        echo "No problem, matey. Maybe another time..."
        echo.
        pause >nul
        goto quest_hub
    ) else if /i "!pirate_choice!"=="b" (
        goto main_menu
    ) else (
        echo Invalid choice!
        pause >nul
        goto main_menu
    )
) else if "%quest_pirates_treasure%"=="1" (
    echo "How goes the treasure hunt?"
    echo "Have you found the missing map pieces?"
    echo.
    echo [C]heck progress - [B]ack to quest hub
    set /p pirate_choice="What do you do? "
    
    if /i "!pirate_choice!"=="c" (
        call :check_pirates_treasure_completion
        pause >nul
        goto quest_hub
    ) else if /i "!pirate_choice!"=="b" (
        goto main_menu
    ) else (
        echo Invalid choice!
        pause >nul
        goto main_menu
    )
) else (
    echo "You found the treasure! You're a true pirate now, matey!"
    echo "Wear that hat with pride and enjoy your riches."
    echo.
    echo [B]ack to quest hub
    set /p pirate_choice="What do you do? "
    
    if /i "!pirate_choice!"=="b" (
        goto main_menu
    ) else (
        echo Invalid choice!
        pause >nul
        goto main_menu
    )
)

REM ============================================
REM     MISSING QUEST COMPLETION FUNCTIONS
REM ============================================

:check_lost_city_completion
REM Check if Lost City quest can be completed
REM Check if player has the required items to find the lost city
call :count_item "Dramen Branch"
set "has_branch=!item_count!"
call :count_item "Crystal Key"
set "has_key=!item_count!"
call :count_item "Ancient Rune"
set "has_rune=!item_count!"

if !has_branch! gtr 0 if !has_key! gtr 0 if !has_rune! gtr 0 (
    echo.
    echo Excellent! You have gathered all the necessary items to find Zanaris!
    echo You use the Dramen Branch to craft a staff, the Crystal Key to unlock"
    echo "the ancient portal, and the Ancient Rune to activate the magic.
    echo.
    echo As you place the rune in the ancient stone, a portal opens before you!
    echo The lost city of Zanaris materializes in a shimmer of light.
    echo.
    echo "Incredible! You've found it!" exclaims the adventurer.
    echo "The lost city of Zanaris is real! Here's your reward:"
    echo.
    echo You gained 5,000 XP in Crafting and Woodcutting!
    echo You received a Dramen Staff!
    echo You gained 2,000 coins!
    echo.
    
    REM Award rewards
    set /a "crafting_xp+=5000"
    set /a "woodcutting_xp+=5000"
    set /a "experience+=10000"
    set /a "coins+=2000"
    set "quest_lost_city=2"
    
    REM Add Dramen Staff to inventory
    if defined inventory (
        set "inventory=!inventory!,Dramen Staff"
    ) else (
        set "inventory=Dramen Staff"
    )
    
    REM Remove quest items
    call :remove_item "Dramen Branch"
    call :remove_item "Crystal Key"
    call :remove_item "Ancient Rune"
    
    REM Check for level ups
    call :check_level_up crafting !crafting_xp!
    call :check_level_up woodcutting !woodcutting_xp!
    
    echo.
    echo Quest completed successfully!
    echo You have discovered the legendary lost city of Zanaris!
) else (
    echo.
    echo You need to gather the required items to find the lost city!
    echo You need: Dramen Branch, Crystal Key, and Ancient Rune
    echo.
    echo Current items:
    if !has_branch! gtr 0 (echo - Dramen Branch: ✓) else (echo - Dramen Branch: ✗)
    if !has_key! gtr 0 (echo - Crystal Key: ✓) else (echo - Crystal Key: ✗)
    if !has_rune! gtr 0 (echo - Ancient Rune: ✓) else (echo - Ancient Rune: ✗)
    echo.
    echo You can find these items by:
    echo - Cutting ancient trees in the swamp (Dramen Branch)
    echo - Solving puzzles in the swamp ruins (Crystal Key)
    echo - Mining special essence nodes (Ancient Rune)
    echo.
)
goto :eof

:check_restless_ghost_completion
REM Check if Restless Ghost quest can be completed
REM Check if player has the required items to help the ghost
call :count_item "Amulet of Ghostspeak"
set "has_amulet=!item_count!"
call :count_item "Holy Water"
set "has_holy_water=!item_count!"
call :count_item "Blessed Candle"
set "has_candle=!item_count!"

if !has_amulet! gtr 0 if !has_holy_water! gtr 0 if !has_candle! gtr 0 (
    echo.
    echo You approach the restless ghost with the necessary spiritual items.
    echo Using the Amulet of Ghostspeak, you can now communicate with the spirit.
    echo.
    echo Ghost: "Thank you for coming... I've been trapped here for so long."
    echo "I need help finding my way to the afterlife. Can you help me?"
    echo.
    echo You use the Holy Water to cleanse the area and light the Blessed Candle.
    echo The ghost's form begins to glow with a peaceful light.
    echo.
    echo "I can see the way now... thank you, kind soul. I can finally rest."
    echo The ghost fades away with a smile, finally at peace.
    echo.
    echo Father Aereck: "Bless you! You've helped a lost soul find peace."
    echo "Here's your reward:"
    echo.
    echo You gained 125 Prayer XP!
    echo You received an Amulet of Ghostspeak!
    echo You gained 500 coins!
    echo.
    
    REM Award rewards
    set /a "prayer_xp+=125"
    set /a "experience+=125"
    set /a "coins+=500"
    set "quest_restless_ghost=2"
    
    REM Add Amulet of Ghostspeak to inventory (if not already there)
    if !has_amulet! equ 0 (
        if defined inventory (
            set "inventory=!inventory!,Amulet of Ghostspeak"
        ) else (
            set "inventory=Amulet of Ghostspeak"
        )
    )
    
    REM Remove quest items
    call :remove_item "Holy Water"
    call :remove_item "Blessed Candle"
    
    REM Check for level up
    call :check_level_up prayer !prayer_xp!
    
    echo.
    echo Quest completed successfully!
    echo You have helped a lost soul find peace in the afterlife!
) else (
    echo.
    echo You need the proper spiritual items to help the ghost!
    echo You need: Amulet of Ghostspeak, Holy Water, and Blessed Candle
    echo.
    echo Current items:
    if !has_amulet! gtr 0 (echo - Amulet of Ghostspeak: ✓) else (echo - Amulet of Ghostspeak: ✗)
    if !has_holy_water! gtr 0 (echo - Holy Water: ✓) else (echo - Holy Water: ✗)
    if !has_candle! gtr 0 (echo - Blessed Candle: ✓) else (echo - Blessed Candle: ✗)
    echo.
    echo You can obtain these items by:
    echo - Getting the Amulet of Ghostspeak from Father Aereck
    echo - Blessing water at the altar (Holy Water)
    echo - Crafting candles and blessing them (Blessed Candle)
    echo.
)
goto :eof

:check_imp_catcher_completion
REM Check if Imp Catcher quest can be completed
call :count_item "Red Bead"
set "red_beads=!item_count!"
call :count_item "Yellow Bead"
set "yellow_beads=!item_count!"
call :count_item "Blue Bead"
set "blue_beads=!item_count!"
call :count_item "Black Bead"
set "black_beads=!item_count!"

if !red_beads! geq 1 if !yellow_beads! geq 1 if !blue_beads! geq 1 if !black_beads! geq 1 (
    echo.
    echo Excellent! You have all the beads I need!
    echo You return to Wizard Mizgog and deliver the beads.
    echo.
    echo "Perfect! My magical items are restored!" says Mizgog.
    echo "Here's your reward:"
    echo.
    echo You gained 875 Magic XP!
    echo You received an Amulet of Accuracy!
    echo

    REM Award rewards
    set /a "magic_xp+=875"
    set /a "experience+=875"
    set "quest_imp_catcher=2"

    REM Add Amulet of Accuracy to inventory
    if defined inventory (
        set "inventory=!inventory!,Amulet of Accuracy"
    ) else (
        set "inventory=Amulet of Accuracy"
    )

    REM Remove quest items
    call :remove_item "Red Bead"
    call :remove_item "Yellow Bead"
    call :remove_item "Blue Bead"
    call :remove_item "Black Bead"

    REM Check for level up
    call :check_level_up magic !magic_xp!

    echo.
    echo Quest completed successfully!
) else (
    echo.
    echo You don't have all the beads I need yet!
    echo.
    echo You have:
    echo - Red Beads: !red_beads!/1
    echo - Yellow Beads: !yellow_beads!/1
    echo - Blue Beads: !blue_beads!/1
    echo - Black Beads: !black_beads!/1
    echo.
    echo You can get beads by hunting imps in the wilderness areas.
)
goto :eof

:check_white_knight_completion
REM Check if White Knight quest can be completed
REM Check if player has investigated the dark magic and gathered evidence
call :count_item "Dark Magic Scroll"
set "has_scroll=!item_count!"
call :count_item "Suspicious Potion"
set "has_potion=!item_count!"
call :count_item "Cultist Robe"
set "has_robe=!item_count!"

if !has_scroll! gtr 0 if !has_potion! gtr 0 if !has_robe! gtr 0 (
    echo.
    echo You return to Sir Tiffy with evidence of the dark magic activities.
    echo You present the Dark Magic Scroll, Suspicious Potion, and Cultist Robe.
    echo.
    echo Sir Tiffy: "Excellent work, brave knight! This is exactly what we needed."
    echo "These items prove that dark cultists have been operating in the area."
    echo "You've done the White Knights a great service."
    echo.
    echo "As a reward for your bravery and dedication, I present you with:"
    echo.
    echo You gained 1,000 XP in all combat skills!
    echo You received White Knight Armor!
    echo You gained 1,500 coins!
    echo.
    
    REM Award rewards
    set /a "attack_xp+=1000"
    set /a "strength_xp+=1000"
    set /a "defence_xp+=1000"
    set /a "hitpoints_xp+=1000"
    set /a "ranged_xp+=1000"
    set /a "magic_xp+=1000"
    set /a "experience+=6000"
    set /a "coins+=1500"
    set "quest_white_knight=2"
    
    REM Add White Knight Armor to inventory
    if defined inventory (
        set "inventory=!inventory!,White Knight Armor"
    ) else (
        set "inventory=White Knight Armor"
    )
    
    REM Remove quest items
    call :remove_item "Dark Magic Scroll"
    call :remove_item "Suspicious Potion"
    call :remove_item "Cultist Robe"
    
    REM Check for level ups
    call :check_level_up attack !attack_xp!
    call :check_level_up strength !strength_xp!
    call :check_level_up defence !defence_xp!
    call :check_level_up hitpoints !hitpoints_xp!
    call :check_level_up ranged !ranged_xp!
    call :check_level_up magic !magic_xp!
    
    echo.
    echo Quest completed successfully!
    echo You are now recognized as a true White Knight!
) else (
    echo.
    echo You need to gather more evidence of the dark magic activities!
    echo You need: Dark Magic Scroll, Suspicious Potion, and Cultist Robe
    echo.
    echo Current evidence:
    if !has_scroll! gtr 0 (echo - Dark Magic Scroll: ✓) else (echo - Dark Magic Scroll: ✗)
    if !has_potion! gtr 0 (echo - Suspicious Potion: ✓) else (echo - Suspicious Potion: ✗)
    if !has_robe! gtr 0 (echo - Cultist Robe: ✓) else (echo - Cultist Robe: ✗)
    echo.
    echo You can find these items by:
    echo - Investigating suspicious areas around Falador
    echo - Defeating dark cultists in combat
    echo - Searching abandoned buildings and ruins
    echo.
)
goto :eof

:check_prince_ali_completion
REM Check if Prince Ali Rescue quest can be completed
REM Check if player has gathered the necessary items for the rescue
call :count_item "Kidnapper's Note"
set "has_note=!item_count!"
call :count_item "Palace Key"
set "has_key=!item_count!"
call :count_item "Disguise Kit"
set "has_disguise=!item_count!"

if !has_note! gtr 0 if !has_key! gtr 0 if !has_disguise! gtr 0 (
    echo.
    echo You have gathered all the necessary information and items for the rescue!
    echo You use the Kidnapper's Note to locate Prince Ali, the Palace Key to access"
    echo "the secret location, and the Disguise Kit to avoid detection.
    echo.
    echo You successfully infiltrate the kidnapper's hideout and find Prince Ali.
    echo After a brief but intense rescue operation, you free the prince!
    echo.
    echo Prince Ali: "Thank you, brave adventurer! I thought I'd never see freedom again."
    echo "The kingdom will be forever grateful for your heroism."
    echo.
    echo Osman: "Incredible work! You've saved the kingdom from a great crisis."
    echo "Here's your reward:"
    echo.
    echo You gained 1,000 coins!
    echo You gained 500 XP in all skills!
    echo You received a Royal Decree!
    echo.
    
    REM Award rewards
    set /a "coins+=1000"
    set /a "attack_xp+=500"
    set /a "strength_xp+=500"
    set /a "defence_xp+=500"
    set /a "hitpoints_xp+=500"
    set /a "ranged_xp+=500"
    set /a "magic_xp+=500"
    set /a "experience+=3000"
    set "quest_prince_ali=2"
    
    REM Add Royal Decree to inventory
    if defined inventory (
        set "inventory=!inventory!,Royal Decree"
    ) else (
        set "inventory=Royal Decree"
    )
    
    REM Remove quest items
    call :remove_item "Kidnapper's Note"
    call :remove_item "Palace Key"
    call :remove_item "Disguise Kit"
    
    REM Check for level ups
    call :check_level_up attack !attack_xp!
    call :check_level_up strength !strength_xp!
    call :check_level_up defence !defence_xp!
    call :check_level_up hitpoints !hitpoints_xp!
    call :check_level_up ranged !ranged_xp!
    call :check_level_up magic !magic_xp!
    
    echo.
    echo Quest completed successfully!
    echo You have saved Prince Ali and earned the kingdom's gratitude!
) else (
    echo.
    echo You need to gather more information and items for the rescue!
    echo You need: Kidnapper's Note, Palace Key, and Disguise Kit
    echo.
    echo Current items:
    if !has_note! gtr 0 (echo - Kidnapper's Note: ✓) else (echo - Kidnapper's Note: ✗)
    if !has_key! gtr 0 (echo - Palace Key: ✓) else (echo - Palace Key: ✗)
    if !has_disguise! gtr 0 (echo - Disguise Kit: ✓) else (echo - Disguise Kit: ✗)
    echo.
    echo You can find these items by:
    echo - Investigating suspicious areas around Al Kharid
    echo - Defeating kidnappers in combat
    echo - Searching for clues in the palace
    echo.
)
goto :eof

:check_pirates_treasure_completion
REM Check if Pirate's Treasure quest can be completed
REM Check if player has gathered all the treasure map pieces and solved the riddles
call :count_item "Treasure Map Piece 1"
set "has_piece1=!item_count!"
call :count_item "Treasure Map Piece 2"
set "has_piece2=!item_count!"
call :count_item "Treasure Map Piece 3"
set "has_piece3=!item_count!"
call :count_item "Ancient Compass"
set "has_compass=!item_count!"

if !has_piece1! gtr 0 if !has_piece2! gtr 0 if !has_piece3! gtr 0 if !has_compass! gtr 0 (
    echo.
    echo You have gathered all the treasure map pieces and the ancient compass!
    echo You piece together the map and use the compass to navigate to the treasure island.
    echo.
    echo After a perilous journey across the seas, you arrive at the mysterious island.
    echo You follow the map's clues and solve the ancient riddles carved in stone.
    echo.
    echo Suddenly, a massive sea monster emerges from the depths!
    echo You engage in an epic battle, using your wits and courage to defeat it.
    echo.
    echo With the sea monster defeated, you discover the hidden treasure cave!
    echo Inside, you find a massive chest filled with gold, jewels, and ancient artifacts.
    echo.
    echo Redbeard Frank: "Arr, matey! You've done it! You found the legendary treasure!"
    echo "You're a true pirate now! Here's your share of the loot:"
    echo.
    echo You gained 2,000 coins!
    echo You received a Pirate's Hat!
    echo You gained 1,000 XP in all skills!
    echo You found Ancient Artifacts worth 500 coins!
    echo.
    
    REM Award rewards
    set /a "coins+=2500"
    set /a "attack_xp+=1000"
    set /a "strength_xp+=1000"
    set /a "defence_xp+=1000"
    set /a "hitpoints_xp+=1000"
    set /a "ranged_xp+=1000"
    set /a "magic_xp+=1000"
    set /a "experience+=6000"
    set "quest_pirates_treasure=2"
    
    REM Add Pirate's Hat to inventory
    if defined inventory (
        set "inventory=!inventory!,Pirate's Hat"
    ) else (
        set "inventory=Pirate's Hat"
    )
    
    REM Remove quest items
    call :remove_item "Treasure Map Piece 1"
    call :remove_item "Treasure Map Piece 2"
    call :remove_item "Treasure Map Piece 3"
    call :remove_item "Ancient Compass"
    
    REM Check for level ups
    call :check_level_up attack !attack_xp!
    call :check_level_up strength !strength_xp!
    call :check_level_up defence !defence_xp!
    call :check_level_up hitpoints !hitpoints_xp!
    call :check_level_up ranged !ranged_xp!
    call :check_level_up magic !magic_xp!
    
    echo.
    echo Quest completed successfully!
    echo You are now a legendary treasure hunter and pirate!
) else (
    echo.
    echo You need to gather more pieces of the treasure map and find the ancient compass!
    echo You need: Treasure Map Piece 1, 2, 3, and Ancient Compass
    echo.
    echo Current items:
    if !has_piece1! gtr 0 (echo - Treasure Map Piece 1: ✓) else (echo - Treasure Map Piece 1: ✗)
    if !has_piece2! gtr 0 (echo - Treasure Map Piece 2: ✓) else (echo - Treasure Map Piece 2: ✗)
    if !has_piece3! gtr 0 (echo - Treasure Map Piece 3: ✓) else (echo - Treasure Map Piece 3: ✗)
    if !has_compass! gtr 0 (echo - Ancient Compass: ✓) else (echo - Ancient Compass: ✗)
    echo.
    echo You can find these items by:
    echo - Exploring coastal areas and shipwrecks
    echo - Defeating sea monsters and pirates
    echo - Solving puzzles in ancient ruins
    echo - Trading with other adventurers
    echo.
)
goto :eof

:play_magetower_music
REM Play magical theme using PowerShell SoundPlayer (working method)
REM Skip if audio system is disabled
if "!audio_system!"=="disabled" (
    echo [♪] Audio system disabled - running without admin privileges
    timeout /t 2 >nul
    goto :eof
)

echo [♪] Playing: Mage Tower Theme - Magical music
if exist "assets\sounds\magetower_theme.wav" (
    powershell -Command "try { (New-Object Media.SoundPlayer 'assets\sounds\magetower_theme.wav').PlaySync() } catch { $null }" 2>nul
) else (
    REM Fallback to system sounds for magical theme
    rundll32 user32.dll,MessageBeep 0x50
    timeout /t 1 >nul
    rundll32 user32.dll,MessageBeep 0x20
    echo [♪] Mystical melodies dance through the air...
)
timeout /t 2 >nul
goto :eof

:stop_music
REM Stop any playing music
echo [♪] Music stopped
echo [♪] Silence returns...
REM Note: PowerShell SoundPlayer automatically stops when the command completes
timeout /t 1 >nul
goto :eof

:draw_mage_tower_header
echo.
echo  +================================================+
echo  ^|               MAGE TOWER                      ^|
echo  ^|                                                ^|
echo  ^|  [O]  Tower         [O]  You                 ^|
echo  ^|  [NPC] Ancient Magic [NPC] Level !level!      ^|
echo  ^|  [NPC] Knowledge     [NPC] Gold: !coins!      ^|
echo  ^|                                                ^|
echo  ^|  +==========================================+  ^|
echo  ^|  ^|           MAGICAL STUDIES              ^|  ^|
echo  ^|  ^|  [Shop] [Chat] [Craft] [Study]        ^|  ^|
echo  ^|  +==========================================+  ^|
echo  +================================================+
goto :eof

:firemaking_minigame
REM Parameters: %1 = log type, %2 = XP amount, %3 = log name
set "log_type=%~1"
set "log_xp=%~2"
set "log_name=%~3"

cls
call :draw_location_header
echo.
echo ========================================
echo         FIREMAKING MINIGAME
echo ========================================
echo.
echo You prepare to light a fire using your tinderbox...
echo.
echo Log Type: !log_type!
echo Base XP: !log_xp!
echo.
echo The firemaking minigame requires timing and skill!
echo You must press the correct keys at the right time to succeed.
echo.
echo Instructions:
echo - Watch for the timing prompts
echo - Press the correct key when prompted
echo - Better timing = more XP and success chance
echo - Poor timing = less XP or failure
echo.
echo Press any key to start the minigame...
pause >nul

REM Initialize minigame variables
set "fire_progress=0"
set "timing_score=0"
set "total_attempts=0"
set "successful_attempts=0"
set "minigame_xp=0"

:firemaking_loop
if !fire_progress! geq 100 goto firemaking_complete

REM Random timing challenge
set /a "challenge_type=!random! %% 4 + 1"
set /a "timing_window=!random! %% 3 + 1"

if !challenge_type! equ 1 (
    echo.
    echo [FIREMAKING CHALLENGE: Ignition]
    echo Press 'F' when the prompt appears to ignite the tinder...
    timeout /t !timing_window! >nul
    echo.
    echo *** IGNITE NOW! ***
    set /p timing_input="Press 'F' quickly: "
    if /i "!timing_input!"=="F" (
        set /a "timing_score+=25"
        set /a "successful_attempts+=1"
        echo ✓ Good timing! The tinder catches fire!
    ) else (
        echo ✗ Missed timing! The tinder smolders...
    )
) else if !challenge_type! equ 2 (
    echo.
    echo [FIREMAKING CHALLENGE: Fuel Management]
    echo Press 'A' to add fuel at the right moment...
    timeout /t !timing_window! >nul
    echo.
    echo *** ADD FUEL NOW! ***
    set /p timing_input="Press 'A' quickly: "
    if /i "!timing_input!"=="A" (
        set /a "timing_score+=20"
        set /a "successful_attempts+=1"
        echo ✓ Perfect! The fire burns brighter!
    ) else (
        echo ✗ Too late! The fire dims...
    )
) else if !challenge_type! equ 3 (
    echo.
    echo [FIREMAKING CHALLENGE: Air Flow]
    echo Press 'B' to control air flow for optimal burning...
    timeout /t !timing_window! >nul
    echo.
    echo *** CONTROL AIR NOW! ***
    set /p timing_input="Press 'B' quickly: "
    if /i "!timing_input!"=="B" (
        set /a "timing_score+=30"
        set /a "successful_attempts+=1"
        echo ✓ Excellent! The fire roars with life!
    ) else (
        echo ✗ Poor control! The fire struggles...
    )
) else (
    echo.
    echo [FIREMAKING CHALLENGE: Fire Maintenance]
    echo Press 'M' to maintain the fire's intensity...
    timeout /t !timing_window! >nul
    echo.
    echo *** MAINTAIN FIRE NOW! ***
    set /p timing_input="Press 'M' quickly: "
    if /i "!timing_input!"=="M" (
        set /a "timing_score+=15"
        set /a "successful_attempts+=1"
        echo ✓ Good maintenance! The fire stays strong!
    ) else (
        echo ✗ Neglected! The fire weakens...
    )
)

set /a "total_attempts+=1"
set /a "fire_progress+=20"

REM Update visual progress
set "progress_bar="
set /a "bars=!fire_progress! / 5"
for /l %%i in (1,1,!bars!) do set "progress_bar=!progress_bar!█"
for /l %%i in (!bars!,1,20) do set "progress_bar=!progress_bar!░"

echo.
echo Fire Progress: [!progress_bar!] !fire_progress!%%
echo Timing Score: !timing_score!/100
echo.

if !fire_progress! lss 100 (
    echo Press any key for next challenge...
    pause >nul
    goto firemaking_loop
)

:firemaking_complete
echo.
echo ========================================
echo        FIREMAKING COMPLETE!
echo ========================================
echo.

REM Calculate final results
set /a "success_rate=!successful_attempts! * 100 / !total_attempts!"
set /a "timing_bonus=!timing_score! / 4"

if !success_rate! geq 80 (
    if !timing_bonus! geq 20 (
        echo 🎉 PERFECT FIRE! Masterful firemaking technique!
        set /a "minigame_xp=!log_xp! + 50"
        set "fire_quality=Perfect"
    ) else (
        echo 🔥 EXCELLENT FIRE! Great firemaking skills!
        set /a "minigame_xp=!log_xp! + 25"
        set "fire_quality=Excellent"
    )
) else if !success_rate! geq 60 (
    echo 🔥 GOOD FIRE! Decent firemaking technique!
    set /a "minigame_xp=!log_xp! + 10"
    set "fire_quality=Good"
) else if !success_rate! geq 40 (
    echo 🔥 AVERAGE FIRE! Basic firemaking skills.
    set /a "minigame_xp=!log_xp!"
    set "fire_quality=Average"
) else (
    echo 🔥 POOR FIRE! Needs more practice.
    set /a "minigame_xp=!log_xp! / 2"
    set "fire_quality=Poor"
)

echo.
echo Results:
echo - Fire Quality: !fire_quality!
echo - Success Rate: !success_rate!%%
echo - Timing Score: !timing_score!/100
echo - Base XP: !log_xp!
echo - Bonus XP: !timing_bonus!
echo - Total XP Gained: !minigame_xp!
echo.

REM Apply XP and remove log
set /a "firemaking_xp+=!minigame_xp!"
set /a "experience+=!minigame_xp!"
call :remove_item "!log_type!"
call :add_item "Ashes"

REM Check for level up
call :check_level_up firemaking !firemaking_xp!

REM Special rewards for perfect fires
if "!fire_quality!"=="Perfect" (
    set /a "bonus_chance=!random! %% 100"
    if !bonus_chance! lss 15 (
        echo.
        echo 🎁 BONUS REWARD! Your perfect fire technique earned extra rewards!
        call :add_item "Fire Essence"
        set /a "coins+=25"
        echo You found Fire Essence and 25 coins!
    )
)

echo.
echo The !log_name! logs have been consumed and turned to ashes.
echo Your firemaking skills have improved!
echo.
echo Press any key to continue...
pause >nul
goto :eof

:lumbridge_forest_woodcutting
cls
call :draw_location_header
echo.
echo ========================================
echo         LUMBRIDGE FOREST
echo ========================================
echo.
echo You enter the Lumbridge forest...
timeout /t 1 >nul
echo.
echo Many trees surround you, perfect for woodcutting.
echo You can see different types of trees available for chopping.
echo.

REM Check if player has axe
call :count_item "Axe"
if !item_count! lss 1 (
    echo You need an axe to chop wood!
    echo Visit the shop to buy one.
    echo.
    echo Press any key to return to exploration...
    pause >nul
    goto explore_area
)

echo Choose a tree to chop:
echo.
echo 1. Regular Trees (Level 1+ Woodcutting)
echo    - Gives: Regular Logs (40 XP each)
echo    - Easy to cut, good for beginners
echo.
echo 2. Oak Trees (Level 15+ Woodcutting Required)
echo    - Gives: Oak Logs (60 XP each)
echo    - Harder to cut, better rewards
echo.
echo 3. Back to Lumbridge exploration
echo.
set /p tree_choice="Choose option: "

if "!tree_choice!"=="1" (
    call :chop_regular_trees
) else if "!tree_choice!"=="2" (
    call :chop_oak_trees
) else if "!tree_choice!"=="3" (
    goto explore_area
) else (
    echo Invalid choice!
    pause >nul
    goto lumbridge_forest_woodcutting
)
goto :eof

:chop_regular_trees
echo.
echo You approach a regular tree...
echo You start chopping with your axe...
timeout /t 2 >nul

REM Calculate XP based on woodcutting level
set /a "base_xp=40"
set /a "level_bonus=!woodcutting! / 5"
set /a "total_xp=!base_xp! + !level_bonus!"

echo You successfully chop down the tree!
echo You gained !total_xp! Woodcutting experience!

REM Add XP
set /a "woodcutting_xp+=!total_xp!"
set /a "experience+=!total_xp!"

REM Add logs to inventory
call :add_item "Logs"

REM Check for level up
call :check_level_up woodcutting !woodcutting_xp!

echo.
echo You obtained Regular Logs!
echo.
echo Press any key to continue...
pause >nul
goto lumbridge_forest_woodcutting

:chop_oak_trees
REM Check woodcutting level requirement
if !woodcutting! lss 15 (
    echo.
    echo You need at least level 15 Woodcutting to chop oak trees!
    echo Your current level: !woodcutting!
    echo Required level: 15
    echo.
    echo Press any key to continue...
    pause >nul
    goto lumbridge_forest_woodcutting
)

echo.
echo You approach a sturdy oak tree...
echo You start chopping with your axe...
timeout /t 3 >nul

REM Calculate XP based on woodcutting level
set /a "base_xp=60"
set /a "level_bonus=!woodcutting! / 3"
set /a "total_xp=!base_xp! + !level_bonus!"

echo You successfully chop down the oak tree!
echo You gained !total_xp! Woodcutting experience!

REM Add XP
set /a "woodcutting_xp+=!total_xp!"
set /a "experience+=!total_xp!"

REM Add oak logs to inventory
call :add_item "Oak Logs"

REM Check for level up
call :check_level_up woodcutting !woodcutting_xp!

echo.
echo You obtained Oak Logs!
echo.
echo Press any key to continue...
pause >nul
goto lumbridge_forest_woodcutting

:lumbridge_river_fishing
cls
call :draw_location_header
echo.
echo ========================================
echo         LUMBRIDGE RIVER
echo ========================================
echo.
echo You walk to the river...
timeout /t 1 >nul
echo.
echo Perfect fishing spot! The water looks calm.
echo You can see fish swimming in the clear water.
echo.

REM Check if player has fishing rod
call :count_item "Fishing Rod"
if !item_count! lss 1 (
    echo You need a fishing rod to fish!
    echo Visit the shop to buy one.
    echo.
    echo Press any key to return to exploration...
    pause >nul
    goto explore_area
)

echo Choose your fishing activity:
echo.
echo 1. Fish for Sardines (Level 1+ Fishing)
echo    - Common catch, good for beginners
echo    - Gives: Raw Sardine (25 XP each)
echo.
echo 2. Fish for Trout (Level 15+ Fishing Required)
echo    - Uncommon catch, better rewards
echo    - Gives: Raw Trout (40 XP each)
echo.
echo 3. Fish for Salmon (Level 30+ Fishing Required)
echo    - Rare catch, excellent rewards
echo    - Gives: Raw Salmon (70 XP each)
echo.
echo 4. Cook Raw Fish (Requires Tinderbox + Logs)
echo    - Cook raw fish into edible food
echo    - Gives: Cooking XP + Health restoration
echo.
echo 5. Back to Lumbridge exploration
echo.
set /p fishing_choice="Choose option: "

if "!fishing_choice!"=="1" (
    call :fish_sardines
) else if "!fishing_choice!"=="2" (
    call :fish_trout
) else if "!fishing_choice!"=="3" (
    call :fish_salmon
) else if "!fishing_choice!"=="4" (
    call :cook_fish
) else if "!fishing_choice!"=="5" (
    goto explore_area
) else (
    echo Invalid choice!
    pause >nul
    goto lumbridge_river_fishing
)
goto :eof

:fish_sardines
echo.
echo You cast your line into the river...
echo You wait patiently for a bite...
timeout /t 2 >nul

REM Calculate catch chance and XP
set /a "catch_roll=!random! %% 100"
set /a "base_xp=25"
set /a "level_bonus=!fishing! / 4"
set /a "total_xp=!base_xp! + !level_bonus!"

if !catch_roll! lss 70 (
    echo You feel a tug! You reel in a fish!
    echo You caught a Raw Sardine!
    echo You gained !total_xp! Fishing experience!
    
    REM Add XP
    set /a "fishing_xp+=!total_xp!"
    set /a "experience+=!total_xp!"
    
    REM Add raw fish to inventory
    call :add_item "Raw Sardine"
    
    REM Check for level up
    call :check_level_up fishing !fishing_xp!
) else (
    echo The fish got away! Better luck next time.
    echo You gained 5 Fishing experience for trying.
    set /a "fishing_xp+=5"
    set /a "experience+=5"
)

echo.
echo Press any key to continue...
pause >nul
goto lumbridge_river_fishing

:fish_trout
REM Check fishing level requirement
if !fishing! lss 15 (
    echo.
    echo You need at least level 15 Fishing to catch trout!
    echo Your current level: !fishing!
    echo Required level: 15
    echo.
    echo Press any key to continue...
    pause >nul
    goto lumbridge_river_fishing
)

echo.
echo You cast your line into deeper water...
echo You wait for a larger fish to bite...
timeout /t 3 >nul

REM Calculate catch chance and XP
set /a "catch_roll=!random! %% 100"
set /a "base_xp=40"
set /a "level_bonus=!fishing! / 3"
set /a "total_xp=!base_xp! + !level_bonus!"

if !catch_roll! lss 50 (
    echo You feel a strong tug! You reel in a fish!
    echo You caught a Raw Trout!
    echo You gained !total_xp! Fishing experience!
    
    REM Add XP
    set /a "fishing_xp+=!total_xp!"
    set /a "experience+=!total_xp!"
    
    REM Add raw fish to inventory
    call :add_item "Raw Trout"
    
    REM Check for level up
    call :check_level_up fishing !fishing_xp!
) else (
    echo The trout escaped! They're quite tricky.
    echo You gained 8 Fishing experience for trying.
    set /a "fishing_xp+=8"
    set /a "experience+=8"
)

echo.
echo Press any key to continue...
pause >nul
goto lumbridge_river_fishing

:fish_salmon
REM Check fishing level requirement
if !fishing! lss 30 (
    echo.
    echo You need at least level 30 Fishing to catch salmon!
    echo Your current level: !fishing!
    echo Required level: 30
    echo.
    echo Press any key to continue...
    pause >nul
    goto lumbridge_river_fishing
)

echo.
echo You cast your line into the deepest part of the river...
echo You wait for a prized salmon to bite...
timeout /t 4 >nul

REM Calculate catch chance and XP
set /a "catch_roll=!random! %% 100"
set /a "base_xp=70"
set /a "level_bonus=!fishing! / 2"
set /a "total_xp=!base_xp! + !level_bonus!"

if !catch_roll! lss 30 (
    echo You feel a massive tug! You fight to reel it in!
    echo You caught a Raw Salmon!
    echo You gained !total_xp! Fishing experience!
    
    REM Add XP
    set /a "fishing_xp+=!total_xp!"
    set /a "experience+=!total_xp!"
    
    REM Add raw fish to inventory
    call :add_item "Raw Salmon"
    
    REM Check for level up
    call :check_level_up fishing !fishing_xp!
) else (
    echo The salmon was too strong and broke free!
    echo You gained 12 Fishing experience for trying.
    set /a "fishing_xp+=12"
    set /a "experience+=12"
)

echo.
echo Press any key to continue...
pause >nul
goto lumbridge_river_fishing

:cook_fish
echo.
echo ========================================
echo           COOKING FISH
echo ========================================
echo.

REM Check for tinderbox
call :count_item "Tinderbox"
if !item_count! lss 1 (
    echo You need a tinderbox to cook fish!
    echo Visit the shop to buy one.
    echo.
    echo Press any key to continue...
    pause >nul
    goto lumbridge_river_fishing
)

REM Check for logs
call :count_item "Logs"
if !item_count! lss 1 (
    echo You need logs to make a fire for cooking!
    echo Get some logs from the forest first.
    echo.
    echo Press any key to continue...
    pause >nul
    goto lumbridge_river_fishing
)

echo Choose fish to cook:
echo.
echo 1. Cook Raw Sardine → Cooked Sardine
echo 2. Cook Raw Trout → Cooked Trout
echo 3. Cook Raw Salmon → Cooked Salmon
echo 4. Back to fishing menu
echo.
set /p cook_choice="Choose option: "

if "!cook_choice!"=="1" (
    call :cook_specific_fish "Raw Sardine" "Cooked Sardine" 30
) else if "!cook_choice!"=="2" (
    call :cook_specific_fish "Raw Trout" "Cooked Trout" 50
) else if "!cook_choice!"=="3" (
    call :cook_specific_fish "Raw Salmon" "Cooked Salmon" 90
) else if "!cook_choice!"=="4" (
    goto lumbridge_river_fishing
) else (
    echo Invalid choice!
    pause >nul
    goto cook_fish
)
goto :eof

:cook_specific_fish
REM Parameters: %1 = raw fish name, %2 = cooked fish name, %3 = base XP
set "raw_fish=%~1"
set "cooked_fish=%~2"
set "base_xp=%~3"

REM Check if player has the raw fish
call :count_item "!raw_fish!"
if !item_count! lss 1 (
    echo.
    echo You don't have any !raw_fish! to cook!
    echo Go fishing first to catch some.
    echo.
    echo Press any key to continue...
    pause >nul
    goto cook_fish
)

echo.
echo You light a fire using your tinderbox and logs...
timeout /t 2 >nul
echo You place the !raw_fish! over the fire...
timeout /t 3 >nul

REM Calculate cooking XP
set /a "cooking_bonus=!cooking! / 5"
set /a "total_cooking_xp=!base_xp! + !cooking_bonus!"

REM Check for cooking success (higher cooking level = better success rate)
set /a "cook_roll=!random! %% 100"
set /a "success_chance=60 + !cooking!

if !cook_roll! lss !success_chance! (
    echo You successfully cook the !raw_fish!!
    echo You gained !total_cooking_xp! Cooking experience!
    
    REM Add XP
    set /a "cooking_xp+=!total_cooking_xp!"
    set /a "experience+=!total_cooking_xp!"
    
    REM Remove raw fish and add cooked fish
    call :remove_item "!raw_fish!"
    call :add_item "!cooked_fish!"
    
    REM Remove one log for the fire
    call :remove_item "Logs"
    
    REM Check for level up
    call :check_level_up cooking !cooking_xp!
    
    echo.
    echo You obtained !cooked_fish!!
    echo This fish can now be eaten to restore health!
) else (
    echo You burn the !raw_fish!!
    echo You gained 10 Cooking experience for trying.
    
    REM Add small XP and remove raw fish
    set /a "cooking_xp+=10"
    set /a "experience+=10"
    call :remove_item "!raw_fish!"
    call :remove_item "Logs"

    echo.
    echo The fish is ruined and cannot be eaten.
)

echo.
echo Press any key to continue...
pause >nul
goto lumbridge_river_fishing

REM ============================================
REM     WOLF MOUNTAIN FUNCTIONS
REM ============================================

:wolf_pack_territory
cls
echo.
echo ========================================
echo      WOLF PACK TERRITORY
echo ========================================
echo.
echo You enter the dangerous wolf pack territory...
echo The air is thick with the scent of wolves.
echo You can hear growling and howling in the distance.
echo This is the heart of the wolf pack territory.
echo.
echo [Searching for wolf tracks...]
timeout /t 2 >nul

REM Random encounter chance
set /a "wolf_chance=%random% %% 100"
if !wolf_chance! lss 60 (
    echo.
    echo ⚠️  A pack of wolves emerges from the territory! ⚠️
    echo The alpha wolf leads the pack with fierce determination.
    echo You must fight the entire wolf pack!
    echo.
    echo Press any key to begin combat...
    pause >nul
    
    REM Wolf pack combat
    set "enemy_name=Wolf Pack"
    set "enemy_hp=80"
    set "enemy_attack=6"
    set "enemy_defence=3"
    set "enemy_special=Pack Tactics"
    
    call :start_combat "!enemy_name!" "!enemy_hp!" "!enemy_attack!" "!enemy_defence!" "!enemy_special!"
) else (
    echo.
    echo The wolf pack territory is quiet for now.
    echo You can explore the area safely.
    echo.
    echo You gain 20 Defence experience from exploring the territory.
    
    REM Add experience
    set /a "defence_xp+=20"
    set /a "experience+=20"
    call :check_level_up "defence" "!defence_xp!"
    
    echo.
    echo Press any key to continue...
    pause >nul
    goto explore_area
)
goto :eof

:mountain_caves
cls
echo.
echo ========================================
echo         MOUNTAIN CAVES
echo ========================================
echo.
echo You enter the dark mountain caves...
echo The air is cool and damp inside.
echo You can hear water dripping from stalactites.
echo The caves seem to go deep into the mountain.
echo.
echo [Exploring the cave system...]
timeout /t 2 >nul

REM Random cave encounter
set /a "cave_chance=%random% %% 100"
if !cave_chance! lss 40 (
    echo.
    echo ⚠️  A cave wolf emerges from the shadows! ⚠️
    echo The wolf is larger and more aggressive than surface wolves.
    echo It blocks your path deeper into the caves!
    echo.
    echo Press any key to begin combat...
    pause >nul
    
    REM Cave wolf combat
    set "enemy_name=Cave Wolf"
    set "enemy_hp=45"
    set "enemy_attack=5"
    set "enemy_defence=2"
    set "enemy_special=Cave Ambush"
    
    call :start_combat "!enemy_name!" "!enemy_hp!" "!enemy_attack!" "!enemy_defence!" "!enemy_special!"
) else if !cave_chance! lss 70 (
    echo.
    echo You discover a hidden chamber with ancient markings!
    echo The walls are covered in mysterious symbols.
    echo You gain 30 Mining experience from studying the cave formations.
    
    REM Add experience
    set /a "mining_xp+=30"
    set /a "experience+=30"
    call :check_level_up "mining" "!mining_xp!"
    
    echo.
    echo Press any key to continue...
    pause >nul
    goto explore_area
) else (
    echo.
    echo You explore the caves safely and find some interesting rock formations.
    echo You gain 15 Defence experience from navigating the cave system.
    
    REM Add experience
    set /a "defence_xp+=15"
    set /a "experience+=15"
    call :check_level_up "defence" "!defence_xp!"
    
    echo.
    echo Press any key to continue...
    pause >nul
    goto explore_area
)
goto :eof

:wolf_mountain_mining
cls
echo.
echo ========================================
echo      WOLF MOUNTAIN MINING
echo ========================================
echo.
echo You approach the rich mining spots on Wolf Mountain...
echo The rocks here contain valuable ore deposits.
echo You can see veins of different metals in the mountain walls.
echo.
echo [Examining the mining spots...]
timeout /t 2 >nul

REM Mining success chance based on mining level
set /a "mining_success=!mining! * 10"
set /a "mining_roll=%random% %% 100"

if !mining_roll! lss !mining_success! (
    echo.
    echo You successfully mine some valuable ore!
    echo.
    
    REM Random ore type
    set /a "ore_type=%random% %% 4"
    if !ore_type!==0 (
        echo You found Iron Ore!
        call :add_item "Iron Ore"
        set /a "mining_xp+=25"
    ) else if !ore_type!==1 (
        echo You found Coal!
        call :add_item "Coal"
        set /a "mining_xp+=20"
    ) else if !ore_type!==2 (
        echo You found Silver Ore!
        call :add_item "Silver Ore"
        set /a "mining_xp+=35"
    ) else (
        echo You found Gold Ore!
        call :add_item "Gold Ore"
        set /a "mining_xp+=50"
    )
    
    set /a "experience+=!mining_xp!"
    call :check_level_up "mining" "!mining_xp!"
    
    echo.
    echo Press any key to continue...
    pause >nul
    goto explore_area
) else (
    echo.
    echo You try to mine but the rocks are too hard.
    echo You need a higher Mining level to extract ore from this area.
    echo.
    echo You gain 5 Mining experience for trying.
    
    set /a "mining_xp+=5"
    set /a "experience+=5"
    call :check_level_up "mining" "!mining_xp!"
    
    echo.
    echo Press any key to continue...
    pause >nul
    goto explore_area
)
goto :eof

:wolf_den
cls
echo.
echo ========================================
echo           WOLF DEN
echo ========================================
echo.
echo You approach the dangerous wolf den...
echo This is the alpha wolf's territory.
echo The den is surrounded by bones and wolf tracks.
echo You can hear deep growling from within.
echo.
echo [Approaching the den entrance...]
timeout /t 2 >nul

REM Alpha wolf encounter
set /a "alpha_chance=%random% %% 100"
if !alpha_chance! lss 80 (
    echo.
    echo ⚠️  The Alpha Wolf emerges from the den! ⚠️
    echo This is the leader of the wolf pack!
    echo It's much larger and more dangerous than regular wolves.
    echo.
    echo Press any key to begin combat...
    pause >nul
    
    REM Alpha wolf combat
    set "enemy_name=Alpha Wolf"
    set "enemy_hp=120"
    set "enemy_attack=8"
    set "enemy_defence=4"
    set "enemy_special=Pack Leader"
    
    call :start_combat "!enemy_name!" "!enemy_hp!" "!enemy_attack!" "!enemy_defence!" "!enemy_special!"
) else (
    echo.
    echo The wolf den is empty for now.
    echo You can explore the area safely.
    echo.
    echo You find some wolf pelts and bones.
    echo You gain 25 Defence experience from exploring the den.
    
    REM Add experience and items
    call :add_item "Wolf Pelt"
    call :add_item "Wolf Bone"
    set /a "defence_xp+=25"
    set /a "experience+=25"
    call :check_level_up "defence" "!defence_xp!"
    
    echo.
    echo Press any key to continue...
    pause >nul
    goto explore_area
)
goto :eof

:mountain_peak
cls
echo.
echo ========================================
echo         MOUNTAIN PEAK
echo ========================================
echo.
echo You climb to the highest point of Wolf Mountain...
echo The view from here is breathtaking.
echo You can see for miles in every direction.
echo The air is thin and cold at this altitude.
echo.
echo [Reaching the mountain peak...]
timeout /t 2 >nul

REM High altitude challenges
set /a "peak_chance=%random% %% 100"
if !peak_chance! lss 30 (
    echo.
    echo ⚠️  A Mountain Eagle swoops down to attack! ⚠️
    echo The eagle is defending its territory at the peak.
    echo It's a fierce aerial predator!
    echo.
    echo Press any key to begin combat...
    pause >nul
    
    REM Mountain eagle combat
    set "enemy_name=Mountain Eagle"
    set "enemy_hp=60"
    set "enemy_attack=7"
    set "enemy_defence=3"
    set "enemy_special=Aerial Strike"
    
    call :start_combat "!enemy_name!" "!enemy_hp!" "!enemy_attack!" "!enemy_defence!" "!enemy_special!"
) else if !peak_chance! lss 60 (
    echo.
    echo You discover an ancient shrine at the peak!
    echo The shrine is covered in mysterious runes.
    echo You feel a strange energy emanating from it.
    echo.
    echo You gain 40 Prayer experience from the shrine's power.
    
    REM Add experience
    set /a "prayer_xp+=40"
    set /a "experience+=40"
    call :check_level_up "prayer" "!prayer_xp!"
    
    echo.
    echo Press any key to continue...
    pause >nul
    goto explore_area
) else (
    echo.
    echo You reach the peak safely and enjoy the magnificent view.
    echo The climb was challenging but rewarding.
    echo.
    echo You gain 30 Defence experience from the difficult climb.
    
    REM Add experience
    set /a "defence_xp+=30"
    set /a "experience+=30"
    call :check_level_up "defence" "!defence_xp!"
    
    echo.
    echo Press any key to continue...
    pause >nul
    goto explore_area
)
goto :eof

:wolf_mountain_ruins
cls
echo.
echo ========================================
echo       ANCIENT RUINS
echo ========================================
echo.
echo You discover mysterious ancient ruins on Wolf Mountain...
echo The structures are covered in strange symbols and carvings.
echo They appear to be much older than any human settlement.
echo The air around the ruins feels charged with energy.
echo.
echo [Examining the ancient structures...]
timeout /t 2 >nul

REM Ruins exploration
set /a "ruins_chance=%random% %% 100"
if !ruins_chance! lss 25 (
    echo.
    echo ⚠️  A Guardian Spirit emerges from the ruins! ⚠️
    echo The spirit is protecting the ancient site.
    echo It's a powerful magical entity!
    echo.
    echo Press any key to begin combat...
    pause >nul
    
    REM Guardian spirit combat
    set "enemy_name=Guardian Spirit"
    set "enemy_hp=100"
    set "enemy_attack=9"
    set "enemy_defence=5"
    set "enemy_special=Spirit Blast"
    
    call :start_combat "!enemy_name!" "!enemy_hp!" "!enemy_attack!" "!enemy_defence!" "!enemy_special!"
) else if !ruins_chance! lss 50 (
    echo.
    echo You discover an ancient altar with glowing runes!
    echo The altar radiates powerful magical energy.
    echo You feel your magical abilities enhanced.
    echo.
    echo You gain 50 Magic experience from the altar's power.
    
    REM Add experience
    set /a "magic_xp+=50"
    set /a "experience+=50"
    call :check_level_up "magic" "!magic_xp!"
    
    echo.
    echo Press any key to continue...
    pause >nul
    goto explore_area
) else if !ruins_chance! lss 75 (
    echo.
    echo You find ancient artifacts among the ruins!
    echo These items are valuable and mysterious.
    echo.
    echo You gain: Ancient Rune, Mysterious Crystal, Old Scroll
    
    REM Add items
    call :add_item "Ancient Rune"
    call :add_item "Mysterious Crystal"
    call :add_item "Old Scroll"
    
    echo.
    echo You gain 35 Crafting experience from studying the artifacts.
    
    REM Add experience
    set /a "crafting_xp+=35"
    set /a "experience+=35"
    call :check_level_up "crafting" "!crafting_xp!"
    
    echo.
    echo Press any key to continue...
    pause >nul
    goto explore_area
) else (
    echo.
    echo You explore the ruins safely and learn about their history.
    echo The ancient structures tell stories of a forgotten civilization.
    echo.
    echo You gain 25 Crafting experience from studying the ruins.
    
    REM Add experience
    set /a "crafting_xp+=25"
    set /a "experience+=25"
    call :check_level_up "crafting" "!crafting_xp!"
    
    echo.
    echo Press any key to continue...
    pause >nul
    goto explore_area
)
goto :eof

