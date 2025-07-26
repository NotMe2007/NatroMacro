; --- Imports and variable setup for Auryn Gathering Path ---
#Include ..\lib\Walk.ahk
#Include ..\lib\HyperSleep.ahk

; Key assignments (ensure these match your macro's config)
TCFBKey := "w"
TCLRKey := "a"
AFCFBKey := "s"
AFCLRKey := "d"

; Default values for size and reps if not set externally
size := IsSet(size) ? size : 1
reps := IsSet(reps) ? reps : 1
;Auryn Gathering Path
AurynDelay:=175
loop reps {
	;infinity
	send "{" TCFBKey " down}"
	Walk(AurynDelay*9/2000*size*A_Index*1.1)
	send "{" TCLRKey " down}"
	Walk(AurynDelay*9/2000*size*A_Index*1.1*1.4)
	send "{" TCFBKey " up}"
	Walk(AurynDelay*9/2000*size*A_Index*1.1)
	send "{" AFCFBKey " down}"
	Walk(AurynDelay*9/2000*size*A_Index*1.1*3*1.4)
	send "{" AFCFBKey " up}"
	Walk(AurynDelay*9/2000*size*A_Index*1.1)
	send "{" TCFBKey " down}"
	Walk(AurynDelay*9/2000*size*A_Index*1.1*1.4)
	send "{" TCLRKey " up}"
	Walk(AurynDelay*9/2000*size*A_Index*1.1)
	send "{" AFCLRKey " down}"
	Walk(AurynDelay*9/2000*size*A_Index*1.1*1.4)
	send "{" TCFBKey " up}"
	Walk(AurynDelay*9/2000*size*A_Index*1.1)
	send "{" AFCFBKey " down}"
	Walk(AurynDelay*9/2000*size*A_Index*1.1*3*1.4)
	send "{" AFCFBKey " up}"
	Walk(AurynDelay*9/2000*size*A_Index*1.1)
	send "{" TCFBKey " down}"
	Walk(AurynDelay*9/2000*size*A_Index*1.1*1.4)
	send "{" AFCLRKey " up}"
	;big circle
	Walk(AurynDelay*9/2000*size*A_Index*1.1*2)
	send "{" TCLRKey " down}"
	Walk(AurynDelay*9/2000*size*A_Index*1.1*2*1.4)
	send "{" TCFBKey " up}"
	Walk(AurynDelay*9/2000*size*A_Index*1.1*2)
	send "{" AFCFBKey " down}"
	Walk(AurynDelay*9/2000*size*A_Index*1.1*2*1.4)
	send "{" TCLRKey " up}"
	Walk(AurynDelay*9/2000*size*A_Index*1.1*2)
	send "{" AFCLRKey " down}"
	Walk(AurynDelay*9/2000*size*A_Index*1.1*2*1.4)
	send "{" AFCFBKey " up}"
	Walk(AurynDelay*9/2000*size*A_Index*1.1*2)
	send "{" TCFBKey " down}"
	Walk(AurynDelay*9/2000*size*A_Index*1.1*2*1.4)
	send "{" AFCLRKey " up}"
	;FLIP!!
	;move to other side (half circle)
	Walk(AurynDelay*9/2000*size*A_Index*1.1*2)
	send "{" TCLRKey " down}"
	Walk(AurynDelay*9/2000*size*A_Index*1.1*2*1.4)
	send "{" TCFBKey " up}"
	Walk(AurynDelay*9/2000*size*A_Index*1.1*2)
	send "{" AFCFBKey " down}"
	Walk(AurynDelay*9/2000*size*A_Index*1.1*2*1.4)
	send "{" TCLRKey " up}"
	send "{" AFCFBKey " up}"
	;pause here
	HyperSleep(50)
	;reverse infinity
	send "{" AFCFBKey " down}"
	Walk(AurynDelay*9/2000*size*A_Index*1.1)
	send "{" AFCLRKey " down}"
	Walk(AurynDelay*9/2000*size*A_Index*1.1*1.4)
	send "{" AFCFBKey " up}"
	Walk(AurynDelay*9/2000*size*A_Index*1.1)
	send "{" TCFBKey " down}"
	Walk(AurynDelay*9/2000*size*A_Index*1.1*3*1.4)
	send "{" TCFBKey " up}"
	Walk(AurynDelay*9/2000*size*A_Index*1.1)
	send "{" AFCFBKey " down}"
	Walk(AurynDelay*9/2000*size*A_Index*1.1*1.4)
	send "{" AFCLRKey " up}"
	Walk(AurynDelay*9/2000*size*A_Index*1.1)
	send "{" TCLRKey " down}"
	Walk(AurynDelay*9/2000*size*A_Index*1.1*1.4)
	send "{" AFCFBKey " up}"
	Walk(AurynDelay*9/2000*size*A_Index*1.1)
	send "{" TCFBKey " down}"
	Walk(AurynDelay*9/2000*size*A_Index*1.1*1.4)
	send "{" TCFBKey " up}"
	Walk(AurynDelay*9/2000*size*A_Index*1.1)
	send "{" AFCFBKey " down}"
	Walk(AurynDelay*9/2000*size*A_Index*1.1*1.4)
	send "{" TCLRKey " up}"
	;big circle
	Walk(AurynDelay*9/2000*size*A_Index*1.1*2)
	send "{" AFCLRKey " down}"
	Walk(AurynDelay*9/2000*size*A_Index*1.1*2*1.4)
	send "{" AFCFBKey " up}"
	Walk(AurynDelay*9/2000*size*A_Index*1.1*2)
	send "{" TCFBKey " down}"
	Walk(AurynDelay*9/2000*size*A_Index*1.1*2*1.4)
	send "{" AFCLRKey " up}"
	Walk(AurynDelay*9/2000*size*A_Index*1.1*2)
	send "{" TCLRKey " down}"
	Walk(AurynDelay*9/2000*size*A_Index*1.1*2*1.4)
	send "{" TCFBKey " up}"
	Walk(AurynDelay*9/2000*size*A_Index*1.1*2)
	send "{" AFCFBKey " down}"
	Walk(AurynDelay*9/2000*size*A_Index*1.1*2*1.4)
	send "{" TCLRKey " up}"
	;FLIP!!
	;move to other side (half circle)
	Walk(AurynDelay*9/2000*size*A_Index*1.1*2)
	send "{" AFCLRKey " down}"
	Walk(AurynDelay*9/2000*size*A_Index*1.1*2*1.4)
	send "{" AFCFBKey " up}"
	Walk(AurynDelay*9/2000*size*A_Index*1.1*2)
	send "{" TCFBKey " down}"
	Walk(AurynDelay*9/2000*size*A_Index*1.1*2*1.4)
	send "{" AFCLRKey " up}"
	send "{" TCFBKey " up}"
}
