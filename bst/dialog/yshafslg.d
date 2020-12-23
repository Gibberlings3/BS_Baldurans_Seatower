BEGIN YSHAFSLG

// -----------------------------------------------------
CHAIN
IF ~Global("ys_HalfslingerAle","GLOBAL",4)
PartyHasItem("ysalepot")~ THEN YSHAFSLG 17
	@1334 /* A pot of Golden Dragon ale! How did you do it? No, I don't care! A real pot of Golden Dragon - mmmmm.~ */ DO ~TakePartyItem("ysalepot") DestroyItem("ysalepot")~ 
== ~%KAGAIN_JOINED%~ IF ~InParty("kagain") InMyArea("kagain") !StateCheck("kagain",CD_STATE_NOTVALID)~ THEN @1343 /* ~Heh. A man after me own 'eart. Or halfling.~ */
END	
+ ~Race(Player1,DWARF)~ + @1314 /* ~How could you send me on an errand to that cook? I'M A DWARF YOU STINKING IDIOT!~ */ + dwarf
IF~~THEN REPLY @1335 /* ~I'd make that last if I were you. There's no more where that came from.~ */ GOTO 18
++ @1337 /* ~The cook made it pretty clear that's the last ale for you for a very long time. You shouldn't show your face in the kitchen for now, to be precise.~ */ + 20
++ @1349 /* ~You have your ale - the last one I might add, at least from this cook. Now give me my sling.~ */ + 20

APPEND YSHAFSLG

IF ~~ THEN dwarf
SAY @1350 /* ~Well... at least you know now why I'm avoiding to go into that kitchen - at least for now!~ */
++ @1351 /* ~Indeed, and that's the wiser choice. There's no more where that came from.~ */ GOTO 18
++ @1337 /* ~The cook made it pretty clear that's the last ale for you for a very long time. You shouldn't show your face in the kitchen for now, to be precise.~ */ + 20
++ @1349 /* ~You have your ale - the last one I might add, at least from this cook. Now give me my sling.~ */ + 20
END

// -----------------------------------------------------------------
IF ~GlobalGT("ys_TalkedToHalfslinger","LOCALS",0)
GlobalLT("ys_TalkedToHalfslinger","LOCALS",4)
		Global("ys_HalfslingerAle","GLOBAL",0)~ THEN BEGIN 100
	SAY @1280 /* ~So do you want to buy any slings today or not? And I could still do with that help.~ */
	IF~Global("ys_TalkedToHalfslinger","LOCALS",1)~THEN REPLY @1281 /* ~I give up. What do you want?~ */ GOTO 12
	IF~Global("ys_TalkedToHalfslinger","LOCALS",2)~THEN REPLY @1327 /* ~If I get this pot of ale, you'll give me the copy of Arla's Dragonbane?~ */ GOTO 15
	IF~~THEN REPLY @1282 /* ~Just show me the goods.~ */ GOTO OpenStore
	+ ~GlobalGT("bsInquisitorsWork","GLOBAL",1)
Global("bsNoticesInquisitor","LOCALS",0)~ + @1345 /* ~You are the tower's interrogator?~ */ DO ~SetGlobal("bsNoticesInquisitor","LOCALS",1)~ + inquisitor_ask_01
	++ @1291 /* ~Well, good day to you, Halfslinger.~ */ EXIT
END

// -----------------------------------------------------------------
IF ~Global("ys_TalkedToHalfslinger","LOCALS",0)~ THEN BEGIN 1
	SAY @1284 /* ~'Allo!~ */
	IF~~THEN REPLY @1285 /* ~Who are you?~ */ DO ~SetGlobal("ys_TalkedToHalfslinger","LOCALS",1)~ GOTO 3
	+ ~GlobalGT("bsInquisitorsWork","GLOBAL",1)
Global("bsNoticesInquisitor","LOCALS",0)~ + @1346 /* ~I recognize you! You're the tower's interrogator.~ */ DO ~SetGlobal("ys_TalkedToHalfslinger","LOCALS",1) SetGlobal("bsNoticesInquisitor","LOCALS",1)~ + inquisitor_ask
	IF~~THEN REPLY @1286 /* ~Be quiet! I ask the questions first.~ */ GOTO 2
END

IF ~~ THEN BEGIN 2
	SAY @1287 /* ~Another halfling-hater eh? Fine. The door's that way.~ */
	IF~~THEN EXIT
END

IF ~~ THEN BEGIN 3
	SAY @1288 /* ~Tomi. Tomi of Gullykin but mostly I gets called Halfslinger.~ */
	IF~~THEN REPLY @1290 /* ~Why 'Halfslinger'?~ */ GOTO 5
	IF~~THEN REPLY @1289 /* ~Halfslinger. Right. I'm not even going to ask.~ */ GOTO 4
	++ @1291 /* ~Well, good day to you, Halfslinger.~ */ EXIT
END

IF ~~ THEN BEGIN 4
	SAY @1297 /* ~Ask what?~ */
	IF~~THEN REPLY @1298 /* ~Just forget it.~ */ GOTO 7
	IF~~THEN REPLY @1290 /* ~Why 'Halfslinger'?~ */ GOTO 5
END

IF ~~ THEN BEGIN 5
	SAY @1299 /* ~Because I'm a halfling and I'm good with the sling, you blind idiot! Huuh. How many more dumb adventurers are going to ask that question, eh?~ */
	IF~~THEN REPLY @1300 /* ~How do you know I'm an adventurer?~ */ GOTO 6
	IF~~THEN REPLY@1301 /* ~I knew I was going to regret asking...~ */ GOTO 7
	++ @1292 /* ~You don't hold back do you?~ */ + 7
END

IF ~~ THEN BEGIN 6
	SAY @1302 /* ~You come in here armed to the teeth and ask that?~ */
	IF~~THEN REPLY@1303 /* ~Right... I think we're even on the dumb question score.~ */ GOTO 7
	IF~~THEN REPLY@1301 /* ~I knew I was going to regret asking...~ */ GOTO 7
	++ @1292 /* ~You don't hold back do you?~ */ + 7
END

IF ~~ THEN BEGIN 7
	SAY @1304 /* ~So what can I do for you?~ */
	IF~~THEN REPLY@1305 /* ~What can you do for me? I haven't got a clue.~ */ GOTO 8
	++ @1293 /* ~You could tell me what it is you could do for me.~ */ + 8
	IF~~THEN REPLY@1306 /* ~Nothing, good bye.~ */ EXIT
END

IF ~~ THEN BEGIN 8
	SAY @1307 /* ~The name is Half-Slinger, yes? What do you think I make?~ */
	IF~~THEN REPLY@1308 /* ~Ohhh.~ */ GOTO 9
	++ @1294 /* ~So you make slings and what you said before was a jest at my expense.~ */ + 9
	IF~~THEN REPLY@1309 /* ~You irritating little halfling. You irritating little SHORTARSE. Do you do anything but wind people up?~ */ GOTO 90
END

IF ~~ THEN BEGIN 90
	SAY @1310 /* ~Just saying. You don't have to buy anything from me.~ */
	IF~~THEN REPLY@1282 /* ~Just show me the goods.~ */ GOTO 9
	IF~~THEN REPLY@1311 /* ~This time, I don't think I'll bother. I'll be going now.~ */ EXIT
END

IF ~~ THEN BEGIN 9
	SAY @1312 /* ~Look, before I show you what I have for sale, can you help me? I'll give you a discount!~ */
= @1318 /* ~I've got some lovely slings here - the best on this side of the Sword Coast. Honest. There's even a good copy of Arla's Dragonbane and it's just as deadly as the original.~ */ 
	IF~GlobalGT("ys_GetFeathers","GLOBAL",2)~THEN REPLY@1313 /* ~Just tell me it doesn't involve that bloody cook again!~ */ GOTO 10
	IF~GlobalGT("ys_TalkedToFletcher","GLOBAL",0)~THEN REPLY @1319 /* ~Just like the fletcher has the best bows and arrows north of 'Purskal', I suppose.~ */ GOTO 12
	+ ~GlobalGT("ys_TalkedToBlacksmith","GLOBAL",0)~ + @1295 /* ~Just like the armorer has the finest arms and armor in Baldur's Gate - and then says he'll sell them cheaper than anywhere else, I suppose.~ */ + 12
	++ @1344 /* ~What is it you want?~ */ + 12
	IF~~THEN REPLY @1320 /* ~NO! Just show me the goods!~ */ GOTO OpenStore
END

IF ~~ THEN BEGIN 10
	SAY @1315 /* ~Well... yes, it does.~ */
= @1296 /* ~Oh. So you've, er... made your own experiences, I gather.~ */
IF ~~ THEN + 12
END

END //APPEND

CHAIN
IF ~~ THEN YSHAFSLG 12
	@1321 /* ~All I want is a pot of ale. You could try talking to the cook's apprentice first. It might not be quite as bad as talking to the cook.~ */ DO ~SetGlobal("ys_TalkedToHalfslinger","LOCALS",2)~
== ~%KAGAIN_JOINED%~ IF ~InParty("kagain") InMyArea("kagain") !StateCheck("kagain",CD_STATE_NOTVALID)~ THEN @1342 /* ~Ale, is it? Hey, <CHARNAME> ye can get me a couple while you're at it. Six would be better.~ */
END
	IF~~THEN REPLY @1322 /* ~So why don't you go and ask for one?~ */ GOTO 13
	IF~OR(2)
GlobalGT("ys_GetFeathers","GLOBAL",2)
GlobalGT("bsCookSawDwarf","GLOBAL",0)~THEN REPLY @1316 /* ~I'm going to regret this. I know I'm going to regret this. That woman eats adventurers for a snack!~ */ GOTO 13
	IF~GlobalGT("bsCookSawDwarf","GLOBAL",0)~THEN REPLY @1323 /* ~Still, that cook guards the alestore like a dragon on a gold heap.~ */ GOTO BuyGoods
	IF~GlobalGT("bsCookSawDwarf","GLOBAL",0)~THEN REPLY @1317 /* ~No. I'm going nowhere near that ladle-wielding harriden again. Nowhere near. NO.~ */ GOTO BuyGoods
	IF~~THEN REPLY @1331 /* ~No, I'm not getting involved in this.~ */ GOTO BuyGoods

APPEND YSHAFSLG

IF ~~ THEN BEGIN 13
	SAY @1324 /* ~The problem is... the last time I wanted a pot of ale I tried to steal it and I got caught in the aleroom.~ */
	IF~~THEN REPLY @1325 /* ~Dead drunk, I suppose?~ */ GOTO 14
	IF~~THEN REPLY @1327 /* ~If I get this pot of ale, you'll give me the copy of Arla's Dragonbane?~ */ GOTO 15
	IF~GlobalGT("bsCookSawDwarf","GLOBAL",0)~THEN REPLY @1317 /* ~No. I'm going nowhere near that ladle-wielding harriden again. Nowhere near. NO.~ */ GOTO BuyGoods
	IF~~THEN REPLY @1331 /* ~No, I'm not getting involved in this.~ */ GOTO BuyGoods
END

IF ~~ THEN BEGIN 14
	SAY @1326 /* ~Something like that.~ */
	IF~~THEN REPLY @1327 /* ~If I get this pot of ale, you'll give me the copy of Arla's Dragonbane?~ */ GOTO 15
	IF~GlobalGT("bsCookSawDwarf","GLOBAL",0)~THEN REPLY @1317 /* ~No. I'm going nowhere near that ladle-wielding harriden again. Nowhere near. NO.~ */ GOTO BuyGoods
	IF~~THEN REPLY @1331 /* ~No, I'm not getting involved in this.~ */ GOTO BuyGoods
END

IF ~~ THEN BEGIN 15
	SAY @1329 /* ~A pot of ale isn't worth that much - ! Is it?~ */
	IF~~THEN REPLY @1330 /* ~You tell me.~ */ GOTO 16
++ @1328 /* ~I think I like the idea. It's your decision how much that ale is worth to you.~ */ + 16
	IF~~THEN REPLY @1331 /* ~No, I'm not getting involved in this.~ */ GOTO BuyGoods
END

IF ~~ THEN BEGIN 16
	SAY @1332 /* ~For a <RACE> you sure drive a hard bargain. Alright - the sling for the ale.~ */
	IF~~THEN
	UNSOLVED_JOURNAL @730
	DO ~SetGlobal("ys_TalkedToHalfslinger","LOCALS",3)
			SetGlobal("ys_HalfslingerAle","GLOBAL",1)~ GOTO BuyGoods
END

IF ~~ THEN BEGIN 18
	SAY @1336 /* ~Ah, but there is - there always is!~ */
	IF ~~ THEN + 20
END


IF ~~ THEN BEGIN 20
	SAY @1338 /* ~*BELCH* Here's your sling an' good luck with it.~ */
	IF~~THEN DO ~GiveItemCreate("ysalbane",Player1,0,0,0) EraseJournalEntry(@730) SetGlobal("ys_HalfslingerAle","GLOBAL",5)~
	SOLVED_JOURNAL @731
	EXIT
END

// -----------------------------------------------------------------
IF ~True()~ THEN BEGIN BuyGoods
	SAY @1340 /* ~So do you want to buy any slings today or not?~ */
	IF~~THEN REPLY @1339 /* ~Yes.~ */GOTO OpenStore
	IF~~THEN REPLY @1283 /* ~No.~ */ EXIT
	+ ~GlobalGT("bsInquisitorsWork","GLOBAL",1)
Global("bsNoticesInquisitor","LOCALS",0)~ + @1345 DO ~SetGlobal("bsNoticesInquisitor","LOCALS",1)~ + inquisitor_ask_02
END

IF ~~ THEN BEGIN OpenStore
  SAY @1341 /* ~Store's over here.~ */
  IF ~~ DO~StartStore("yshafslg",LastTalkedToBy())~ EXIT
END


IF ~~ THEN BEGIN inquisitor_ask
	SAY @1347 /* ~Ah, yes, we met. But let me introduce myself properly, yes?~ */
	IF~~THEN + 3
END

IF ~~ THEN BEGIN inquisitor_ask_01
	SAY @1348 /* ~Ah, yes, we met. Well, a man has to earn a living, yes?~ */
	IF~~THEN + 100
END

IF ~~ THEN BEGIN inquisitor_ask_02
	SAY @1348 /* ~Ah, yes, we met. Well, a man has to earn a living, yes?~ */
	IF~~THEN + BuyGoods
END

//-------------------------------------------------------------------

END //APPEND

