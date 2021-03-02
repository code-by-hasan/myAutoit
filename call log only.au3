; AutoIt version: 3.0.103
; Language:       English
; Author:         Muhammad Hasan Abbas
; Software:       My call log v5.0

;Include constants
#include <GUIConstantsEx.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>
#include <StaticConstants.au3>
#include <Clipboard.au3>
#include <Array.au3>
#Include <Date.au3>

Opt('MustDeclareVars', 1)

_Main()

Func _Main()

    local $record_limit = 100
	global $tmpx[10]
	Global $tmpy[10]
	global $xway = 0
	global $yway = 0
	;Initialize variables
	Global $cGUIWidth = 920
    Global $cGUIHeight = 25
	Global $cgui, $wgui, $wtext, $msg,$cRR, $cNew, $cCP, $cClarify, $cFNN, $credits, $cNotes, $cPrev, $cNext, $cH, $cP, $cLFNN, $cLClarify, $cLCP, $whichcore, $uname, $ccmd, $cLCompany, $cCompany
	Global $CPa[100]
	Global $Company[100]
	Global $Clarify[100]
	Global $Notes[100]
	Global $FNN[100]
	Global $eNotes[100]
	Global $last = 0
	Global $current = 0
	global $flago = 0
	Global $impots = ""
	Global $onoffkeys = 1

	;Create main/parent window
	$cgui = GUICreate("My Call Logs", $cGUIWidth, $cGUIHeight,500,-22)

	;$cRR = GUICtrlCreateButton("&r",1,0)
	$cNew = GUICtrlCreateButton("&New...",5,0)
	$cLCP = GUICtrlCreateLabel("CP",5+50, 5)
	$cCP = GUICtrlCreateInput("",25+50,3,80,18)
	$cLCompany = GUICtrlCreateLabel("Co",110+50, 5)
	$cCompany = GUICtrlCreateInput("",130+45,3,80,18)
	$cLClarify = GUICtrlCreateLabel("C#",100+110+50, 5)
	$cClarify = GUICtrlCreateInput("",100+130+50,3,80,18)
	$cLFNN = GUICtrlCreateLabel("FNN",100+195+50+20, 5)
	$cFNN = GUICtrlCreateInput("",100+220+50+20,3,100,18)
	$credits = GUICtrlCreateLabel("Notes",100+325+50+20, 5)
	$cNotes = GUICtrlCreateEdit("",100+358+50+20,3,300,58)
	$cPrev = GUICtrlCreateButton("<< ",100+710+20,0)
	$cNext = GUICtrlCreateButton(" >>",100+733+20,0)
	$cH = GUICtrlCreateButton("H..",100+756+20,0)
	$cP = GUICtrlCreateButton("P..",100+778+20,0)

	GUISetState(@SW_SHOW)

;	$wgui = GUICreate("work space 99", 700, 500,350,100)

;	GUISetFont(10,Default,Default,"Lucida Console")
;	$wtext = GUICtrlCreateEdit("",5,5,695,495)

	;GUISetState(@SW_SHOW)

	;Loop until:
	;- user presses Esc when focused to the parent window
	;- user presses Alt+F4 when focused to the parent window
	;- user clicks the close button of the parent window
	WinSetOnTop("My Call Logs","",1)

	While 1
		;After every loop check if the user clicked something in the GUI windows
		$msg = GUIGetMsg(1)

		;if (WinExists("timmihasan")) Then
	;		ToolTip("@@@***@@@",-700,1)
	;		$flago = 1
	;	Elseif ($flago = 1) Then
			;Sleep(100)
			;ToolTip(_DateTimeFormat( _NowCalc(),1),1310,850)
	;		$flago = 0
	;	EndIf


		Select
			;Check if user clicked on a close button of any of the 2 windows
		Case $msg[0] = $GUI_EVENT_CLOSE
			Local $jawab
			$jawab = MsgBox(1,"© M. Hasan Abbas","exiting ...sure?????")

			if $jawab==1 Then
			Exit
			EndIf

		case $msg[0] = $credits

			GUICtrlSetBkColor($credits,0x0000ff)
			Sleep(20)
			Send("^c")
			Sleep(20)
			GUICtrlSetBkColor($credits,$GUI_BKCOLOR_TRANSPARENT )
			;MsgBox(4096,"Credit", "Developed by: " & @CRLF &  "Muhammad Hasan Abbas" & @CRLF & "Wholesale Technical Support" & @CRLF & "")
		    ;MsgBox( 4096, "Date & Time", _DateTimeFormat( _NowCalc(),3) & @CRLF & _DateTimeFormat( _NowCalc(),1), 3)
			;ToolTip(_DateTimeFormat( _NowCalc(),1),1310,850)


		case $msg[0] = $cP ;Copy and Paste into simple text
		  ;Local $check

			;$check = _ClipBoard_GetData()
			;_ClipBoard_SetData($check)
			;WinActivate("ClarifyCRM")
		WinMove("My Call Logs","",500,-22)
		WinMove("My Shortis","",Default,-22)

			;$impots = InputBox("importants", "write today's importants?", $impots)
			;ToolTip(_DateTimeFormat( _NowCalc(),1) &  " ..... " & $impots,-1000,0)

		case $msg[0] = $cLCompany

			local $forcopy = GUICtrlRead($cCompany)
			GUICtrlSetBkColor($cLCompany,0x0000ff)
			Sleep(20)
			_ClipBoard_SetData($forcopy)
			Sleep(20)
			GUICtrlSetBkColor($cLCompany,$GUI_BKCOLOR_TRANSPARENT )

		case $msg[0] = $cLClarify

			local $forcopy = GUICtrlRead($cClarify)
			GUICtrlSetBkColor($cLClarify,0x0000ff)
			Sleep(20)
			_ClipBoard_SetData($forcopy)
			Sleep(20)
			GUICtrlSetBkColor($cLClarify,$GUI_BKCOLOR_TRANSPARENT )


		case $msg[0] = $cLFNN

			local $forcopy = GUICtrlRead($cFNN)
			GUICtrlSetBkColor($cLFNN,0x0000ff)
			Sleep(20)
			_ClipBoard_SetData($forcopy)
			Sleep(20)
			GUICtrlSetBkColor($cLFNN,$GUI_BKCOLOR_TRANSPARENT )


			;ToolTip(_DateTimeFormat( _NowCalc(),1),-1000,0)


		case $msg[0] = $cLCP
			local $forcopy = GUICtrlRead($cCP)
			GUICtrlSetBkColor($cLCP,0x0000ff)
			Sleep(20)
			_ClipBoard_SetData($forcopy)
			Sleep(20)
			GUICtrlSetBkColor($cLCP,$GUI_BKCOLOR_TRANSPARENT )

		case $msg[0] = $cNew ; new entry to all fields
		  ; save values
		  if $current = $last Then

		  $CPa[$last] = GUICtrlRead($cCP)
		  $Company[$last] = GUICtrlRead($cCompany)
		  $Clarify[$last] = GUICtrlRead($cClarify)
		  $FNN[$last] = GUICtrlRead($cFNN)
		  $Notes[$last] = GUICtrlRead($cNotes)
		  $eNotes[$last] = GUICtrlRead($wText)

		  Else

		  $CPa[$current] = GUICtrlRead($cCP)
		  $Company[$current] = GUICtrlRead($cCompany)
		  $Clarify[$current] = GUICtrlRead($cClarify)
		  $FNN[$current] = GUICtrlRead($cFNN)
		  $Notes[$current] = GUICtrlRead($cNotes)
		  $eNotes[$current] = GUICtrlRead($wText)

		  $current = $last
		  EndIf

		  ;increment
		  $current = $current + 1
		  $last = $last + 1

		  ;clear text boxes
		  GUICtrlSetData($cCP, "")
		  GUICtrlSetData($cCompany, "")
		  GUICtrlSetData($cClarify, "")
		  GUICtrlSetData($cFNN, "")
		  GUICtrlSetData($cNotes, "")
		  GUICtrlSetData($wText, "")

		  GUICtrlSetState($cCP,$GUI_FOCUS)

		case $msg[0] = $cPrev ;goto prev record
		  if ($current > 0) Then

          ; save values
		  $CPa[$current] = GUICtrlRead($cCP)
		  $Company[$current] = GUICtrlRead($cCompany)
		  $Clarify[$current] = GUICtrlRead($cClarify)
		  $FNN[$current] = GUICtrlRead($cFNN)
		  $Notes[$current] = GUICtrlRead($cNotes)
		  $eNotes[$current] = GUICtrlRead($wText)

		  ;decrement
		  $current = $current - 1

		  ; prev value
		  GUICtrlSetData($cCP, $CPa[$current])
		  GUICtrlSetData($cCompany, $Company[$current])
		  GUICtrlSetData($cClarify, $Clarify[$current])
		  GUICtrlSetData($cFNN, $FNN[$current])
		  GUICtrlSetData($cNotes, $Notes[$current])
		  GUICtrlSetData($wText, $eNotes[$current])

	      EndIf

		case $msg[0] = $cNext ;goto prev record
		  if ($current < $last) Then

          ; save values
		  $CPa[$current] = GUICtrlRead($cCP)
		  $Company[$current] = GUICtrlRead($cCompany)
		  $Clarify[$current] = GUICtrlRead($cClarify)
		  $FNN[$current] = GUICtrlRead($cFNN)
		  $Notes[$current] = GUICtrlRead($cNotes)
		  $eNotes[$current] = GUICtrlRead($wText)

		  ;increment
		  $current = $current + 1

		  ;next values
		  GUICtrlSetData($cCP, $CPa[$current])
		  GUICtrlSetData($cCompany, $Company[$current])
		  GUICtrlSetData($cClarify, $Clarify[$current])
		  GUICtrlSetData($cFNN, $FNN[$current])
		  GUICtrlSetData($cNotes, $Notes[$current])
		  GUICtrlSetData($wText, $eNotes[$current])

	     EndIf

		 case $msg[0] = $cH ;history maker

		 Local $i= ""
		 Local $History = ""

		 $i = 0
		 while $i < $last

		 $History = $History & $CPa[$i] & @CRLF & $Company[$i] & @CRLF & $Clarify[$i] & @CRLF & $FNN[$i] & @CRLF & $Notes[$i] & @CRLF & "------------" & @CRLF

		 $i = $i + 1
		 WEnd

		 _ClipBoard_SetData($History)

		 run("notepad.exe")
		 Sleep(50)
		 WinActivate("Untitled")
		 Sleep(50)
		 Send("^v")

		 local $ans
		  $ans = MsgBox(1,"© M. Hasan Abbas", "Do you want to reset?")
		  if $ans = 1 Then
		  ;clear text boxes
		  GUICtrlSetData($cCP, "")
		  GUICtrlSetData($cCompany, "")
		  GUICtrlSetData($cClarify, "")
		  GUICtrlSetData($cFNN, "")
		  GUICtrlSetData($cNotes, "")

		  $last = 0
		  $current = 0
			  EndIf

		EndSelect

	WEnd
EndFunc   ;==>_Main
