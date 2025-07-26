facingcorner := IsSet(facingcorner) ? facingcorner : 0
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
spacingDelay:=274 ;183
send "{" TCLRKey " down}"
Walk(spacingDelay*9/2000*(reps*2+1))
send "{" TCLRKey " up}{" AFCFBKey " down}"
Walk(5 * size)
send "{" AFCFBKey " up}"
loop reps {
	send "{" AFCLRKey " down}"
	Walk(spacingDelay*9/2000)
	send "{" AFCLRKey " up}{" TCFBKey " down}"
	Walk(5 * size)
	send "{" TCFBKey " up}{" AFCLRKey " down}"
	Walk(spacingDelay*9/2000)
	send "{" AFCLRKey " up}{" AFCFBKey " down}"
	Walk((1094+25*facingcorner)*9/2000*size)
	send "{" AFCFBKey " up}"
}
send "{" TCLRKey " down}"
Walk(spacingDelay*9/2000*(reps*2+0.5))
send "{" TCLRKey " up}{" TCFBKey " down}"
Walk(5 * size)
send "{" TCFBKey " up}"
loop reps {
	send "{" AFCLRKey " down}"
	Walk(spacingDelay*9/2000)
	send "{" AFCLRKey " up}{" AFCFBKey " down}"
	Walk((1094+25*facingcorner)*9/2000*size)
	send "{" AFCFBKey " up}{" AFCLRKey " down}"
	Walk(spacingDelay*9/2000*1.5)
	send "{" AFCLRKey " up}{" TCFBKey " down}"
	Walk(5 * size)
	send "{" TCFBKey " up}"
}
