BEGIN ysmcook1

CHAIN
IF ~Global("bsCookSawDwarf","GLOBAL",0)
OR(6)
Race(Player1,DWARF)
Race(Player2,DWARF)
Race(Player3,DWARF)
Race(Player4,DWARF)
Race(Player5,DWARF)
Race(Player6,DWARF)~ THEN ~YSMCOOK1~ dwarffun
@1227 /* ~Hey you! Dwarf! The alestore's locked so you can get your dirty carcass out of my kitchen NOW!!!~ */ DO ~SetGlobal("bsCookSawDwarf","GLOBAL",1)~
== %KAGAIN_JOINED% IF ~InParty("Kagain") See("Kagain") !StateCheck("Kagain",CD_STATE_NOTVALID)~ THEN @1243 /* ~Shut yer yap woman. Yer making me ears hurt and me axe twitchy.~ */
= @1242 /* ~I wouldn't want yer dirty ale if it was the last drop in Baldur's Gate and <HESHE> wouldn't either. Yer storeroom's probably got more rats in it than fleas on a mangy cur.~ */
== ~YSMCOOK1~ IF ~InParty("Kagain") See("Kagain") !StateCheck("Kagain",CD_STATE_NOTVALID)~ THEN @1220 /* ~Right, you hairy little runt!~ */ 
== %YESLICK_JOINED% IF ~InParty("Kagain") See("Kagain") !StateCheck("Kagain",CD_STATE_NOTVALID)
InParty("Yeslick") See("Yeslick") !StateCheck("Yeslick",CD_STATE_NOTVALID)~ THEN @1240 /* ~One day, Kagain, I swear by Clangeddin's Beard that mouth of yours is going to stop my axe.~ */
== %KAGAIN_JOINED% IF ~InParty("Kagain") See("Kagain") !StateCheck("Kagain",CD_STATE_NOTVALID)
InParty("Yeslick") See("Yeslick") !StateCheck("Yeslick",CD_STATE_NOTVALID)~ THEN @1241 /* ~Heh! An' that'll be the day the sun shines out of yer arse too. Bend over and we'll take a look, shall we?~ */
== %YESLICK_JOINED% IF ~InParty("Yeslick") See("Yeslick") !StateCheck("Yeslick",CD_STATE_NOTVALID)~ THEN @1247 /* ~Yeslick Orothiar at your service ma'am. May Clangeddin Silverbeard give his blessing upon you.~ */ == ~YSMCOOK1~ IF ~InParty("Yeslick") See("Yeslick") !StateCheck("Yeslick",CD_STATE_NOTVALID)~ THEN @1223 /* ~Well now, isn't that a surprise? A dwarf with manners!~ */
== ~YSMCOOK1~ IF ~InParty("Yeslick") See("Yeslick") !StateCheck("Yeslick",CD_STATE_NOTVALID)
!RACE(Player1,DWARF)~ THEN @1228 /* ~Yes, well. Be welcome then Yeslick Orothiar - but ye can still keep yer hands off my alestore!~ */
== %YESLICK_JOINED% IF ~InParty("Yeslick") See("Yeslick") !StateCheck("Yeslick",CD_STATE_NOTVALID) !RACE(Player1,DWARF)~ THEN @1246 /* ~Dwarf - yes, but a thief - no. I am sorry if other members of dwarfkind have given you a bad impression of all of us.~ */
END

/* PC talked to cook before */
+ ~!Race(Player1,DWARF) GlobalGT("bsFireElementQuest","GLOBAL",0)~ + @1205 /* ~I beg your pardon?~ */ + dwarf_alestore
+ ~ GlobalGT("bsFireElementQuest","GLOBAL",0)Global("bsFireElementQuest","GLOBAL",0) InParty("Kagain") See("Kagain") !StateCheck("Kagain",CD_STATE_NOTVALID)~ + @1221 /* ~Kagain! Back off! There's enough trouble around here already without you and your mouth causing more!~ */ + dwarf_alestore

/* PC never talked to cook before */
+ ~Global("bsFireElementQuest","GLOBAL",0)~ + @1205 /* ~I beg your pardon?~ */ + dwarf_what
+ ~Global("bsFireElementQuest","GLOBAL",0) InParty("Kagain") See("Kagain") !StateCheck("Kagain",CD_STATE_NOTVALID)~ + @1221 /* ~Kagain! Back off! There's enough trouble around here already without you and your mouth causing more!~ */ + 10
+ ~!Race(Player1,DWARF) Global("bsFireElementQuest","GLOBAL",0)~ + @1233 /* ~But... but...~ */ + 10
+ ~Race(Player1,DWARF) Global("bsFireElementQuest","GLOBAL",0)~ + @1225 /* ~I am <CHARNAME>, at your service.~ */ + dwarffun_01
+ ~Race(Player1,DWARF) Global("bsFireElementQuest","GLOBAL",0)~ + @1231 /* ~But I haven't done anything!~ */ + dwarffun_02
++ @2058 /* ~You are aware that your boss is a dwarf, right?~ */ + dwarffun_03

APPEND ysmcook1

IF ~~ THEN dwarf_alestore
SAY @1236 /* ~Och, had I known you'd bring a *dwarf* into me kitchen I'd not let ye near me alestore! Make 'm behave, will ye?!~ */
IF ~~ THEN EXIT
IF ~GlobalGT("bsFireElementQuest","GLOBAL",9)~ THEN + fire_elemental_gone
END

IF ~~ THEN dwarf_what
SAY @1235 /* ~Didn't I tell you to get out.  I don't want any dwarf in my kitchen; can't you get that through yer thick skull.~ */
+ ~InParty("Kagain") See("Kagain") !StateCheck("Kagain",CD_STATE_NOTVALID)~ + @1221 /* ~Kagain! Back off! There's enough trouble around here already without you and your mouth causing more!~ */ + 10
+ ~!Race(Player1,DWARF)~ + @1233 /* ~But... but...~ */ + 10
+ ~Race(Player1,DWARF)~ + @1225 /* ~I am <CHARNAME>, at your service.~ */ + dwarffun_01
+ ~Race(Player1,DWARF)~ + @1231 /* ~But I haven't done anything!~ */ + dwarffun_02
++ @2058 /* ~You are aware that your boss is a dwarf, right?~ */ + dwarffun_03
END

/* fire elemental quest */
IF ~Global("bsFireElementQuest","GLOBAL",9)
PartyHasItem("bsbarrl4")~ THEN fe_in_barrel
SAY @1237 /* ~OUT of my kitchen with that fire thing NOW!!~ */
IF ~~ THEN EXIT
END

END //APPEND

CHAIN
IF ~GlobalGT("bsFireElementQuest","GLOBAL",9)
GlobalLT("bsFireElementQuest","GLOBAL",14)~ THEN ysmcook1 fire_elemental_gone
@1238 /* ~Ye helped me fine down there, <GIRLBOY>.~ */
== ysmcook1 IF ~Race(Player1,DWARF)~ THEN @2059 /* ~You're a fine dwarf. A real fine one.~ */
== ysmcook1 IF ~Global("ys_HalfslingerAle","GLOBAL",3) Global("bsFreeAle","LOCALS",1)~ THEN @1239 /* ~I promised you a pot of ale for that *Halfslinger*. Here it is - just tell him not to come looking for any more. He's still not forgiven.~ */ DO ~GiveItemCreate("ysalepot",Player1,0,0,0) SetGlobal("ys_HalfslingerAle","GLOBAL",4)~
== ysmcook1 IF ~Global("ys_HalfslingerAle","GLOBAL",3) Global("bsFreeAle","LOCALS",0)~ THEN @1239 /* ~I promised you a pot of ale for that *Halfslinger*. Here it is - just tell him not to come looking for any more. He's still not forgiven.~ */ DO ~GiveItemCreate("ysalepot",Player1,0,0,0) TakePartyGold(5) SetGlobal("ys_HalfslingerAle","GLOBAL",4)~
== ysmcook1 IF ~Global("bsFireElementQuest","GLOBAL",12)~ THEN @1209 /* ~That's not the first I poured, though. The first one was for the nice soldier doing the actual *work*.~ */
== ysmcook1 @1244 /* ~And here is an ale for you. Don't tell me ye don't want it. And don't you let that Halfslinger talk ye into givin' him that!!~ */
END
IF ~~ THEN DO ~GiveItemCreate("bsalepo2",Player1,0,0,0) 
EraseJournalEntry(@730)
SetGlobal("bsFireElementQuest","GLOBAL",14)~ UNSOLVED_JOURNAL @732 EXIT

APPEND ysmcook1

IF ~True()~ THEN BEGIN greeting
	SAY @1190 /* ~Whaddya want? I'm busy. Ask the apprentice.~ */
// Fletcher quest
	IF~Global("ys_GetFeathers","GLOBAL",2)~THEN REPLY@1212 /* ~The fletcher says you've got two plump geese to pluck and she'd like the feathers for her arrows.~ */ GOTO 11
// Halfslinger quest
	IF~Global("ys_HalfslingerAle","GLOBAL",2)~THEN REPLY @1191 /* ~Er.. the apprentice there says you might give me a pot of ale.~ */ GOTO 21
	IF~~THEN REPLY @1192 /* ~Nothing.~ */ EXIT
END

IF ~~ THEN dwarffun_01
SAY @1226 /* ~So you say, but ye can still keep yer hands off my alestore!~ */
++ @1231 /* ~But I haven't done anything!~ */ + dwarffun_02
++ @2058 /* ~You are aware that your boss is a dwarf, right?~ */ + dwarffun_03
END

IF ~~ THEN dwarffun_02
SAY @1232 /* ~Not yet you 'aven't but I know very well you're after the keys to my alestore. That's all dwarves want - drink and the more they can get, the better. And what happens when they get drunk? Trouble - that's what. And everything in sight gets broken. You want to know why I don't like dwarves? That's why!~ */
IF ~~THEN + 10
END

IF ~~ THEN dwarffun_03
SAY @1234 /* ~OUT!!!!~ */
IF ~~ THEN EXIT
END


IF ~~THEN BEGIN 10
	SAY@1211 /* ~Look - I'm busy - very busy. Next person to disturb me gets my ladle round his ear'ole - do you understand? Food to be cooked, ale to be poured - whaddya want anyway?~ */
// Fletcher quest
	IF~Global("ys_GetFeathers","GLOBAL",2)~THEN REPLY@1212 /* ~The fletcher says you've got two plump geese to pluck and he'd like the feathers for his arrows.~ */ GOTO 11

// Halfslinger quest
	IF~Global("ys_HalfslingerAle","GLOBAL",2)
Global("bsFireElementQuest","GLOBAL",0)~THEN REPLY @1191 /* ~Er.. the apprentice there says you might give me a pot of ale.~ */ GOTO 21

	IF~~THEN REPLY@1192 /* ~Nothing.~ */ EXIT
END


IF~~THEN BEGIN 11
	SAY@1213 /* ~Feathers, is it? Feathers? Pah! The apprentice there's in charge of plucking geese. It's about the only thing she can do, short of emptying the slops bucket. Go talk to her - and leave me ALONE!!!~ */
	IF~~THEN
		DO~EraseJournalEntry(@720) EraseJournalEntry(@722) SetGlobal("ys_GetFeathers","GLOBAL",3)~ UNSOLVED_JOURNAL @724
		EXIT
END

IF ~~ THEN BEGIN 21
	SAY @1193 /* ~Ale? ALE, is it? And what gives you that idea?~ */
	IF~Global("bs_AleConversation","LOCALS",0)~THEN REPLY @1194 /* ~It's not for me actually.~ */  DO ~SetGlobal("bs_AleConversation","LOCALS",1)~ GOTO 22
	IF~Global("bs_AleConversation","LOCALS",1)~THEN REPLY @1198 /* ~It's for Halfslinger. He asked me to get him one.~ */ GOTO 24
	IF~~THEN REPLY @1195 /* ~I can't be bothered with this.~ */ EXIT
END

END //APPEND

CHAIN
IF ~~ THEN ysmcook1 22
@1197 /* ~If it ain't for you, who's it for?~ */
== ysmcook1 IF ~GlobalLT("bsCookSawDwarf","GLOBAL",2) Race(Player1,DWARF)~ THEN @1214 /* ~Me, talking to a dwarf about ale...~ */ 
== ysmcook1 IF ~GlobalLT("bsCookSawDwarf","GLOBAL",2) 
	OR(5)
		Race(Player2,DWARF)
		Race(Player3,DWARF)
		Race(Player4,DWARF)
		Race(Player5,DWARF)
		Race(Player6,DWARF)~ THEN @1196 /* ~'An get that dirty dwarf outta my kitchen!~ */ 
== ~%KAGAIN_JOINED%~ IF~GlobalLT("bsCookSawDwarf","GLOBAL",2)
InParty("Kagain") See("Kagain") !StateCheck("Kagain",CD_STATE_NOTVALID)~THEN @1245 /* ~Watch yer mouth woman. I 'ad a bath two years ago when I fell in the Chionthar.~ */
== ~%YESLICK_JOINED%~ IF~GlobalLT("bsCookSawDwarf","GLOBAL",2)
InParty("Yeslick") See("Yeslick") !StateCheck("Yeslick",CD_STATE_NOTVALID)~THEN @1248 /* ~Madam! I may be a dwarf but I assure ye I'm not dirty!~ */
== ysmcook1 IF ~GlobalLT("bsCookSawDwarf","GLOBAL",2) 
	OR(6)
		Race(Player1,DWARF)
		Race(Player2,DWARF)
		Race(Player3,DWARF)
		Race(Player4,DWARF)
		Race(Player5,DWARF)
		Race(Player6,DWARF)~ THEN @1199 /* ~I got no patience with ale-swilling dwarves!~ */ DO ~SetGlobal("bsCookSawDwarf","GLOBAL",2)~
END
	IF~~THEN REPLY @1198 /* ~It's for Halfslinger. He asked me to get him one.~ */ GOTO 24
	+ ~GlobalLT("bsCookSawDwarf","GLOBAL",2) 
	OR(6)
		Race(Player1,DWARF)
		Race(Player2,DWARF)
		Race(Player3,DWARF)
		Race(Player4,DWARF)
		Race(Player5,DWARF)
		Race(Player6,DWARF)~ + @1216 /* ~You really don't like dwarves, do you?~ */ + dwarffun_03
	IF~~THEN REPLY @1195 /* ~I can't be bothered with this.~ */ EXIT

APPEND ysmcook1

IF ~~ THEN BEGIN 24
	SAY @1201 /* ~Do you know what happened the last time I found that halfling in my alestore?~ */
	IF~~THEN REPLY @1200 /* ~No...~ */ GOTO 25
	IF~~THEN REPLY @1195 /* ~I can't be bothered with this.~ */ EXIT
END

IF ~~ THEN BEGIN 25
	SAY @1202 /* ~He was dead drunk with his head under the tap of the best ale in Baldur's Gate an' the tap was running. Half a barrel of Golden Dragon straight down the drain! I 'ope the fish had a good party because he didn't!~ */
	IF~CheckStatGT(Player1,14,CHR)
!Race(Player1,DWARF)~THEN REPLY @1203 /* ~Ohh, right. Are you sure..?~ */ GOTO 26
	IF~CheckStatLT(Player1,15,CHR) !Race(Player1,DWARF)
Global("bs_OfferedCookKiss","MYAREA",1)~THEN REPLY @1203 /* ~Ohh, right. Are you sure..?~ */ GOTO 27
	IF~CheckStatLT(Player1,15,CHR) 
Global("bs_OfferedCookKiss","MYAREA",0) !Race(Player1,DWARF)~THEN REPLY @1203 /* ~Ohh, right. Are you sure..?~ */ GOTO 28
	IF~Race(Player1,DWARF)~THEN REPLY @1203 /* ~Ohh, right. Are you sure..?~ */ GOTO 28
	IF~~THEN REPLY @1195 /* ~I can't be bothered with this.~ */ EXIT
END

IF ~~ THEN BEGIN 26
	SAY @1204 /* ~*sigh* Look, you seem a good sort to me.~ */
	IF ~~ THEN DO ~SetGlobal("bsFreeAle","LOCALS",1)~ + fire_elemental
END

IF ~~ THEN BEGIN 27
	SAY @1206 /* ~*If* I was to pour an ale for that halfling, it'll cost ye - five gold pieces or a kiss. I 'eard ye talking to the apprentice over there.~ */
	IF~~THEN REPLY @1207 /* ~*KISS*~ */ GOTO 29
	IF~~THEN REPLY @1208 /* ~Five gold pieces it is.~ */ GOTO fire_elemental
	++ @1217 /* ~"If"? What else is hindering you?~ */ + fire_elemental
	IF~~THEN REPLY @1195 /* ~I can't be bothered with this.~ */ EXIT
END

IF ~~ THEN BEGIN 28
	SAY @1215 /* ~*If* I was to pour an ale for that halfling, it'll cost ye five gold pieces.~ */
	IF~~THEN REPLY @1208 /* ~Five gold pieces it is.~ */ GOTO fire_elemental
	++ @1217 /* ~"If"? What else is hindering you?~ */ + fire_elemental
	IF~~THEN REPLY @1195 /* ~I can't be bothered with this.~ */ EXIT
END

IF ~~ THEN BEGIN 29
	SAY @1210 /* ~*giggle* Now that was a pleasant surprise!~ */
	IF ~~ THEN DO ~SetGlobal("bsFreeAle","LOCALS",1)~ + fire_elemental
END

IF ~~ THEN fire_elemental
SAY @1218 /* ~The problem is that the alestore is blocked - one 'o them damn fire things came out of the oven this morn' and I just barely managed to lock it into the storeroom. I haven't opened the door since.~ */
++ @1219 /* ~A fire elemental? You have a fire elemental in the cellar?~ */ + fire_elemental_01
++ @1222 /* ~Oh.~ */ + fire_elemental_01
++ @1224 /* ~Sooo - I guess you want me to remove it for you?~ */ + fire_elemental_01
	IF~~THEN REPLY @1195 /* ~I can't be bothered with this.~ */ EXIT
END

IF ~~ THEN fire_elemental_01
SAY @1229 /* ~I know it will make some damage but it's so damp down there I'm sure it won't last long. But if you want that *ale* now ye'd have to get rid of it first.~ */
IF ~~ THEN + fire_elemental_02
END

IF ~~ THEN fire_elemental_02
SAY @1230 /* ~(sigh) Know what - you are the fighting sort, are ye not? I'll open the door for you, maybe you can take care of the fire creature 'n spare me the scolding from the captain, ey? But watch where ye going down there, it's to that fire monster and out again, don't you go near the supplies - and if I see ye approaching the alestore it will be my ladle round your ear'ole I swear!~ */
IF ~~ THEN DO ~SetGlobal("bsFireElementQuest","GLOBAL",1)
SetGlobal("ys_HalfslingerAle","GLOBAL",3)~ UNSOLVED_JOURNAL @901 /* ~Fire Elemental in the Seatower Storeroom

There is a fire elemental in the storeroom adjacent to the Seatower Kitchen. The cook unlocked the door so I can take care of it - somehow.~ */ EXIT
END

END //APPEND