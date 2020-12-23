BEGIN bsdpgrd2


IF ~!PartyHasItem("bsdopdr") RandomNum(6,1)~ THEN BEGIN 1
  SAY @10071
  IF ~~ THEN EXIT
END

IF ~!PartyHasItem("bsdopdr") RandomNum(6,2)~ THEN BEGIN 2
  SAY @10072
  IF ~~ THEN EXIT
END

IF ~!PartyHasItem("bsdopdr") RandomNum(6,3)~ THEN BEGIN 3
  SAY @10073
  IF ~~ THEN EXIT
END

IF ~!PartyHasItem("bsdopdr") RandomNum(6,4)~ THEN BEGIN 4
  SAY @10074
  IF ~~ THEN EXIT
END

IF ~!PartyHasItem("bsdopdr") RandomNum(6,5)~ THEN BEGIN 5
  SAY @10075
  IF ~~ THEN EXIT
END

IF ~!PartyHasItem("bsdopdr") RandomNum(6,6)~ THEN BEGIN 6
  SAY @10076
  IF ~~ THEN EXIT
END

IF ~PartyHasItem("bsdopdr")~ THEN BEGIN 7
  SAY @10083
  IF ~~ THEN DO ~SetGlobal("bsDoppTurnMyself","LOCALS",1)
		ReallyForceSpellRES("bsdopsp6",Myself)~ EXIT
END
