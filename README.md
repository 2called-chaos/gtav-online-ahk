# GTA V Online AHK-Macros

Provides hotkeys for several useful features in GTA V:Online, see list further down.


**NOTE**: I tested this on my SC installation and with my account. If something doesn't work, ask (open issue)!
          I evidently do heists most of the time so if you have ideas for useful CEO macros, let me know
          or just send them in!


## Requirements

  * [AutoHotkey](https://www.autohotkey.com/)
  * [pssuspend.exe and pskill.exe](https://docs.microsoft.com/en-us/sysinternals/downloads/pssuspend) in your path (for force disconnect and process killing, see instructions below)


## Installation

  * Download the .ahk file
  * Open it in a text editor (e.g. notepad++ with AutoIT syntax highlighting)
  * Consider creating a config.ahk and copy lines you want to change over there (so you can update, see Config further down)
  * Change the hotkeys ([key list](https://www.autohotkey.com/docs/KeyList.htm)) and other options as you desire
  * Doubleclick the .ahk file (open with AHK) Note: On Windows 10 right click -> run as admin might be necessary


## Installation (pssuspend.exe / pskill.exe)

pssuspend.exe and pskill.exe are tools from the sysinternals collection. You can download the whole package (~3MB) [directly from Microsoft](https://docs.microsoft.com/en-us/sysinternals/downloads/pssuspend).
You can copy them all but we only need pssuspend and pskill so go ahead and extract/copy `pssuspend.exe` `pskill.exe` to ANY of the following:

* into the same location where the .ahk file is
* C:\Windows
* C:\Windows\system32

**NOTE:** Start the pssuspend.exe AND pskill.exe once by double clicking on it and accept the license agreement or it will silently fail.


## Usage

* On Windows 10 you might have to start the AHK script as administrator (right click -> Run as administator)
* You should run the game in window(ed fullscreen) or some functions will alt-tab you and will not work properly
* You will have to toggle VIP/CEO/MC mode manually since the interaction menu will be changed and most functions need to be aware of that.
* Doesn't work well inside apartments, maybe in CEO mode while not being one (menu changes)
* The interaction menu is often delayed the first time it's opened after loading screens or cutscenes.
  Make sure to briefly open the interaction menu from time to time, escpecially after loading/cutscenes.
  Alternatively you can increase the IntMenuDelay setting for more accuracy but making the process slower in general.
* Needless to say, don't give inputs while a macro is running or it might do random shit
* Sometimes you might find that the script doesn't appear to do anything. This might happen if you start
  the game after the AHK script. Reloading it (right click on systray icon -> reload script) fixes that usually.


## Config

You can (optionally) create a file `config.ahk` in the same location as the main script to overwrite settings without needing
to change the main file making updates easier. You can include any or all settings in the top of the script.

```ahk
SnackMenuKey := "F12" ; change a single key bind

; add a chat snippet
ArrayChatSnippets.push("Hey there!")

; start with a clear list (discard default snippets by clearing array)
ArrayChatSnippets := []
ArrayChatSnippets.push("The one and only snippet!")

; custom keybind, see custom additions (if you want all your keybind settings in one place)
Hotkey, ^F6, ExampleMacro
```

## Custom additions

You can (optionally) create a file `custom.ahk` in the same location as the main script to add custom macros without needing
to change the main file making updates easier.

```ahk
; directly bind onto a key with double-colons
^F3::
  ; do something
  return

; AHK hotstring (typing ll<tab> will trigger this example)
::ex::
  goto ExampleMacro
  return

; target macro for the hotstring above
ExampleMacro:
  SplashTextOn 250, 20, Foo, Bar
  Sleep 1000
  SplashTextOff
  return

; hotstring an existing macro from the main file
::lester::
  goto CallLester
  return

; handy for when you modifying or adding stuff
::rel::
  SplashTextOn 250, 20, Reloading, Reloading script...
  Sleep 1000
  Reload
  return
```


## Updates

Since v1.2.0 the script includes a simple auto updater. By default it will check for a new version on GitHub every time you launch the script.
If a new (or actually different) version is found it will prompt you to proceed or cancel.
See the readme section about using config.ahk if you plan on changing settings as the update will replace the main script file!

You can disable the automatic check and/or bind a manual check to a hotkey in the configuration (`DoCheckForUpdates` and `CheckForUpdatesKey`).
Note that the update check hotkey still only works when GTA is active.


## Will I get banned?

I'm not aware of any bans issued by Rockstar following the usage of AHK-scripts. I personally use AHK-scripts within
GTA:O since 2014 and did not get banned. This is also not the only AHK-script available, I'm sure many are using them.
At the end it's your call but I'm 99% certain that it wont get you banned.


## Available macros

I might forget to update so just check available keybinds :)

* **SnackMenu** – Opens the snack menu
* **AutoHealth** – Consumes 2 snacks (from position 2) and closes menu
* **ArmorMenu** – Opens the armor menu
* **AutoArmor** – Consumes one super heavy armor and closes menu
* **RetrieveCar** – Retrieve your current active personal vehicle
* **TogglePassive** – Toggle passive mode
* **EquipScarf** – Equip scarf (heist outfit speed, see miscellaneous)
* **CycleOutfit** – Cycle through your saved outfits
* **ToggleVIP** – Toggle VIP(/CEO/MC) mode
* **ToggleCPH** – Toggle CPH (Cayo Perico Heist Final) mode
* **ToggleAFK** – Toggle AFK mode
* **ToggleClicker** – Toggle auto clicker
* **ToggleRadar** – Toggle extended radar
* **ToggleAutoHeli** – Keeps throttle and pitch forward pressed, poor mans autopilot
* **CEOBuzzard** – Spawn a free CEO Buzzard
* **RequestSparrow** – Call in your Sparrow (or whatever you last requested moon pool vehicle was)
* **ReturnSparrow**: – Return your Sparrow to the Kosatka
* **RandomHeist** – Join a random heist (on-call) solo aka don't invite friends in session
* **ForceDisconnect** – Force disconnect the game by freezing the process for 10 seconds (requires pssuspend.exe)
* **KillGame** – Kill the game process immediately (requires pskill.exe)
* **ChatSnippets** – Select a sentence from a configurable list which will get typed out in the game (chat should already be open)
* **DialDialog** – Select a number from a list and call it automatically (add items, change order or remove entries in config)
* **CheckForUpdates** – Manually check for updates

The following calls can be directly bound to a hotkey (adding more is trivial):

* **CallAssistant**
* **CallInsurance**
* **CallLester**
* **CallMechanic**
* **CallMerryweather**
* **CallPegasus**

You can reach more (useful or useless contacts) by binding `DialDialog`


## Miscellaneous

#### modifier keys for hotkeys

If it's not clear enough from the key list. You can use [these symbols](https://autohotkey.com/docs/Hotkeys.htm#Symbols) in
combination with keys. For example `F1` to equip armor and `+F1` (shift+F1) to just open the menu.

#### "cheat codes"

With AHK's hotstrings you could achieve something like the good old cheat codes to trigger macros.
The issue is just to find words that won't trigger things like chat or the interaction menu.

```ahk
::lester::
  GoTo CallLester
  return
```

This would allow you (in theory) to type "lester" followed by a TAB to trigger the macro. But again,
`t` would open the chat usually and break the macro.

#### Scarf / Heist outfit

Yo, what's up with the scarf macro? Well if you have played normal heists with the heavy outfit once
you know that you are slower but take less damage with them. Given that you play with a player saved
heist outfit and own a scarf you can get rid of the armor and its speed effect while still keeping
the protective aspects of it.

[![gif](https://i.imgur.com/YbD6MJa.gif)](https://imgur.com/OI1g0Xz)

Just beware: Some cutscenes may remove the protective effect, quick-restart most certainly will remove
the effect and some checkpoints will give you the armor back (visibly) and some wont. If you get the armor
back you can repeat the scarf equip, otherwise no heist outfit for the rest of the mission.

I use it for example for the Pacific finale and equip the scarf after leaving the bank.


## Contributing

  Contributions are very welcome! Either report errors, bugs and propose features or directly submit code:

  1. Fork it
  2. Create your feature branch (`git checkout -b my-new-feature`)
  3. Commit your changes (`git commit -am 'Added some feature'`)
  4. Push to the branch (`git push origin my-new-feature`)
  5. Create new Pull Request

  Please use spaces for indentation and try to mimic the style off existing code :)

## Legal

This repository is licensed under the MIT license.
