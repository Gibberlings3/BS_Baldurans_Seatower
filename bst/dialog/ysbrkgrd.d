BEGIN ysbrkgrd

IF ~RandomNum(7,1)~ THEN BEGIN 1
  SAY @1100
  IF ~~ THEN EXIT
END

IF ~RandomNum(7,2)~ THEN BEGIN 2
  SAY @1101
  IF ~~ THEN EXIT
END

IF ~RandomNum(7,3)~ THEN BEGIN 3
  SAY @1102
  IF ~~ THEN EXIT
END

IF ~RandomNum(7,4)~ THEN BEGIN 4
  SAY @1103
  IF ~~ THEN EXIT
END

IF ~RandomNum(7,5)~ THEN BEGIN 5
  SAY @1104
  IF ~~ THEN EXIT
END

IF ~RandomNum(7,6)~ THEN BEGIN 6
  SAY @1105
  IF ~~ THEN EXIT
END

IF ~RandomNum(7,7)
		OR(3)
	Global("bsDoppelgangerQuest","GLOBAL",6)
	Global("bsDoppelgangerQuest","GLOBAL",9)
	GlobalGT("bsDGQuestAborted","GLOBAL",0)~ THEN BEGIN 7
  SAY @1106
  IF ~~ THEN EXIT
END