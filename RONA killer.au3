#include <GUIConstantsEx.au3>

Qshorts()

Func Qshorts()
   
   HotKeySet("{Pause}", "Pkey")
   HotKeySet("^{Pause}", "CtrlPkey")
      
   Global $mxy = 0
   
    ; Create a GUI with various controls.
    Local $hGUI = GUICreate("RONA Killer", 300, 100, 500, 500)
    GUICtrlCreateLabel("1. Press Ctrl + Pause Key to train Mouse...",10,10)
	GUICtrlCreateLabel("2. Press Pause Key to go Not Ready and Lock Screen...",10,30)
	
    ; Create a button control.
   ;Local $copybtn = GUICtrlCreateButton("Lock Computer", 20, 10, 85, 25)   
   
    ; Display the GUI.
    GUISetState(@SW_SHOW, $hGUI)

    Local $iPID = 0

    ; Loop until the user exits.
    While 1
	   
        Switch GUIGetMsg()
            Case $GUI_EVENT_CLOSE
                ExitLoop

    ;       Case $copybtn
	;		   send("{LWIN}{Right}{Right}o")
	     EndSwitch
	
    WEnd

    ; Delete the previous GUI and all controls.
    GUIDelete($hGUI)

    ; Close the Notepad process using the PID returned by Run.
    If $iPID Then ProcessClose($iPID)
EndFunc   ;==>Example
	
Func Pkey()
      If ($mxy = 0) Then
	  MsgBox(1,"test","first train mouse plz")
   Else
	  WinActivate("Cisco Finesse")
	  Sleep(500)
	  MouseClick("left", $mxy[0], $mxy[1]-20, 1,1)
	  Sleep(100)
	  Send("{tab}")
	  Sleep(100)
	  send("{enter}")
	  Sleep(100)
	  Send("{tab}")
	  Sleep(100)
	  send("{enter}")
	  ToolTip("Locking Computer...")
	  Sleep(1000)
	  ToolTip("")
	  send("{LWIN}")
	  send("{Right}")
	  send("{Right}")
	  send("o")

   ;MsgBox(1,"RONA Killer", "Press OK to go ready again...")
	;  MouseClick("left", $mxy[0], $mxy[1], 1,1)
	 ; Sleep(300)
	  ;MouseClick("left", $mxy[0], $mxy[1]+15, 1,1)
	  EndIf
   EndFunc	
   
Func CtrlPkey()
	  $mxy = MouseGetPos()
	  MsgBox(1,"Mouse training","All done, Captured Mouse position..." & $mxy[0] & "..." & $mxy[1])
EndFunc	