#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.

;^ for Ctrl
;! for Alt
;# for Win
;+ for Shift

SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

::@@r::robert.angers@gmail.com

::@@b::bobbyangers@hotmail.com

^!n::Run, notepad++.exe

^!v::Run, "%ProgramFiles%\Microsoft Visual Studio\2022\Enterprise\Common7\IDE\devenv.exe"

^!g::Run, "C:\Program Files (x86)\GitExtensions\gitextensions.exe"

^!u::Run, *RunAs %comspec% /c "cd C:\temp && cup all"

^!p::Run, *RunAs %comspec% 
   
!g::Run, chrome.exe https://www.google.com

!d::Run, """%USERPROFILE%\Downloads"""



^+c::
{
 Send, ^c
 Sleep 50
 Run, https://www.google.com/search?q=%clipboard%
 Return
}

; WINDOWS KEY + Y TOGGLES FILE EXTENSIONS
#y::
{
  RegRead, HiddenFiles_Status, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, HideFileExt
  If HiddenFiles_Status = 1 
    RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, HideFileExt, 0
  Else 
    RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, HideFileExt, 1
  WinGetClass, eh_Class,A
  If (eh_Class = "#32770" OR A_OSVersion = "WIN_VISTA")
    send, {F5}
  Else 
    PostMessage, 0x111, 28931,,, A
  Return
}

;^F2::GoSub,CheckActiveWindow
;
; CheckActiveWindow:
;   ID := WinExist("A")
;   WinGetClass,Class, ahk_id %ID%
;   WClasses := "CabinetWClass ExploreWClass"
;   IfInString, WClasses, %Class%
;     GoSub, Toggle_HiddenFiles_Display
; Return
; 
; Toggle_HiddenFiles_Display:
;   RootKey = HKEY_CURRENT_USER
;   SubKey  = Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced
; 
;   RegRead, HiddenFiles_Status, % RootKey, % SubKey, Hidden
; 
;   if HiddenFiles_Status = 2
;       RegWrite, REG_DWORD, % RootKey, % SubKey, Hidden, 1 
;   else 
;       RegWrite, REG_DWORD, % RootKey, % SubKey, Hidden, 2
;   PostMessage, 0x111, 41504,,, ahk_id %ID%
; Return
;
