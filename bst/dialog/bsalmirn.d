BEGIN bsalmirn

//---------------------------------------------------------
IF ~Global("bsUseAlmiranScroll","GLOBAL",0)~ THEN BEGIN 0
	SAY @1500
	IF~Global("ar1900bs","GLOBAL",0)~THEN REPLY @1501 GOTO 1
	IF~Global("ar1900bs","GLOBAL",1)~THEN REPLY @1501 GOTO 2
	IF~~THEN REPLY @1502 GOTO 3
END

IF ~~ THEN BEGIN 1
	SAY @1503
	IF~~THEN GOTO 0
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 2
	SAY @1504
	= @1505
	IF~~THEN
	DO~	FadeToColor([50.0],0)
			Wait(2)
			ActionOverride(Player1,LeaveAreaLUA("bs0128","",[405.2107],10))
			ActionOverride(Player2,LeaveAreaLUA("bs0128","",[405.2107],10))
			ActionOverride(Player3,LeaveAreaLUA("bs0128","",[405.2107],10))
			ActionOverride(Player4,LeaveAreaLUA("bs0128","",[405.2107],10))
			ActionOverride(Player5,LeaveAreaLUA("bs0128","",[405.2107],10))
			ActionOverride(Player6,LeaveAreaLUA("bs0128","",[405.2107],10))
			TakePartyItem("bsalmirn")
			FadeFromColor([50.0],0)~
	EXIT
END


//---------------------------------------------------------
IF ~~ THEN BEGIN 3
	SAY @1506
	IF~~THEN EXIT
END
