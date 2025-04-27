; Warframe Trade Message Sender
; 1. Presses T (open chat)
; 2. Sends formatted message
; 3. Presses Enter
; Repeats every 121 seconds after initial 4s delay
; Ctrl+Alt+X to exit, Ctrl+Alt+R to refresh

#Persistent
SetTimer, FirstSend, -4000 ; Initial 4-second delay

TrayTip, Warframe Auto-Trade, Script is running!`nFirst message in 4 seconds`nPress Ctrl+Alt+X to exit`nPress Ctrl+Alt+R to refresh, 1, 1

^!x::ExitApp ; Exit hotkey

^!r::  ; Refresh hotkey
    SetTimer, SendTradeMessage, Off
    SetTimer, FirstSend, -4000
    TrayTip, Script Refreshed, Will resend in 4 seconds, 1, 1
return

FirstSend:
    Gosub, SendTradeMessage
    SetTimer, SendTradeMessage, 121000 ; 121-second interval
return

SendTradeMessage:
    ; 1. Send complete formatted message
    SendInput, {Raw}WTS Rivens [torid acridra] + [nikana cronicron] + [magistar crita-croniada] + [Ogris argi-visidra] 
    ;SendInput, {Raw}WTS Rivens [torid acridra] + [nikana cronicron]
    Sleep, 300

    ; 2. Press Enter to send
    SendInput, {Enter}
    Sleep, 300

    ; 3. Open chat by pressing T
    SendInput, {t}
    Sleep, 300 ; Wait for chat to open
return
