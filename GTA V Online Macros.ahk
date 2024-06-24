; v1.3.1
; ^ don't remove or alter this line (autoupdate)
#MaxThreadsPerHotkey 2

;
; GTA V Online AHK-Macros v1.4.0 by 2called-chaos/mannly01
; based on/inspired by GTA V Useful Macros v4.21 by twentyafterfour
;
; # Description
;
; Provides hotkeys for opening snack menu, equipping armor, entering passive mode and much more.
;
;
; # General Notes
;
;   * Read the god damn readme, please! https://github.com/2called-chaos/gtav-online-ahk/blob/master/README.md
;   * After cutscenes or just from time to time the interaction menu lags
;     and the macro won't work. Periodically, especially after loading/cutscenes
;     press m and backspace (aka open the menu once)
;   * If you add something consider committing a pull request so we can all enjoy (VIP stuff for example)
;
;
; # Hotkeys / Binding:
;
; To change a hotkey for a macro change the configuration section at the top of the file
; or even better copy the line to your config.ahk (see Readme) and change it there.
; A list of keynames for the non-alphanumeric can be found in the autohotkey help under
; the heading "Basic Usage and Syntax" with the name "Key List".
; They can also be found at https://www.autohotkey.com/docs/KeyList.htm
;
;
; # FAQ, Docs, Source, Bugs, etc.
;
; Read the wiki, propose features, fix and/or report bugs... it's all yours at
;
;     https://github.com/2called-chaos/gtav-online-ahk
;



; ==============================
; === CONFIGURATION GOES vvv ===
; ==============================

; Bindings (bind the desired functions to a key of your choice)
;   https://www.autohotkey.com/docs/KeyList.htm
; WARNING: If you don't want to use a certain binding use "F24"
;          or any other valid key or it will break!
; Consider using a config.ahk!
SnackMenuKey         := "+#" ; Open Snack menu (+ = shift, rtfm).
AutoHealthKey        := "#" ; Automatic snacking. Eats 2 snacks from second snack slot.
ArmorMenuKey         := "+F1" ; Open Armor menu.
AutoArmorKey         := "F1" ; Automatic armor equip (uses super heavy armor only).
RetrieveCarKey       := "F2" ; Request currently active Personal Vehicle.
ReturnCarKey         := "^F2" ; Return the currently active Personal Vehicle.
ToggleRadarKey       := "+F2" ; Toggle between extended and standar radar.
CEOBuzzardKey        := "F3" ; Spawn free CEO buzzard.
RequestSparrowKey    := "+F3" ; Call in your Sparrow (or whatever you last requested moon pool vehicle was).
ReturnSparrowKey     := "^F3" ; Return your Sparrow to the Kosatka.
RequestKosatkaKey    := "F24" ; Call in your Kosatka Submarine.
ForceDisconnectKey   := "F12" ; Force disconnect by suspending process for 10s, requires pssuspend.exe.
KillGameKey          := "+F12" ; Kill game process, requires pskill.exe.
ToggleVIPKey         := "NumpadMult" ; Toggle VIP mode (required when VIP/CEO/MC).  Won't have effect if using ManualInventoryLocation option.
ToggleCPHKey         := "^NumpadMult" ; Toggle Cayo Perico Heist Final mode (extra menu entry), also see DoToggleCPHWithVIP.  Won't have effect if using ManualInventoryLocation option.
ToggleAFKKey         := "+NumpadMult" ; Toggle AFK mode.

TurnOnCEOKey         := "+F10" ; Makes you CEO of an Organization and toggles VIP mode.
TurnOnPresKey        := "^F10" ; Makes you President of a MC Club and toggles VIP mode.
ResignOrDisbandKey   := "F10" ; Resigns your CEO position or Disbands your MC Club and toggles VIP mode.

TogglePassiveKey     := "F24" ; Toggle passive mode.
ToggleClickerKey     := "F24" ; Toggle Clicker (XButton2 = Mouse5).
ToggleAutoHeliKey    := "F24" ; Keeps throttle and pitch forward pressed, First take heli to sufficient height and then use this as autopilot.
ToggleAutoPlaneKey   := "F24" ; Keeps throttle at max for plane autopilot.
ChatSnippetsKey      := "F24" ; Gives you a few text snippets to put in chat (chat must be already open).
CycleOutfitKey       := "F24" ; Equip next/cycle through saved outfits.
RandomHeistKey       := "F24" ; Chooses on-call random heist from phone options.
EquipScarfKey        := "F24" ; Equip first scarf (heist outfit glitch, see readme/misc).

NewInviteSessionKey  := "F11" ; Join a New Invite Only Session.
NewCrewSessionKey    := "+F11" ; Join a New Crew Only Session.
NewFriendSessionKey  := "^F11" ; Join a New Friend Only Session.

DialDialogKey        := "+F5" ; Call GUI with a list of almost all numbers.
CallMechanicKey      := "F5" ; Call Mechanic.
CallPegasusKey       := "F24" ; Call Pegasus.
CallMerryweatherKey  := "F24" ; Call Merryweather.
CallInsuranceKey     := "F6" ; Call Insurance.
CallLesterKey        := "+F6" ; Call Lester.
RemoveWantedLevelKey := "F24" ; Call Lester and have him remove wanted level.
CallAssistantKey     := "^F6" ; Call Assistant.

CheckForUpdatesKey   := "F24" ; Checks on startup by default, see DoCheckForUpdates option.


; ManualInventoryLocation (manual inventory line calibration)
ManualInventoryLocation := false        ; if true, use manual calibration of the inventory line in the interactive menu. IsCPHActive and IsVIPActive flags will be ignored.
InvLocation             := 4            ; by default, this is the location of the inventory in the menu.
AutoSnackLocation       := 2            ; by default, this is the snack autosnack will select.
; these keys will not be bound if ManualInventoryLocation is false.
IncInvKey               := "NumpadAdd"  ; for increasing the value of the inventory line.
DecInvKey               := "NumpadSub"  ; for decreasing the value of the inventory line.
IncSnackKey             := "^NumpadAdd" ; for increasing the line for the snack selected by autosnacking.
DecSnackKey             := "^NumpadSub" ; for decreasing the line for the snack selected by autosnacking.


; Options (should be fine out of the box)
WindowScale          := 1.0       ; Change this to reflect your Windows display scale (e.g. set it to 3 if you have UI scale set to 300%).
DoConfirmKill        := true      ; If true the KillGame action will ask for confirmation before killing the process.
DoConfirmDisconnect  := true      ; If true the ForceDisconnect action will ask for confirmation before suspending the process.
IntDisconnectDelay   := 10        ; Amount of seconds to freeze the process for, 10 works fine.
DoToggleCPHWithVIP   := false     ; If true ToggleVIP will become a 3-way toggle (off/on/CayoPericoHeistFinal).
DisableCapsOnAction  := true      ; Disable caps lock before executing macros, some macros might fail if caps lock is on.
DoCheckForUpdates    := true      ; Check for script updates on startup (you can manually bind this instead or additionally).


; Internal variables (probably no need to edit)
IsVIPActivated       := false ; Initial status of CEO/VIP mode (after (re)loading script).
IsAFKActivated       := false ; Initial status of AFK mode (should always be false).
IsCPHActivated       := false ; Initial status of CPH mode (should always be false).
IsClickerActivated   := false ; Initial status of Clicker (should always be false).


; Chat snippets (you can add more, comment them out or remove them, the pushs that is)
ArrayChatSnippets := []
ArrayChatSnippets.push("Player saved outfits please :)")
ArrayChatSnippets.push("Yay, cheaters")
ArrayChatSnippets.push("I take that explosive sniper of yours and insert it sideways...")
ArrayChatSnippets.push("You want some cool AHK macros? github.com/2called-chaos/gtav-online-ahk")


; Delays (you normally don't want to change these, you can try to play with these values if you have a slow/fast PC)
IntFocusDelay        := 100  ; delay (in ms) after focussing game when AHK-GUI took focus.
IntMenuDelay         := 120  ; delay (in ms) after opening interaction menu.
IntPhoneMenuDelay    := 750 ; delay (in ms) after opening phone menu.
IntPhoneMenuDelay2   := 250  ; delay (in ms) after selecting phone menu entries.
IntPhoneScrollDelay  := 75   ; delay (in ms) between scrolls in the phone menu.
IntKeySendDelay      := 25   ; delay (in ms) delay between send key commands.
IntKeyPressDuration  := 5    ; duration (in ms) each key press is held down.


; In case you changed your ingame bindings:
global IGB_Interaction := "m"
global IGB_Phone := "up"
global IGB_PhoneSpecial := "space"
global IGB_Pause := "p"
; the following refer to your phone binding and also apply to the interaction menu
global IGB_Up := "up"
global IGB_Down := "down"
global IGB_Left := "left"
global IGB_Right := "right"
global IGB_Enter := "enter"
; the following refer to movement (used for AFK)
global IGB_MoveLeft := "a"
global IGB_MoveRight := "d"
; aircraft/helicopter
global IGB_ThrottleUp := "w"
global IGB_PitchForward := "Numpad8"
global IGB_PitchBack := "Numpad5"


; Phone numbers for DialDialog GUI dialog (you can change the order if you want or hide entries by commenting them out)
ArrayPhonebook := []
ArrayPhonebook.push("911           - Emergency Services")
ArrayPhonebook.push("346-555-0137  - Assistant")
ArrayPhonebook.push("328-555-0153  - Mechanic")
ArrayPhonebook.push("611-555-0149  - Mors Mutual Insurance")
ArrayPhonebook.push("328-555-0122  - Pegasus Lifestyle Management")
ArrayPhonebook.push("273-555-0120  - Merryweather Security")
ArrayPhonebook.push("346-555-0176  - Atomic Blimp")
ArrayPhonebook.push("323-555-5555  - Downtown Cab Co.")
ArrayPhonebook.push("346-555-0102  - Lester Crest")
ArrayPhonebook.push("273-555-0172  - Captain (Yacht)")
ArrayPhonebook.push("273-555-0185  - Brucie (Bull Shark Testosterone)")
ArrayPhonebook.push("346-555-0141  - Lamar (Mugger/Mission)")
ArrayPhonebook.push("346-555-0188  - Martin Madrazo (Job)")
ArrayPhonebook.push("328-555-0198  - Ron (Job)")
ArrayPhonebook.push("611-555-0120  - Simeon (Job)")
ArrayPhonebook.push("611-555-0152  - Gerald (Job)")
ArrayPhonebook.push("020-755-0152  - Agent 14 (?)")
ArrayPhonebook.push("273-555-0193  - Benny (broken?)")
ArrayPhonebook.push("611-555-0192  - Paige (?)")
ArrayPhonebook.push("273-555-0180  - Bryony (?)")
ArrayPhonebook.push("346-555-0196  - Wendy (?)")

; Hookers
ArrayPhonebook.push("611-555-0163  - Chastity (Prostitute)")
ArrayPhonebook.push("328-555-0167  - Cheetah (Prostitute")
ArrayPhonebook.push("346-555-0186  - Fufu (Prostitute)")
ArrayPhonebook.push("611-555-0184  - Infernus (Prostitute)")
ArrayPhonebook.push("346-555-0183  - Nikki (Prostitute)")
ArrayPhonebook.push("273-555-0189  - Peach (Prostitute)")
ArrayPhonebook.push("328-555-0177  - Sapphire (Prostitute)")

; Random stuff
;ArrayPhonebook.push("555-0182      - (useless) *modem* ")
;ArrayPhonebook.push("1-999-9327667 - (useless) *holding music* ")
;ArrayPhonebook.push("425-555-0170  - (useless) 'This mailbox is full' ")
;ArrayPhonebook.push("310-555-0156  - (useless) *Pickup* .. *Hangup*")
;ArrayPhonebook.push("1-999-768822  - (useless) 'This number is no longer in service'")
;ArrayPhonebook.push("273-555-0155  - (useless) Truthseeker Helpline")


; Create a file (at the same location as this one) named "config.ahk"
; and overwrite settings without changing them here (easier to update).
; See Readme for more info.
#Include *i config.ahk


; ==============================
; === CONFIGURATION GOES ^^^ ===
; ==============================






; ================================================
; === Are you sure you want to scroll further? ===
; ================================================


#NoEnv
SetWorkingDir A_ScriptDir

; Disables hotkeys when alt-tabbed or GTA is closed.
#IfWinActive ahk_class grcWindow

; Hotkey/Function mapping
Hotkey, %CheckForUpdatesKey%, CheckForUpdates
Hotkey, %SnackMenuKey%, SnackMenu
Hotkey, %AutoHealthKey%, AutoHealth
Hotkey, %ArmorMenuKey%, ArmorMenu
Hotkey, %AutoArmorKey%, AutoArmor
Hotkey, %TogglePassiveKey%, TogglePassive
Hotkey, %RetrieveCarKey%, RetrieveCar
Hotkey, %ReturnCarKey%, ReturnCar
Hotkey, %EquipScarfKey%, EquipScarf
Hotkey, %CycleOutfitKey%, CycleOutfit
Hotkey, %ToggleVIPKey%, ToggleVIP
Hotkey, %ToggleCPHKey%, ToggleCPH
Hotkey, %ToggleAFKKey%, ToggleAFK
Hotkey, %TurnOnCEOKey%, TurnOnCEO
Hotkey, %TurnOnPresKey%, TurnOnPres
Hotkey, %ResignOrDisbandKey%, ResignOrDisband
Hotkey, %ToggleClickerKey%, ToggleClicker
Hotkey, %ToggleRadarKey%, ToggleRadar
HotKey, %ToggleAutoHeliKey%, ToggleAutoHeli
Hotkey, %ToggleAutoPlaneKey%, ToggleAutoPlane
Hotkey, %KillGameKey%, KillGame
Hotkey, %ForceDisconnectKey%, ForceDisconnect
Hotkey, %RandomHeistKey%, RandomHeist
Hotkey, %ChatSnippetsKey%, ChatSnippets
Hotkey, %CEOBuzzardKey%, CEOBuzzard
Hotkey, %RequestSparrowKey%, RequestSparrow
Hotkey, %ReturnSparrowKey%, ReturnSparrow
Hotkey, %RequestKosatkaKey%, RequestKosatka
Hotkey, %NewInviteSessionKey%, NewInviteSession
Hotkey, %NewCrewSessionKey%, NewCrewSession
Hotkey, %NewFriendSessionKey%, NewFriendSession
Hotkey, %DialDialogKey%, DialDialog
Hotkey, %CallMechanicKey%, CallMechanic
Hotkey, %CallPegasusKey%, CallPegasus
Hotkey, %CallMerryweatherKey%, CallMerryweather
Hotkey, %CallInsuranceKey%, CallInsurance
Hotkey, %CallLesterKey%, CallLester
Hotkey, %RemoveWantedLevelKey%, RemoveWantedLevel
Hotkey, %CallAssistantKey%, CallAssistant

if(ManualInventoryLocation) {
  Hotkey, %IncInvKey%, IncrementInventoryLocation
  Hotkey, %DecInvKey%, DecrementInventoryLocation
  Hotkey, %IncSnackKey%, IncrementSnackLocation
  Hotkey, %DecSnackKey%, DecrementSnackLocation
}

; Sets delay(ms) between keystrokes issued. Arguments are delay between keystrokes and press duration, respectively.
; They might be able to go lower but these values are pretty fast and work reliably.
setkeydelay, IntKeySendDelay, IntKeyPressDuration

; Check for updates?
if (DoCheckForUpdates) {
  performUpdateCheck(true)
}

; setup done, only functions and macros follow
Return

; Create a file (at the same location as this one) named "custom.ahk"
; and add functions or macros.
#Include *i custom.ahk



; =================
; === Functions ===
; =================

turnCapslockOff() {
  global DisableCapsOnAction
  if (!DisableCapsOnAction)
    return
  if (GetKeyState("CapsLock", "T") = 1) {
    ;Input, SingleKey, V L1
    SetCapsLockState, off
  }
}

openInteractionMenu(isVIPActive, isCPHActive, goingDown) {
  global IntMenuDelay
  global ManualInventoryLocation
  global InvLocation
  turnCapslockOff()
  Send {%IGB_Interaction%}
  sleep, IntMenuDelay

  if goingDown {
    TimesDown := 0
    if (ManualInventoryLocation = 1) {
      TimesDown := InvLocation - 1
    }
    else {
      if (isCPHActive = 1) {
        TimesDown := 2
      }
      ; else if (isVIPActive = 1) {
      ;   TimesDown := 1
      ; }
    }
    Loop %TimesDown% {
      Send {%IGB_Down%}
    }
  }
}

openSnackMenu() {
  global ManualInventoryLocation
  if !ManualInventoryLocation
    Send {%IGB_Down%}{%IGB_Down%}{%IGB_Down%}{%IGB_Down%}
  Send {%IGB_Enter%}{%IGB_Down%}{%IGB_Down%}{%IGB_Enter%}
}

openArmorMenu() {
  global ManualInventoryLocation
  if !ManualInventoryLocation
    Send {%IGB_Down%}{%IGB_Down%}{%IGB_Down%}{%IGB_Down%}
  Send {%IGB_Enter%}{%IGB_Down%}{%IGB_Enter%}
}

openOutfitMenu() {
  global ManualInventoryLocation
  if !ManualInventoryLocation
    Send {%IGB_Down%}{%IGB_Down%}{%IGB_Down%}
  Send {%IGB_Down%}{%IGB_Down%}{%IGB_Enter%}{%IGB_Down%}{%IGB_Down%}{%IGB_Down%}
}

openPhone() {
  global IntPhoneMenuDelay

  ; Opens Phone Menu
  turnCapslockOff()
  Send {%IGB_Phone%}

  ; Necessary delay to allow phone menu to open properly (which it often doesn't anyways)
  sleep, IntPhoneMenuDelay
}

scrollPhoneUp(by = 1) {
  global IntPhoneScrollDelay
  Loop %by% {
    MouseClick, WheelUp, , , 20, 0, D, R
    Sleep IntPhoneScrollDelay
  }
}

makeCall(scrollUp, doOpenPhone = false, menu = 2) {
  global IntPhoneMenuDelay2
  global IntKeySendDelay
  turnCapslockOff()
  if(doOpenPhone)
    openPhone()

  ; go to contacts
  scrollPhoneUp(menu)
  sleep IntKeySendDelay
  Send {%IGB_Enter%}
  sleep IntPhoneMenuDelay2

  ; scroll to contact
  scrollPhoneUp(scrollUp)

  ; call it
  Send {%IGB_Enter%}
}

dialNumber(number, doOpenPhone = false) {
  global IntKeySendDelay
  global IntKeyPressDuration
  global IntPhoneScrollDelay
  global IntPhoneMenuDelay2

  turnCapslockOff()
  if(doOpenPhone)
    openPhone()

  ; go to contacts
  scrollPhoneUp(2)
  Send {%IGB_Enter%}
  sleep IntPhoneMenuDelay2

  ; enter number screen
  Send {%IGB_PhoneSpecial%}
  sleep IntPhoneMenuDelay2

  ; change key delay for this function
  setkeydelay IntPhoneScrollDelay, IntKeyPressDuration

  ; cleanup number
  number_clean := RegExReplace(number, "[^0-9]", "")

  ; enter the actual number
  pointer := 1
  Loop, parse, number_clean
  {
    deltax := _phonePointerCol(A_LoopField) - _phonePointerCol(pointer)
    deltay := _phonePointerRow(A_LoopField) - _phonePointerRow(pointer)

    ; wrap around shortcuts
    if (deltax = 2)
      deltax := -1
    if (deltax = -2)
      deltax := 1
    if (deltay = -3)
      deltay := 1
    if (deltay = 3)
      deltay := -1

    ; move pointer
    if (deltax > 0)
      Send {%IGB_Right% %deltax%}

    if (deltay > 0)
      Send {%IGB_Down% %deltay%}

    if (deltax < 0) {
      deltax := Abs(deltax)
      Send {%IGB_Left% %deltax%}
    }

    if (deltay < 0) {
      deltay := Abs(deltay)
      Send {%IGB_Up% %deltay%}
    }

    pointer := A_LoopField
    Send {%IGB_Enter%}
  }

  ; reset key delay (should not be necessary)
  setkeydelay IntKeySendDelay, IntKeyPressDuration

  ; call it
  Send {%IGB_PhoneSpecial%}
}

_phonePointerRow(num) {
  if (num = 0)
    return 4
  else
    return Ceil(num / 3)
}

_phonePointerCol(num) {
  if (num = 0)
    return 2
  else
    div := Mod(num, 3)
    return div = 0 ? 3 : div
}

splashCountdown(title, message, seconds, addZero = false) {
  global WindowScale
  Loop %seconds% {
    SplashTextOn 250 * WindowScale, 20 * WindowScale, %title%, % StrReplace(message, "%i", seconds + 1 - A_Index)
    Sleep 1000
  }
  if(addZero) {
    SplashTextOn 250 * WindowScale, 20 * WindowScale, %title%, % StrReplace(message, "%i", 0)
    Sleep 1000
  }
}

bringGameIntoFocus(applyDelay = false) {
  global IntFocusDelay
  WinActivate ahk_class grcWindow
  if(applyDelay)
    Sleep IntFocusDelay
}



; ==============
; === UPDATE ===
; ==============
performUpdateCheck(silentSuccess = false) {
  URLDownloadToFile,https://raw.githubusercontent.com/2called-chaos/gtav-online-ahk/master/GTA`%20V`%20Online`%20Macros.ahk,update.txt
  if (errorlevel) {
    msgbox, 0, Error - GTA V Online AHK-Macros, Received error response from GitHub and update check was canceled.`nPlease retry later or check manually.`n`nHint: Set DoCheckForUpdates to false to disable automatic checking!
    FileDelete, update.txt
    return
  }

  FileReadLine, update, update.txt, 1
  FileReadLine, currentVersion, %A_ScriptName%, 1
  if (update = currentVersion) {
    FileDelete, update.txt
    if (!silentSuccess)
      msgbox, You are running the latest version!`n`n%update%`n`nIf something doesn't work please let me know!`n`nhttps://github.com/2called-chaos/gtav-online-ahk
  } else if (InStr(update, "; v") = 1) {
    MsgBox, 4, Update available! - GTA V Online AHK-Macros, A new version of GTA V Online AHK-Macros has been released!`n`n%currentVersion% <-- your version`n%update% <-- available update`n`nWould you like to update?`n`nWarning: If you don't use config.ahk this might reset all your settings!
    IfMsgBox Yes
    {
      FileCopy, update.txt, %A_ScriptName%, 1
      FileDelete, update.txt
      msgbox, 0, Update successful! - GTA V Online AHK-Macros, Update successful, the script will now reload!`n`nHint: Check for new stuff `;)
      Reload
    }
    IfMsgBox No
    {
      msgbox, This script will NOT be updated!`n`nHint: Set DoCheckForUpdates to false to disable automatic checking!
      FileDelete, update.txt
    }
  } else {
    msgbox, 0, Error - GTA V Online AHK-Macros, Received invalid response from GitHub and update check was canceled.`nPlease retry later or check manually.`n`nHint: Set DoCheckForUpdates to false to disable automatic checking!
    FileDelete, update.txt
  }
}

CheckForUpdates:
  performUpdateCheck()
  return



; ===================
; === Subroutines ===
; ===================

; Force the game to disconnect by suspending the process for 10 seconds
; Requires pssuspend.exe (see readme)
ForceDisconnect:
  if (DoConfirmDisconnect) {
    MsgBox, 1, , Force disconnect?, 5
    IfMsgBox, Cancel
      Return
    IfMsgBox, Timeout
      Return
  }
  Run, pssuspend gta5.exe ,,Hide
  splashCountdown("ForceDisconnect", "Hang on tight (%i)", IntDisconnectDelay, true)
  Run, pssuspend -r gta5.exe ,,Hide
  Sleep 1000
  SplashTextOff
  bringGameIntoFocus()
  return

; kill game process
; Requires pskill.exe (see readme)
KillGame:
  if (DoConfirmKill) {
    MsgBox, 1, , Kill game process?, 30
    IfMsgBox, Cancel
      Return
    IfMsgBox, Timeout
      Return
  }
  Run, pskill gta5.exe ,,Hide
  return

; Toggle AFK (move left/right in a loop to not get kicked)
ToggleAFK:
  IsAFKActivated := !IsAFKActivated
  if (IsAFKActivated) {
    SplashTextOn 250 * WindowScale, 20 * WindowScale, AFK mode, AFK mode has been ACTIVATED
  } else {
    SplashTextOn 250 * WindowScale, 20 * WindowScale, AFK mode, AFK mode has been DEACTIVATED
  }
  Sleep 2000
  SplashTextOff
  bringGameIntoFocus()
  Sleep 100

  if (IsAFKActivated) {
    Loop {
      sleep, 500
      send, {%IGB_MoveLeft%}

      if (!IsAFKActivated) {
        break
      }

      sleep, 500
      send, {%IGB_MoveRight%}

      if (!IsAFKActivated) {
        break
      }
    }
  }
  return

; Toggle Radar
ToggleRadar:
  ; Open settings
  turnCapslockOff()
  SoundPlay, %A_WinDir%\Media\Windows Battery Critical.wav
  Send {%IGB_Pause%}

  ; Necessary delay to allow settings to open properly
  sleep, IntPhoneMenuDelay2

  ; Not using IGB_ variables on purpose as pause menu has static bindings
  Send {Right}{Right}{Right}{Right}{Right}
  Sleep IntPhoneMenuDelay2 * 2
  Send {Enter}
  Sleep IntPhoneMenuDelay2
  Send {Down}{Down}{Down}{Down}{Down}
  Sleep IntPhoneMenuDelay2
  Send {Enter}
  Sleep IntPhoneMenuDelay2
  Send {Down}{Down}{Down}{Down}{Down}
  Sleep IntPhoneMenuDelay2
  Send {Enter}
  Sleep IntPhoneMenuDelay2
  Send {%IGB_Pause%}
  return

; Toggle Clicker
ToggleClicker:
  IsClickerActivated := !IsClickerActivated
  if (IsClickerActivated) {
    SoundPlay, %A_WinDir%\Media\Windows Battery Critical.wav
  } else {
    SoundPlay, %A_WinDir%\Media\Windows Balloon.wav
  }
  bringGameIntoFocus()
  Sleep 10

  if (IsClickerActivated) {
    Loop {
      Click
      Sleep 10

      if (!IsClickerActivated) {
        break
      }
    }
  }
  return

; Toggle VIP mode (if VIP/CEO/MC all interaction menu entries are offset by one)
ToggleVIP:
  if (IsVIPActivated) {
    if (DoToggleCPHWithVIP) {
      if (IsCPHActivated) {
        IsCPHActivated := false
        IsVIPActivated := false
        SplashTextOn 280 * WindowScale, 20 * WindowScale, VIP&CPH mode, VIP&&CPH mode has been DEACTIVATED
      } else {
        IsCPHActivated := true
        SplashTextOn 350 * WindowScale, 20 * WindowScale, CPH mode, Cayo Perico Heist mode has been ACTIVATED
      }
    } else {
      IsVIPActivated := false
      SplashTextOn 250 * WindowScale, 20 * WindowScale, VIP mode, VIP mode has been DEACTIVATED
    }
  } else {
    IsVIPActivated := true
    SplashTextOn 250 * WindowScale, 20 * WindowScale, VIP mode, VIP mode has been ACTIVATED
  }
  Sleep 2000
  SplashTextOff
  bringGameIntoFocus()
  return

; Toggle CPH mode (Cayo Perico Heist Final)
ToggleCPH:
  IsCPHActivated := !IsCPHActivated
  if (IsCPHActivated) {
    SplashTextOn 350 * WindowScale, 20 * WindowScale, CPH mode, Cayo Perico Heist mode has been ACTIVATED
  } else {
    SplashTextOn 350 * WindowScale, 20 * WindowScale, CPH mode, Cayo Perico Heist mode has been DEACTIVATED
  }
  Sleep 2000
  SplashTextOff
  bringGameIntoFocus()
  return

; Makes you CEO of an Organization and toggles VIP mode.
TurnOnCEO:
  openInteractionMenu(false, false, false)
  Send {%IGB_Down%}{%IGB_Enter%}{%IGB_Enter%}{%IGB_Enter%}
  IsVIPActivated := true
  return

; Makes you President of a MC Club and toggles VIP mode.
TurnOnPres:
  openInteractionMenu(false, false, false)
  Send {%IGB_Down%}{%IGB_Enter%}{%IGB_Down%}{%IGB_Enter%}{%IGB_Enter%}
  IsVIPActivated := true
  return

; Resigns your CEO position or Disbands your MC Club and toggles VIP mode.
ResignOrDisband:
  openInteractionMenu(false, false, false)
  Send {%IGB_Enter%}{%IGB_Up%}{%IGB_Enter%}
  IsVIPActivated := false
  return

; Helicopter autopilot (hold throttle and forward)
AutoHeli:
  SetKeyDelay, -1
  if (autoHeliToggle) {
    Send, {Blind}{%IGB_ThrottleUp% DownTemp}
    Send, {Blind}{%IGB_PitchForward% DownTemp}
  } else {
    SetTimer, AutoHeli, OFF
    Send, {Blind}{%IGB_ThrottleUp% Up}
    Send, {Blind}{%IGB_PitchForward% Up}
  }
  return

; Toggle helicopter autopilot
ToggleAutoHeli:
  autoHeliToggle := ( autoHeliToggle ? 0 : 1 )
  if(autoHeliToggle) {
    SetTimer, AutoHeli, 50
    SoundPlay, %A_WinDir%\Media\Windows Battery Critical.wav
  } else {
    SoundPlay, %A_WinDir%\Media\Windows Balloon.wav
  }
  return

; Plane autopilot (hold throttle)
AutoPlane:
  SetKeyDelay, -1
  if (autoHeliToggle) {
    Send, {Blind}{%IGB_ThrottleUp% DownTemp}
  } else {
    SetTimer, AutoPlane, OFF
    SetTimer, AutoPlaneElevator, OFF
    Send, {Blind}{%IGB_ThrottleUp% Up}
  }
  return

; Plane Elevator Timer (Velum airplane constantly loses altitude with "neutral" elevator)
AutoPlaneElevator:
  SetKeyDelay, -1
  if (autoHeliToggle) {
    Send {%IGB_PitchBack%}
  }
  return


ToggleAutoPlane:
  autoHeliToggle := ( autoHeliToggle ? 0 : 1 )
  if (autoHeliToggle) {
    SetTimer, AutoPlane, 50
    SetTimer, AutoPlaneElevator, 5000
    SoundPlay, %A_WinDir%\Media\Windows Battery Critical.wav
  } else {
    SoundPlay, %A_WinDir%\Media\Windows Balloon.wav
  }
  return

IncrementInventoryLocation:
  InvLocation := InvLocation + 1
  SplashTextOn 350 * WindowScale, 20 * WindowScale, Increase Inventory Line, The Inventory Line is now %InvLocation%
  Sleep 2000
  SplashTextOff
  bringGameIntoFocus()
  return

DecrementInventoryLocation:
  InvLocation := InvLocation - 1
  if (InvLocation < 1) {
    InvLocation := 1
  }
  SplashTextOn 350 * WindowScale, 20 * WindowScale, Decrease Inventory Line, The Inventory Line is now %InvLocation%
  Sleep 2000
  SplashTextOff
  bringGameIntoFocus()
  return

IncrementSnackLocation:
  AutoSnackLocation := AutoSnackLocation + 1
  SplashTextOn 350 * WindowScale, 20 * WindowScale, Incease AutoSnack Line, The Snack Line is now %AutoSnackLocation%
  Sleep 2000
  SplashTextOff
  bringGameIntoFocus()
  return

DecrementSnackLocation:
  AutoSnackLocation := AutoSnackLocation - 1
  if (AutoSnackLocation < 1) {
  AutoSnackLocation := 1
  }

  SplashTextOn 350 * WindowScale, 20 * WindowScale, Decrease AutoSnack Line, The Snack Line is now %AutoSnackLocation%
  Sleep 2000
  SplashTextOff
  bringGameIntoFocus()
  return

; Open up snack menu for manual selection (or stock check) of snacks
SnackMenu:
  openInteractionMenu(IsVIPActivated, IsCPHActivated, true)
  openSnackMenu()
  return

; Automatic snacking. Eats 2 snacks from AutoSnackLocation slot and close menu.
AutoHealth:
  openInteractionMenu(IsVIPActivated, IsCPHActivated, true)
  openSnackMenu()
  if ManualInventoryLocation
    TimesDown := AutoSnackLocation - 1
  else
    TimesDown := 1
  Loop %TimesDown% {
    Send {%IGB_Down%}
  }
  Send {%IGB_Enter%}{%IGB_Enter%}{%IGB_Interaction%}
  return

; Open up armor menu for manual selection (or stock check) of armor
ArmorMenu:
  openInteractionMenu(IsVIPActivated, IsCPHActivated, true)
  openArmorMenu()
  return

; Equips super heavy armor and exits menu automatically
AutoArmor:
  openInteractionMenu(IsVIPActivated, IsCPHActivated, true)
  openArmorMenu()
  Send {%IGB_Down% 4}{%IGB_Enter%}{%IGB_Interaction%}
  return

; Equips scarf to allow faster running with heist armor (see readme/misc)
EquipScarf:
  openInteractionMenu(IsVIPActivated, IsCPHActivated, true)
  if !ManualInventoryLocation
    Send {%IGB_Down%}{%IGB_Down%}{%IGB_Down%}{%IGB_Down%}{%IGB_Down%}
  ; Opens scarf menu
  Send {%IGB_Down%}{%IGB_Enter%}
  ; equip scarf and exit menu. This line can be changed to pick different scarfs.
  Send {%IGB_Up% 4}{%IGB_Right%}{%IGB_Interaction%}
  return

; Cycle between your saved outfits
CycleOutfit:
  openInteractionMenu(IsVIPActivated, IsCPHActivated, true)
  openOutfitMenu()
  Send {%IGB_Right%}{%IGB_Enter%}{%IGB_Interaction%}
  return

; Toggle passive mode
TogglePassive:
  openInteractionMenu(false, false, false) ; Ignore VIP status when going up
  Send {%IGB_Up%}{%IGB_Enter%}{%IGB_Interaction%}
  return

; Retrieve your currently active vehicle
RetrieveCar:
  openInteractionMenu(IsVIPActivated, IsCPHActivated, true)
  if !ManualInventoryLocation
    Send {%IGB_Down%}{%IGB_Down%}
  Send {%IGB_Enter%}{%IGB_Enter%}{%IGB_Interaction%}
  return

; Return your currently active vehicle
ReturnCar:
  openInteractionMenu(IsVIPActivated, IsCPHActivated, true)
  if !ManualInventoryLocation
    Send {%IGB_Down%}{%IGB_Down%}
  Send {%IGB_Enter%}{%IGB_Up% 2}{%IGB_Enter%}{%IGB_Interaction%}
  return

; Chooses on-call random heist from phone options
RandomHeist:
  turnCapslockOff()
  makeCall(6, true, 1)
  sleep IntKeySendDelay
  Send {%IGB_Enter%}
  sleep IntKeySendDelay
  scrollPhoneUp(2) ; scroll up twice to solo-q
  Send {%IGB_Enter%}{%IGB_Enter%}
  return

; Calls in free CEO buzzard (if you are CEO)
CEOBuzzard:
  openInteractionMenu(false, false, false)
  Send {%IGB_Enter%}{%IGB_Up% 2}{%IGB_Enter%}{%IGB_Down% 4}{%IGB_Enter%}
  return

; Call in your Sparrow (or whatever you last requested moon pool vehicle was)
RequestSparrow:
  openInteractionMenu(IsVIPActivated, IsCPHActivated, true)
  if !ManualInventoryLocation
    Send {%IGB_Down%}{%IGB_Down%}{%IGB_Down%}
  Send {%IGB_Enter%}{%IGB_Up%}{%IGB_Up%}{%IGB_Enter%}{%IGB_Down%}{%IGB_Enter%}
  return

; Return your Sparrow to the Kosatka
ReturnSparrow:
  openInteractionMenu(IsVIPActivated, IsCPHActivated, true)
  if !ManualInventoryLocation
    Send {%IGB_Down%}{%IGB_Down%}{%IGB_Down%}
  Send {%IGB_Enter%}{%IGB_Up%}{%IGB_Up%}{%IGB_Enter%}{%IGB_Down% 3}{%IGB_Enter%}{%IGB_Up%}{%IGB_Up%}{%IGB_Enter%}
  return

; Call in your Kosatka Submarine
RequestKosatka:
  openInteractionMenu(IsVIPActivated, IsCPHActivated, true)
  if !ManualInventoryLocation
    Send {%IGB_Down%}{%IGB_Down%}{%IGB_Down%}
  Send {%IGB_Enter%}{%IGB_Up%}{%IGB_Up%}{%IGB_Enter%}{%IGB_Enter%}
  return

; Join a New Invite Only Session
NewInviteSession:
  ; Open settings
  turnCapslockOff()
  SoundPlay, %A_WinDir%\Media\Windows Battery Critical.wav
  Send {%IGB_Pause%}

  ; Necessary delay to allow settings to open properly
  sleep, IntPhoneMenuDelay2

  ; Not using IGB_ variables on purpose as pause menu has static bindings
  Send {Right}
  Sleep IntPhoneMenuDelay2 * 2
  Send {Enter} ; Online Menu
  Sleep IntPhoneMenuDelay2
  Send {Up}{Up}{Up}{Up}
  Sleep IntPhoneMenuDelay2
  Send {Enter} ; New Session Menu
  Sleep IntPhoneMenuDelay2
  Send {Down}
  Sleep IntPhoneMenuDelay2
  Send {Enter} ; New Invite Only Session
  Sleep IntPhoneMenuDelay2
  Send {Enter} ; Confirm Session Change
  return

; Join a New Crew Only Session
NewCrewSession:
  ; Open settings
  turnCapslockOff()
  SoundPlay, %A_WinDir%\Media\Windows Battery Critical.wav
  Send {%IGB_Pause%}

  ; Necessary delay to allow settings to open properly
  sleep, IntPhoneMenuDelay2

  ; Not using IGB_ variables on purpose as pause menu has static bindings
  Send {Right}
  Sleep IntPhoneMenuDelay2 * 2
  Send {Enter} ; Online Menu
  Sleep IntPhoneMenuDelay2
  Send {Up}{Up}{Up}{Up}
  Sleep IntPhoneMenuDelay2
  Send {Enter} ; New Session Menu
  Sleep IntPhoneMenuDelay2
  Send {Up}{Up}
  Sleep IntPhoneMenuDelay2
  Send {Enter} ; New Crew Only Session
  Sleep IntPhoneMenuDelay2
  Send {Enter} ; Confirm Session Change
  return

; Join a New Friend Only Session
NewFriendSession:
  ; Open settings
  turnCapslockOff()
  SoundPlay, %A_WinDir%\Media\Windows Battery Critical.wav
  Send {%IGB_Pause%}

  ; Necessary delay to allow settings to open properly
  sleep, IntPhoneMenuDelay2

  ; Not using IGB_ variables on purpose as pause menu has static bindings
  Send {Right}
  Sleep IntPhoneMenuDelay2 * 2
  Send {Enter} ; Online Menu
  Sleep IntPhoneMenuDelay2
  Send {Up}{Up}{Up}{Up}
  Sleep IntPhoneMenuDelay2
  Send {Enter} ; New Session Menu
  Sleep IntPhoneMenuDelay2
  Send {Up}
  Sleep IntPhoneMenuDelay2
  Send {Enter} ; New Friend Only Session
  Sleep IntPhoneMenuDelay2
  Send {Enter} ; Confirm Session Change
  return

; Show a list of chat snippets to type out (chat must be opened)
ChatSnippets:
  turnCapslockOff()
  Gui, CSNIP:add, Text, , Choose your snippet:
  for index, element in ArrayChatSnippets
  {
    if (index = 1) {
      Gui, CSNIP:add, Radio, vSnippetChoice, %element%
    } else {
      Gui, CSNIP:add, Radio, , %element%
    }
  }

  Gui, CSNIP:add, Button, Default g_ChatSnippetsTypeout, type out...
  Gui, CSNIP:show
  Return

CSNIPGuiEscape:
  Gui, CSNIP:cancel
  Gui, CSNIP:destroy
  bringGameIntoFocus()
  return

CSNIPGuiClose:
  Gui, CSNIP:cancel
  Gui, CSNIP:destroy
  bringGameIntoFocus()
  return

_ChatSnippetsTypeout:
  Gui, CSNIP:submit
  bringGameIntoFocus(true)
  Send % ArrayChatSnippets[SnippetChoice]
  Gui, CSNIP:destroy
  Return

; Phone calls
DialDialog:
  pbl := ""
  For each, item in ArrayPhonebook
    pbl .= (!pbl ? "" : "|") item
  Gui, DIAL:add, Text, , double click item
  Gui, DIAL:Font,, Courier New
  Gui, DIAL:add, ListBox, w500 h250 vPhoneNumberSelect g_DialDialogMakeCallFromSelect, %pbl%
  Gui, DIAL:Font,, Arial
  Gui, DIAL:add, Text, , or type number:
  Gui, DIAL:add, Edit, w500 vPhoneNumber,
  Gui, DIAL:add, Button, w500 Default g_DialDialogMakeCall, make call...
  Gui, DIAL:show
  return

DIALGuiEscape:
  Gui, DIAL:cancel
  Gui, DIAL:destroy
  bringGameIntoFocus()
  return

DIALGuiClose:
  Gui, DIAL:cancel
  Gui, DIAL:destroy
  bringGameIntoFocus()
  return

_DialDialogMakeCallFromSelect:
  if(A_GuiEvent = "DoubleClick")
    GoTo _DialDialogMakeCall
  Return

_DialDialogMakeCall:
  Gui, DIAL:submit
  bringGameIntoFocus(true)
  if PhoneNumber
    dialNumber(PhoneNumber, true)
  else if PhoneNumberSelect
    dialNumber(PhoneNumberSelect, true)
  Gui, DIAL:destroy
  return

CallMechanic:
  ;makeCall(8, true)
  dialNumber("328-555-0153", true)
  return

CallPegasus:
  ;makeCall(4, true)
  dialNumber("328-555-0122", true)
  return

CallMerryweather:
  ;makeCall(7, true)
  dialNumber("273-555-0120", true)
  return

CallInsurance:
  ;makeCall(6, true)
  dialNumber("611-555-0149", true)
  return

CallLester:
  ;makeCall(12, true)
  dialNumber("346-555-0102", true)
  return

RemoveWantedLevel:
  ;makeCall(12, true)
  dialNumber("346-555-0102", true)
  sleep 10000
  Send {%IGB_Down%}{%IGB_Enter%}{%IGB_Interaction%}
  return

CallAssistant:
  dialNumber("346-555-0137", true)
  return
