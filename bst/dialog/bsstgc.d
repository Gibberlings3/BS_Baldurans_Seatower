BEGIN bsstgc


//---------------------------------------------------------
/* reaktion zu Missing Monk quest */

IF ~Global("bsAirardTalkedMissingMonk","LOCALS",0)
OR(2)
Global("bsMissingMonk","GLOBAL",4)
Global("bsMissingMonk","GLOBAL",5)~ THEN missingmonk
SAY @2739 /* ~Ah, it was you who found the missing monk and therefore helped us find the guilt of one of our soldiers. It's hard, knowing one of my soldiers did this, and out of greed, as it seems. Our thanks be with you. If you haven't already, the Seatower Commander and the Monastery Abbot wanted to talk to you about it, too.~ */
IF ~~ THEN DO ~SetGlobal("bsAirardTalkedMissingMonk","LOCALS",1)~ EXIT
END


//---------------------------------------------------------
// Initial meeting
IF ~True()~ THEN BEGIN 0
	SAY @2700 /* ~Yes?~ [BSSTGC] */

/* Doppelganger quest - Reply options */
+ ~Global("bsDoppelgangerQuest","GLOBAL",6)~ + @2701 /* ~Is there anything I can do here to help?~ */ + doppelgangerquest_01
+ ~Global("bsDoppelgangerQuest","GLOBAL",6) !Race(Protagonist,GNOME)~ + @2709 /* ~I'll be on my way.~ */ + doppelgangerquest_02
+ ~Global("bsDoppelgangerQuest","GLOBAL",6) Race(Protagonist,GNOME)~ + @2709 /* ~I'll be on my way.~ */ + doppelgangerquest_02_1

+ ~Global("bsDoppelgangerQuest","GLOBAL",9)~ + @2710 /* ~I am ready to fight the doppelgangers now. Bring them on.~ */ + doppelgangerquest_08
+ ~Global("bsDoppelgangerQuest","GLOBAL",9)~ + @2711 /* ~About fighting doppelgangers...~ */ + doppelgangerquest_04

+ ~NumDeadGT("bsdopp07",0)
GlobalGT("bsDoppelgangerQuest","GLOBAL",11)
GlobalLT("bsDoppelgangerQuest","GLOBAL",14)~ + @2712 /* ~I found some doppelgangers but I will stop looking now.~ */ + dg_search_04
+ ~Global("bsDoppelgangerInTower","GLOBAL",5)
GlobalGT("bsDoppelgangerQuest","GLOBAL",11)
GlobalLT("bsDoppelgangerQuest","GLOBAL",14)~ + @2713 /* ~I think I found all of them. At least I can't find any more.~ */ + dg_search_07
+ ~GlobalGT("bsDoppelgangerQuest","GLOBAL",11)
GlobalLT("bsDoppelgangerQuest","GLOBAL",14)~ + @2709 /* ~I'll be on my way.~ */ + dg_search_03
+ ~Global("bsDoppTurnTower","GLOBAL",0)
GlobalGT("bsDoppelgangerQuest","GLOBAL",11)
GlobalLT("bsDoppelgangerQuest","GLOBAL",14)~ + @2714 /* ~I won't help with your doppelganger problem. You'll have to solve it yourselves!~ */ + dg_search_02

/* tanner's mobbing quest - Reply options */
	IF~Global("bsTannerSport","GLOBAL",1)~THEN REPLY @2703 /* ~I've been talking to the tanner and he tells me that he's being bullied by the guards.~ */ GOTO 9

/* fire elemental in the kitchen storeroom */
+ ~GlobalGT("bsFireElementQuest","GLOBAL",0)
GlobalLT("bsFireElementQuest","GLOBAL",9)
Global("bsAskedFireElement","GLOBAL",0)~ + @2715 /* ~There is a fire elemental in the kitchen's storeroom...~ */ DO ~SetGlobal("bsAskedFireElement","GLOBAL",1)~ + fire_elemental

/* normal greetings dialogue */
	IF~Global("bsTalkedToDungarth","LOCALS",0)~THEN DO ~SetGlobal("bsTalkedToDungarth","LOCALS",1)~ REPLY @2704 /* ~Who are you?~ */ GOTO 1
	IF~Global("bsTalkedToDungarth","LOCALS",1)~THEN REPLY @2702 /* ~What is it that you do again? I thought the Captain of the Seatower was in charge?~ */ GOTO 200

	++ @2730 /* ~Good day to you.~ */ EXIT
END

IF ~~ THEN BEGIN 1
	SAY @2705 /* ~Dungarth is my name - Captain Dungarth. I'm the Garrison Commander here.~ */
	IF~Global("bsTannerSport","GLOBAL",1)~THEN REPLY @2703 /* ~I've been talking to the tanner and he tells me that he's being bullied by the guards.~ */ GOTO 9
	IF~~THEN REPLY @2706 /* ~What does the Garrison Commander do? I thought the Captain of the Seatower was in charge?~ */ GOTO 200
	++ @2730 /* ~Good day to you.~ */ EXIT
END

IF ~~ THEN BEGIN 200
	SAY @2707 /* ~He is. My job is to organise the Tower Guards, make sure everyone behaves themselves and to re-unite lost children with whichever parent still wants them.~ */
	=@2708 /* ~Now, unless you have anything urgent or pressing, I see that one of my sarjeantes is about to deliver me yet another lost child.~ */
	IF~~THEN
	EXIT
END

// ---------------------------------------------------------
/* fire elemental in kitchen's storeroom */
IF ~~ THEN fire_elemental
SAY @2716 /* ~Oh? Fortunately, the storage room is rather damp - a fact normally not liked very much, but in this case it is to our advantage. Hmm, we can't let it rampage between all the crates and barrels...~ */
++ @2717 /* ~No worries, I promised the cook to take care of it. I just wanted to let you know.~ */ + fire_elemental_01
++ @2718 /* ~Yes, you should do something about it quickly I guess.~ */ + fire_elemental_02
END

IF ~~ THEN fire_elemental_01
SAY @2719 /* ~I'm at unease to see civilians do our work. The cook probably asked you because she's always cautious of my men coming near the alestore, be there a reason or not... Very well, I will respect her choice, but be sure to get rid of it quickly.~ */
IF ~~ THEN EXIT
END

IF ~~ THEN fire_elemental_02
SAY @2720 /* ~I will send a soldier over as soon as possible.~ */
IF ~~ THEN DO ~EraseJournalEntry(@901)
EraseJournalEntry(@904)
EraseJournalEntry(@906)
EraseJournalEntry(@906)
EraseJournalEntry(@910)
AddexperienceParty(500)
SetGlobal("bsFireElementQuest","GLOBAL",12)~ UNSOLVED_JOURNAL @907 EXIT
END


// ---------------------------------------------------------
//Tanner's problems
IF ~~ THEN BEGIN 9
	SAY @2727 /* ~Bullied, eh? In what way?~ */
	IF~Global("bsDGTannersHelp","GLOBAL",1) Race(Protagonist,GNOME)~THEN REPLY @2728 /* ~Being left hanging in the bucket, for one. Made fun of because of his job for another.~ */ GOTO 11
	IF~Global("bsDGTannersHelp","GLOBAL",0) Race(Protagonist,GNOME)
		 CheckStatGT(Protagonist,11,CHR)~THEN REPLY @2728 /* ~Being left hanging in the bucket, for one. Made fun of because of his job for another.~ */ GOTO 11
	IF~Global("bsDGTannersHelp","GLOBAL",0) Race(Protagonist,GNOME)
		 CheckStatLT(Protagonist,12,CHR)~THEN REPLY @2728 /* ~Being left hanging in the bucket, for one. Made fun of because of his job for another.~ */ GOTO 12
	IF~!Race(Protagonist,GNOME)~THEN REPLY @2728 /* ~Being left hanging in the bucket, for one. Made fun of because of his job for another.~ */ GOTO 10
	IF~!Race(Protagonist,GNOME)~THEN REPLY @2735 /* ~It's not funny, you know. The tanner is thinking of moving on to somewhere that will appreciate his work.~ */ GOTO 10
END

IF ~~ THEN BEGIN 10
	SAY @2729 /* ~Now that is not funny at all. The tanner is a most valuable member of the Seatower; his leather is some of the best I've seen for a long time. It won't happen again.~ */
	IF~~THEN
	UNSOLVED_JOURNAL @741
		DO~EraseJournalEntry(@740)
			EraseJournalEntry(@747)
			 SetGlobal("bsTannerSport","GLOBAL",2)~
	EXIT
END

IF ~~ THEN BEGIN 11
	SAY @2731 /* ~Being left hanging in the rope lift, you say? Yes - I recall that. I was the one who freed him but I thought the problem was just you gnomes not being strong enough to pull yourselves up.~ */
			=@2732 /* ~I'll talk to the tower sergeants - this will have to stop.~ */
	IF~~THEN
	UNSOLVED_JOURNAL @741
		DO~EraseJournalEntry(@740)
			EraseJournalEntry(@747)
			SetGlobal("bsTannerSport","GLOBAL",2)~
	EXIT
END

IF ~~ THEN BEGIN 12
	SAY @2734 /* ~I sometimes think that the way you gnomes behave brings the trouble on yourselves.~ */
	IF~CheckStatGT(Protagonist,9,CHR)~THEN REPLY @2735 /* ~It's not funny, you know. The tanner is thinking of moving on to somewhere that will appreciate his work.~ */ GOTO 13
	IF~CheckStatLT(Protagonist,10,CHR)~THEN REPLY @2735 /* ~It's not funny, you know. The tanner is thinking of moving on to somewhere that will appreciate his work.~ */ GOTO 14
	IF ~~ THEN REPLY @2733 /* ~I beg your pardon?~ */ + 15
END

IF ~~ THEN BEGIN 13
	SAY @2736 /* ~Look; I'll have a word with the Tower Sarjeantes. Nothing is guaranteed but I'll ask them to be a little more vigilant.~ */
	IF~~THEN
	UNSOLVED_JOURNAL @742
		DO~SetGlobal("bsTannerSport","GLOBAL",3)~
	EXIT
END

IF ~~ THEN BEGIN 14
	SAY @2738 /* ~There's nothing I can do about that - it's his choice.~ */
	IF~~THEN
	JOURNAL @743
		DO~SetGlobal("bsTannerSport","GLOBAL",4)~
	EXIT
END

IF ~~ THEN 15
SAY @2737 /* ~You heard me. Now you better leave me to my work, lest we prove my words right!~ */
	IF~~THEN
	JOURNAL @743
		DO~SetGlobal("bsTannerSport","GLOBAL",4)~
	EXIT
END
