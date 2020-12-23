BEGIN ~BSMESSED~

IF ~Global("bsDream","GLOBAL",0)~ THEN BEGIN 0 // from:
  SAY @9267 /* ~Salutations! I have come looking for someone, to deliver a gift. A horn actually.~ */
  IF ~~ THEN EXTERN BSVOICE 5
END

IF ~~ THEN BEGIN 1 // from:
  SAY @9268 /* ~I seek the First Reader of this great library. Perhaps you have seen him? This is to be his property, and I can give it to no other.~ */
  IF ~~ THEN EXTERN BSVOICE 6
END

IF ~~ THEN BEGIN 2 // from:
  SAY @9269 /* ~Do you claim to be the First Reader?~ */
  IF ~~ THEN REPLY @9272 /* ~Yes, I am who you seek.~ */ GOTO 3
  IF ~~ THEN REPLY @9273 /* ~No, and I have not seen him.~ */ GOTO 4
END

IF ~~ THEN BEGIN 3 // from: 2.0
  SAY @9270 /* ~Then I bear a message for you as well.~ */
  IF ~~ THEN 
		DO ~GiveItem("bshornd",Protagonist)
		ActionOverride(Myself,Kill(Myself))~
	EXTERN BSVOICE 7
END

IF ~~ THEN BEGIN 4 // from: 2.1
  SAY @9271 /* ~Nor would you want the gift I bear. I take my leave.~ */
  IF ~~ THEN DO~EscapeArea()~ EXTERN BSVOICE 8
END

//-------------------------------------
