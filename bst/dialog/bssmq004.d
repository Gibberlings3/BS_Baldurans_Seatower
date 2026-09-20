/* big box, 3rd smuggler quest */
BEGIN bssmq004

IF ~True()~ THEN box
SAY @1510 /* ~You look at the box closely.~ */
+ ~GlobalLT("bsSMQOpenedBox","GLOBAL",2)~ + @1521 /* ~Investigate the box.~ */ + box_02
+ ~GlobalLT("bsSMQOpenedBox","GLOBAL",2)~ + @1512 /* ~Open the box.~*/ + box_03
++ @1514 /* ~Put away the box.~ */ + box_01
END

IF ~~ THEN box_01
SAY @1515 /* ~You stow away the box.~ */
IF ~~ THEN EXIT
END

IF ~~ THEN box_02
SAY @1522 /* ~The box is nailed shut. While it will be easy enough to get some of the planks loose to have a look inside, you doubt you will be able to do so without some noise - and probably will not be able to close it again without traces of it having been open.~ */
+ ~GlobalLT("bsSMQOpenedBox","GLOBAL",2)~ + @1512 /* ~Open the box.~*/ + box_03
++ @1514 /* ~Put away the box.~ */ + box_01
END

IF ~~ THEN box_03
SAY @1523 /* ~You open the box, breaking a plank. Inside, there is - nothing. The box is empty.~ */
IF ~~ THEN DO ~SetGlobal("bsSMQOpenedBox","GLOBAL",2)~ EXIT
END


