#include <MsgBoxConstants.au3>
#include <AutoItConstants.au3>
#include <WinAPI.au3>
#include <GDIPlus.au3>
#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------
Const $WM_MOUSEMOVE= 0x200
Const $WM_LBUTTONDOWN   = 0x201
Const $WM_LBUTTONUP    = 0x202
Const $WM_MBUTTONDOWN  = 0x207
Const $WM_MBUTTONUP    = 0x208
Const $WM_RBUTTONDOWN  = 0x204
Const $WM_RBUTTONUP    = 0x205
Const $WM_NCLBUTTONDOWN  = 0xA1
Const $WM_LBUTTONDBLCLK  = 0x203
Const $WM_MBUTTONDBLCLK  = 0x209
Const $WM_RBUTTONDBLCLK  = 0x206
Const $MK_LBUTTON = 0x1
Const $MK_MBUTTON = 0x10
Const $MK_RBUTTON = 0x2
; Script Start - Add your code below here
Local $hWnd
Local $aPos_hWnd
Local $nOne_Pos[2] = [555,325]
Local $nOnT_Pos[2] = [575,325]
Local $nTwo_Pos[2] = [587,325]
Local $nTnT_Pos[2] = [610,325]
Local $nThree_Pos[2] = [621,325]
Local $nTnF_Pos[2] = [643,325]
Local $nFour_Pos[2] = [654,325]
Local $xFinish1[2] = [651, 55]
Local $xFinish2[2] = [657, 55]
Local $xFinish3[2] = [333, 31]
Local $xFinish4[2] = [680, 33]
Local $btnOK[2] = [493, 400]
Local $btnMedia[2] = [333, 500]
Local $btnBack = [702, 598]
Local $xMenu1 = [13, 58] ; 0x2F313E
Local $xMenu2 = [21, 76] ; 0x3B3D49
Local $xMenu3 = [36, 100] ; 0x2F313E
Local $xMenu4 = [364, 68] ; 0xFFFFFF
Local $xMenu5 = [349, 67] ; 0x2F313E
Local $currWindow = 0
Local $skipTime = 0
Local $btnXTime = 0
Local $clickButton = 0; 1 : click Button 1
; 2 : click Button 2
; 3 : click Button 3
; 4 : click Button 4
; 5 : click Button X
; 6 : click Button OK
; 7 : click Button Menu
; 0 : no click
Local $currState = 0
; 0 : New - just open app
; 1: State Adv running
; 2: State Adv Finish
Local $run = 1

HotKeySet("{Esc}", "stopEsc")
HotKeySet("+!d", "rerunClick") ; Shift-Alt-d

;GetHandleByClass("Qt5QWindowIcon")
;$hWnd = 0x00020458
$hWnd = WinGetHandle("Nox1")
$aPos_hWnd = WinGetPos($hWnd)
;------------------------------------
Local $hwnd2,$hien=True,$chay=False,$button,$x,$y
Local $Struct = DllStructCreate($tagPoint)
DllStructSetData($Struct, "x", 333 + $aPos_hWnd[0] - 301)
DllStructSetData($Struct, "y", 500 + $aPos_hWnd[1])
$hwnd2 = _WinAPI_WindowFromPoint($Struct)
;ToolTip($hwnd2)
;_WinAPI_ScreenToClient($hwnd,$Struct)
;$pos1 = WinGetPos($hWnd)
;$pos2 = WinGetPos($hwnd2)
;pclick($btnMedia[0] + $aPos_hWnd[0] - 301, $btnMedia[1] + $aPos_hWnd[1], 'Left Click')
;------------------------------------
; Display the handle of the NoxPlayer window.
;MsgBox($MB_SYSTEMMODAL, "","$hWnd:" & $hWnd & @CRLF & _
;	  "Pos: " & $pos1[0] & " " & $pos1[1] & @CRLF & _
;	  "$hwnd2:" & $hwnd2 & @CRLF & _
;	  "Pos: " & $pos2[0] & " " & $pos2[1])

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
Local $color2X3 = 0x2F313E
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

Local $iMenu1 = PixelGetColor($xMenu1[0] + $aPos_hWnd[0], $xMenu1[1] + $aPos_hWnd[1], $hWnd)
Local $iMenu2 = PixelGetColor($xMenu2[0] + $aPos_hWnd[0], $xMenu2[1] + $aPos_hWnd[1], $hWnd)
Local $iMenu3 = PixelGetColor($xMenu3[0] + $aPos_hWnd[0], $xMenu3[1] + $aPos_hWnd[1], $hWnd)
Local $iMenu4 = PixelGetColor($xMenu4[0] + $aPos_hWnd[0], $xMenu4[1] + $aPos_hWnd[1], $hWnd)
Local $iMenu5 = PixelGetColor($xMenu5[0] + $aPos_hWnd[0], $xMenu5[1] + $aPos_hWnd[1], $hWnd)
;MsgBox($MB_SYSTEMMODAL, "", "The hex color is: " & Hex($iColor, 6))

;Local $hWnd_Pos = WinGetPos($hWnd);
DetectCurrWindow()
; Display the array values returned by WinGetPos.
    MsgBox($MB_SYSTEMMODAL, "", "$iColor1: " & Hex($iColor1, 6)& @CRLF & _
            "$iColor2: " & Hex($iColor2, 6) & @CRLF & _
            "$iColor3: " & Hex($iColor3, 6) & @CRLF & _
			"$iColor4: " & Hex($iColor4, 6) & @CRLF & _
			"$iTemp1: " & Hex($iTemp1, 6) & @CRLF & _
			"$iTemp2: " & Hex($iTemp2, 6) & @CRLF & _
			"$iTemp3: " & Hex($iTemp3, 6) & @CRLF & _
			"$iX1: " & Hex($iX1, 6) & @CRLF & _
			"$iX2: " & Hex($iX2, 6) & @CRLF & _
			"$iX3: " & Hex($iX3, 6) & @CRLF & _
			"$iX4: " & Hex($iX4, 6) & @CRLF & _
			"$iMenu1: " & Hex($iMenu1, 6) & @CRLF & _
			"$iMenu2: " & Hex($iMenu2, 6) & @CRLF & _
			"$iMenu3: " & Hex($iMenu3, 6) & @CRLF & _
			"$iMenu4: " & Hex($iMenu4, 6) & @CRLF & _
            "$iMenu5: " & Hex($iMenu5, 6))
If (($iColor1 == $blank) And ($iColor2 == $red)) Then
   ;MsgBox($MB_SYSTEMMODAL, "", "Ngon")
EndIf

;DetectCurrWindow()
While 1
   While ($run == 1)
	  Sleep(2000)
	  ;Local $posMouse = MouseGetPos()
	  Action()
	  ;MouseMove($posMouse[0], $posMouse[1], 0)
	  Sleep(4377)
   WEnd
WEnd

Func stopEsc()
    ; ... can do stuff here
    $run = 0
 EndFunc

 Func rerunClick()
    ; ... can do stuff here
    $run = 1
EndFunc

Func GetHandleByClass($className)
   $input = "[CLASS:" & $className & "]"
   $hWnd = WinGetHandle($input)

   If @error Then
        ;MsgBox($MB_SYSTEMMODAL, "", "An error occurred when trying to retrieve the window handle of NoxPlayer.")
        Exit
	 EndIf
EndFunc

Func Action()

	  DetectCurrWindow()
	  If ($currWindow == 2) Then ; Loading OK Window
		 $skipTime += 1;
		 ;MsgBox($MB_SYSTEMMODAL, "", "$skipTime: " & $skipTime)
		 If ($skipTime >= 8) Then
			If (Mod($btnXTime, 2) = 0) Then
			;Hard click button X
			;MouseClick($MOUSE_CLICK_LEFT, $xFinish2[0] + $aPos_hWnd[0] - 301, $xFinish2[1] + $aPos_hWnd[1], 1, 0)
			;------------------------------------------------
			   If (($iX1 == 0) And _
				  ($iX2 == 0) And _
				  ($iX3 == 0) And _
				  ($iX4 == 0)) Then
					 ;MsgBox($MB_SYSTEMMODAL, "", "Click back")
					 getwin($btnBack[0] + $aPos_hWnd[0] - 301, $btnBack[1] + $aPos_hWnd[1])
			   Else
					 ;MsgBox($MB_SYSTEMMODAL, "", "Click X")
					 getwin($xFinish2[0] + $aPos_hWnd[0] - 301, $xFinish2[1] + $aPos_hWnd[1])
			   EndIf
			;--------------------------------------------------
			pclick($x, $y, 'Left Click')
			$currState = 2; 2: State Adv Finish
			$skipTime = 5
			$btnXTime = $btnXTime + 1
			Else
			   If (($iX1 == 0) And _
				  ($iX2 == 0) And _
				  ($iX3 == 0) And _
				  ($iX4 == 0)) Then
					 ;MsgBox($MB_SYSTEMMODAL, "", "Click X")
					 getwin($xFinish2[0] + $aPos_hWnd[0] - 301, $xFinish2[1] + $aPos_hWnd[1])
			   Else
					 ;MsgBox($MB_SYSTEMMODAL, "", "Click back")
					 getwin($btnBack[0] + $aPos_hWnd[0] - 301, $btnBack[1] + $aPos_hWnd[1])
			   EndIf
			pclick($x, $y, 'Left Click')
			$currState = 2; 2: State Adv Finish
			$skipTime = 5
			$btnXTime = $btnXTime + 1
			EndIf
		 EndIf
	  ElseIf ($currWindow == 4) Then
		 ;MsgBox($MB_SYSTEMMODAL, "", "Man hinh OK")
		 ;Hard click button OK
		 ;MouseClick($MOUSE_CLICK_LEFT, $btnOK[0] + $aPos_hWnd[0] - 301, $btnOK[1] + $aPos_hWnd[1], 1, 0)
		 getwin($btnOK[0] + $aPos_hWnd[0] - 301, $btnOK[1] + $aPos_hWnd[1])
		 pclick($x, $y, 'Left Click')
		 ;MouseMove($posMouse[0], $posMouse[1], 0)
		 $currState = 0; 2: State Adv Finish
		 $skipTime = 0
		 $btnXTime = 0
		 $clickButton = 0
	  ElseIf ($currWindow == 5) Then
		 ;MsgBox($MB_SYSTEMMODAL, "", "Man hinh Menu")
		 ;Hard click button BACK
		 getwin($xMenu2[0] + $aPos_hWnd[0], $xMenu2[1] + $aPos_hWnd[1])
		 pclick($x, $y, 'Left Click')
		 ;MouseMove($posMouse[0], $posMouse[1], 0)
		 $currState = 0; 2: State Adv Finish
		 $skipTime = 0
		 $btnXTime = 0
		 $clickButton = 0
	  ElseIf ($currWindow == 3) Then
		 ;MsgBox($MB_SYSTEMMODAL, "", "Man hinh het quang cao")
		 ;Hard click button X
		 ;MouseClick($MOUSE_CLICK_LEFT, $xFinish2[0] + $aPos_hWnd[0] - 301, $xFinish2[1] + $aPos_hWnd[1], 1, 0)
		 getwin($xFinish2[0] + $aPos_hWnd[0] - 301, $xFinish2[1] + $aPos_hWnd[1])
		 pclick($x, $y, 'Left Click')
		 $skipTime = 0
		 $btnXTime = 0
	  ElseIf ($currWindow == 1) Then
		 ;MsgBox($MB_SYSTEMMODAL, "", "Man hinh bat dau")
		 ;MouseClick($MOUSE_CLICK_LEFT, $btnMedia[0] + $aPos_hWnd[0] - 301, $btnMedia[1] + $aPos_hWnd[1], 1, 0)
		 ;Sleep(200)
		 If (PixelGetColor($btnMedia[0] + $aPos_hWnd[0] - 301, $btnMedia[1] + $aPos_hWnd[1], $hWnd) == $red) Then
			;MsgBox($MB_SYSTEMMODAL, "", "Click button: Media")
			;MouseClick($MOUSE_CLICK_LEFT, $btnMedia[0] + $aPos_hWnd[0] - 301, $btnMedia[1] + $aPos_hWnd[1], 1, 0)
			getwin($btnMedia[0] + $aPos_hWnd[0] - 301, $btnMedia[1] + $aPos_hWnd[1])
			pclick($x, $y, 'Left Click')
		 ElseIf ($clickButton > 0) Then
			;MsgBox($MB_SYSTEMMODAL, "", "Click button: " & $clickButton)
			If ($clickButton == 1) Then
			   ;MouseClick($MOUSE_CLICK_LEFT, $nOne_Pos[0] + $aPos_hWnd[0] - 301, $nOne_Pos[1] + $aPos_hWnd[1], 1, 0)
			   getwin($nOne_Pos[0] + $aPos_hWnd[0] - 301, $nOne_Pos[1] + $aPos_hWnd[1])
			   pclick($x, $y, 'Left Click')
			   ;Opt ("MouseCoordMode", 0)
			   ;ControlClick("[CLASS:Qt5QWindowIcon]","","","left", 1, $nOne_Pos[0], $nOne_Pos[1])
			ElseIf ($clickButton == 2) Then
			   ;MouseClick($MOUSE_CLICK_LEFT, $nTwo_Pos[0] + $aPos_hWnd[0] - 301, $nTwo_Pos[1] + $aPos_hWnd[1], 1, 0)
			   getwin($nTwo_Pos[0] + $aPos_hWnd[0] - 301, $nTwo_Pos[1] + $aPos_hWnd[1])
			   pclick($x, $y, 'Left Click')
			ElseIf ($clickButton == 3) Then
			   ;MouseClick($MOUSE_CLICK_LEFT, $nThree_Pos[0] + $aPos_hWnd[0] - 301, $nThree_Pos[1] + $aPos_hWnd[1], 1, 0)
			   getwin($nThree_Pos[0] + $aPos_hWnd[0] - 301, $nThree_Pos[1] + $aPos_hWnd[1])
			   pclick($x, $y, 'Left Click')
			ElseIf ($clickButton == 4) Then
			   ;MouseClick($MOUSE_CLICK_LEFT, $nFour_Pos[0] + $aPos_hWnd[0] - 301, $nFour_Pos[1] + $aPos_hWnd[1], 1, 0)
			   getwin($nFour_Pos[0] + $aPos_hWnd[0] - 301, $nFour_Pos[1] + $aPos_hWnd[1])
			   pclick($x, $y, 'Left Click')
			EndIf
		 EndIf
		 $currState = 1; 1: State Adv running
		 $clickButton = 0
		 $skipTime = 0
		 ;Return ; Wait 10s and re-run Action
		 $btnXTime = 0
	  EndIf
   EndFunc

; Return 1: Start Window
; Return 2: Adv Running Window
; Return 3: Adv Finish Window
; Return 4: Click OK Window
;
Func DetectCurrWindow()
; Scan screen
_GDIPlus_Startup()
$aPos_hWnd = WinGetPos($hWnd)
Dim $hDC = _WinAPI_GetWindowDC($hWnd)
Dim $hMemDC = _WinAPI_CreateCompatibleDC($hDC)
Dim $hBitmap = _WinAPI_CreateCompatibleBitmap($hDC, $aPos_hWnd[2], $aPos_hWnd[3])
_WinAPI_SelectObject($hMemDC, $hBitmap)
DllCall('user32.dll', 'int', 'PrintWindow', 'hwnd', $hWnd, 'ptr', $hMemDC, 'uint', 0)
Dim $hImage = _GDIPlus_BitmapCreateFromHBITMAP($hBitmap)
;_GDIPlus_ImageSaveToFile($hImage,"\Nox33.jpg")

$iColor1 = _GDIPlus_BitmapGetPixel($hImage, $nOne_Pos[0]  - 301, $nOne_Pos[1] )
$iTemp1 = _GDIPlus_BitmapGetPixel($hImage, $nOnT_Pos[0]  - 301, $nOnT_Pos[1])
$iColor2 = _GDIPlus_BitmapGetPixel($hImage, $nTwo_Pos[0] - 301, $nTwo_Pos[1])
$iTemp2 = _GDIPlus_BitmapGetPixel($hImage, $nTnT_Pos[0]  - 301, $nTnT_Pos[1])
$iColor3 = _GDIPlus_BitmapGetPixel($hImage, $nThree_Pos[0]  - 301, $nThree_Pos[1])
$iTemp3 = _GDIPlus_BitmapGetPixel($hImage, $nTnF_Pos[0]  - 301, $nTnF_Pos[1])
$iColor4 = _GDIPlus_BitmapGetPixel($hImage, $nFour_Pos[0]  - 301, $nFour_Pos[1])
$iX1 = _GDIPlus_BitmapGetPixel($hImage, $xFinish1[0]  - 301, $xFinish1[1])
$iX2 = _GDIPlus_BitmapGetPixel($hImage, $xFinish2[0]  - 301, $xFinish2[1])
$iX3 = _GDIPlus_BitmapGetPixel($hImage, $xFinish3[0]  - 301, $xFinish3[1])
$iX4 = _GDIPlus_BitmapGetPixel($hImage, $xFinish4[0]  - 301, $xFinish4[1])
$iMenu1 = _GDIPlus_BitmapGetPixel($hImage, $xMenu1[0], $xMenu1[1])
$iMenu2 = _GDIPlus_BitmapGetPixel($hImage, $xMenu2[0], $xMenu2[1])
$iMenu3 = _GDIPlus_BitmapGetPixel($hImage, $xMenu3[0], $xMenu3[1])
$iMenu4 = _GDIPlus_BitmapGetPixel($hImage, $xMenu4[0], $xMenu4[1])
$iMenu5 = _GDIPlus_BitmapGetPixel($hImage, $xMenu5[0], $xMenu5[1])

$iColor1 = BitAND(0x00FFFFFF, $iColor1)
$iTemp1 = BitAND(0x00FFFFFF, $iTemp1)
$iColor2 = BitAND(0x00FFFFFF, $iColor2)
$iTemp2 = BitAND(0x00FFFFFF, $iTemp2)
$iColor3 = BitAND(0x00FFFFFF, $iColor3)
$iTemp3 = BitAND(0x00FFFFFF, $iTemp3)
$iColor4 = BitAND(0x00FFFFFF, $iColor4)
$iX1 = BitAND(0x00FFFFFF, $iX1)
$iX2 = BitAND(0x00FFFFFF, $iX2)
$iX3 = BitAND(0x00FFFFFF, $iX3)
$iX4 = BitAND(0x00FFFFFF, $iX4)
$iMenu1 = BitAND(0x00FFFFFF, $iMenu1)
$iMenu2 = BitAND(0x00FFFFFF, $iMenu2)
$iMenu3 = BitAND(0x00FFFFFF, $iMenu3)
$iMenu4 = BitAND(0x00FFFFFF, $iMenu4)
$iMenu5 = BitAND(0x00FFFFFF, $iMenu5)

_WinAPI_DeleteObject($hImage)
_WinAPI_DeleteObject($hBitmap)
_WinAPI_DeleteDC($hMemDC)
;_WinAPI_ReleaseDC($hWnd, $hDC)
; Shut down GDI+ library
_GDIPlus_Shutdown()

; Detect Menu Window
If (($iMenu1 == $color2X3) And ($iMenu2 == 0x3B3D49) And ($iMenu3 == $color2X3) And ($iMenu4 == $blank) And ($iMenu5 == $color2X3)) Then
   $currWindow = 5
   $clickButton = 6
   Return
EndIf

; Detect Notifications Window
If (($iMenu1 == 0xFAFAFA) And ($iMenu2 == 0xFAFAFA) And ($iMenu3 == $blank) And ($iMenu4 == 0xFAFAFA) And ($iMenu5 == 0xFAFAFA)) Then
   $currWindow = 5
   $clickButton = 6
   Return
EndIf

; Detect Start Window
If (($iTemp1 == $blank) And ($iTemp2 == $blank) And ($iTemp2 == $blank) And ($iX2 == $color2X3)) Then
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

Func pclick($x=0,$y=0,$button='Left Click')

$lParam = ($y * 65536) + ($x)
;$lParam = (470 * 65536) + 29

    Switch $button

        Case $button='Left Click'

            _WinAPI_PostMessage($hwnd2, $WM_LBUTTONDOWN, $MK_LBUTTON,$lParam)

            _WinAPI_PostMessage($hwnd2, $WM_LBUTTONUP, 0,$lParam)

        Case $button='Left Double Click'

            _WinAPI_PostMessage($hwnd2, $WM_LBUTTONDOWN, $MK_LBUTTON,$lParam)

            _WinAPI_PostMessage($hwnd2, $WM_LBUTTONUP, 0,$lParam)

            _WinAPI_PostMessage($hwnd2, $WM_LBUTTONDBLCLK, $MK_LBUTTON,$lParam)

            _WinAPI_PostMessage($hwnd2, $WM_LBUTTONUP, 0,$lParam)

        Case $button='Middle Click'

            _WinAPI_PostMessage($hwnd2, $WM_MBUTTONDOWN, $MK_MBUTTON,$lParam)

            _WinAPI_PostMessage($hwnd2, $WM_MBUTTONUP, 0,$lParam)

        Case $button='Middle Double Click'

            _WinAPI_PostMessage($hwnd2, $WM_MBUTTONDOWN, $MK_MBUTTON,$lParam)

            _WinAPI_PostMessage($hwnd2, $WM_MBUTTONUP, 0,$lParam)

            _WinAPI_PostMessage($hwnd2, $WM_MBUTTONDBLCLK, $MK_MBUTTON,$lParam)

            _WinAPI_PostMessage($hwnd2, $WM_MBUTTONUP, 0,$lParam)

        Case $button='Right Click'

            _WinAPI_PostMessage($hwnd2, $WM_RBUTTONDOWN, $MK_RBUTTON,$lParam)

            _WinAPI_PostMessage($hwnd2, $WM_RBUTTONUP, 0,$lParam)

        Case $button='Right Double Click'

            _WinAPI_PostMessage($hwnd2, $WM_RBUTTONDOWN, $MK_RBUTTON,$lParam)

            _WinAPI_PostMessage($hwnd2, $WM_RBUTTONUP, 0,$lParam)

            _WinAPI_PostMessage($hwnd2, $WM_RBUTTONDBLCLK, $MK_RBUTTON,$lParam)

            _WinAPI_PostMessage($hwnd2, $WM_RBUTTONUP, 0,$lParam)

        Case $button='Mouse Move'

            _WinAPI_PostMessage($hwnd2, $WM_MOUSEMOVE, 0,$lParam)

            _WinAPI_PostMessage($hwnd2, $WM_MOUSEMOVE, 0,$lParam)

    EndSwitch
 EndFunc

 Func Pos($posXWin, $posYWin)
    DllStructSetData($Struct, "x", $posXWin)
    DllStructSetData($Struct, "y", $posYWin)
 EndFunc   ;==>Pos

 Func getwin($posXWin, $posYWin)
    Pos($posXWin, $posYWin)
    $hwnd2 = _WinAPI_WindowFromPoint($Struct)
	;MsgBox($MB_SYSTEMMODAL, "", "$Struct: " & $Struct)
	;MsgBox($MB_SYSTEMMODAL, "", "_WinAPI_WindowFromPoint: " & $hwnd2)
    _WinAPI_ScreenToClient($hwnd2,$Struct)
    $x=DllStructGetData($Struct,"x")
	;MsgBox($MB_SYSTEMMODAL, "", "$x: " & $x)
    $y=DllStructGetData($Struct,"y")
	;MsgBox($MB_SYSTEMMODAL, "", "$y: " & $y)
    ;GUICtrlSetData($tdx,$x)
    ;GUICtrlSetData($tdy,$y)
	;MsgBox($MB_SYSTEMMODAL, "", "$tdx: " & $tdx)
	;MsgBox($MB_SYSTEMMODAL, "", "$tdy: " & $tdy)
    ;$cls=_WinAPI_GetClassName($hwnd)
EndFunc