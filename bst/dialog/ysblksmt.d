BEGIN ~ysblksmt~

CHAIN
IF ~Global("ys_TalkedToBlacksmith","GLOBAL",0)~THEN ysblksmt 0
	@2000 /* ~Garalt is the name and I sell the the finest arms and armor in Baldur's Gate! Can I sell you anything?~ */ DO ~SetGlobal("ys_TalkedToBlacksmith","GLOBAL",1)~ 
== ysblksmt IF ~GlobalGT("bsDoppelgangerQuest","GLOBAL",14)
Global("bsSmithRecog","GLOBAL",0)~ THEN @2007 /* ~Wait a moment - I recognise you! Saw off those doppelgangers and sorted out the Tower Commander's troubles, didn't you? Good job that! Now, is there anything I can get you?~ */ DO ~SetGlobal("bsSmithRecog","GLOBAL",1)~
END

	+ ~Global("ys_TalkedToFletcher","GLOBAL",1)~ + @2010 /* ~You sound like the fletcher over there.~ */ + 0_1
	IF~~THEN REPLY@2001 /* ~'The finest arms and armor in Baldur's Gate'?~ */ GOTO 1
	IF~~THEN REPLY @2002 /* ~Let me see your shop.~ */ DO ~SetGlobal("ys_TalkedToBlacksmith","GLOBAL",1)~ GOTO 10
	IF~~THEN REPLY @2003 /* ~Not today.~ */ EXIT

CHAIN
IF ~GlobalGT("ys_TalkedToBlacksmith","GLOBAL",0)~THEN ysblksmt 0_0
	@2011 /* ~Welcome back! Can I sell you anything?~ */
== ysblksmt IF ~GlobalGT("bsDoppelgangerQuest","GLOBAL",14)
Global("bsSmithRecog","GLOBAL",0)~ THEN @2007 /* ~Wait a moment - I recognise you! Saw off those doppelgangers and sorted out the Tower Commander's troubles, didn't you? Good job that! Now, is there anything I can get you?~ */ DO ~SetGlobal("bsSmithRecog","GLOBAL",1)~
END
/* fire elemental in storeroom quest */
+ ~GlobalLT("bsFireElementQuest","GLOBAL",8)
PartyHasItem("bsbarrl1") Global("bsBarrelWithWater","GLOBAL",0)~ + @2014 /* ~Would you coat this barrel with a fire proof layer from the inside? It needs to withhold a trapped fire elemental for a certain time.~ */ + coat_barrel
/* fire resistant barrel */
+ ~PartyHasItem("bsbarrl3") Global("bsBarrelWithWater","GLOBAL",1)~ + @2017 /* ~I have a fire resistant barrel here for you. The fletcher said you could have use for it?~ */ + barrel_empty
+ ~PartyHasItem("bsbarrl3") Global("bsBarrelWithWater","GLOBAL",2)~ + @2018 /* ~I have a fire resistant barrel here for you.~ */ + barrel_empty
+ ~PartyHasItem("bsbarrl2") 
OR(2) Global("bsBarrelWithWater","GLOBAL",2) Global("bsBarrelWithWater","GLOBAL",3)~ + @2019 /* ~I have a fire resistant barrel filled with well water here for you.~ */ + barrel_full
+ ~PartyHasItem("bsbarrl2") 
Global("bsBarrelWithWater","GLOBAL",1)~ + @2026 /* ~I have a fire resistant barrel for you, filled with well water - it was in anyway, maybe it's of use for you.~ */ + barrel_full_01
+ ~PartyHasItem("bsbarrl3") Global("bsBarrelWithWater","GLOBAL",3)~ + @2020 /* ~It's the barrel as it is or nothing, I'm afraid.~ */ + barrel_empty_01

	IF~~THEN REPLY @2002 /* ~Let me see your shop.~ */ DO ~SetGlobal("ys_TalkedToBlacksmith","GLOBAL",1)~ GOTO 10
	IF~~THEN REPLY @2003 /* ~Not today.~ */ EXIT


APPEND ysblksmt


IF ~~THEN BEGIN 0_1
SAY @2012 /* ~Well, we surely know what our work is worth - and so does the Tower Guard.~ */
IF ~~THEN + 1
END

IF ~~THEN BEGIN 1
	SAY@2004 /* ~If you can find any better or cheaper in this city then I'll match the price - and give you a further discount.~ */
	IF~~THEN REPLY @2005 /* ~That sounds fair to me, Garalt.~ */ GOTO 2
/* fire elemental in storeroom quest */
+ ~GlobalLT("bsFireElementQuest","GLOBAL",8)
PartyHasItem("bsbarrl1") Global("bsBarrelWithWater","GLOBAL",0)~ + @2014 /* ~Would you coat this barrel with a fire proof layer from the inside? It needs to withhold a trapped fire elemental for a certain time.~ */ + coat_barrel
/* fire resistant barrel */
+ ~PartyHasItem("bsbarrl3") Global("bsBarrelWithWater","GLOBAL",1)
GlobalGT("bsFireElementQuest","GLOBAL",9)~ + @2017 /* ~I have a fire resistant barrel here for you. The fletcher said you could have use for it?~ */ + barrel_empty
+ ~PartyHasItem("bsbarrl3") Global("bsBarrelWithWater","GLOBAL",2)
GlobalGT("bsFireElementQuest","GLOBAL",9)~ + @2018 /* ~I have a fire resistant barrel here for you.~ */ + barrel_empty
+ ~PartyHasItem("bsbarrl2") 
OR(2) Global("bsBarrelWithWater","GLOBAL",2) Global("bsBarrelWithWater","GLOBAL",3)
GlobalGT("bsFireElementQuest","GLOBAL",9)~ + @2019 /* ~I have a fire resistant barrel filled with well water here for you.~ */ + barrel_full
+ ~PartyHasItem("bsbarrl2") 
Global("bsBarrelWithWater","GLOBAL",1)
GlobalGT("bsFireElementQuest","GLOBAL",9)~ + @2026 /* ~I have a fire resistant barrel for you, filled with well water - it was in anyway, maybe it's of use for you.~ */ + barrel_full_01
+ ~PartyHasItem("bsbarrl3") Global("bsBarrelWithWater","GLOBAL",3)
GlobalGT("bsFireElementQuest","GLOBAL",9)~ + @2020 /* ~It's the barrel as it is or nothing, I'm afraid.~ */ + barrel_empty_01
	IF~~THEN REPLY @2006 /* ~I'll be going now.~ */ EXIT
END

IF ~~THEN BEGIN 2
SAY @2013 /* ~It definitely is.~ */
IF ~~THEN + 3
END

IF ~~THEN BEGIN 3
SAY @2028 /* Is there anything else I can do for you?~ */
/* fire elemental in storeroom quest */
+ ~GlobalLT("bsFireElementQuest","GLOBAL",8)
PartyHasItem("bsbarrl1") Global("bsBarrelWithWater","GLOBAL",0)~ + @2014 /* ~Would you coat this barrel with a fire proof layer from the inside? It needs to withhold a trapped fire elemental for a certain time.~ */ + coat_barrel
/* fire resistant barrel */
+ ~PartyHasItem("bsbarrl3") Global("bsBarrelWithWater","GLOBAL",1)
GlobalGT("bsFireElementQuest","GLOBAL",9)~ + @2017 /* ~I have a fire resistant barrel here for you. The fletcher said you could have use for it?~ */ + barrel_empty
+ ~PartyHasItem("bsbarrl3") Global("bsBarrelWithWater","GLOBAL",2)
GlobalGT("bsFireElementQuest","GLOBAL",9)~ + @2018 /* ~I have a fire resistant barrel here for you.~ */ + barrel_empty
+ ~PartyHasItem("bsbarrl2") 
OR(2) Global("bsBarrelWithWater","GLOBAL",2) Global("bsBarrelWithWater","GLOBAL",3)
GlobalGT("bsFireElementQuest","GLOBAL",9)~ + @2019 /* ~I have a fire resistant barrel filled with well water here for you.~ */ + barrel_full
+ ~PartyHasItem("bsbarrl2") 
Global("bsBarrelWithWater","GLOBAL",1)
GlobalGT("bsFireElementQuest","GLOBAL",9)~ + @2026 /* ~I have a fire resistant barrel for you, filled with well water - it was in anyway, maybe it's of use for you.~ */ + barrel_full_01
+ ~PartyHasItem("bsbarrl3") Global("bsBarrelWithWater","GLOBAL",3)
GlobalGT("bsFireElementQuest","GLOBAL",9)~ + @2020 /* ~It's the barrel as it is or nothing, I'm afraid.~ */ + barrel_empty_01

	IF~~THEN REPLY @2002 /* ~Let me see your shop.~ */ DO ~SetGlobal("ys_TalkedToBlacksmith","GLOBAL",1)~ GOTO 10
	IF~~THEN REPLY @2003 /* ~Not today.~ */ EXIT
END

IF ~~ THEN coat_barrel
SAY @2015 /* ~Hmm, I *could* coat it with a thin metal layer from the inside but that would take some time as well as quite some amount of iron which is rather rare at the moment. Plus I'm not even sure it then would withhold the heat of a trapped fire elemental. Best you ask Matha - the fletcher, she knows her way around enchanting wood better than I could.~ */
= @2016 /* ~Once you *have* the fire proof barrel and are done using it, though, bring it to me because I have a good use of fire proof equipment. Bring it already filled with water from the well outside and I'll through in an extra 100 gold for not having to carry it myself!~ */
IF ~~ THEN DO ~AddJournalEntry(@914,QUEST)
SetGlobal("bsBarrelWithWater","GLOBAL",2)~ UNSOLVED_JOURNAL @913 EXIT
END

IF ~~ THEN barrel_empty
SAY @2021 /* ~Yes! I'll buy it gladly. But I'd be even more thrilled if you'd fill it with water from the well for me so I don't have to get it myself?~ */
++ @2022 /* ~Alright, I'll do that.~ */ DO ~SetGlobal("bsBarrelWithWater","GLOBAL",3)~ + barrel_empty_02
++ @2020 /* ~It's the barrel as it is or nothing, I'm afraid.~ */ + barrel_empty_01
END

IF ~~ THEN barrel_empty_01
SAY @2023 /* ~Then I'll take it now. Here is your gold.~ */
IF ~~ THEN DO ~TakePartyItem("bsbarrl3") DestroyItem("bsbarrl3") GiveGoldForce(500) EraseJournalEntry(@913) EraseJournalEntry(@914)~ SOLVED_JOURNAL @915 EXIT
END

IF ~~ THEN barrel_empty_02
SAY @2024 /* ~That's great!~ */
IF ~~ THEN UNSOLVED_JOURNAL @914 +3
END

IF ~~ THEN barrel_full
SAY @2025 /* ~Much obliged. Here is your gold.~ */
IF ~~ THEN DO ~TakePartyItem("bsbarrl2") DestroyItem("bsbarrl2") GiveGoldForce(600) EraseJournalEntry(@913) EraseJournalEntry(@914) SetGlobal("bsBarrelWithWater","GLOBAL",4)~ SOLVED_JOURNAL @915 EXIT
END

IF ~~ THEN barrel_full_01
SAY @2027 /* ~Wow, can you read minds? That's exactly what I'll buy off your hands. Fire resistant equipment is good for a forge, and I'm always in need of well water.~ */
IF ~~ THEN + barrel_full
END
IF ~~ THEN BEGIN 10
  SAY @2009 /* ~Of course. One moment...~ */
  IF ~~ THEN DO ~StartStore("ysblksmt",LastTalkedToBy())~ EXIT
END
END //APPEND