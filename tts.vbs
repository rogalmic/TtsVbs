'Reads stdin using system's default TTS voice
'Sample cmd: type "textfile.txt" | cscript tts.vbs
'Sample ps: cat "textfile.txt" | cscript tts.vbs
'Sample cmd argument: cscript tts.vbs "textfile.txt"

Const ForReading = 1, ForWriting = 2, ForAppending = 8
Const TristateUseDefault = -2, TristateTrue = -1, TristateFalse = 0

Dim objIn, objStdOut, objSpVoice, objFs

If WScript.Arguments.Count > 0 Then
    Set objFs = CreateObject("Scripting.FileSystemObject")
    Set objIn = objFs.GetFile(WScript.Arguments(0)).OpenAsTextStream(ForReading, TristateUseDefault)
Else    
    Set objIn = WScript.StdIn   
End If

Set objStdOut = WScript.StdOut
Set objSpVoice = CreateObject("SAPI.SpVoice")

Do While Not objIn.AtEndOfStream
    str = objIn.ReadLine
    objStdOut.WriteLine "Reading line " & (objIn.Line - 1) & ": " & str
    
    objSpVoice.Speak str, 3 'SPF_DEFAULT, SPF_ASYNC
    objSpVoice.WaitUntilDone(100000)
Loop
