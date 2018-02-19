'Reads stdin using system's default TTS voice
'Sample cmd: type "textfile.txt" | cscript tts.vbs
'Sample ps: cat "textfile.txt" | cscript tts.vbs

Dim objStdIn, objStdOut, objSpVoice
Set objStdIn = WScript.StdIn
Set objStdOut = WScript.StdOut
Set objSpVoice = CreateObject("SAPI.SpVoice")

Do While Not objStdIn.AtEndOfStream
     str = objStdIn.ReadLine
     objStdOut.WriteLine "Reading line" & (objStdIn.Line - 1) & ": " & str
	 objSpVoice.Speak str, 3 'SPF_DEFAULT, SPF_ASYNC
	 objSpVoice.WaitUntilDone(100000)
Loop
