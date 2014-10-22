AutoItSetOption("TrayAutoPause",0);
Global $Paused
Global Const $box_x = 0, $box_y = 0, $box_w = 16, $box_h = 16, $box_count = 1
;Global $PreAction=0, $ActionCount=0

;HotKeySet("\", "TogglePause")
;HotKeySet(",", "Terminate")

While 1
	;WinWaitActive("Untitled - Notepad")
	NAExecute();
	sleep(200);
WEnd

Func TogglePause()
    $Paused = NOT $Paused
	Send('^!`')
    While $Paused
        sleep(1000)
    WEnd
EndFunc

Func Terminate()
    Exit 0
EndFunc

Func GetShowBoxValue()
	Dim $box_value[$box_count]
	For $i = 0 to $box_count-1 Step 1
		$x = $box_x + $box_w*$i + $box_w/2
		$y = $box_y + $box_h/2

		$box_value[$i] = NAParseColor2Value(PixelGetColor( $x , $y ))
	Next
	Return $box_value
EndFunc

Func NAParseColor2Value($color)
	$c = Hex($color, 6)
	$v = Number(StringMid($c, 1, 1) & StringMid($c, 3, 1) & StringMid($c, 5, 1))
	NAdebug($c & "-------------" & $v)
	return $v
EndFunc

Func NAdebug($text)
	ConsoleWrite($text & @CRLF)
EndFunc

Func NAExecute()
	$value = GetShowBoxValue()
;	Send("{ENTER}" & $value[0] & "{ENTER}")
;	If $value[0]==0 then 
;		Return
;	endif
;
;	If $PreAction == $value[0] and $ActionCount<3 Then
;		$ActionCount = $ActionCount +1;
;		Return;
;	Else
;		$PreAction = $value[0];
;		$ActionCount = 0;
;	EndIf

	NAdebug($value[0])
	Switch $value[0]
	Case 1 To 9
		Send("^" & $value[0]);
	Case 10
		Send("^0");
	Case 11
		Send("^-");
	Case 12
		Send("^=");
	Case 13 To 21
		Send("^!" & ($value[0]-12));ctrl+1
	Case 22
		Send("^!0");
	Case 23
		Send("^!-");
	Case 24
		Send("^!=");
	Case 25 To 33
		Send("+" & ($value[0]-24));ctrl+1
	Case 33
		Send("+0");
	Case 34
		Send("+-");
	Case 35
		Send("+=");
	Case 100	;NA_PetAttack() 
		Send("+T");
	Case 900
		Send("=");
	Case Else
	EndSwitch
EndFunc


