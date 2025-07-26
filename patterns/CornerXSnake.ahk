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
Walk(4 * size)
send "{" TCLRKey " up}{" TCFBKey " down}"
Walk(2 * size)
send "{" TCFBKey " up}{" AFCLRKey " down}"
Walk(8 * size)
send "{" AFCLRKey " up}{" TCFBKey " down}"
Walk(2 * size)
send "{" TCFBKey " up}{" TCLRKey " down}"
Walk(8 * size)
send "{" TCLRKey " up}{" AFCLRKey " down}{" AFCFBKey " down}"
Walk( Sqrt( ( ( 8 * size ) ** 2 ) + ( ( 8 * size ) ** 2 ) ) )
send "{" AFCLRKey " up}{" AFCFBKey " up}{" TCLRKey " down}"
Walk(8 * size)
send "{" TCLRKey " up}{" TCFBKey " down}"
Walk(2 * size)
send "{" TCFBKey " up}{" AFCLRKey " down}"
Walk(8 * size)
send "{" AFCLRKey " up}{" TCFBKey " down}"
Walk(6.7 * size + 10)
send "{" TCFBKey " up}{" AFCLRKey " down}"
Walk(6 + reps)
send "{" TCFBKey " down}"
Walk(3)
send "{" AFCLRKey " up}{" TCFBKey " up}{" TCLRKey " down}"
Walk(2 + reps)
send "{" TCLRKey " up}{" AFCFBKey " down}"
Walk(5)
send "{" AFCFBKey " up}{" TCLRKey " down}"
Walk(8 * size)
send "{" TCLRKey " up}{" AFCFBKey " down}"
Walk(2 * size)		
send "{" AFCFBKey " up}{" AFCLRKey " down}"
Walk(8 * size)
send "{" AFCLRKey " up}{" AFCFBKey " down}"
Walk(2 * size)		
send "{" AFCFBKey " up}{" TCLRKey " down}"
Walk(8 * size)
send "{" TCLRKey " up}{" AFCFBKey " down}"
Walk(2 * size)		
send "{" AFCFBKey " up}{" AFCLRKey " down}"
Walk(8 * size)
send "{" AFCLRKey " up}{" AFCFBKey " down}"
Walk(3 * size)		
send "{" AFCFBKey " up}{" TCLRKey " down}}"
Walk(8 * size)
send "{" TCLRKey " up}{" TCFBKey " down}{" AFCLRKey " down}"
Walk( Sqrt( ( ( 4 * size ) ** 2 ) + ( ( 4 * size ) ** 2 ) ) )
send "{" TCFBKey " up}{" AFCLRKey " up}"
