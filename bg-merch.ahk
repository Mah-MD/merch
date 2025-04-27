; Warframe Trade Hotkey Message Sender
; Press Ctrl+Alt+1, 2, 3... to send specific trade messages
; Press Ctrl+Alt+X to exit

#Persistent
#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
SetTitleMatchMode, 2
    
TrayTip, Warframe BACKGROUND-Trade, Script is running!`nUse Ctrl+Alt+1~9 to send messages.`nPress Ctrl+Alt+Z to exit., 1, 1

^!z::ExitApp ; Exit script with Ctrl+Alt+Z

; Example Trade Messages - Customise freely
^!1::
    SendTrade("WTB TRASH Rivens [Torid] ------ [Burston] ------ [Nikana] ------ [Verglas] ------ [Magistar]")
return

^!2::
    SendTrade("WTS Rivens [torid acridra] + [nikana cronicron] + [magistar crita-croniada] + [Ogris argi-visidra]")
return

^!3::
    SendTrade("WTB [Adaptation] 10:platinum:")
return

; You can add more hotkeys as needed:
; ^!4::SendTrade("Message here") return

SendTrade(msg) {
    ; Send the message text
    SendInput, {Raw}%msg%
    Sleep, 300
    ; Press Enter
    SendInput, {Enter}
}
