Gui, Add, Text, x22 y20 w60 h20 , &Filename:
Gui, Add, Edit, r1 vFilename x82 y20 w300 h20 , Filename and Location
Gui, Add, Button, gSHOW_FILE_DIALOG x392 y20 w30 h20 , ...
Gui, Add, GroupBox, x22 y50 w400 h240 , Status
Gui, Add, Edit, v_Log x32 y70 w380 h210 , 
Gui, Add, Button, gBACKUP_ROUTINE Default x130 y295 w190 h50 , &Backup Session

Gui, Show, ,Foxit Session Backup
return

Log = ""

BACKUP_ROUTINE:
Log = %Log%Starting Registry Editor`nExporting the Keys....`n
Run %comspec% /c "reg export "HKCU\Software\Foxit Software\Foxit Reader 5.0\Preferences\History\LastSession" "%_Filename%"", ,UseErrorLevel
;Run *RunAs %comspec% /c "reg export "HKCU\Software\Foxit Software\Foxit Reader 5.0\Preferences\History\LastSession" "%_Filename%"", ,UseErrorLevel
if ErrorLevel=0
  Log = %Log%Outcome : Success (Exit Code: 0)`n`n
else 
	Log = %Log%Outcome : %ErrorLevel%`n`n
GuiControl, , _Log, %Log%
Run %Filename_dir%	;Open the destination folder

Return
