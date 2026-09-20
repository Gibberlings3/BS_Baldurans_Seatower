BEGIN bsalmirn

IF ~Global("bsUsedAlmiranScroll","GLOBAL",0) Global("bs_ar1900","MYAREA",1)~ THEN BEGIN 0
SAY @1505
=  @1500 /* ~You can:~ */
++ @1501 /* ~Read the scroll to enter the unknown dungeon.~ */ GOTO 2
++  @1502 /* ~Put the scroll away.~*/ GOTO 3
END

IF ~Global("bsUsedAlmiranScroll","GLOBAL",0) Global("bs_ar1900","MYAREA",0)~ THEN BEGIN 1
SAY @1503 /* ~You try to read the scroll but the letters dance all over the surface of the parchment. In a few seconds you start to feel quite nauseous. This does not seem to be the place where the magic of the magical scroll takes effect.~*/
IF~~THEN EXIT
END

IF ~~ THEN BEGIN 2
SAY @1504 /* ~You feel stupid reading the scroll to a blank wall but at last the letters stay still!! As you read each letter it disappears in a tiny, barely-visible flash of light. When you come to the end of the scroll the parchment is empty to your eyes. For a moment nothing happens, then the world of trees and light vanishes into a black nothingness.~*/
IF~~THEN DO ~SetGlobal("bsUsedAlmiranScroll","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN 3
SAY @1506 /* ~You put the scroll away.~*/
IF~~THEN EXIT
END

IF ~GlobalGT("bsUsedAlmiranScroll","GLOBAL",0)~ THEN BEGIN empty
SAY @1507 /* ~The scroll has lost its magic for you.~ */
IF ~~ THEN EXIT
END
