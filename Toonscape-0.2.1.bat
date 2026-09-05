@echo off
setlocal EnableDelayedExpansion
title TOON-SCAPE 0.2.1 - RuneScape in Batch!
color 0A

REM --
REM   TOON-SCAPE 0.2.1 - CrypticTM
REM --
REM   Fixing some of the systems
REM   - Robust inventory UI with numbered actions
REM   - Fishing REQUIRES Fishing Rod
REM   - All major locations, combat, quests, skills restored
REM   - Crash-resistant: variables always initialized
REM   - Clean save/load, no infinite loops, proper exits
REM ============================================================

set "VERSION=0.2.1"
set "MAX_INVENTORY_SLOTS=28"

:start_game
cls
call :show_login_screen
goto :eof

:show_login_screen
cls
color 0A
echo.
echo  ---------------------------------------------------------------------------------------------
echo                    TOON-SCAPE LOGIN
echo                     Version !VERSION!
echo  ========================================================
echo.
echo   Welcome to TOON-SCAPE - RuneScape in Batch!
echo   Fan-made by CrypticTM (not affiliated with Jagex)
echo.
echo  ---------------------------------------------------------------------------------------------
echo.
set /p "username=Username: "
if not defined username set "username=Adventurer"
set /p "password=Password: "
echo.
echo  [Authenticating...]
timeout /t 1 >nul
echo  Welcome, !username!
timeout /t 1 >nul
call :init_game
goto :eof

:init_game
if not exist "savegame.dat" (
    call :create_new_save
) else (
    call :load_save
)

REM Force safe defaults for every critical variable
if not defined gamemode set "gamemode=STARTED"
if not defined location set "location=LUMBRIDGE"
if not defined level set "level=1"
if not defined maxhp set "maxhp=10"
if not defined currenthp set "currenthp=10"
if not defined experience set "experience=0"
if not defined coins set "coins=50"
if not defined inventory set "inventory=Bronze Sword,Wooden Shield,Bread,Health Potion,Tinderbox"
if not defined quest_cook set "quest_cook=0"
if not defined quest_sheep set "quest_sheep=0"
if not defined quest_imp set "quest_imp=0"
if not defined quest_ghost set "quest_ghost=0"
if not defined attack set "attack=1"
if not defined strength set "strength=1"
if not defined defence set "defence=1"
if not defined hitpoints set "hitpoints=1"
if not defined ranged set "ranged=1"
if not defined magic set "magic=1"
if not defined woodcutting set "woodcutting=1"
if not defined fishing set "fishing=1"
if not defined mining set "mining=1"
if not defined cooking set "cooking=1"
if not defined smithing set "smithing=1"
if not defined crafting set "crafting=1"
if not defined fletching set "fletching=1"
if not defined herblore set "herblore=1"
if not defined prayer set "prayer=1"
if not defined slayer set "slayer=1"
if not defined farming set "farming=1"
if not defined firemaking set "firemaking=1"
if not defined treasure_hunting set "treasure_hunting=1"
if not defined fishing_xp set "fishing_xp=0"
if not defined cooking_xp set "cooking_xp=0"
if not defined woodcutting_xp set "woodcutting_xp=0"
if not defined mining_xp set "mining_xp=0"
if not defined prayer_xp set "prayer_xp=0"
if not defined magic_xp set "magic_xp=0"
if not defined attack_xp set "attack_xp=0"
if not defined strength_xp set "strength_xp=0"
if not defined defence_xp set "defence_xp=0"
if not defined hitpoints_xp set "hitpoints_xp=0"
if not defined air_runes set "air_runes=0"
if not defined water_runes set "water_runes=0"
if not defined earth_runes set "earth_runes=0"
if not defined fire_runes set "fire_runes=0"
if not defined mind_runes set "mind_runes=0"
if not defined chaos_runes set "chaos_runes=0"

call :recalc_all_xp
call :calculate_combat_level
call :calculate_total_level

if "!gamemode!"=="NEWGAME" (
    call :new_game_intro
) else (
    call :returning_player_intro
)
goto main_menu

:create_new_save
set "gamemode=NEWGAME"
set "location=LUMBRIDGE"
set "level=1"
set "maxhp=10"
set "currenthp=10"
set "experience=0"
set "attack=1"
set "strength=1"
set "defence=1"
set "hitpoints=1"
set "ranged=1"
set "magic=1"
set "woodcutting=1"
set "fishing=1"
set "mining=1"
set "cooking=1"
set "smithing=1"
set "crafting=1"
set "fletching=1"
set "herblore=1"
set "prayer=1"
set "slayer=1"
set "farming=1"
set "firemaking=1"
set "treasure_hunting=1"
set "coins=50"
set "inventory=Bronze Sword,Wooden Shield,Bread,Health Potion,Tinderbox"
set "quest_cook=0"
set "quest_sheep=0"
set "quest_imp=0"
set "quest_ghost=0"
set "air_runes=0"
set "water_runes=0"
set "earth_runes=0"
set "fire_runes=0"
set "mind_runes=0"
set "chaos_runes=0"
call :save_game
goto :eof

:load_save
REM Safer load - read line by line where possible
set "load_ok=0"
for /f "usebackq tokens=1-30 delims=>" %%a in ("savegame.dat") do (
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
    set "load_ok=1"
)
REM Inventory is harder because of commas - we store it on a second line if present
if exist "inventory.dat" (
    set /p inventory=<inventory.dat
)
if not defined inventory set "inventory=Bronze Sword,Wooden Shield,Bread,Health Potion,Tinderbox"
if not defined quest_cook set "quest_cook=0"
goto :eof

:save_game
(
echo !gamemode!^>!location!^>!level!^>!maxhp!^>!currenthp!^>!experience!^>!attack!^>!strength!^>!defence!^>!hitpoints!^>!ranged!^>!magic!^>!woodcutting!^>!fishing!^>!mining!^>!cooking!^>!smithing!^>!crafting!^>!fletching!^>!herblore!^>!prayer!^>!slayer!^>!farming!^>!firemaking!^>!treasure_hunting!^>!coins!^>!quest_cook!^>!quest_sheep!^>!quest_imp!^>!quest_ghost!
) > savegame.dat
REM Inventory on separate file to avoid comma issues
echo !inventory!>inventory.dat
goto :eof

:new_game_intro
cls
echo.
echo  ========================================================
echo               WELCOME TO TOON-SCAPE !VERSION!
echo  ========================================================
echo.
echo  You awaken in Lumbridge, a peaceful town.
echo  The sun is shining and birds are chirping.
echo.
echo  Starting gold: 50 coins
echo  Starter kit: Bronze Sword, Wooden Shield, Bread,
echo               Health Potion, Tinderbox
echo.
echo  Your progress is auto-saved.
echo.
echo  Press any key to begin your journey...
pause >nul
set "gamemode=STARTED"
call :save_game
goto :eof

:returning_player_intro
cls
echo.
echo  ========================================================
echo              WELCOME BACK, ADVENTURER!
echo  ========================================================
echo.
echo  Save loaded successfully.
echo  Location      : !location!
echo  Combat Level  : !combat_level!
echo  Gold          : !coins! coins
echo  Hitpoints     : !currenthp! / !maxhp!
echo.
echo  Press any key to continue...
pause >nul
goto :eof

REM ============================================================
REM                      MAIN MENU
REM ============================================================
:main_menu
cls
call :draw_header
echo.
echo  Location      : !location!
echo  Combat Level  : !combat_level!   (Total Level: !level!)
echo  Hitpoints     : !currenthp! / !maxhp!
echo  Gold          : !coins! coins
if "!quest_cook!"=="1" echo  Active Quest  : Cook's Assistant
if "!quest_sheep!"=="1" echo  Active Quest  : Sheep Shearer
if "!quest_imp!"=="1" echo  Active Quest  : Imp Catcher
if "!quest_ghost!"=="1" echo  Active Quest  : Restless Ghost
echo.
echo  --------------------------------------------------------
echo   1. Character Stats
echo   2. Skills Overview
echo   3. Inventory          [Improved Numbered UI]
echo   4. Explore Area
echo   5. Combat Training
echo   6. Local Shop
echo   7. Train Skills
echo   8. Quest Journal
echo   9. Magic Journal
echo  10. Quest Hub
echo  11. Travel
echo.
if /i "!location!"=="LUMBRIDGE" (
    echo  12. Player House
    echo  13. Crafting Workshop
    echo  14. Bank
)
if /i "!location!"=="VARROCK" (
    echo  12. Grand Exchange
    echo  13. Crafting Workshop
    echo  14. Bank
)
if /i "!location!"=="FALADOR" (
    echo  12. Crafting Workshop
    echo  13. Bank
)
if /i "!location!"=="ALKHARID" (
    echo  12. Crafting Workshop
    echo  13. Bank
)
if /i "!location!"=="MAGETOWER" (
    echo  12. Magic Shop
    echo  13. Chat System
    echo  14. Rune Crafting
)
if /i "!location!"=="WOLFMOUNTAIN" (
    echo  12. Wolf Pack Territory
    echo  13. Mountain Caves
    echo  14. Mining Spots
)
echo.
echo   0. Save and Exit
echo  --------------------------------------------------------
set /p "choice=Choose option: "

if "%choice%"=="1" goto view_character
if "%choice%"=="2" goto check_skills
if "%choice%"=="3" goto open_inventory
if "%choice%"=="4" goto explore_area
if "%choice%"=="5" goto combat_training
if "%choice%"=="6" goto visit_shop
if "%choice%"=="7" goto train_skills_menu
if "%choice%"=="8" goto quest_log
if "%choice%"=="9" goto magic_journal
if "%choice%"=="10" goto quest_hub
if "%choice%"=="11" goto travel_menu
if "%choice%"=="0" goto exit_game

if /i "!location!"=="LUMBRIDGE" (
    if "%choice%"=="12" goto player_house
    if "%choice%"=="13" goto crafting_workshop
    if "%choice%"=="14" goto bank
)
if /i "!location!"=="VARROCK" (
    if "%choice%"=="12" goto grand_exchange
    if "%choice%"=="13" goto crafting_workshop
    if "%choice%"=="14" goto bank
)
if /i "!location!"=="FALADOR" (
    if "%choice%"=="12" goto crafting_workshop
    if "%choice%"=="13" goto bank
)
if /i "!location!"=="ALKHARID" (
    if "%choice%"=="12" goto crafting_workshop
    if "%choice%"=="13" goto bank
)
if /i "!location!"=="MAGETOWER" (
    if "%choice%"=="12" goto magic_shop
    if "%choice%"=="13" goto chat_system
    if "%choice%"=="14" goto rune_crafting
)
if /i "!location!"=="WOLFMOUNTAIN" (
    if "%choice%"=="12" goto wolf_pack_territory
    if "%choice%"=="13" goto mountain_caves
    if "%choice%"=="14" goto wolf_mountain_mining
)

echo  Invalid choice.
timeout /t 1 >nul
goto main_menu

REM ============================================================
REM                 CHARACTER & SKILLS
REM ============================================================
:view_character
cls
call :draw_header
REM Ensure all stats are valid numbers before display
if not defined username set "username=Adventurer"
if not defined combat_level set "combat_level=1"
if not defined level set "level=1"
if not defined currenthp set "currenthp=10"
if not defined maxhp set "maxhp=10"
if not defined experience set "experience=0"
if not defined attack set "attack=1"
if not defined strength set "strength=1"
if not defined defence set "defence=1"
if not defined hitpoints set "hitpoints=1"
if not defined ranged set "ranged=1"
if not defined magic set "magic=1"
call :calculate_combat_level
call :calculate_total_level
echo.
echo  ========================================================
echo                    CHARACTER STATS
echo  ========================================================
echo.
echo  Name          : !username!
echo  Combat Level  : !combat_level!
echo  Total Level   : !level!
echo  Hitpoints     : !currenthp! / !maxhp!
echo  Total XP      : !experience!
echo.
echo  Combat Stats:
echo    Attack     : !attack!
echo    Strength   : !strength!
echo    Defence    : !defence!
echo    Hitpoints  : !hitpoints!
echo    Ranged     : !ranged!
echo    Magic      : !magic!
echo.
echo  Press any key to return...
pause >nul
goto main_menu

:check_skills
cls
call :draw_header
REM Force safe defaults for every skill + XP before display
if not defined attack set "attack=1"
if not defined strength set "strength=1"
if not defined defence set "defence=1"
if not defined hitpoints set "hitpoints=1"
if not defined ranged set "ranged=1"
if not defined magic set "magic=1"
if not defined woodcutting set "woodcutting=1"
if not defined fishing set "fishing=1"
if not defined mining set "mining=1"
if not defined cooking set "cooking=1"
if not defined smithing set "smithing=1"
if not defined crafting set "crafting=1"
if not defined fletching set "fletching=1"
if not defined herblore set "herblore=1"
if not defined prayer set "prayer=1"
if not defined slayer set "slayer=1"
if not defined farming set "farming=1"
if not defined firemaking set "firemaking=1"
if not defined treasure_hunting set "treasure_hunting=1"
if not defined attack_xp set "attack_xp=0"
if not defined strength_xp set "strength_xp=0"
if not defined defence_xp set "defence_xp=0"
if not defined hitpoints_xp set "hitpoints_xp=0"
if not defined ranged_xp set "ranged_xp=0"
if not defined magic_xp set "magic_xp=0"
if not defined woodcutting_xp set "woodcutting_xp=0"
if not defined fishing_xp set "fishing_xp=0"
if not defined mining_xp set "mining_xp=0"
if not defined cooking_xp set "cooking_xp=0"
if not defined smithing_xp set "smithing_xp=0"
if not defined crafting_xp set "crafting_xp=0"
if not defined fletching_xp set "fletching_xp=0"
if not defined herblore_xp set "herblore_xp=0"
if not defined prayer_xp set "prayer_xp=0"
if not defined slayer_xp set "slayer_xp=0"
if not defined farming_xp set "farming_xp=0"
if not defined firemaking_xp set "firemaking_xp=0"
if not defined treasure_hunting_xp set "treasure_hunting_xp=0"
echo.
echo  ========================================================
echo                    SKILLS OVERVIEW
echo  ========================================================
echo.
echo  --- Combat ---
call :show_skill Attack !attack! !attack_xp!
call :show_skill Strength !strength! !strength_xp!
call :show_skill Defence !defence! !defence_xp!
call :show_skill Hitpoints !hitpoints! !hitpoints_xp!
call :show_skill Ranged !ranged! !ranged_xp!
call :show_skill Magic !magic! !magic_xp!
echo.
echo  --- Gathering ---
call :show_skill Woodcutting !woodcutting! !woodcutting_xp!
call :show_skill Fishing !fishing! !fishing_xp!
call :show_skill Mining !mining! !mining_xp!
call :show_skill Treasure_Hunting !treasure_hunting! !treasure_hunting_xp!
echo.
echo  --- Artisan ---
call :show_skill Cooking !cooking! !cooking_xp!
call :show_skill Smithing !smithing! !smithing_xp!
call :show_skill Crafting !crafting! !crafting_xp!
call :show_skill Fletching !fletching! !fletching_xp!
call :show_skill Herblore !herblore! !herblore_xp!
echo.
echo  --- Support ---
call :show_skill Prayer !prayer! !prayer_xp!
call :show_skill Slayer !slayer! !slayer_xp!
call :show_skill Farming !farming! !farming_xp!
call :show_skill Firemaking !firemaking! !firemaking_xp!
echo.
echo  Press any key to return...
pause >nul
goto main_menu

:show_skill
set "sname=%~1"
set "slvl=%~2"
set "sxp=%~3"
if not defined slvl set "slvl=1"
if "!slvl!"=="" set "slvl=1"
if not defined sxp set "sxp=0"
if "!sxp!"=="" set "sxp=0"
set /a "slvl=!slvl!" 2>nul
set /a "sxp=!sxp!" 2>nul
set /a "snext=!slvl! * 100"
if !snext! lss 100 set "snext=100"
echo    !sname!: Level !slvl!  (!sxp! / !snext! XP)
goto :eof

REM ============================================================
REM              IMPROVED INVENTORY UI
REM ============================================================
:open_inventory
cls
call :draw_header
echo.
echo  ========================================================
echo                       INVENTORY
echo  ========================================================
echo.
call :parse_inventory
echo.
echo  Gold          : !coins! coins
echo  Slots used    : !item_count! / !MAX_INVENTORY_SLOTS!
echo.
echo  --------------------------------------------------------
echo   U = Use item by number
echo   D = Drop item by number
echo   E = Examine item by number
echo   R = Refresh list
echo   B = Back to main menu
echo  --------------------------------------------------------
set /p "inv_choice=Action: "

if /i "!inv_choice!"=="u" goto use_item_ui
if /i "!inv_choice!"=="d" goto drop_item_ui
if /i "!inv_choice!"=="e" goto examine_item_ui
if /i "!inv_choice!"=="r" goto open_inventory
if /i "!inv_choice!"=="b" goto main_menu

echo  Invalid choice.
timeout /t 1 >nul
goto open_inventory

:parse_inventory
set "item_count=0"
if not defined inventory (
    echo   (empty)
    goto :eof
)
set "temp_inv=!inventory!"
:parse_loop
for /f "tokens=1* delims=," %%a in ("!temp_inv!") do (
    set /a "item_count+=1"
    set "inv_item_!item_count!=%%a"
    echo   !item_count!. %%a
    set "temp_inv=%%b"
)
if defined temp_inv if not "!temp_inv!"=="" goto parse_loop
goto :eof

:use_item_ui
echo.
set /p "num=Enter item number to USE: "
call set "selected_item=%%inv_item_!num!%%"
if not defined selected_item (
    echo  Invalid number.
    timeout /t 1 >nul
    goto open_inventory
)
echo.
echo  Selected: !selected_item!
echo.

if /i "!selected_item!"=="Bread" (
    echo  You eat the Bread. +2 Hitpoints.
    set /a "currenthp+=2"
    if !currenthp! gtr !maxhp! set "currenthp=!maxhp!"
    call :remove_item_by_name "Bread"
) else if /i "!selected_item!"=="Health Potion" (
    echo  You drink the Health Potion. +5 Hitpoints.
    set /a "currenthp+=5"
    if !currenthp! gtr !maxhp! set "currenthp=!maxhp!"
    call :remove_item_by_name "Health Potion"
) else if /i "!selected_item!"=="Cooked Sardine" (
    echo  You eat the Cooked Sardine. +3 Hitpoints.
    set /a "currenthp+=3"
    if !currenthp! gtr !maxhp! set "currenthp=!maxhp!"
    call :remove_item_by_name "Cooked Sardine"
) else if /i "!selected_item!"=="Cooked Trout" (
    echo  You eat the Cooked Trout. +5 Hitpoints.
    set /a "currenthp+=5"
    if !currenthp! gtr !maxhp! set "currenthp=!maxhp!"
    call :remove_item_by_name "Cooked Trout"
) else if /i "!selected_item!"=="Cooked Salmon" (
    echo  You eat the Cooked Salmon. +8 Hitpoints.
    set /a "currenthp+=8"
    if !currenthp! gtr !maxhp! set "currenthp=!maxhp!"
    call :remove_item_by_name "Cooked Salmon"
) else if /i "!selected_item!"=="Lobster" (
    echo  You eat the Lobster. +10 Hitpoints.
    set /a "currenthp+=10"
    if !currenthp! gtr !maxhp! set "currenthp=!maxhp!"
    call :remove_item_by_name "Lobster"
) else (
    echo  You cannot use that item right now.
)
echo.
pause
goto open_inventory

:drop_item_ui
echo.
set /p "num=Enter item number to DROP: "
call set "selected_item=%%inv_item_!num!%%"
if not defined selected_item (
    echo  Invalid number.
    timeout /t 1 >nul
    goto open_inventory
)
echo  Dropped: !selected_item!
call :remove_item_by_name "!selected_item!"
echo.
pause
goto open_inventory

:examine_item_ui
echo.
set /p "num=Enter item number to EXAMINE: "
call set "selected_item=%%inv_item_!num!%%"
if not defined selected_item (
    echo  Invalid number.
    timeout /t 1 >nul
    goto open_inventory
)
echo.
echo  Examining: !selected_item!
echo  --------------------------------
if /i "!selected_item!"=="Bronze Sword" echo  A basic bronze sword. Good for early combat.
if /i "!selected_item!"=="Wooden Shield" echo  A simple wooden shield. Provides light defence.
if /i "!selected_item!"=="Bread" echo  A loaf of bread. Restores a little health.
if /i "!selected_item!"=="Health Potion" echo  A red potion that restores health.
if /i "!selected_item!"=="Tinderbox" echo  Used to light fires for cooking and firemaking.
if /i "!selected_item!"=="Fishing Rod" echo  Essential tool for catching fish at rivers and lakes.
if /i "!selected_item!"=="Axe" echo  Used for woodcutting.
if /i "!selected_item!"=="Pickaxe" echo  Used for mining ores.
if /i "!selected_item!"=="Chef's Hat" echo  Reward for completing Cook's Assistant.
if /i "!selected_item!"=="Bones" echo  Remains of a defeated foe. Can be buried for Prayer XP.
echo  --------------------------------
echo.
pause
goto open_inventory

REM ============================================================
REM                 INVENTORY HELPERS
REM ============================================================
:count_item
set "item_count=0"
if not defined inventory goto :eof
if "!inventory!"=="" goto :eof
set "temp=!inventory!"
:count_loop
for /f "tokens=1* delims=," %%a in ("!temp!") do (
    if /i "%%a"=="%~1" set /a "item_count+=1"
    set "temp=%%b"
)
if defined temp if not "!temp!"=="" if not "!temp!"=="," goto count_loop
goto :eof

:add_item
if not defined inventory (
    set "inventory=%~1"
) else (
    set "inventory=!inventory!,%~1"
)
goto :eof

:remove_item_by_name
if not defined inventory goto :eof
set "new_inv="
set "removed=0"
set "temp=!inventory!"
:remove_loop
for /f "tokens=1* delims=," %%a in ("!temp!") do (
    if !removed! equ 0 (
        if /i "%%a"=="%~1" (
            set "removed=1"
        ) else (
            if defined new_inv (
                set "new_inv=!new_inv!,%%a"
            ) else (
                set "new_inv=%%a"
            )
        )
    ) else (
        if defined new_inv (
            set "new_inv=!new_inv!,%%a"
        ) else (
            set "new_inv=%%a"
        )
    )
    set "temp=%%b"
)
if defined temp if not "!temp!"=="" goto remove_loop
set "inventory=!new_inv!"
goto :eof

REM ============================================================
REM          FISHING (REQUIRES FISHING ROD)
REM ============================================================
:lumbridge_river_fishing
cls
call :draw_header
echo.
echo  ========================================================
echo                   LUMBRIDGE RIVER
echo  ========================================================
echo.
echo  The river flows calmly. Perfect for fishing.
echo.

REM Ensure fishing skill is always a valid number
if not defined fishing set "fishing=1"
if "!fishing!"=="" set "fishing=1"
set /a "fishing=!fishing!" 2>nul
if !fishing! lss 1 set "fishing=1"

call :count_item "Fishing Rod"
if not defined item_count set "item_count=0"
if !item_count! lss 1 (
    echo  You need a Fishing Rod to fish here!
    echo  Buy one from the Local Shop (50 coins).
    echo.
    echo  Press any key to return...
    pause >nul
    goto explore_area
)

echo  You have a Fishing Rod. You may fish.
echo.
echo   1. Fish for Sardines   (Level 1+)
echo   2. Fish for Trout      (Level 15+)
echo   3. Fish for Salmon     (Level 30+)
echo   4. Cook raw fish       (needs Tinderbox + Logs)
echo   5. Back to exploration
echo.
set /p "fc=Choice: "

if "!fc!"=="1" goto fish_sardines
if "!fc!"=="2" goto fish_trout
if "!fc!"=="3" goto fish_salmon
if "!fc!"=="4" goto cook_fish_menu
if "!fc!"=="5" goto explore_area
echo  Invalid choice.
timeout /t 1 >nul
goto lumbridge_river_fishing

:fish_sardines
echo.
echo  Casting your line...
timeout /t 2 >nul
set /a "roll=%random% %% 100"
set /a "xp=25 + fishing / 4"
if !roll! lss 70 (
    echo  You catch a Raw Sardine!
    call :add_item "Raw Sardine"
    set /a "fishing_xp+=xp"
    set /a "experience+=xp"
    echo  +!xp! Fishing XP
    call :check_level_up fishing !fishing_xp!
) else (
    echo  The fish got away.
    set /a "fishing_xp+=5"
    set /a "experience+=5"
)
echo.
pause
goto lumbridge_river_fishing

:fish_trout
if !fishing! lss 15 (
    echo  You need Fishing level 15 to catch trout.
    echo  Your current level: !fishing!
    pause
    goto lumbridge_river_fishing
)
echo.
echo  Casting into deeper water...
timeout /t 2 >nul
set /a "roll=%random% %% 100"
set /a "xp=40 + fishing / 3"
if !roll! lss 50 (
    echo  You catch a Raw Trout!
    call :add_item "Raw Trout"
    set /a "fishing_xp+=xp"
    set /a "experience+=xp"
    echo  +!xp! Fishing XP
    call :check_level_up fishing !fishing_xp!
) else (
    echo  The trout escaped.
    set /a "fishing_xp+=8"
    set /a "experience+=8"
)
echo.
pause
goto lumbridge_river_fishing

:fish_salmon
if !fishing! lss 30 (
    echo  You need Fishing level 30 to catch salmon.
    echo  Your current level: !fishing!
    pause
    goto lumbridge_river_fishing
)
echo.
echo  Casting into the deepest pool...
timeout /t 3 >nul
set /a "roll=%random% %% 100"
set /a "xp=70 + fishing / 2"
if !roll! lss 30 (
    echo  You catch a Raw Salmon!
    call :add_item "Raw Salmon"
    set /a "fishing_xp+=xp"
    set /a "experience+=xp"
    echo  +!xp! Fishing XP
    call :check_level_up fishing !fishing_xp!
) else (
    echo  The salmon was too strong.
    set /a "fishing_xp+=12"
    set /a "experience+=12"
)
echo.
pause
goto lumbridge_river_fishing

:cook_fish_menu
call :count_item "Tinderbox"
if not defined item_count set "item_count=0"
if !item_count! lss 1 (
    echo  You need a Tinderbox to cook.
    pause
    goto lumbridge_river_fishing
)
call :count_item "Logs"
if not defined item_count set "item_count=0"
if !item_count! lss 1 (
    echo  You need Logs to make a fire.
    pause
    goto lumbridge_river_fishing
)
echo.
echo   1. Cook Raw Sardine
echo   2. Cook Raw Trout
echo   3. Cook Raw Salmon
echo   4. Back
set /p "cc=Choice: "
if "!cc!"=="1" call :cook_one "Raw Sardine" "Cooked Sardine" 30
if "!cc!"=="2" call :cook_one "Raw Trout" "Cooked Trout" 50
if "!cc!"=="3" call :cook_one "Raw Salmon" "Cooked Salmon" 90
if "!cc!"=="4" goto lumbridge_river_fishing
goto lumbridge_river_fishing

:cook_one
set "raw=%~1"
set "cooked=%~2"
set "base_xp=%~3"
if not defined cooking set "cooking=1"
call :count_item "!raw!"
if not defined item_count set "item_count=0"
if !item_count! lss 1 (
    echo  You have no !raw!.
    pause
    goto :eof
)
echo  Lighting fire and cooking...
timeout /t 2 >nul
set /a "success=60 + cooking"
set /a "roll=%random% %% 100"
if !roll! lss !success! (
    echo  Successfully cooked !cooked!!
    call :remove_item_by_name "!raw!"
    call :add_item "!cooked!"
    call :remove_item_by_name "Logs"
    set /a "cooking_xp+=base_xp"
    set /a "experience+=base_xp"
    call :check_level_up cooking !cooking_xp!
) else (
    echo  You burned the fish.
    call :remove_item_by_name "!raw!"
    call :remove_item_by_name "Logs"
    set /a "cooking_xp+=10"
    set /a "experience+=10"
)
echo.
pause
goto :eof

REM ============================================================
REM                      COMBAT
REM ============================================================
:combat_training
cls
call :draw_header
echo.
echo  ========================================================
echo                 COMBAT TRAINING GROUND
echo  ========================================================
echo.
echo   1. Training Dummy (safe XP)
echo   2. Fight Goblin
echo   3. Fight Giant Rat
echo   4. Fight Chicken
echo   5. Fight Cow (slightly harder)
echo   6. Back
echo.
set /p "tc=Choice: "
if "%tc%"=="1" goto dummy_training
if "%tc%"=="2" (
    set "enemy_name=Goblin"
    set "enemy_level=1"
    set "enemy_maxhp=10"
    set "enemy_currenthp=10"
    set "enemy_attack=1"
    set "enemy_defence=1"
    goto real_combat
)
if "%tc%"=="3" (
    set "enemy_name=Giant Rat"
    set "enemy_level=1"
    set "enemy_maxhp=8"
    set "enemy_currenthp=8"
    set "enemy_attack=1"
    set "enemy_defence=0"
    goto real_combat
)
if "%tc%"=="4" (
    set "enemy_name=Chicken"
    set "enemy_level=1"
    set "enemy_maxhp=3"
    set "enemy_currenthp=3"
    set "enemy_attack=0"
    set "enemy_defence=0"
    goto real_combat
)
if "%tc%"=="5" (
    set "enemy_name=Cow"
    set "enemy_level=2"
    set "enemy_maxhp=14"
    set "enemy_currenthp=14"
    set "enemy_attack=2"
    set "enemy_defence=1"
    goto real_combat
)
if "%tc%"=="6" goto main_menu
goto combat_training

:dummy_training
cls
echo  Training Dummy
echo   1. Attack practice (+25 Attack XP)
echo   2. Strength training (+25 Strength XP)
echo   3. Defence practice (+25 Defence XP)
echo   4. Back
set /p "dc=Choice: "
if "%dc%"=="1" (
    set /a "attack_xp+=25"
    set /a "experience+=25"
    call :check_level_up attack !attack_xp!
    echo  +25 Attack XP
)
if "%dc%"=="2" (
    set /a "strength_xp+=25"
    set /a "experience+=25"
    call :check_level_up strength !strength_xp!
    echo  +25 Strength XP
)
if "%dc%"=="3" (
    set /a "defence_xp+=25"
    set /a "experience+=25"
    call :check_level_up defence !defence_xp!
    echo  +25 Defence XP
)
if "%dc%"=="4" goto combat_training
pause
goto dummy_training

:real_combat
REM Safety defaults for enemy + player
if not defined enemy_name set "enemy_name=Foe"
if not defined enemy_maxhp set "enemy_maxhp=10"
if not defined enemy_currenthp set "enemy_currenthp=!enemy_maxhp!"
if not defined enemy_attack set "enemy_attack=1"
if not defined enemy_defence set "enemy_defence=0"
if not defined attack set "attack=1"
if not defined defence set "defence=1"
if not defined currenthp set "currenthp=10"
if not defined maxhp set "maxhp=10"
if not defined attack_xp set "attack_xp=0"
if not defined strength_xp set "strength_xp=0"
if not defined defence_xp set "defence_xp=0"
if not defined hitpoints_xp set "hitpoints_xp=0"

cls
call :draw_header
echo.
echo  ========================================================
echo                   COMBAT: !enemy_name!
echo  ========================================================
echo  Enemy HP: !enemy_currenthp! / !enemy_maxhp!
echo  Your HP : !currenthp! / !maxhp!
echo.
echo   1. Attack
echo   2. Special Attack (requires weapon)
echo   3. Cast Magic
echo   4. Eat food
echo   5. Run away
echo.
set /p "cc=Action: "

if "!cc!"=="1" goto combat_attack
if "!cc!"=="2" goto combat_special
if "!cc!"=="3" goto combat_magic
if "!cc!"=="4" goto combat_eat
if "!cc!"=="5" goto combat_run
echo  Invalid choice.
timeout /t 1 >nul
goto real_combat

:combat_attack
call :calculate_damage_direct !attack! !enemy_defence!
set "player_damage=!damage!"
if !player_damage! gtr 0 (
    echo  You hit for !player_damage! damage!
    set /a "enemy_currenthp-=player_damage"
    if !enemy_currenthp! leq 0 goto combat_victory
) else (
    echo  Your attack missed!
)
REM Enemy retaliates
if !enemy_currenthp! gtr 0 (
    call :calculate_damage_direct !enemy_attack! !defence!
    if !damage! gtr 0 (
        echo  !enemy_name! hits you for !damage! damage!
        set /a "currenthp-=damage"
        if !currenthp! leq 0 goto combat_defeat
    ) else (
        echo  !enemy_name! missed!
    )
)
echo.
pause
goto real_combat

:combat_special
call :count_item "Bronze Sword"
set "has_weapon=!item_count!"
call :count_item "Iron Sword"
set /a "has_weapon+=item_count"
call :count_item "Steel Sword"
set /a "has_weapon+=item_count"
if !has_weapon! lss 1 (
    echo  You need a sword equipped for special attacks.
    pause
    goto real_combat
)
echo  You perform a powerful special attack!
call :calculate_damage_direct !attack! !enemy_defence!
set /a "player_damage=damage + 6 + attack / 2"
echo  You deal !player_damage! damage!
set /a "enemy_currenthp-=player_damage"
set /a "strength_xp+=15"
set /a "attack_xp+=10"
set /a "experience+=20"
if !enemy_currenthp! leq 0 goto combat_victory
REM Enemy still hits back after special
call :calculate_damage_direct !enemy_attack! !defence!
if !damage! gtr 0 (
    echo  !enemy_name! hits you for !damage! damage!
    set /a "currenthp-=damage"
    if !currenthp! leq 0 goto combat_defeat
)
echo.
pause
goto real_combat

:combat_magic
call :cast_magic_in_combat
if !enemy_currenthp! leq 0 goto combat_victory
goto real_combat

:combat_eat
call :count_item "Bread"
if !item_count! gtr 0 (
    echo  You eat Bread (+2 HP)
    set /a "currenthp+=2"
    if !currenthp! gtr !maxhp! set "currenthp=!maxhp!"
    call :remove_item_by_name "Bread"
) else (
    call :count_item "Health Potion"
    if !item_count! gtr 0 (
        echo  You drink a Health Potion (+5 HP)
        set /a "currenthp+=5"
        if !currenthp! gtr !maxhp! set "currenthp=!maxhp!"
        call :remove_item_by_name "Health Potion"
    ) else (
        call :count_item "Cooked Sardine"
        if !item_count! gtr 0 (
            echo  You eat Cooked Sardine (+3 HP)
            set /a "currenthp+=3"
            if !currenthp! gtr !maxhp! set "currenthp=!maxhp!"
            call :remove_item_by_name "Cooked Sardine"
        ) else (
            call :count_item "Cooked Trout"
            if !item_count! gtr 0 (
                echo  You eat Cooked Trout (+5 HP)
                set /a "currenthp+=5"
                if !currenthp! gtr !maxhp! set "currenthp=!maxhp!"
                call :remove_item_by_name "Cooked Trout"
            ) else (
                echo  No food or potions available.
            )
        )
    )
)
echo.
pause
goto real_combat

:combat_run
set /a "run=%random% %% 100"
if !run! lss 65 (
    echo  You successfully escaped!
    pause
    goto combat_training
) else (
    echo  Failed to escape! The enemy attacks!
    call :calculate_damage_direct !enemy_attack! !defence!
    if !damage! gtr 0 (
        echo  You take !damage! damage!
        set /a "currenthp-=damage"
        if !currenthp! leq 0 goto combat_defeat
    )
    pause
    goto real_combat
)

:combat_victory
echo.
echo  ========================================
echo   You defeated the !enemy_name!!
echo  ========================================
set /a "attack_xp+=20"
set /a "strength_xp+=15"
set /a "defence_xp+=10"
set /a "hitpoints_xp+=8"
set /a "experience+=50"
call :check_level_up attack !attack_xp!
call :check_level_up strength !strength_xp!
call :check_level_up defence !defence_xp!
call :check_level_up hitpoints !hitpoints_xp!
call :random_loot
call :save_game
echo.
pause
REM Return to appropriate place
if /i "!location!"=="WILDERNESS" (
    goto explore_area
) else (
    goto combat_training
)

:combat_defeat
echo.
echo  ========================================
echo   You were defeated!
echo  ========================================
echo  You lose 10 coins and wake up at the Lumbridge respawn.
set /a "coins-=10"
if !coins! lss 0 set "coins=0"
set "currenthp=1"
set "location=LUMBRIDGE"
call :save_game
echo.
pause
goto main_menu

:cast_magic_in_combat
if not defined magic set "magic=1"
if not defined air_runes set "air_runes=0"
if not defined water_runes set "water_runes=0"
if not defined mind_runes set "mind_runes=0"
if not defined magic_xp set "magic_xp=0"
echo.
echo  Magic Spellbook
echo   1. Wind Strike (1 Air + 1 Mind)
echo   2. Water Strike (1 Water + 1 Mind)
echo   3. Back
set /p "mc=Spell: "
if "!mc!"=="1" (
    if !air_runes! geq 1 if !mind_runes! geq 1 (
        set /a "air_runes-=1"
        set /a "mind_runes-=1"
        set /a "mag_dmg=4 + magic / 3"
        echo  You cast Wind Strike for !mag_dmg! damage!
        set /a "enemy_currenthp-=mag_dmg"
        set /a "magic_xp+=15"
        set /a "experience+=15"
        call :check_level_up magic !magic_xp!
    ) else (
        echo  Not enough runes (need 1 Air + 1 Mind).
    )
)
if "!mc!"=="2" (
    if !water_runes! geq 1 if !mind_runes! geq 1 (
        set /a "water_runes-=1"
        set /a "mind_runes-=1"
        set /a "mag_dmg=5 + magic / 3"
        echo  You cast Water Strike for !mag_dmg! damage!
        set /a "enemy_currenthp-=mag_dmg"
        set /a "magic_xp+=18"
        set /a "experience+=18"
        call :check_level_up magic !magic_xp!
    ) else (
        echo  Not enough runes (need 1 Water + 1 Mind).
    )
)
if "!mc!"=="3" goto :eof
REM Victory is handled by the caller checking enemy_currenthp
echo.
pause
goto :eof

:random_loot
set /a "loot=%random% %% 100"
if !loot! lss 30 (
    echo  Loot: 5 coins
    set /a "coins+=5"
) else if !loot! lss 50 (
    echo  Loot: Bones
    call :add_item "Bones"
) else if !loot! lss 70 (
    echo  Loot: 10 coins
    set /a "coins+=10"
) else if !loot! lss 85 (
    echo  Loot: Raw Chicken
    call :add_item "Raw Chicken"
) else if !loot! lss 95 (
    echo  Loot: 15 coins
    set /a "coins+=15"
) else (
    echo  Loot: Nothing this time.
)
goto :eof

:calculate_damage_direct
REM Safe damage calc - parameters are attack and defence values
set "atk_in=%~1"
set "def_in=%~2"
if not defined atk_in set "atk_in=1"
if not defined def_in set "def_in=0"
if "!atk_in!"=="" set "atk_in=1"
if "!def_in!"=="" set "def_in=0"
set /a "attack_power=atk_in + (%random% %% 5)"
set /a "defence_power=def_in + (%random% %% 3)"
set /a "damage=attack_power - defence_power"
if !damage! lss 0 set "damage=0"
if !damage! gtr 18 set "damage=18"
goto :eof

REM ============================================================
REM                     EXPLORE AREA
REM ============================================================
:explore_area
cls
call :draw_header
echo.
echo  ========================================================
echo                 EXPLORING !location!
echo  ========================================================
echo.

if /i "!location!"=="LUMBRIDGE" goto explore_lumbridge
if /i "!location!"=="VARROCK" goto explore_varrock
if /i "!location!"=="FALADOR" goto explore_falador
if /i "!location!"=="ALKHARID" goto explore_alkharid
if /i "!location!"=="DRAYNOR" goto explore_draynor
if /i "!location!"=="PORTSARIM" goto explore_portsarim
if /i "!location!"=="MAGETOWER" goto explore_magetower
if /i "!location!"=="WILDERNESS" goto explore_wilderness
if /i "!location!"=="WOLFMOUNTAIN" goto explore_wolfmountain

echo  Nothing special here.
pause
goto main_menu

:explore_lumbridge
echo   1. Castle (Cook's Assistant)
echo   2. Church (Prayer XP)
echo   3. Windmill (Flour)
echo   4. River (Fishing - requires rod)
echo   5. Forest (Woodcutting)
echo   6. Chicken Coop (Egg)
echo   7. Dairy Farm (Milk)
echo   8. Mining Site
echo   9. Lumbridge Catacombs
echo  10. Deep Swamp Dungeon
echo  11. Treasure Hunting
echo  12. Random encounter
echo  13. Back
set /p "ec=Investigate: "
if "!ec!"=="1" call :lumbridge_castle
if "!ec!"=="2" (
    echo  You pray at the church. +15 Prayer XP
    set /a "prayer_xp+=15"
    set /a "experience+=15"
    call :check_level_up prayer !prayer_xp!
    pause
)
if "!ec!"=="3" call :get_flour
if "!ec!"=="4" goto lumbridge_river_fishing
if "!ec!"=="5" call :lumbridge_forest_woodcutting
if "!ec!"=="6" call :get_egg
if "!ec!"=="7" call :get_milk
if "!ec!"=="8" call :lumbridge_mining
if "!ec!"=="9" call :lumbridge_catacombs
if "!ec!"=="10" call :deep_swamp_dungeon
if "!ec!"=="11" call :lumbridge_treasure_hunting
if "!ec!"=="12" call :random_encounter_lumbridge
if "!ec!"=="13" goto main_menu
goto explore_area

:lumbridge_castle
echo.
echo  You approach the baker in Lumbridge Castle.
echo  "I've run out of ingredients for the Duke's birthday cake!"
echo  "I need an Egg, a Pot of Flour, and a Bucket of Milk."
if "!quest_cook!"=="0" (
    set /p "q=Help the cook? (Y/N): "
    if /i "!q!"=="Y" (
        set "quest_cook=1"
        echo  Quest started: Cook's Assistant
        call :save_game
    )
) else if "!quest_cook!"=="1" (
    call :count_item "Egg"
    set "has_egg=!item_count!"
    call :count_item "Pot of Flour"
    set "has_flour=!item_count!"
    call :count_item "Bucket of Milk"
    set "has_milk=!item_count!"
    if !has_egg! gtr 0 if !has_flour! gtr 0 if !has_milk! gtr 0 (
        echo  You deliver all the ingredients!
        echo  Quest complete! +300 Cooking XP, +500 coins, Chef's Hat
        set /a "cooking_xp+=300"
        set /a "experience+=300"
        set /a "coins+=500"
        call :add_item "Chef's Hat"
        call :remove_item_by_name "Egg"
        call :remove_item_by_name "Pot of Flour"
        call :remove_item_by_name "Bucket of Milk"
        set "quest_cook=2"
        call :check_level_up cooking !cooking_xp!
        call :save_game
    ) else (
        echo  Still missing some ingredients.
        echo  Egg: !has_egg!  Flour: !has_flour!  Milk: !has_milk!
    )
) else (
    echo  The cook is very grateful for your help.
)
pause
goto :eof

:get_flour
call :count_item "Pot of Flour"
if !item_count! gtr 0 (
    echo  You already have flour.
) else (
    echo  You take a Pot of Flour from the windmill.
    call :add_item "Pot of Flour"
)
pause
goto :eof

:get_egg
call :count_item "Egg"
if !item_count! gtr 0 (
    echo  You already have an egg.
) else (
    echo  You find a fresh Egg in the chicken coop.
    call :add_item "Egg"
)
pause
goto :eof

:get_milk
call :count_item "Bucket of Milk"
if !item_count! gtr 0 (
    echo  You already have milk.
) else (
    echo  You collect a Bucket of Milk from the dairy.
    call :add_item "Bucket of Milk"
)
pause
goto :eof

:lumbridge_forest_woodcutting
call :count_item "Axe"
if !item_count! lss 1 (
    echo  You need an Axe. Buy one from the shop.
    pause
    goto :eof
)
echo  Chopping trees...
timeout /t 2 >nul
set /a "xp=40 + !woodcutting! / 5"
echo  You get Logs. +!xp! Woodcutting XP
call :add_item "Logs"
set /a "woodcutting_xp+=!xp!"
set /a "experience+=!xp!"
call :check_level_up woodcutting !woodcutting_xp!
pause
goto :eof

:lumbridge_mining
call :count_item "Pickaxe"
if !item_count! lss 1 (
    echo  You need a Pickaxe.
    pause
    goto :eof
)
echo  Mining...
timeout /t 2 >nul
set /a "ore=!random! %% 100"
if !ore! lss 50 (
    call :add_item "Copper Ore"
    echo  Mined Copper Ore. +25 Mining XP
) else if !ore! lss 80 (
    call :add_item "Tin Ore"
    echo  Mined Tin Ore. +25 Mining XP
) else (
    call :add_item "Iron Ore"
    echo  Mined Iron Ore. +35 Mining XP
    set /a "mining_xp+=10"
)
set /a "mining_xp+=25"
set /a "experience+=25"
call :check_level_up mining !mining_xp!
pause
goto :eof

:lumbridge_treasure_hunting
echo  Searching for hidden treasures around Lumbridge...
timeout /t 2 >nul
set /a "roll=!random! %% 100"
set /a "chance=50 + !treasure_hunting! * 3"
if !roll! lss !chance! (
    set /a "c=!random! %% 15 + 5"
    echo  Found !c! coins!
    set /a "coins+=!c!"
    set /a "treasure_hunting_xp+=20"
    set /a "experience+=20"
) else (
    echo  Nothing of value this time.
    set /a "treasure_hunting_xp+=5"
    set /a "experience+=5"
)
call :check_level_up treasure_hunting !treasure_hunting_xp!
pause
goto :eof

:lumbridge_catacombs
echo.
echo  You enter the dark Lumbridge Catacombs...
echo  Dangerous undead lurk here.
echo  [Y] Enter further  [N] Leave
set /p "d=Choice: "
if /i "!d!"=="Y" (
    echo  You fight a skeleton!
    set "enemy_name=Skeleton"
    set "enemy_level=5"
    set "enemy_maxhp=20"
    set "enemy_currenthp=20"
    set "enemy_attack=3"
    set "enemy_defence=2"
    goto real_combat
)
goto :eof

:deep_swamp_dungeon
echo.
echo  The Deep Swamp Dungeon looks extremely dangerous.
echo  [Y] Enter  [N] Leave
set /p "d=Choice: "
if /i "!d!"=="Y" (
    echo  You encounter a giant frog!
    set "enemy_name=Giant Frog"
    set "enemy_level=8"
    set "enemy_maxhp=30"
    set "enemy_currenthp=30"
    set "enemy_attack=4"
    set "enemy_defence=2"
    goto real_combat
)
goto :eof

:random_encounter_lumbridge
set /a "enc=!random! %% 4"
if !enc! equ 0 goto goblin_quick
if !enc! equ 1 goto rat_quick
if !enc! equ 2 (
    echo  You find a coin on the ground! +1 gold
    set /a "coins+=1"
    pause
)
if !enc! equ 3 (
    echo  A friendly local gives you 5 coins.
    set /a "coins+=5"
    pause
)
goto :eof

:goblin_quick
set "enemy_name=Goblin"
set "enemy_level=1"
set "enemy_maxhp=10"
set "enemy_currenthp=10"
set "enemy_attack=1"
set "enemy_defence=1"
goto real_combat

:rat_quick
set "enemy_name=Giant Rat"
set "enemy_level=1"
set "enemy_maxhp=8"
set "enemy_currenthp=8"
set "enemy_attack=1"
set "enemy_defence=0"
goto real_combat

:explore_varrock
echo   1. Castle
echo   2. Church (+20 Prayer XP)
echo   3. Market
echo   4. Museum (+15 XP)
echo   5. Wilderness Wall
echo   6. Varrock Sewers
echo   7. Random event
echo   8. Back
set /p "ec=Investigate: "
if "!ec!"=="2" (
    echo  You pray. +20 Prayer XP
    set /a "prayer_xp+=20"
    set /a "experience+=20"
    call :check_level_up prayer !prayer_xp!
    pause
)
if "!ec!"=="4" (
    echo  Interesting artifacts. +15 XP
    set /a "experience+=15"
    pause
)
if "!ec!"=="6" (
    echo  You enter the sewers...
    set "enemy_name=Sewer Rat"
    set "enemy_level=3"
    set "enemy_maxhp=15"
    set "enemy_currenthp=15"
    set "enemy_attack=2"
    set "enemy_defence=1"
    goto real_combat
)
if "!ec!"=="7" (
    echo  A merchant gives you 10 coins!
    set /a "coins+=10"
    pause
)
if "!ec!"=="8" goto main_menu
echo  Exploring Varrock...
pause
goto explore_area

:explore_falador
echo   1. Castle (White Knights)
echo   2. Monastery (+25 Prayer XP)
echo   3. Marketplace
echo   4. Mining Guild (+20 Mining XP)
echo   5. Party Room
echo   6. Taverley Dungeon
echo   7. Dwarven Mines
echo   8. Back
set /p "ec=Investigate: "
if "!ec!"=="2" (
    echo  Peaceful prayer. +25 Prayer XP
    set /a "prayer_xp+=25"
    set /a "experience+=25"
    call :check_level_up prayer !prayer_xp!
    pause
)
if "!ec!"=="4" (
    echo  You learn mining techniques. +20 Mining XP
    set /a "mining_xp+=20"
    set /a "experience+=20"
    call :check_level_up mining !mining_xp!
    pause
)
if "!ec!"=="6" (
    echo  Taverley Dungeon is dangerous...
    set "enemy_name=Blue Dragon"
    set "enemy_level=15"
    set "enemy_maxhp=50"
    set "enemy_currenthp=50"
    set "enemy_attack=8"
    set "enemy_defence=5"
    goto real_combat
)
if "!ec!"=="8" goto main_menu
echo  Exploring Falador...
pause
goto explore_area

:explore_alkharid
echo   1. Palace
echo   2. Duel Arena (+15 Attack XP)
echo   3. Scorpion Pit
echo   4. Mining Site
echo   5. Desert
echo   6. Back
set /p "ec=Investigate: "
if "!ec!"=="2" (
    echo  You watch the duels. +15 Attack XP
    set /a "attack_xp+=15"
    set /a "experience+=15"
    call :check_level_up attack !attack_xp!
    pause
)
if "!ec!"=="6" goto main_menu
echo  Exploring Al Kharid...
pause
goto explore_area

:explore_draynor
echo   1. Village
echo   2. Draynor Manor
echo   3. Farming fields
echo   4. Swamp
echo   5. Back
set /p "ec=Investigate: "
if "!ec!"=="5" goto main_menu
echo  Exploring Draynor...
pause
goto explore_area

:explore_portsarim
echo   1. Docks
echo   2. Shipyard
echo   3. Harbor (Fishing tips)
echo   4. Marketplace
echo   5. Beach
echo   6. Back
set /p "ec=Investigate: "
if "!ec!"=="6" goto main_menu
echo  Exploring Port Sarim...
pause
goto explore_area

:explore_magetower
echo   1. Library (+30 Magic XP)
echo   2. Training Room (+25 Magic XP)
echo   3. Rune Altar
echo   4. Tower Top
echo   5. Mage Shop
echo   6. Chat with mages
echo   7. Back
set /p "ec=Investigate: "
if "!ec!"=="1" (
    echo  Ancient knowledge. +30 Magic XP
    set /a "magic_xp+=30"
    set /a "experience+=30"
    call :check_level_up magic !magic_xp!
    pause
)
if "!ec!"=="2" (
    echo  You practice spells. +25 Magic XP
    set /a "magic_xp+=25"
    set /a "experience+=25"
    call :check_level_up magic !magic_xp!
    pause
)
if "!ec!"=="7" goto main_menu
echo  Exploring the Mage Tower...
pause
goto explore_area

:explore_wilderness
cls
call :draw_header
echo.
echo  ========================================================
echo                    THE WILDERNESS
echo  ========================================================
echo.
echo  A dangerous land where player killers and monsters roam.
echo  Death here means losing coins and items. Stay alert!
echo.
echo   1. Wilderness Wall (border with civilization)
echo   2. Dangerous creatures (combat)
echo   3. Resource nodes (mining / woodcutting)
echo   4. PvP hotspot (Player Killer risk)
echo   5. Ancient ruins
echo   6. Wilderness caves
echo   7. Wilderness lake (fishing - requires rod)
echo   8. Back to main menu
echo.
set /p "ec=Investigate: "

if "!ec!"=="1" (
    echo.
    echo  You stand at the Wilderness wall.
    echo  Beyond this point lies danger and opportunity.
    echo  Civilization is just a few steps back.
    pause
    goto explore_wilderness
)

if "!ec!"=="2" (
    echo.
    echo  You search for monsters...
    timeout /t 1 >nul
    set /a "wenc=%random% %% 4"
    if !wenc! equ 0 (
        set "enemy_name=Wilderness Goblin"
        set "enemy_level=8"
        set "enemy_maxhp=25"
        set "enemy_currenthp=25"
        set "enemy_attack=4"
        set "enemy_defence=2"
    ) else if !wenc! equ 1 (
        set "enemy_name=Wild Dog"
        set "enemy_level=6"
        set "enemy_maxhp=18"
        set "enemy_currenthp=18"
        set "enemy_attack=3"
        set "enemy_defence=1"
    ) else if !wenc! equ 2 (
        set "enemy_name=Skeleton"
        set "enemy_level=12"
        set "enemy_maxhp=32"
        set "enemy_currenthp=32"
        set "enemy_attack=5"
        set "enemy_defence=3"
    ) else (
        set "enemy_name=Wilderness Warrior"
        set "enemy_level=18"
        set "enemy_maxhp=45"
        set "enemy_currenthp=45"
        set "enemy_attack=7"
        set "enemy_defence=4"
    )
    echo  A !enemy_name! attacks!
    pause
    goto real_combat
)

if "!ec!"=="3" (
    echo.
    echo  You find resource nodes in the Wilderness.
    echo   1. Mine ores
    echo   2. Chop trees
    echo   3. Back
    set /p "res=Choice: "
    if "!res!"=="1" (
        call :count_item "Pickaxe"
        if !item_count! lss 1 (
            echo  You need a Pickaxe.
        ) else (
            echo  Mining in the Wilderness...
            timeout /t 2 >nul
            set /a "ore=%random% %% 100"
            if !ore! lss 40 (
                call :add_item "Iron Ore"
                echo  Found Iron Ore! +30 Mining XP
                set /a "mining_xp+=30"
            ) else if !ore! lss 70 (
                call :add_item "Coal"
                echo  Found Coal! +35 Mining XP
                set /a "mining_xp+=35"
            ) else if !ore! lss 90 (
                call :add_item "Mithril Ore"
                echo  Found Mithril Ore! +50 Mining XP
                set /a "mining_xp+=50"
            ) else (
                call :add_item "Adamantite Ore"
                echo  Found Adamantite Ore! +70 Mining XP
                set /a "mining_xp+=70"
            )
            set /a "experience+=30"
            call :check_level_up mining !mining_xp!
        )
    )
    if "!res!"=="2" (
        call :count_item "Axe"
        if !item_count! lss 1 (
            echo  You need an Axe.
        ) else (
            echo  Chopping wilderness trees...
            timeout /t 2 >nul
            call :add_item "Oak Logs"
            echo  You get Oak Logs! +45 Woodcutting XP
            set /a "woodcutting_xp+=45"
            set /a "experience+=45"
            call :check_level_up woodcutting !woodcutting_xp!
        )
    )
    pause
    goto explore_wilderness
)

if "!ec!"=="4" (
    echo.
    echo  You enter a known PvP hotspot...
    timeout /t 1 >nul
    set /a "pvp=%random% %% 100"
    if !pvp! lss 40 (
        echo  A Player Killer appears!
        set "enemy_name=Player Killer"
        set "enemy_level=25"
        set "enemy_maxhp=55"
        set "enemy_currenthp=55"
        set "enemy_attack=9"
        set "enemy_defence=5"
        pause
        goto real_combat
    ) else (
        echo  The area is quiet for now. You gain 15 combat XP from vigilance.
        set /a "attack_xp+=5"
        set /a "defence_xp+=5"
        set /a "experience+=15"
        call :check_level_up attack !attack_xp!
        call :check_level_up defence !defence_xp!
        pause
        goto explore_wilderness
    )
)

if "!ec!"=="5" (
    echo.
    echo  You explore ancient wilderness ruins...
    timeout /t 2 >nul
    set /a "ruin=%random% %% 100"
    if !ruin! lss 30 (
        echo  You find an Ancient Artifact!
        call :add_item "Ancient Artifact"
        set /a "treasure_hunting_xp+=40"
        set /a "experience+=40"
        call :check_level_up treasure_hunting !treasure_hunting_xp!
    ) else if !ruin! lss 60 (
        echo  You find 25 coins among the rubble.
        set /a "coins+=25"
        set /a "experience+=10"
    ) else (
        echo  The ruins hold nothing of value this time.
        set /a "experience+=5"
    )
    pause
    goto explore_wilderness
)

if "!ec!"=="6" (
    echo.
    echo  You enter dark wilderness caves...
    timeout /t 1 >nul
    set /a "cave=%random% %% 100"
    if !cave! lss 50 (
        echo  A Cave Crawler attacks!
        set "enemy_name=Cave Crawler"
        set "enemy_level=10"
        set "enemy_maxhp=28"
        set "enemy_currenthp=28"
        set "enemy_attack=5"
        set "enemy_defence=2"
        pause
        goto real_combat
    ) else (
        echo  You find some Coal and 15 coins deeper in the cave.
        call :add_item "Coal"
        set /a "coins+=15"
        set /a "mining_xp+=20"
        set /a "experience+=20"
        call :check_level_up mining !mining_xp!
        pause
        goto explore_wilderness
    )
)

if "!ec!"=="7" (
    call :count_item "Fishing Rod"
    if not defined item_count set "item_count=0"
    if !item_count! lss 1 (
        echo  You need a Fishing Rod to fish here.
        pause
        goto explore_wilderness
    )
    echo.
    echo  You fish in the wilderness lake...
    timeout /t 2 >nul
    set /a "fish=%random% %% 100"
    if !fish! lss 40 (
        call :add_item "Raw Shark"
        echo  You catch a Raw Shark! +50 Fishing XP
        set /a "fishing_xp+=50"
    ) else if !fish! lss 75 (
        call :add_item "Raw Lobster"
        echo  You catch a Raw Lobster! +40 Fishing XP
        set /a "fishing_xp+=40"
    ) else (
        echo  The fish got away. +8 Fishing XP
        set /a "fishing_xp+=8"
    )
    set /a "experience+=20"
    call :check_level_up fishing !fishing_xp!
    pause
    goto explore_wilderness
)

if "!ec!"=="8" goto main_menu
echo  Invalid choice.
timeout /t 1 >nul
goto explore_wilderness

:explore_wolfmountain
echo   1. Wolf Pack Territory
echo   2. Mountain Caves
echo   3. Mining Spots
echo   4. Wolf Den
echo   5. Mountain Peak
echo   6. Ancient Ruins
echo   7. Back
set /p "ec=Investigate: "
if "!ec!"=="1" goto wolf_pack_territory
if "!ec!"=="2" goto mountain_caves
if "!ec!"=="3" goto wolf_mountain_mining
if "!ec!"=="4" (
    echo  The Alpha Wolf appears!
    set "enemy_name=Alpha Wolf"
    set "enemy_level=12"
    set "enemy_maxhp=45"
    set "enemy_currenthp=45"
    set "enemy_attack=6"
    set "enemy_defence=3"
    goto real_combat
)
if "!ec!"=="7" goto main_menu
echo  Exploring Wolf Mountain...
pause
goto explore_area

:wolf_pack_territory
echo  You enter wolf territory. A pack approaches!
set "enemy_name=Wolf Pack"
set "enemy_level=10"
set "enemy_maxhp=35"
set "enemy_currenthp=35"
set "enemy_attack=5"
set "enemy_defence=2"
goto real_combat

:mountain_caves
echo  Dark caves... a Cave Wolf attacks!
set "enemy_name=Cave Wolf"
set "enemy_level=8"
set "enemy_maxhp=28"
set "enemy_currenthp=28"
set "enemy_attack=4"
set "enemy_defence=2"
goto real_combat

:wolf_mountain_mining
call :count_item "Pickaxe"
if !item_count! lss 1 (
    echo  You need a Pickaxe.
    pause
    goto explore_area
)
echo  Mining rich mountain ores...
set /a "ore=!random! %% 4"
if !ore! equ 0 (
    call :add_item "Iron Ore"
    echo  Found Iron Ore!
) else if !ore! equ 1 (
    call :add_item "Coal"
    echo  Found Coal!
) else if !ore! equ 2 (
    call :add_item "Silver Ore"
    echo  Found Silver Ore!
) else (
    call :add_item "Gold Ore"
    echo  Found Gold Ore!
)
set /a "mining_xp+=35"
set /a "experience+=35"
call :check_level_up mining !mining_xp!
pause
goto explore_area

REM ============================================================
REM                        TRAVEL
REM ============================================================
:travel_menu
cls
call :draw_header
echo.
echo  ========================================================
echo                         TRAVEL
echo  ========================================================
echo.
if /i not "!location!"=="LUMBRIDGE" echo   1. Lumbridge
if /i not "!location!"=="VARROCK"   echo   2. Varrock
if /i not "!location!"=="FALADOR"   echo   3. Falador
if /i not "!location!"=="ALKHARID"  echo   4. Al Kharid
if /i not "!location!"=="DRAYNOR"   echo   5. Draynor
if /i not "!location!"=="PORTSARIM" echo   6. Port Sarim
echo   7. The Wilderness
echo   8. Mage Tower
if /i not "!location!"=="WOLFMOUNTAIN" echo   9. Wolf Mountain
echo  10. Back
echo.
set /p "tc=Travel to: "

if "!tc!"=="1" if /i not "!location!"=="LUMBRIDGE" (
    set "location=LUMBRIDGE"
    echo  Arrived in Lumbridge.
    call :save_game
    pause
    goto main_menu
)
if "!tc!"=="2" if /i not "!location!"=="VARROCK" (
    set "location=VARROCK"
    echo  Arrived in Varrock.
    call :save_game
    pause
    goto main_menu
)
if "!tc!"=="3" if /i not "!location!"=="FALADOR" (
    set "location=FALADOR"
    echo  Arrived in Falador.
    call :save_game
    pause
    goto main_menu
)
if "!tc!"=="4" if /i not "!location!"=="ALKHARID" (
    set "location=ALKHARID"
    echo  Arrived in Al Kharid.
    call :save_game
    pause
    goto main_menu
)
if "!tc!"=="5" if /i not "!location!"=="DRAYNOR" (
    set "location=DRAYNOR"
    echo  Arrived in Draynor.
    call :save_game
    pause
    goto main_menu
)
if "!tc!"=="6" if /i not "!location!"=="PORTSARIM" (
    set "location=PORTSARIM"
    echo  Arrived in Port Sarim.
    call :save_game
    pause
    goto main_menu
)
if "!tc!"=="7" (
    set "location=WILDERNESS"
    echo  Arrived in the Wilderness. Be careful!
    call :save_game
    pause
    goto main_menu
)
if "!tc!"=="8" (
    set "location=MAGETOWER"
    echo  Arrived at the Mage Tower.
    call :save_game
    pause
    goto main_menu
)
if "!tc!"=="9" if /i not "!location!"=="WOLFMOUNTAIN" (
    set "location=WOLFMOUNTAIN"
    echo  Arrived at Wolf Mountain.
    call :save_game
    pause
    goto main_menu
)
if "!tc!"=="10" goto main_menu
goto travel_menu

REM ============================================================
REM                         SHOP
REM ============================================================
:visit_shop
cls
call :draw_header
echo.
echo  ========================================================
echo                      GENERAL STORE
echo  ========================================================
echo  Your gold: !coins!
echo.
echo   1. Bronze Sword     - 25 coins
echo   2. Wooden Shield    - 15 coins
echo   3. Bread            -  5 coins
echo   4. Health Potion    - 20 coins
echo   5. Tinderbox        -  5 coins
echo   6. Fishing Rod      - 50 coins   [Required for fishing]
echo   7. Axe              - 30 coins
echo   8. Pickaxe          - 30 coins
echo   9. Logs             - 10 coins
echo  10. Air Rune x5      - 25 coins
echo  11. Mind Rune x5     - 20 coins
echo  12. Water Rune x5    - 25 coins
echo   0. Back
echo.
set /p "sc=Buy: "
if "%sc%"=="1" call :buy_item "Bronze Sword" 25
if "%sc%"=="2" call :buy_item "Wooden Shield" 15
if "%sc%"=="3" call :buy_item "Bread" 5
if "%sc%"=="4" call :buy_item "Health Potion" 20
if "%sc%"=="5" call :buy_item "Tinderbox" 5
if "%sc%"=="6" call :buy_item "Fishing Rod" 50
if "%sc%"=="7" call :buy_item "Axe" 30
if "%sc%"=="8" call :buy_item "Pickaxe" 30
if "%sc%"=="9" call :buy_item "Logs" 10
if "%sc%"=="10" (
    if !coins! geq 25 (
        set /a "coins-=25"
        set /a "air_runes+=5"
        echo  Purchased 5 Air Runes.
    ) else echo  Not enough gold.
    pause
)
if "%sc%"=="11" (
    if !coins! geq 20 (
        set /a "coins-=20"
        set /a "mind_runes+=5"
        echo  Purchased 5 Mind Runes.
    ) else echo  Not enough gold.
    pause
)
if "%sc%"=="12" (
    if !coins! geq 25 (
        set /a "coins-=25"
        set /a "water_runes+=5"
        echo  Purchased 5 Water Runes.
    ) else echo  Not enough gold.
    pause
)
if "%sc%"=="0" goto main_menu
goto visit_shop

:buy_item
set "item=%~1"
set "price=%~2"
if !coins! lss !price! (
    echo  Not enough gold.
    pause
    goto :eof
)
set /a "coins-=!price!"
call :add_item "!item!"
echo  Purchased !item! for !price! coins.
call :save_game
pause
goto :eof

REM ============================================================
REM                    OTHER MENUS
REM ============================================================
:train_skills_menu
cls
echo  Skill training is available through Explore and Combat.
echo  - River for Fishing
echo  - Forest for Woodcutting
echo  - Mining sites for Mining
echo  - Combat Training for combat skills
echo  - Church/Monastery for Prayer
pause
goto main_menu

:quest_log
cls
call :draw_header
echo.
echo  ========================================================
echo                     QUEST JOURNAL
echo  ========================================================
echo.
if "!quest_cook!"=="0" echo  Cook's Assistant     - Not started
if "!quest_cook!"=="1" echo  Cook's Assistant     - In progress (Egg, Flour, Milk)
if "!quest_cook!"=="2" echo  Cook's Assistant     - COMPLETED
echo.
if "!quest_sheep!"=="0" echo  Sheep Shearer        - Not started
if "!quest_sheep!"=="1" echo  Sheep Shearer        - In progress
if "!quest_sheep!"=="2" echo  Sheep Shearer        - COMPLETED
echo.
if "!quest_imp!"=="0" echo  Imp Catcher          - Not started
if "!quest_imp!"=="1" echo  Imp Catcher          - In progress
if "!quest_imp!"=="2" echo  Imp Catcher          - COMPLETED
echo.
if "!quest_ghost!"=="0" echo  Restless Ghost       - Not started
if "!quest_ghost!"=="1" echo  Restless Ghost       - In progress
if "!quest_ghost!"=="2" echo  Restless Ghost       - COMPLETED
echo.
echo  More quests available via Quest Hub and NPCs.
pause
goto main_menu

:magic_journal
cls
echo  Magic Journal
echo  -------------
echo  Air Runes   : !air_runes!
echo  Water Runes : !water_runes!
echo  Earth Runes : !earth_runes!
echo  Fire Runes  : !fire_runes!
echo  Mind Runes  : !mind_runes!
echo  Chaos Runes : !chaos_runes!
echo.
echo  Visit Mage Tower for training and rune crafting.
pause
goto main_menu

:quest_hub
cls
call :draw_header
echo.
echo  ========================================================
echo                       QUEST HUB
echo  ========================================================
echo.
echo   1. Cook's Assistant (Lumbridge Castle)
echo   2. Sheep Shearer (start here)
echo   3. Imp Catcher (start here)
echo   4. Restless Ghost (start here)
echo   5. Back
echo.
set /p "qh=Choice: "
if "!qh!"=="1" (
    echo  Go to Lumbridge Castle (Explore) to start Cook's Assistant.
    pause
)
if "!qh!"=="2" (
    if "!quest_sheep!"=="0" (
        set "quest_sheep=1"
        echo  Sheep Shearer started! Collect 20 Balls of Wool.
        call :save_game
    ) else echo  Already started or completed.
    pause
)
if "!qh!"=="3" (
    if "!quest_imp!"=="0" (
        set "quest_imp=1"
        echo  Imp Catcher started! Collect Red, Yellow, Blue, Black beads.
        call :save_game
    ) else echo  Already started or completed.
    pause
)
if "!qh!"=="4" (
    if "!quest_ghost!"=="0" (
        set "quest_ghost=1"
        echo  Restless Ghost started! Help the ghost in Lumbridge churchyard.
        call :save_game
    ) else echo  Already started or completed.
    pause
)
if "!qh!"=="5" goto main_menu
goto quest_hub

:player_house
echo  Your Player House is under construction.
echo  Future updates will add furniture and storage.
pause
goto main_menu

:crafting_workshop
echo  Crafting Workshop - Bring materials here in future updates.
pause
goto main_menu

:bank
echo  Bank of Gielinor
echo  (Simple storage - your inventory is currently your bank)
echo  Future update will add separate bank storage.
pause
goto main_menu

:grand_exchange
cls
call :draw_header
echo.
echo  ========================================================
echo                   GRAND EXCHANGE
echo  ========================================================
echo.
echo  Welcome to the Grand Exchange of Varrock!
echo  Here you can buy and sell items with other adventurers.
echo.
echo  Your gold: !coins! coins
echo.
echo  --------------------------------------------------------
echo   1. View current offers (Buy/Sell board)
echo   2. Place a Buy offer
echo   3. Place a Sell offer
echo   4. Collect completed offers
echo   5. GE Guide / Tips
echo   0. Back to main menu
echo  --------------------------------------------------------
set /p "ge_choice=Choose option: "

if "!ge_choice!"=="1" goto ge_view_offers
if "!ge_choice!"=="2" goto ge_buy_offer
if "!ge_choice!"=="3" goto ge_sell_offer
if "!ge_choice!"=="4" goto ge_collect
if "!ge_choice!"=="5" goto ge_guide
if "!ge_choice!"=="0" goto main_menu
echo  Invalid choice.
timeout /t 1 >nul
goto grand_exchange

:ge_view_offers
cls
echo.
echo  ========================================================
echo              CURRENT GRAND EXCHANGE OFFERS
echo  ========================================================
echo.
echo  [BUY]  Bronze Sword     - 30 coins   (x3 available)
echo  [BUY]  Iron Ore         - 15 coins   (x12 available)
echo  [BUY]  Raw Lobster      - 40 coins   (x5 available)
echo  [BUY]  Air Rune         -  6 coins   (x50 available)
echo  [BUY]  Logs             -  8 coins   (x20 available)
echo.
echo  [SELL] Steel Sword      - 120 coins  (x1 available)
echo  [SELL] Gold Ore         -  90 coins  (x4 available)
echo  [SELL] Oak Logs         -  25 coins  (x8 available)
echo  [SELL] Health Potion    -  18 coins  (x10 available)
echo.
echo  Press any key to return...
pause >nul
goto grand_exchange

:ge_buy_offer
cls
echo.
echo  ========================================================
echo                    PLACE BUY OFFER
echo  ========================================================
echo.
echo  What would you like to buy?
echo.
echo   1. Bronze Sword     (30 coins each)
echo   2. Iron Ore         (15 coins each)
echo   3. Raw Lobster      (40 coins each)
echo   4. Air Rune x5      (30 coins)
echo   5. Logs x5          (40 coins)
echo   6. Health Potion    (18 coins each)
echo   0. Cancel
echo.
set /p "buy_item=Choose item: "
set "ge_price=0"
set "ge_name="
if "!buy_item!"=="1" (set "ge_name=Bronze Sword" & set "ge_price=30")
if "!buy_item!"=="2" (set "ge_name=Iron Ore" & set "ge_price=15")
if "!buy_item!"=="3" (set "ge_name=Raw Lobster" & set "ge_price=40")
if "!buy_item!"=="4" (set "ge_name=Air Rune" & set "ge_price=30" & set "ge_qty=5")
if "!buy_item!"=="5" (set "ge_name=Logs" & set "ge_price=40" & set "ge_qty=5")
if "!buy_item!"=="6" (set "ge_name=Health Potion" & set "ge_price=18")
if "!buy_item!"=="0" goto grand_exchange
if not defined ge_name (
    echo  Invalid choice.
    pause
    goto ge_buy_offer
)
if !coins! lss !ge_price! (
    echo  Not enough gold. You need !ge_price! coins.
    pause
    goto grand_exchange
)
set /a "coins-=ge_price"
if defined ge_qty (
    for /l %%i in (1,1,!ge_qty!) do call :add_item "!ge_name!"
    echo  You bought !ge_qty!x !ge_name! for !ge_price! coins.
) else (
    call :add_item "!ge_name!"
    echo  You bought 1x !ge_name! for !ge_price! coins.
)
call :save_game
echo.
pause
goto grand_exchange

:ge_sell_offer
cls
echo.
echo  ========================================================
echo                    PLACE SELL OFFER
echo  ========================================================
echo.
echo  Your inventory:
call :parse_inventory
echo.
echo  Enter the number of the item you want to sell:
set /p "sell_num=Item number: "
call set "selected_item=%%inv_item_!sell_num!%%"
if not defined selected_item (
    echo  Invalid item number.
    pause
    goto grand_exchange
)
echo.
echo  You selected: !selected_item!
echo  Suggested prices:
if /i "!selected_item!"=="Bronze Sword" set "suggest=20"
if /i "!selected_item!"=="Wooden Shield" set "suggest=10"
if /i "!selected_item!"=="Bread" set "suggest=3"
if /i "!selected_item!"=="Health Potion" set "suggest=12"
if /i "!selected_item!"=="Logs" set "suggest=6"
if /i "!selected_item!"=="Iron Ore" set "suggest=10"
if /i "!selected_item!"=="Bones" set "suggest=2"
if not defined suggest set "suggest=5"
echo  Suggested price: !suggest! coins
set /p "sell_price=Your asking price (or press Enter for suggested): "
if "!sell_price!"=="" set "sell_price=!suggest!"
echo.
echo  Offer posted: Selling !selected_item! for !sell_price! coins.
echo  (In this version the offer completes instantly)
set /a "coins+=sell_price"
call :remove_item_by_name "!selected_item!"
echo  You received !sell_price! coins.
call :save_game
echo.
pause
goto grand_exchange

:ge_collect
echo.
echo  Checking for completed offers...
timeout /t 1 >nul
echo  No pending offers to collect right now.
echo  (Offers complete instantly in this version)
echo.
pause
goto grand_exchange

:ge_guide
cls
echo.
echo  ========================================================
echo                    GRAND EXCHANGE GUIDE
echo  ========================================================
echo.
echo  - Buy offers let you purchase items from other players.
echo  - Sell offers let you list your own items for sale.
echo  - Prices fluctuate based on supply and demand.
echo  - Always check the offer board before placing a buy.
echo  - High-demand items (ores, food, runes) sell faster.
echo  - The GE is only available in Varrock.
echo.
echo  Press any key to return...
pause >nul
goto grand_exchange

:magic_shop
cls
call :draw_header
echo.
echo  ========================================================
echo                      MAGIC SHOP
echo  ========================================================
echo.
echo  Welcome to the Mage Tower Magic Shop!
echo  Your gold: !coins! coins
echo.
echo   1. Air Rune x10       - 40 coins
echo   2. Water Rune x10     - 40 coins
echo   3. Earth Rune x10     - 40 coins
echo   4. Fire Rune x10      - 40 coins
echo   5. Mind Rune x10      - 35 coins
echo   6. Chaos Rune x5      - 75 coins
echo   7. Staff of Air       - 200 coins
echo   8. Wizard Hat         - 150 coins
echo   0. Back
echo.
set /p "ms=Buy: "
if "!ms!"=="1" (
    if !coins! geq 40 (
        set /a "coins-=40"
        set /a "air_runes+=10"
        echo  Purchased 10 Air Runes.
        call :save_game
    ) else echo  Not enough gold.
    pause
)
if "!ms!"=="2" (
    if !coins! geq 40 (
        set /a "coins-=40"
        set /a "water_runes+=10"
        echo  Purchased 10 Water Runes.
        call :save_game
    ) else echo  Not enough gold.
    pause
)
if "!ms!"=="3" (
    if !coins! geq 40 (
        set /a "coins-=40"
        set /a "earth_runes+=10"
        echo  Purchased 10 Earth Runes.
        call :save_game
    ) else echo  Not enough gold.
    pause
)
if "!ms!"=="4" (
    if !coins! geq 40 (
        set /a "coins-=40"
        set /a "fire_runes+=10"
        echo  Purchased 10 Fire Runes.
        call :save_game
    ) else echo  Not enough gold.
    pause
)
if "!ms!"=="5" (
    if !coins! geq 35 (
        set /a "coins-=35"
        set /a "mind_runes+=10"
        echo  Purchased 10 Mind Runes.
        call :save_game
    ) else echo  Not enough gold.
    pause
)
if "!ms!"=="6" (
    if !coins! geq 75 (
        set /a "coins-=75"
        set /a "chaos_runes+=5"
        echo  Purchased 5 Chaos Runes.
        call :save_game
    ) else echo  Not enough gold.
    pause
)
if "!ms!"=="7" (
    if !coins! geq 200 (
        set /a "coins-=200"
        call :add_item "Staff of Air"
        echo  Purchased Staff of Air.
        call :save_game
    ) else echo  Not enough gold.
    pause
)
if "!ms!"=="8" (
    if !coins! geq 150 (
        set /a "coins-=150"
        call :add_item "Wizard Hat"
        echo  Purchased Wizard Hat.
        call :save_game
    ) else echo  Not enough gold.
    pause
)
if "!ms!"=="0" goto main_menu
goto magic_shop

:chat_system
cls
call :draw_header
echo.
echo  ========================================================
echo                    MAGE TOWER CHAT
echo  ========================================================
echo.
echo  The ancient halls of the Mage Tower are filled with
echo  the voices of wizards and adventurers.
echo.
echo  --------------------------------------------------------
echo   1. General Chat
echo   2. Magic Chat
echo   3. Trade Chat
echo   4. Back to main menu
echo  --------------------------------------------------------
set /p "chat_choice=Choose channel: "

if "!chat_choice!"=="1" goto general_chat
if "!chat_choice!"=="2" goto magic_chat
if "!chat_choice!"=="3" goto trade_chat
if "!chat_choice!"=="4" goto main_menu
echo  Invalid choice.
timeout /t 1 >nul
goto chat_system

:general_chat
cls
call :draw_header
echo.
echo  ========================================================
echo                      GENERAL CHAT
echo  ========================================================
echo.
echo  Recent messages:
echo.
echo  [Player] "Anyone want to go slaying together?"
echo  [Player] "Just completed Cook's Assistant quest!"
echo  [Player] "The Grand Exchange is so busy today!"
echo  [Player] "Anyone know where to find iron ore?"
echo  [Player] "Great XP rates at the training grounds!"
echo  [Player] "Wolf Mountain is dangerous - bring food!"
echo.
echo  --------------------------------------------------------
echo   [T]ype a message
echo   [R]efresh chat
echo   [B]ack to chat menu
echo  --------------------------------------------------------
set /p "gen_action=What do you do? "

if /i "!gen_action!"=="t" (
    echo.
    set /p "gen_message=Type your message: "
    echo  [Player] You: "!gen_message!"
    echo  Message sent to general chat!
    pause
    goto general_chat
)
if /i "!gen_action!"=="r" (
    echo.
    echo  Refreshing general chat...
    timeout /t 1 >nul
    echo  [NPC] New messages appear...
    pause
    goto general_chat
)
if /i "!gen_action!"=="b" goto chat_system
echo  Invalid choice.
timeout /t 1 >nul
goto general_chat

:magic_chat
cls
call :draw_header
echo.
echo  ========================================================
echo                       MAGIC CHAT
echo  ========================================================
echo.
echo  Recent magic discussions:
echo.
echo  [Mage] "Anyone know the best way to train Magic?"
echo  [Mage] "I'm looking for Death Runes, anyone selling?"
echo  [Mage] "Just learned Fire Bolt spell!"
echo  [Mage] "Magic training at the tower is great!"
echo  [Mage] "Anyone want to practice PvP magic?"
echo  [Mage] "Rune crafting is the way to go for profit."
echo.
echo  --------------------------------------------------------
echo   [P]ost a magic message
echo   [R]efresh chat
echo   [B]ack to chat menu
echo  --------------------------------------------------------
set /p "mag_action=What do you do? "

if /i "!mag_action!"=="p" (
    echo.
    set /p "mag_message=Type your magic message: "
    echo  [Mage] You: "!mag_message!"
    echo  Message sent to magic chat!
    pause
    goto magic_chat
)
if /i "!mag_action!"=="r" (
    echo.
    echo  Refreshing magic chat...
    timeout /t 1 >nul
    echo  [NPC] New magic discussions appear...
    pause
    goto magic_chat
)
if /i "!mag_action!"=="b" goto chat_system
echo  Invalid choice.
timeout /t 1 >nul
goto magic_chat

:trade_chat
cls
call :draw_header
echo.
echo  ========================================================
echo                       TRADE CHAT
echo  ========================================================
echo.
echo  Recent trade messages:
echo.
echo  [Trade] "WTB: Iron Ore, paying 12 each"
echo  [Trade] "WTS: Steel Sword, 100 coins"
echo  [Trade] "Looking for a Fishing Rod, any offers?"
echo  [Trade] "Selling 50 Air Runes, bulk discount"
echo  [Trade] "WTB: Health Potions, need 10"
echo.
echo  --------------------------------------------------------
echo   [P]ost a trade (Buy or Sell)
echo   [R]efresh chat
echo   [B]ack to chat menu
echo  --------------------------------------------------------
set /p "trade_action=What do you do? "

if /i "!trade_action!"=="p" (
    echo.
    echo  [B]uy offer or [S]ell offer?
    set /p "trade_type=Choice: "
    if /i "!trade_type!"=="b" (
        set /p "wtb_item=What do you want to buy? "
        set /p "wtb_price=How much will you pay? "
        echo  [WTB] Looking for: !wtb_item!, paying !wtb_price! coins
        echo  Trade message posted!
    ) else if /i "!trade_type!"=="s" (
        set /p "wts_item=What do you want to sell? "
        set /p "wts_price=How much do you want? "
        echo  [WTS] Selling: !wts_item!, !wts_price! coins
        echo  Trade message posted!
    ) else (
        echo  Invalid choice.
    )
    pause
    goto trade_chat
)
if /i "!trade_action!"=="r" (
    echo.
    echo  Refreshing trade chat...
    timeout /t 1 >nul
    echo  [NPC] New trade offers appear...
    pause
    goto trade_chat
)
if /i "!trade_action!"=="b" goto chat_system
echo  Invalid choice.
timeout /t 1 >nul
goto trade_chat

:rune_crafting
cls
call :draw_header
echo.
echo  ========================================================
echo                     RUNE CRAFTING
echo  ========================================================
echo.
echo  Welcome to the Rune Crafting Altar!
echo.
echo  You can create runes here if you have Pure Essence.
echo  (Pure Essence can be found while mining or bought later)
echo.
echo  Available Rune Types:
echo   1. Air Rune     (1 Pure Essence)
echo   2. Fire Rune    (1 Pure Essence)
echo   3. Water Rune   (1 Pure Essence)
echo   4. Earth Rune   (1 Pure Essence)
echo   5. Mind Rune    (1 Pure Essence)
echo   6. Chaos Rune   (2 Pure Essence)
echo   0. Back to main menu
echo.
set /p "rune_choice=Choose rune to craft: "
if "!rune_choice!"=="0" goto main_menu

call :count_item "Pure Essence"
if not defined item_count set "item_count=0"
if !item_count! lss 1 (
    echo  You need Pure Essence to craft runes!
    echo  Mine for it or buy it when available.
    pause
    goto rune_crafting
)

if "!rune_choice!"=="1" (
    call :remove_item_by_name "Pure Essence"
    set /a "air_runes+=1"
    echo  You crafted an Air Rune! +15 XP
    set /a "experience+=15"
)
if "!rune_choice!"=="2" (
    call :remove_item_by_name "Pure Essence"
    set /a "fire_runes+=1"
    echo  You crafted a Fire Rune! +15 XP
    set /a "experience+=15"
)
if "!rune_choice!"=="3" (
    call :remove_item_by_name "Pure Essence"
    set /a "water_runes+=1"
    echo  You crafted a Water Rune! +15 XP
    set /a "experience+=15"
)
if "!rune_choice!"=="4" (
    call :remove_item_by_name "Pure Essence"
    set /a "earth_runes+=1"
    echo  You crafted an Earth Rune! +15 XP
    set /a "experience+=15"
)
if "!rune_choice!"=="5" (
    call :remove_item_by_name "Pure Essence"
    set /a "mind_runes+=1"
    echo  You crafted a Mind Rune! +15 XP
    set /a "experience+=15"
)
if "!rune_choice!"=="6" (
    call :count_item "Pure Essence"
    if !item_count! lss 2 (
        echo  Chaos Rune needs 2 Pure Essence.
        pause
        goto rune_crafting
    )
    call :remove_item_by_name "Pure Essence"
    call :remove_item_by_name "Pure Essence"
    set /a "chaos_runes+=1"
    echo  You crafted a Chaos Rune! +25 XP
    set /a "experience+=25"
)
pause
goto rune_crafting

REM ============================================================
REM                    CORE HELPERS
REM ============================================================
:check_level_up
set "skill=%~1"
set "xp=%~2"
if not defined xp set "xp=0"
if "!xp!"=="" set "xp=0"
set /a "xp=!xp!" 2>nul

REM Get current level of this skill safely
set "cur_lvl=1"
if /i "!skill!"=="attack" set "cur_lvl=!attack!"
if /i "!skill!"=="strength" set "cur_lvl=!strength!"
if /i "!skill!"=="defence" set "cur_lvl=!defence!"
if /i "!skill!"=="hitpoints" set "cur_lvl=!hitpoints!"
if /i "!skill!"=="ranged" set "cur_lvl=!ranged!"
if /i "!skill!"=="magic" set "cur_lvl=!magic!"
if /i "!skill!"=="woodcutting" set "cur_lvl=!woodcutting!"
if /i "!skill!"=="fishing" set "cur_lvl=!fishing!"
if /i "!skill!"=="mining" set "cur_lvl=!mining!"
if /i "!skill!"=="cooking" set "cur_lvl=!cooking!"
if /i "!skill!"=="smithing" set "cur_lvl=!smithing!"
if /i "!skill!"=="crafting" set "cur_lvl=!crafting!"
if /i "!skill!"=="fletching" set "cur_lvl=!fletching!"
if /i "!skill!"=="herblore" set "cur_lvl=!herblore!"
if /i "!skill!"=="prayer" set "cur_lvl=!prayer!"
if /i "!skill!"=="slayer" set "cur_lvl=!slayer!"
if /i "!skill!"=="farming" set "cur_lvl=!farming!"
if /i "!skill!"=="firemaking" set "cur_lvl=!firemaking!"
if /i "!skill!"=="treasure_hunting" set "cur_lvl=!treasure_hunting!"
if not defined cur_lvl set "cur_lvl=1"
if "!cur_lvl!"=="" set "cur_lvl=1"
set /a "cur_lvl=!cur_lvl!" 2>nul
if !cur_lvl! lss 1 set "cur_lvl=1"

REM XP needed to reach next level = current_level * 100
set /a "needed=!cur_lvl! * 100"

if !xp! geq !needed! (
    set /a "cur_lvl+=1"
    REM Update the actual skill variable by name
    if /i "!skill!"=="attack" set "attack=!cur_lvl!"
    if /i "!skill!"=="strength" set "strength=!cur_lvl!"
    if /i "!skill!"=="defence" set "defence=!cur_lvl!"
    if /i "!skill!"=="hitpoints" set "hitpoints=!cur_lvl!"
    if /i "!skill!"=="ranged" set "ranged=!cur_lvl!"
    if /i "!skill!"=="magic" set "magic=!cur_lvl!"
    if /i "!skill!"=="woodcutting" set "woodcutting=!cur_lvl!"
    if /i "!skill!"=="fishing" set "fishing=!cur_lvl!"
    if /i "!skill!"=="mining" set "mining=!cur_lvl!"
    if /i "!skill!"=="cooking" set "cooking=!cur_lvl!"
    if /i "!skill!"=="smithing" set "smithing=!cur_lvl!"
    if /i "!skill!"=="crafting" set "crafting=!cur_lvl!"
    if /i "!skill!"=="fletching" set "fletching=!cur_lvl!"
    if /i "!skill!"=="herblore" set "herblore=!cur_lvl!"
    if /i "!skill!"=="prayer" set "prayer=!cur_lvl!"
    if /i "!skill!"=="slayer" set "slayer=!cur_lvl!"
    if /i "!skill!"=="farming" set "farming=!cur_lvl!"
    if /i "!skill!"=="firemaking" set "firemaking=!cur_lvl!"
    if /i "!skill!"=="treasure_hunting" set "treasure_hunting=!cur_lvl!"

    echo.
    echo  ****************************************
    echo  ***          LEVEL UP!              ***
    echo  ***  Your !skill! is now level !cur_lvl!  ***
    echo  ****************************************
    echo.

    REM Hitpoints level-up also raises max HP
    if /i "!skill!"=="hitpoints" (
        set /a "maxhp+=1"
        set /a "currenthp+=1"
        echo  Max Hitpoints increased to !maxhp!
    )

    REM Always refresh combat + total level after any skill up
    call :calculate_combat_level
    call :calculate_total_level
    echo  Combat Level: !combat_level!   Total Level: !level!
    call :save_game
)
goto :eof

:recalc_all_xp
set /a "attack_xp=(!attack!-1)*100"
set /a "strength_xp=(!strength!-1)*100"
set /a "defence_xp=(!defence!-1)*100"
set /a "hitpoints_xp=(!hitpoints!-1)*100"
set /a "ranged_xp=(!ranged!-1)*100"
set /a "magic_xp=(!magic!-1)*100"
set /a "woodcutting_xp=(!woodcutting!-1)*100"
set /a "fishing_xp=(!fishing!-1)*100"
set /a "mining_xp=(!mining!-1)*100"
set /a "cooking_xp=(!cooking!-1)*100"
set /a "smithing_xp=(!smithing!-1)*100"
set /a "crafting_xp=(!crafting!-1)*100"
set /a "fletching_xp=(!fletching!-1)*100"
set /a "herblore_xp=(!herblore!-1)*100"
set /a "prayer_xp=(!prayer!-1)*100"
set /a "slayer_xp=(!slayer!-1)*100"
set /a "farming_xp=(!farming!-1)*100"
set /a "firemaking_xp=(!firemaking!-1)*100"
set /a "treasure_hunting_xp=(!treasure_hunting!-1)*100"
goto :eof

:calculate_combat_level
set /a "combat_level=(!attack!+!strength!+!defence!+!hitpoints!+!ranged!+!magic!)/6"
if !combat_level! lss 1 set "combat_level=1"
goto :eof

:calculate_total_level
set /a "level=!attack!+!strength!+!defence!+!hitpoints!+!ranged!+!magic!+!woodcutting!+!fishing!+!mining!+!cooking!+!smithing!+!crafting!+!fletching!+!herblore!+!prayer!+!slayer!+!farming!+!firemaking!+!treasure_hunting!"
goto :eof

:exit_game
cls
echo.
echo  Saving game...
call :save_game
echo  Game saved successfully.
echo  Thank you for playing TOON-SCAPE !VERSION!
echo.
pause
exit /b 0

:draw_header
echo  +------------------------------------------------------+
echo  ^|  TOON-SCAPE !VERSION!          Location: !location!
echo  +------------------------------------------------------+
goto :eof

REM End of TOON-SCAPE 0.2.1 - Stable full restoration
