SnackMenuKey         := "+F1" ; Open Snack menu (+ = shift, rtfm).
AutoHealthKey        := "F1" ; Automatic snacking. Eats 2 snacks from second snack slot.
ArmorMenuKey         := "+F2" ; Open Armor menu.
AutoArmorKey         := "F2" ; Automatic armor equip (uses super heavy armor only).

RetrieveCarKey       := "F5" ; Request currently active Personal Vehicle.
ReturnCarKey         := "+F5" ; Return the currently active Personal Vehicle.
CEOBuzzardKey        := "^F3" ; Spawn free CEO buzzard.
RequestSparrowKey    := "F3" ; Call in your Sparrow (or whatever you last requested moon pool vehicle was).
ReturnSparrowKey     := "+F3" ; Return your Sparrow to the Kosatka.
RequestKosatkaKey    := "F4" ; Call in your Kosatka Submarine.

ForceDisconnectKey   := "F12" ; Force disconnect by suspending process for 10s, requires pssuspend.exe.
KillGameKey          := "+F12" ; Kill game process, requires pskill.exe.

ToggleInBuildingKey  := "NumpadMult" ; Toggle In a Building mode.
ToggleCPHKey         := "^NumpadMult" ; Toggle Cayo Perico Heist mode.
ToggleAFKKey         := "+NumpadMult" ; Toggle AFK mode.

TurnOnCEOKey         := "+F9" ; Makes you CEO of an Organization and toggles VIP mode.
TurnOnPresKey        := "^F9" ; Makes you President of a MC Club and toggles VIP mode.
ResignOrDisbandKey   := "F9" ; Resigns your CEO position or Disbands your MC Club and toggles VIP mode.

TogglePassiveKey     := "F10" ; Toggle passive mode.
ToggleRadarKey       := "F24" ; Toggle between extended and standar radar.
ToggleClickerKey     := "F24" ; Toggle Clicker (XButton2 = Mouse5).

ToggleAutoHeliKey    := "+F6" ; Keeps throttle and pitch forward pressed, First take heli to sufficient height and then use this as autopilot.
ToggleAutoPlaneKey   := "F6" ; Keeps throttle at max for plane autopilot.

ChatSnippetsKey      := "F24" ; Gives you a few text snippets to put in chat (chat must be already open).

CreateManualSaveKey  := "F7" ; Use the outfit selection to create a manual save (doesn't change outfits).
CycleOutfitKey       := "+F7" ; Equip next/cycle through saved outfits.
EquipScarfKey        := "F24" ; Equip first scarf (heist outfit glitch, see readme/misc).

NewPublicSessionKey  := "^F11" ; Join a New Public Session
NewInviteSessionKey  := "F11" ; Join a New Invite Only Session.
NewCrewSessionKey    := "F24" ; Join a New Crew Only Session.
NewFriendSessionKey  := "+F11" ; Join a New Friend Only Session.

RandomHeistKey       := "F24" ; Chooses on-call random heist from phone options.

DialDialogKey        := "^F8" ; Call GUI with a list of almost all numbers.
CallMechanicKey      := "^F5" ; Call Mechanic.
CallPegasusKey       := "F24" ; Call Pegasus.
CallMerryweatherKey  := "F24" ; Call Merryweather.
CallInsuranceKey     := "F24" ; Call Insurance.
CallLesterKey        := "+F8" ; Call Lester.
RemoveWantedLevelKey := "F8" ; Call Lester and have him remove wanted level.
CallAssistantKey     := "F24" ; Call Assistant.

CheckForUpdatesKey   := "F24" ; Checks on startup by default, see DoCheckForUpdates option.

AutoSnackLocation    := 2     ; by default this is the snack that autosnack will select.
AutoArmorLocation    := 5     ; by default this is Super Heavy Armor, but can be changed.

; Options (should be fine out of the box)
WindowScale          := 1.0   ; Change this to reflect your Windows display scale (e.g. set it to 3 if you have UI scale set to 300%).
DoConfirmKill        := true  ; If true the KillGame action will ask for confirmation before killing the process.
DoConfirmDisconnect  := true  ; If true the ForceDisconnect action will ask for confirmation before suspending the process.
IntDisconnectDelay   := 10    ; Amount of seconds to freeze the process for, 10 works fine.
DoToggleCPHWithVIP   := false ; If true ToggleVIP will become a 3-way toggle (off/on/CayoPericoHeistFinal).
DisableCapsOnAction  := true  ; Disable caps lock before executing macros, some macros might fail if caps lock is on.
DoCheckForUpdates    := true  ; Check for script updates on startup (you can manually bind this instead or additionally).
