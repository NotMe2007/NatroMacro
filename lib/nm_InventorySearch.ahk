#Include "nm_OpenMenu.ahk"
#Include "Roblox.ahk"
#Include "Gdip_All.ahk"
#Include "Gdip_ImageSearch.ahk"

nm_InventorySearch(item, direction:="down", prescroll:=0, prescrolldir:="", scrolltoend:=1, max:=70) {
    ; Validate parameters
    if (!item) {
        return "Error: Item parameter is required."
    }
    if (direction != "down" && direction != "up") {
        return "Error: Invalid direction. Use 'down' or 'up'."
    }

    global windowX, windowY, windowHeight
    static hRoblox := 0, l := 0, bitmaps := Map()

    nm_OpenMenu("itemmenu")

    ; Detect inventory end for current hwnd
    if !(hwnd := GetRobloxHWND()) {
        return "Error: Roblox window not found."
    }

    if (hwnd != hRoblox) {
        ActivateRoblox()
        offsetY := GetYOffset(hwnd)
        GetRobloxClientPos(hwnd)
        pBMScreen := Gdip_BitmapFromScreen(windowX "|" windowY+offsetY+150 "|306|" windowHeight-offsetY-150)

        Loop 40 {
            if (Gdip_ImageSearch(pBMScreen, bitmaps["item"], &lpos, , , 6, , 2, , 2) = 1) {
                Gdip_DisposeImage(pBMScreen)
                l := SubStr(lpos, InStr(lpos, ",")+1)-60 ; image 20px, item 80px => y+20-80 = y-60
                hRoblox := hwnd
                break
            } else if (A_Index = 40) {
                Gdip_DisposeImage(pBMScreen)
                return "Error: Inventory end not detected."
            } else {
                Sleep 50
                Gdip_DisposeImage(pBMScreen)
                pBMScreen := Gdip_BitmapFromScreen(windowX "|" windowY+offsetY+150 "|306|" windowHeight-offsetY-150)
            }
        }
    }

    offsetY := GetYOffset(hwnd)

    ; Search inventory
    Loop max {
        ActivateRoblox()
        GetRobloxClientPos(hwnd)
        pBMScreen := Gdip_BitmapFromScreen(windowX "|" windowY+offsetY+150 "|306|" l)

        ; Wait for red vignette effect to disappear
        Loop 40 {
            if (Gdip_ImageSearch(pBMScreen, bitmaps["item"], , , , 6, , 2) = 1) {
                break
            } else if (A_Index = 40) {
                Gdip_DisposeImage(pBMScreen)
                return "Error: Red vignette effect did not disappear."
            } else {
                Sleep 50
                Gdip_DisposeImage(pBMScreen)
                pBMScreen := Gdip_BitmapFromScreen(windowX "|" windowY+offsetY+150 "|306|" l)
            }
        }

        if (Gdip_ImageSearch(pBMScreen, bitmaps[item], &pos, , , , , 10, , 5) = 1) {
            Gdip_DisposeImage(pBMScreen)
            break ; Item found
        }
        Gdip_DisposeImage(pBMScreen)

        ; Scroll inventory
        if (A_Index = prescroll+1 && scrolltoend) {
            Loop 100 {
                SendEvent "{Click " windowX+30 " " windowY+offsetY+200 " 0}"
                SendInput "{Wheel" ((direction = "down") ? "Up" : "Down") "}"
                Sleep 50
            }
        } else {
            SendEvent "{Click " windowX+30 " " windowY+offsetY+200 " 0}"
            SendInput "{Wheel" ((A_Index <= prescroll) ? (prescrolldir ? ((prescrolldir = "Down") ? "Down" : "Up") : ((direction = "down") ? "Down" : "Up")) : ((direction = "down") ? "Down" : "Up")) "}"
            Sleep 50
        }
        Sleep 500 ; Wait for scroll to finish
    }

    return (pos ? [30, SubStr(pos, InStr(pos, ",")+1)+190] : "Error: Item not found.") ; Return list of coordinates for dragging or error
}
