#include <MsgBoxConstants.au3>
#include <AutoItConstants.au3>
#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         mtinnguyen@gmail.com

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
Global $hWnd
Global $aPos_hWnd
Global $nOne_Pos[2] = [555,325]
Global $nOnT_Pos[2] = [575,325]
Global $nTwo_Pos[2] = [587,325]
Global $nTnT_Pos[2] = [610,325]
Global $nThree_Pos[2] = [621,325]
Global $nTnF_Pos[2] = [643,325]
Global $nFour_Pos[2] = [654,325]
Global $xFinish1[2] = [651, 55]
Global $xFinish2[2] = [657, 55]
Global $xFinish3[2] = [333, 31]
Global $xFinish4[2] = [680, 33]
Global $btnOK[2] = [493, 400]
Global $currWindow = 0
Global $skipTime = 0
Global $clickButton = 0; 1 : click Button 1
; 2 : click Button 2
; 3 : click Button 3
; 4 : click Button 4
; 5 : click Button X
; 6 : click Button OK
; 0 : no click
Global $currState = 0
; 0 : New - just open app
; 1: State Adv running
; 2: State Adv Finish


GetHandleByClass("Qt5QWindowIcon")
$aPos_hWnd = WinGetPos($hWnd)
; Display the handle of the NoxPlayer window.
;MsgBox($MB_SYSTEMMODAL, "", $hWnd)

;Local $iColor = PixelGetColor(553, 320) default window is desktop
;Local $iColor = PixelGetColor(622, 317)
Local $red = 0xFF3E59
Local $blank = 0xFFFFFF
Local $blankOK = 0x999999
Local $redOK = 0x992535
Local $color1X1 = 0xFFFEFF
Local $color2X1 = 0xFFFFFF
Local $color3X1 = 0xFBFBFB
Local $color1X2 = 0x333333
Local $color2X2 = 0x2E2E2E
Local $colorX3 = 0xFFFFFF
Local $colorX4 = 0xFFFFFF

Local $iColor1 = PixelGetColor($nOne_Pos[0] + $aPos_hWnd[0] - 301, $nOne_Pos[1] + $aPos_hWnd[1], $hWnd)
Local $iTemp1 = PixelGetColor($nOnT_Pos[0] + $aPos_hWnd[0] - 301, $nOnT_Pos[1] + $aPos_hWnd[1], $hWnd)
Local $iColor2 = PixelGetColor($nTwo_Pos[0] + $aPos_hWnd[0] - 301, $nTwo_Pos[1] + $aPos_hWnd[1], $hWnd)
Local $iTemp2 = PixelGetColor($nTnT_Pos[0] + $aPos_hWnd[0] - 301, $nTnT_Pos[1] + $aPos_hWnd[1], $hWnd)
Local $iColor3 = PixelGetColor($nThree_Pos[0] + $aPos_hWnd[0] - 301, $nThree_Pos[1] + $aPos_hWnd[1], $hWnd)
Local $iTemp3 = PixelGetColor($nTnF_Pos[0] + $aPos_hWnd[0] - 301, $nTnF_Pos[1] + $aPos_hWnd[1], $hWnd)
Local $iColor4 = PixelGetColor($nFour_Pos[0] + $aPos_hWnd[0] - 301, $nFour_Pos[1] + $aPos_hWnd[1], $hWnd)
Local $iX1 = PixelGetColor($xFinish1[0] + $aPos_hWnd[0] - 301, $xFinish1[1] + $aPos_hWnd[1], $hWnd)
Local $iX2 = PixelGetColor($xFinish2[0] + $aPos_hWnd[0] - 301, $xFinish2[1] + $aPos_hWnd[1], $hWnd)
Local $iX3 = PixelGetColor($xFinish3[0] + $aPos_hWnd[0] - 301, $xFinish3[1] + $aPos_hWnd[1], $hWnd)
Local $iX4 = PixelGetColor($xFinish4[0] + $aPos_hWnd[0] - 301, $xFinish4[1] + $aPos_hWnd[1], $hWnd)
;MsgBox($MB_SYSTEMMODAL, "", "The hex color is: " & Hex($iColor, 6))

;Local $hWnd_Pos = WinGetPos($hWnd);

; Display the array values returned by WinGetPos.
    MsgBox($MB_SYSTEMMODAL, "", "$iColor1: " & Hex($iColor1, 6)& @CRLF & _
            "$iColor2: " & Hex($iColor2, 6) & @CRLF & _
            "$iColor3: " & Hex($iColor3, 6) & @CRLF & _
			"$iColor4: " & Hex($iColor4, 6) & @CRLF & _
			"$iTemp1: " & Hex($iTemp1, 6) & @CRLF & _
			"$iTemp2: " & Hex($iTemp2, 6) & @CRLF & _
            "$iTemp3: " & Hex($iTemp3, 6))
If (($iColor1 == $blank) And ($iColor2 == $red)) Then
   ;MsgBox($MB_SYSTEMMODAL, "", "Ngon")
EndIf

;DetectCurrWindow()
While 1
Local $posMouse = MouseGetPos()
Action()
MouseMove($posMouse[0], $posMouse[1], 0)
Sleep(5500)
WEnd

Func GetHandleByClass($className)
   $input = "[CLASS:" & $className & "]"
   $hWnd = WinGetHandle($input)

   If @error Then
        ;MsgBox($MB_SYSTEMMODAL, "", "An error occurred when trying to retrieve the window handle of NoxPlayer.")
        Exit
	 EndIf
EndFunc

Func Action()
   if ($currState == 0) Then
	  DetectCurrWindow()
	  If (($currWindow == 1) And ($clickButton > 0)) Then
		 ;MsgBox($MB_SYSTEMMODAL, "", "Click button: " & $clickButton)
		 If ($clickButton == 1) Then
			MouseClick($MOUSE_CLICK_LEFT, $nOne_Pos[0] + $aPos_hWnd[0] - 301, $nOne_Pos[1] + $aPos_hWnd[1], 1, 0)
			;Opt ("MouseCoordMode", 0)
			;ControlClick("[CLASS:Qt5QWindowIcon]","","","left", 1, $nOne_Pos[0], $nOne_Pos[1])
		 ElseIf ($clickButton == 2) Then
			MouseClick($MOUSE_CLICK_LEFT, $nTwo_Pos[0] + $aPos_hWnd[0] - 301, $nTwo_Pos[1] + $aPos_hWnd[1], 1, 0)
		 ElseIf ($clickButton == 3) Then
			MouseClick($MOUSE_CLICK_LEFT, $nThree_Pos[0] + $aPos_hWnd[0] - 301, $nThree_Pos[1] + $aPos_hWnd[1], 1, 0)
		 ElseIf ($clickButton == 4) Then
			MouseClick($MOUSE_CLICK_LEFT, $nFour_Pos[0] + $aPos_hWnd[0] - 301, $nFour_Pos[1] + $aPos_hWnd[1], 1, 0)
		 EndIf
		 $currState = 1; 1: State Adv running
		 ;Return ; Wait 10s and re-run Action
	  ElseIf ($currWindow == 4) Then
		 ;Hard click button OK
		 MouseClick($MOUSE_CLICK_LEFT, $btnOK[0] + $aPos_hWnd[0] - 301, $btnOK[1] + $aPos_hWnd[1], 1, 0)
		 MouseMove($posMouse[0], $posMouse[1], 0)
		 $currState = 0; 2: State Adv Finish
		 $skipTime = 0
		 Sleep(500)
		 Action()
	  ElseIf ($currWindow == 2) Then
		 $skipTime += 1;
		 If ($skipTime > 8) Then
			;Hard click button X
			MouseClick($MOUSE_CLICK_LEFT, $xFinish2[0] + $aPos_hWnd[0] - 301, $xFinish2[1] + $aPos_hWnd[1], 2, 0)
			$currState = 2; 2: State Adv Finish
			$skipTime = 0
		 EndIf
	  ElseIf ($currWindow == 3) Then
		 ;Hard click button X
		 MouseClick($MOUSE_CLICK_LEFT, $xFinish2[0] + $aPos_hWnd[0] - 301, $xFinish2[1] + $aPos_hWnd[1], 2, 0)
		 $currState = 2; 2: State Adv Finish
		 $skipTime = 0
	  EndIf
   ElseIf ($currState == 1) Then
	  DetectCurrWindow()
	  If ($currWindow == 2) Then
		 $skipTime += 1;
		 If ($skipTime > 8) Then
			;Hard click button X
			MouseClick($MOUSE_CLICK_LEFT, $xFinish2[0] + $aPos_hWnd[0] - 301, $xFinish2[1] + $aPos_hWnd[1], 2, 0)
			$currState = 2; 2: State Adv Finish
			$skipTime = 0
		 EndIf
	  ElseIf ($currWindow == 3) Then
		 ;Hard click button X
		 MouseClick($MOUSE_CLICK_LEFT, $xFinish2[0] + $aPos_hWnd[0] - 301, $xFinish2[1] + $aPos_hWnd[1], 2, 0)
		 $currState = 2; 2: State Adv Finish
		 $skipTime = 0
	  ElseIf (($currWindow == 1) And ($clickButton > 0)) Then
		 ;MsgBox($MB_SYSTEMMODAL, "", "Click button: " & $clickButton)
		 If ($clickButton == 1) Then
			MouseClick($MOUSE_CLICK_LEFT, $nOne_Pos[0] + $aPos_hWnd[0] - 301, $nOne_Pos[1] + $aPos_hWnd[1], 1, 0)
		 ElseIf ($clickButton == 2) Then
			MouseClick($MOUSE_CLICK_LEFT, $nTwo_Pos[0] + $aPos_hWnd[0] - 301, $nTwo_Pos[1] + $aPos_hWnd[1], 1, 0)
		 ElseIf ($clickButton == 3) Then
			MouseClick($MOUSE_CLICK_LEFT, $nThree_Pos[0] + $aPos_hWnd[0] - 301, $nThree_Pos[1] + $aPos_hWnd[1], 1, 0)
		 ElseIf ($clickButton == 4) Then
			MouseClick($MOUSE_CLICK_LEFT, $nFour_Pos[0] + $aPos_hWnd[0] - 301, $nFour_Pos[1] + $aPos_hWnd[1], 1, 0)
		 EndIf
		 $currState = 1; 1: State Adv running
		 Return ; Wait 10s and re-run Action
	  EndIf
   ElseIf ($currState == 2) Then
	  DetectCurrWindow()
	  If ($currWindow == 2) Then ; Loading OK Window
		 $skipTime += 1;
		 If ($skipTime > 8) Then
			;Hard click button X
			MouseClick($MOUSE_CLICK_LEFT, $xFinish2[0] + $aPos_hWnd[0] - 301, $xFinish2[1] + $aPos_hWnd[1], 2, 0)
			$skipTime = 0
		 EndIf
	  ElseIf ($currWindow == 4) Then
		 ;Hard click button OK
		 MouseClick($MOUSE_CLICK_LEFT, $btnOK[0] + $aPos_hWnd[0] - 301, $btnOK[1] + $aPos_hWnd[1], 1, 0)
		 MouseMove($posMouse[0], $posMouse[1], 0)
		 $currState = 0; 2: State Adv Finish
		 $skipTime = 0
		 Sleep(500)
		 Action()
	  ElseIf ($currWindow == 3) Then
		 ;Hard click button X
		 MouseClick($MOUSE_CLICK_LEFT, $xFinish2[0] + $aPos_hWnd[0] - 301, $xFinish2[1] + $aPos_hWnd[1], 2, 0)
		 $skipTime = 0
	  ElseIf (($currWindow == 1) And ($clickButton > 0)) Then
		 ;MsgBox($MB_SYSTEMMODAL, "", "Click button: " & $clickButton)
		 If ($clickButton == 1) Then
			MouseClick($MOUSE_CLICK_LEFT, $nOne_Pos[0] + $aPos_hWnd[0] - 301, $nOne_Pos[1] + $aPos_hWnd[1], 1, 0)
		 ElseIf ($clickButton == 2) Then
			MouseClick($MOUSE_CLICK_LEFT, $nTwo_Pos[0] + $aPos_hWnd[0] - 301, $nTwo_Pos[1] + $aPos_hWnd[1], 1, 0)
		 ElseIf ($clickButton == 3) Then
			MouseClick($MOUSE_CLICK_LEFT, $nThree_Pos[0] + $aPos_hWnd[0] - 301, $nThree_Pos[1] + $aPos_hWnd[1], 1, 0)
		 ElseIf ($clickButton == 4) Then
			MouseClick($MOUSE_CLICK_LEFT, $nFour_Pos[0] + $aPos_hWnd[0] - 301, $nFour_Pos[1] + $aPos_hWnd[1], 1, 0)
		 EndIf
		 $currState = 1; 1: State Adv running
		 Return ; Wait 10s and re-run Action
	  EndIf
   EndIf
   EndFunc

; Return 1: Start Window
; Return 2: Adv Running Window
; Return 3: Adv Finish Window
; Return 4: Click OK Window
;
Func DetectCurrWindow()
; Scan screen
$aPos_hWnd = WinGetPos($hWnd)

$iColor1 = PixelGetColor($nOne_Pos[0] + $aPos_hWnd[0] - 301, $nOne_Pos[1] + $aPos_hWnd[1], $hWnd)
$iTemp1 = PixelGetColor($nOnT_Pos[0] + $aPos_hWnd[0] - 301, $nOnT_Pos[1] + $aPos_hWnd[1], $hWnd)
$iColor2 = PixelGetColor($nTwo_Pos[0] + $aPos_hWnd[0] - 301, $nTwo_Pos[1] + $aPos_hWnd[1], $hWnd)
$iTemp2 = PixelGetColor($nTnT_Pos[0] + $aPos_hWnd[0] - 301, $nTnT_Pos[1] + $aPos_hWnd[1], $hWnd)
$iColor3 = PixelGetColor($nThree_Pos[0] + $aPos_hWnd[0] - 301, $nThree_Pos[1] + $aPos_hWnd[1], $hWnd)
$iTemp3 = PixelGetColor($nTnF_Pos[0] + $aPos_hWnd[0] - 301, $nTnF_Pos[1] + $aPos_hWnd[1], $hWnd)
$iColor4 = PixelGetColor($nFour_Pos[0] + $aPos_hWnd[0] - 301, $nFour_Pos[1] + $aPos_hWnd[1], $hWnd)
$iX1 = PixelGetColor($xFinish1[0] + $aPos_hWnd[0] - 301, $xFinish1[1] + $aPos_hWnd[1], $hWnd)
$iX2 = PixelGetColor($xFinish2[0] + $aPos_hWnd[0] - 301, $xFinish2[1] + $aPos_hWnd[1], $hWnd)
$iX3 = PixelGetColor($xFinish3[0] + $aPos_hWnd[0] - 301, $xFinish3[1] + $aPos_hWnd[1], $hWnd)
$iX4 = PixelGetColor($xFinish4[0] + $aPos_hWnd[0] - 301, $xFinish4[1] + $aPos_hWnd[1], $hWnd)
; Detect Start Window
If (($iTemp1 == $blank) And ($iTemp2 == $blank) And ($iTemp2 == $blank)) Then
   ;MsgBox($MB_SYSTEMMODAL, "", "3 Temp Blank. Testing 4 Button click")
   If ( ($iColor1 == $red) And ($iColor2 == $red) And ($iColor3 == $red) And ($iColor4 == $red)) Then ; 1R-2R-3R-4R
	  ;MsgBox($MB_SYSTEMMODAL, "", "4 Button Red. Select Button 1")
	  $currWindow = 1
	  $clickButton = 1
	  Return
   ElseIf ( ($iColor1 == $blank) And ($iColor2 == $red) And ($iColor3 == $red) And ($iColor4 == $red)) Then ; 1B-2R-3R-4R
	  ;MsgBox($MB_SYSTEMMODAL, "", " Button 2-3-4 Red. Select Button 2")
	  $currWindow = 1
	  $clickButton = 2
	  Return
   ElseIf ( ($iColor1 == $red) And ($iColor2 == $blank) And ($iColor3 == $red) And ($iColor4 == $red)) Then ; 1R-2B-3R-4R
	  ;MsgBox($MB_SYSTEMMODAL, "", " Button 1-3-4 Red. Select Button 3")
	  $currWindow = 1
	  $clickButton = 3
	  Return
   ElseIf ( ($iColor1 == $red) And ($iColor2 == $red) And ($iColor3 == $blank) And ($iColor4 == $red))Then ; 1R-2R-3B-4R
	  ;MsgBox($MB_SYSTEMMODAL, "", " Button 1-2-4 Red. Select Button 4")
	  $currWindow = 1
	  $clickButton = 4
	  Return
   ElseIf ( ($iColor1 == $red) And ($iColor2 == $red) And ($iColor3 == $red) And ($iColor4 == $blank))Then ; 1R-2R-3R-4B
	  ;MsgBox($MB_SYSTEMMODAL, "", " Button 1-2-3 Red. Select Button 1")
	  $currWindow = 1
	  $clickButton = 1
	  Return
   ElseIf ( ($iColor1 == $blank) And ($iColor2 == $blank) And ($iColor3 == $red) And ($iColor4 == $red))Then ; 1B-2B-3R-4R
	  ;MsgBox($MB_SYSTEMMODAL, "", " Button 3-4 Red. Select Button 3")
	  $currWindow = 1
	  $clickButton = 3
	  Return
   ElseIf ( ($iColor1 == $blank) And ($iColor2 == $red) And ($iColor3 == $blank) And ($iColor4 == $red))Then ; 1B-2R-3B-4R
	  ;MsgBox($MB_SYSTEMMODAL, "", " Button 2-4 Red. Select Button 4")
	  $currWindow = 1
	  $clickButton = 4
	  Return
   ElseIf ( ($iColor1 == $blank) And ($iColor2 == $red) And ($iColor3 == $red) And ($iColor4 == $blank))Then ; 1B-2R-3R-4B
	  ;MsgBox($MB_SYSTEMMODAL, "", " Button 2-3 Red. Select Button 2")
	  $currWindow = 1
	  $clickButton = 2
	  Return
   ElseIf ( ($iColor1 == $red) And ($iColor2 == $blank) And ($iColor3 == $blank) And ($iColor4 == $red))Then ; 1R-2B-3B-4R
	  ;MsgBox($MB_SYSTEMMODAL, "", " Button 1-4 Red. Select Button 4")
	  $currWindow = 1
	  $clickButton = 4
	  Return
   ElseIf ( ($iColor1 == $red) And ($iColor2 == $blank) And ($iColor3 == $red) And ($iColor4 == $blank))Then ; 1R-2B-3R-4B
	  ;MsgBox($MB_SYSTEMMODAL, "", " Button 1-3 Red. Select Button 3")
	  $currWindow = 1
	  $clickButton = 3
	  Return
   ElseIf ( ($iColor1 == $red) And ($iColor2 == $red) And ($iColor3 == $blank) And ($iColor4 == $blank))Then ; 1R-2R-3B-4B
	  ;MsgBox($MB_SYSTEMMODAL, "", " Button 1-2 Red. Select Button 1")
	  $currWindow = 1
	  $clickButton = 1
	  Return
   ElseIf ( ($iColor1 == $blank) And ($iColor2 == $blank) And ($iColor3 == $blank) And ($iColor4 == $red))Then ; 1B-2B-3B-4R
	  ;MsgBox($MB_SYSTEMMODAL, "", " Button 4 Red. Select Button 4")
	  $currWindow = 1
	  $clickButton = 4
	  Return
   ElseIf ( ($iColor1 == $blank) And ($iColor2 == $blank) And ($iColor3 == $red) And ($iColor4 == $blank))Then ; 1B-2B-3R-4B
	  ;MsgBox($MB_SYSTEMMODAL, "", " Button 3 Red. Select Button 3")
	  $currWindow = 1
	  $clickButton = 3
	  Return
   ElseIf ( ($iColor1 == $blank) And ($iColor2 == $red) And ($iColor3 == $blank) And ($iColor4 == $blank))Then ; 1B-2R-3B-4B
	  ;MsgBox($MB_SYSTEMMODAL, "", " Button 2 Red. Select Button 2")
	  $currWindow = 1
	  $clickButton = 2
	  Return
   ElseIf ( ($iColor1 == $red) And ($iColor2 == $blank) And ($iColor3 == $blank) And ($iColor4 == $blank))Then ; 1R-2B-3B-4B
	  ;MsgBox($MB_SYSTEMMODAL, "", " Button 1 Red. Select Button 1")
	  $currWindow = 1
	  $clickButton = 1
	  Return
   ElseIf ( ($iColor1 == $blank) And ($iColor2 == $blank) And ($iColor3 == $blank) And ($iColor4 == $blank))Then ; 1B-2B-3B-4B
	  ;MsgBox($MB_SYSTEMMODAL, "", " Button 0 Red. Wait 10s")
	  $currWindow = 1
	  $clickButton = 0
	  Return
   EndIf
EndIf
; Detect OK Window
If (($iTemp1 == $blankOK) And ($iTemp2 == $blankOK) And ($iTemp2 == $blankOK)) Then
   ;MsgBox($MB_SYSTEMMODAL, "", "3 Temp BlankOK. Testing 4 Button click")
   If ( ($iColor1 == $redOK) And ($iColor2 == $redOK) And ($iColor3 == $redOK) And ($iColor4 == $redOK)) Then ; 1R-2R-3R-4R
	  ;MsgBox($MB_SYSTEMMODAL, "", "4 Button Red. Select Button OK")
	  $currWindow = 4
	  $clickButton = 6
	  Return
   ElseIf ( ($iColor1 == $blankOK) And ($iColor2 == $redOK) And ($iColor3 == $redOK) And ($iColor4 == $redOK)) Then ; 1B-2R-3R-4R
	  ;MsgBox($MB_SYSTEMMODAL, "", " Button 2-3-4 Red. Select Button OK")
	  $currWindow = 4
	  $clickButton = 6
	  Return
   ElseIf ( ($iColor1 == $redOK) And ($iColor2 == $blankOK) And ($iColor3 == $redOK) And ($iColor4 == $redOK)) Then ; 1R-2B-3R-4R
	  ;MsgBox($MB_SYSTEMMODAL, "", " Button 1-3-4 Red. Select Button OK")
	  $currWindow = 4
	  $clickButton = 6
	  Return
   ElseIf ( ($iColor1 == $redOK) And ($iColor2 == $redOK) And ($iColor3 == $blankOK) And ($iColor4 == $redOK))Then ; 1R-2R-3B-4R
	  ;MsgBox($MB_SYSTEMMODAL, "", " Button 1-2-4 Red. Select Button OK")
	  $currWindow = 4
	  $clickButton = 6
	  Return
   ElseIf ( ($iColor1 == $redOK) And ($iColor2 == $redOK) And ($iColor3 == $redOK) And ($iColor4 == $blankOK))Then ; 1R-2R-3R-4B
	  ;MsgBox($MB_SYSTEMMODAL, "", " Button 1-2-3 Red. Select Button OK")
	  $currWindow = 4
	  $clickButton = 6
	  Return
   ElseIf ( ($iColor1 == $blankOK) And ($iColor2 == $blankOK) And ($iColor3 == $redOK) And ($iColor4 == $redOK))Then ; 1B-2B-3R-4R
	  ;MsgBox($MB_SYSTEMMODAL, "", " Button 3-4 Red. Select Button OK")
	  $currWindow = 4
	  $clickButton = 6
	  Return
   ElseIf ( ($iColor1 == $blankOK) And ($iColor2 == $redOK) And ($iColor3 == $blankOK) And ($iColor4 == $redOK))Then ; 1B-2R-3B-4R
	  ;MsgBox($MB_SYSTEMMODAL, "", " Button 2-4 Red. Select Button OK")
	  $currWindow = 1
	  $clickButton = 6
	  Return
   ElseIf ( ($iColor1 == $blankOK) And ($iColor2 == $redOK) And ($iColor3 == $redOK) And ($iColor4 == $blankOK))Then ; 1B-2R-3R-4B
	  ;MsgBox($MB_SYSTEMMODAL, "", " Button 2-3 Red. Select Button OK")
	  $currWindow = 4
	  $clickButton = 6
	  Return
   ElseIf ( ($iColor1 == $redOK) And ($iColor2 == $blankOK) And ($iColor3 == $blankOK) And ($iColor4 == $redOK))Then ; 1R-2B-3B-4R
	  ;MsgBox($MB_SYSTEMMODAL, "", " Button 1-4 Red. Select Button OK")
	  $currWindow = 4
	  $clickButton = 6
	  Return
   ElseIf ( ($iColor1 == $redOK) And ($iColor2 == $blankOK) And ($iColor3 == $redOK) And ($iColor4 == $blankOK))Then ; 1R-2B-3R-4B
	  ;MsgBox($MB_SYSTEMMODAL, "", " Button 1-3 Red. Select Button OK")
	  $currWindow = 4
	  $clickButton = 6
	  Return
   ElseIf ( ($iColor1 == $redOK) And ($iColor2 == $redOK) And ($iColor3 == $blankOK) And ($iColor4 == $blankOK))Then ; 1R-2R-3B-4B
	  ;MsgBox($MB_SYSTEMMODAL, "", " Button 1-2 Red. Select Button OK")
	  $currWindow = 4
	  $clickButton = 6
	  Return
   ElseIf ( ($iColor1 == $blankOK) And ($iColor2 == $blankOK) And ($iColor3 == $blankOK) And ($iColor4 == $redOK))Then ; 1B-2B-3B-4R
	  ;MsgBox($MB_SYSTEMMODAL, "", " Button 4 Red. Select Button OK")
	  $currWindow = 4
	  $clickButton = 6
	  Return
   ElseIf ( ($iColor1 == $blankOK) And ($iColor2 == $blankOK) And ($iColor3 == $redOK) And ($iColor4 == $blankOK))Then ; 1B-2B-3R-4B
	  ;MsgBox($MB_SYSTEMMODAL, "", " Button 3 Red. Select Button OK")
	  $currWindow = 4
	  $clickButton = 6
	  Return
   ElseIf ( ($iColor1 == $blankOK) And ($iColor2 == $redOK) And ($iColor3 == $blankOK) And ($iColor4 == $blankOK))Then ; 1B-2R-3B-4B
	  ;MsgBox($MB_SYSTEMMODAL, "", " Button 2 Red. Select Button OK")
	  $currWindow = 4
	  $clickButton = 6
	  Return
   ElseIf ( ($iColor1 == $redOK) And ($iColor2 == $blankOK) And ($iColor3 == $blankOK) And ($iColor4 == $blankOK))Then ; 1R-2B-3B-4B
	  ;MsgBox($MB_SYSTEMMODAL, "", " Button 1 Red. Select Button OK")
	  $currWindow = 4
	  $clickButton = 6
	  Return
   ElseIf ( ($iColor1 == $blankOK) And ($iColor2 == $blankOK) And ($iColor3 == $blankOK) And ($iColor4 == $blankOK))Then ; 1B-2B-3B-4B
	  ;MsgBox($MB_SYSTEMMODAL, "", " Button 0 Red. Wait 10s")
	  $currWindow = 4
	  $clickButton = 6
	  Return
   EndIf
EndIf
; Detect OK Window
If ((($iX1 == $color1X1) And ($iX2 == $color1X2) And ($iX3 == $colorX3) And ($iX4 == $colorX4)) Or (($iX1 == $color2X1) And ($iX2 == $color1X2) And ($iX3 == $colorX3) And ($iX4 == $colorX4)) Or (($iX1 == $color1X1) And ($iX2 == $color2X2) And ($iX3 == $colorX3) And ($iX4 == $colorX4)) Or (($iX1 == $color3X1) And ($iX2 == $color2X2) And ($iX3 == $colorX3) And ($iX4 == $colorX4))) Then
   $currWindow = 3
   $clickButton = 5
   ;MsgBox($MB_SYSTEMMODAL, "", " Adv Finish. Click Button X")
   Return
EndIf
$currWindow = 2
$clickButton = 0
;MsgBox($MB_SYSTEMMODAL, "", " Adv Running. Wait 10s" & @CRLF & "skipTime:" & $skipTime )
;MsgBox($MB_SYSTEMMODAL, "", "$iX1: " & Hex($iX1, 6)& @CRLF & _
;            "$iX2: " & Hex($iX2, 6) & @CRLF & _
;           "$iX3: " & Hex($iX3, 6) & @CRLF & _
;            "$iX4: " & Hex($iX4, 6))
Return
EndFunc