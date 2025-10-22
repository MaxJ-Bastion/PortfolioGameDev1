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
