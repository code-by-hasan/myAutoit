   ; AutoIt version: 3.0.103
   ; Language:       English
   ; Author:         Muhammad Hasan Abbas
   ; Software:       My shortis v9.0


   ;Include constants
   #include <GUIConstantsEx.au3>
   #include <GUIConstantsEx.au3>
   #include <WindowsConstants.au3>
   #include <EditConstants.au3>
   #include <StaticConstants.au3>
   #include <Clipboard.au3>
   #include <Array.au3>
   #include <Date.au3>
   #include <Misc.au3>




   ; search - srh
   ; -------
   ; qtxt - quick text for paste
   ;

   Opt('MustDeclareVars', 1)

   _Main()

   Func getc () ;---clipboard get--
	  $cbrd = _ClipBoard_GetData()
   EndFunc

   Func setc () ;---clipboard set--
	   _ClipBoard_SetData($cbrd)
   EndFunc

   Func splstr($str)
	  local $str2 = StringSplit($str,"#")
	  local $cnt, $j
	  $j = 1
	  $str = ""
	  $cnt = $str2[0]
	  for $i = $cnt To 1 Step -1
		 $str = $str & $str2[$j] & @CRLF
		 $j = $j + 1
	  Next
	  return $str
	  EndFunc

   Func ib($str)
	  Return InputBox("input",$str)
   EndFunc

   Func _Main()
	   Global $ifmspwd = "abc"
	   Global $winntpwd = "abc"

	   Global $alm = 1
	   Global $prevsms = ""
	   Global $cbrd
	   Global $incident
	   Global $cause
	   Global $solution
	   global $clipdata[11]
	   Global $maxmin = 0;
	   global $tmpx[10]
	   Global $tmpy[10]
	   global $xway = 0
	   global $yway = 0
	   ;Initialize variables
	   Global $cGUIWidth = 250
	   Global $cGUIHeight = 60
	   Global $cgui, $cLCP, $msg, $txt
	   ;Create main/parent window
	   $cgui = GUICreate("My Shortis", $cGUIWidth, $cGUIHeight,0,0)
	   ;$cRR = GUICtrlCreateButton("&r",1,0)
	   $cLCP = GUICtrlCreateLabel("Shortis are ON",1, 5,100)
	   $txt = GUICtrlCreateEdit("",0,0,$cGUIWidth,$cGUIHeight)
	   Global $autoalarm = 0
	   Global $ajDate, $kalDate
	   Global  $togg = 0
	   Global $wlst = "none"
	   Global $togo = "work"

	   ;global keys
	   ;HotKeySet("{PRINTSCREEN}","pscreen")
	   HotKeySet("{PGUP}","pageUP")
	   HotKeySet("{PGDN}","pageDown")
	   HotKeySet("{F1}", "f1key")
	   HotKeySet("{F2}", "f2key")
	   HotKeySet("{F3}", "f3key")
	   HotKeySet("{F4}", "f4key")
	   ;HotKeySet("{F5}", "f5key")
	   HotKeySet("{F6}", "f6key")
	   HotKeySet("{F7}", "f7key")
	   HotKeySet("{F8}", "f8key")
	   HotKeySet("{F9}", "f9key")
	   HotKeySet("{F10}", "f10key")
	   HotKeySet("{F11}", "f11key")
	   HotKeySet("^{F11}", "ctrlf11key")
	   HotKeySet("{F12}", "f12key")
	   ;HotKeySet("{Pause}", "Pausekey")
	   HotKeySet("`", "belowesckey")
	   HotKeySet("!`", "ALTbelowesckey")
	   HotKeySet("^`", "CTRLbelowesckey")
	   HotKeySet("!1", "ALTonekey")
	   HotKeySet("!2", "ALTtwokey")
	   HotKeySet("!3", "ALTthreekey")
	   HotKeySet("!4", "ALTfourkey")
	   ;HotKeySet("!{F3}", "ALTF3key")
	   ;HotKeySet("!{F5}", "ALTF5key")
	   ;HotKeySet("!{F6}", "ALTF6key")
	   ;HotKeySet("!{F7}", "ALTF7key")
	   ;HotKeySet("!{F8}", "ALTF8key")
	   ;HotKeySet("!{F9}", "ALTF9key")
	   ;HotKeySet("!{Pause}", "ALTPausekey")
	   ;HotKeySet("{PRINTSCREEN}", "prntscrn")
	   ;HotKeySet("1", "ALTOnekey")
	   ;HotKeySet("2", "ALTTwokey")
	   ;HotKeySet("3", "ALTThreekey")
	   ;HotKeySet("4", "ALTFourkey")
	   ;HotKeySet("5", "ALTFivekey")



	   GUISetState(@SW_SHOW)
	   ;WinSetOnTop("My Shortis","",1)



	   ;Loop until:
	   ;- user presses Esc when focused to the parent window
	   ;- user presses Alt+F4 when focused to the parent window
	   ;- user clicks the close button of the parent window

	   Local $mint = 0

	   local $clipnew = ""
	   local $clipold = ""

	   Local $secnew = @sec
	   Local $secold = ""
	   local $minsafter = 5
	   Local $mafter = $minsafter
	   Global $automouse = 0
       Global $mousepos

	   $clipnew = _ClipBoard_GetData()

	   While 1

	  if $automouse = 1 Then
	   MouseMove(10,1078,10)
	   Sleep(100)
	   MouseMove(69,1078,10)
	   sleep(100)
	  EndIf

; Hot corners

;~        $mousepos = MouseGetPos()
;~  	  if $mousepos[0] = 0 Then
;~  		 if $mousepos[1] = 0 Then
;~  			send("{CTRLDOWN}{LWINDOWN}{LEFT}")
;~  			Sleep(50)
;~  			send("{CTRLUP}{LWINUP}")
;~  			Sleep(50)
;~  			MouseMove(1,1)
;~  		 EndIf
;~  	  EndIf

;~  	  if $mousepos[0] = 1919 Then
;~  		 if $mousepos[1] = 0 Then
;~  			send("{CTRLDOWN}{LWINDOWN}{RIGHT}")
;~  			Sleep(50)
;~  			send("{CTRLUP}{LWINUP}")
;~  			Sleep(50)
;~  			MouseMove(1918,1)
;~  		 EndIf
;~  	  EndIf


#CS       $mousepos = MouseGetPos()
### 	  if $mousepos[0] = 0 Then
### 		 if $mousepos[1] = 0 Then
### 			send("{LWINDOWN}{TAB}")
### 			Sleep(50)
### 			send("{LWINUP}")
### 			Sleep(50)
### 			MouseMove(3,3)
### 		 EndIf
### 	  EndIf
###
### 	  if $mousepos[0] = 1919 Then
### 		 if $mousepos[1] = 0 Then
### 			send("{LWINDOWN}a")
### 			Sleep(50)
### 			send("{LWINUP}")
### 			Sleep(50)
### 			MouseMove(1916,3)
### 		 EndIf
### 	  EndIf
 #CE

   ;~ 		;$secnew = @sec
   ;~ 		if $secold <> $secnew Then
   ;~ 		  	GUICtrlSetData($cLCP,"> > > READY < < <")
   ;~ 		   GUICtrlSetBkColor($cLCP,$GUI_BKCOLOR_TRANSPARENT )
   ;~ 		   $secold = $secnew
   ;~ 	  	Elseif ($secnew = 2 or $secnew = 8 or $secnew = 14 or $secnew = 20 or $secnew = 26 or $secnew = 32 or $secnew = 38 or $secnew = 44 or $secnew = 50 or $secnew = 56 ) then
   ;~ 		   ;Elseif ($secnew = 2 or $secnew = 4 or $secnew = 6 or $secnew = 8 or $secnew = 10 or $secnew = 12) then

   ;~ if $autoalarm = 1 Then
   ;~  local $pos = MouseGetPos()
   ;~  Sleep(10)
   ;~  MouseClick("right",3246, 969,1,1)
   ;~  Sleep(10)
   ;~  Send("a")
   ;~  Sleep(10)
   ;~  MouseMove($pos[0], $pos[1],1)
   ;~ Sleep(900)
   ;~ EndIf
   ;~ 		   Elseif ($secnew = 2) Then
   ;~
   ;~ 		 ;aoo-----------------
   ;~ 		 Sleep(950)
   ;~ 		 ;winactivate("")
   ;~ 		 ;--------------------
   ;~ 			GUICtrlSetData($cLCP," > > GO < < ")
   ;~ 		   $secold = $secnew
   ;~ 		   GUICtrlSetBkColor($cLCP,0xff0000)
   ;~
   ;~
   ;~
   ;~ 		   Elseif ($secnew = 4 or $secnew = 6 or $secnew = 8 or $secnew = 10 or $secnew = 12) then
   ;~ 		   GUICtrlSetData($cLCP," > > GO < < ")
   ;~ 		   $secold = $secnew
   ;~ 		   GUICtrlSetBkColor($cLCP,0xff0000)
   ;~
   ;~    		EndIf

		   ;msgbox (1,"dkfj",@SEC)
		   ;After every loop check if the user clicked something in the GUI windows

		   $msg = GUIGetMsg(1)
   ;~ 	 	$clipnew = _ClipBoard_GetData()
   ;~ 		if $clipold <> $clipnew Then
   ;~ 		   $clipdata[10] = $clipdata[9]
   ;~ 		   $clipdata[9] = $clipdata[8]
   ;~ 		   $clipdata[8] = $clipdata[7]
   ;~ 		   $clipdata[7] = $clipdata[6]
   ;~ 		   $clipdata[6] = $clipdata[5]
   ;~ 		   $clipdata[5] = $clipdata[4]
   ;~ 		   $clipdata[4] = $clipdata[3]
   ;~ 		   $clipdata[3] = $clipdata[2]
   ;~ 		   $clipdata[2] = $clipdata[1]
   ;~ 		   $clipdata[1] = $clipnew
   ;~ 		   GUICtrlSetData($cLCP,$clipnew)
   ;~ 		   $clipold = $clipnew
   ;~ 	    EndIf

		   Select
		   ;Check if user clicked on a close button of any of the 2 windows
		   Case $msg[0] = $GUI_EVENT_CLOSE
			   Exit

		   EndSelect

	   WEnd
   EndFunc   ;==>_Main


   Func f11key() ; IFMS

			Sleep(200)
			send("1169442")
			Sleep(100)
			send("{tab}")
			Sleep(100)
			send($ifmspwd)
			Send("{enter}")
			;Sleep(1000)
			;MouseClick("left",2511, 97,1,1)
			;MouseClick("left",657, 191,1,1)


	EndFunc

   Func F12key() ; ALT + Tab

   EndFunc

   Func pscreen()  ; Screenshot
	  WinActivate("Snipping Tool")
	  if (Not WinActive("Snipping Tool")) Then
		 send("{LWINDown}r")
		 send("{LWINUp}")
		 Sleep(50)
		 send("Snippingtool{enter}")
	  Else
		 WinActivate("Snipping Tool")
		 send("^n")
	  EndIf
   EndFunc

   Func pageUP()  ; Cut
	  ;Send("^x")
	  MouseWheel("up", 3)
   EndFunc

   Func pageDown() ; Paste
	  ;Send("^v")
	  MouseWheel("down", 3)
   EndFunc

   Func MainMenuGenFunctions1()
	  MouseClick('left',356,83,1,1)
			Sleep(300)
	  MouseClick('left',367,271,1,1)
			Sleep(300)


	  EndFunc

   Func MainMenuGenFunctions2()
	  MouseClick('left',111,86,1,1)
			Sleep(300)
	  MouseClick('left',108,262,1,1)
			Sleep(300)
	  EndFunc


   Func MainMenuChange1()
	  MouseClick('left',356,83,1,1)
			Sleep(300)
	  MouseClick('left',499,271,1,1)
		    Sleep(300)
	  MouseClick('left',361,434,1,1)
			Sleep(300)
		 EndFunc

   Func MainMenuChange2()
	  MouseClick('left',107,87,1,1)
			Sleep(300)
	  MouseClick('left',230,262,1,1)
		    Sleep(300)
	  MouseClick('left',105,417,1,1)
			Sleep(300)
		 EndFunc

   Func f1key() ; IM search


	WinActivate("HP Service Manager")
	if ($togg = 0) then
		 MainMenuGenFunctions1()
		 MouseClick('left',1093,511,1,1)
		 MouseMove(1172, 347,1)

	  Else
		 MainMenuGenFunctions2()
		 MouseClick('left',751,483,1,1)
		 MouseMove(1172, 347,1)

	  EndIf

   EndFunc
   ;#comments-end

   Func f2key() ; SM Search

   WinActivate("HP Service Manager")
	  if ($togg = 0) then
		 MainMenuGenFunctions1()
		 MouseClick('left',338,503,1,1)
	  Else

		 MainMenuGenFunctions2()
			Sleep(100)
		 MouseClick('left',88,481,1,1)

	 EndIf

   EndFunc

   Func f3key() ; CM Search

	 WinActivate("HP Service")
	 if ($togg = 0) Then
		MainMenuChange1()
	  Else
	  MainMenuChange2()
	 EndIf

   EndFunc

   Func selectdropbox()
	  Send("^a")
	  Sleep(50)
	  Send("^c")
	  Sleep(50)
	  send("{tab}")
	  Sleep(50)
	  Send("^v")
	  EndFunc

   Func f4key() ; Service manager

	 if WinActive("HP Service Manager") Then

	 if ($togg = 0) Then
	  MouseClick('left',1571,217,1,1)
	  Sleep(30)
	  selectdropbox()
	  Sleep(30)
	  MouseClick('left',1542,386,1,1)
	  Sleep(30)
	  selectdropbox()
	  Sleep(30)
	  MouseClick('left',874,552,1,1)
	  Sleep(10)
	  MouseClick('left',851,549,1,1)


  Else
	  WinMove("HP Service Manager","",1,1,1345,Default)

	  MouseClick('left',1317,154,1,1)
	  Sleep(30)
	  MouseClick('left',1191,208,1,1)
	  selectdropbox()
	  MouseClick('left',1147,377,1,1)
	  selectdropbox()
	  MouseClick('left',523,549,1,1)

   EndIf

Else
   WinActivate("HP Service Manager")
   EndIf
	   ;Opt("WinTitleMatchMode",2)

	   ;WinActivate("SecureCRT")
	   ;WinActivate("dslm0")
	   ;("_LCT")
	   ;WinActivate("-CO4")
	   ;WinActivate("mgmt")
	   ;WinActivate("nSydnbras")
	   ;WinActivate("wPertbras")
	   ;WinActivate("vMelbbras")
	   ;WinActivate("qBrisbras")
	   ;WinActivate("vMELBvoip")

	   ;Opt("WinTitleMatchMode",1)

   ;		WinActivate("Device Browser 7")

	   ; MsgBox(1,"kdjf",$tmpos[0] & "---" & $tmpos[1])
   ;	 MouseMove($tmpos[0],$tmpos[1],1)
   EndFunc

   Func f5key() ; Not in use
	   ;WinActivate("Amdocs")
	   ;Send("{ALT}")
	   #comments-start
	   Sleep(10)
	   Send("^2")
	   Sleep(10)
	   Send("^1")
	   Sleep(10)
	   Send("^f")
	   #comments-end

	   ;Send("^c")

   ;MouseMove(600,200)
   ;

   ;MouseClick('left',$tmpx[0],$tmpy[0],1,0)
   ;MouseClick('left',$tmpx[1],$tmpy[1],1,0)
   ;MouseClick('left',$tmpx[2],$tmpy[2],1,0)
   ;MouseClick('left',$tmpx[3],$tmpy[3],1,0)
   ;MouseClick('left',$tmpx[4],$tmpy[4],1,0)
   ;MouseClick('left',$tmpx[5],$tmpy[5],1,0)
   ;MouseClick('left',$tmpx[6],$tmpy[6],1,0)
   ;MouseClick('left',$tmpx[7],$tmpy[7],1,0)
   ;MouseClick('left',$tmpx[8],$tmpy[8],1,0)
   ;MouseClick('left',$tmpx[9],$tmpy[9],1,0)

   ;$xway = 0
   ;$yway = 0

   EndFunc

   Func f6key() ; Calculator


   ;~ 	while ($cnt < 5)
   ;~
   ;~ 	   MouseClick("left",2487, 69,1,1)
   ;~ 	   Sleep($slp)
   ;~ 	   send("^c")
   ;~ 	   Sleep($slp)
   ;~ 	   send("{F2}")
   ;~ 	   Sleep($slp+500)
   ;~ 	   send("^v")
   ;~ 	   Sleep($slp)
   ;~ 	   send("{enter}")
   ;~ 	   Sleep($slp+1000)
   ;~ 	   MouseClick("left",690, 488,1,1)
   ;~ 	   Sleep($slp)
   ;~ 	   MouseClick("left",675, 566,2,1)
   ;~ 	   MouseClick("left",675, 566,2,1)
   ;~ 	   Sleep($slp+2000)
   ;~ 	   MouseClick("left",556, 486,1,1)
   ;~ 	   Sleep($slp)
   ;~ 	   MouseClick("left",738, 658,1,1)
   ;~ 	   Sleep($slp)
   ;~ 	   MouseClick("left",732, 697,1,1)
   ;~ 	   Sleep($slp)
   ;~ 	   send("^a")
   ;~ 	   Sleep($slp)
   ;~ 	   send("^c")
   ;~ 	   Sleep($slp)
   ;~ 	   MouseClick("left",1173, 88,1,1)
   ;~ 	   Sleep($slp)
   ;~ 	   MouseClick("left",2487, 69,1,1)
   ;~ 	   Sleep($slp)
   ;~ 	   send("{right}")
   ;~ 	   MouseClick("left",2364, 189,1,1)
   ;~ 	   Sleep($slp)
   ;~ 	   send("^v")
   ;~ 	   Sleep($slp)
   ;~ 	   send("{enter}")
   ;~ 	   Sleep($slp)
   ;~ 	   send("{left}")
   ;~     $cnt = $cnt + 1
   ;~     WEnd




	  ;send("show int desc{enter}")
	WinActivate("V2 Database")
	   ;send("^v")

	   ; Local $tmpos
	   ; $tmpos = MouseGetPos()

	   ; $tmpx[$xway] = $tmpos[0] + 822
	   ; $tmpy[$yway] = $tmpos[1]

	   ; $yway = $yway + 1
	   ; $xway = $xway + 1

		;_ClipBoard_SetData("MouseClick('left'," & $tmpos[0] + 822 & "," & $tmpos[1] & ",1,0)")
		;Sleep(10)
		;WinActivate("Untitled")
		;Send("{enter}")
		;Send("^v")

   EndFunc

   Func f7key() ; Notepad


	run("notepad.exe")
	  ;Send("{lwindown}{shiftdown}")
   ;	Sleep(10)
   ;	send("{left}")
   ;	Send("{lwinup}{shiftup}")

	   ;WinActivate("Amdocs CRM")
	   ;Sleep(10)
	   ;Send("^g")
   EndFunc

   Func f8key() ; Line test result analyzer

	   local $vlu=0
	   local $dst=0

	   Send("^c")
	   Sleep(50)
	   $vlu = _ClipBoard_GetData()
	   $dst = round ($vlu/0.047,2)

	   MsgBox(1,"Line test", "1. DC Voltage: -5V to +5V"& @CRLF &"2. AC Voltage: 0V to +5V"& @CRLF &"3. Capacitive Balance: B-G / A-G  > 85%"& @CRLF &"4. Resistance: >3000ohm [= 10kms]"& @CRLF & @CRLF &"Distance(0.047/km):  " & $dst  & @CRLF & "Resistance(288/km):  " & $dst * 288)

	   ;Local $take
	   ;$take = _ClipBoard_GetData()
	   ;run("C:\Program Files (x86)\Microsoft Office\Office14\WINWORD.EXE " & $take)

	   #comments-start
	   WinActivate("Amdocs CRM")
	   Sleep(100)
	   Send("^a")

	   Sleep(100)
	   Send("^d")
	   #comments-end
   EndFunc

   Func f9key() ; Save email
	  send("!fa")
	  Sleep(200)
	  Send("{tab}")
	  Sleep(200)
   EndFunc

   Func f10key() ; switch between monitoring and working

#CS 	  if ($togo == "work") Then
### 		 WinActivate("HP Service Manager")
### 		 Opt("WinTitleMatchMode",2)
### 		 WinActivate("Outlook")
### 		 WinActivate("Chrome")
### 		 WinActivate("storm")
### 		 $togo = "monitor"
### 	  else
### 		 if $wlst = "none" Then
### 			$wlst = WinList("Contents")
### 		 EndIf
### 		 WinActivate("T1 Daily")
### 		 WinActivate("Fine Jakata")
### 		 WinActivate("SNMPc")
### 		 WinActivate("Cisco Finesse")
### 		 WinActivate("IFMS")
### 		 WinActivate($wlst[3][1])
### 		 WinActivate($wlst[2][1])
### 		 WinActivate($wlst[1][1])
### 		 WinActivate("Console - CA")
### 		 $togo = "work"
### 	  EndIf
 #CE

WinActivate("HP Service Manager")
Opt("WinTitleMatchMode",2)
;WinActivate("Outlook")
WinActivate("Chrome")
WinActivate("storm")


   EndFunc



   Func ctrlf11key() ; Get Mouse position
	local $mospos = MouseGetPos()
	local $cllp
	InputBox("Mouse Pos","Mouse position",$mospos[0] & ", " & $mospos[1])
	$cllp = "MouseClick('left'," & $mospos[0] & "," & $mospos[1] & ",1,1)"
    _ClipBoard_SetData($cllp)

	  EndFunc


   Func trimit($str)
		 Local $lnth = 30
		 Local $str2
		 $str2 = StringTrimRight($str,stringlen($str)-$lnth)
		 $str2 = StringSplit($str2,@CRLF)
		 Return $str2[1]
   EndFunc

   Func CTRLbelowesckey() ;xcxcxc
		 local $lastapp
		 $lastapp = WinGetHandle("[ACTIVE]")
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
		 WinActivate("My Shortis")
		 WinWaitActive("My Shortis")
		 send("^a")
		 Sleep(50)
		 send("{DEL}")
		 Sleep(50)
		 send("^v")
		 Sleep(300)
		 send("{LEFT}")
		 Sleep(50)
		 send("{Enter}")
		 Sleep(50)
		 send("^a")
		 Sleep(50)
		 send("^c")
		 Sleep(50)
		 WinActivate($lastapp)
	  EndFunc

   Func belowesckey() ; copy & paste
	  local $clipi, $mospos
	  Opt("WinTitleMatchMode",2)
	  send("^c")
	  if (WinActive("Chrome")) Then
		 $clipi = _ClipBoard_GetData()
		 if $clipi == "Your organization doesn't allow you to use work content with this application" Then
			$mospos = MouseGetPos()
			ToolTip("Fix your text plz.........",$mospos[0]-150,$mospos[1])
			Sleep(1000)
			ToolTip("")
		 Else
		 send("^v")
		 EndIf
	  Elseif WinActive("My Call Logs") Then
		 $clipi = _ClipBoard_GetData()
		 if $clipi == "Your organization doesn't allow you to use work content with this application" Then
			send("^v")
			Sleep(300)
			send("{left}")
			Sleep(100)
			send("{space}")
		 Else
		 send("^v")
		 EndIf
	  Else
		 send("^v")
	  EndIf

   EndFunc

   Func ALTbelowesckey() ; Menu options



	Local $wtmp
	Local $txt
	Local $prompt
	Local $smsonoff

	If ($togg = 0) Then

	  $smsonoff = "3. Small Screen OFF"
   Else
	  $smsonoff = "3. Small Screen ON"

   EndIf

	;qtxt
		 $prompt = splstr("1. free")
		 $prompt = $prompt & splstr("2. Comma Seperated Items")
		 $prompt = $prompt & splstr($smsonoff)
		 $prompt = $prompt & splstr("4. splicing details")
		 $prompt = $prompt & splstr("5. Equip Carry")
		 $prompt = $prompt & splstr("6. Work Plan")
		 $prompt = $prompt & splstr("7. SMS")
		 $prompt = $prompt & splstr("8. Basic Config - Cisco")
		 $prompt = $prompt & splstr("9. WNNT")
		 $prompt = $prompt & splstr("0. Auto Mouse Move")
		 $prompt = $prompt & splstr("------------------------")
		 $prompt = $prompt & splstr("11. VPN Login")
		 $prompt = $prompt & splstr("22. DSLAM Login ")
		 $prompt = $prompt & splstr("33. Closure Autofill")
		 $prompt = $prompt & splstr("44. Case Closure")
		 $prompt = $prompt & splstr("55. Alarm Email")
		 $prompt = $prompt & splstr("66. Cisco 3400 login")
		 $prompt = $prompt & splstr("77. WDM login")
		 $prompt = $prompt & splstr("88. Basic config E1")
		 $prompt = $prompt & splstr("99. Fill CM Date and Time")
		 $prompt = $prompt & splstr("00. Arrange my Apps")

		 $wtmp = InputBox("input", $prompt,Default,Default,Default,400)
		 Select

		 Case $wtmp = "00" ; Arrange my Apps
			WinMove("HP Service Manager","",260, 0, 1500, 1020)
			Sleep(50)
			Opt("WinTitleMatchMode",2) ;1=start, 2=subStr, 3=exact, 4=advanced, -1 to -4=Nocase
			WinMove("Outlook","",0,100,1750,920)
			Sleep(50)
			Opt("WinTitleMatchMode",2)
			WinMove("Chrome","",260, 100,1610,920)
			Sleep(50)
			WinMove("storm","",620, 200,1310,820)
			Sleep(50)
			WinMove("Cisco Finesse","",-10, 1650,1397,480)
			Sleep(50)
			WinMove("V2 Database","",269, 192,1000,860)
			Sleep(50)
			WinMove("Physical Network","",250, 50,1500,860)



		 Case $wtmp = "000" ; Arrange apps on second screen uiuiui
			if $wlst = "none" Then
			   $wlst = WinList("Contents")
			EndIf
			WinMove("T1 Daily","",605,1495,1100,625)
			WinMove("Fine Jakata","",605,1495,1100,625)
			Sleep(10)
			WinMove("SNMPc","",1319,1523)
			Sleep(10)
			WinMove("Cisco Finesse","",-10, 1648)
			Sleep(10)
			WinMove("IFMS","",274,1359)
			Sleep(10)
			WinMove($wlst[3][1],"",267,1081,370,440)
			Sleep(10)
			WinMove($wlst[2][1],"",620,1081,410,752)
			Sleep(10)
			WinMove($wlst[1][1],"",1008,1081,470,752)
			Sleep(10)
			WinMove("Console - CA","",1450,1081,492,752)

		 Case $wtmp = "9"
			send($winntpwd)
			Sleep(50)
			send("{enter}")

		 Case $wtmp = ""
			if $automouse = 0 Then
			   $automouse = 1
			Else
			   $automouse = 0
			EndIf

		 Case $wtmp = "0" ; vac
			if $automouse = 0 Then
			   $automouse = 1
			Else
			   $automouse = 0
			EndIf
		 Case $wtmp = "1" ; SNMP Reader



;----------------- SNMPC alarm reader ------
#CS 			$cbrd = _ClipBoard_GetData()
### 			;---clipboard save--
### 			local $snmpALM
### 			local $i
### 			local $c
### 			local $str = ""
### 			local $mpos = MouseGetPos()
###
### 			Send("^c")
### 			$snmpALM = _ClipBoard_GetData()
### 			$snmpALM = StringSplit($snmpALM,"[")
###
### 			$c = UBound($snmpALM)
###
### 			for $i = 1 to $c-1 Step +1
### 				$str = $str & $snmpALM[$i] & @LF & @LF
### 			Next
###
### 			MsgBox(1,"SNMP Reader", $str )
### 			 ;ToolTip($str,$mpos[0],$mpos[1])
### 			 ;ToolTip(
### 			;---clipboard return--
### 			_ClipBoard_SetData($cbrd)
### 			_ClipBoard_SetData($cbrd)
 #CE

		 Case $wtmp = "2" ; Comma Seperated Items
			local $inlist
			local $i
			local $str = ""
			local $hstr = ""

			$inlist = _ClipBoard_GetData()
			$inlist = StringReplace($inlist,@CRLF,",")

			Msgbox(1,"Comma Seperated",$inlist & @CRLF & @CRLF & "Done.. copied to the clipboard")

			_ClipBoard_SetData($inlist)
			Sleep(50)
			send("^v")

		 Case $wtmp = "3" ; noc/noc-level1 and FYI
			if ($togg = 0) Then
			   $togg = 1
			Else
			   $togg = 0
			EndIf

		 Case $wtmp = "4" ; splicing
			$txt = ClipGet()
			$txt = StringSplit($txt,"	")
			if ($txt[0] > 12) Then
			   ;MsgBox(1,"dkfj",$txt[11] & "-"& $txt[12] & "-"& $txt[4])
			   $txt = $txt[4] & " " & $txt[1] & " F" & $txt[9] & " " & $txt[3] & " > F" & $txt[11] & " " & $txt[5] & " " & $txt[13]
			   ClipPut($txt)
			   send("^v")
			EndIf
		 Case $wtmp = "5" ; equip carry
			$txt = splstr("- Laptop and charger#- Ethernet cable#- Console cable#- Replacement NTU #- TDR/PSD gear")
			ClipPut($txt)
			Send("^v")

		 Case $wtmp = "6" ; work plan
			$txt = splstr("- Check internal wiring#- Perfrom open/short testing from ES/MDF#- Perform PSD/TDR testing#- Confirm before replacing NTU##Please call Uecomm NOC 1800 707 447 for assistance.")
			ClipPut($txt)
			Send("^v")

		 Case $wtmp = "7" ; SMS
			$txt = InputBox("SMS","Cust Name", $prevsms)
			$txt = $txt & "," & InputBox("SMS","State")
			$txt = $txt & "," & InputBox("SMS","Suburb")
			$txt = $txt & "," & InputBox("SMS","GBE, DSL, E1, WDM, Dk Fiber, SDH, ATM")
			$txt = $txt & "," & InputBox("SMS","Circuit Size")
			$txt = $txt & "," & InputBox("SMS","Service Down, Latency, Packet loss")
			$txt = $txt & "," & InputBox("SMS",splstr("Pending Cust .... NOC Invest# Esc to T2 .... Esc to NOC TL# ESC to ext carrier .... Arranging field Tech# Field Tech ETA .... Fault resolved"))
			$txt = $txt & "," & InputBox("SMS","Prem+, Std")
			$prevsms = $txt
			ClipPut($txt)
			Send("^v")

		 Case $wtmp = "8" ; Basic Config
			;local  = InputBox("Basic","")
			local $vlan = InputBox("Basic Config","vlan")
			local $gateway = InputBox("Basic Config","$gateway")
			local $ip = InputBox("Basic Config","$ip")
			local $mask = InputBox("Basic Config","$mask","255.255.")
			local $uplink = InputBox("Basic Config","$uplink")

			$txt = splstr("conf t#enable password uecomm##vlan "& $vlan &"#exit#ip default-gateway "& $gateway &"##interface vlan "& $vlan &"#ip address "& $ip &" "& $mask &"#no shut#exit##interface "& $uplink &"#port-type nni#switchport mode trunk#switchport trunk allowed vlan add "& $vlan &"#no shut#exit##line vty 0 4#password uecomm#end")
			ClipPut($txt)
			Send("^v")




	  Case $wtmp = "11" ;VPN login
		 local $vlog = "vpnhabbas"
		 local $vpas = "ShutterUJD734"
		 local $vpin = "1234"

		 Send($vlog)
		 Sleep(10)
		 Send("{TAB}")
		 send($vpas)
		 Send("{TAB}")
		 send($vpin)


		 Case $wtmp = "22" ;Dslam login
			Send("Shashank Dangwal")
			Sleep(10)
			Send("{tab}")
			Sleep(10)
			send("octo2013")
			Sleep(10)
			send("{enter}")


		 Case $wtmp = "33" ;case closure autofill
			Sleep(10)
			send($incident)
			Sleep(10)
			send("{tab}{tab}")
			Sleep(10)
			send($cause)
			Sleep(10)
			send("{tab}")
			Sleep(10)
			send($solution)
		 Case $wtmp = "44" ;Case Closure
			$incident = InputBox("closure","Incident","Loss of service")
			$cause = InputBox("closure","Cause","Service went down due to power issue onsite")
			$solution = InputBox("closure","Solution","Service restored by power")

			$txt = splstr("Incident: "&$incident&"#Cause: "&$cause&"#Solution: "&$solution)
			ClipPut($txt)
			Send("^v")

		 Case $wtmp = "55" ; Alarm Email

			$txt = splstr("Dear Customer,##Please note we have received Loss of Service alarm for your service located at <>.#Please confirm power, reboot the router/NTU and provide us LED status.##regards,#Uecomm NOC")
			ClipPut($txt)
			Send("^v")
		 Case $wtmp = "66" ; Alarm Email
			Send("fieldops")
			Send("{enter}")
			Sleep(100)
			Send("operator")
			Send("{enter}")
			Sleep(100)
			Send("en")
			Send("{enter}")
			Sleep(100)
			Send("WalboplbF")
			Send("{enter}")
		 Case $wtmp = "77" ; Alarm Email
			Send("admin")
			Sleep(100)
			Send("{tab}")
			Send("opterasm")
			Sleep(100)
			Send("{enter}")
		 Case $wtmp = "88" ; Basic config E1
			$txt = splstr("conf t#enable password uecomm##controller E1 0#channel-group 0 timeslots 1-31#exit##interface Serial<<<0/0/0:0>>># bandwidth 2048# no ip address# encapsulation frame-relay# load-interval 30# no fair-queue# frame-relay lmi-type cisco#exit##interface Serial<<<0/0/0:0.111>>> point-to-point # ip address <<<10.8.0.210 255.255.255.252>>># frame-relay interface-dlci <<<111>>>   #exit##interface Loopback0# ip address <<<172.16.22.53 255.255.255.255>>>mgmt ip#exit##ip default-gateway <<<10.8.0.209>>>#ip route 0.0.0.0 0.0.0.0 <<<10.8.0.209>>>##line vty 0 4#password uecomm#end")
			ClipPut($txt)
			Send("^v")
		 Case $wtmp = "99" ; Fill in cm Date TimerDiff
   ;		 Local $ajDate, $kalDate, $kdFormat, $abTime, $cmTime
   ;		 $abTime = _NowTime()
   ;MsgBox(1,"ldkfj",$abTime)
			;$ajDate = _NowDate()
			;$cmTime = "12:00:00 AM";

			;$kalDate = _DateAdd('d', -1, _NowCalcDate())
			;$kdFormat = _DateTimeFormat($kalDate,2)

			send($ajDate)
			send(" ")
			send("20:00")
			Sleep(100)
			send("{tab}")
			Sleep(100)
			send("{tab}")
			Sleep(100)
			send($kalDate)
			send(" ")
			send("8:00")
		 Case $wtmp = "999" ; Fill in cm Date TimerDiff
			$ajDate = InputBox("ajDate","ajDate?")
			$kalDate = InputBox("kalDate","kalDate?")
		 EndSelect

   EndFunc

   Func ALTonekey() ; --not in use--
			_ClipBoard_SetData("haha")
			local $str = ""
			send("^l")
			Sleep(100)
			send("^x")
			Sleep(100)
			send("^w")
			Sleep(300)

			$cbrd = _ClipBoard_GetData()

			if $cbrd <> "haha" Then

			   $str = StringSplit($cbrd,"?")
			   $str = StringSplit($str[2],"=")
			   _ClipBoard_SetData($str[3])
			EndIf

   EndFunc

   Func ALTtwokey() ; SNMPC properties

	  MouseClick("right")
	   Sleep(100)
       send("{down}{enter}")
   EndFunc

Func ALTthreekey() ; service call
   send("{SHIFTDOWN}")
   send("{Home}")
   Sleep(50)
   send("{SHIFTUP}")

;~ 	  MouseClick('left',1530,2074,1,1)
;~ 	  Sleep(100)
;~       MouseClick('left',1566,2054,1,1)
;~ 	  Sleep(100)
;~ 	  send("{SHIFTDOWN}{HOME}")
;~ 	  Sleep(100)
;~ 	  send("{SHIFTUP}")
;~ 	  MouseClick("right")
   EndFunc

Func ALTfourkey() ; service call
MouseClick("right")
	   Sleep(100)
	   send("a")
   EndFunc

   Func ALTF3key() ; LOLS
	   Opt("WinTitleMatchMode",2)
	   WinActivate("InPrivate")
	   Opt("WinTitleMatchMode",1)

   endFunc


   Func ALTF5key() ; ALT + F5 - Search Session on cores
	   Local $msret
	   $whichcore = InputBox("input", "1.vMelb  2.nSyd  3.qBris  4.wPerth",$whichcore)
		   $uname = InputBox("input", "Enter Username?", $uname)



		   Select
		   Case $whichcore = "1" ; vMelb
			   WinActivate("vMelbbras")
			   dim $j=0
			   Do
				   Send("{enter}")

				   Send("show sss sess | i " & $uname)
				   Send("{enter}")

				   Sleep(500)
				   Send("show vpdn hist fail | i " & $uname)

				   Send("{enter}")
				   $msret = MsgBox(4100,"mess","proceed....")
				   if $msret = 7 Then
					   ExitLoop
					   EndIf
				   Send("^{tab}")
				   $j = $j + 1
			   Until $j=10
		   Case $whichcore = "2" ; nSydn
			   WinActivate("nSydnbras")
			   dim $j=0
			   Do
				   Send("{enter}")

				   Send("show sss sess | i " & $uname)
				   Send("{enter}")

				   Sleep(500)
				   Send("show vpdn hist fail | i " & $uname)

				   Send("{enter}")
				   $msret = MsgBox(4100,"mess","proceed....")
				   if $msret = 7 Then
					   ExitLoop
					   EndIf
				   Send("^{tab}")
				   $j = $j + 1
			   Until $j=10
		   case $whichcore = "3" ;qBris
			   WinActivate("qBrisbras")
			   dim $j=0
			   Do
				   Send("{enter}")

				   Send("show sss sess | i " & $uname)
				   Send("{enter}")

				   Sleep(500)
				   Send("show vpdn hist fail | i " & $uname)

				   Send("{enter}")
				   $msret = MsgBox(4100,"mess","proceed....")
				   if $msret = 7 Then
					   ExitLoop
					   EndIf
				   Send("^{tab}")
				   $j = $j + 1
			   Until $j=9
		   Case $whichcore = "4" ;wPerth
			   WinActivate("wPertbras")
			   dim $j=0
			   Do
				   Send("{enter}")

				   Send("show sss sess | i " & $uname)
				   Send("{enter}")

				   Sleep(500)
				   Send("show vpdn hist fail | i " & $uname)

				   Send("{enter}")
				   $msret = MsgBox(4100,"mess","proceed....")
				   if $msret = 7 Then
					   ExitLoop
					   EndIf
				   Send("^{tab}")
				   $j = $j + 1
			   Until $j=4
		   EndSelect


   EndFunc

   Func ALTF6key() ; ALT + F6 - Write when new case

			   local $abcd = ""

			   $abcd = "Caller Name: " & @CRLF
			   $abcd = $abcd & "Caller Contact: " & @CRLF & @CRLF
			   $abcd = $abcd & "Company or Channel Partner: " & @CRLF
			   $abcd = $abcd & "Channel Partner Reference: " & @CRLF & @CRLF
			   $abcd = $abcd & "Site Address: " & @CRLF & @CRLF
			   $abcd = $abcd & "Site Contact: " & @CRLF
			   $abcd = $abcd & "Site Availability: 9am - 5pm" & @CRLF & @CRLF
			   $abcd = $abcd & "Fault Description:" & @CRLF

			   _ClipBoard_SetData($abcd)
			   ;WinActivate("Clarify");
			   WinActivate("Amdocs CRM")
			   Send("^v")


   EndFunc

   Func ALTF7key() ; ALT + F7 - empty
		   Local $getlen = 0;
		   Local $inp = 0;
		   while(1)
			   $inp = InputBox("input","Enter cable lenght?")
			   $getlen = $getlen + $inp
			   if ($inp = 0) Then
				   MsgBox(4096,"Total Cable Lenght", "The cable lenght is = " & $getlen)
				   ExitLoop
			   EndIf
		   WEnd
   EndFunc

   Func ALTF8key() ; ALT + F8 - empty
	   local $findhost = InputBox("input", "Enter IP address to find host...")
	   run("cmd.exe")
	   WinActivate("C:\")
	   Sleep(100)
	   send("telnet 10.0.70.46")
	   send("{enter}")
	   Sleep(100)
	   WinActivate("Telnet")
	   Sleep(100)
	   send("noc")
	   Sleep(100)
	   send("{enter}")
	   Sleep(100)
	   send("1noc1")
	   Sleep(100)
	   send("{enter}")
	   Sleep(100)
	   send("nslookup " & $findhost & "{enter}")
   EndFunc

   Func ALTF9key() ; alt f9


	   local $issue = InputBox("QuickSC","Issue? " & @CRLF & @CRLF & "1. No Sync"  & @CRLF &  "2. Flapping Sync" & @CRLF &  "3. Dropouts" & @CRLF & "4. Slow speed" & @CRLF &  "5. No Authentication" & @CRLF &  "6. No Power to CPE" & @CRLF & @CRLF & "OR write your own, if other.", Default, Default, 350, 250)
	   ;if $issue = "" Then
	   ;Exit

	   ;EndIf
	   local $adsl = InputBox("QuickSC", "Service type?" & @CRLF & @CRLF &    "1. SHDSL"  & @CRLF &    "2. ADSL", Default, Default, 350, 250)
	   ;if $adsl = "" Then
	   ;Exit
	   ;EndIf
	   local $ull = InputBox("QuickSC", "Line type?" & @CRLF & @CRLF &    "1. Spec"  & @CRLF &    "2. ULL", Default, Default, 350, 250)
	   ;if $ull = "" Then
	   ;Exit
	   ;EndIf
	   local $reprouter = InputBox("QuickSC", "Enter repalcement router name OR leave blank for T3?", Default, Default, 350, 250)
	   local $sitecontact = InputBox("QuickSC", "Enter site contact name and number?", Default, Default, 350, 250)
	   ;if $sitecontact = "" Then
	   ;Exit
	   ;EndIf
	   local $siteaddress = InputBox("QuickSC", "Enter site address?", Default, Default, 350, 250)
	   ;if $siteaddress = "" Then
	   ;Exit
	   ;EndIf
	   local $sc;


	   Switch $issue
		   Case 1
		   $issue = "No Sync"
		   Case 2
		   $issue = "Flapping Sync"
		   Case 3
		   $issue = "Dropouts"
		   Case 4
		   $issue = "Slow speed"
		   Case 5
		   $issue = "No Authentication"
		   Case 6
		   $issue = "No Power to CPE"
		   Case Else
		   $issue = $issue
	   EndSwitch


	   Switch $adsl
		   Case 1
		   $adsl = "SHDSL"
		   Case 2
		   $adsl = "ADSL"
		   Case Else
		   $adsl = $adsl
	   EndSwitch


	   Switch $ull
		   Case 1
		   $ull = "Spec"
		   Case 2
		   $ull = "ULL"
		   Case Else
		   $ull = $ull
	   EndSwitch

	   $sc = "Please attend this site to have a look at " & $issue & " issue. Please do following:" & @CRLF & @CRLF
	   $sc = $sc & "- take your " & $adsl & " test router"

	   ;first line
	   if $ull = "Spec" Then
		   $sc = $sc & ", analog phone"
	   EndIf

	   if $issue = "Slow speed" Then
		   $sc = $sc & ", laptop"
	   EndIf

	   if $reprouter = "" Then
		   $sc = $sc & " and relevant cabling along." & @CRLF
	   else
		   $sc = $sc & " and replacement " & $reprouter & " along." & @CRLF
	   EndIf


	   ;second line
	   Switch $issue
		   Case "No Sync"
		   $sc = $sc & "- test service from the end socket, if it syncs up please give us a call to capture stats." & @CRLF
		   $sc = $sc & "- Otherwise goto mdf and test from there." & @CRLF
		   Case "Flapping Sync"
		   $sc = $sc & "- test service from the end socket, if it doesn't flap please give us a call to capture stats." & @CRLF
		   $sc = $sc & "- Otherwise goto mdf and test from there." & @CRLF
		   if ($ull = "Spec") Then
		   $sc = $sc & "- Check internal cabling, filter(s) and PSTN line quality." & @CRLF
		   EndIf
		   Case "Dropouts"
		   $sc = $sc & "- test service from the end socket, if it doesn't drop please give us a call to capture stats." & @CRLF
		   $sc = $sc & "- Otherwise goto mdf and test from there." & @CRLF
		   if ($ull = "Spec") Then
		   $sc = $sc & "- Check internal cabling, filter(s) and PSTN line quality." & @CRLF
		   EndIf
		   Case "Slow speed"
		   $sc = $sc & "- connect you laptop and test speed from the end socket, if it is within specs please give us a call." & @CRLF
		   $sc = $sc & "- Otherwise goto mdf and test from there." & @CRLF
		   if ($ull = "Spec") Then
		   $sc = $sc & "- Check internal cabling, filter(s) and PSTN line quality." & @CRLF
		   EndIf
		   Case "No Authentication"
		   $sc = $sc & "- test service from the end socket, if it authenticates please give us a call to capture stats." & @CRLF
		   $sc = $sc & "- Otherwise goto mdf and test from there." & @CRLF
		   if ($ull = "Spec") Then
		   $sc = $sc & "- Check internal cabling, filter(s) and PSTN line quality." & @CRLF
		   EndIf
		   Case "No Power to CPE"
		   $sc = $sc & "- test service with the existing CPE, if it doesn't work please replace power supply and retest." & @CRLF
		   $sc = $sc & "- if it still doesn't work, please replace CPE." & @CRLF
		   Case Else
		   $sc = $sc & "- test service from the end socket, if it < > please give us a call to capture stats." & @CRLF
		   $sc = $sc & "- Otherwise goto mdf and test from there." & @CRLF
	   EndSwitch

	   ;third line
	   if NOT ($reprouter = "") Then
		   $sc = $sc & "- Router-config/Network-diagram has been attached with this email." & @CRLF
	   EndIf

	   ;remaining lines
	   $sc = $sc & @CRLF
	   $sc = $sc & "site contact: " & $sitecontact & @CRLF
	   $sc = $sc & "site address: " & $siteaddress & @CRLF

	   _ClipBoard_SetData($sc)

	   run("notepad.exe")

	   WinWaitActive("Untitled")

	   Send("^v")

	   WinSetTitle("Untitled - Notepad","","QuickSC © M. Hasan Abbas")




	   #comments-start
	   local $issue = InputBox("input","Issue?")
	   local $adsl = InputBox("input", "shdsl or adsl?")
	   local $ull = InputBox("input", "1. Spec  2. ULL?")
	   local $reprouter = InputBox("input", "Repalcement router name OR leave blank for T3?")
	   local $sitecontact = InputBox("input", "Site contact name and number?")
	   local $siteaddress = InputBox("input", "Site address?")
	   local $sc;

	   $sc = "Please attend this site to have a look at " & $issue & " issue. Please do following:" & @CRLF & @CRLF
	   $sc = $sc & "- take your " & $adsl & " test router "
	   if ($reprouter = "") Then
		   $sc = $sc & "and relevant cabling along." & @CRLF
	   Else
		   $sc = $sc & "and replacement " & $reprouter & " along." & @CRLF
	   EndIf


	   $sc = $sc & "- test the service at the end socket, if it <> please give us a call to capture stats." & @CRLF
	   $sc = $sc & "- Otherwise goto mdf and test there." & @CRLF

	   if ($ull = 1) Then
		   $sc = $sc & "- Check internal cabling, filter and pstn line quality." & @CRLF
		   EndIf


	   if NOT ($reprouter = "") Then
		   $sc = $sc & "- router config has been attached with this email." & @CRLF
	   EndIf

	   $sc = $sc & @CRLF
	   $sc = $sc & "site contact: " & $sitecontact & @CRLF
	   $sc = $sc & "site address: " & $siteaddress & @CRLF

	   _ClipBoard_SetData($sc)

	   run("notepad.exe")

	   WinWaitActive("Untitled")

	   Send("^v")

	   WinSetTitle("Untitled - Notepad","","QuickSC © M. Hasan Abbas")
	   #comments-end

	   EndFunc

   Func ALTPausekey() ; ctrl F1 -
	  run("Outlook.exe")
   EndFunc


