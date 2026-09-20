/* Commoner lobt den tollen neuen Schneider */

/* "Elma Spitwrack" is mentioned in #17994 (BG:EE) : ~I've never been satisfied with the dresses made by Elma Spitwrack. The workmanship is shoddy and the material is coarse. I've never understood why she is considered so highly by the fashion establishment in Waterdeep. I think that a blind goblin could make a better dress.~ */

BEGIN bsnoba_d

IF ~True()~ THEN taylor
SAY @1078 /* ~You need a new tailor, your clothes are absolutely dreadful. Well, there *is* this new tailor, Master Usher. In the Dock's District - not where I would usually go, but he is supposed to be better than Elma Spitwrack! If that is the case, I could spare the expenses of having to ship my dresses from Waterdeep. Appointments are very hard to get, though, or so they say. Still, you could try - maybe he'll take pity on you.~ */
IF ~~ THEN DO ~ActionOverride("bsnoba_d",EscapeAreaDestroy(3))~ EXIT
END