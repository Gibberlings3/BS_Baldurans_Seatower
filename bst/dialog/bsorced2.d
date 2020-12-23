// creator  : weidu (version 23700)
// argument : SORCED.DLG
// game     : .
// source   : ./DATA/DIALOG.BIF
// dialog   : .\lang\en_us/dialog.tlk
// dialogF  : (none)

BEGIN ~BSORCED2~

IF ~Global("bsDream","GLOBAL",0)~ THEN BEGIN 2 // from:
  SAY @9276 /* ~Thank you, I am renewed. You have resisted great temptation for a strangers benefit. A rare act of compassion for one destined so.~ */
  IF ~~ THEN
  	DO~TakePartyItem("bscandld")~
	EXTERN ~BSVOICE~ 13
END
