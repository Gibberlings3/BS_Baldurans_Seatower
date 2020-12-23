BEGIN ~BSWHITKD~

IF ~Global("bsDream","GLOBAL",0)~ THEN BEGIN 0 // from:
  SAY @9280 /* ~You there! Help me dispose of this beast! His kind are a plague on the land!~ */
  IF ~~ THEN EXTERN ~BSOGRED~ 0
END

IF ~~ THEN BEGIN 1 // from:
  SAY @9281 /* ~Don't believe a word it says! Born evil they are! Everyone knows that! The only good ogre is a dead ogre!~ */
  IF ~~ THEN EXTERN ~BSVOICE~ 15
END

IF ~~ THEN BEGIN 2 // from:
  SAY @9282 /* ~You chose right! Beings of flesh ARE what they ARE. There is no escaping your destiny. Best you remember that! Here, this is yours!~ */
  IF ~~ THEN
		DO~ActionOverride("bsogred",Kill("bsogred"))
		GiveItem("bsdaggd",Protagonist)~
	EXTERN ~BSVOICE~ 17
END
