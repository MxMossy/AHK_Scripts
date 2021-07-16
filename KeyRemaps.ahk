; Run as admin
if !A_IsAdmin || !(DllCall("GetCommandLine","Str")~=" /restart(?!\S)")
    Try Run % "*RunAs """ (A_IsCompiled?A_ScriptFullPath """ /restart"
            :A_AhkPath """ /restart """ A_ScriptFullPath """")
    Finally ExitApp

; vim movements
!h::
sendinput {Left}
return

!j::
sendinput {Down}
return

!k::
sendinput {Up}
return

!l::
sendinput {Right}
return

+!h::
sendinput {Home}
return

+!l::
sendinput {End}
return

+!j::
sendinput {Pgdn}
return

+!k::
sendinput {Pgup}
return

^!h::
sendinput ^{Left}
return

^!l::
sendinput ^{Right}
return

; Remap Caps lock to Esc when tapped, Ctrl when held
SetCapsLockState, alwaysoff
*CapsLock::
    Send {Blind}{Ctrl Down}
    cDown := A_TickCount
    keywait, CapsLock
Return

*CapsLock up::
    ; Modify the threshold time (in milliseconds) as necessary
    ; MsgBox, % A_TickCount - cDown
    If ((A_TickCount-cDown) < 200)
        Send {Blind}{Ctrl Up}{Esc}
    Else
        Send {Blind}{Ctrl Up}
Return

; Launch shortcuts

^!t::
    ; without elevated privileges
    Run explorer.exe C:\Users\mxmoss\AppData\Local\Microsoft\WindowsApps\wt.exe

    timeCheck := A_TickCount
    While(A_TickCount - timeCheck < 2000){
        WinGetTitle, title, A
        If(title == "Windows PowerShell"){
            WinMaximize, A
            Break
        }
        Sleep, 100
    }
Return

^+!t::
    ; as admin
    Run C:\Users\mxmoss\AppData\Local\Microsoft\WindowsApps\wt.exe,, Max
Return

^!o::
    Run C:\Program Files\Google\Chrome\Application\chrome.exe
Return



