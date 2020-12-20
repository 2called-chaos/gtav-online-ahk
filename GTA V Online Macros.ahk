#MaxThreadsPerHotkey 2

;
; GTA V Online AHK-Macros v1.1.1 by 2called-chaos
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
; To change a hotkey for a macro change the configuration section at the top of the file.
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
SnackMenuKey         := "+#" ; Open Snack menu (+ = shift, rtfm).
AutoHealthKey        := "#" ; Automatic snacking. Eats 2 snacks from second snack slot.
ArmorMenuKey         := "+F1" ; Open Armor menu.
AutoArmorKey         := "F1" ; Automatic armor equip (uses super heavy armor only).
RetrieveCarKey       := "F2" ; Request Personal Vehicle.
TogglePassiveKey     := "F3" ; Toggle passive mode.
EquipScarfKey        := "NumpadDot" ; Equip first scarf (heist outfit glitch, see readme/misc).
ToggleRadarKey       := "+F2" ; Toggle between extended and standar radar.
CycleOutfitKey       := "NumpadAdd" ; Equip next/cycle through saved outfits.
ToggleVIPKey         := "NumpadSub" ; Toggle VIP mode (required when VIP/CEO/MC).
ToggleCPHKey         := "^NumpadSub" ; Toggle Cayo Perico Heist Final mode (extra menu entry), also see DoToggleCPHWithVIP
ToggleAFKKey         := "+NumpadSub" ; Toggle AFK mode
ToggleClickerKey     := "+XButton2" ; Toggle Clicker (XButton2 = Mouse5)
KillGameKey          := "+F12" ; Kill game process, requires pskill.exe
ForceDisconnectKey   := "F12" ; Force disconnect by suspending process for 10s, requires pssuspend.exe
ChatSnippetsKey      := "F11" ; Gives you a few text snippets to put in chat (chat must be already open)
RandomHeistKey       := "F7" ; Chooses on-call random heist from phone options
CEOBuzzardKey        := "F24" ; Spawn free CEO buzzard

DialDialogKey        := "+F5" ; Call GUI with a list of almost all numbers
CallMechanicKey      := "F5" ; Call Mechanic
CallPegasusKey       := "F24" ; Call Pegasus
CallMerryweatherKey  := "F24" ; Call Merryweather
CallInsuranceKey     := "F6" ; Call Insurance
CallLesterKey        := "+F6" ; Call Lester


; Options (should be fine out of the box)
DoConfirmKill        := true  ; If true the KillGame action will ask for confirmation before killing the process
DoConfirmDisconnect  := true  ; If true the ForceDisconnect action will ask for confirmation before suspending the process
IntDisconnectDelay   := 10    ; Amount of seconds to freeze the process for, 10 works fine
DoToggleCPHWithVIP   := false ; If true ToggleVIP will become a 3-way toggle (off/on/CayoPericoHeistFinal)
DisableCapsOnAction  := true  ; Disable caps lock before executing macros, some macros might fail if caps lock is on

; Internal variables (probably no need to edit)
IsVIPActivated       := false ; Initial status of CEO/VIP mode (after (re)loading script)
IsAFKActivated       := false ; Initial status of AFK mode (should always be false)
IsCPHActivated       := false ; Initial status of CPH mode (should always be false)
IsClickerActivated   := false ; Initial status of Clicker (should always be false)


; Chat snippets (you can add more, comment them out or remove them, the pushs that is)
ArrayChatSnippets := []
ArrayChatSnippets.push("Player saved outfits please :)")
ArrayChatSnippets.push("Yay, cheaters")
ArrayChatSnippets.push("I take that explosive sniper of yours and insert it sideways...")
ArrayChatSnippets.push("You want some cool AHK macros? github.com/2called-chaos/gtav-online-ahk")


; Delays (you normally don't want to change these, you can try to play with these values if you have a slow/fast PC)
IntFocusDelay        := 100  ; delay (in ms) after focussing game when AHK-GUI took focus.
IntMenuDelay         := 120  ; delay (in ms) after opening interaction menu.
IntPhoneMenuDelay    := 1850 ; delay (in ms) after opening phone menu.
IntPhoneMenuDelay2   := 250  ; delay (in ms) after selecting phone menu entries.
IntPhoneScrollDelay  := 75   ; delay (in ms) between scrolls in the phone menu.
IntKeySendDelay      := 25   ; delay (in ms) delay between send key commands.
IntKeyPressDuration  := 5    ; duration (in ms) each key press is held down.


; In case you changed your ingame bindings:
IGB_Interaction := "m"
IGB_Phone := "up"
IGB_Pause := "p"


; Phone numbers for DialDialog GUI dialog (you can change the order if you want or hide entries by commenting them out)
ArrayPhonebook := []
ArrayPhonebook.push("911           - Emergency Services")
ArrayPhonebook.push("328-555-0153  - Mechanic")
ArrayPhonebook.push("611-555-0149  - Mors Mutual Insurance")
ArrayPhonebook.push("328-555-0122  - Pegasus Lifestyle Management")
ArrayPhonebook.push("273-555-0120  - Merryweather Security")
ArrayPhonebook.push("346-555-0176  - Atomic Blimp")
ArrayPhonebook.push("323-555-5555  - Downtown Cab Co.")
ArrayPhonebook.push("346-555-0102  - Lester Crest")
ArrayPhonebook.push("555-0182      - (useless) *modem* ")
ArrayPhonebook.push("1-999-9327667 - (useless) *holding music* ")
ArrayPhonebook.push("425-555-0170  - (useless) 'This mailbox is full' ")
ArrayPhonebook.push("310-555-0156  - (useless) *Pickup* .. *Hangup*")
ArrayPhonebook.push("1-999-768822  - (useless) 'This number is no longer in service'")
ArrayPhonebook.push("273-555-0155  - (useless) Truthseeker Helpline")


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
Hotkey, %SnackMenuKey%, SnackMenu
Hotkey, %AutoHealthKey%, AutoHealth
Hotkey, %ArmorMenuKey%, ArmorMenu
Hotkey, %AutoArmorKey%, AutoArmor
Hotkey, %TogglePassiveKey%, TogglePassive
Hotkey, %RetrieveCarKey%, RetrieveCar
Hotkey, %EquipScarfKey%, EquipScarf
Hotkey, %CycleOutfitKey%, CycleOutfit
Hotkey, %ToggleVIPKey%, ToggleVIP
Hotkey, %ToggleCPHKey%, ToggleCPH
Hotkey, %ToggleAFKKey%, ToggleAFK
Hotkey, %ToggleClickerKey%, ToggleClicker
Hotkey, %ToggleRadarKey%, ToggleRadar
Hotkey, %KillGameKey%, KillGame
Hotkey, %ForceDisconnectKey%, ForceDisconnect
Hotkey, %RandomHeistKey%, RandomHeist
Hotkey, %ChatSnippetsKey%, ChatSnippets
Hotkey, %CEOBuzzardKey%, CEOBuzzard
Hotkey, %DialDialogKey%, DialDialog
Hotkey, %CallMechanicKey%, CallMechanic
Hotkey, %CallPegasusKey%, CallPegasus
Hotkey, %CallMerryweatherKey%, CallMerryweather
Hotkey, %CallInsuranceKey%, CallInsurance
Hotkey, %CallLesterKey%, CallLester

; Sets delay(ms) between keystrokes issued. Arguments are delay between keystrokes and press duration, respectively.
; They might be able to go lower but these values are pretty fast and work reliably.
setkeydelay, IntKeySendDelay, IntKeyPressDuration

; setup done, only functions and macros follow
Return



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

openInteractionMenu(isVIPActive, isCPHActive) {
  global IntMenuDelay
  global IGB_Interaction
  turnCapslockOff()
  Send {%IGB_Interaction%}
  sleep, IntMenuDelay
  if (isCPHActive = 1) {
    Send {Down}
    Send {Down}
  } else if (isVIPActive = 1) {
    Send {Down}
  }
}

openSnackMenu() {
  Send {Down}{Down}{Enter}{Down}{Down}{Enter}
}

openArmorMenu() {
  Send {Down}{Down}{Enter}{Down}{Enter}
}

openOutfitMenu() {
  Send {Down}{Down}{Down}{Enter}{Down}{Down}{Down}
}

openPhone() {
  global IntPhoneMenuDelay
  global IGB_Phone

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
  Send {Enter}
  sleep IntPhoneMenuDelay2

  ; scroll to contact
  scrollPhoneUp(scrollUp)

  ; call it
  Send {Enter}
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
  Send {Enter}
  sleep IntPhoneMenuDelay2

  ; enter number screen
  Send {Space}
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
      Send {right %deltax%}

    if (deltay > 0)
      Send {down %deltay%}
    
    if (deltax < 0) {
      deltax := Abs(deltax)
      Send {left %deltax%}
    }
    
    if (deltay < 0) {
      deltay := Abs(deltay)
      Send {up %deltay%}
    }

    pointer := A_LoopField
    Send {Enter}
  }

  ; reset key delay (should not be necessary)
  setkeydelay IntKeySendDelay, IntKeyPressDuration

  ; call it
  Send {Space}
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
  Loop %seconds% {
    SplashTextOn 250, 20, %title%, % StrReplace(message, "%i", seconds + 1 - A_Index)
    Sleep 1000
  }
  if(addZero) {
    SplashTextOn 250, 20, %title%, % StrReplace(message, "%i", 0)
    Sleep 1000
  }
}

bringGameIntoFocus(applyDelay = false) {
  global IntFocusDelay
  WinActivate ahk_class grcWindow
  if(applyDelay)
    Sleep IntFocusDelay
}



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
    SplashTextOn 250, 20, AFK mode, AFK mode has been ACTIVATED
  } else {
    SplashTextOn 250, 20, AFK mode, AFK mode has been DEACTIVATED
  }
  Sleep 2000
  SplashTextOff
  bringGameIntoFocus()
  Sleep 100

  if (IsAFKActivated) {
    Loop {
      sleep, 500
      send, {a}

      if (!IsAFKActivated) {
        break
      }

      sleep, 500
      send, {d}

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

  Send {Right}{Right}{Right}{Right}
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
        SplashTextOn 280, 20, VIP&CPH mode, VIP&&CPH mode has been DEACTIVATED
      } else {
        IsCPHActivated := true
        SplashTextOn 350, 20, CPH mode, Cayo Perico Heist mode has been ACTIVATED
      }
    } else {
      IsVIPActivated := false
      SplashTextOn 250, 20, VIP mode, VIP mode has been DEACTIVATED
    }
  } else {
    IsVIPActivated := true
    SplashTextOn 250, 20, VIP mode, VIP mode has been ACTIVATED
  }
  Sleep 2000
  SplashTextOff
  bringGameIntoFocus()
  return

; Toggle CPH mode (Cayo Perico Heist Final)
ToggleCPH:
  IsCPHActivated := !IsCPHActivated
  if (IsCPHActivated) {
    SplashTextOn 350, 20, CPH mode, Cayo Perico Heist mode has been ACTIVATED
  } else {
    SplashTextOn 350, 20, CPH mode, Cayo Perico Heist mode has been DEACTIVATED
  }
  Sleep 2000
  SplashTextOff
  bringGameIntoFocus()
  return

; Open up snack menu for manual selection (or stock check) of snacks
SnackMenu:
  openInteractionMenu(IsVIPActivated, IsCPHActivated)
  openSnackMenu()
  return

; Automatic snacking. Eats 2 snacks from second snack slot and close menu.
AutoHealth:
  openInteractionMenu(IsVIPActivated, IsCPHActivated)
  openSnackMenu()
  Send {Down}{Enter}{Enter}{%IGB_Interaction%}
  return

; Open up armor menu for manual selection (or stock check) of armor
ArmorMenu:
  openInteractionMenu(IsVIPActivated, IsCPHActivated)
  openArmorMenu()
  return

; Equips super heavy armor and exits menu automatically
AutoArmor:
  openInteractionMenu(IsVIPActivated, IsCPHActivated)
  openArmorMenu()
  Send {Down}{Down}{Down}{Down}{Enter}{%IGB_Interaction%}
  return

; Equips scarf to allow faster running with heist armor (see readme/misc)
EquipScarf:
  openInteractionMenu(IsVIPActivated, IsCPHActivated)
  ; Opens scarf menu
  Send {Down}{Down}{Down}{Enter}{Down}{Enter}
  ; equip scarf and exit menu. This line can be changed to pick different scarfs.
  Send {Up}{Up}{Up}{Up}{Right}{%IGB_Interaction%}
  return

; Cycle between your saved outfits
CycleOutfit:
  openInteractionMenu(IsVIPActivated, IsCPHActivated)
  openOutfitMenu()
  Send {Right}{Enter}{%IGB_Interaction%}
  return

; Toggle passive mode
TogglePassive:
  openInteractionMenu(false, false) ; Ignore VIP status when going up
  Send {Up}{Enter}{%IGB_Interaction%}
  return

; Retrieve your currently active vehicle
RetrieveCar:
  openInteractionMenu(IsVIPActivated, IsCPHActivated)
  Send {Down}{Down}{Down}{Down}{Enter}{Enter}{%IGB_Interaction%}
  return

; Chooses on-call random heist from phone options
RandomHeist:
  turnCapslockOff()
  makeCall(13, true, 1)
  sleep IntKeySendDelay
  scrollPhoneUp(2) ; scroll up twice to solo-q
  Send {Enter}{Enter}
  return

; Calls in free CEO buzzard (if you are CEO)
CEOBuzzard:
  openInteractionMenu(false, false)
  Send {Enter}{Up 2}{Enter}{Down 4}{Enter}
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
