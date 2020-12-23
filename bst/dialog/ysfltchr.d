BEGIN ~ysfltchr~

// ------------------------------------------------------------------
// Got the feathers
IF ~PartyHasItem("ysgoosef") Global("ys_GetFeathers","GLOBAL",4)~THEN BEGIN 7
	SAY@1160 /* ~You have the feathers! Beautiful - they'll make fine fletchings for my arrows. Here - it's not much but you did save me the climb up the tower!~ */
	IF~~THEN DO~TakePartyItem("ysgoosef")
		DestroyItem("ysgoosef")
		GiveItemCreate("arow02",Player1,10,0,0)
		SetGlobal("ys_GetFeathers","GLOBAL",5)
		EraseJournalEntry(@723)~ SOLVED_JOURNAL @721 /* ~The Fletcher's Feathers

The fletcher has her feathers and I have some new arrows.~ */
		EXIT
	IF ~GlobalLT("bsFireElementQuest","GLOBAL",8)
PartyHasItem("bsbarrl1") Global("bsAskedCoatBarrel","LOCALS",1)
PartyHasItem("POTN02")~ THEN DO~TakePartyItem("ysgoosef")
		DestroyItem("ysgoosef")
		GiveItemCreate("arow02",Player1,10,0,0)
		SetGlobal("ys_GetFeathers","GLOBAL",5)
		EraseJournalEntry(@723)~ SOLVED_JOURNAL @721 /* ~The Fletcher's Feathers

The fletcher has her feathers and I have some new arrows.~ */ + coat_barrel_01
END

// ------------------------------------------------------------------
//very first greeting
IF ~Global("ys_TalkedToFletcher","GLOBAL",0)~THEN BEGIN 0
	SAY@1168 /* ~Matha the Fletcher at your service. What can I do for you?~ */
	IF~~THEN REPLY @1169 /* ~A fletcher eh? I see more than just arrows here.~ */ GOTO 1
	IF~~THEN REPLY @1161 /* ~I assume you sell things?~ */ GOTO 1
	IF~~THEN REPLY @1170 /* ~I'll be leaving, good day to you.~ */ EXIT
END


// ------------------------------------------------------------------
// after feather quest was given
IF ~GlobalGT("ys_TalkedToFletcher","GLOBAL",0)
		GlobalGT("ys_GetFeathers","GLOBAL",1)~THEN BEGIN 100
	SAY@1163 /* ~Good day again. What can I get you?~ */

/* quest fire elemental in storeroom */
+ ~GlobalLT("bsFireElementQuest","GLOBAL",8)
PartyHasItem("bsbarrl1") Global("bsAskedCoatBarrel","LOCALS",0)~ + @1260 /* ~Would you coat this barrel with a fire proof layer from the inside? It needs to withhold a trapped fire elemental for a certain time.~ */ + coat_barrel_02
+ ~Global("ys_GetFeathers","GLOBAL",5)
GlobalLT("bsFireElementQuest","GLOBAL",8)
PartyHasItem("bsbarrl1") Global("bsAskedCoatBarrel","LOCALS",1)
PartyHasItem("POTN02")~ + @1261 /* ~I have all ingredients now. Please coat the barrel so that it is fire proof.~ */ + coat_barrel

	IF~~THEN REPLY @1164 /* ~Let me see your shop.~ */ GOTO 8
	IF~~THEN REPLY @1165 /* ~Nothing.~ */ EXIT
END


// ------------------------------------------------------------------
// Quest conversation was cut off before quest was given
IF ~GlobalGT("ys_TalkedToFletcher","GLOBAL",0)~THEN BEGIN 101
	SAY@1166 /* ~Good day again. What can I get you? And - I could do with some help if you're willing?~ */
+ ~Global("ys_GetFeathers","GLOBAL",1)~ + @1178 /* ~I already said no.~ */ + 101_1
+ ~Global("ys_GetFeathers","GLOBAL",1)~ + @1253 /* ~Alright, fine. I'll get the feathers for you.~ */ + 6
+ ~Global("ys_GetFeathers","GLOBAL",2)~ + @1254 /* ~I'm on it.~ */ + 101_2

/* quest fire elemental in storeroom */
+ ~GlobalLT("bsFireElementQuest","GLOBAL",8)
PartyHasItem("bsbarrl1") Global("bsAskedCoatBarrel","LOCALS",0)~ + @1260 /* ~Would you coat this barrel with a fire proof layer from the inside? It needs to withhold a trapped fire elemental for a certain time.~ */ + coat_barrel_02
+ ~Global("ys_GetFeathers","GLOBAL",5)
GlobalLT("bsFireElementQuest","GLOBAL",8)
PartyHasItem("bsbarrl1") Global("bsAskedCoatBarrel","LOCALS",1)
PartyHasItem("POTN02")~ + @1261 /* ~I have all ingredients now. Please coat the barrel so that it is fire proof.~ */ + coat_barrel

	IF~~THEN REPLY @1164 /* ~Let me see your shop.~ */ GOTO 8
	IF~~THEN REPLY @1170 /* ~I'll be leaving, good day to you.~ */ EXIT
END

IF ~~ THEN 101_1
SAY @1255 /* ~A pity though.~ */
IF ~~ THEN + 6_1
END

IF ~~ THEN 101_2
SAY @1256 /* ~Oh, that's great!~ */
IF ~~ THEN + 6_1
END

IF ~~THEN BEGIN 1
	SAY@1171 /* ~The finest arrows and the finest bows in Amn. Take your pick - if you have the gold, of course.~ */
	IF~~THEN REPLY @1172 /* ~'The finest arrows and the finest bows in Amn'?~ */ DO ~SetGlobal("ys_TalkedToFletcher","GLOBAL",1)~ GOTO 2
	IF~Global("ys_TalkedToBlacksmith","GLOBAL",1)~THEN REPLY @1252 /* ~Now you sound like the armorer.~ */ DO ~SetGlobal("ys_TalkedToFletcher","GLOBAL",1)~ GOTO 2_1

/* quest fire elemental in storeroom */
+ ~GlobalLT("bsFireElementQuest","GLOBAL",8)
PartyHasItem("bsbarrl1") Global("bsAskedCoatBarrel","LOCALS",0)~ + @1260 /* ~Would you coat this barrel with a fire proof layer from the inside? It needs to withhold a trapped fire elemental for a certain time.~ */ DO ~SetGlobal("ys_TalkedToFletcher","GLOBAL",1)~ + coat_barrel_02
+ ~Global("ys_GetFeathers","GLOBAL",5)
GlobalLT("bsFireElementQuest","GLOBAL",8)
PartyHasItem("bsbarrl1") Global("bsAskedCoatBarrel","LOCALS",1)
PartyHasItem("POTN02")~ + @1261 /* ~I have all ingredients now. Please coat the barrel so that it is fire proof.~ */ DO ~SetGlobal("ys_TalkedToFletcher","GLOBAL",1)~+ coat_barrel

	IF~~THEN REPLY @1164 /* ~Let me see your shop.~ */ DO ~SetGlobal("ys_TalkedToFletcher","GLOBAL",1)~ GOTO 8
END

IF ~~THEN BEGIN 2
	SAY@1173 /* ~[Spelling error in name is on purpose!] Well... alright. Baldur's Gate then. I don't really know how good the bows and arrows are in -say- Purskal.~ */
	IF~~THEN REPLY @1174 /* ~Not that brilliant, trust me.~ */ GOTO 3
	IF~~THEN REPLY @1250 /* ~Me, neither.~ */ GOTO 3.1
	IF~~THEN REPLY @1262 /* ~[Spelling error in name is on purpose!] "Purskal", eh?~ */ GOTO 3.2
END

IF ~~THEN BEGIN 2_1
	SAY @1162 /* Ha, well the tower doesn't accept just anyone to station here. We are also responsible for the Tower Guard's supply, so I assure you we do not exaggerate if we praise our own work.~ */
IF ~~THEN + 2
END

IF ~~THEN BEGIN 3
	SAY@1175 /* ~[Spelling error in name is on purpose!] Ah! Well at least I know I'm better than the fletchers and bowyers in Purskal!~ */
	IF ~~THEN + 3.2
END

IF ~~THEN BEGIN 3.1
	SAY @1251 /* ~That's alright - then I can still say I offer the finest arrows of Baldur's Gate *and* Purskal, because you can't prove me wrong, hm?~ */
	IF ~~THEN + 3.2
END

IF ~~THEN BEGIN 3.2
	SAY @1249 /* ~Listen - you wouldn't be able to do me a small favour please?~ */
	IF ~GlobalLT("ys_HalfslingerAle","GLOBAL",3)~THEN REPLY @1176 /* ~That depends. Define 'small favour'.~ */ GOTO 4
	IF ~GlobalGT("ys_HalfslingerAle","GLOBAL",2)~THEN REPLY @1177 /* ~Just as long as it doesn't involve that bloody cook again!~ */ GOTO 40
	IF~~THEN REPLY @1257 /* ~I don't have time right now for extra errands.~ */ GOTO 5
END

IF~~THEN BEGIN 40
	SAY@1179 /* ~Why, yes it does. Is there a problem with her?~ */
	IF~~THEN REPLY@1180 /* ~Is there a problem? I take it you've never spoken to the cook? Or her apprentice?~ */ GOTO 41
++ @1258 /* ~No, not really.~ */ + 4
	IF~~THEN REPLY @1257 /* ~I don't have time right now for extra errands.~ */ GOTO 5
END

IF ~~THEN BEGIN 41
	SAY@1182 /* ~Not recently - I take my meals with the guards. So I can talk to them and see if my goods are doing their job.~ */
	IF~~THEN REPLY@1183 /* ~Okay. Forget it. What do you need?~ */ GOTO 4
	IF~~THEN REPLY@1257 /* ~I don't have time right now for extra errands.~ */ GOTO 5
END

IF ~~THEN BEGIN 4
	SAY@1184 /* ~I'm almost out of feathers for my next batch of arrows. I happen to know that the tower cook has a fine pair of plump geese for tonight's meal. Would you go and ask her for the feathers? I'd do it myself but I'm stuck here waiting for a shipment of arrow shafts.~ */
	IF~~THEN REPLY@1185 /* ~I can do that.~ */ GOTO 6
	IF~~THEN REPLY@1257 /* ~I don't have time right now for extra errands.~ */ GOTO 5
	IF~~THEN REPLY@1186 /* ~I'm not running around after you - do it yourself.~ */GOTO 5
END

IF ~~THEN BEGIN 5
	SAY@1187 /* ~Oh well. It was worth asking.~ */
IF ~~ THEN DO ~SetGlobal("ys_GetFeathers","GLOBAL",1)~ + 6_1
END

IF ~~THEN BEGIN 6
	SAY@1188 /* ~Thank you, thank you!~ */
IF ~~ THEN DO ~SetGlobal("ys_GetFeathers","GLOBAL",2)~ UNSOLVED_JOURNAL @720 + 6_1
END

IF ~~THEN BEGIN 6_1
	SAY @1259 /* ~Is there anything I can do for you?~ */
/* quest fire elemental in storeroom */
+ ~GlobalLT("bsFireElementQuest","GLOBAL",8)
PartyHasItem("bsbarrl1") Global("bsAskedCoatBarrel","LOCALS",0)~ + @1260 /* ~Would you coat this barrel with a fire proof layer from the inside? It needs to withhold a trapped fire elemental for a certain time.~ */ + coat_barrel_02
+ ~Global("ys_GetFeathers","GLOBAL",5)
GlobalLT("bsFireElementQuest","GLOBAL",8)
PartyHasItem("bsbarrl1") Global("bsAskedCoatBarrel","LOCALS",1)
PartyHasItem("POTN02")~ + @1261 /* ~I have all ingredients now. Please coat the barrel so that it is fire proof.~ */ + coat_barrel
	IF~~THEN REPLY@1164 /* ~Let me see your shop.~ */ GOTO 8
	IF~~THEN REPLY @1170 /* ~I'll be leaving, good day to you.~ */EXIT
END

// Store
IF ~~ THEN BEGIN 8
  SAY @1189 /* ~Of course. One moment...~ */
  IF ~~ THEN DO ~StartStore("ysfltchr",LastTalkedToBy())~ EXIT
END

/* quest fire elemental in storeroom */

IF ~~ THEN coat_barrel
SAY @1263 /* ~This will only take a moment.~ */
IF ~~ THEN DO ~SetGlobal("bsAskedCoatBarrel","LOCALS",2) ClearAllActions() StartCutSceneMode() StartCutScene("bscut008")~ EXIT
END

IF WEIGHT #-1
~Global("bsAskedCoatBarrel","LOCALS",2)~ THEN coat_barrel_00
SAY @1264 /* ~Here you go. It should be fire proof enough to trap a fire elemental for at least a day.~ */
IF ~~ THEN DO ~EraseJournalEntry(@908) SetGlobal("bsAskedCoatBarrel","LOCALS",3) 
SetGlobal("bsFireElementQuest","GLOBAL",8)~ UNSOLVED_JOURNAL @909 EXIT
END

IF ~~ THEN coat_barrel_01
SAY @1267
IF ~~ THEN + coat_barrel
END

CHAIN
IF ~~ THEN ysfltchr coat_barrel_02
@1265 /* ~A barrel is not the wood structure I usually work with, but I am sure I could do that, yes. I'd need a Potion of Fire Resitance for it to work.~ */ DO ~SetGlobal("bsAskedCoatBarrel","LOCALS",1) AddJournalEntry(@908,QUEST)~
== ysfltchr IF ~Global("ys_GetFeathers","GLOBAL",1)~ THEN @1159 /* ~I assume you want me to do this urgently. Then here is the deal: you bring me the feathers from the cook before she throws them away, and I'll have time for your barrel.~ */ DO ~SetGlobal("ys_GetFeathers","GLOBAL",2) AddJournalEntry(@722,QUEST)~
== ysfltchr @1158 /* ~The time I can save with you bringing me the feathers will make up for the time I need to do this. It will be one favor for another.~ */
== ysfltchr IF ~Global("bsBarrelWithWater","GLOBAL",0)~ THEN @1266 /* ~If you keep the barrel after dealing with the fire elemental go and ask Garalt - the armorer - whether he wants it. I know he always has a use for fire proof equipment.~ */ DO ~SetGlobal("bsBarrelWithWater","GLOBAL",1) AddJournalEntry(@913,QUEST)~
EXIT
