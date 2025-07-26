
; Inline sqrt function for this pattern
sqrt(x) {
	return x ** 0.5
}

FwdKey := IsSet(FwdKey) ? FwdKey : "w"
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
CForkGap:=0.75 ;flowers between lines
CForkDiagonal := CForkGap*sqrt(2)
CForkLength := (40-CForkGap*16-CForkDiagonal*4)/6
if(facingcorner) {
	send "{" FwdKey " down}"
	Walk(1.5, 10)
	send "{" FwdKey " up}"
}
send "{" TCLRKey " down}{" AFCFBKey " down}"
Walk(CForkDiagonal*2)
send "{" AFCFBKey " up}"
Walk(((reps-1)*4+2)*CForkGap)
send "{" TCFBKey " down}"
Walk(CForkDiagonal*2)
send "{" TCLRKey " up}"
loop reps {
	Walk(CForkLength * size, 99)
	send "{" TCFBKey " up}{" AFCLRKey " down}"
	Walk(CForkGap*2)
	send "{" AFCLRKey " up}{" AFCFBKey " down}"
	Walk(CForkLength * size, 99)
	send "{" AFCFBKey " up}{" AFCLRKey " down}"
	Walk(CForkGap*2)
	send "{" AFCLRKey " up}{" TCFBKey " down}"
}
Walk(CForkLength * size, 99)
send "{" TCFBKey " up}{" AFCLRKey " down}"
Walk(CForkGap*2)
send "{" AFCLRKey " up}{" AFCFBKey " down}"
Walk(CForkLength * size, 99)
send "{" AFCFBKey " up}"
