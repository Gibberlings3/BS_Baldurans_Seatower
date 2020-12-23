// creator  : weidu (version 23700)
// argument : VOICE.DLG
// game     : .
// source   : ./DATA/DIALOG.BIF
// dialog   : .\lang\en_us/dialog.tlk
// dialogF  : (none)

BEGIN ~BSVOICE~

IF ~~ THEN BEGIN 0 // from:
  SAY @9194 /* ~You've not the time for this! You must get the talon before it's taken by another!~ */
  IF ~~ THEN GOTO 1
END

IF ~~ THEN BEGIN 1 // from: 0.0
  SAY @9195 /* ~Leave the fool to his own battle! You have a destiny to follow!~ */
  IF ~~ THEN EXTERN ~BSWARRID~ 1
END

IF ~~ THEN BEGIN 2 // from:
  SAY @9196 /* ~Leave him. Get the talon! He is beyond help. It is pointless to stay!~ */
  IF ~~ THEN REPLY @9292 /* ~You are right. Only a weakling asks for help.~ */ EXTERN ~BSWARRID~ 2
  IF ~~ THEN REPLY @9293 /* ~I cannot leave him to die alone!~ */ EXTERN ~BSWARRID~ 3
END

IF ~~ THEN BEGIN 3 // from:
  SAY @9197 /* ~You have squandered your time and lost the talon! Unfortunate. Changes will have to be made.~ */
  IF ~~ THEN
  	DO~FadeToColor([50.0],0)
			Wait(2)
			ActionOverride(Protagonist,LeaveAreaLUA("bs0153","",[1342.1061],6))
			FadeFromColor([50.0],0)~
	EXIT
END

IF ~False()~ THEN BEGIN 4 // from:
  SAY @9198 /* ~The talon that gives power to those demanding, and abandons the weak to their fate. You are stronger for it.~ */
  IF ~~ THEN
  	DO~FadeToColor([50.0],0)
			Wait(2)
			ActionOverride(Protagonist,LeaveAreaLUA("bs0153","",[1342.1061],6))
			FadeFromColor([50.0],0)~
	EXIT
END

IF ~~ THEN BEGIN 5 // from:
  SAY @9199 /* ~It is the horn you seek! Claim what should be yours!~ */
  IF ~~ THEN EXTERN ~BSMESSED~ 1
END

IF ~~ THEN BEGIN 6 // from:
  SAY @9200 /* ~It is of no concern who it's truly for! Take what is meant for you! He'll never know the difference!~ */
  IF ~~ THEN EXTERN ~BSMESSED~ 2
END

IF ~~ THEN BEGIN 7 // from:
  SAY @9201 /* ~The horn with the will to take what is yours, and what should be yours.~ */
  IF ~~ THEN
  	DO~FadeToColor([50.0],0)
			Wait(2)
			ActionOverride(Protagonist,LeaveAreaLUA("bs0156","",[350.408],10))
			FadeFromColor([50.0],0)~
	EXIT
END

IF ~~ THEN BEGIN 8 // from:
  SAY @9202 /* ~You betray what you were born to be! There will be a price to pay!~ */
  IF ~~ THEN
  	DO~FadeToColor([50.0],0)
			Wait(2)
			ActionOverride(Protagonist,LeaveAreaLUA("bs0156","",[350.408],10))
			FadeFromColor([50.0],0)~
	EXIT
END

IF ~~ THEN BEGIN 9 // from:
  SAY @9203 /* ~It is the candle you must seek!~ */
  IF ~~ THEN EXTERN ~BSSORCED~ 1
END

IF ~~ THEN BEGIN 10 // from:
  SAY @9224 /* ~Forget the old man! His time is past! The wish should be yours!~ */
  IF ~~ THEN EXIT
END

IF ~Global("bsCandleTrap","GLOBAL",2)~ THEN BEGIN 11 // from:
  SAY @9225 /* ~Use it yourself, and know the legacy of your true father!~ */
  IF ~~ THEN REPLY @9294
		DO~SetGlobal("bsCandleTrap","GLOBAL",3)
		ActionOverride("bssorced",DestroySelf())
		CreateCreature("bsorced2",[483.249],0)~
		EXTERN BSORCED2 2
  IF ~~ THEN REPLY @9295
  	DO~ActionOverride("bssorced",Kill("bssorced"))
		   SetGlobal("bsCandleTrap","GLOBAL",3)~
  GOTO 12
END

IF ~~ THEN BEGIN 12 // from:
  SAY @9226 /* ~You have done well.~ */
  IF ~~ THEN GOTO 14
END

IF ~~ THEN BEGIN 13 // from:
  SAY @9227 /* ~You have wasted the power of the candle on the old man! There is much to be done before you are worthy!~ */
  IF ~~ THEN GOTO 14
END

IF ~~ THEN BEGIN 14 // from:
  SAY @9228 /* ~Seek the dagger next! It is nearby in the hands of a great evil Ogre! Slay it and take your rightful prize!~ */
  IF ~~ THEN
  	DO~FadeToColor([50.0],0)
			Wait(2)
			ActionOverride(Protagonist,LeaveAreaLUA("bs0154","",[699.54],2))
			FadeFromColor([50.0],0)~
	EXIT
END

IF ~~ THEN BEGIN 15 // from:
  SAY @9229 /* ~Look at them! The knight is obviously the one to help! The beast cannot be other than it was born to be! Kill it!~ */
  IF ~~ THEN EXTERN ~BSOGRED~ 1
END

IF ~~ THEN BEGIN 16 // from:
  SAY @9230 /* ~The beast is an ogre! They are evil; they cannot be otherwise! Do what you know MUST be done! Will you attack it or not?!~ */
  IF ~~ THEN REPLY @9231 /* ~Ogre or not, this creature is no threat. I'll not harm him!~ */ EXTERN ~BSOGRED~ 2
  IF ~~ THEN REPLY @9232 /* ~The beast will die, as all of its kind should!~ */
	EXTERN ~BSWHITKD~ 2
END

IF ~~ THEN BEGIN 17 // from:
  SAY @9233 /* ~A dagger of bone. A piece of the father bred in the child. You will be what you were born to be.~ */
  IF ~~ THEN
  	DO~FadeToColor([50.0],0)
			Wait(2)
			ActionOverride(Protagonist,LeaveAreaLUA("bs0151","",[2174.1811],6))
			FadeFromColor([50.0],0)~
	EXIT
END

IF ~~ THEN BEGIN 18 // from:
  SAY @9234 /* ~You disrespect your true calling at every turn. It will make your destiny all the more painful!~ */
	IF ~~ THEN
  	DO~FadeToColor([50.0],0)
			Wait(2)
			ActionOverride(Protagonist,LeaveAreaLUA("bs0151","",[2174.1811],6))
			FadeFromColor([50.0],0)~
	EXIT
END

IF ~~ THEN BEGIN 19 // from:
  SAY @9235 /* ~Pathetic! You are not even worthy of the true test! It is a wonder you are suitable at all!~ */
	IF ~~ THEN
  	DO~FadeToColor([50.0],0)
			Wait(2)
			ActionOverride(Protagonist,LeaveAreaLUA("bs0151","",[2174.1811],6))
			FadeFromColor([50.0],0)~
	EXIT
END

IF ~Global("bsDreamAreaGnoll","GLOBAL",1)~ THEN BEGIN 20 // from:
  SAY @9236 /* ~The potion you seek is here! Search the bodies! Their dead hold the prize!~ */
  IF ~~ THEN
  	DO~SetGlobal("bsDreamAreaGnoll","GLOBAL",2)
  	ActionOverride(Myself,DestroySelf())~
	EXIT
END

IF ~~ THEN BEGIN 21 // from:
  SAY @9238 /* ~Ignore him! Drink the potion yourself and know the essence of your heritage!~ */
  IF ~~ THEN EXTERN ~BSPOISOD~ 1
END

IF ~~ THEN BEGIN 22 // from:
  SAY @9239 /* ~Drink deep the blood of the father and the tears of the dead. They shall sustain you, for they are the very essence of your destiny!~ */
	IF ~~ THEN
  	DO~FadeToColor([50.0],0)
			Wait(2)
			ActionOverride(Protagonist,LeaveAreaLUA("bs0150","",[280.1550],8))
			FadeFromColor([50.0],0)~
	EXIT
END

IF ~~ THEN BEGIN 23 // from:
  SAY @9240 /* ~It is an insult to the very blood in your veins! You WILL learn to act accordingly!~ */
	IF ~~ THEN
  	DO~FadeToColor([50.0],0)
			Wait(2)
			ActionOverride(Protagonist,LeaveAreaLUA("bs0150","",[280.1550],8))
			FadeFromColor([50.0],0)~
	EXIT
END

IF ~~ THEN BEGIN 24 // from:
  SAY @9241 /* ~It is the last item you seek! Of course you're worthy of it!~ */
  IF ~~ THEN EXTERN ~BSWOMAND~ 1
END

IF ~~ THEN BEGIN 25 // from:
  SAY @9242 /* ~You know you are all that and more! You have power immeasurable in your future! You are destined for a veritable godhood!~ */
  IF ~~ THEN REPLY @9243 /* ~I am all that you seek! There are none alive or dead better than I!~ */ EXTERN ~BSWOMAND~ 2
  IF ~~ THEN REPLY @9244 /* ~Many a great person has walked this land. I cannot claim to be above them all.~ */ EXTERN ~BSWOMAND~ 3
END

IF ~~ THEN BEGIN 26 // from:
  SAY @9245 /* ~It is the Godhead itself, literal and figurative! Prepare yourself, for the return will come soon!~ */
	IF ~~ THEN
		DO~FadeToColor([50.0],0)
			Wait(2)
			ActionOverride(Protagonist,LeaveAreaLUA("bs0157","",[193.311],14))
			FadeFromColor([50.0],0)~
	EXIT
END

IF ~~ THEN BEGIN 27 // from:
  SAY @9247 /* ~Your fate will be sealed despite your petty rejection of the ways of your father. The return is nigh regardless!~ */
	IF ~~ THEN
		DO~FadeToColor([50.0],0)
			Wait(2)
			ActionOverride(Protagonist,LeaveAreaLUA("bs0157","",[193.311],14))
			FadeFromColor([50.0],0)~
	EXIT
END
