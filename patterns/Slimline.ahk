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
send "{" TCLRKey " down}"
Walk(( 4 * size ) + ( reps * 0.1 ) - 0.1)
send "{" TCLRKey " up}{" AFCLRKey " down}"
Walk( 8 * size )	
send "{" AFCLRKey " up}{" TCLRKey " down}"
Walk( 4 * size )
send "{" TCLRKey " up}"
