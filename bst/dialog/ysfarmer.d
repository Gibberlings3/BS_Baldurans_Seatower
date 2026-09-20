BEGIN ysfarmer

IF ~Global("ysTalkedToFarmer","GLOBAL",1)~ THEN BEGIN 10
	SAY @1370
	+ ~Global("C#Q11_CowQuest","GLOBAL",2) Global("bsAskedBg1RECow","LOCALS",0)~ + @1399 DO ~SetGlobal("bsAskedBg1RECow","LOCALS",1)~ + crossmod_bg1re
	IF~~THEN REPLY @1371 EXIT
	++ @1397 EXIT
END

IF ~Global("ysTalkedToFarmer","GLOBAL",0)~ THEN BEGIN 0
	SAY @1372
	+ ~Global("C#Q11_CowQuest","GLOBAL",2) Global("bsAskedBg1RECow","LOCALS",0)~ + @1399 DO ~SetGlobal("bsAskedBg1RECow","LOCALS",1)~ + crossmod_bg1re
	IF~~THEN REPLY @1373 GOTO 2
	++ @1397 EXIT
END

IF ~~ THEN BEGIN crossmod_bg1re
	SAY @1374
	IF~~THEN REPLY @1373 GOTO 2
	++ @1397 EXIT
END
/* deprecated. I'll leave it in not to scramble the state numbering. */
IF ~~ THEN BEGIN crossmod_bg1re_01
	SAY @1374
	IF~~THEN EXIT
END

IF~~ THEN BEGIN 22
  SAY@1381
	IF~~THEN REPLY @1382 GOTO 2
	++ @1397 EXIT
END

IF~~ THEN BEGIN 2
  SAY@1383 /* ~Oh, partly tradition and partly convenience. I can provide fresh eggs and milk every day and fresh meat if given a day's notice.~*/
	IF~~THEN REPLY @1384 /* ~That cow looks a bit skinny to me.~*/ GOTO 3
	IF~~THEN REPLY @1385 /* ~You don't mean you slaughter the poor cow!~ */ GOTO 3
	++ @1397 EXIT
END

IF ~~ THEN BEGIN 3
	SAY @1386 /* ~Oh no, no! Where would I get fresh milk from then? No, I buy it in the city.~ */
	IF~~THEN REPLY @1387 /* ~The meat in the city isn't that fresh. You can smell it three streets downwind.~ */ GOTO 5
	IF~~THEN REPLY @1398 /* ~I wouldn't buy it from the butchers in the city either. No, I send my son to order a fresh carcass from one of the farmers outside the city. The meat is delivered to a warehouse in the city and I pick it up from there on the same day.~*/ GOTO 5
	++ @1397 EXIT
END

IF ~~ THEN BEGIN 5
	SAY @1388
	IF~~THEN REPLY @1389 GOTO 6
	++ @1397 EXIT
END

IF ~~ THEN BEGIN 6
	SAY @1390
	IF~OR(3) !TimeOfDay(DAY) GlobalGT("bsCowPoop","MYAREA",0) !AreaCheck("BS1000")~THEN EXIT
	IF~TimeOfDay(DAY) Global("bsCowPoop","MYAREA",0) AreaCheck("BS1000")~THEN DO ~SetGlobal("bsCowPoop","MYAREA",1)~ GOTO 7
END

IF ~~ THEN BEGIN 7
	SAY @1392
	IF~InParty("Edwin") InMyArea("Edwin") !StateCheck("Edwin",CD_STATE_NOTVALID)~THEN EXTERN %EDWIN_JOINED% COW
	IF~OR(3) !InParty("Edwin") !InMyArea("Edwin") StateCheck("Edwin",CD_STATE_NOTVALID)~THEN
	DO~SetGlobal("ysTalkedToFarmer","GLOBAL",1)~
	REPLY @1393 EXIT
	IF~OR(3) !InParty("Edwin") !InMyArea("Edwin") StateCheck("Edwin",CD_STATE_NOTVALID)~THEN
	DO~SetGlobal("ysTalkedToFarmer","GLOBAL",1)~
	REPLY @1397 EXIT
END

IF ~~ THEN BEGIN 8
	SAY @1394
	IF~~THEN
	DO~SetGlobal("ysTalkedToFarmer","GLOBAL",1)~
	REPLY @1395 EXIT
	++ @1397 DO~SetGlobal("ysTalkedToFarmer","GLOBAL",1)~ EXIT
END


//-------------------------------------------------------------------
CHAIN %EDWIN_JOINED% COW
  @1396
EXTERN ysfarmer 8
