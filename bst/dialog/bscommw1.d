/* commoner: misses her grocery shop */

BEGIN bscommw1

IF ~True()~ THEN groceryshop
SAY @1079 /* ~Have you seen this new tailor? Everyone is going all excited about his fine cloths, but noone tells me where I'm supposed to buy my groceries now that the old shop is gone! And look at this mess. They didn't even clear away all the old shop's barrels from the street! I guess the exquisite tailor thinks himself too noble for that.~ */
IF ~~ THEN DO ~ActionOverride("bscommw1",EscapeAreaDestroy(3))~ EXIT
END