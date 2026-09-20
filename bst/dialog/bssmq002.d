/* sealed box, first smuggler quest */
BEGIN bssmq002

IF ~True()~ THEN box
SAY @1510 /* ~You look at the box closely.~ */
++ @1511 /* ~Investigate the seal.~ */ + box_02
+ ~Global("bsSMQOpenedBox","GLOBAL",0)~ + @1512 /* ~Open the box.~*/ + box_04
+ ~Global("bsSMQOpenedBox","GLOBAL",1) Global("bsSMQAteFigs","GLOBAL",0)~ + @1513 /* ~Eat of the figs.~ */ + box_03
++ @1514 /* ~Put away the box.~ */ + box_01
END

IF ~~ THEN box_01
SAY @1515 /* ~You stow away the box.~ */
IF ~~ THEN EXIT
END

IF ~~ THEN box_02
SAY @1516 /* ~The seal is huge, displaying a sign of a Calimshanian fruit trading agent. It seals the lid close, there is no way to open that box without either breaking the seal or destroying the whole box.~ */
+ ~Global("bsSMQOpenedBox","GLOBAL",0)~ + @1520 /* ~Break the seal and open the box.~ */ + box_04
+ ~Global("bsSMQOpenedBox","GLOBAL",1) Global("bsSMQAteFigs","GLOBAL",0)~ + @1513 /* ~Eat of the figs.~ */ + box_03
++ @1514 /* ~Put away the box.~ */ + box_01
END

IF ~~ THEN box_03
SAY @1517 /* ~You eat as much of the figs as you feel like. One of them is really tasty, the other ones not so much.~ */
++ @1514 /* ~Put away the box.~ */ DO ~SetGlobal("bsSMQAteFigs","GLOBAL",1)~ + box_01
END

CHAIN
IF ~~ THEN bssmq002 box_04
@1518 DO ~SetGlobal("bsSMQOpenedBox","GLOBAL",1)~
== bssmq002 IF ~GlobalTimerExpired("bsSmugglerQuestTimer1","GLOBAL")~ THEN @1519 /* ~Some of the figs started rotting.~ */
END
++ @1513 /* ~Eat of the figs.~ */ + box_03
++ @1514 /* ~Put away the box.~ */ + box_01


