BEGIN YSBRKGD2

IF ~RandomNum(7,1)~ THEN BEGIN 1
  SAY @1090
  IF ~~ THEN EXIT
END

IF ~RandomNum(7,2)~ THEN BEGIN 2
  SAY @1091
  IF ~~ THEN EXIT
END

IF ~RandomNum(7,3)~ THEN BEGIN 3
  SAY @1092
  IF ~~ THEN EXIT
END

IF ~RandomNum(7,4)~ THEN BEGIN 4
  SAY @1093
  IF ~~ THEN EXIT
END

IF ~RandomNum(7,5)~ THEN BEGIN 5
  SAY @1094
  IF ~~ THEN EXIT
END

IF ~RandomNum(7,6)~ THEN BEGIN 6
  SAY @1095
  IF ~~ THEN EXIT
END

IF ~RandomNum(7,7)~ THEN BEGIN 6
  SAY @1097
  IF ~~ THEN EXIT
END

IF ~Global("bs_CommentedDGQuest","MYAREA",0)
		OR(3)
	Global("bsDoppelgangerQuest","GLOBAL",6)
	Global("bsDoppelgangerQuest","GLOBAL",9)
	GlobalGT("bsDGQuestAborted","GLOBAL",0)~ THEN BEGIN 7
  SAY @1096
  IF ~~ THEN DO ~SetGlobal("bs_CommentedDGQuest","MYAREA",1)~ EXIT
END
