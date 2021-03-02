; easyCopy v 1.0
; developer Muhammad Hasan Abbas
; NOV 2020


   #include <GUIConstantsEx.au3>
   #include <GUIConstantsEx.au3>
   #include <WindowsConstants.au3>
   #include <EditConstants.au3>
   #include <StaticConstants.au3>
   #include <Clipboard.au3>
   #include <Array.au3>
   #include <Date.au3>
   #include <Misc.au3>


_Main()

Func _Main()
   HotKeySet("{F11}", "f11key")
   HotKeySet("^{F11}", "ctrlf11key")

	   Global $msg
	   Global $cGUIWidth = 350
	   Global $cGUIHeight = 175
	   Global $cgui, $cLCP, $msg, $txt
	   ;Create main/parent window
	   $cgui = GUICreate("easyCopy", $cGUIWidth, $cGUIHeight,0,0)
	   $txt = GUICtrlCreateEdit("code by: Hasan.Abbas@optus.com.au" & @CRLF & _
	   "Shortcut key = F11" & @CRLF & @CRLF & _
	   "This application helps automate the process of making text," & @CRLF & _
	   "from a work app, available to a non-work app." & @Crlf & @crlf & _
	   "Step 1: Copy text from work app (with usual method Ctrl+C)" & @crlf & _
	   "Step 2: Press F11 key (processing will take few secs)" & @crlf & _
	   "Step 3: Press 'Yes' on the security pop-up, if you like to continue." & @crlf & _
	   "Step 4: Paste text in the non-work app (with Ctrl+V)",0,0,$cGUIWidth,$cGUIHeight)

	   GUISetState(@SW_SHOW)

	   While 1
		  $msg = GUIGetMsg(1)
			Select
			   ;Check if user clicked on a close button of any of the 2 windows
			   Case $msg[0] = $GUI_EVENT_CLOSE
			   Exit
			EndSelect
	   WEnd
EndFunc

Func f11key()
	  local $inp = MsgBox(4,"Note","Your organization may track the action. Are you sure you want to continue?")
	  if $inp = 6 Then
		 run("notepad.exe")
		 WinWaitActive("Untitled")
		 send("^v")
		 Sleep(50)
		 Send("^a")
		 Sleep(50)
		 Send("^x")
		 Sleep(50)
		 send("^w")
		 Sleep(50)
		 WinActivate("easyCopy")
		 WinWaitActive("easyCopy")
		 send("^a")
		 Sleep(50)
		 send("{DEL}")
		 Sleep(50)
			send("^v")
			Sleep(200)
			send("{LEFT}")
			Sleep(50)
			send("{Enter}")
			Sleep(50)
			send("^a")
			Sleep(50)
			send("^c")
	  EndIf
EndFunc

Func ctrlf11key()
   local $inp = MsgBox(4,"Note","Your organization may track the action. Are you sure you want to continue?")
	  if $inp = 6 Then
		 run("notepad.exe")
		 WinWaitActive("Untitled")
		 send("^v")
		 Sleep(50)
		 Send("^a")
		 Sleep(50)
		 Send("^x")
		 Sleep(50)
		 send("^w")
		 Sleep(50)
		 WinActivate("easyCopy")
		 WinWaitActive("easyCopy")
		 send("^a")
		 Sleep(50)
		 send("{DEL}")
		 Sleep(50)
			send("^v")
			Sleep(200)
			send("{LEFT}")
			Sleep(50)
			send("{Enter}")
			Sleep(50)
			send("^a")
			Sleep(50)
			send("^c")
	  EndIf
   EndFunc
