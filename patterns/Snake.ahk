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
	send "{" TCLRKey " down}"
	Walk(11 * size)
	send "{" TCLRKey " up}{" TCFBKey " down}"
	Walk(1)
	send "{" TCFBKey " up}{" AFCLRKey " down}"
	Walk(11 * size)
	send "{" AFCLRKey " up}{" TCFBKey " down}"
	Walk(1)
	send "{" TCFBKey " up}"
}
;away from center
loop reps {
	send "{" TCLRKey " down}"
	Walk(11 * size)
	send "{" TCLRKey " up}{" AFCFBKey " down}"
	Walk(1)
	send "{" AFCFBKey " up}{" AFCLRKey " down}"
	Walk(11 * size)
	send "{" AFCLRKey " up}{" AFCFBKey " down}"
	Walk(1)
	send "{" AFCFBKey " up}"
}
