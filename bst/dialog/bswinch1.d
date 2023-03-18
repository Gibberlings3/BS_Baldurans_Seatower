BEGIN bswinch1

/* The sebaceous gland you gained from a Sea Troll. It's constantly oozing a gelatic substance that is said to exceptionally protect metal against water. */

IF ~GlobalGT("bsWinchGreaseQuest","GLOBAL",0)~ THEN BEGIN 0
	SAY @2441 /* ~Hello again!~ */
+ ~PartyHasItem("bswnchft") Global("bsWinchGreaseQuest","GLOBAL",1)~ + @2442 /* ~I have a Sea Troll's sebaceous gland for you.~ */ + 7
+ ~PartyHasItem("bswnchft") GlobalGT("bsWinchGreaseQuest","GLOBAL",1)~ + @2450 /* ~I have another Sea Troll's sebaceous gland for you.~ */ + 8
++ @2438 /* ~Good day to you.~ */ EXIT
END

//---------------------------------------------------------
IF ~Global("bsWinchGreaseQuest","GLOBAL",0)~ THEN BEGIN 1
	SAY @2413 /* ~Hello. Nice day, innit?~ */
	IF~~THEN REPLY @2414 /* ~Hello to you too. Who are you?~ */ GOTO 3
	IF~~THEN REPLY @2415 /* ~If you say so. What are you doing here?~ */ GOTO 3
	IF~~THEN REPLY @2418 /* ~What is this place? What in all of Faerun is that chain for?~ */ GOTO 4
	IF~~THEN REPLY @2416 /* ~No it's not a nice day. It hasn't been a nice day for months now.~ */ GOTO 2
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 2
	SAY @2417 /* ~Oh right. Shame that. I hope things improve soon. What can I do for you?~ */ 
	IF~~THEN REPLY @2434 /* ~Who are you?~ */ GOTO 3
	IF~~THEN REPLY @2435 /* ~What are you doing here?~ */ GOTO 3
	IF~~THEN REPLY @2418 /* ~What is this place? What in all of Faerun is that chain for?~ */ GOTO 4
++ @2436 /* ~Nothing, thanks.~ */ EXIT
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 3
	SAY @2419 /* ~I'm the head winchman here. Brydw's the name.~ */
	IF~~THEN REPLY @2420 /* ~Head Winchman? What in all of Faerun is that chain for?~ */ GOTO 4
++ @2439 /* ~What exactly is the chain for?~ */ GOTO 4
++ @2438 /* ~Good day to you.~ */ EXIT
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 4
	SAY @2440 /* ~If wound up, that chain protects the city from unwanted ships entering the city's harbor.~ */
= @2443 /* ~For that, me and my assistant need to apply new layers of grease to it every few months. You look like adventurers. I'd be in need of grease, a very special sort.~ */

IF ~!GlobalGT("ys_GetFeathers","GLOBAL",2)~ THEN + 6

+ ~GlobalGT("ys_GetFeathers","GLOBAL",2)~ + @2444 /* ~Please don't tell me you want the grease of the geese from the kitchen.~ */ + 5
+ ~GlobalGT("ys_GetFeathers","GLOBAL",2)~ + @2445 /* ~So?~ */ + 6
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 5
SAY @2446 /* ~Ah, no, not that. And if, it'd be more of a wagon load full of gease.~ */
IF ~~ THEN + 6
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 6
SAY @2447 /* ~I heard that in Tethyr they use tallow from Sea Trolls as it is especially water resistant. In case you ever come across such a creature, please bring the corresponding part to me - the sebaceous gland it is called I think.~ */
IF ~~ THEN DO ~SetGlobal("bsWinchGreaseQuest","GLOBAL",1)~ UNSOLVED_JOURNAL @918 EXIT
END

IF ~~ THEN BEGIN 7
SAY @2448 /* ~Oh, how exciting! Thanks for going through the trouble. Here is some gold as compensation. This will last for a while, but in case you'll find more, feel free to drop it off here. I'll take any you'll get.~ */
IF ~~ THEN DO ~TakePartyItemNum("bswnchft",1) DestroyItem("bswnchft") GiveGoldForce(500) EraseJOurnalEntry(@918) SetGlobal("bsWinchGreaseQuest","GLOBAL",2)~ SOLVED_JOURNAL @919 EXIT
END

IF ~~ THEN BEGIN 8
SAY @2449 /* ~Great! Here is your gold.~ */
IF ~~ THEN DO ~TakePartyItemNum("bswnchft",1) DestroyItem("bswnchft") GiveGoldForce(500)~ EXIT
END

/* Girl and mom in Winchhouse */

BEGIN bswnchgl
IF ~True()~ THEN girl
SAY @2455 /* ~I'm waiting for the chain to be wound up again!~ */
IF ~~ THEN EXIT
END

BEGIN bswnchwm
IF ~True()~ THEN mother
SAY @2456 /* ~It smells of old fish and seaweed in here. As if the usual stink on the tower grounds wouldn't be bad enough already.~ */
IF ~~ THEN EXIT
END