@echo off
title TOON-SCAPE - RuneScape in Batch!
color 0A
setlocal enabledelayedexpansion

REM ============================================
REM     TOON-SCAPE - FULL SINGLEPLAYER RUNESCAPE EXPERIENCE
REM ============================================
REM A complete RuneScape-like experience in batch!
REM With ASCII graphics, real combat, and full progression!

REM Initialize random seed for better randomness
set /a "random_seed=%random%"
set "random=!random_seed!"

REM ============================================
REM     RUNECSCAPE FANMADE VERSION 0.0.6
REM ============================================
REM A complete RuneScape-like experience in batch!

REM Initialize game data
if not exist "savegame.dat" (
    REM Create new game save
    set "gamemode=NEWGAME"
    (
    echo !gamemode!^>LUMBRIDGE^>1^>10^>10^>0^>1^>1^>1^>1^>1^>1^>1^>1^>1^>1^>1^>1^>1^>1^>1^>1^>1^>1^>1^>1^>1^>1^>1^>1^>1^>1^>1^>1^>50^>Bronze Sword,Wooden Shield,Bread,Health Potion^>0^>0^>0^>0^>0^>0^>0^>0^>0^>0^>0^>0^>0^>0^>0^>0^>0^>0^>0^>0^>0^>0^>0^>0^>0^>0^>0^>0
    ) > savegame.dat
)

REM Load game data
for /f "tokens=1-28 delims=>" %%a in (savegame.dat) do (
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
    echo !gamemode!^>!location!^>!level!^>!maxhp!^>!currenthp!^>!experience!^>!attack!^>!strength!^>!defence!^>!hitpoints!^>!ranged!^>!magic!^>!woodcutting!^>!fishing!^>!mining!^>!cooking!^>!smithing!^>!crafting!^>!fletching!^>!herblore!^>!prayer!^>!slayer!^>!farming!^>!coins!^>!inventory!^>!quest_cook!
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
echo 9. Travel to Another Location

REM Location-specific options
if "!location!"=="VARROCK" echo 10. Grand Exchange (GE)
if "!location!"=="LUMBRIDGE" echo 10. Player House
if "!location!"=="LUMBRIDGE" echo 11. Crafting Workshop
if "!location!"=="VARROCK" echo 11. Crafting Workshop
if "!location!"=="FALADOR" echo 11. Crafting Workshop
if "!location!"=="ALKHARID" echo 11. Crafting Workshop
if "!location!"=="LUMBRIDGE" echo 12. Bank
if "!location!"=="VARROCK" echo 12. Bank
if "!location!"=="FALADOR" echo 12. Bank
if "!location!"=="ALKHARID" echo 12. Bank
if "!location!"=="MAGETOWER" echo 10. Magic Shop
if "!location!"=="MAGETOWER" echo 11. Chat System
if "!location!"=="MAGETOWER" echo 12. Rune Crafting

echo 0. Save and Exit Game
echo.

REM Set prompt based on available options
if "!location!"=="VARROCK" (
    set /p choice="Choose option (0-12): "
) else if "!location!"=="LUMBRIDGE" (
    set /p choice="Choose option (0-12): "
) else if "!location!"=="MAGETOWER" (
    set /p choice="Choose option (0-12): "
) else (
    set /p choice="Choose option (0-9): "
)

if "%choice%"=="1" goto view_character
if "%choice%"=="2" goto check_skills
if "%choice%"=="3" goto open_inventory
if "%choice%"=="4" goto explore_area
if "%choice%"=="5" goto combat_training
if "%choice%"=="6" goto visit_shop
if "%choice%"=="7" goto train_skills
if "%choice%"=="8" goto quest_log
if "%choice%"=="9" goto travel_menu

REM Handle location-specific options
if "!location!"=="VARROCK" (
    if "%choice%"=="10" goto grand_exchange
    if "%choice%"=="11" goto crafting_workshop
    if "%choice%"=="12" goto bank
) else if "!location!"=="LUMBRIDGE" (
    if "%choice%"=="10" goto player_house
    if "%choice%"=="11" goto crafting_workshop
    if "%choice%"=="12" goto bank
) else if "!location!"=="FALADOR" (
    if "%choice%"=="11" goto crafting_workshop
    if "%choice%"=="12" goto bank
) else if "!location!"=="ALKHARID" (
    if "%choice%"=="11" goto crafting_workshop
    if "%choice%"=="12" goto bank
) else if "!location!"=="MAGETOWER" (
    if "%choice%"=="10" goto magic_shop
    if "%choice%"=="11" goto chat_system
    if "%choice%"=="12" goto rune_crafting
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
echo.
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
echo 2. Special Attack (if available)
echo 3. Cast Magic Spell
echo 4. Eat food to heal
echo 5. Attempt to run away
echo.

set /p combat_choice="Choose action: "

if "%combat_choice%"=="1" (
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

if "%combat_choice%"=="2" (
    REM Special Attack System
    call :special_attack
    goto real_combat
)

if "%combat_choice%"=="3" (
    REM Magic Combat System
    call :cast_magic_spell
    goto real_combat
)

if "%combat_choice%"=="4" (
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

if "%combat_choice%"=="5" (
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

goto real_combat

:special_attack
cls
call :draw_combat_scene
echo.
echo        SPECIAL ATTACKS
echo ========================================
echo.
echo Choose your special attack:
echo.
echo 1. Power Strike (Strength XP +13) - High damage, lower accuracy
echo 2. Charge Attack (Attack XP +25) - Extra damage, uses energy
echo 3. Defensive Stance (Defence XP +25) - Reduce damage, lower attack
echo 4. Counter Attack (Defence XP +20, Attack XP +15) - Strike when dodging
echo 5. Back to combat
echo.
set /p special_choice="Choose special attack: "

if "%special_choice%"=="1" (
    REM Power Strike - High damage, lower accuracy
    echo.
    echo You gather your strength for a powerful strike!
    timeout /t 1 >nul
    echo You unleash a devastating Power Strike!
    
    REM Calculate damage with bonus but lower accuracy
    set /a "power_damage=!attack! + !strength! + 15"
    set /a "accuracy_check=!random! %% 100"
    
    if !accuracy_check! lss 70 (
        echo The attack hits with incredible force!
        echo You deal !power_damage! damage!
        set /a "enemy_currenthp-=!power_damage!"
        
        REM Award Strength XP bonus
        set /a "strength_xp+=13"
        set /a "experience+=20"
        echo You gained 13 Strength experience!
        
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
    ) else (
        echo Your Power Strike misses completely!
        echo The !enemy_name! dodges your attack!
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
    REM Charge Attack - Extra damage, uses energy
    echo.
    echo You charge forward with incredible speed!
    timeout /t 1 >nul
    echo You perform a lightning-fast Charge Attack!
    
    REM Calculate damage with speed bonus
    set /a "charge_damage=!attack! + 20"
    set /a "accuracy_check=!random! %% 100"
    
    if !accuracy_check! lss 80 (
        echo Your charge connects perfectly!
        echo You deal !charge_damage! damage!
        set /a "enemy_currenthp-=!charge_damage!"
        
        REM Award Attack XP bonus
        set /a "attack_xp+=25"
        set /a "experience+=25"
        echo You gained 25 Attack experience!
        
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
        set /a "counter_damage=!attack! + 10"
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
        echo.
        echo You walk to the river...
        timeout /t 1 >nul
        echo Perfect fishing spot! The water looks calm.
        pause >nul
        goto explore_area
    )
    if "!explore_choice!"=="5" (
        echo.
        echo You enter the Lumbridge forest...
        timeout /t 1 >nul
        echo Many trees surround you, perfect for woodcutting.
        pause >nul
        goto explore_area
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
    echo 8. Random encounter
    echo 9. Back to main menu
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
    if "!explore_choice!"=="8" (
        echo.
        echo A White Knight gives you a quest tip!
        echo "Check the quest journal for new adventures."
        pause >nul
        goto explore_area
    )
    if "!explore_choice!"=="9" goto main_menu
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
    echo 6. Random encounter
    echo 7. Back to main menu
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
    if "!explore_choice!"=="6" (
        echo.
        echo You encounter a random event!
        timeout /t 1 >nul
        echo A desert nomad gives you a water skin worth 2 coins!
        set /a "coins+=2"
        echo You gained 2 coins!
        pause >nul
        goto explore_area
    )
    if "!explore_choice!"=="7" goto main_menu
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
    echo 5. Back to main menu
    echo.
    set /p explore_choice="What do you investigate? "
    
    if "!explore_choice!"=="1" (
        echo.
        echo You approach the wilderness wall...
        timeout /t 1 >nul
        echo The wall separates the safe world from danger.
        pause >nul
        goto explore_area
    )
    if "!explore_choice!"=="2" (
        echo.
        echo You encounter dangerous creatures...
        timeout /t 1 >nul
        echo Monsters roam freely in this lawless land.
        pause >nul
        goto explore_area
    )
    if "!explore_choice!"=="3" (
        echo.
        echo You find resource nodes...
        timeout /t 1 >nul
        echo Valuable resources are scattered throughout the wilderness.
        pause >nul
        goto explore_area
    )
    if "!explore_choice!"=="4" (
        echo.
        echo You approach a PvP hotspot...
        timeout /t 1 >nul
        echo This area is known for player combat.
        pause >nul
        goto explore_area
    )
    if "!explore_choice!"=="5" goto main_menu
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
echo 9. Back to main menu
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

if "!travel_choice!"=="9" goto main_menu

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
        echo.
        echo You walk to the river...
        timeout /t 1 >nul
        echo Perfect fishing spot! The water looks calm.
        echo You could catch some fish here.
        echo.
        pause >nul
        goto explore_area
    )

    if "!explore_choice!"=="5" (
        echo.
        echo You enter the Lumbridge forest...
        timeout /t 1 >nul
        echo Many trees surround you, perfect for woodcutting.
        echo You see some low-level trees you could practice on.
        echo.
        pause >nul
        goto explore_area
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

echo Available Quests:
echo.
echo 2. [AVAILABLE] Sheep Shearer
echo    Collect wool from sheep for a farmer
echo    Talk to the farmer north of Lumbridge
echo    Requirements: None
echo    Reward: 60 coins, 150 Crafting XP
echo.
echo 3. [AVAILABLE] Rune Mysteries
echo    Investigate mysterious runes found near Lumbridge
echo    Talk to the wizard in the Wizards' Tower
echo    Requirements: None
echo    Reward: 1,000 XP in all skills
echo.
echo 4. [AVAILABLE] Dragon Slayer
echo    Slay the dragon in Crandor
echo    Talk to the Guildmaster in Champions' Guild
echo    Requirements: Combat level 30+
echo    Reward: Dragon Slayer Cape, 18,650 XP
echo.
echo 5. [AVAILABLE] Lost City
echo    Find the legendary lost city of Zanaris
echo    Talk to the adventurers in Lumbridge
echo    Requirements: Crafting level 31+, Woodcutting level 36+
echo    Reward: Dramen Staff, 5,000 XP
echo.
echo 6. [AVAILABLE] The Restless Ghost
echo    Help a ghost find peace in Lumbridge
echo    Talk to Father Aereck in the Lumbridge Church
echo    Requirements: None
echo    Reward: 125 Prayer XP, Amulet of Ghostspeak
echo.
echo 7. [AVAILABLE] Imp Catcher
echo    Catch imps and return their beads
echo    Talk to Wizard Mizgog in the Wizards' Tower
echo    Requirements: None
echo    Reward: 875 Magic XP, Amulet of Accuracy
echo.
echo [C]omplete Quest - [B]ack to main menu
set /p quest_choice="Choose action: "



if /i "!quest_choice!"=="c" (
    set /p quest_number="Which quest number to complete? "
    if "!quest_number!"=="1" if "%quest_cook%"=="1" (
        call :check_quest_completion
    )
)

if /i "!quest_choice!"=="b" goto main_menu

goto quest_log

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
echo !gamemode!^>!location!^>!level!^>!maxhp!^>!currenthp!^>!experience!^>!attack!^>!strength!^>!defence!^>!hitpoints!^>!ranged!^>!magic!^>!woodcutting!^>!fishing!^>!mining!^>!cooking!^>!smithing!^>!crafting!^>!fletching!^>!herblore!^>!prayer!^>!slayer!^>!farming!^>!firemaking!^>!treasure_hunting!^>!coins!^>!inventory!^>!quest_cook!
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

:special_attack
REM Special Attack System based on equipped weapon
call :get_equipment_bonus
echo.
echo Available Special Attacks:
echo.

if "!inventory!" neq "!inventory:Dragon Scimitar=!" (
    echo 1. Dragon Slice - Double damage attack
    echo 2. Back to normal attack
    set /p spec_choice="Choose special: "
    
    if "!spec_choice!"=="1" (
        echo.
        echo You perform a devastating Dragon Slice!
        timeout /t 1 >nul
        call :calculate_damage attack enemy_defence
        set /a "special_damage=!damage! * 2"
        echo You deal !special_damage! special damage!
        set /a "enemy_currenthp-=!special_damage!"
        
        if !enemy_currenthp! leq 0 (
            echo The !enemy_name! is defeated by your special attack!
            echo You gained 75 combat experience!
            set /a "attack_xp+=30"
            set /a "strength_xp+=25"
            set /a "defence_xp+=15"
            set /a "experience+=75"
            call :check_level_up attack !attack_xp!
            call :check_level_up strength !strength_xp!
            call :random_loot
            pause >nul
            goto combat_training
        )
    )
) else if "!inventory!" neq "!inventory:Rune Scimitar=!" (
    echo 1. Rune Strike - High accuracy attack
    echo 2. Back to normal attack
    set /p spec_choice="Choose special: "
    
    if "!spec_choice!"=="1" (
        echo.
        echo You perform a precise Rune Strike!
        timeout /t 1 >nul
        call :calculate_damage attack enemy_defence
        set /a "special_damage=!damage! + 3"
        echo You deal !special_damage! precise damage!
        set /a "enemy_currenthp-=!special_damage!"
        
        if !enemy_currenthp! leq 0 (
            echo The !enemy_name! falls to your precise strike!
            echo You gained 60 combat experience!
            set /a "attack_xp+=25"
            set /a "strength_xp+=20"
            set /a "experience+=60"
            call :check_level_up attack !attack_xp!
            call :random_loot
            pause >nul
            goto combat_training
        )
    )
) else (
    echo You need a special weapon to use special attacks!
    echo Available at higher-tier shops.
)
echo.
pause >nul
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
REM Check if player has raw fish or meat
call :count_item "Sardine"
set "has_sardine=!item_count!"
call :count_item "Chicken"
set "has_chicken=!item_count!"
call :count_item "Beef"
set "has_beef=!item_count!"

if !has_sardine! equ 0 if !has_chicken! equ 0 if !has_beef! equ 0 (
    echo.
    echo You need raw food to cook!
    echo Try fishing or defeating monsters first.
    echo.
    pause >nul
    goto train_skills
)

echo.
echo You prepare to cook some food...
timeout /t 1 >nul

REM Random cooking success
set /a "cook_success=!random! %% 100"
if !cook_success! lss 80 (
    echo You successfully cook the food!
    echo It looks delicious!
    echo.
    echo You gained 30 Cooking experience!
    set /a "cooking_xp+=30"
    set /a "experience+=30"

    REM Replace raw food with cooked food
    call :cook_food

    call :check_level_up cooking !cooking_xp!
) else (
    echo Oh no! You burn the food!
    echo Better luck next time.
    echo.
    REM Remove the raw food anyway
    call :remove_item "Sardine"
    call :remove_item "Chicken"
    call :remove_item "Beef"
)

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
REM Check if player has logs to burn
call :count_item "Logs"
if !item_count! lss 1 (
    echo.
    echo You need logs to burn for firemaking!
    echo Get some logs from woodcutting first.
    echo.
    pause >nul
    goto train_skills
)

echo.
echo You gather some logs and prepare to light a fire...
timeout /t 2 >nul

REM Firemaking success based on firemaking level
set /a "fire_success=!random! %% 100"
set /a "success_chance=50 + !firemaking! * 2"

if !fire_success! lss !success_chance! (
    echo You successfully light the fire!
    echo The flames dance brightly and you gain ashes.
    echo.
    echo You gained 40 Firemaking experience!

    REM Add ashes to inventory
    if defined inventory (
        set "inventory=!inventory!,Ashes"
    ) else (
        set "inventory=Ashes"
    )

    REM Remove logs
    call :remove_item "Logs"

    set /a "firemaking_xp+=40"
    set /a "experience+=40"
    call :check_level_up firemaking !firemaking_xp!
) else (
    echo The fire fails to light properly.
    echo You lose the logs but gain some experience from trying.
    echo.
    echo You gained 10 Firemaking experience!

    REM Remove logs anyway
    call :remove_item "Logs"

    set /a "firemaking_xp+=10"
    set /a "experience+=10"
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

if "%swamp_choice%"=="1" (
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

if "%swamp_choice%"=="2" (
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

if "%swamp_choice%"=="3" (
    echo.
    echo You make your way back through the swamp...
    timeout /t 1 >nul
    echo You exit the dungeon, relieved to be in fresh air.
    echo.
    pause >nul
    goto explore_area
)

goto deep_swamp_dungeon

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

if "%sewer_choice%"=="1" (
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

if "%sewer_choice%"=="2" (
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

if "%taverley_choice%"=="1" (
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

if "%taverley_choice%"=="2" (
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

if "%taverley_choice%"=="3" (
    echo.
    echo You make your way back to the surface...
    timeout /t 1 >nul
    echo You exit Taverley Dungeon safely.
    echo.
    pause >nul
    goto explore_area
)

goto taverley_dungeon

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

if "%dwarven_choice%"=="1" (
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

if "%dwarven_choice%"=="2" (
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

if "%dwarven_choice%"=="3" (
    echo.
    echo You head back to the surface...
    timeout /t 1 >nul
    echo You exit the Dwarven Mines.
    echo.
    pause >nul
    goto explore_area
)

goto dwarven_mines

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
echo.
echo.   
echo                           TOON-SCAPE - RuneScape in Batch!
echo                             Created by CrypticTM 
echo.
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
) else if /i "!trade_action!"=="b" (
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

