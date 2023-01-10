#Requires AutoHotkey v2.0
#SingleInstance

; turns CapsLock into CTRL and ESC on tap if no other keys pressed
ESC_DELAY := 200 ; Escape only triggered if held for < 200 ms

; Run as admin, see https://www.autohotkey.com/docs/v2/lib/Run.htm#RunAs
full_command_line := DllCall("GetCommandLine", "str")
if not (A_IsAdmin or RegExMatch(full_command_line, " /restart(?!\S)"))
{
    try
    {
        if A_IsCompiled
            Run '*RunAs "' A_ScriptFullPath '" /restart'
        else
            Run '*RunAs "' A_AhkPath '" /restart "' A_ScriptFullPath '"'
    }
    ExitApp
}
;MsgBox "A_IsAdmin: " A_IsAdmin "`nCommand line: " full_command_line

SetCapsLockState "AlwaysOff"
*CapsLock::
{
    Send "{Blind}{Ctrl Down}"
    cDown := A_TickCount
    
    inp := InputHook()
    inp.Start()
    inp.KeyOpt("{All}", "V") ; pass inputs through to active app

    keywait "CapsLock"
    If ((A_TickCount-cDown) < ESC_DELAY && inp.Input == "")
        Send "{Blind}{Ctrl Up}{Esc}"
    Else
        Send "{Blind}{Ctrl Up}"
    inp.Stop()
    Return
}
