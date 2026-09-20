BEGIN ~ysfltchr~

// ------------------------------------------------------------------
// Got the feathers
IF ~PartyHasItem("ysgoosef") Global("ys_GetFeathers","GLOBAL",4)~THEN BEGIN 7
	SAY @1160 /* ~You have the feathers! Beautiful - they'll make fine fletchings for my arrows. Here - it's not much but you did save me the climb up the tower!~ */
	= @1268 /* ~You generally get around a lot, don't you? If, by any chance, you'll find a good piece of wood, just bring it here. I'm always on the lookout for new material.~ */
	IF~~THEN DO~TakePartyItem("ysgoosef")
		DestroyItem("ysgoosef")
		GiveItemCreate("arow02",Player1,10,0,0)
		EraseJournalEntry(@723)
		AddJournalEntry(@100167,QUEST)
		SetGlobal("bs_FletchersStaff","GLOBAL",1)
		SetGlobal("ys_GetFeathers","GLOBAL",5)~ SOLVED_JOURNAL @721 /* ~The Fletcher's Feathers

The fletcher has her feathers and I have some new arrows.~ */
		EXIT
	IF ~GlobalLT("bsFireElementQuest","GLOBAL",8)
PartyHasItem("bsbarrl1") Global("bsAskedCoatBarrel","LOCALS",1)
PartyHasItem("POTN02")~ THEN DO~TakePartyItem("ysgoosef")
		DestroyItem("ysgoosef")
		GiveItemCreate("arow02",Player1,10,0,0)
		EraseJournalEntry(@723)
		AddJournalEntry(@100167,QUEST)
		SetGlobal("bs_FletchersStaff","GLOBAL",1)
		SetGlobal("ys_GetFeathers","GLOBAL",5)~ SOLVED_JOURNAL @721 /* ~The Fletcher's Feathers

The fletcher has her feathers and I have some new arrows.~ */ + coat_barrel_01
END

// ------------------------------------------------------------------
//very first greeting
IF ~Global("ys_TalkedToFletcher","GLOBAL",0)~THEN BEGIN 0
	SAY @1168 /* ~Matha the Fletcher at your service. What can I do for you?~ */
	IF~~THEN REPLY @1169 /* ~A fletcher eh? I see more than just arrows here.~ */ GOTO 1
	IF~~THEN REPLY @1161 /* ~I assume you sell things?~ */ GOTO 1
	IF~~THEN REPLY @1170 /* ~I'll be leaving, good day to you.~ */ EXIT
END

/* PC has Suth Wood */
IF ~PartyHasItem("bssuthwd") GlobalLT("bs_FletchersStaff","GLOBAL",3)~ THEN suthwood
SAY @1269 /* ~Oh, what a nice piece of wood! This is Suth wood, isn't it? It looks like it had time to dry for a long time undisturbed. I would like to buy this from you. I'd offer you 600 gold for this fine piece. Yes, it is too hard for a bow. But I always dreamed of tinkering with other weapons of wood. This looks ideal for a staff.~ */
IF ~~ THEN DO ~SetGlobal("bs_FletchersStaff","GLOBAL",3)~ EXIT
END

/* Sturdy Staff is Ready */
IF ~GlobalTimerExpired("bs_FletchersStaffTimer","GLOBAL")
Global("bs_FletchersStaff","GLOBAL",4)~ THEN fletchers_staff
SAY @1270 /* ~I finished the staff! It is the first one I'd offer for selling, but it is not the first one I made. It is a good staff and worth its price. I would sell it to you, if you are interested! Just let me know.~ */
IF ~~ THEN DO ~EraseJournalEntry(@100169)
SetGlobal("bs_FletchersStaff","GLOBAL",5)~ SOLVED_JOURNAL @100170 EXIT
END

// ------------------------------------------------------------------
// after feather quest was given
IF ~GlobalGT("ys_TalkedToFletcher","GLOBAL",0)
		GlobalGT("ys_GetFeathers","GLOBAL",1)~THEN BEGIN 100
	SAY @1163 /* ~Good day again. What can I get you?~ */

/* quest fire elemental in storeroom */
+ ~GlobalLT("bsFireElementQuest","GLOBAL",8)
PartyHasItem("bsbarrl1") Global("bsAskedCoatBarrel","LOCALS",0)~ + @1260 /* ~Would you coat this barrel with a fire proof layer from the inside? It needs to withhold a trapped fire elemental for a certain time.~ */ + coat_barrel_02
+ ~Global("ys_GetFeathers","GLOBAL",5)
GlobalLT("bsFireElementQuest","GLOBAL",8)
PartyHasItem("bsbarrl1") Global("bsAskedCoatBarrel","LOCALS",1)
PartyHasItem("POTN02")~ + @1261 /* ~I have all ingredients now. Please coat the barrel so that it is fire proof.~ */ + coat_barrel
/* Suth Wood */
+ ~PartyHasItem("bssuthwd") Global("bs_FletchersStaff","GLOBAL",3)~ + @1271 /* ~I'll sell the Suth timer to you.~ */ + sell_suth_timber
+ ~Global("bs_FletchersStaff","GLOBAL",5)~ + @1272 /* ~I'd like to see that staff you made.~ */ + sell_staff
+ ~Global("bs_FletchersStaff","GLOBAL",8)~ + @1273 /* ~The armorer would change the staff you made to a spear, but he doesn't want to step on your toes with this, that's why I am mentioning it.~ */ + ask_about_armorer_update

	IF~~THEN REPLY @1164 /* ~Let me see your shop.~ */ GOTO 8
	IF~~THEN REPLY @1165 /* ~Nothing.~ */ EXIT
END

IF ~~ THEN sell_suth_timber
SAY @1274 /* ~Great! Thank you so much. Here is your gold. Come back in a few days, I might have something ready.~ */
IF ~~ THEN DO ~ActionOverride("ysfltchr",TakePartyItem("bssuthwd"))
ActionOverride("ysfltchr",DestroyItem("bssuthwd"))
GiveGoldForce(600)
EraseJournalEntry(@100168)
SetGlobalTimer("bs_FletchersStaffTimer","GLOBAL",ONE_DAY)
SetGlobal("bs_FletchersStaff","GLOBAL",4)~ UNSOLVED_JOURNAL @100169 EXIT
END

IF ~~ THEN sell_staff
SAY @1275 /* ~Sure, it is my pleasure!~ */
  IF ~~ THEN DO ~StartStore("ysfltch2",LastTalkedToBy())~ EXIT
END


IF ~~ THEN ask_about_armorer_update
SAY @1276 /* ~He - he would do that? Oh, my!~ */
++ @1277 /* ~It would be a truly terrific thing to be able to wield your weapon as a spear. I do not mean any disrespect.~ */ + ask_about_armorer_update_01
++ @1278 /* ~Wait - is that a blush I see there?~ */ + ask_about_armorer_update_02
++ @1279 /* ~Do I get an answer?~ */ + ask_about_armorer_update_02
++ @1900 /* ~You sold the staff to me, it is my decision what to do with it. It's mere courtesy I am mentioning this to you.~ */ + ask_about_armorer_update_01
END

IF ~~ THEN ask_about_armorer_update_01
SAY @1901 /* ~Oh - oh, no, you misunderstand my reaction.~ */
IF ~~ THEN + ask_about_armorer_update_02
END

IF ~~ THEN ask_about_armorer_update_02
SAY @1902 /* ~I know I made a truly fine weapon, but that *he* considers working with it... That is a thought that makes me, ah -~ */
++ @1903 /* ~Yes?~ */ + ask_about_armorer_update_03
++ @1904 /* ~Blush. It's obvious now.~ */ + ask_about_armorer_update_03
++ @1905 /* ~Spit it out, woman.~ */ + ask_about_armorer_update_03
END

IF ~~ THEN ask_about_armorer_update_03
SAY @1906 /* ~*Very* happy, because it means that he, a master of his trade, considers it a good weapon. */
++ @1907 /* ~You have no idea. He was thrilled, I could tell as much.~ */ + ask_about_armorer_update_05
++ @1908 /* ~Or he likes the creator of this staff very much. Did you actually talk to each other in the recent past? It might be a good idea with all the obvious affection between you two.~ */ + ask_about_armorer_update_05
++ @1909 /* I lost my patience with this conversation. I told you and that's it.~ */ + ask_about_armorer_update_04
END

IF ~~ THEN ask_about_armorer_update_04
SAY @1910 /* ~You have my full consent to have the staff reworked. Tell him thank you.~ */
IF ~~ THEN DO ~EraseJournalEntry(@100172) SetGlobal("bs_FletchersStaff","GLOBAL",9)~ UNSOLVED_JOURNAL @100173 EXIT
END

IF ~~ THEN ask_about_armorer_update_05
SAY @1911 /* ~Oh! Er, um... My, it's hot in here, all of a sudden, is it not?~ */
IF ~~ THEN + ask_about_armorer_update_04
END

// ------------------------------------------------------------------
// Quest conversation was cut off before quest was given
IF ~GlobalGT("ys_TalkedToFletcher","GLOBAL",0)~THEN BEGIN 101
	SAY @1166 /* ~Good day again. What can I get you? And - I could do with some help if you're willing?~ */
+ ~Global("ys_GetFeathers","GLOBAL",1)~ + @1178 /* ~I already said no.~ */ + 101_1
+ ~Global("ys_GetFeathers","GLOBAL",1)~ + @1253 /* ~Alright, fine. I'll get the feathers for you.~ */ + 6
+ ~Global("ys_GetFeathers","GLOBAL",2)~ + @1254 /* ~I'm on it.~ */ + 101_2
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
	SAY @1171 /* ~The finest arrows and the finest bows in Amn. Take your pick - if you have the gold, of course.~ */
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
	SAY @1173 /* ~[Spelling error in name is on purpose!] Well... alright. Baldur's Gate then. I don't really know how good the bows and arrows are in -say- Purskal.~ */
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
	SAY @1179 /* ~Why, yes it does. Is there a problem with her?~ */
	IF~~THEN REPLY@1180 /* ~Is there a problem? I take it you've never spoken to the cook? Or her apprentice?~ */ GOTO 41
++ @1258 /* ~No, not really.~ */ + 4
	IF~~THEN REPLY @1257 /* ~I don't have time right now for extra errands.~ */ GOTO 5
END

IF ~~THEN BEGIN 41
	SAY @1182 /* ~Not recently - I take my meals with the guards. So I can talk to them and see if my goods are doing their job.~ */
	IF~~THEN REPLY@1183 /* ~Alright. Forget it. What do you need?~ */ GOTO 4
	IF~~THEN REPLY@1257 /* ~I don't have time right now for extra errands.~ */ GOTO 5
END

IF ~~THEN BEGIN 4
	SAY @1184 /* ~I'm almost out of feathers for my next batch of arrows. I happen to know that the tower cook has a fine pair of plump geese for tonight's meal. Would you go and ask her for the feathers? I'd do it myself but I'm stuck here waiting for a shipment of arrow shafts.~ */
	IF~~THEN REPLY@1185 /* ~I can do that.~ */ GOTO 6
	IF~~THEN REPLY@1257 /* ~I don't have time right now for extra errands.~ */ GOTO 5
	IF~~THEN REPLY@1186 /* ~I'm not running around after you - do it yourself.~ */GOTO 5
END

IF ~~THEN BEGIN 5
	SAY @1187 /* ~Oh well. It was worth asking.~ */
IF ~~ THEN DO ~SetGlobal("ys_GetFeathers","GLOBAL",1)~ + 6_1
END

IF ~~THEN BEGIN 6
	SAY @1188 /* ~Thank you, thank you!~ */
IF ~~ THEN DO ~SetGlobal("ys_GetFeathers","GLOBAL",2)~ UNSOLVED_JOURNAL @720 + 6_1
END

IF ~~THEN BEGIN 6_1
	SAY @1259 /* ~Is there anything I can do for you?~ */
COPY_TRANS_LATE ysfltchr 100
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
== ysfltchr IF ~Global("ys_GetFeathers","GLOBAL",0)~ THEN @1184 /* ~I'm almost out of feathers for my next batch of arrows. I happen to know that the tower cook has a fine pair of plump geese for tonight's meal. Would you go and ask her for the feathers? I'd do it myself but I'm stuck here waiting for a shipment of arrow shafts.~ */
= @1159 /* ~I assume you want me to do this urgently. Then here is the deal: you bring me the feathers from the cook before she throws them away, and I'll have time for your barrel.~ */ DO ~SetGlobal("ys_GetFeathers","GLOBAL",2) AddJournalEntry(@722,QUEST)~
= @1158 /* ~The time I can save with you bringing me the feathers will make up for the time I need to do this. It will be one favor for another.~ */
== ysfltchr IF ~Global("bsBarrelWithWater","GLOBAL",0)~ THEN @1266 /* ~If you keep the barrel after dealing with the fire elemental go and ask Garalt - the armorer - whether he wants it. I know he always has a use for fire proof equipment.~ */ DO ~SetGlobal("bsBarrelWithWater","GLOBAL",1) AddJournalEntry(@913,QUEST)~
EXIT
