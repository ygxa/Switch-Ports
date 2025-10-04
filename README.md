# Gamemaker switch ports

Discord: https://discord.gg/cc2YA2pChU

A repository containing ports of GameMaker games for the Nintendo Switch.

## Current Progress
| Game | Progress info |
| ------------- | ------------- |
| Sugary Spire Exhibition Night | 80% done. 60 fps 75% of the time. Needs more optimization for v1 switches, more sounds implemented, and achievement menu text fixed up. Besides that fully playable and can be completed to 100%|
| Sugary Spire Demo 1 | 97% done. Runs 60fps all the time, only issues are no saving and a crash in mines when exiting the dark section (both easy fixes)|
| Sugary Spire P rank build (also known as the march build) | 30% done. Runs 60fps most of the time, crashes constantly, no levels beatable besides crunchy construction and no saving (savings an easy fix)|
| Pizza Tower Sage 19 Plus | 5% done. boots, runs around 20fps on the mainmenu crashing after leaving on switch and crashes after the tutorial on pc|
| Pizza Tower Fighters | 75% done. 60fps 100% of the time, cpu battles work, 2p mode controller pairings are buggy (only use half joy-con)|
| Undertale Yellow | ?% done. 60fps, unknown whats working due to the second lava ball puzzle broken due to broken collisions with the moving platforms leading to a softlock. All of ruins and the battle system works however.|
| Super Bo Noise | 75% done. 60fps - 30fps, text system fully works, no known crashes due to a lack of testing, no sound or saving.|
| Deltarune The Upper Hand | 80% done. 60fps - 10fps, fully works, no crashes, laggy in menus and in the somtimes fight. besides that, its fully working|

currently being thought of:
Scampton The Great -- i have "ported" it, which i mean the menu works on switch but no controller support which i have to add manually

## Compiling
Don't worry! no nintendo sdk nor illegal content is required!

also all of this took me 5 months to figure out so i hope you find it useful :D


### Step 1. Gather required files
Before we start, here's what you need to download

[GameMaker 2022.8.1.37](https://gms.yoyogames.com/GameMaker-Installer-2022.8.1.37.exe) — Latest editor that uses the 2022.8.1.53 runtime

[RussellNX](https://dlhb.gamebrew.org/switchhomebrews/russellnx.7z) — Tool to compile games for Switch ([more info here](https://gbatemp.net/threads/play-port-your-gamemaker-games-on-nintendoswitch.519660/))

[Brain](https://static.wikia.nocookie.net/nicos-nextbots-fanmade/images/c/c7/Dance.gif.gif/revision/latest?cb=20230512180735) — Heavily required for thinking

### Step 2. stupid gamemaker runtime!
First install (or i recommend extracting the installer with 7zip) and open GameMaker. Wait until you receive an error about the runtime not being able to be fully installed (which is a lie, it has) then click retry, it will the latest runtime available which can't compile in the 2022.8.1.37 editor. to fix this wait until your at the project selection then go to C:\ProgramData\GameMakerStudio2, here is the runtime.json which we need to change to the 2022 runtime gamemaker "failed to install". open the json and replace the whole file with: 

<pre> ```json { "active": "2022.8.1.53", "2022.8.1.53": "C:\\ProgramData/GameMakerStudio2/Cache/runtimes\\runtime-2022.8.1.53&https://gms.yoyogames.com/Zeus-Runtime.rss" } ``` </pre>

this tricks gamemaker into using the correct runtime for compiling in the editor. we’re not done yet though! head back to gamemaker and click File -> Preferences -> click the arrow next to runtime feeds -> then Master. click the refresh button below the "Clean Runtimes Now" Button. if the running text has disappeared,  scroll down and check if the 2022.8.1.53 says running rather then the download icon. if the latest runtime still displays running, double check you have saved the json, close and reopen it and make sure all of the json editing is done while gamemaker is open on the project window. to test this make a new project, do not open an existing project, doing so could corrupt the it making it unusable. once youve made a new project place a simple sprite in the screen and test the project. if it runs we are in the home stretch. if the output displays no text at all, double check the previous steps are done correctly.

you must edit the runtime json each time gamemaker is opened! don't forget!

### Step 3. Compile the switch nsp
now extract the RussellNX 7z and open the exe. once opened for the first time it will complain about the runtime, ignore it and click ok. then click your prod.keys file (which can be obtained from lockpick rcm or you can venture the seven seas to find them). once done you will be greeted with a menu which is fairly simple so i wont provide that in depth instructions. click the 3 dots next to "No Project!" and select the new project we made earlier. then click the drop down menu next to the runtime version text and select the 2022.8.1.53 runtime, no other runtime will work. then click "Build .NSP!" once complete it should output an nsp and show you in a new window. install it on your switch and it should work!

quick note: once you use a title id, trying to change any setting besides project settings will show the same on switch from the first install. if you wanna change the title id, make sure no other game is using it. just google the title id and if no switch games appear your good! (some title ids examples: 01dfc1683e460000, 01b8b181f4bb0000, 016c7bbe06c00000)

## Contributions 
you wanna help! good golly thank you!

stuff:

Mods can not be added unless approved by me and the creator of the mod.

its recommended to fix issues in the read me's Current Progress table, although fixes or additions of any kind are allowed.

## Suggestions
On the discord you can suggest games to add in the sugestion thread as long as they are made in gamemaker and are compiled in vm or have the source code public. ycc compiled projects without source code will be rejected.

