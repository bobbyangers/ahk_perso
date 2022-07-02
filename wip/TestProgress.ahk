#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;^ for Ctrl
;! for Alt
;# for Win
;+ for Shift

^p::
{
Gui, Add, Text,,Please Wait...
Gui, Add, Progress, r2 w200 0x8 -Smooth vPrgs
SetTimer, Progress, 100
;rest of script here

Gui, Show
return
GuiClose:
 ExitApp

Progress:
 GuiControl,,Prgs
return
}