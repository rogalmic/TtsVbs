'Reads stdin using system's default TTS voice
'Sample cmd: type "textfile.txt" | cscript tts.vbs
'Sample ps: cat "textfile.txt" | cscript tts.vbs
'Sample cmd arguments for non-stdin source, voice 0 and output 0: cscript tts.vbs "textfile.txt" 0 0

Const ForReading = 1, ForWriting = 2, ForAppending = 8
Const TristateUseDefault = -2, TristateTrue = -1, TristateFalse = 0

Dim objIn, objStdOut, objSpVoice, objFs

If WScript.Arguments.Count > 0 And WScript.Arguments(0) <> "" Then
    Set objFs = CreateObject("Scripting.FileSystemObject")
    Set objIn = objFs.GetFile(WScript.Arguments(0)).OpenAsTextStream(ForReading, TristateUseDefault)
Else    
    Set objIn = WScript.StdIn   
End If

Set objStdOut = WScript.StdOut
Set objSpVoice = CreateObject("SAPI.SpVoice")

If WScript.Arguments.Count > 1 Then
    Set objSpVoice.Voice = objSpVoice.GetVoices.Item(CInt(WScript.Arguments(1)))
End If

If WScript.Arguments.Count > 2 Then
    Set objSpVoice.AudioOutput = objSpVoice.GetAudioOutputs.Item(CInt(WScript.Arguments(2)))
End If

Do While Not objIn.AtEndOfStream
    str = objIn.ReadLine
    objStdOut.WriteLine "Reading line " & (objIn.Line - 1) & ": " & str
    
    objSpVoice.Speak str
Loop
