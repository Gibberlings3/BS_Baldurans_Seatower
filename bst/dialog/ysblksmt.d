BEGIN ~ysblksmt~

IF ~GlobalGT("bsDoppelgangerQuest","GLOBAL",14)
Global("bsSmithRecog","GLOBAL",0)~ THEN thanks
SAY @2007 /* ~Wait a moment - I recognise you! Saw off those doppelgangers and sorted out the Tower Commander's troubles, didn't you? Good job that!~ */
IF ~GlobalGT("ys_TalkedToBlacksmith","GLOBAL",0)~ THEN DO ~SetGlobal("bsSmithRecog","GLOBAL",1)~ + 0_0
IF ~Global("ys_TalkedToBlacksmith","GLOBAL",0)~ THEN DO ~SetGlobal("bsSmithRecog","GLOBAL",1)~ + 0
END

IF ~Global("ys_TalkedToBlacksmith","GLOBAL",0)~ THEN 0
SAY @2000 /* ~Garalt is the name and I sell the the finest arms and armor in Baldur's Gate! Can I sell you anything?~ */
	+ ~Global("ys_TalkedToFletcher","GLOBAL",1)~ + @2010 /* ~You sound like the fletcher over there.~ */ DO ~SetGlobal("ys_TalkedToBlacksmith","GLOBAL",1)~ + 0_1
	IF~~THEN REPLY@2001 /* ~'The finest arms and armor in Baldur's Gate'?~ */ DO ~SetGlobal("ys_TalkedToBlacksmith","GLOBAL",1)~ GOTO 1
	IF~~THEN REPLY @2003 /* ~Not today.~ */ EXIT
END

IF ~PartyHasItem("bsiumbhh") Global("bs_UmberHulkHide","MYAREA",0)~ THEN umberhulk_plate
SAY @1979 /* ~What do I see! I fine Umber Hulk hide, and a fairly fresh one, I take it. For 10.000 gold I could make you a good plate mail out of it.~ */
IF ~~ THEN DO ~SetGlobal("bs_UmberHulkHide","MYAREA",1)~ EXIT
END

IF ~PartyHasItem("bsblun02") Global("bs_FletchersStaff","GLOBAL",6)~ THEN staff_to_spear
SAY @1984 /* ~Is that - is that a spear from Matha - I mean the Seatower Fletcher? I'd immediately recognize her handiwork on any weapon. What an exceptionally fine weapon it is, considering her original profession. Still, it would be simple enough for me to turn it into a fine spear, if you are interested. Although - maybe I shouldn't offer that for a weapon she created. I don't mean to disrespect her work!~ */
++ @1985 /* ~You'd immediately recognize her handiwork on a sturdy staff, hmm? I won't pry for details here.~ */ + staff_to_spear_01
++ @2029 /* ~A spear sounds interesting, actually. What would it cost me?~ */ + staff_to_spear_04
++ @1986 /* ~I'm not interested in changing the staff into a spear.~ */ + staff_to_spear_02
END

IF ~GlobalTimerExpired("bs_ArmorerTimer","GLOBAL") Global("bs_UmberHulkHide","MYAREA",3)~ THEN umber_plate_done
SAY @1980 /* ~I finised the armor. Here you are! It's a fine piece, if I may say so. By the way, Master Shizell was expressing interest in working with such a fresh armor, too. He seems a little addleheaded, but he knows his way wround with magic. You might be able to get yourself a nifty enchantment if you ask him.~ */
IF ~~ THEN DO ~GiveItemCreate("bsplat02",LastTalkedToBy(Myself),0,0,0)
EraseJournalEntry(@100176)
SetGlobal("bs_UmberHulkHide","MYAREA",4)~ SOLVED_JOURNAL @100177 EXIT
END

IF ~GlobalGT("ys_TalkedToBlacksmith","GLOBAL",0)~THEN 0_0
SAY @2011 /* ~Welcome back! Can I sell you anything?~ */
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
+ ~PartyHasItem("bsblun02") Global("bs_FletchersStaff","GLOBAL",7)~ + @2029 /* ~A spear sounds interesting, actually. What would it cost me?~ */ + staff_to_spear_04
+ ~Global("bs_FletchersStaff","GLOBAL",9)~ + @1982 /* ~The fletcher is alright with you changing the staff to a spear.~ */ + staff_to_spear_05
+ ~PartyHasItem("bsblun02") Global("bs_FletchersStaff","GLOBAL",10)
PartyHasItem("DAGG02") PartyGoldGT(999)~ + @1983 /* ~Please change the fletcher's staff to a spear.~ */ + staff_to_spear_08
+ ~PartyHasItem("bsiumbhh") Global("bs_UmberHulkHide","MYAREA",1)
PartyGoldGT(9999)~ + @1981 /* ~Make the Umber Hulk Plate for me.~ */ + umberhulk_plate_01
IF~~THEN REPLY @2002 /* ~Let me see your shop.~ */ GOTO 10
IF~~THEN REPLY @2006 /* ~I'll be going now.~ */ EXIT
END

IF ~~THEN BEGIN 0_1
SAY @2012 /* ~Well, we surely know what our work is worth - and so does the Tower Guard.~ */
IF ~~THEN + 1
END

IF ~~THEN BEGIN 1
	SAY @2004 /* ~If you can find any better or cheaper in this city then I'll match the price - and give you a further discount.~ */
	IF~~THEN REPLY @2005 /* ~That sounds fair to me, Garalt.~ */ GOTO 2
COPY_TRANS_LATE ysblksmt 0_0
END

IF ~~THEN BEGIN 2
SAY @2013 /* ~It definitely is.~ */
IF ~~THEN + 3
END

IF ~~THEN BEGIN 3
SAY @2028 /* Is there anything else I can do for you?~ */
COPY_TRANS_LATE ysblksmt 0_0
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

IF ~~ THEN staff_to_spear_01
SAY @1987 /* ~What are you - I did not imply - do not be disrespectful towards Matha, I warn you!~ */
++ @1988 /* ~I wasn't. I was teasing you. Those red ears tell me all there is to know.~ */ + staff_to_spear_03
++ @2029 /* ~A spear sounds interesting, actually. What would it cost me?~ */ + staff_to_spear_04
++ @1986 /* ~I'm not interested in changing the staff into a spear.~ */ + staff_to_spear_02
END

IF ~~ THEN staff_to_spear_02
SAY @1989 /* ~Of course. If you change your mind, let me know.~ */
IF ~~ THEN DO ~SetGlobal("bs_FletchersStaff","GLOBAL",7)~ EXIT
END

IF ~~ THEN staff_to_spear_03
SAY @1990 /* ~Stop this nonsense at once, or I'll show you the door!~ */
++ @2029 /* ~A spear sounds interesting, actually. What would it cost me?~ */ + staff_to_spear_04
++ @1986 /* ~I'm not interested in changing the staff into a spear.~ */ + staff_to_spear_02
END

IF ~~ THEN staff_to_spear_04
SAY @1991 /* ~With a dagger +1 and 1000 gold I'd make a fine spear out of this staff. But please make sure Matha the fletcher is alright with this, first.~ */
IF ~~ THEN DO ~SetGlobal("bs_FletchersStaff","GLOBAL",8)~ UNSOLVED_JOURNAL @100172 EXIT
END

IF ~~ THEN staff_to_spear_05
SAY @1992 /* ~Is that so! I am glad she trusts my work.~ */
++ @1993 /* I have the strong impression she'd trust you with more than that.~ */ + staff_to_spear_06
++ @1994 /* She was thrilled you consider her work worth working with. She holds you in high regard, it's obvious.~ */ + staff_to_spear_06
+ ~PartyHasItem("DAGG02") PartyGoldGT(999)~ + @1983 /* ~Please change the fletcher's staff to a spear.~ */ + staff_to_spear_08
++ @1995 /* ~I'll come back for this.~ */ + staff_to_spear_07
END

IF ~~ THEN staff_to_spear_06
SAY @1996 /* ~A-hum.~ */
IF ~~ THEN + staff_to_spear_07
END

IF ~~ THEN staff_to_spear_07
SAY @1997 /* ~Let me know when you want me to make the spear.~ */
IF ~~ THEN DO ~SetGlobal("bs_FletchersStaff","GLOBAL",10)~ EXIT
END

IF ~~ THEN staff_to_spear_08
SAY @1998 /* ~Gladly. Give it to me.~ */
IF ~~ THEN DO ~EraseJournalEntry(@100173)
SetGlobal("bs_FletchersStaff","GLOBAL",11)
ClearAllActions()
StartCutSceneMode()
StartCutScene("bscut002")~ EXIT
END

IF WEIGHT #-1
~Global("bs_FletchersStaff","GLOBAL",11)~ THEN give_spear
SAY @1999 /* ~Here it is - a spear out of a staff!~ */
IF ~~ THEN DO ~SetGlobal("bs_FletchersStaff","GLOBAL",12)~ EXIT
END

IF ~~ THEN umberhulk_plate_01
SAY @1978 /* ~Gladly! Come back in a few days and it will be ready.~ */
IF ~~ THEN DO ~SetGlobal("bs_UmberHulkHide","MYAREA",2)~ EXIT
END
