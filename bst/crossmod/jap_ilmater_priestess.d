/* crossmod with Priestess of Ilmater from Jarl's Adventure Pack */

EXTEND_BOTTOM ja#pill1 0
+ ~Global("bsMissingMonk","GLOBAL",1) Global("bsAskedJAPPriest","MYAREA",0)
GlobalLT("bsAskedMissingMonk","GLOBAL",2)~ + @28 /* I'm looking for a monk of Ilmater who goes by the name Martina. Have you seen her lately? */ DO ~SetGlobal("bsAskedJAPPriest","MYAREA",1)~ + info_martina
END

EXTEND_BOTTOM ja#pill1 3
+ ~Global("bsMissingMonk","GLOBAL",1) Global("bsAskedJAPPriest","MYAREA",0)
GlobalLT("bsAskedMissingMonk","GLOBAL",2)~ + @28 /* I'm looking for a monk of Ilmater who goes by the name Martina. Have you seen her lately? */ DO ~SetGlobal("bsAskedJAPPriest","MYAREA",1)~ + info_martina
END

EXTEND_BOTTOM ja#pill1 4
+ ~Global("bsMissingMonk","GLOBAL",1) Global("bsAskedJAPPriest","MYAREA",0)
GlobalLT("bsAskedMissingMonk","GLOBAL",2)~ + @28 /* I'm looking for a monk of Ilmater who goes by the name Martina. Have you seen her lately? */ DO ~SetGlobal("bsAskedJAPPriest","MYAREA",1)~ + info_martina
END

APPEND ja#pill1
IF ~~ THEN info_martina
SAY @250 /* ~I do know my sister Martina, but I wasn’t here the last time she visited. You’d best ask one of the poor souls who are around the shrine. They are the ones she seeks out when she is here.~ */
IF ~~ THEN EXIT
END
END
