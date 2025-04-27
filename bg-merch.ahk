; bg-paste.ahk – Combines Warframe trade hotkeys with a clipboard-paste hotkey
#Persistent
#SingleInstance Force
#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
SetTitleMatchMode, 2

; Notify that the script is running
TrayTip, Warframe BACKGROUND-Paste, Script running! Trade hotkeys (Ctrl+Alt+1–9) and paste (Ctrl+Shift+P) active., 1, 1

^!z::ExitApp  ; Ctrl+Alt+Z → exit

; — Clipboard paste hotkey — Ctrl+Shift+P
^+p::
    ClipWait, 1
    if (ErrorLevel) {
        MsgBox, 48, bg-paste.ahk, No clipboard contents detected.
        return
    }
    ; “Type” out whatever is on the clipboard
    SendInput, %Clipboard%
return

; — Example trade‐message hotkeys — Ctrl+Alt+1..3
^!1::
    SendTrade("WTB TRASH Rivens [Torid] ------ [Burston] ------ [Nikana] ------ [Verglas] ------ [Magistar]")
return

^!2::
    SendTrade("WTS Rivens [torid acridra] + [nikana cronicron] + [magistar crita-croniada] + [Ogris argi-visidra]")
return

^!3::
    SendTrade("WTB [Baruuk Prime] BP!! 10:platinum::platinum:")
return

; Add more trade hotkeys here:
; ^!4::SendTrade("Your custom message here") return

; — Helper function to send & send‐Enter —
SendTrade(msg) {
    SendInput, {Raw}%msg%
    Sleep, 300
    SendInput, {Enter}
}