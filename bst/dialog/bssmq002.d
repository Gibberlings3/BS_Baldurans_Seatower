BEGIN bssmq002

IF ~True()~ THEN box
SAY @1510
++ @1511 + box_02
+ ~Global("bsSMQOpenedBox","GLOBAL",0)~ + @1512 + box_04
+ ~Global("bsSMQOpenedBox","GLOBAL",1) Global("bsSMQAteFigs","GLOBAL",0)~ + @1513 + box_03
++ @1514 + box_01
END

IF ~~ THEN box_01
SAY @1515
IF ~~ THEN EXIT
END

IF ~~ THEN box_02
SAY @1516
+ ~Global("bsSMQOpenedBox","GLOBAL",0)~ + ~Break the seal and open the box.~ + box_04
+ ~Global("bsSMQOpenedBox","GLOBAL",1) Global("bsSMQAteFigs","GLOBAL",0)~ + @1513 + box_03
++ @1514 + box_01
END

IF ~~ THEN box_03
SAY @1517
++ @1514 DO ~SetGlobal("bsSMQAteFigs","GLOBAL",1)~ + box_01
END

CHAIN
IF ~~ THEN bssmq002 box_04
@1518 DO ~SetGlobal("bsSMQOpenedBox","GLOBAL",1)~
== bssmq002 IF ~GlobalTimerExpired("bsSmugglerQuestTimer1","GLOBAL")~ THEN @1519
END
++ @1513 + box_03
++ @1514 + box_01


