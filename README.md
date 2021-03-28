# Friends-N-Such-Mods



A Github Repository where you can get the latest updates for the friends-n-such server



## Windows Instructions

1. Download the `updator.bat` file and put it in the Friends-N-Such `.minecraft` folder. To get to this folder, open MultiMC, select the "Friends N Such" instance, and in the right panel press the `Minecraft Folder` button.
2. On your first run (or if you ever want to quickly re-download everything in case something was changed) run the **`Force Update.bat`** file.
3. Whenever you want to update in the future, you do not have to re-download anything, you can simply run **`updator.bat`** and it will download new mods, mod config, and shaders if there are any available.

## Mac/Linux Instructions

1. Open a terminal window in the Friends-N-Such .minecraft folder. To find this folder, open MultiMC, select the "Friends N Such" instance, and in the right panel press the `Minecraft Folder` button.

2. Run The following commands:
    ` git clone https://github.com/ITCMD/Friends-N-Such-Mods update`
     `rsync -avu --delete "update/mods" "mods"
     `rsync -avu --delete "update/config" "config"
     `rsync -avu "update/shaderpacks" "shaderpacks"
     `rm -rf "update"
3. Launch MultiMC and launch the game (or don't, whatever).


   *This part has not been tested. Please inform me if there are, or aren't any issues with these commands.*   
