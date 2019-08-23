;scroll terminal with keyboard
!-::
	sendinput {WheelDown 1} 
	return  
!=:: 
	sendinput {WheelUp 1} 
	return

;vim movements
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

 

;backward tab navigation
^`::
    sendinput ^+{Tab}
    return

^!j::
	Run ConEmu , C:\Program Files (x86)\ConEmu
	Return

^!o::
	Run chrome , C:\Program Files (x86)\Google\Chrome\Application
	Return

^!\::
    Run calc , C:\Users\Max Mossberg\Documents\Coding\AutoHotKey
    Return

!t::
	Winset, Alwaysontop, , A

