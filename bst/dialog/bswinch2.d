BEGIN bswinch2

IF ~Global("bsWinch2","GLOBAL",0)~ THEN BEGIN 0
	SAY @2400
	IF~~THEN REPLY @2401 GOTO 1
END

IF ~~ THEN BEGIN 1
	SAY @2402
	IF~~THEN
		DO~SetGlobal("bsWinch2","GLOBAL",1)~
	EXIT
END

IF ~Global("bsWinch2","GLOBAL",1)~ THEN BEGIN 2
	SAY @2403
	IF~~THEN EXIT
END
