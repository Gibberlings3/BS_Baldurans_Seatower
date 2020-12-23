BEGIN BSPIRCPT

IF ~Global("bsTalkedToPirate","GLOBAL",0)~ THEN BEGIN 0
	SAY @3600
	IF~Gender(Player1,MALE)~THEN REPLY @3601 GOTO 1
	IF~Gender(Player1,FEMALE)~THEN REPLY @3602 GOTO 2
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 1
	SAY @3603
	=@3604
	IF~~THEN REPLY @3605 GOTO 3
	IF~~THEN REPLY @3606 GOTO 10
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 2
	SAY @3607
	=@3604
	IF~~THEN REPLY @3605 GOTO 3
	IF~~THEN REPLY @3608 GOTO 4
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 4
	SAY @3609
	IF~~THEN REPLY @3610 GOTO 3
	IF~~THEN REPLY @3611 GOTO 10
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 3
	SAY @3612
	IF~~THEN REPLY @3613 GOTO 11
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 11
	SAY @3614
	IF~NumInParty(1)~THEN REPLY @3615 GOTO 12
	IF~NumInPartyGT(1)~THEN REPLY @3616 GOTO 12
END

//---------------------------------------------------------
IF ~Global("","GLOBAL",0)~ THEN BEGIN 12
	SAY @3617
	IF~~THEN REPLY @3618 GOTO 10
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 10
	SAY @3619
	IF~~THEN
		DO~SetGlobal("bsFightPirates","GLOBAL",1)~
	EXIT
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 20
	SAY @3620
	IF~~THEN
		DO~SetGlobal("bsFightPirates","GLOBAL",1)~
	EXIT
END
