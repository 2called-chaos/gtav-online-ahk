;
; GTA V Online AHK-Macros v1.0.3 by 2called-chaos
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
CycleOutfitKey       := "NumpadAdd" ; Equip next/cycle through saved outfits.
ToggleVIPKey         := "NumpadSub" ; Toggle VIP mode (required when VIP/CEO/MC).
ForceDisconnectKey   := "F12" ; Force disconnect by suspending process for 10s, requires pssuspend.exe
ChatSnippetsKey      := "F11" ; Gives you a few text snippets to put in chat (chat must be already open)
RandomHeistKey       := "F7" ; Chooses on-call random heist from phone options
CEOBuzzardKey        := "F24" ; Spawn free CEO buzzard

CallMechanicKey      := "F5" ; Call Mechanic
CallPegasusKey       := "F24" ; Call Pegasus
CallMerryweatherKey  := "F24" ; Call Merryweather
CallInsuranceKey     := "F6" ; Call Insurance
CallLesterKey        := "F24" ; Call Lester


; Options (should be fine out of the box)
DoConfirmDisconnect  := true  ; If true the ForceDisconnect action will ask for confirmation before suspending the process
IntDisconnectDelay   := 10    ; Amount of seconds to freeze the process for, 10 works fine
IntVIPActivated      := false ; Initial status of CEO/VIP mode (after (re)loading script)


; Chat snippets (you can add more, just increment the number)
ArrayChatSnippets    := []
ArrayChatSnippets[0] := "Player saved outfits please :)"
ArrayChatSnippets[1] := "Yay, cheaters"
ArrayChatSnippets[2] := "I take that explosive sniper of yours and insert it sideways..."
ArrayChatSnippets[3] := "You want some cool AHK macros? github.com/2called-chaos/gtav-online-ahk"


; Delays (you normally don't want to change these, you can try to play with these values if you have a slow/fast PC)
IntFocusDelay        := 100  ; delay (in ms) after focussing game when AHK-GUI took focus.
IntMenuDelay         := 120  ; delay (in ms) after opening interaction menu.
IntPhoneMenuDelay    := 1850 ; delay (in ms) after opening phone menu.
IntPhoneMenuDelay2   := 250  ; delay (in ms) after selecting phone menu entries.
IntPhoneScrollDelay  := 50   ; delay (in ms) between scrolls in the phone menu.
IntKeySendDelay      := 25   ; delay (in ms) delay between send key commands.
IntKeyPressDuration  := 5    ; duration (in ms) each key press is held down.

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
Hotkey, %ForceDisconnectKey%, ForceDisconnect
Hotkey, %RandomHeistKey%, RandomHeist
Hotkey, %ChatSnippetsKey%, ChatSnippets
Hotkey, %CEOBuzzardKey%, CEOBuzzard
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

openInteractionMenu(isVIPActive) {
  global IntMenuDelay
  Send {m}
  sleep, IntMenuDelay
  if (isVIPActive = 1) {
    Send {Down}
  }
}

openSnackMenu() {
  Send {Down}{Enter}{Down}{Down}{Enter}
}

openArmorMenu() {
  Send {Down}{Enter}{Down}{Enter}
}

openOutfitMenu() {
  Send {Down}{Down}{Enter}{Down}{Down}{Down}
}

openPhone() {
  global IntPhoneMenuDelay

  ; Opens Phone Menu
  Send {Up}

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
  if(doOpenPhone)
    openPhone()

  ; go to contacts
  scrollPhoneUp(menu)
  sleep IntKeySendDelay
  Send {Enter}

  ; scroll to contact
  sleep IntPhoneMenuDelay2
  scrollPhoneUp(scrollUp)

  ; call it
  Send {Enter}
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

; Toggle VIP mode (if VIP/CEO/MC all interaction menu entries are offset by one)
ToggleVIP:
  IntVIPActivated := !IntVIPActivated
  if (IntVIPActivated) {
    SplashTextOn 250, 20, VIP mode, VIP mode has been ACTIVATED
  } else {
    SplashTextOn 250, 20, VIP mode, VIP mode has been DEACTIVATED
  }
  Sleep 2000
  SplashTextOff
  bringGameIntoFocus()
  return

; Open up snack menu for manual selection (or stock check) of snacks
SnackMenu:
  openInteractionMenu(IntVIPActivated)
  openSnackMenu()
  return

; Automatic snacking. Eats 2 snacks from second snack slot and close menu.
AutoHealth:
  openInteractionMenu(IntVIPActivated)
  openSnackMenu()
  Send {Down}{Enter}{Enter}{m}
  return

; Open up armor menu for manual selection (or stock check) of armor
ArmorMenu:
  openInteractionMenu(IntVIPActivated)
  openArmorMenu()
  return

; Equips super heavy armor and exits menu automatically
AutoArmor:
  openInteractionMenu(IntVIPActivated)
  openArmorMenu()
  Send {Down}{Down}{Down}{Down}{Enter}{m}
  return

; Equips scarf to allow faster running with heist armor (see readme/misc)
EquipScarf:
  openInteractionMenu(IntVIPActivated)
  ; Opens scarf menu
  Send {Down}{Down}{Enter}{Down}{Enter}
  ; equip scarf and exit menu. This line can be changed to pick different scarfs.
  Send {Up}{Up}{Up}{Up}{Right}{m}
  return

; Cycle between your saved outfits
CycleOutfit:
  openInteractionMenu(IntVIPActivated)
  openOutfitMenu()
  Send {Right}{Enter}{m}
  return

; Toggle passive mode
TogglePassive:
  openInteractionMenu(false) ; Ignore VIP status when going up
  Send {Up}{Enter}{m}
  return

; Retrieve your currently active vehicle
RetrieveCar:
  openInteractionMenu(IntVIPActivated)
  Send {Down}{Down}{Down}{Enter}{Enter}{m}
  return

; Chooses on-call random heist from phone options
RandomHeist:
  makeCall(12, true, 1)
  sleep IntKeySendDelay
  scrollPhoneUp(2) ; scroll up twice to solo-q
  Send {Enter}{Enter}
  return

; Calls in free CEO buzzard (if you are CEO)
CEOBuzzard:
  openInteractionMenu(false)
  Send {Enter}{Up 2}{Enter}{Down 4}{Enter}
  return

; Show a list of chat snippets to type out (chat must be opened)
ChatSnippets:
  Gui, CSNIP:add, Text, , Choose your snippet:
  for index, element in ArrayChatSnippets
  {
    if (index = 0) {
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
  Send % ArrayChatSnippets[SnippetChoice - 1]
  Gui, CSNIP:destroy
  Return

; Phone calls
CallMechanic:
  makeCall(8, true)
  return

CallPegasus:
  makeCall(4, true)
  return

CallMerryweather:
  makeCall(7, true)
  return

CallInsurance:
  makeCall(6, true)
  return

CallLester:
  makeCall(12, true)
  return
