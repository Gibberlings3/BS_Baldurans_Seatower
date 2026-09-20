/* Heavy Barrel, 5th smuggler quest */
BEGIN bssmgl22

CHAIN
IF ~Global("bs_BarrelStartsCoughing","MYAREA",1)~ THEN bssmgl22 coughs
@1540 /* ~From inside the barrel you can unmistakably hear the sound of someone coughing.~ */
/* ## NPC reactions */
END
IF ~Global("bsSMQOpenedBox","GLOBAL",4)~ THEN DO ~SetGlobal("bs_BarrelStartsCoughing","MYAREA",2)
DestroySelf()~ EXIT
IF ~GlobalLT("bsSMQOpenedBox","GLOBAL",4)~ THEN DO ~SetGlobal("bsSMQOpenedBox","GLOBAL",4) SetGlobal("bs_BarrelStartsCoughing","MYAREA",2)
AddJournalEntry(@100145,QUEST)
DestroySelf()~ EXIT

BEGIN bssmq008
IF ~True()~ THEN box
SAY @1524 /* ~(You look at the barrel closely.)~ */
+ ~Global("bsSMQOpenedBox","GLOBAL",4)~ + @1536 /* ~I will leave it closed. I trust Holger with this.~ */ + box_01
++ @1525 /* ~(Investigate the air holes.)~ */ + box_02
++ @1526 /* ~(Investigate the lid.)~ */ + box_03
+ ~Global("bsSMQOpenedBox","GLOBAL",4)~ + @1527 /* ~(Listen at the barrel.)~ */ + box_06
+ ~GlobalLT("bsSMQOpenedBox","GLOBAL",4)~ + @1527 /* ~(Listen at the barrel.)~ */ + box_04
+ ~Global("bsSMQOpenedBox","GLOBAL",4)~ + @1528 /* Hello? I know someone is in there. Can you hear me?~ */ + no_sound
+ ~Global("bsSMQOpenedBox","GLOBAL",4)~ + @1529 /* Er, in case you need help, just give a shout, or a knock, or anything.~ */ + no_sound
+ ~Global("bsSMQOpenedBox","GLOBAL",4)~ + @1544  /* ~Wow, Holger smuggling persons! Kudos! I wouldn't have thought him capable of that. Well, let's deliver this then.~ */ + box_01
++ @1530 /* ~(Open the barrel.)~ */ + box_05
+ ~Global("bs_ReportSmugglersToSeatower","GLOBAL",6)
Global("bsSMQOpenedBox","GLOBAL",4)~ + @1537 /* ~It will be opened soon enough. I will not risk interfering with the arrest of the smuggling contact.~ */ + box_01
++ @1531 /* ~(Do nothing.)~ */ + box_01
END

IF ~~ THEN box_01
SAY @1532 /* ~You stow away the barrel.~ */
IF ~~ THEN EXIT
END

IF ~~ THEN box_02
SAY @1533 /* ~You try to peak inside the barrel, but the holes are too small to see anything.~ */
++ @1526 /* ~(Investigate the lid.)~ */ + box_03
+ ~Global("bsSMQOpenedBox","GLOBAL",4)~ + @1527 /* ~(Listen at the barrel.)~ */ + box_06
+ ~GlobalLT("bsSMQOpenedBox","GLOBAL",4)~ + @1527 /* ~(Listen at the barrel.)~ */ + box_04
+ ~Global("bsSMQOpenedBox","GLOBAL",4)~ + @1528 /* Hello? I know someone is in there. Can you hear me?~ */ + no_sound
+ ~Global("bsSMQOpenedBox","GLOBAL",4)~ + @1529 /* Er, in case you need help, just give a shout, or a knock, or anything.~ */ + no_sound
+ ~Global("bsSMQOpenedBox","GLOBAL",4)~ + @1544  /* ~Wow, Holger smuggling persons! Kudos! I wouldn't have thought him capable of that. Well, let's deliver this then.~ */ + box_01
++ @1530 /* ~(Open the barrel.)~ */ + box_05
++ @1531 /* ~(Do nothing.)~ */ + box_01
END

IF ~~ THEN box_03
SAY @1543 /* ~(The barrel is not nailed shut. It would be easy enough to open it from the inside. From the outside, however, the lid would need to be broken to be able to grab it properly.)~ */
++ @1525 /* ~(Investigate the air holes.)~ */ + box_02
+ ~Global("bsSMQOpenedBox","GLOBAL",4)~ + @1527 /* ~(Listen at the barrel.)~ */ + box_06
+ ~GlobalLT("bsSMQOpenedBox","GLOBAL",4)~ + @1527 /* ~(Listen at the barrel.)~ */ + box_04
+ ~Global("bsSMQOpenedBox","GLOBAL",4)~ + @1528 /* Hello? I know someone is in there. Can you hear me?~ */ + no_sound
+ ~Global("bsSMQOpenedBox","GLOBAL",4)~ + @1529 /* Er, in case you need help, just give a shout, or a knock, or anything.~ */ + no_sound
+ ~Global("bsSMQOpenedBox","GLOBAL",4)~ + @1544 /* ~Wow, Holger smuggling persons! Kudos! I wouldn't have thought him capable of that. Well, let's deliver this then.~ */ + box_01
++ @1530 /* ~(Open the barrel.)~ */ + box_05
++ @1531 /* ~(Do nothing.)~ */ + box_01
END

IF ~~ THEN box_04
SAY @1534 /* ~(You put your ear at the barrel, but hear nothing.)~ */
++ @1536 /* ~I will leave it closed. I trust Holger with this.~ */ + box_01
++ @1541 /* ~(You wait, your ear at the barrel.)~ */ DO ~SetGlobal("bsSMQOpenedBox","GLOBAL",4)~ UNSOLVED_JOURNAL @100145 + box_06
++ @1525 /* ~(Investigate the air holes.)~ */ + box_02
++ @1526 /* ~(Investigate the lid.)~ */ + box_03
+ ~Global("bsSMQOpenedBox","GLOBAL",4)~ + @1528 /* Hello? I know someone is in there. Can you hear me?~ */ + no_sound
+ ~Global("bsSMQOpenedBox","GLOBAL",4)~ + @1529 /* Er, in case you need help, just give a shout, or a knock, or anything.~ */ + no_sound
+ ~Global("bsSMQOpenedBox","GLOBAL",4)~ + @1544 /* ~Wow, Holger smuggling persons! Kudos! I wouldn't have thought him capable of that. Well, let's deliver this then.~ */ + box_01
++ @1530 /* ~(Open the barrel.)~ */ + box_05
++ @1531 /* ~(Do nothing.)~ */ + box_01
END

IF ~~ THEN box_05
SAY @1539 /* ~You open the barrel.~ */
IF ~~ THEN DO ~SetGlobal("bsSMQOpenedBox","GLOBAL",5) SetGlobal("bsSmugglerQuest","GLOBAL",23)~ EXIT
END

IF ~~ THEN box_06
SAY @1542 /* You wait long enough to hear occasional breathing sounds. Someone - or something alive seems to be in there.~ */
++ @1536 /* ~I will leave it closed. I trust Holger with this.~ */ + box_01
+ ~Global("bs_ReportSmugglersToSeatower","GLOBAL",6)~ + @1537 /* ~It will be opened soon enough. I will not risk interfering with the arrest of the smuggling contact.~ */ + box_01
++ @1528 /* Hello? I know someone is in there. Can you hear me?~ */ + no_sound
++ @1529 /* Er, in case you need help, just give a shout, or a knock, or anything.~ */ + no_sound
++ @1530 /* ~(Open the barrel.)~ */ + box_05
++ @1531 /* ~(Do nothing.)~ */ + box_01
END

IF ~~ THEN no_sound
SAY @1535 /* ~There is no response whatsoever.~ */
++ @1536 /* ~I will leave it closed. I trust Holger with this.~ */ + box_01
+ ~Global("bs_ReportSmugglersToSeatower","GLOBAL",6)~ + @1537 /* ~It will be opened soon enough. I will not risk interfering with the arrest of the smuggling contact.~ */ + box_01
++ @1538 /* ~I can't carry this any minute longer if I'm not sure whether someone inside needs my help! I'll open the barrel now.~ */ + box_05
++ @1544 /* ~Wow, Holger smuggling persons! Kudos! I wouldn't have thought him capable of that. Well, let's deliver this then.~ */ + box_01
++ @1530 /* ~(Open the barrel.)~ */ + box_05
++ @1531 /* ~(Do nothing.)~ */ + box_01
END
