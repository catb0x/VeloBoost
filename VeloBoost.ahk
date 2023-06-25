; VeloBoost GUI
; An Autohotkey v1 GUI that executes keystrokes to let you run faster,
; by changing your center of mass before loading your avatar.
; Works in: R6

; Setup
#SingleInstance Force
GuiHotkey := "NumpadClear" ; Default Hotkey
GuiDelay := 3050 ; Default Delay
GuiEmote := "/e laugh"

; Gui
Gui, +AlwaysOnTop
Gui, Show, w240 h190, Boost
Gui, Font, s19, Consolas
Gui, Font, s19, Ubuntu Mono
Gui, Add, Text, x0 y15 w240 Center, VeloBoost GUI
Gui, Font, s10
Gui, Add, Tab3, x0 w240 y53, General|Settings|About
Gui, Font, s11


Gui, Tab, 1
Gui, Add, Button, x5 y82 w230 h50 gActivateThingy, Activate Macro
Gui, Add, Button, x5 y134 w230 h50 gDeactivateThingy, Deactivate Macro

Gui, Tab, 2,
Gui, Add, Button, x100 y85 w25 h25 Center gUpdateHotkey, U
Gui, Add, Hotkey, x130 y85 w100 h25 vGuiHotkey, %GuiHotkey%
Gui, Add, Edit, x130 y120 w100 h25 Number gUpdate vGuiDelay, %GuiDelay%
Gui, Add, Edit, x130 y155 w100 h25 gUpdate vGuiEmote, %GuiEmote%
Gui, Add, Text, x10 y88 w50 h25, Hotkey
Gui, Add, Text, x10 y123 w50 h25, Delay
Gui, Add, Text, x10 y158 w50 h25, Emote

Gui, Tab, 3
Gui, Font, s15
Gui, Add, Text, x10 y88, VeloBoost 1.2
Gui, Font, s13
Gui, Add, Link, x10 y115, Made by <a href="https://kitfi.crd.co">kit</a>
Gui, Add, Link, x10 y137, Idea by <a href="https://youtube.com/@kpmaxo">kpmaxo</a>
Gui, Font, s10
Gui, Add, Link, x10 y160, Github: <a href="https://github.com/catb0x/VeloBoost">catb0x/VeloBoost</a>

; Gosubs / Hotkeys
Update:
Gui, Submit, Nohide
Return

UpdateHotkey:
GuiControlGet, NewHotkey,, GuiHotkey
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
SendInput {Text}%GuiEmote%
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
