AutoItSetOption("TrayAutoPause",0);

Func NAParseColor2Value($color)
	$c = Hex($color, 6)
	$v = Number(StringMid($c, 1, 1) & StringMid($c, 3, 1) & StringMid($c, 5, 1))
	NAdebug($c & "-------------" & $v)
	return $v
EndFunc

Func NAParseValue2Color($value)
	$v = Hex($value, 3)
	return Number("0x" & StringMid($v, 1,1) & "8" & StringMid($v, 2,1) & "8" & StringMid($v, 3,1) & "8")
EndFunc

Func NAdebug($text)
	ConsoleWrite($text & @CRLF)
EndFunc
 
 
;For $value = 0 to 999 Step 1    
;		$color = NAParseValue2Color($value)
;		$value2 = NAParseColor2Value($color)
;		NAdebug($value &'::'& $color &'-->'& $value2);
;Next
$var = PixelGetColor( 8 , 8 )
MsgBox(0,"The hex color is", Hex($var, 6))

