# Gamemaker switch ports

Discord: https://discord.gg/cc2YA2pChU

A repository containing ports of GameMaker games for the Nintendo Switch.

## Current Progress
| Game | Progress info |
| ------------- | ------------- |
| Sugary Spire Exhibition Night | 50% done. 60 fps (maybe) 90% of the time, slows down after fadeouts. needs sounds implemented. Besides that fully playable|
| Pizza Tower Sage 19 Plus | 30% done. 20 fps on hardware, needs sounds implemented, screen size broken|
| Sugary Spire United | 40% done. 60 fps, crashes after titlescreen and on 3rd menu option on switch|


currently being thought of:
Scampton The Great -- i have "ported" it, which i mean the menu works on switch but no controller support which i have to add manually

## Compiling
Don't worry! no nintendo sdk nor illegal content is required!

also all of this took me 7 months to figure out so i hope you find it useful :D


### Step 1. Gather required files
Before we start, here's what you need to download

[GameMaker 2023.2.0.71](https://gms.yoyogames.com/GameMaker-Installer-2023.2.0.71.exe) — Latest editor that uses the 2023.2.0.87 runtime

[RussellNX](https://download1590.mediafire.com/hmkhiqsh3gmgGQ2mU_BBWDSPGK1J-KjgHppkmEJAt8CBQCy1_dSemVw8TKuOfxSoO7TS3cs461k6NwA7zohTWNaI3Tk-J6ARZNGfmmMWW2SrAMpCC8VX2u0JjExY6pyu_u4RS79QShUbXGoMRvK7qd6ZAUbh-TFbm5cIAuJ9F03ZRA/14u0aabz3oligjk/RussellNX.zip) — Tool to compile games for Switch ([more info here](https://gbatemp.net/threads/play-port-your-gamemaker-games-on-nintendoswitch.519660/))

[Brain](https://i.ytimg.com/vi/WtO3AHMBePY/mqdefault.jpg) — Heavily required for thinking

### Step 2. gamemaker
First install (or i recommend extracting the installer with 7zip) and open GameMaker. to test if GameMakers working, make a new project and place a simple sprite in the screen and test the project. if it works, congrats! move on to the next step. else if the output stays gray, check you are using the right runtime.

### Step 3. Compile the switch nsp
now extract the RussellNX file we downloaded and open the exe. once opened for the first time it will complain about the runtime, ignore it and click ok. then click your prod.keys file (which can be obtained from lockpick rcm or you can venture the seven seas to find them). once done you will be greeted with a menu which is fairly simple so i wont provide that in depth instructions. click the 3 dots next to "No Project!" and select the new project we made earlier. then click the drop down menu next to the runtime version text and select the 2023.2.0.87 runtime, no other runtime will work. then click "Build .NSP!" once complete it should output an nsp and show you in a new window. install it on your switch and it should work!

quick note: once you use a title id, trying to change any setting besides project settings will show the same on switch from the first install. if you wanna change the title id, make sure no other game is using it. just google the title id and if no switch games appear your good! (some title ids examples: 01dfc1683e460000, 01b8b181f4bb0000, 016c7bbe06c00000)

## Issues!!!!!

### ** My Game Isn't saving**
Add this:
```gml
function fixed_ini_close(){
	ini_close();
	
	if os_type = os_switch
		switch_save_data_commit();
}
```
and replace all ini_close() with fixed_ini_close()


### **Switch crashes but pc doesn't**
look for extentions like gameframe, and nekopressence/discord rich pressence. those two cause crashes on pc.


### **My Fmod doesn't work!**
As of right now, fmod can't work with the current runtime so your out of luck


### **[[Blank]] Gamemaker function doesn't exist?**
unsurprisingly, older versions don't have some features. crazy i know. you have to reimplement these by hand with your own custom functions that do the same thing.


### **My video isn't working!**
I'll write this up later, but it is possble through some shader stuff

## **Suggestions**
On the discord you can suggest games to add in the sugestion thread as long as they are made in gamemaker and are compiled in vm or have the source code public. ycc compiled projects without source code will be rejected.

