SnackMenuKey         := "1" ; Open Snack menu (+ = shift, rtfm).
AutoHealthKey        := "F24" ; Automatic snacking. Eats 2 snacks from second snack slot.
ArmorMenuKey         := "2" ; Open Armor menu.
AutoArmorKey         := "F24" ; Automatic armor equip (uses super heavy armor only).
RetrieveCarKey       := "F24" ; Request currently active Personal Vehicle.
ToggleRadarKey       := "F24" ; Toggle between extended and standar radar.
CEOBuzzardKey        := "F24" ; Spawn free CEO buzzard
RequestSparrowKey    := "F24" ; Call in your Sparrow (or whatever you last requested moon pool vehicle was)
ReturnSparrowKey     := "F24" ; Return your Sparrow to the Kosatka
ForceDisconnectKey   := "F12" ; Force disconnect by suspending process for 10s, requires pssuspend.exe
KillGameKey          := "+F12" ; Kill game process, requires pskill.exe
ToggleVIPKey         := "F24" ; Toggle VIP mode (required when VIP/CEO/MC).  Won't have effect if using ManualInventoryLocation option.
ToggleCPHKey         := "F24" ; Toggle Cayo Perico Heist Final mode (extra menu entry), also see DoToggleCPHWithVIP.  Won't have effect if using ManualInventoryLocation option.
ToggleAFKKey         := "End" ; Toggle AFK mode

TogglePassiveKey     := "F24" ; Toggle passive mode.
ToggleClickerKey     := "F24" ; Toggle Clicker (XButton2 = Mouse5)
ToggleAutoHeliKey    := "F24" ; Keeps throttle and pitch forward pressed, First take heli to sufficient height and then use this as autopilot
ChatSnippetsKey      := "F24" ; Gives you a few text snippets to put in chat (chat must be already open)
CycleOutfitKey       := "F24" ; Equip next/cycle through saved outfits.
RandomHeistKey       := "F24" ; Chooses on-call random heist from phone options
EquipScarfKey        := "F24" ; Equip first scarf (heist outfit glitch, see readme/misc).

DialDialogKey        := "F24" ; Call GUI with a list of almost all numbers
CallMechanicKey      := "F24" ; Call Mechanic
CallPegasusKey       := "F24" ; Call Pegasus
CallMerryweatherKey  := "F24" ; Call Merryweather
CallInsuranceKey     := "F24" ; Call Insurance
CallLesterKey        := "F24" ; Call Lester
CallAssistantKey     := "F24" ; Call Assistant

CheckForUpdatesKey   := "F24" ; Checks on startup by default, see DoCheckForUpdates option


; ManualInventoryLocation (manual inventory line calibration)
ManualInventoryLocation := false        ; if true, use manual calibration of the inventory line in the interactive menu. IsCPHActive and IsVIPActive flags will be ignored.
InvLocation             := 3            ; by default, this is the location of the inventory in the menu
AutoSnackLocation       := 2            ; by default, this is the snack autosnack will select
; these keys will not be bound if ManualInventoryLocation is false
IncInvKey               := "F24"  ; for increasing the value of the inventory line
DecInvKey               := "F24"  ; for decreasing the value of the inventory line
IncSnackKey             := "F24" ; for increasing the line for the snack selected by autosnacking
DecSnackKey             := "F24" ; for decreasing the line for the snack selected by autosnacking


; Options (should be fine out of the box)
; WindowScale          := 1.0       ; Change this to reflect your Windows display scale (e.g. set it to 3 if you have UI scale set to 300%)
; DoConfirmKill        := true      ; If true the KillGame action will ask for confirmation before killing the process
; DoConfirmDisconnect  := true      ; If true the ForceDisconnect action will ask for confirmation before suspending the process
; IntDisconnectDelay   := 10        ; Amount of seconds to freeze the process for, 10 works fine
; DoToggleCPHWithVIP   := false     ; If true ToggleVIP will become a 3-way toggle (off/on/CayoPericoHeistFinal)
; DisableCapsOnAction  := true      ; Disable caps lock before executing macros, some macros might fail if caps lock is on
DoCheckForUpdates    := false      ; Check for script updates on startup (you can manually bind this instead or additionally)


; Delays (you normally don't want to change these, you can try to play with these values if you have a slow/fast PC)
; IntFocusDelay        := 100  ; delay (in ms) after focussing game when AHK-GUI took focus.
; IntMenuDelay         := 120  ; delay (in ms) after opening interaction menu.
; IntPhoneMenuDelay    := 1850 ; delay (in ms) after opening phone menu.
; IntPhoneMenuDelay2   := 250  ; delay (in ms) after selecting phone menu entries.
; IntPhoneScrollDelay  := 75   ; delay (in ms) between scrolls in the phone menu.
; IntKeySendDelay      := 25   ; delay (in ms) delay between send key commands.
; IntKeyPressDuration  := 5    ; duration (in ms) each key press is held down.

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
global IGB_ThrottleUp := "XButton2"
global IGB_PitchForward := "w"
