// creator  : weidu (version 23700)
// argument : SORCED.DLG
// game     : .
// source   : ./override/SORCED.DLG
// dialog   : .\lang\en_us/dialog.tlk
// dialogF  : (none)

BEGIN ~BSSORCED~

IF ~Global("bsDream","GLOBAL",0)~ THEN BEGIN 0 // from:
  SAY @9274 /* ~Young one! Please stop a while. I need your help. I am old and dying... and I've one hope left to me. In my room... there is an enchanted candle. It has one last wish spell within it. I am too weak to retrieve it, but you could.~ */
  IF ~~ THEN EXTERN ~BSVOICE~ 9
END

IF ~~ THEN BEGIN 1 // from:
  SAY @9275 /* ~This candle is my last chance, child. Please... bring it to me.~ */
  IF ~~ THEN
		DO~SetGlobal("bs0156Door","GLOBAL",1)~
	EXTERN ~BSVOICE~ 10
END
