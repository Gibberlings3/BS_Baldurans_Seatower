BEGIN bstanner

/* Doppelganger quest
Global("bsDoppTurnTower","GLOBAL",5)
*/

//---------------------------------------------------------
// general greeting after 3rd meeting
CHAIN
IF ~Global("bsTalkedToTanner","GLOBAL",2)~THEN bstanner GOSTORE
	@2500 /* ~Ah, you again.~ */
== bstanner IF ~Global("bsTannerQuest","GLOBAL",0)
GlobalGT("bsDoppelgangerQuest","GLOBAL",14)~ THEN @2663 /* ~In case you stumble upon good liqueur, I would be interested in three bottles. It makes the leather go softer - and it gives me a better smell while working on it. It doesn't matter what, just something strong and more exquisite than your ordinary bottle of red wine.~ */ DO ~AddJournalEntry(@874,QUEST) SetGlobal("bsTannerQuest","GLOBAL",5)~
END
IF ~~ THEN + general_lines

APPEND bstanner

IF ~~ THEN general_lines
SAY @2615 /* ~Do you want to buy something?~ */
	IF~Global("bsDoppelgangerQuest","GLOBAL",12)
PartyHasItem("bsdopdr")~THEN REPLY @2609 /* ~The stink does cover the whole tower grounds today. I might be in need to use this to spread a different fume.~ */ + doppelgangerquest
+ ~GlobalGT("bsTannerQuest","GLOBAL",0)
GlobalLT("bsTannerQuest","GLOBAL",10)
OR(3)
PartyHasItem("bsdpliqu")
PartyHasItem("bsdpliq1")
PartyHasItem("bsdpliq2")~ + @2616 /* ~I am here to bring you some liqueur.~ */+ liqueurquest
	IF~GlobalGT("bsTannerSport","GLOBAL",1)
GlobalLT("bsTannerSport","GLOBAL",4)~THEN REPLY /* ~I spoke to Captain Dungarth about your problems with the garrison soldiers.~ */ @2502 GOTO 200
	IF~~THEN REPLY @2501 /* ~Do you have anything for sale?~ */ GOTO 100
	IF~~THEN REPLY @2503 /* ~Not today.~ */ EXIT
END



//---------------------------------------------------------
// Open dialog
IF ~Global("bsTalkedToTanner","GLOBAL",0)~ THEN BEGIN 0
	SAY @2504 /* ~Yes?~ */
	IF~~THEN REPLY @2505 GOTO 1 /* ~Who are you?~ */
	IF~~THEN REPLY @2506 GOTO 2 /* ~What is this place? A tannery?~ */
	IF~~THEN REPLY @2555 GOTO 4 /* ~It does smell rather... strongly in here.~ */
	IF~~THEN REPLY @2507 GOTO 4 /* ~What is that awful stink in here?!~ */
	IF~~THEN REPLY @2554 /* ~Good day to you.~ */ EXIT
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 1
	SAY @2508 /* ~I'm the tanner. I produce all of the leather goods needed by the guards in the seatower.~ */
	IF~~THEN REPLY @2509 GOTO 2 /* ~So this is the tannery?~ */
	IF~~THEN REPLY @2555 GOTO 4 /* ~It does smell rather... strongly in here.~ */
	IF~~THEN REPLY @2507 GOTO 4 /* ~What is that awful stink in here?!~ */
	IF~~THEN REPLY @2602 /* ~I'm not interested in talking. Do you have anything for sale?~ */
		DO~SetGlobal("bsTalkedToTanner","GLOBAL",1)~
	GOTO 100
	IF~~THEN REPLY @2554 /* ~Good day to you.~ */ DO ~SetGlobal("bsTalkedToTanner","GLOBAL",1)~ EXIT
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 2
	SAY @2510 /* ~This is the tannery, yes. What else could it be?~ */
	IF~~THEN REPLY @2555 GOTO 3 /* ~It does smell rather... strongly in here.~ */
	IF~~THEN REPLY @2511 GOTO 3 /* ~But what is that awful stink in here?!~ */
	IF~~THEN REPLY @2602 /* ~I'm not interested in talking. Do you have anything for sale?~ */
		DO~SetGlobal("bsTalkedToTanner","GLOBAL",1)~
	GOTO 100
	IF~~THEN REPLY @2603 /* ~I need to get going.~ */ DO ~SetGlobal("bsTalkedToTanner","GLOBAL",1)~ EXIT
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 3
	SAY @2512 /* ~Look - we've established this is a tannery. Tanneries always smell.~ */
	IF~~THEN REPLY @2604 /* ~Yes, but why?~ */ GOTO 5.1
	IF~~THEN REPLY @2513 /* ~It smells like the back of the Blushing Mermaid at throwing out time. Or is that 'throwing up' time?~ */ GOTO 5
	IF~Global("bsDoppelgangerQuest","GLOBAL",12) PartyHasItem("bsdopdr")~THEN REPLY @2608 /* ~Without going into more details - the stink does cover the whole tower grounds today. I might be in need to use this to spread a different fume.~ */ DO ~SetGlobal("bsTalkedToTanner","GLOBAL",1)~ + doppelgangerquest
	IF~~THEN REPLY @2602 /* ~I'm not interested in talking. Do you have anything for sale?~ */
		DO~SetGlobal("bsTalkedToTanner","GLOBAL",1)~
	GOTO 100
	IF~~THEN REPLY @2603 /* ~I need to get going.~ */ DO ~SetGlobal("bsTalkedToTanner","GLOBAL",1)~ EXIT
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 4
	SAY @2514 /* ~Look - this is a tannery. Tanneries always smell.~ */
	IF~~THEN REPLY @2604 /* ~Yes, but why?~ */ GOTO 5.1
	IF~~THEN REPLY @2515 /* ~It smells like the back of the Low Lantern at throwing out time. Or is that 'throwing up' time?~ */ GOTO 5
	IF~Global("bsDoppelgangerQuest","GLOBAL",12) PartyHasItem("bsdopdr")~THEN REPLY @2608 /* ~Without going into more details - the stink does cover the whole tower grounds today. I might be in need to use this to spread a different fume.~ */ DO ~SetGlobal("bsTalkedToTanner","GLOBAL",1)~ + doppelgangerquest
	IF~~THEN REPLY @2516 /* ~Do you have anything for sale? The sooner I get out of this stink, the better.~ */
		DO~SetGlobal("bsTalkedToTanner","GLOBAL",1)~
	GOTO 100
	IF~~THEN REPLY @2554 /* ~Good day to you.~ */ DO~SetGlobal("bsTalkedToTanner","GLOBAL",1)~ EXIT
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 5
	SAY @2517 /* ~Ha! Close enough in both ways.~ */
	IF~~THEN GOTO 5.1
END

IF ~~ THEN BEGIN 5.1
	SAY @2605 /* ~That smell is the night water from most of the noble houses in Athkatla. For whatever reason legend has it that the night water from upper-class piss-pots is better for cleaning skins that the same product from the lower classes.~ */
	=@2518 /* ~It's all the same to me - it goes in one end, comes out the other and ends up in a bucket.~ */
	IF~~THEN REPLY @2519 /* ~It does what?!~ */ GOTO 6
	IF~~THEN REPLY @2520 /* ~I don't believe you.~ */ GOTO 6
	IF~~THEN REPLY @2606 /* ~What do you use this for?~ */ GOTO 6
	IF~Global("bsDoppelgangerQuest","GLOBAL",12) PartyHasItem("bsdopdr")~THEN REPLY @2608 /* ~Without going into more details - the stink does cover the whole tower grounds today. I might be in need to use this to spread a different fume.~ */ DO ~SetGlobal("bsTalkedToTanner","GLOBAL",1)~ + doppelgangerquest
	IF~~THEN REPLY @2516 /* ~Do you have anything for sale? The sooner I get out of this stink, the better.~ */
		DO~SetGlobal("bsTalkedToTanner","GLOBAL",1)~
	GOTO 100
	IF~~THEN REPLY @2554 /* ~Good day to you.~ */ DO~SetGlobal("bsTalkedToTanner","GLOBAL",1)~ EXIT
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 6
	SAY @2521 /* ~You have no idea how leather is made, do you?~ */
	IF~~THEN REPLY @2522 /* ~No. How?~ */ GOTO 7
	IF~~THEN REPLY @2556 /* ~Why don't you enlighten me?~ */ GOTO 7
	IF~~THEN REPLY @2607 /* ~Maybe I just want to know how you do it.~ */ GOTO 7
	IF~Global("bsDoppelgangerQuest","GLOBAL",12) PartyHasItem("bsdopdr")~THEN REPLY @2608 /* ~Without going into more details - the stink does cover the whole tower grounds today. I might be in need to use this to spread a different fume.~ */ DO ~SetGlobal("bsTalkedToTanner","GLOBAL",1)~ + doppelgangerquest
	IF~~THEN REPLY @2523 /* ~What I know is not important. Do you have anything for sale?~ */
		DO~SetGlobal("bsTalkedToTanner","GLOBAL",1)~
	GOTO 100
	IF~~THEN REPLY @2554 /* ~Good day to you.~ */ DO~SetGlobal("bsTalkedToTanner","GLOBAL",1)~ EXIT
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 7
	SAY @2524 /* ~The skins arrive in here still covered in hair, so I wash them in clean water for a few days to get the worst of the dirt off, then if the animal hasn't been skinned properly I have to remove the remains of the fat and flesh with a sharp knife.~ */
	=@2525 /* ~The skin goes into the tubs of night water for a few more days until the hairs get loose and I can scrape them off.~ */
	=@2526 /* ~After that, I spend a few hours working washing salts into the skins to make the finished leather soft and supple. The type of leather you end up with depends on which animal the skin came from. Simple, eh?~ */
	IF~!Race(Protagonist,GNOME)~THEN REPLY @2527 /* ~If you say so.~ */ GOTO 8
	IF~Race(Protagonist,GNOME)~THEN REPLY @2527 /* ~If you say so.~ */ GOTO 9
	IF~Global("bsDoppelgangerQuest","GLOBAL",12) PartyHasItem("bsdopdr")~THEN REPLY @2608 /* ~Without going into more details - the stink does cover the whole tower grounds today. I might be in need to use this to spread a different fume.~ */ DO ~SetGlobal("bsTalkedToTanner","GLOBAL",1)~ + doppelgangerquest
	IF~~THEN REPLY @2501 /* ~Do you have anything for sale?~ */
		DO~SetGlobal("bsTalkedToTanner","GLOBAL",1)~
	GOTO 100
	IF~~THEN REPLY @2554 /* ~Good day to you.~ */ DO~SetGlobal("bsTalkedToTanner","GLOBAL",1)~ EXIT
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 8
	SAY @2528 /* ~Yes, I do say so, stupid <PRO_RACE>. We gnomes know exactly what we're doing!~ */
	IF~Global("bsDoppelgangerQuest","GLOBAL",12) PartyHasItem("bsdopdr")~THEN REPLY @2609 /* ~The stink does cover the whole tower grounds today. I might be in need to use this to spread a different fume.~ */ DO ~SetGlobal("bsTalkedToTanner","GLOBAL",1)~ + doppelgangerquest
++ @2617 /* ~Easy now, hold your attitute, alright?!~ */ DO~SetGlobal("bsTalkedToTanner","GLOBAL",1)~ + reaction
	IF~~THEN REPLY @2501 /* ~Do you have anything for sale?~ */
		DO~SetGlobal("bsTalkedToTanner","GLOBAL",1)~
	GOTO 100
	IF~~THEN REPLY @2554 /* ~Good day to you.~ */ DO~SetGlobal("bsTalkedToTanner","GLOBAL",1)~ EXIT
END

IF ~~ THEN reaction
SAY @2618 /* ~Or what? Are you gonna report me to the guards? Don't worry, they don't need your complaints to make my life miserable.~ */
	IF~Global("bsDoppelgangerQuest","GLOBAL",12) PartyHasItem("bsdopdr")~THEN REPLY @2609 /* ~The stink does cover the whole tower grounds today. I might be in need to use this to spread a different fume.~ */ DO ~SetGlobal("bsTalkedToTanner","GLOBAL",1)~ + doppelgangerquest
	IF~~THEN REPLY @2501 /* ~Do you have anything for sale?~ */
		DO~SetGlobal("bsTalkedToTanner","GLOBAL",1)~
	GOTO 100
	IF~~THEN REPLY @2554 /* ~Good day to you.~ */ DO~SetGlobal("bsTalkedToTanner","GLOBAL",1)~ EXIT
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 9
	SAY @2529 /* ~I'm ashamed that you're a gnome if you didn't know something as simple as that! May Gond grant you enlightenment!~ */
	IF~Global("bsDoppelgangerQuest","GLOBAL",12) PartyHasItem("bsdopdr")~THEN REPLY @2609 /* ~The stink does cover the whole tower grounds today. I might be in need to use this to spread a different fume.~ */ DO ~SetGlobal("bsTalkedToTanner","GLOBAL",1)~ + doppelgangerquest
++ @2617 /* ~Easy now, hold your attitute, alright?!~ */ DO~SetGlobal("bsTalkedToTanner","GLOBAL",1)~ + reaction
	IF~~THEN REPLY @2501 /* ~Do you have anything for sale?~ */
		DO~SetGlobal("bsTalkedToTanner","GLOBAL",1)~
	GOTO 100
	IF~~THEN REPLY @2554 /* ~Good day to you.~ */ DO~SetGlobal("bsTalkedToTanner","GLOBAL",1)~ EXIT
END


//---------------------------------------------------------
IF ~Global("bsTalkedToTanner","GLOBAL",1)~ THEN BEGIN 20
	SAY @2530 /* ~Ah, you again. You got passed those awful guards okay?~ */
	IF~~THEN REPLY @2531 /* ~Yes, why?~ */ GOTO 21
	IF~~THEN REPLY @2660 /* ~"Awful guards"?~ */ GOTO 21
	IF~~THEN REPLY @2554 /* ~Good day to you.~ */ EXIT
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 21
	SAY @2532 /* ~They think it's good sport to make fun of us gnomes. The entrance to the tannery used to be through the East Tower but that was blocked up years ago after Nelanther pirates tried to capture the seatower. Now the only way down is the rope lift in Traitor's Tower.~ */
	IF~~THEN REPLY @2533 /* ~Ah.~ */ GOTO 30
	IF~~THEN REPLY @2557 /* ~What of it?~ */ GOTO 30.1
	IF~~THEN REPLY @2559 /* ~I don't think there's anything I can do about that.~ */ GOTO 33
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 30
	SAY @2534 /* ~Yes, 'ah'.~ */
	IF ~~ THEN + 30.1
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 30.1
	SAY @2558 /* ~One of their favourite tricks is to leave the winch suspended halfway down into the cave. Another is to just 'forget' that I'm here at all. After the second time they tried that I had the bed brought in by sea. It's never happened since.~ */
	=@2535 /* ~One of these days I swear I'm going to find somewhere else to work - somewhere that appreciates good leather.~ */
	IF~Race(Protagonist,GNOME)~THEN REPLY @2536 /* ~I could have a word with the garrison commander if that would help?~ */ GOTO 31
	IF~!Race(Protagonist,GNOME)~THEN REPLY @2536 /* ~I could have a word with the garrison commander if that would help?~ */ GOTO 32
	IF~~THEN REPLY @2559 /* ~I don't think there's anything I can do about that.~ */ GOTO 33
END

END//APPEND

//---------------------------------------------------------
CHAIN
IF ~~ THEN bstanner 31
	@2537 /* ~Tell me why he would listen to another gnome if he won't listen to me?~ */
== bstanner IF ~Global("bsDGTannersHelp","GLOBAL",1)~ THEN @2614 /* ~Because I am sure he's *not* all thankful and teary about my help with spreading that doppelganger magics. More realistic he'll try to turn that into a possibility to give me a warning about interfering with the tower's affairs!~ */
END
	IF~Global("bsDoppelgangerQuest","GLOBAL",12) PartyHasItem("bsdopdr")~THEN 
		UNSOLVED_JOURNAL @740
	REPLY @2610 /* ~Well - let's say there might be something you could do for the Garrison Commander. The stink does cover the whole tower grounds today. I might be in need to use this to spread a different fume.~ */
		DO~SetGlobal("bsTalkedToTanner","GLOBAL",2)
			 SetGlobal("bsTannerSport","GLOBAL",1)~
	GOTO doppelgangerquest
	IF~~THEN
		UNSOLVED_JOURNAL @740
		REPLY @2538 /* ~I'll try anyway. */ 
		DO~SetGlobal("bsTalkedToTanner","GLOBAL",2)
			 SetGlobal("bsTannerSport","GLOBAL",1)~
	GOTO thanks
	IF~~THEN 
		UNSOLVED_JOURNAL @747
		REPLY @2539 /* ~Good point. Everybody ignores us anyway - until they need something they think only we can invent...~ */
		DO~SetGlobal("bsTalkedToTanner","GLOBAL",2)
			SetGlobal("bsTannerSport","GLOBAL",1)~
	GOTO general_lines
	IF~~THEN 
		UNSOLVED_JOURNAL @747
		REPLY @2611 /* ~Maybe you are right.~ */
		DO~SetGlobal("bsTalkedToTanner","GLOBAL",2)
			 SetGlobal("bsTannerSport","GLOBAL",1)~ GOTO general_lines


//---------------------------------------------------------
CHAIN
IF ~~ THEN bstanner 32
	@2540 /* ~Hmm - with you being a <PRO_RACE> he might just listen to you. He certainly wouldn't listen to me.~ */
== bstanner IF ~Global("bsDGTannersHelp","GLOBAL",1)~ THEN @2614 /* ~Because I am sure he's *not* all thankful and teary about my help with spreading that doppelganger magics. More realistic he'll try to turn that into a possibility to give me a warning about interfering with the tower's affairs!~ */
END
	IF~Global("bsDoppelgangerQuest","GLOBAL",12) PartyHasItem("bsdopdr")~THEN 
		UNSOLVED_JOURNAL @740
	REPLY @2610 /* ~Well - let's say there might be something you could do for the Garrison Commander. The stink does cover the whole tower grounds today. I might be in need to use this to spread a different fume.~ */
		DO~SetGlobal("bsTalkedToTanner","GLOBAL",2)
			 SetGlobal("bsTannerSport","GLOBAL",1)~
	GOTO doppelgangerquest
	IF~~THEN 
		UNSOLVED_JOURNAL @740
		REPLY @2601 /* I'll see what I can do. */
		DO~SetGlobal("bsTalkedToTanner","GLOBAL",2)
			 SetGlobal("bsTannerSport","GLOBAL",1)~ + thanks
	IF~~THEN
		UNSOLVED_JOURNAL @747
		REPLY @2541 /* ~Never mind. The chances are he wouldn't listen to me either.~ */
		DO~SetGlobal("bsTalkedToTanner","GLOBAL",2)
			 SetGlobal("bsTannerSport","GLOBAL",1)~
	GOTO general_lines



//---------------------------------------------------------
CHAIN
IF ~~ THEN bstanner 33
	@2600 /* ~I didn't *expect* you to do anything about that! Captain of the Guard Dungarth is who'd need to clear his men's heads, but he certainly wouldn't listen to me.~ */
== bstanner IF ~Global("bsDGTannersHelp","GLOBAL",1)~ THEN @2614 /* ~Because I am sure he's *not* all thankful and teary about my help with spreading that doppelganger magics. More realistic he'll try to turn that into a possibility to give me a warning about interfering with the tower's affairs!~ */
END
	IF~Race(Protagonist,GNOME)~THEN REPLY @2536 /* ~I could have a word with the garrison commander if that would help?~ */ GOTO 31
	IF~!Race(Protagonist,GNOME)~THEN REPLY @2536 /* ~I could have a word with the garrison commander if that would help?~ */ GOTO 32
	IF~~THEN
		UNSOLVED_JOURNAL @747
		REPLY @2541 /* ~Never mind. The chances are he wouldn't listen to me either.~ */
		DO~SetGlobal("bsTalkedToTanner","GLOBAL",2)
			 SetGlobal("bsTannerSport","GLOBAL",1)~
	GOTO general_lines
	IF~~THEN 
		UNSOLVED_JOURNAL @747
		REPLY @2613 /* ~I came for something else.~ */
		DO~SetGlobal("bsTalkedToTanner","GLOBAL",2)
			 SetGlobal("bsTannerSport","GLOBAL",1)~ + general_lines
	IF~~THEN 
		UNSOLVED_JOURNAL @747
		REPLY @2554 /* ~Good day to you.~ */
		DO~SetGlobal("bsTalkedToTanner","GLOBAL",2)
			 SetGlobal("bsTannerSport","GLOBAL",1)~ EXIT


//---------------------------------------------------------

APPEND bstanner 

IF ~~ THEN thanks
SAY @2612 /* ~Then thank you in advance for trying, I suppose.~ */
IF ~~ THEN + general_lines
END
//---------------------------------------------------------

IF ~~ THEN BEGIN 100
	SAY @2542 /* ~As it happens, yes.~ */
  IF ~~ THEN DO ~StartStore("bstanner",LastTalkedToBy())~ EXIT
END

IF ~~ THEN BEGIN 101
	SAY @2553 /* ~The goods are over there.~ */
  IF ~~ THEN DO ~StartStore("bstanner",LastTalkedToBy())~ EXIT
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 200
	SAY @2543 /* ~Oh yes? He isn't going to do anything, is he?~ */
	IF~Global("bsTannerSport","GLOBAL",2)~THEN REPLY @2544 /* ~Just the opposite, in fact! He's promised to look into it and to make sure it doesn't happen again.~ */ GOTO 204
	IF~Global("bsTannerSport","GLOBAL",3)~THEN REPLY @2546 /* ~Not quite, but not too far wrong. He says he'll have a word with the garrison soldiers but can't promise that it won't happen again.~ */GOTO 205
	IF~Global("bsTannerSport","GLOBAL",4)~THEN REPLY @2545 /* ~No.~ */ GOTO 203
END


//---------------------------------------------------------
IF ~~ THEN BEGIN 203
	SAY @2547 /* ~I told you so.~ */
IF ~~ THEN DO ~EraseJournalEntry(@741)
		EraseJournalEntry(@742)
		EraseJournalEntry(@743)
			 AddexperienceParty(1000)
		   SetGlobal("bsTannerSport","GLOBAL",5)~ SOLVED_JOURNAL @744 EXIT
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 204
	SAY @2549 /* ~Now that's an unexpected and pleasant surprise! Thank you!~ */
IF ~~ THEN DO ~EraseJournalEntry(@741)
		EraseJournalEntry(@742)
		EraseJournalEntry(@743)
			 AddexperienceParty(1000)
		   SetGlobal("bsTannerSport","GLOBAL",5)~ SOLVED_JOURNAL @745 EXIT
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 205
	SAY @2551 /* ~That's about as good as I can expect, I suppose. Well, that's more than I ever achieved.~ */
IF ~~ THEN DO ~EraseJournalEntry(@741)
		EraseJournalEntry(@742)
		EraseJournalEntry(@743)
			 AddexperienceParty(1000)
		   SetGlobal("bsTannerSport","GLOBAL",5)~ SOLVED_JOURNAL @746 EXIT
END

//------------------------------------------------------------
/* Doppelgangerquest */
IF ~~ THEN doppelgangerquest
SAY @2619 /* ~You want what?! I live on the brim of being kicked out from the tower completely as it is for just doing my work and now you want me to spread stink on *purpose*?!~ */
++ @2620 /* ~The tower fights a doppelganger infestation currently. I have this liquid here that will draw them out if the fumes would be spread across the whole tower grounds.~ */ + doppelgangerquest_01
++ @2621 /* ~Maybe it wasn't such a good idea. Do you have anything for sale?~ */ + 100
++ @2552 /* ~Never mind then.~ */ EXIT 
END

IF ~~ THEN doppelgangerquest_01
SAY @2622 /* ~Ah, so you thought "the tanner's stink is malfesting itself all over the tower anyway, so he can spread this additional stink, too"?!~ */
++ @2623 /* ~Well... yes, actually.~ */ + doppelgangerquest_03
++ @2625 /* ~Spreading these fumes would help the tower guard, actually.~ */ + doppelgangerquest_02
++ @2626 /* ~Could you? It needs to be done via fume, not by burning it. If we could just put it in whatever you are preparing currently...~ */ + doppelgangerquest_04
++ @2621 /* ~Maybe it wasn't such a good idea. Do you have anything for sale?~ */ + 100
++ @2552 /* ~Never mind then.~ */ EXIT 
END

IF ~~ THEN doppelgangerquest_02
SAY @2627 /* ~So *you* say, but the Guard Commander will find something to blame me for afterwards, you can take my word for that!~ */
++ @2628 /* ~...Please? It needs to be done via fume, not by burning it. If we could just put it in whatever you are preparing currently...~ */ + doppelgangerquest_04
++ @2629 /* ~We'd just use one of your full tubs.~ */ + doppelgangerquest_04
++ @2621 /* ~Maybe it wasn't such a good idea. Do you have anything for sale?~ */ + 100
++ @2552 /* ~Never mind then.~ */ EXIT 
END

IF ~~ THEN doppelgangerquest_03
SAY @2630 /* ~Ahh, this is just too good to be true! And yes, that was sarcasm!~ */
++ @2624 /* ~You're predestined for this! All these years listening to the unfriendly remarks, and today of all days the wind direction, the inversive weather conditions - all perfect for this purpose to turn this into something useful! When will you have the opportunity to laugh into the captain's face again like this?~ */ + doppelgangerquest_02
++ @2625 /* ~Spreading these fumes would help the tower guard, actually.~ */ + doppelgangerquest_02
++ @2628 /* ~...Please? It needs to be done via fume, not by burning it. If we could just put it in whatever you are preparing currently...~ */ + doppelgangerquest_04
++ @2629 /* ~We'd just use one of your full tubs.~ */ + doppelgangerquest_04
++ @2621 /* ~Maybe it wasn't such a good idea. Do you have anything for sale?~ */ + 100
++ @2552 /* ~Never mind then.~ */ EXIT 
END

IF ~~ THEN doppelgangerquest_04
SAY @2631 /* ~WHAT?! You want to spoil one of my tubs with that stuff?~ */
++ @2632 /* ~Well - duh?~ */ + doppelgangerquest_05_1
++ @2635 /* ~Look, it doesn't smell much for normal people. The smell is more irritating for doppelgangers.~ */ + doppelgangerquest_05
++ @2633 /* ~I will compensate you for it.~ */ + doppelgangerquest_06
++ @2634 /* ~Man, are you always that disobliging? The guard is fighting doppelgangers as we speak!~ */ + doppelgangerquest_07
++ @2621 /* ~Maybe it wasn't such a good idea. Do you have anything for sale?~ */ + 100
++ @2552 /* ~Never mind then.~ */ EXIT 
END

IF ~~ THEN doppelgangerquest_05
SAY @2636 /* ~It's irritating the hells out of me already, I tell you! I will not risk spoiling a whole load of my leather with that, no way!~ */
++ @2633 /* ~I will compensate you for it.~ */ + doppelgangerquest_06
++ @2634 /* ~Man, are you always that disobliging? The guard is fighting doppelgangers as we speak!~ */ + doppelgangerquest_07
++ @2638 /* ~You better help us now or you'll regret it, gnome!~ */ + doppelgangerquest_08
++ @2621 /* ~Maybe it wasn't such a good idea. Do you have anything for sale?~ */ + 100
++ @2552 /* ~Never mind then.~ */ EXIT 
END

IF ~~ THEN doppelgangerquest_05_1
SAY @2637 /* ~Now explain to me again what I will get out of this?~ */
++ @2633 /* ~I will compensate you for it.~ */ + doppelgangerquest_06
++ @2634 /* ~Man, are you always that disobliging? The guard is fighting doppelgangers as we speak!~ */ + doppelgangerquest_07
++ @2638 /* ~You better help us now or you'll regret it, gnome!~ */ + doppelgangerquest_08
++ @2621 /* ~Maybe it wasn't such a good idea. Do you have anything for sale?~ */ + 100
++ @2552 /* ~Never mind then.~ */ EXIT 
END

IF ~~ THEN doppelgangerquest_06
SAY @2639 /* ~Compensating? I hope you don't think you could just give me some gold and that's it. I need to treat my skins properly or they'll rot! I have orders to fulfill!~ */
++ @2640 /* ~What would you want me to do as compensation?~ */ + doppelgangerquest_10
++ @2641 /* ~What do you want then? Should I collect the night waters from the soldiers? Or maybe take a leak into that tub over there, eh?!~ */ + doppelgangerquest_09
++ @2621 /* ~Maybe it wasn't such a good idea. Do you have anything for sale?~ */ + 100
++ @2552 /* ~Never mind then.~ */ EXIT 
END

IF ~~ THEN doppelgangerquest_07
SAY @2642 /* ~Yes, and I wish them all the good luck there is! I also understand that you don't *need* to spread these fumes to handle it!~ */
++ @2633 /* ~I will compensate you for it.~ */ + doppelgangerquest_06
++ @2638 /* ~You better help us now or you'll regret it, gnome!~ */ + doppelgangerquest_08
++ @2621 /* ~Maybe it wasn't such a good idea. Do you have anything for sale?~ */ + 100
++ @2552 /* ~Never mind then.~ */ EXIT 
END

IF ~~ THEN doppelgangerquest_08
SAY @2643 /* ~Oh, what would you do? Kill me, the Seatower Tanner? You think you'd come away with this? Oh, or even better - go complain to the Guard Commander? (laughs bitterly) And what would that change, eh?~ */
++ @2633 /* ~I will compensate you for it.~ */ + doppelgangerquest_06
++ @2621 /* ~Maybe it wasn't such a good idea. Do you have anything for sale?~ */ + 100
++ @2552 /* ~Never mind then.~ */ EXIT 
END

IF ~~ THEN doppelgangerquest_09
SAY @2644 /* ~Ha! You wish.~ */
IF ~~ THEN + doppelgangerquest_10
END

IF ~~ THEN doppelgangerquest_10
SAY @2645 /* ~I have enough night water. But I want compensation for the good stuff I put in there with it. Stop grinnin', I'm talking about liqueur. It makes the leather go softer - and it gives me a better smell while working on 'em.~ */
= @2646 /* ~Bring me at least three bottles of liqueur. It doesn't matter what, just something strong and more exquisite than your ordinary bottle of red wine.~ */
++ @2647 /* ~Fine, I'll see what I'll find.~ */ + doppelgangerquest_11
+ ~OR(3)
PartyHasItem("bsdpliqu")
PartyHasItem("bsdpliq1")
PartyHasItem("bsdpliq2")~ + @2648 /* ~You mean something like this?~ */ + doppelgangerquest_12
++ @2621 /* ~Maybe it wasn't such a good idea. Do you have anything for sale?~ */ + 100
++ @2552 /* ~Never mind then.~ */ EXIT 
++ @2649 /* ~Listen. You either help us demask the doppelgangers on the tower grounds or I'll make sure you'll lose a lot more than one batch today.~ */ + doppelgangerquest_10_1
END

IF ~~ THEN doppelgangerquest_10_1
SAY @2650 /* ~Woah, woah, easy there! Fine, fine! I'll do it, now tone it down you unfriendly <PRO_MANWOMAN>. Being bullied by every bully, that's just my life's luck.~ */
IF ~~ THEN DO ~SetGlobal("bsTannerQuest","GLOBAL",10)~ + doppelgangerquest_13
END

IF ~~ THEN doppelgangerquest_11
SAY @2651 /* ~Don't make it cheap, you hear? Five hours of work for naught, and I'm sure the damn Guard won't even appreciate it!~ */
IF ~~ THEN DO ~SetGlobal("bsTannerQuest","GLOBAL",1)~ UNSOLVED_JOURNAL @876 + doppelgangerquest_13
END

IF ~~ THEN doppelgangerquest_12
SAY @2652 /* ~Hmm! Yes, that's a good one. Give that to me in a minute when I'm done *ruining* my perfect batch.~ */
IF ~~ THEN + doppelgangerquest_11
END

IF ~~ THEN doppelgangerquest_13
SAY @2653 /* ~(sigh) Oh well. I surely hope Gond agrees to spoiling a good batch like this...~ */
IF ~~ THEN DO ~SetInterrupt(FALSE) TakePartyItem("bsdopdr") DestroyItem("bsdopdr") SetGlobal("bsDoppelgangerQuest","GLOBAL",13) ClearAllActions() StartCutSceneMode() StartCutScene("bscut005")~ EXIT
END

IF WEIGHT #-1
~Global("bsDoppelgangerQuest","GLOBAL",13)~ THEN doppelgangerquest_14
SAY @2654 /* ~There you go. Let me know whether it worked. I can't wait to put it into the Guard Commander's face when next he'll complain about tannery stink.~ */
IF ~~ THEN DO ~EraseJournalEntry(@860)
EraseJournalEntry(@862) EraseJournalEntry(@863)
SetGlobalTimer("bsDoppelgangerQuestTimer","GLOBAL",ONE_DAY)
SetGlobal("bsDoppelgangerQuest","GLOBAL",14)
SetGlobal("bsDoppelgangerInTower","GLOBAL",4)
SetGlobal("bsDGTannersHelp","GLOBAL",1)~ UNSOLVED_JOURNAL @864 EXIT
END

END //APPEND


CHAIN
IF ~~ THEN bstanner liqueurquest
@2655 /* ~Hm? Oh yes, I see.~ */
== bstanner IF ~PartyHasItem("bsdpliqu")~ THEN @2656 /* ~"Herb Liqueur".~ */ DO ~IncrementGlobal("bsTannerQuest","GLOBAL",1) AddexperienceParty(150)~
== bstanner IF ~PartyHasItem("bsdpliqu")~ THEN @2657 /* ~Not bad. Rich flavor.~ */ DO ~TakePartyItem("bsdpliqu") DestroyItem("bsdpliqu")~
== bstanner IF ~PartyHasItem("bsdpliq1")~ THEN @2658 /* ~"Calimshan Plum Liqueur".~ */ DO ~IncrementGlobal("bsTannerQuest","GLOBAL",1) AddexperienceParty(150)~
== bstanner IF ~PartyHasItem("bsdpliq1")~ THEN @2659 /* ~That's a nice one indeed.~ */ DO ~TakePartyItem("bsdpliq1") DestroyItem("bsdpliq1")~
== bstanner IF ~PartyHasItem("bsdpliq2")~ THEN @2660 /* ~"Amnian Bitter Liqueur".~ */ DO ~IncrementGlobal("bsTannerQuest","GLOBAL",1) AddexperienceParty(150)~
== bstanner IF ~PartyHasItem("bsdpliq2")~ THEN @2661 /* ~Yes, this will do.~ */  DO ~TakePartyItem("bsdpliq2") DestroyItem("bsdpliq2")~
== bstanner @2662 /* ~Let me stow this away so the guard idiots don't see it when they come in here.~ */
END
IF ~~ THEN EXIT
/* PC brings them for compensation - no pay */
IF ~Global("bsTannerQuest","GLOBAL",2)~ THEN DO ~EraseJournalEntry(@876)~ UNSOLVED_JOURNAL @877 EXIT
IF ~Global("bsTannerQuest","GLOBAL",3)~ THEN DO ~EraseJournalEntry(@876) EraseJournalEntry(@877)~ UNSOLVED_JOURNAL @878 EXIT
IF ~Global("bsTannerQuest","GLOBAL",4)~ THEN DO ~EraseJournalEntry(@874) EraseJournalEntry(@876) EraseJournalEntry(@877) EraseJournalEntry(@878) SetGlobal("bsTannerQuest","GLOBAL",10)~ SOLVED_JOURNAL @879 EXIT

/* PC brings them as quest - gets pay */
IF ~Global("bsTannerQuest","GLOBAL",6)~ THEN DO ~GiveGoldForce(100) EraseJournalEntry(@876)~ UNSOLVED_JOURNAL @877 EXIT
IF ~Global("bsTannerQuest","GLOBAL",7)~ THEN DO ~GiveGoldForce(100) EraseJournalEntry(@876) EraseJournalEntry(@877)~ UNSOLVED_JOURNAL @878 EXIT
IF ~Global("bsTannerQuest","GLOBAL",8)~ THEN DO ~GiveGoldForce(100) EraseJournalEntry(@874) EraseJournalEntry(@876) EraseJournalEntry(@877) EraseJournalEntry(@878) SetGlobal("bsTannerQuest","GLOBAL",10)~ SOLVED_JOURNAL @879 EXIT
