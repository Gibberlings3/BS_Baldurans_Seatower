BEGIN ysrsdead

IF ~Global("ysTalkedToRestlessDead","GLOBAL",0)~ THEN BEGIN 0
	SAY @1400
	IF~~THEN REPLY @1401 GOTO 5
	IF~~THEN REPLY @1402 GOTO 1
	IF~~THEN REPLY @1403 GOTO 4
END


//--------------------------------------------------------------
/* PC didn't comply */
IF ~~ THEN BEGIN 1
	SAY @1404
	IF~~THEN REPLY @1401 GOTO 5
	IF~~THEN REPLY @1403 GOTO 4
	IF~~THEN REPLY @1405 GOTO 2
	IF~~THEN REPLY @1446 GOTO 3
END

IF ~~ THEN BEGIN 2
	SAY @1406
	IF~~THEN REPLY @1401 GOTO 5
	IF~~THEN REPLY @1403 GOTO 4
	IF~~THEN REPLY @1407 GOTO 3
	IF~~THEN REPLY @1446 GOTO 3
END


//--------------------------------------------------------------
/* hostile ending, without any specifics */
IF ~~ THEN BEGIN 3
	SAY @1408
	IF~~THEN
	DO~SetGlobal("bsClearedCatacombs","GLOBAL",4)
	SetGlobal("ysTalkedToRestlessDead","GLOBAL",1)
	   ForceSpellRes("BS00001",Myself)
		 SetGlobal("ys0119TombTrigger","Global",0)
     ActionOverride("ysrsdead",DestroySelf())~
	EXIT
END

//--------------------------------------------------------------
/* PC lied about name */
IF ~~ THEN BEGIN 4
	SAY @1409
	IF~~THEN REPLY @1423 GOTO 11
	IF~~THEN REPLY @1424 GOTO 11
END
/*
	IF~CheckStatGT(Protagonist,15,CHR)~THEN REPLY @1410 GOTO 10
	IF~CheckStatGT(Protagonist,15,INT)~THEN REPLY @1411 GOTO 13
	IF~CheckStatLT(Protagonist,16,CHR)~THEN REPLY @1412 GOTO 6
	IF~CheckStatLT(Protagonist,16,INT)~THEN REPLY @1413 GOTO 9
	IF~~THEN REPLY @1446 GOTO 3
END
*/

IF ~~ THEN BEGIN 6
	SAY @1418
	IF~~THEN
	DO~SetGlobal("bsClearedCatacombs","GLOBAL",4)
	SetGlobal("ysTalkedToRestlessDead","GLOBAL",1)
	   ForceSpellRes("BS00001",Myself)
		 SetGlobal("ys0119TombTrigger","Global",0)
     ActionOverride("ysrsdead",DestroySelf())~
	EXIT
END

IF ~~ THEN BEGIN 10
	SAY @1422
	IF~~THEN REPLY @1423 GOTO 11
	IF~~THEN REPLY @1424 GOTO 11
END

CHAIN
IF ~~ THEN ysrsdead 11
	@1425
	== ysrsdead  IF ~Global("bsKnowBhaal","GLOBAL",1)~ THEN @1443
END
	+ ~!Global("bsKnowBhaal","GLOBAL",1)~ + @1444 + 12
	IF~~THEN REPLY @1426 GOTO 12
	IF~~THEN REPLY @1446 GOTO 3

APPEND ysrsdead

IF ~~ THEN BEGIN 12
	SAY @1427
	IF~~THEN
	DO~SetGlobal("bsClearedCatacombs","GLOBAL",4)
	SetGlobal("ysTalkedToRestlessDead","GLOBAL",1)
	   ForceSpellRes("BS00001",Myself)
		 SetGlobal("bsTalkedToKRD","GLOBAL",0)
		 SetGlobal("ys0119TombTrigger","Global",0)
     ActionOverride("ysrsdead",DestroySelf())~
	EXIT
END

IF ~~ THEN BEGIN 13
	SAY @1428
	IF~Global("bsKnowBhaal","GLOBAL",1) Gender(Protagonist,MALE)~THEN REPLY @1429 GOTO 14
	IF~Global("bsKnowBhaal","GLOBAL",1) Gender(Protagonist,FEMALE)~THEN REPLY @1429 GOTO 15
	IF~!Global("bsKnowBhaal","GLOBAL",1)~THEN REPLY @1429 GOTO 13.1
	IF~~THEN REPLY @1446 GOTO 3
END

IF ~~ THEN BEGIN 13.1
	SAY @1445
	IF~~THEN
	DO~SetGlobal("bsClearedCatacombs","GLOBAL",4)
	SetGlobal("ysTalkedToRestlessDead","GLOBAL",2)
	   ForceSpellRes("BS00001",Myself)
		 SetGlobal("ys0119TombTrigger","Global",0)
     ActionOverride("ysrsdead",DestroySelf())~
	EXIT
END


//--------------------------------------------------------------
/* PC told real name */
IF ~~ THEN BEGIN 5
	SAY @1414
	IF~CheckStatGT(Protagonist,15,CHR)~THEN REPLY @1415 GOTO 16
	IF~CheckStatGT(Protagonist,15,INT)~THEN REPLY @1411 GOTO 16
	IF~Global("bsKnowBhaal","GLOBAL",1)
	   CheckStatLT(Protagonist,16,CHR)
	   Gender(Protagonist,MALE)~
	THEN REPLY @1417 GOTO 7
	IF~Global("bsKnowBhaal","GLOBAL",1)
	   CheckStatLT(Protagonist,16,CHR)
	   Gender(Protagonist,FEMALE)~
	THEN REPLY @1417 GOTO 8
	IF~!Global("bsKnowBhaal","GLOBAL",1)
	   CheckStatLT(Protagonist,16,CHR)~
	THEN REPLY @1417 GOTO 5.1
	IF~CheckStatLT(Protagonist,16,INT)~THEN REPLY @1413 GOTO 9
	IF~~THEN REPLY @1446 GOTO 5.2
END

IF ~~ THEN BEGIN 5.1
	SAY @1416
	IF~~THEN REPLY @1433 GOTO 19
	IF~~THEN REPLY @1434 GOTO 17
	IF~~THEN REPLY @1446 GOTO 5.2
END

IF ~~ THEN BEGIN 5.2
	SAY @1447
	IF~~THEN
	DO~SetGlobal("bsClearedCatacombs","GLOBAL",4)
	SetGlobal("ysTalkedToRestlessDead","GLOBAL",1)
	   ForceSpellRes("BS00001",Myself)
		 SetGlobal("ys0119TombTrigger","Global",0)
     ActionOverride("ysrsdead",DestroySelf())~
	EXIT
END

IF ~~ THEN BEGIN 16
	SAY @1432
	IF~~THEN REPLY @1433 GOTO 19
	IF~~THEN REPLY @1434 GOTO 17
	IF~~THEN REPLY @1446 GOTO 5.2
END

IF ~~ THEN BEGIN 17
	SAY @1435
	IF~~THEN REPLY @1436 GOTO 18
	IF~~THEN REPLY @1437 GOTO 18
END

END //APPEND ysrsdead

CHAIN
IF ~~ THEN ysrsdead 18
	@1438
	== ysrsdead IF ~Global("bsKnowBhaal","GLOBAL",1)~ THEN @1443
END
	+ ~!Global("bsKnowBhaal","GLOBAL",1)~ + @1444 + 20
	IF~~THEN REPLY @1426 GOTO 20
	IF~~THEN REPLY @1446 GOTO 5.2

CHAIN
IF ~~ THEN ysrsdead 19
	@1439
	== ysrsdead IF ~Global("bsKnowBhaal","GLOBAL",1)~ THEN @1443
END
	+ ~!Global("bsKnowBhaal","GLOBAL",1)~ + @1444 + 20
	IF~~THEN REPLY @1426 GOTO 20
	IF~~THEN REPLY @1446 GOTO 5.2


APPEND ysrsdead

IF ~~ THEN BEGIN 20
	SAY @1440
	IF~~THEN
	DO~SetGlobal("bsClearedCatacombs","GLOBAL",4)
	SetGlobal("ysTalkedToRestlessDead","GLOBAL",2)
	   ForceSpellRes("BS00001",Myself)
		 SetGlobal("ys0119TombTrigger","Global",0)
     ActionOverride("ysrsdead",DestroySelf())~
	EXIT
END


//--------------------------------------------------------------
/* PC knows about Bhaal heritage */


IF ~~ THEN BEGIN 7
	SAY @1419
	IF~~THEN
	DO~SetGlobal("bsClearedCatacombs","GLOBAL",4)
	SetGlobal("ysTalkedToRestlessDead","GLOBAL",1)
	   ForceSpellRes("BS00001",Myself)
		 SetGlobal("ys0119TombTrigger","Global",0)
     ActionOverride("ysrsdead",DestroySelf())~
	EXIT
END

IF ~~ THEN BEGIN 8
	SAY @1420
	IF~~THEN
	DO~SetGlobal("bsClearedCatacombs","GLOBAL",4)
	SetGlobal("ysTalkedToRestlessDead","GLOBAL",1)
	   ForceSpellRes("BS00001",Myself)
		 SetGlobal("ys0119TombTrigger","Global",0)
     ActionOverride("ysrsdead",DestroySelf())~
	EXIT
END

IF ~~ THEN BEGIN 14
	SAY @1430
	IF~~THEN
	DO~SetGlobal("bsClearedCatacombs","GLOBAL",4)
	SetGlobal("ysTalkedToRestlessDead","GLOBAL",2)
	   ForceSpellRes("BS00001",Myself)
		 SetGlobal("ys0119TombTrigger","Global",0)
     ActionOverride("ysrsdead",DestroySelf())~
	EXIT
END

IF ~~ THEN BEGIN 15
	SAY @1431
	IF~~THEN
	DO~SetGlobal("bsClearedCatacombs","GLOBAL",4)
	SetGlobal("ysTalkedToRestlessDead","GLOBAL",2)
	   ForceSpellRes("BS00001",Myself)
		 SetGlobal("ys0119TombTrigger","Global",0)
     ActionOverride("ysrsdead",DestroySelf())~
	EXIT
END


//--------------------------------------------------------------
/* peaceful ending of first conversation */

IF ~~ THEN BEGIN 9
	SAY @1421
	IF~~THEN
	DO~SetGlobal("bsClearedCatacombs","GLOBAL",4)
	SetGlobal("ysTalkedToRestlessDead","GLOBAL",2)
	   ForceSpellRes("BS00001",Myself)
		 SetGlobal("ys0119TombTrigger","Global",0)
		 SetGlobal("bsTalkedToKRD","GLOBAL",0)
     ActionOverride("ysrsdead",DestroySelf())~
	EXIT
END











//--------------------------------------------------------------
/* PC raided tomb after getting away peacefully the first time */

IF ~Global("ysTalkedToRestlessDead","GLOBAL",2)~ THEN BEGIN 30
	SAY @1441
	IF~~THEN
	DO~SetGlobal("ysTalkedToRestlessDead","GLOBAL",1)
	   ForceSpellRes("BS00001",Myself)
		 SetGlobal("ys0119TombTrigger","Global",0)
     ActionOverride("ysrsdead",DestroySelf())~
	EXIT
END

//--------------------------------------------------------------
// /* After fighting off all skeletons */
IF ~Global("ysTalkedToRestlessDead","GLOBAL",1)~ THEN BEGIN 31
	SAY @1442
	IF~~THEN
	DO~ForceSpellRes("BS00001",Myself)
		 SetGlobal("ys0119TombTrigger","Global",0)
     ActionOverride("ysrsdead",DestroySelf())~
	EXIT
END

END //APPEND ysrsdead