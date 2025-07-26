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
	send "{" TCFBKey " down}"
	Walk(11 * size)
	send "{" TCFBKey " up}{" TCLRKey " down}"
	Walk(1)
	send "{" TCLRKey " up}{" AFCFBKey " down}"
	Walk(11 * size)
	send "{" AFCFBKey " up}{" TCLRKey " down}"
	Walk(1)
	send "{" TCLRKey " up}"
}
;away from center
loop reps {
	send "{" TCFBKey " down}"
	Walk(11 * size)
	send "{" TCFBKey " up}{" AFCLRKey " down}"
	Walk(1)
	send "{" AFCLRKey " up}{" AFCFBKey " down}"
	Walk(11 * size)
	send "{" AFCFBKey " up}{" AFCLRKey " down}"
	Walk(1)
	send "{" AFCLRKey " up}"
}
