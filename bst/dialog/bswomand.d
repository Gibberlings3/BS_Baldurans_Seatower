// creator  : weidu (version 23700)
// argument : WOMAND.DLG
// game     : .
// source   : ./DATA/DIALOG.BIF
// dialog   : .\lang\en_us/dialog.tlk
// dialogF  : (none)

BEGIN ~BSWOMAND~

IF ~Global("bsDream","GLOBAL",0)~ THEN BEGIN 0 // from:
  SAY @9288 /* ~Greetings, fellow traveler. I have been entrusted to give this skull to they who are most worthy.~ */
  IF ~~ THEN 
   DO~SetGlobal("bsDream151","GLOBAL",4)~
	EXTERN ~BSVOICE~ 24
END

IF ~~ THEN BEGIN 1 // from:
  SAY @9289 /* ~The recipient must be more heroic, charitable, courageous, and HUMBLE than anyone else living or dead. Are you such a person?~ */
  IF ~~ THEN EXTERN ~BSVOICE~ 25
END

IF ~~ THEN BEGIN 2 // from:
  SAY @9290 /* ~Truly you deserve this and whatever else it brings. You've the ego of a deity to believe yourself humble and yet claim to be better than all who have died. It will certainly make the bonding easier... though not for you!~ */
  IF ~~ THEN
	DO~GiveItem("bsskulld",Protagonist)
		SetGlobal("bsDreamComplete","GLOBAL",1)~
	EXTERN ~BSVOICE~ 26
END

IF ~~ THEN BEGIN 3 // from:
  SAY @9291 /* ~The Godhead is rejected! Can there yet be hope? We shall see...~ */
  IF ~~ THEN
  	DO~SetGlobal("bsDreamComplete","GLOBAL",1)~
	EXTERN ~BSVOICE~ 27
END
