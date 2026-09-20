BEGIN bsdryada

IF ~Global("bs_DryadLeaves","MYAREA",1)~ THEN goodbye
SAY @4 /* My presence here is no longer needed. */
IF ~~ THEN DO ~SetGlobal("bs_DryadLeaves","MYAREA",2)~ EXIT
END

IF ~Global("bs_DryadExtraReward","MYAREA",1)~ THEN bienchen
SAY @5 /* You went to all places to get my tree water. Your efforts are appreciated. */
IF ~~ THEN DO ~AddExperienceParty(1000) SetGlobal("bs_DryadExtraReward","MYAREA",2)~ + goodbye
END

IF ~!HasItem("bslense1",Myself)
Global("bs_DryadWaterCount","MYAREA",0)
Global("bs_DrydTakesWater","MYAREA",0)~ THEN lens_gone
SAY @0 /* ~I see you already helped yourself to what item I am here to give you.~ */
IF ~~ THEN DO ~AddJournalEntry(@924,QUEST_DONE)~ + goodbye
END

CHAIN
IF ~PartyHasItem("bsdrwate") Global("bsDryadWater","GLOBAL",1)~ THEN bsdryada brings_water
@2 /* ~You come bearing a gift for my tree.~ */
== bsdryada IF ~HasItem("bslense1",Myself)~ THEN @3 /* ~As promised, I will give you what I have in my posession.~ */ DO ~GiveItem("bslense1",LastTalkedToBy(Myself))~
END
IF ~~ THEN DO ~EraseJournalEntry(@921)
SetGlobal("bs_DrydTakesWater","MYAREA",1)~ SOLVED_JOURNAL @923 EXIT


APPEND bsdryada
IF ~GlobalLT("bsDryadWater","GLOBAL",2)~ THEN quest
SAY @1 /* ~My tree is thirsty. Bring me water, then I will give you what you need from this place.~ */
+ ~Global("bs_whatisthisplace","LOCALS",0)~ + @6 /* What is this place? */ DO ~SetGlobal("bs_whatisthisplace","LOCALS",1) SetGlobal("bsDryadWater","GLOBAL",1)~ + this_place
+ ~Global("bs_whatfindhere","LOCALS",0)~ + @7 /* What do you mean with "what I need from this place"? */ DO ~SetGlobal("bs_whatfindhere","LOCALS",1) SetGlobal("bsDryadWater","GLOBAL",1)~ + find_here
+ ~Global("bs_wherewater","LOCALS",0)~ + @8 /* Where would I find water here? */ DO ~SetGlobal("bs_wherewater","LOCALS",1) SetGlobal("bsDryadWater","GLOBAL",1)~ + where_water
+ ~Global("bs_pchostile","LOCALS",0)~ + @9 /* How about I just take whatever you are hiding? */ DO ~SetGlobal("bs_pchostile","LOCALS",1) SetGlobal("bsDryadWater","GLOBAL",1)~ + hostile
++ @10 /* I'll be going. */ DO ~SetGlobal("bsDryadWater","GLOBAL",1)~ + waiting
END

IF ~~ THEN this_place
SAY @11 /* It is serving a purpose you will understand in time. */
++ @12 /* Is anything in here real? */ + real
+ ~Global("bs_whatfindhere","LOCALS",0)~ + @7 /* What do you mean with "what I need from this place"? */ DO ~SetGlobal("bs_whatfindhere","LOCALS",1)~ + find_here
+ ~Global("bs_wherewater","LOCALS",0)~ + @8 /* Where would I find water here? */ DO ~SetGlobal("bs_wherewater","LOCALS",1)~ + where_water
+ ~Global("bs_pchostile","LOCALS",0)~ + @9 /* How about I just take whatever you are hiding? */ DO ~SetGlobal("bs_pchostile","LOCALS",1)~ + hostile
++ @10 /* I'll be going. */ + waiting
END

IF ~~ THEN real
SAY @13 /* Is it as real as it has to be. */
+ ~Global("bs_whatfindhere","LOCALS",0)~ + @7 /* What do you mean with "what I need from this place"? */ DO ~SetGlobal("bs_whatfindhere","LOCALS",1)~ + find_here
+ ~Global("bs_wherewater","LOCALS",0)~ + @8 /* Where would I find water here? */ DO ~SetGlobal("bs_wherewater","LOCALS",1)~ + where_water
+ ~Global("bs_pchostile","LOCALS",0)~ + @9 /* How about I just take whatever you are hiding? */ DO ~SetGlobal("bs_pchostile","LOCALS",1)~ + hostile
++ @10 /* I'll be going. */ + waiting
END

IF ~~ THEN find_here
SAY @14 /* The item you need to be able to see. */
+ ~Global("bs_whatisthisplace","LOCALS",0)~ + @6 /* What is this place? */ DO ~SetGlobal("bs_whatisthisplace","LOCALS",1)~ + this_place
+ ~Global("bs_wherewater","LOCALS",0)~ + @8 /* Where would I find water here? */ DO ~SetGlobal("bs_wherewater","LOCALS",1)~ + where_water
+ ~Global("bs_pchostile","LOCALS",0)~ + @9 /* How about I just take whatever you are hiding? */ DO ~SetGlobal("bs_pchostile","LOCALS",1)~ + hostile
++ @10 /* I'll be going. */ + waiting
END

IF ~~ THEN where_water
SAY @15 /* You already crossed several places on your way here. */
+ ~Global("bs_whatisthisplace","LOCALS",0)~ + @6 /* What is this place? */ DO ~SetGlobal("bs_whatisthisplace","LOCALS",1)~ + this_place
+ ~Global("bs_whatfindhere","LOCALS",0)~ + @16 /* What do I need to find here? */ DO ~SetGlobal("bs_whatfindhere","LOCALS",1)~ + find_here
+ ~Global("bs_pchostile","LOCALS",0)~ + @9 /* How about I just take whatever you are hiding? */ DO ~SetGlobal("bs_pchostile","LOCALS",1)~ + hostile
++ @10 /* I'll be going. */ + waiting
END

IF ~~ THEN hostile
SAY @17 /* Your actions will be weighted. Do what your heart tells you. */
+ ~Global("bs_whatisthisplace","LOCALS",0)~ + @6 /* What is this place? */ DO ~SetGlobal("bs_whatisthisplace","LOCALS",1)~ + this_place
+ ~Global("bs_whatfindhere","LOCALS",0)~ + @16 /* What do I need to find here? */ DO ~SetGlobal("bs_whatfindhere","LOCALS",1)~ + find_here
+ ~Global("bs_wherewater","LOCALS",0)~ + @8 /* Where would I find water here? */ DO ~SetGlobal("bs_wherewater","LOCALS",1)~ + where_water
++ @10 /* I'll be going. */ + waiting
END

IF ~~ THEN waiting
SAY @18 /* I will be here as long as it is needed. */
IF ~~ THEN EXIT
END

END //APPEND