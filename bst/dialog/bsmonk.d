BEGIN bsmonk

//--------------

IF ~RandomNum(4,1)
	OR(2)
	Global("bsMissingMonk","GLOBAL",4)
	Global("bsMissingMonk","GLOBAL",5)~ THEN BEGIN 4
  SAY @3654
  IF ~~ THEN EXIT
END

IF ~RandomNum(4,2)
	OR(2)
	Global("bsMissingMonk","GLOBAL",4)
	Global("bsMissingMonk","GLOBAL",5)~ THEN BEGIN 5
  SAY @3655
  IF ~~ THEN EXIT
END

IF ~RandomNum(4,3)
	OR(2)
	Global("bsMissingMonk","GLOBAL",4)
	Global("bsMissingMonk","GLOBAL",5)~ THEN BEGIN 6
  SAY @3656
  IF ~~ THEN EXIT
END

IF ~RandomNum(4,4)
	OR(2)
	Global("bsMissingMonk","GLOBAL",4)
	Global("bsMissingMonk","GLOBAL",5)~ THEN BEGIN 7
  SAY @3657
  IF ~~ THEN EXIT
END

IF ~RandomNum(6,5)
	OR(2)
	Global("bsMissingMonk","GLOBAL",4)
	Global("bsMissingMonk","GLOBAL",5)~ THEN BEGIN 8
  SAY @3658
  IF ~~ THEN EXIT
END

IF ~RandomNum(6,6)
	OR(2)
	Global("bsMissingMonk","GLOBAL",4)
	Global("bsMissingMonk","GLOBAL",5)~ THEN BEGIN 9
  SAY @3659
  IF ~~ THEN EXIT
END



IF ~RandomNum(2,1)
	!Global("bsMissingMonk","GLOBAL",4)
	!Global("bsMissingMonk","GLOBAL",5)~ THEN BEGIN 8
  SAY @3658
  IF ~~ THEN EXIT
END

IF ~RandomNum(2,2)
	!Global("bsMissingMonk","GLOBAL",4)
	!Global("bsMissingMonk","GLOBAL",5)~ THEN BEGIN 9
  SAY @3659
  IF ~~ THEN EXIT
END

