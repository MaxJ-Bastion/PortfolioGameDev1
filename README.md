# Maxwell Johnson's Game Dev Portfolio 2026

## Projects for Term 1

### NACA Ultamite Space Adventure for Obsesive Cookie-Philes

🛸 SpaceGame

By Maxwell Johnson | 17 Sept 2025

SpaceGame is a 2D space shooter built in Processing where the player pilots a spaceship, shoots falling rocks, collects power-ups, and fights off a boss oven to advance through levels. The game includes weapon upgrades, health management, and ammo economy, with humor woven into the scoring system.

🔧 Code Features:

Object-Oriented Design: Core components like Spaceship, Rock, Laser, Power, Star, and Oven are modular classes.

Entity Management: Uses ArrayList to dynamically store and update all active game elements like rocks, lasers, power-ups, and background stars.

Timers: Custom Timer objects control spawn rates of rocks, power-ups, and boss triggers.

Combat Logic:

Lasers reduce rock size based on collisions; rocks can split or be destroyed.

Mouse clicks handle firing standard (laserCount) or special chocolate ammo (cCount) with turret-based spread.

Progression:

A score variable (sc2) tracks damage dealt and triggers boss appearances.

Boss difficulty increases by decreasing rock spawn delay (death) and increasing oven speed.

End Conditions:

Game ends when health (s1.health) reaches 0 or the oven descends past a certain point.

Win condition is reaching level 10.

Accuracy is calculated via shots fired (ls) and hits (rh).

🎯 Gameplay Highlights:

Shoot & Dodge: Destroy rocks before they hit you or pass the screen.

Collect Power-ups: Refill ammo, boost health, gain turrets, or get chocolate shots.

Boss Battles: Periodic fights against a moving oven with scaling HP.

Scoring & Humor: Score is tracked as “calories,” and game-over ranks range from “Obese” to “Anorexic Racing Jockey.”

![Running Game](https://github.com/MaxJ-Bastion/PortfolioGameDev1/blob/main/images/SpaceGame01.png?raw=true)

* [Windows](https://github.com/MaxJ-Bastion/PortfolioGameDev1/blob/main/src/SpaceGame/windows-amd64.zip)
* [MacOS](https://github.com/MaxJ-Bastion/PortfolioGameDev1/blob/main/src/SpaceGame/macos-aarch64.zip)
* [MacOS (intel)](https://github.com/MaxJ-Bastion/PortfolioGameDev1/blob/main/src/SpaceGame/macos-x86_64.zip)
* [SourceCode](https://github.com/MaxJ-Bastion/PortfolioGameDev1/tree/main/src/SpaceGame)


### Shadows for Silence

This is a game I made based of the novella of the same name by Brandon Sanderson


By Maxwell Johnson — 11/14/25

Shadows for Silence is a top-down survival and exploration game set in a dark, ever-growing forest haunted by hostile entities known as Shades. You play as Silence, a lone traveler who must survive day after day by collecting bounties, avoiding death, and returning safely to the Waystop Inn.

Core Gameplay

The player explores a procedurally populated forest filled with trees, glowing resources, roaming Shades, and bounty targets.

Shades spawn over time and aggressively hunt the player. Getting caught triggers a death countdown.

Movement can be controlled using either keyboard (WASD) or mouse, switchable in the pause menu.

The player can buy pouches of silver (used for healing), upgrade the inn in various ways, and even poison bounties.

Progression & Survival

Each day ends when the player safely reaches the Waystop Inn.

Completing bounties earns money, which is awarded at the end of the day.

As days progress, difficulty increases through more frequent enemies and resource management pressure.

Resources & Systems

Glow Sap appears periodically and scales with upgrades.

Timers control Shade spawning, Glow Sap generation, and death countdowns.

Forest trees are spaced dynamically to create a dense but navigable environment.

A camera system follows the player, keeping the world centered around them.

Death & Game Over

Being caught by a Shade starts a visual countdown.

If the timer reaches zero without using a pouch, the game ends.

The final screen displays a game-over image and halts all gameplay.

UI & Features

Bottom HUD displays bounties, pouches, Shades encountered, day count, and money.

Pause menu allows control scheme switching.

End-of-day shop and upgrade screen provides strategic choices for long-term survival.

This game uses various coding methods, inlcuding switches, for loops, array lists, classes, push and pop matrix, and others.

![Running Game](https://github.com/MaxJ-Bastion/PortfolioGameDev1/blob/main/images/SFS.png)
![Game Over Screen](https://github.com/MaxJ-Bastion/PortfolioGameDev1/blob/main/images/SilenceGO.png)
