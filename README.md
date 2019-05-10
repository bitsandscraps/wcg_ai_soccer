# WCG AI Masters Simulation

The [WCG AI Masters](https://www.wcg.com/new-horizons/view/AI-Masters) simulation environment for usage in local PCs.

- There are two ways to download the WCG AI Masters simulation program.
- WCG AI Masters simulation program requires Webots Robot Simulator. Please refer to Webots official website's [installation procedure](https://www.cyberbotics.com/doc/guide/installation-procedure) to install Webots (Webots version should be R2019a-rev1).
- **Downloading the ZIP file through 'Download ZIP' will not work.** It does not download the submodules related to the program.

**How to download the simulation program**

Method 1. Go to [releases](https://github.com/wcgaimasters/wcg_ai_soccer/releases) and download the latest version.

Method 2. Use following git command

      git clone https://github.com/bitsandscraps/wcg_ai_soccer.git --recurse-submodules

**How to run the simulation program**

Please refer to the [Wiki pages](https://github.com/wcgaimasters/WCG-AI-MASTERS-Manual/wiki).

**Descriptions**

**controllers**: Contains programs for managing WCG AI Masters simulation game system **(You can modify the controllers to aid your development. However, the games at the competition will use the default controllers)**

- soccer_robot: A program that changes robot wheel movements based on received data

- supervisor: A referee program that manages AI Soccer game as whole (Participant programs communicate with this program to control the robots)

**extlibs**: Contains external libraries used in WCG AI Masters simulation

**plugins**: Contains a physics plugin used for ball-robot collision detection

**protos**: Contains WCG AI Masters object models (robot, ball, stadium, etc.)

**worlds**: Contains WCG AI Masters simulation world files **(Files in this directory can be run using Webots Robot Simulator)**

- aiwc.wbt: Webots world file

**config.json**: Configuration file for setting player executables, setting game duration, and setting some rules on/off for effective training. Please refer to the [Wiki page](https://github.com/wcgaimasters/WCG-AI-MASTERS-Manual/wiki/How-to-use-local-PC-simulation-program) for parameter descriptions **(Participants should modify the player information in this file to tell the simulation which program to execute)**
