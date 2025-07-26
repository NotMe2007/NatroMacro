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
loop reps {
	send "{" TCFBKey " down}{" TCLRKey " down}"
	Walk(5 * size + A_Index)
	send "{" TCLRKey " up}{" AFCLRKey " down}"
	Walk(5 * size + A_Index)
	send "{" TCFBKey " up}{" AFCFBKey " down}"
	Walk(5 * size + A_Index)
	send "{" AFCLRKey " up}{" TCLRKey " down}"
	Walk(5 * size + A_Index)
	send "{" TCLRKey " up}{" AFCFBKey " up}"
}
