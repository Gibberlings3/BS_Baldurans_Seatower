// creator  : weidu (version 23700)
// argument : WARRID.DLG
// game     : .
// source   : ./DATA/DIALOG.BIF
// dialog   : .\lang\en_us/dialog.tlk
// dialogF  : (none)

BEGIN ~BSWARRID~

IF ~Global("bsDream","GLOBAL",0)~ THEN BEGIN 0 // from:
  SAY @9261 /* ~Help! I need your aid! There are too many!~ */
  IF ~~ THEN EXTERN ~BSVOICE~ 0
END

IF ~~ THEN BEGIN 1 // from:
  SAY @9262 /* ~I am so cold... (moan)... I... am dying... Please... stay with me awhile...~ */
  IF ~~ THEN EXTERN ~BSVOICE~ 2
END

IF ~~ THEN BEGIN 2 // from:
  SAY @9263 /* ~I don't want to die alone...~ */
  IF ~~ THEN
  	DO~GiveItem("bsclawd",Protagonist)
		ActionOverride(Myself,Kill(Myself))~
	EXTERN ~BSVOICE~ 4
END

IF ~~ THEN BEGIN 3 // from:
  SAY @9264 /* ~Thank you...~ */
  IF ~~ THEN EXTERN ~BSVOICE~ 3
END
