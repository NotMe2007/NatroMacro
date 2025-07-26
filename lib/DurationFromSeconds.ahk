/*****************************************************************************************
* @description: Simple GetDurationFormatEx parser
* https://learn.microsoft.com/en-us/windows/win32/api/winnls/nf-winnls-getdurationformatex
* @author SP
*****************************************************************************************/

/*****************************************************************************************
* @description: Formats a duration in seconds into a human-readable string using Windows API.
* @param secs: The duration in seconds (integer or float).
* @param format: The format string for the duration (default: "hh:mm:ss").
* @param capacity: The initial buffer size for the formatted string (default: 64).
* @return: A formatted duration string or an error message if the operation fails.
*****************************************************************************************/
DurationFromSeconds(secs, format:="hh:mm:ss", capacity:=64) {
    if (secs < 0) {
        return "Error: Invalid duration. Seconds cannot be negative."
    }
    
    dur := Buffer(capacity)
    result := DllCall("GetDurationFormatEx"
        , "Ptr", 0
        , "UInt", 0
        , "Ptr", 0
        , "Int64", secs*10000000
        , "Str", format
        , "Ptr", dur.Ptr
        , "Int", capacity)
    
    if (!result) {
        return "Error: Failed to format duration."
    }
    
    return StrGet(dur)
}

/*****************************************************************************************
* @description: Simple function to format seconds to h:m:s format for backward compatibility
* @param secs: The duration in seconds (integer or float).
* @return: A formatted duration string in "h:m:s" format.
*****************************************************************************************/
hmsFromSeconds(secs) {
    if (secs < 0) {
        return "0:0:0"
    }
    
    hours := Floor(secs / 3600)
    minutes := Floor((secs - hours * 3600) / 60)
    seconds := Floor(secs - hours * 3600 - minutes * 60)
    
    return hours ":" minutes ":" seconds
}
