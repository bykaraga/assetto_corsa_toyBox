#Requires AutoHotkey v2.0
SetTimer(ReadSerial, 50)

COMPort := "COM4"
baudRate := 9600

; COM portu aç
COMPort := "COM4"
hCom := DllCall("CreateFile", "Str", "\\\\.\\ " COMPort, "UInt", 0x80000000 | 0x40000000, "UInt", 0, "UInt", 0, "UInt", 3, "UInt", 0, "UInt", 0, "Ptr")


ReadSerial() {
    global hCom
    bufferSize := 64
    localBuffer := Buffer(bufferSize, 0) ; ← buffer yerine localBuffer
    bytesRead := 0

    success := DllCall("ReadFile", "Ptr", hCom, "Ptr", localBuffer.Ptr, "UInt", bufferSize, "UIntP", &bytesRead, "Ptr", 0)
    if success && bytesRead > 0 {
        data := StrGet(localBuffer.Ptr, bytesRead, "UTF-8")
        for line in StrSplit(data, "`n") {
            line := Trim(line)
            if line.StartsWith("TC:") {
                value := SubStr(line, 4)
                if value = "1"
                    Send("{F7}")
            }
            else if line.StartsWith("ABS:") {
                value := SubStr(line, 5)
                if value = "1"
                    Send("{F8}")
            }
            else if line.StartsWith("TURBO:") {
                value := SubStr(line, 7)
                if value >= 50
                    Send("{F9}")
 }
        }
    }
}
