BEGIN ~BSPOISOD~

IF ~Global("bsDream","GLOBAL",0)~ THEN BEGIN 0 // from:
  SAY @9283 /* ~Please... that pack of gnolls... they poisoned me. Was there a flask among them? It must be the antidote. Please... */
  IF ~!PartyHasItem("BSPOTND")~ THEN
  	DO~SetGlobal("bsDream151","GLOBAL",2)~
	EXIT
  IF ~PartyHasItem("BSPOTND")~ THEN EXTERN ~BSVOICE~ 21
END

IF ~~ THEN BEGIN 1 // from:
  SAY #5237 /* ~Please... show some charity... I'll die without it.~ */
  IF ~~ THEN REPLY @9286 //#9286 
/* ~My destiny is more important than your paltry life. Cheers.~ */ EXTERN ~BSVOICE~ 22
  IF ~~ THEN REPLY @9287 // #9287 
/* ~I cannot refuse this man his very life! He needs this potion more than I!~ */ GOTO 2
END

IF ~~ THEN BEGIN 2 // from: 1.1
  SAY @9285 /* ~Thank you. Your actions are my antidote. Let the blood of the father not despoil the son!~  */
  IF ~~ THEN
		DO~TakePartyItem("BSPOTND")~
	EXTERN ~BSVOICE~ 23
END
