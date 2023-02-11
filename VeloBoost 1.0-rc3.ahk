; VeloBoost GUI
; An Autohotkey v1 GUI that executes keystrokes to let you run faster,
; by changing your center of mass before loading your avatar.
; Works in: R6

; Setup
#SingleInstance Force
GuiHotkey := "NumpadClear" ; Default Hotkey
GuiDelay := 3050 ; Default Delay

; Gui
Gui,1: Show, w240 h155, VeloBoost
Gui,1: Font, s19, Ubuntu Mono
Gui,1: Add, Text, x0 y15 w240 Center, VeloBoost GUI
Gui,1: Font, s10
Gui,1: Add, Tab3, x0 w245 y53, General|Settings|About

Gui,1: Tab, 1
Gui,1: Font, s12
Gui,1: Add, Button, x5 y85 w230 h30 gActivateThingy, Activate Macro
Gui,1: Add, Button, x5 y120 w230 h30 gDeactivateThingy, Deactivate Macro

Gui,1: Tab, 2
Gui,1: Font, s10
Gui,1: Add, Hotkey, x130 y85 w100 vGuiHotkey, %GuiHotkey%
Gui,1: Add, Button, x100 y85 w25 Center gUpdateHotkey, U
Gui,1: Add, Text, x10 y87 w100, Hotkey
Gui,1: Add, Edit, x130 y120 w100 Number gUpdateDelay vGuiDelay, %GuiDelay%
Gui,1: Add, Text, x10 y122 w100, Delay

Gui,1: Tab, 3
Gui,1: Font, s11
Gui,1: Add, Text, x0 y85 w240 Center, VeloBoost 1.0-rc3
Gui,1: Add, Text, x0 y105 w240 Center, Runs on Autohotkey v1
Gui,1: Add, Text, x0 y125 w240 Center, GUI made by @josepablo50

; Gosubs / Hotkeys
UpdateDelay:
Gui, Submit, Nohide
Return

UpdateHotkey:
GuiControlGet, NewHotkey, 1:, GuiHotkey
if (NewHotkey != GuiHotkey) {
 Hotkey, %GuiHotkey% , Macro, Off
 GuiHotkey := NewHotkey
 Hotkey, %GuiHotkey% , Macro, On
}
Return

ActivateThingy:
Hotkey, %GuiHotkey% , Macro, On
Return

DeactivateThingy:
Hotkey, %GuiHotkey% , Macro, Off
Return

Macro:
SendInput {NumpadDiv}
Sleep 40
SendInput {Esc}
Sleep 40
SendInput {NumpadDiv}
Sleep 40
SendInput {Text}/e laugh
Sleep 40
Click
Sleep 40
SendInput {Esc}
Sleep 40
SendInput r
Sleep 40
SendInput {Enter}
Sleep GuiDelay
SendInput {NumpadDiv}
Sleep 40
SendInput {Enter}
Return

; GuiClose
GuiClose:
 ExitApp