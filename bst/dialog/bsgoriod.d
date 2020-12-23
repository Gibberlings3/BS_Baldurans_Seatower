// creator  : weidu (version 23700)
// argument : GORIOD.DLG
// game     : .
// source   : ./DATA/DIALOG.BIF
// dialog   : .\lang\en_us/dialog.tlk
// dialogF  : (none)
// @9192

BEGIN ~BSGORIOD~

IF ~Global("bsDream","GLOBAL",0)~ THEN BEGIN 0
  SAY @9296
		=@9297
		=@9298
		=@9299
		=@9300
		=@9301
  IF ~~ THEN
  	DO~ActionOverride(Myself,DestroySelf())~
	EXIT
END
