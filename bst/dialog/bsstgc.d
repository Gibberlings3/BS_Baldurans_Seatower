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

IF ~Global("bs_ReportSmugglersToSeatower","GLOBAL",10)~ THEN reward_smugglers
SAY @2722 /* ~Ah, <CHARNAME>. The raid went smoothly. We gained a very fine ship with a lot of illegal wares. This was only possible due to your help. Take this as a reward and a token of our appreciation.~ */
IF ~~ THEN DO ~GiveGoldForce(2000)
AddexperienceParty(1000)
EraseJournalEntry(@100153)
ReputationInc(1)
SetGlobal("bs_ReportSmugglersToSeatower","GLOBAL",11)~ SOLVED_JOURNAL @100155 EXIT
END

IF ~Global("bs_ReportedSmugglerTunnel","GLOBAL",1)
Global("bsDGSmugglerTunnel","LOCALS",0)
OR(3)
    Global("bsDoppelgangerInTower","GLOBAL",10)
    Global("bsDoppelgangerInTower","GLOBAL",11)
    Global("bsDGQuestAbortedCP","LOCALS",1)~ THEN notices_smugglertunnel
SAY @2811 /* ~Good work on revealing the smuggler tunnels! Right under our noses, too. I'll make sure using them will be out of the question in the future!~ */
IF ~~ THEN DO ~AddExperienceParty(250)
SetGlobal("bsDGSmugglerTunnel","LOCALS",1)~ EXIT
END

//---------------------------------------------------------
// Initial meeting
IF ~True()~ THEN BEGIN 0
	SAY @2700 /* ~Yes?~ [BSSTGC] */
/* report in smugglers */
/* after revealing smuggler tunnel etc. */
+ ~Global("bsWorkingWithSmugglers","GLOBAL",1)
GlobalGT("bsSmugglerQuest","GLOBAL",0)
GlobalLT("bsSmugglerQuest","GLOBAL",40)
GlobalLT("bs_ReportSmugglersToSeatower","GLOBAL",2)
Global("bs_ReportedSmugglerTunnel","GLOBAL",1)~ + @2723 /* ~(true) I have insight into a smuggler organization from Amn also operating in Baldur's Gate I am helping to convict. I would like to keep you informed if they'll plan anything on the Seatower grounds.~ */ DO ~IncrementGlobal("bs_Smugglerfriend","GLOBAL",-1)~  + report_smuggler
/* before revealing smuggler tunnel: PC no halfling */
+ ~Global("bsWorkingWithSmugglers","GLOBAL",1)
GlobalGT("bsSmugglerQuest","GLOBAL",0)
GlobalLT("bsSmugglerQuest","GLOBAL",40)
GlobalLT("bs_ReportSmugglersToSeatower","GLOBAL",2)
!Global("bs_ReportedSmugglerTunnel","GLOBAL",1)
!Race(Player1,HALFLING)~ + @2723 + report_smuggler_no_halfling
/* before revealing smuggler tunnel: PC is halfling */
+ ~Global("bsWorkingWithSmugglers","GLOBAL",1)
GlobalGT("bsSmugglerQuest","GLOBAL",0)
GlobalLT("bsSmugglerQuest","GLOBAL",40)
GlobalLT("bs_ReportSmugglersToSeatower","GLOBAL",2)
!Global("bs_ReportedSmugglerTunnel","GLOBAL",1)
Race(Player1,HALFLING)~ + @2723 + report_smuggler_halfling
/* PC gained documents in the meantime */
+ ~Global("bs_SawCollaborationPass","MYAREA",0)
PartyHasItem("bssmq006")
GlobalGT("bs_ReportSmugglersToSeatower","GLOBAL",1)~ + @2724 /* @2790 /* I have official documents here that support my claim about working with Nashkel authorities. */ */ + report_smuggler_01
+ ~Global("bs_SawFFConfirmation","MYAREA",0)
PartyHasItem("bssmq009")
GlobalGT("bs_ReportSmugglersToSeatower","GLOBAL",1)~ + @2725 /* @2789 /* I have official documents here that confirm that I worked with the Flaming Fist against smugglers, sir. */ */ + report_smuggler_01

/* 4th smuggler quest - ask captain directly */
/* PC is working for authorities - only after introducing themselves for collaboration */
+ ~Global("bs_ReportSmugglersToSeatower","GLOBAL",2)
OR(2)
	Global("bsSmugglerQuest","GLOBAL",13)
	Global("bsSmugglerQuest","GLOBAL",14)~ + @2740 /* ~(true) I am here with regard to smuggler activities. Due to unfortunate circumstances you are in possession of a smuggled vial fragrance. You would help us a lot if you would let us have the item in question. It will help the Nashkel Guard to convict the smugglers.~ */ + give_back_fragrant
/* PC works for smugglers and lies about their motives */
/* these also trigger if PC was caught stealing the vial */
+ ~GlobalLT("bs_ReportSmugglersToSeatower","GLOBAL",2)
OR(2)
	Global("bsSmugglerQuest","GLOBAL",13)
	Global("bsSmugglerQuest","GLOBAL",14)~ + @2741 /* ~(lie) Greetings, sir. I am in the midst of a very *important* investigation regarding an international smuggling organization supplying Baldur's Gate with illegal wares from Amn. I'm afraid there were very unfortunate circumstances that led to you being in possession of a smuggled vial fragrance, sir! You would help us a lot if you would let us have the item in question, sir! It will help us to attract the attention of the smugglers - we are convinced of that!~ */ + give_back_fragrant
+ ~GlobalLT("bs_ReportSmugglersToSeatower","GLOBAL",2)
OR(2)
	Global("bsSmugglerQuest","GLOBAL",13)
	Global("bsSmugglerQuest","GLOBAL",14)~ + @2742 /* ~(lie) You are in possession of a flask of fragrance. This is smuggled goods. I am here to collect the vial for the Nashkel Guard, please hand it over.~ */ DO ~IncrementGlobal("bs_CaptainSmugglerCounter","MYAREA",-1)~ + give_back_fragrant
/* 5th smuggler quest (second heist in BG): transport box through the Seatower tunnels */
+ ~Global("bs_ReportSmugglersToSeatower","GLOBAL",3)
OR(2)
	Global("bsSmugglerQuest","GLOBAL",21)
	Global("bsSmugglerQuest","GLOBAL",22)~ + @2743 /* ~I have knowledge about a smuggler heist in Baldur's Gate. I am suposed to carry a barrel through the former smuggler tunnel beneath the Seatower. It will be taken off my hands at the exit, at the shore.~ */ + barrel_quest
+ ~OR(3)
	Global("bs_ReportSmugglersToSeatower","GLOBAL",2)
	Global("bs_ReportSmugglersToSeatower","GLOBAL",4)
	Global("bs_ReportSmugglersToSeatower","GLOBAL",5)
OR(2)
	Global("bsSmugglerQuest","GLOBAL",21)
	Global("bsSmugglerQuest","GLOBAL",22)~ + @2743 /* ~I have knowledge about a smuggler heist in Baldur's Gate. I am suposed to carry a barrel through the former smuggler tunnel beneath the Seatower. It wil be taken off my hands at the exit, at the shore.~ */ + barrel_quest_01

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
	IF~Global("bsTalkedToDungarth","LOCALS",1)~THEN REPLY @2702 /* ~What is it that you do again?~ */ GOTO job

	++ @2730 /* ~Good day to you.~ */ EXIT
END

IF ~~ THEN BEGIN 1
	SAY @2705 /* ~Dungarth is my name - Captain Dungarth. I'm the Garrison Commander here.~ */
	IF~Global("bsTannerSport","GLOBAL",1)~THEN REPLY @2703 /* ~I've been talking to the tanner and he tells me that he's being bullied by the guards.~ */ GOTO 9
	IF~~THEN REPLY @2706 /* ~What does the Garrison Commander do? I thought the Seatower Commander was in charge?~ */ GOTO 200
	++ @2730 /* ~Good day to you.~ */ EXIT
END

IF ~~ THEN BEGIN 200
	SAY @2707 /* ~He is. Commander Airard is the Captain of the Seatower.~ */
	IF ~~ THEN + job
END

IF ~~ THEN BEGIN job
	SAY @2721 /* My job is to organise the Tower Guards, make sure everyone behaves themselves and to re-unite lost children with whichever parent still wants them. */
	IF ~GlobalGT("bs_LostNecklaceQuest","GLOBAL",0)~ THEN EXIT
	IF ~Global("bs_LostNecklaceQuest","GLOBAL",0)~ THEN + lost_child
	END
IF ~~ THEN lost_child
SAY @2708 /* ~Now, unless you have anything urgent or pressing, I see that one of my sarjeantes is about to deliver me yet another lost child.~ */
	IF~~THEN DO ~SetGlobal("bs_LostNecklaceQuest","GLOBAL",1)~
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

IF ~~ THEN report_smuggler
SAY @2744 /* ~Are you saying that even after the smuggling tunnels were unveiled, they still have the audacity to do smuggling business here?~ */
IF ~!Race(Player1,HALFLING)~ + report_smuggler_no_halfling
IF ~Race(Player1,HALFLING)~ + report_smuggler_halfling
END

IF ~~ THEN report_smuggler_no_halfling
SAY @2745 /* ~And you would have knowledge about such operations?~ */
IF ~~ THEN + report_smuggler_00
END

IF ~~ THEN report_smuggler_halfling
SAY @2746 /* ~Well, and what would *you* be able to do against that, eh? Watch them at knee height?~ */
IF ~~ THEN DO ~IncrementGlobal("bs_CaptainSmugglerCounter","MYAREA",-1)~ + report_smuggler_00
END

CHAIN
IF ~~ THEN bsstgc report_smuggler_00
@2747 /* ~This sounds rather suspicious to me.~ */
== bsstgc IF ~Global("bs_ReportedSmugglerTunnel","GLOBAL",1)~ THEN @2812 /* ~Hmm. You *did* reveal the smuggler tunnels to us, so much is true.~ */ DO ~IncrementGlobal("bs_CaptainSmugglerCounter","MYAREA",1)~
END
+ ~OR(2)
	PartyHasItem("bssmq006")
	PartyHasItem("bssmq009")~ + @2748 /* I have official documents here that support my claim about working with the authorities, sir. */ + report_smuggler_01
+ ~!PartyHasItem("bssmq006")
!PartyHasItem("bssmq009")~ + @2749 /* I will inform you, sir. Please do not judge my integrity before you'll receive information from me. */ DO ~IncrementGlobal("bs_CaptainSmugglerCounter","MYAREA",1)~ + report_smuggler_05
+ ~!PartyHasItem("bssmq006")
!PartyHasItem("bssmq009")~ + @2750 /* Yes, I am working as a spy for them. I will let you know if I learn of anything. You can take the help or leave it. */ + report_smuggler_02
+ ~!PartyHasItem("bssmq006")
!PartyHasItem("bssmq009")~ + @2751 /* Maybe watch your tone if someone offers their help against criminals. */ DO ~IncrementGlobal("bs_CaptainSmugglerCounter","MYAREA",-1)~ + report_smuggler_04
++ @2752 /* Forget I said anything. */ + report_smuggler_03


CHAIN
IF ~~ THEN bsstgc report_smuggler_01
@2753 /* Let me see. */
== bsstgc IF ~PartyHasItem("bssmq006")~ THEN @2754 /* Well, an "official pass" from Nashkel can be official all it wants, in these parts it's still not much more than a piece of paper that doesn't blush. (grunts) Fine, so they state you are working with them to convict smugglers. Noted. Make sure you keep this, because if it's gone, I have to assume that this collaboration is no longer valid. */ DO ~SetGlobal("bs_SawCollaborationPass","MYAREA",1)
IncrementGlobal("bs_CaptainSmugglerCounter","MYAREA",1)~
== bsstgc IF ~PartyHasItem("bssmq009")~ THEN @2755 /* Now, this confirmation is convincing. If Manip Limmon gives you an official document about your help against smugglers, then I will not doubt your word regarding this. */ DO ~SetGlobal("bs_SawFFConfirmation","MYAREA",1)
IncrementGlobal("bs_CaptainSmugglerCounter","MYAREA",10)~
END
IF ~~ THEN + report_smuggler_06
IF ~!PartyHasItem("bssmq009")~ THEN + report_smuggler_05
IF ~GlobalGT("bs_ReportSmugglersToSeatower","GLOBAL",1)~ THEN EXIT


APPEND bsstgc

IF ~~ THEN report_smuggler_02
SAY @2756 /* Hold your horses there. You are talking to the Captain of the Seatower Guard! */
IF ~~ THEN + report_smuggler_05
END

IF ~~ THEN report_smuggler_03
SAY @2757 /* Not sure I can. Not after you coming here and raising such a suspicious claim. */
IF ~~ THEN EXIT
END

IF ~~ THEN report_smuggler_04
SAY @2758 /* You watch your tone! Did you forget where you are? */
IF ~~ THEN + report_smuggler_05
END

IF ~~ THEN report_smuggler_05
SAY @2759 /* Hmph. Fine, I'll take your word for now. */
IF ~~ THEN + report_smuggler_06
END

IF ~~ THEN report_smuggler_06
SAY @2760 /* Let me know immediately if you know of any illegal activities on Seatower grounds. For anything regarding the rest of the city, talk to the Flaming Fists directly. */
IF ~~ THEN DO ~SetGlobal("bs_ReportSmugglersToSeatower","GLOBAL",2)~ UNSOLVED_JOURNAL @100134 EXIT
END
END //APPEND

/*
PartyHasItem("bssmq006")
Global("bs_SawCollaborationPass","MYAREA",1)

PartyHasItem("bssmq009")
Global("bs_SawFFConfirmation","MYAREA",1)

Global("bs_ReportSmugglersToSeatower","GLOBAL",2)


OR(4)
	PartyHasItem("bssmq006")
	Global("bs_SawCollaborationPass","MYAREA",1)
	PartyHasItem("bssmq009")
	Global("bs_SawFFConfirmation","MYAREA",1)
*/

CHAIN
IF ~~ THEN bsstgc give_back_fragrant
@2761 /* A vial of... Smuggler goods?! I indeed am in possession of such a vial, but - */
== bsstgc IF ~Global("bsSmugglerQuest","GLOBAL",14)~ THEN @2762 /* So *this* is what the soldier told me about! You think you could just go and take from my private belongings? */
END
IF ~Global("bs_SawFFConfirmation","MYAREA",0) Global("bs_SawCollaborationPass","MYAREA",0)~ THEN + give_back_fragrant_explain
IF ~Global("bs_SawFFConfirmation","MYAREA",0) Global("bs_SawCollaborationPass","MYAREA",1)~ THEN + give_back_fragrant_show_pass
IF ~Global("bs_SawFFConfirmation","MYAREA",1)~ THEN + give_back_fragrant_showed_ffpass

CHAIN
IF ~~ THEN bsstgc give_back_fragrant_success
@2763 /* Hmm. From the sound of it, you are on the verge of catching these criminals. Seeing how it would help your investigation - even if it is an operation in Amn, I understand that this effects Baldur's Gate's safety with regard to these illegal activities, too. */
== bsstgc IF ~!Global("bs_SawFFConfirmation","MYAREA",1)~ THEN @2764 /* I will believe you. Coming here and asking for a vial of flagrant - it would be not only bold but outright silly to do so just to get hold of such an item, no matter the worth. */
== bsstgc IF ~Global("bsSmugglerQuest","GLOBAL",14)~ THEN @2765 /* Still, I have to scold you for trying to take it yourself without asking, first. This was suspicious behavior, if there ever was one! */
== bsstgc @2766 /* Fine, I'll hand the flask over to you. May it improve relations with our counterparts in Amn. Just one moment... */
END
IF ~~ THEN DO ~SetGlobal("bsSmugglerQuest","GLOBAL",15)
ClearAllActions() StartCutSceneMode() StartCutScene("bscut006")~ EXIT

APPEND bsstgc

/* showed Manip's pass before */
IF ~~ THEN give_back_fragrant_showed_ffpass
SAY @2767 /* You helped the Flaming Fist before, so I guess this is valid. */
IF ~~ THEN + give_back_fragrant_success
END

/* after fade-to-black */
IF WEIGHT #-1
~Global("bsSmugglerQuest","GLOBAL",15)~ THEN give_back_fragrant_success_01
SAY @2768 /* Here it is. I thank you in the name of the Seatower Guard about the warning regarding smuggler activities. We take this very seriously and will investigate the matter also from our side. Good day to you. */
IF ~!GlobalLT("bs_Smugglerfriend","GLOBAL",0)~ THEN DO ~GiveItemCreate("bssmq005", LastTalkedToBy(Myself),0,0,0)
EraseJournalEntry(@100104)
EraseJournalEntry(@100109)
SetGlobal("bsSmugglerQuest","GLOBAL",17)
SetGlobal("bs_ReportSmugglersToSeatower","GLOBAL",3)~ UNSOLVED_JOURNAL @100107 EXIT
IF ~GlobalLT("bs_Smugglerfriend","GLOBAL",0)~ THEN DO ~GiveItemCreate("bssmq005", LastTalkedToBy(Myself),0,0,0)
EraseJournalEntry(@100104)
EraseJournalEntry(@100109)
AddJournalEntry(@100105,QUEST)
SetGlobal("bsSmugglerQuest","GLOBAL",17)
SetGlobal("bs_ReportSmugglersToSeatower","GLOBAL",3)~ UNSOLVED_JOURNAL @100131 EXIT
END

/* [showed only nashkel pass before] */
IF ~~ THEN give_back_fragrant_show_pass
SAY @2769 /* Show me the collaboration pass again, to confirm your words! */
+ ~Global("bs_SawFFConfirmation","MYAREA",0)
PartyHasItem("bssmq009")
!PartyHasItem("bssmq006")~ + @2770 /* I have something better to convince you, I think. I have official documents here that confirm that I worked with the Flaming Fist against smugglers, sir. */ + give_back_fragrant_ffpass
+ ~PartyHasItem("bssmq006")
!PartyHasItem("bssmq009")~ + @2771 /* Of course. Here it is. */ DO ~IncrementGlobal("bs_CaptainSmugglerCounter","MYAREA",1)~ + give_back_fragrant_nashkelpass
+ ~Global("bs_SawFFConfirmation","MYAREA",0)
PartyHasItem("bssmq009")
PartyHasItem("bssmq006")~ + @2772 /* Of course. Here it is. I also have something better. I have official documents here that confirm that I worked with the Flaming Fist against smugglers, sir. */ + give_back_fragrant_ffpass
+ ~!PartyHasItem("bssmq006")
!PartyHasItem("bssmq009")~ + @2773 /* I'll go and collect it, sir. */ DO ~IncrementGlobal("bs_CaptainSmugglerCounter","MYAREA",-1)~ + give_back_fragrant_empty_handed
+ ~!PartyHasItem("bssmq006")
!PartyHasItem("bssmq009")~ + @2774 /* I don't have it any more. */ + give_back_fragrant_empty_handed_01
END

IF ~~ THEN give_back_fragrant_empty_handed
SAY @2775 /* Better go and collect it quickly, otherwise I'll have to treat you like the criminal you claim you want to convict! */
IF ~~ THEN EXIT
END

IF ~~ THEN give_back_fragrant_empty_handed_01
SAY @2776 /* So you come here empty-handed - worse still, after having lost the only thing that would make your words credible? */
IF ~~ THEN + give_back_fragrant_nope
END

IF ~~ THEN give_back_fragrant_nope
SAY @2777 /* Get out quickly before I decide that you're one of the scoundrels I'm supposed to protect the tower from! Regarding your information - we will investigate the matter on our own. We do not need interference from Amn for it! */
IF ~!GlobalLT("bs_Smugglerfriend","GLOBAL",0)~ THEN DO ~ReputationInc(-1)
EraseJournalEntry(@100105)
EraseJournalEntry(@100109)
SetGlobal("bsSmugglerQuest","GLOBAL",19)
SetGlobal("bs_ReportSmugglersToSeatower","GLOBAL",5)~ UNSOLVED_JOURNAL @100106 EXIT
IF ~GlobalLT("bs_Smugglerfriend","GLOBAL",0)~ THEN DO ~ReputationInc(-1)
EraseJournalEntry(@100105)
EraseJournalEntry(@100109)
SetGlobal("bsSmugglerQuest","GLOBAL",19)
SetGlobal("bs_ReportSmugglersToSeatower","GLOBAL",5)~ UNSOLVED_JOURNAL @100132 EXIT
END

IF ~~ THEN give_back_fragrant_ffpass
SAY @2755 /* Now, this confirmation is convincing. If Manip Limmon gives you an official document about your help against smugglers, then I will not doubt your word regarding this. */
IF ~~ THEN DO ~SetGlobal("bs_SawFFConfirmation","MYAREA",1)
IncrementGlobal("bs_CaptainSmugglerCounter","MYAREA",10)~ + give_back_fragrant_success
END

IF ~~ THEN give_back_fragrant_nashkelpass_first
SAY @2778 /* Hmm. This *does* look official indeed... */
= @2779 /* Well, an "official pass" from Nashkel can be official all it wants, in these parts it's still not much more than a piece of paper that doesn't blush. (grunts) Fine, so they state you are working with them to convict smugglers. */
IF ~~ THEN DO ~SetGlobal("bs_SawCollaborationPass","MYAREA",1)
IncrementGlobal("bs_CaptainSmugglerCounter","MYAREA",1)~ + give_back_fragrant_nashkelpass_01
END

IF ~~ THEN give_back_fragrant_nashkelpass
SAY @2780 /* Hmm, so you are still in cooperation with the Nashkel Guard, eh? */
IF ~~ THEN + give_back_fragrant_nashkelpass_01
END

/* showed Nashkel pass, no FF pass */
IF ~~ THEN give_back_fragrant_nashkelpass_01
SAY @2781 /* You expect me to hand the vial over to you? */
+ ~%BGT_VAR% !Dead("Sarevok")~ + @2782 /* You would help the investigations *tremendously* if you'd leave the flask to us, sir. With all the tensions between Baldur's Gate and Amn, let us join forces to bring those bandits down! */ DO ~IncrementGlobal("bs_CaptainSmugglerCounter","MYAREA",1)~ + give_back_fragrant_10
+ ~Dead("Sarevok")~ + @2783 /* You would help the investigations *tremendously* if you'd leave the flask to us, sir. After all the tensions between Baldur's Gate and Amn, this is a great moment to join forces to bring those bandits down! */ DO ~IncrementGlobal("bs_CaptainSmugglerCounter","MYAREA",1)~ + give_back_fragrant_10
++ @2784 /* A string of *unfavorable* circumstances, I'm absolutely sure! We are convinced that no one here was aware of this impropriety. */ DO ~IncrementGlobal("bs_CaptainSmugglerCounter","MYAREA",1)~ +
give_back_fragrant_10
++ @2785 /* Hand it over and there will be no repercussions. */ DO ~IncrementGlobal("bs_CaptainSmugglerCounter","MYAREA",-1)~ + give_back_fragrant_05
++ @2786 /* Yes, smuggler good. You didn't think your men would gift you something like this now, eh? */ DO ~IncrementGlobal("bs_CaptainSmugglerCounter","MYAREA",-1)~ + give_back_fragrant_01
++ @2787 /* Ah, I might have spoken too hastily. Think nothing of it, sir. */ + give_back_fragrant_02
END


/* didn't show any pass before */
IF ~~ THEN give_back_fragrant_explain
SAY @2788 /* Do you have any proof to back up that bold claim? */
+ ~Global("bs_SawFFConfirmation","MYAREA",0)
PartyHasItem("bssmq009")~ + @2789 /* I have official documents here that confirm that I worked with the Flaming Fist against smugglers, sir. */ + give_back_fragrant_ffpass
+ ~Global("bs_SawCollaborationPass","MYAREA",0)
PartyHasItem("bssmq006")
!PartyHasItem("bssmq009")~ + @2790 /* I have official documents here that support my claim about working with Nashkel authorities. */ + give_back_fragrant_nashkelpass_first
/* has no pass and didn't show any yet */
+ ~!PartyHasItem("bssmq006")
!PartyHasItem("bssmq009")~ + @2784 /* A string of *unfavorable* circumstances, I'm absolutely sure! We are convinced that no one here was aware of this impropriety. */ +
give_back_fragrant_10
+ ~%BGT_VAR% !Dead("Sarevok")
!PartyHasItem("bssmq006")
!PartyHasItem("bssmq009")~ + @2782 /* You would help the investigations *tremendously* if you'd leave the flask to us, sir. With all the tensions between Baldur's Gate and Amn, let us join forces to bring those bandits down! */ + give_back_fragrant_10
+ ~Dead("Sarevok")
!PartyHasItem("bssmq006")
!PartyHasItem("bssmq009")~ + @2783 /* You would help the investigations *tremendously* if you'd leave the flask to us, sir. After all the tensions between Baldur's Gate and Amn, this is a great moment to join forces to bring those bandits down! */ + give_back_fragrant_10
+ ~!PartyHasItem("bssmq006")
!PartyHasItem("bssmq009")~ + @2785 /* Hand it over and there will be no repercussions. */ DO ~IncrementGlobal("bs_CaptainSmugglerCounter","MYAREA",-1)~ + give_back_fragrant_05
+ ~!PartyHasItem("bssmq006")
!PartyHasItem("bssmq009")~ + @2786 /* Yes, smuggler good. You didn't think your men would gift you something like this now, eh? */ DO ~IncrementGlobal("bs_CaptainSmugglerCounter","MYAREA",-1)~ + give_back_fragrant_01
+ ~!PartyHasItem("bssmq006")
!PartyHasItem("bssmq009")~ + @2787 /* Ah, I might have spoken too hastily. Think nothing of it, sir. */ + give_back_fragrant_02
END

IF ~~ THEN give_back_fragrant_01
SAY @2791 /* How - how would *you* know this flagrance was given to me by my men?! */
++ @2792 /* Ah - I did not mean to startle you with this information, sir. It is merely a sign about how thoroughly we are into this investigation to get close to these smugglers! */ DO ~IncrementGlobal("bs_CaptainSmugglerCounter","MYAREA",1)~ + give_back_fragrant_10
++ @2793 /* Er, oops... */ + give_back_fragrant_nope
++ @2787 /* Ah, I might have spoken too hastily. Think nothing of it, sir. */ + give_back_fragrant_02
END

IF ~~ THEN give_back_fragrant_02
SAY @2794 /* Think nothing of it? I can't well hear such words and then just forget about them! You better explain yourself this instance. */
++ @2795 /* It is like I said, and this is the full truth - the flagrance is smuggler goods. I am in collaboration with the Amnian Guard of Nashkel, and I need the vial which is currently in your possession to get close to the smugglers. */ + give_back_fragrant_10
++ @2796 /* Man, this went on long enough - will you give me the flask, or not? */ + give_back_fragrant_nope
++ @2797 /* Damn, I knew this wouldn't work. */ + give_back_fragrant_nope
END

IF ~~ THEN give_back_fragrant_05
SAY @2798 /* Watch your tone in here! */
COPY_TRANS_LATE bsstgc give_back_fragrant_02
END

IF ~~ THEN give_back_fragrant_08
SAY @2799 /* I thank you in the name of the Seatower Guard about the warning. We take this very seriously and will investigate the matter, but on our own. For this, I will keep the vial, it is important evidence now. Please leave the tower premises if you are done here. Good day to you. */
IF ~!GlobalLT("bs_Smugglerfriend","GLOBAL",0)~ THEN DO ~EraseJournalEntry(@100105)
EraseJournalEntry(@100109)
SetGlobal("bsSmugglerQuest","GLOBAL",18)
SetGlobal("bs_ReportSmugglersToSeatower","GLOBAL",4)~ UNSOLVED_JOURNAL @100106 EXIT
IF ~GlobalLT("bs_Smugglerfriend","GLOBAL",0)~ THEN DO ~EraseJournalEntry(@100105)
EraseJournalEntry(@100109)
SetGlobal("bsSmugglerQuest","GLOBAL",18)
SetGlobal("bs_ReportSmugglersToSeatower","GLOBAL",4)~ UNSOLVED_JOURNAL @100132 EXIT
END

IF ~~ THEN give_back_fragrant_10
SAY @2800 /* And yet, you come without any proof of any kind. */
+ ~GlobalGT("bsDoppelgangerQuest","GLOBAL",15)
!Global("bsDoppelgangerQuest","GLOBAL",19)
!Global("bsDoppelgangerQuest","GLOBAL",20)~ + @2801 /* You know me, sir. You saw what I did for this tower. Do you think I would lie now - for a vial of fragrance? */ DO ~IncrementGlobal("bs_CaptainSmugglerCounter","MYAREA",2)~ + give_back_fragrant_11
+ ~%BGT_VAR%
OR(2) Dead("Sarevok") GlobalGT("DukeThanks","GLOBAL",0)~ + @2802 /* They call me a hero - after what I did for this city - do you think I would make this up? */ DO ~IncrementGlobal("bs_CaptainSmugglerCounter","MYAREA",1)~ + give_back_fragrant_13
+ ~Global("bs_ReportedSmugglerTunnel","GLOBAL",1)~ + @2813 /* ~It was me who revealed the smuggler tunnels, sir. I am determined to take these smugglers down. You have my word on that!~ */ + give_back_fragrant_13
+ ~!Dead("Sarevok")~ + @2803 /* You heard about me clearing the Nashkel mines. I am all about fighting the bandits and other scoundrel, sir! Would I lie about this for something like this? */ + give_back_fragrant_13
++ @2804 /* Just my good looks and honest smile, sir. */ + give_back_fragrant_12
++ @2797 /* Damn, I knew this wouldn't work. */ + give_back_fragrant_nope
END

IF ~~ THEN give_back_fragrant_11
SAY @2805 /* Hmm, you did, indeed. You were very helpful with defending this tower against doppelgangers - and help me freeing my men off them. */
IF ~~ THEN + give_back_fragrant_14
END

IF ~~ THEN give_back_fragrant_12
SAY @2806 /* Well, in that case... */
IF ~GlobalLT("bs_CaptainSmugglerCounter","MYAREA",1)~ THEN + give_back_fragrant_nope
IF ~GlobalGT("bs_CaptainSmugglerCounter","MYAREA",0)~ THEN + give_back_fragrant_08
END

IF ~~ THEN give_back_fragrant_13
SAY @2807 /* Hmm, indeed. You were very helpful with helping all around. */
IF ~~ THEN + give_back_fragrant_14
END

IF ~~ THEN give_back_fragrant_14
SAY @2808 /* But regarding this matter... */
IF ~GlobalLT("bs_CaptainSmugglerCounter","MYAREA",0)~ THEN + give_back_fragrant_nope
IF ~Global("bs_CaptainSmugglerCounter","MYAREA",0)~ THEN + give_back_fragrant_08
IF ~GlobalGT("bs_CaptainSmugglerCounter","MYAREA",0)~ THEN + give_back_fragrant_success
END


/* captain will make a remark if he gave back the flagrant whether smuggler conviction didn't work! [unrealistic scenario] */
IF ~~ THEN barrel_quest
SAY @2809 /* Oh? And how is this possible, after I gave you the flagrant explicitely to convict the smugglers in Nashkel, eh? Very well. Let's pretend this is a sign of the incompetence of the Nashkel Guard to handle this matter. */
IF ~~ THEN + barrel_quest_01
END

IF ~~ THEN barrel_quest_01
SAY @2810 /* A smuggling heist, right under our noses, at the exit of the smuggler tunnel where it goes back into the open at the sea shore? We will be there! */
IF ~~ THEN DO ~SetGlobal("bs_ReportSmugglersToSeatower","GLOBAL",6)~ UNSOLVED_JOURNAL @100149 EXIT
END

END //APPEND
