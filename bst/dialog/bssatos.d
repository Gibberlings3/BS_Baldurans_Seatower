//dialogue for Ilmater Monastery Abbot Guoremor
//Non-matching dlg name due to legacy reasons.

BEGIN ~BSSATOS~


/* first greeting */

IF ~NumTimesTalkedTo(0)~ THEN greetings
SAY @3700
IF ~~ THEN + greetings_08
IF ~Global("bsMissingMonk","GLOBAL",4)~ THEN + missing_monk
END

/* Missing Monk Quest */

IF ~Global("bsMissingMonk","GLOBAL",4)~ THEN missing_monk
SAY @3701 /* ~You are the ones that found poor Martina. Yes, there is a lot of greed and evil in this world. We Followers of Ilmater try to do our best, but there is only so much we can do. Apparently, soldier Shuck had a lot of debts to pay for, so he forced his way to our collected alms, killing poor Martina in the process. Please, as a sign of our gratitude, take these scrolls. May they help you doing good.~ */
IF ~~ THEN DO ~GiveItemCreate("SCRL07",[PC],1,0,0) GiveItemCreate("SCRL15",[PC],1,0,0) 
EraseJournalEntry(@797)
AddJournalEntry(@798,QUEST_DONE)
SetGlobal("bsMissingMonk","GLOBAL",5)~ + greetings_08
IF ~Global("bsAbbotHeals","GLOBAL",2)~ THEN DO ~GiveItemCreate("SCRL07",[PC],1,0,0) GiveItemCreate("SCRL15",[PC],1,0,0) 
EraseJournalEntry(@797)
AddJournalEntry(@798,QUEST_DONE)
SetGlobal("bsMissingMonk","GLOBAL",5)~ + healing
IF ~Global("bsGavePrisonPass","GLOBAL",0)~ THEN DO ~GiveItemCreate("SCRL07",[PC],1,0,0) GiveItemCreate("SCRL15",[PC],1,0,0) 
EraseJournalEntry(@797)
AddJournalEntry(@798,QUEST_DONE)
SetGlobal("bsMissingMonk","GLOBAL",5)~ + missing_monk_01
END

IF ~~ THEN missing_monk_01
SAY @3702 /* ~If you haven't spoken to the Seatower Commander yet, I have word that he is looking for you. It is about the prisoner.~ */
IF ~~ THEN UNSOLVED_JOURNAL @799 + greetings_08
IF ~Global("bsAbbotHeals","GLOBAL",2)~ THEN UNSOLVED_JOURNAL @799 + healing
END


/* "Dark Power in the Seatower Catacombs" */

/* quest is finished. Fuller is dead */
CHAIN
IF ~Global("bsTalkedToRestlessDead","GLOBAL",10)
!Global("bsClearedCatacombs","GLOBAL",18)
!Global("bsClearedCatacombs","GLOBAL",19)
!Global("bsClearedCatacombs","GLOBAL",20)
!Global("bsClearedCatacombs","GLOBAL",21)
GlobalLT("bsClearedCatacombs","GLOBAL",30)
Dead("bsrsd07")
Global("bs_KnowsAboutScroll","LOCALS",0)~ THEN BSSATOS dark_power_quest_00_0
@3735 /* ~Gerrit confessed his and our brethens' fallacy. Making a mistake is only human, and we are here to help him carry their burden of guilt for our brothers' deaths. I still forced him to two extra months of scroll study and latrine cleaning.~ */
DO ~SetGlobal("bs_KnowsAboutScroll","LOCALS",1)~ 
== BSSATOS IF ~Dead("bsrsd07")~ THEN @3732 /* ~I do not see our brother Fuller. He is dead then, I take it. Ilmater have mercy on his soul.~ */
END
IF ~~ THEN + greetings_08

/* Fuller returned */
CHAIN
IF ~OR(4)
	Global("bsClearedCatacombs","GLOBAL",18)
	Global("bsClearedCatacombs","GLOBAL",19)
	Global("bsClearedCatacombs","GLOBAL",20)
	Global("bsClearedCatacombs","GLOBAL",21)
InMyArea("bsrsd07")
!Dead("bsrsd07")
Global("bs_FullerReturned","LOCALS",0)~ THEN BSSATOS dark_power_quest_00_1
@3736 /* ~Our brother Fuller returned - we are so glad he is still alive. He owes his rescue to you, so much is certain. He and Gerrit confessed their fallacy. Making a mistake is only human, and we are here to help them carry their burden of guilt for our brother Muck's death. I still forced them to two extra months of scroll study and latrine cleaning.~ */
DO ~SetGlobal("bs_FullerReturned","LOCALS",1)~ 
== BSSATOS IF ~Global("bsClearedCatacombs","GLOBAL",18)~ THEN @3737 /* ~Thank you for volunteering to perform the banning ritual. Let me know when you succeeded.~ */
END
IF ~Global("bsClearedCatacombs","GLOBAL",18)~ THEN + greetings_08
IF ~Global("bsClearedCatacombs","GLOBAL",19)~ THEN + dark_power_quest_04
IF ~GlobalGT("bsClearedCatacombs","GLOBAL",19)~ THEN + dark_power_quest_06

APPEND BSSATOS
IF ~~ THEN greetings_01
SAY @3709 /* ~Well... we would have a task for a group of fearless adventurers - it would spare us to ask the Tower Guard for help. There is evil inside the tower's catacombs, and usually we monks of Ilmater take care it does not accumulate to a point where it cannot be handled properly. Unfortunately, there were recent events which lead to the loss of two of our monks. Something powerful manifested inside, and we are not sure what it is. Our capabilities seem not enough to face it, and our numbers are down by three with Martina not returning. We would need someone with the necessary capabilities to go into the catacombs and retrieve the key to the inner sanctuary which was lost - or even better, outright clear out whatever manifested in there.~ */
+ ~Global("bs_twominksdied","LOCALS",0)~ + @3754 /* ~Two monks died because of this?~ */ DO ~SetGlobal("bs_twominksdied","LOCALS",1)~ + dark_power_quest_01
+ ~Global("bs_awaitsme","LOCALS",0)~ + @3710 /* ~What do you think could await me in there?~ */ DO ~SetGlobal("bs_awaitsme","LOCALS",1)~ + greetings_02
++ @3711 /* ~I'll do it.~ */ + greetings_03
+ ~Global("bs_whatreward","LOCALS",0)~ + @3712 /* ~What would be the reward?~ */ DO ~SetGlobal("bs_whatreward","LOCALS",1)~ + greetings_04
++ @3713 /* ~I'm not interested.~ */ + greetings_05
END

IF ~~ THEN dark_power_quest_01
SAY @3755 /* ~We do not know, but we fear this is the case. Three of our brethren went inside to perform the incantations, and only Gerrit made it out. He is still very shocked, the poor man.~ */
+ ~Global("bs_twominksdied","LOCALS",1) Global("bs_TalkedToGerrit","MYAREA",0)~ + @3756 /* ~Where is Gerrit now?~ */ DO ~SetGlobal("bs_twominksdied","LOCALS",2)~ + dark_power_quest_02
+ ~Global("bs_twominksdied","LOCALS",1) Global("bs_TalkedToGerrit","MYAREA",1)~ + @3776 /* I think I met Gerrit already. Is he the monk in the chapel?~ */ + dark_power_quest_02
+ ~Global("bs_awaitsme","LOCALS",0)~ + @3710 /* ~What do you think could await me in there?~ */ DO ~SetGlobal("bs_awaitsme","LOCALS",1)~ + greetings_02
++ @3711 /* ~I'll do it.~ */ + greetings_03
+ ~Global("bs_whatreward","LOCALS",0)~ + @3712 /* ~What would be the reward?~ */ DO ~SetGlobal("bs_whatreward","LOCALS",1)~ + greetings_04
++ @3713 /* ~I'm not interested.~ */ + greetings_05
END

IF ~~ THEN dark_power_quest_02
SAY @3757 /* He is in the chapel, praying. Be gentle when you ask him about what happened, his mind is still trying to comprehend what came over him and our two brethren.~ */
+ ~Global("bs_awaitsme","LOCALS",0)~ + @3710 /* ~What do you think could await me in there?~ */ DO ~SetGlobal("bs_awaitsme","LOCALS",1)~ + greetings_02
++ @3711 /* ~I'll do it.~ */ + greetings_03
+ ~Global("bs_whatreward","LOCALS",0)~ + @3712 /* ~What would be the reward?~ */ DO ~SetGlobal("bs_whatreward","LOCALS",1)~ + greetings_04
++ @3713 /* ~I'm not interested.~ */ + greetings_05
END

IF ~~ THEN dark_power_quest_03
SAY @3738 /* Thank you for returning it to me, and for the certainty of what has happened to at least one of our brethren. Do I take it that you have no inclination to open the door and clear out the inner sanctum?~ */
++ @3739 /* ~That is right, my work ends here. The catacombs are cleared from any obvious threat - the mausoleum too, by the way - and this is all I'll do for that.~ */ + dark_power_quest_04
++ @3758 /* ~No, I think I'll go and have a look inside.~ */ + dark_power_quest_05
END

IF ~~ THEN dark_power_quest_04
SAY @3759 /* ~Thank you for your efforts. This should suffice until we are strong enough to deal with the remaining threat and do the usual cantations again. You did us a great deed, indeed. Let me give you your reward, you earned it. Ilmater's mercy be with you.~ */
/* PC gave scroll to Fuller. Got no reward so far. */
IF ~Global("bsClearedCatacombs","GLOBAL",19)
Global("bs_PCgotFirstReward","LOCALS",0)~ THEN DO ~GiveGoldForce(750)
GiveItemCreate("POTN17",[PC],2,0,0)
GiveItemCreate("POTN20",[PC],2,0,0)
GiveItemCreate("POTN21",[PC],1,0,0)
GiveItemCreate("RESTORE",[PC],2,0,0)
AddExperienceParty(1000)
EraseJournalEntry(@775)
EraseJournalEntry(@940)
EraseJournalEntry(@941)
EraseJournalEntry(@942)
EraseJournalEntry(@943)
EraseJournalEntry(@945)
EraseJournalEntry(@946)
EraseJournalEntry(@947)
EraseJournalEntry(@948)
SetGlobal("bsClearedCatacombs","GLOBAL",31)~ SOLVED_JOURNAL @776 EXIT
/* PC gave scroll to Fuller. Got 1st reward already. */
IF ~Global("bsClearedCatacombs","GLOBAL",19)
Global("bs_PCgotFirstReward","LOCALS",1)~ THEN DO ~GiveGoldForce(250)
GiveItemCreate("POTN17",[PC],2,0,0)
GiveItemCreate("RESTORE",[PC],1,0,0)
AddExperienceParty(500)
EraseJournalEntry(@775)
EraseJournalEntry(@940)
EraseJournalEntry(@941)
EraseJournalEntry(@942)
EraseJournalEntry(@943)
EraseJournalEntry(@945)
EraseJournalEntry(@946)
EraseJournalEntry(@947)
EraseJournalEntry(@948)
SetGlobal("bsClearedCatacombs","GLOBAL",31)~ SOLVED_JOURNAL @776 EXIT
/* PC gave key back to abbot (earliest quest ending) */
IF ~GlobalLT("bsClearedCatacombs","GLOBAL",6)~ THEN DO ~GiveGoldForce(500)
TakePartyItem("bscckey") DestroyItem("bscckey")
GiveItemCreate("POTN20",[PC],2,0,0)
GiveItemCreate("POTN21",[PC],2,0,0)
GiveItemCreate("RESTORE",[PC],1,0,0)
AddExperienceParty(500)
EraseJournalEntry(@775)
EraseJournalEntry(@940)
EraseJournalEntry(@943)
SetGlobal("bsClearedCatacombs","GLOBAL",30)~ SOLVED_JOURNAL @776 EXIT
END

IF ~~ THEN dark_power_quest_05
SAY @3760 /* ~In that case, keep the key. We will be indepted to you. Here is the reward for clearing the outer catacombs, like promised.~ */
IF ~~ THEN DO ~GiveGoldForce(500)
GiveItemCreate("POTN20",[PC],2,0,0)
GiveItemCreate("POTN21",[PC],1,0,0)
GiveItemCreate("RESTORE",[PC],1,0,0)
AddExperienceParty(500)
EraseJournalEntry(@940)
SetGlobal("bs_PCgotFirstReward","LOCALS",1)
SetGlobal("bsClearedCatacombs","GLOBAL",5)~ UNSOLVED_JOURNAL @942 EXIT
END

IF ~~ THEN dark_power_quest_06
SAY @3761 /* ~Thank you for all your efforts. The catacombs are safe again, and we can start doing the usual cantations again. You did us a great deed, indeed. Let me give you these trinkets first, you earned them.~ */
IF ~!Global("bs_PCgotFirstReward","LOCALS",0)~ THEN DO ~GiveGoldForce(1000)
GiveItemCreate("POTN17",[PC],2,0,0)
GiveItemCreate("POTN20",[PC],2,0,0)
GiveItemCreate("POTN21",[PC],2,0,0)
GiveItemCreate("RESTORE",[PC],2,0,0)
AddExperienceParty(1000)
EraseJournalEntry(@775)
EraseJournalEntry(@940)
EraseJournalEntry(@941)
EraseJournalEntry(@942)
EraseJournalEntry(@943)
EraseJournalEntry(@945)
EraseJournalEntry(@946)
EraseJournalEntry(@947)
EraseJournalEntry(@948)
EraseJournalEntry(@949)
EraseJournalEntry(@950)
EraseJournalEntry(@951)
SetGlobal("bsClearedCatacombs","GLOBAL",32)~ SOLVED_JOURNAL @952 + dark_power_quest_07
IF ~Global("bs_PCgotFirstReward","LOCALS",0)~ THEN DO ~GiveGoldForce(500)
GiveItemCreate("POTN17",[PC],2,0,0)
GiveItemCreate("POTN21",[PC],1,0,0)
GiveItemCreate("RESTORE",[PC],1,0,0)
AddExperienceParty(1000)
EraseJournalEntry(@775)
EraseJournalEntry(@940)
EraseJournalEntry(@941)
EraseJournalEntry(@942)
EraseJournalEntry(@943)
EraseJournalEntry(@945)
EraseJournalEntry(@946)
EraseJournalEntry(@947)
EraseJournalEntry(@948)
EraseJournalEntry(@949)
EraseJournalEntry(@950)
EraseJournalEntry(@951)
SetGlobal("bsClearedCatacombs","GLOBAL",32)~ SOLVED_JOURNAL @952 + dark_power_quest_07
END
END //APPEND

CHAIN
IF ~~ THEN BSSATOS dark_power_quest_07
@3762 /* ~I already hinted at the possibility that you could find a home here, a haven at least, a peaceful place where you can rest and gather your strength.~ */
== BSSATOS IF ~Class(Player1,MONK)~ THEN @3763 /* ~As a fellow believer of Ilmater, we would be happy to give you shelter and welcome you any time you need the monastery's tranquility.~ */
== BSSATOS IF ~!Class(Player1,MONK)~ THEN @3764 /* ~For an appropriate donation of 1000 gold we would be happy to give you shelter and welcome you any time you need the monastery's tranquility.~ */
END
IF ~Class(Player1,MONK)~ THEN + monastery_stronghold
+ ~!Class(Player1,MONK)
PartyGoldGT(999)~ + @3765 /* ~That is a great offer. Here is 1000 gold.~ */ DO ~TakePartyGold(1000)~ + dark_power_quest_08
+ ~!Class(Player1,MONK)
PartyGoldLT(1000)~ + @3766 /* ~That is a great offer. Unfortunately, I do not have that much gold, currently.~ */ + dark_power_quest_09
+ ~!Class(Player1,MONK)~ + @3768 /* ~"Donation", huh? It's always the same with you churches. Thanks, I'll pass.~ */ + greetings_19

APPEND BSSATOS
IF ~~ THEN dark_power_quest_08
SAY @3769 /* ~Thank you. Your donation will help the poor and burdened.~ */
IF ~~ THEN + monastery_stronghold
END

IF ~~ THEN dark_power_quest_09
SAY @3770 /* ~In that case, let me welcome you nevertheless. We give shelter to the poor and will not make an exception for you, after all you've done for us.~ */
IF ~~ THEN + monastery_stronghold
END

IF ~~ THEN greetings_02
SAY @3714 /* ~In case of dangers to face, normally, it would be what we call the restless spirits - skeletons, mainly... but now these come on top of something much darker we do not really know what. You should prepare to fight against undead for sure.~ */
+ ~Global("bs_twominksdied","LOCALS",1) Global("bs_TalkedToGerrit","MYAREA",0)~ + @3756 /* ~Where is Gerrit now?~ */ DO ~SetGlobal("bs_twominksdied","LOCALS",2)~ + dark_power_quest_02
+ ~Global("bs_twominksdied","LOCALS",1) Global("bs_TalkedToGerrit","MYAREA",1)~ + @3776 /* I think I met Gerrit already. Is he the monk in the chapel?~ */ + dark_power_quest_02
+ ~Global("bs_twominksdied","LOCALS",0)~ + @3754 /* ~Two monks died because of this?~ */ DO ~SetGlobal("bs_twominksdied","LOCALS",1)~ + dark_power_quest_01
++ @3711 /* ~I'll do it.~ */ + greetings_03
+ ~Global("bs_whatreward","LOCALS",0)~ + @3712 /* ~What would be the reward?~ */ DO ~SetGlobal("bs_whatreward","LOCALS",1)~ + greetings_04
++ @3713 /* ~I'm not interested.~ */ + greetings_05
END

IF ~~ THEN greetings_03
SAY @3715 /* ~Wonderful. This takes a huge burden off our shoulders. The mausoleum should not present any danger, but do not go into the catacombs hastily, as we could not enter them again without stirring the Restless Dead. Usually, they would not wander unless their rest were disturbed by touching the graves, but now they seem to feel disturbed by our mere presence. Still, you might want to respect the rest of the graves, if you want to spare yourself extra trouble.~ */
= @3716 /* ~Here is a key for the mausoleum. You need to retrieve the key to the inner sanctuary where the evil arises. I do not expect you to clear out the dark entity that manifested inside, but do not hesitate to do so if you think you will be successful. In case you do walk through the hidden door, be prepared to face great evil. I will give you one reward right away, because it would be foolish not to.~ */
IF ~~ THEN DO ~GiveItemCreate("bscdkey",LastTalkedToBy(Myself),1,0,0)
GiveItem("SCRL09",LastTalkedToBy(Myself))
EraseJournalEntry(@774)
SetGlobal("bsClearedCatacombs","GLOBAL",3)~ UNSOLVED_JOURNAL @775 EXIT
END

IF ~~ THEN greetings_04
SAY @3717 /* ~We do not have much to give, but if you retrieve the key, I will forward you a gold reward from the Tower Captain, as well as some scrolls and potions from our fund. If you also destroy the dark evil and save us the embarrassment of having to ask the Guard for help, this monastery will always have a place for you if you need a rest from the hustle and bustle of the world.~ */
+ ~Global("bs_twominksdied","LOCALS",1) Global("bs_TalkedToGerrit","MYAREA",0)~ + @3756 /* ~Where is Gerrit now?~ */ DO ~SetGlobal("bs_twominksdied","LOCALS",2)~ + dark_power_quest_02
+ ~Global("bs_twominksdied","LOCALS",1) Global("bs_TalkedToGerrit","MYAREA",1)~ + @3776 /* I think I met Gerrit already. Is he the monk in the chapel?~ */ + dark_power_quest_02
+ ~Global("bs_twominksdied","LOCALS",0)~ + @3754 /* ~Two monks died because of this?~ */ DO ~SetGlobal("bs_twominksdied","LOCALS",1)~ + dark_power_quest_01
+ ~Global("bs_awaitsme","LOCALS",0)~ + @3710 /* ~What do you think could await me in there?~ */ DO ~SetGlobal("bs_awaitsme","LOCALS",1)~ + greetings_02
++ @3711 /* ~I'll do it.~ */ + greetings_03
++ @3713 /* ~I'm not interested.~ */ + greetings_05
END

IF ~~ THEN greetings_05
SAY @3718 /* ~Ah well, this would have been too easy for us, ha. Then we will deal with this with the Guard's help later. Until then, the catacombs will stay locked so there won't be any danger for the common folk. Please be so kind and do not spread the rumor, least it stirs a panic - or attracts fearnoughts to endanger themselves.~ */
IF ~~ THEN DO ~SetGlobal("bsClearedCatacombs","GLOBAL",2)~ EXIT
END


/* Abbot promised to heal the party (cannot happen for NumTimesTalkedTo(0)) */


/* Abbot is healing */
IF ~Global("bsAbbotHeals","GLOBAL",3)~ THEN busy
SAY @3778 /* ~[Abbot]Just one moment, let me finish healing all of you.~ */
IF ~~ THEN EXIT
END

IF ~Global("bsAbbotHealingInjuryDetected","MYAREA",1)~ THEN healing
SAY @3703 /* ~I see you bear injuries from your last battles, my friends. Did you come to call on my debts? Should I restore you to full health?~ */
++ @3704 /* ~Yes, please do so, and thanks.~ */ + healing_00
++ @3705 /* ~No, not today. I'll spare that for another day.~ */ DO ~SetGlobal("bsAbbotHealingInjuryDetected","MYAREA",2)~ + greetings_08
END

IF ~~ THEN healing_00
SAY @3706 /* ~With pleasure. Please wait until I am finished.~ */
IF ~~ THEN DO ~SetGlobal("bsAbbotHealingInjuryDetected","MYAREA",3)
SetGlobal("bsAbbotHeals","GLOBAL",3)~ EXIT
END

IF WEIGHT #-1
~Global("bsAbbotHeals","GLOBAL",4)~ THEN healing_01
SAY @3707 /* ~There, all of you should be as good as new. Ilmater's Blessing be with you.~ */
IF ~~ THEN DO ~SetGlobal("bsAbbotHeals","GLOBAL",5)~ EXIT
END

/* one additional welcome greeting */

IF ~NumTimesTalkedToGT(0)
Global("bs_WelcomeBack","LOCALS",0)~ THEN greetings_00
SAY @3708 /* ~Welcome again.~ */
IF ~~ THEN DO ~SetGlobal("bs_WelcomeBack","LOCALS",1)~ + greetings_08
END

/* returning the stolen gold for the alms */
IF ~~ THEN greetings_06
SAY @3719 /* ~Is that so! You are a good person for bringing it here, my friend. Do you happen to know how much is left?~ */
++ @3720 /* ~It was 1467 gold exact.~ */ DO ~SetGlobal("bsPCKnowsExactSum","LOCALS",1)~ + greetings_11
++ @3722 /* ~Something around 1500 gold, I think.~ */ + greetings_11
++ @3721 /* ~No, I took the gold from where it was hidden by the thief and brought it here.~ */ + greetings_13
++ @3723 /* ~Do you expect me to count that for you?~ */ + greetings_12
++ @3724 /* ~No, I don't. How much was the whole sum, if I may ask?~ */ + greetings_13
END

IF ~~ THEN greetings_07
SAY @3725 /* ~I'm the abbot of this monastery. We are followers of Ilmater, the Crying God.~ */
IF ~~ THEN + greetings_08
END

/* general greeting. All quests related reply options go here */

IF ~True()~ THEN greetings_08
SAY @3726 /* ~Is there anything else I can do for you?~ */

/* group is injured and abbot promised to heal all of them once */
+ ~Global("bsAbbotHeals","GLOBAL",2)~ + @3777 /* Please heal all of us, as promised.~ */ + healing_00

/* stolen alms for the poor */
+ ~GlobalGT("bsShucksBrother","GLOBAL",0) Global("bsPCSawStolenGold","GLOBAL",1) PartyGoldGT(1466)~ + @3727 /* ~I have here what is left of the alms that were stolen by the soldier.~ */ DO ~TakePartyGold(1467) SetGlobal("bsPCSawStolenGold","GLOBAL",2)~ + greetings_06
+ ~GlobalGT("bsShucksBrother","GLOBAL",0) Global("bsPCSawStolenGold","GLOBAL",1) PartyGoldGT(1466)~ + @3728 /* ~What a pity so much gold was stolen from your monastery. Especially pitiful that it will never be recovered.~ */ DO ~EraseJournalEntry(@750) AddJournalEntry(@752,QUEST_DONE) SetGlobal("bsPCSawStolenGold","GLOBAL",2)~ + greetings_17

/* asking for quests */
+ ~Global("bsClearedCatacombs","GLOBAL",0)
	OR(2)
		GlobalLT("bsMissingMonk","GLOBAL",5)
		Global("bsMissingMonk","GLOBAL",10)~ + @1017 /* ~Anything going on here that would need an adventurer?~ */ + greetings_01
+ ~Global("bsClearedCatacombs","GLOBAL",1)~ + @3729 /* ~The priestess of Selune said you have some troubles in the catacombs worth for an adventurer?~ */ + greetings_01
+ ~GlobalGT("bsMissingMonk","GLOBAL",4) 
	GlobalLT("bsMissingMonk","GLOBAL",10) GlobalLT("bsClearedCatacombs","GLOBAL",2)~ + @3730 /* ~Is there anything more you'd need help with?~ */ DO ~SetGlobal("bsAskedForWork","LOCALS",1)~ + greetings_01
+ ~GlobalGT("bsClearedCatacombs","GLOBAL",29)
	GlobalLT("bsAskedForWork","LOCALS",2)~ + @3730 /* ~Is there anything more you'd need help with?~ */ + greetings_18

/* quest Dark Power in the Seatower Catacombs */
+ ~Global("bsClearedCatacombs","GLOBAL",2)~ + @3731 /* ~About the task you offered me - I would be ready to go into the catacombs now.~ */ + greetings_03
+ ~PartyHasItem("bscckey")
	GlobalLT("bsClearedCatacombs","GLOBAL",5)~ + @3771 /* ~We found the key to the inner catacombs. One of the monks is dead, the other one was nowhere to be seen.~ */ + dark_power_quest_03
+ ~PartyHasItem("bscckey")
	Global("bsClearedCatacombs","GLOBAL",5)~ + @3772 /* ~I'm sorry, but my work ends here. The catacombs are cleared from any obvious threat - the mausoleum too, by the way - and this is all I'll do for that.~ */ + dark_power_quest_04
+ ~GlobalGT("bsClearedCatacombs","GLOBAL",6)
	GlobalLT("bsClearedCatacombs","GLOBAL",18)
	OR(2)
		PartyHasItem("bsrsd07")
		GlobalLT("bsTalkedToRestlessDead","GLOBAL",10)~ + @3773 /* ~I'm still on clearing the catacombs. I have an idea what happened there, but it is a work in progress.~ */ + greetings_19
+ ~Global("bsTalkedToRestlessDead","GLOBAL",10)
	GlobalLT("bsClearedCatacombs","GLOBAL",32)~ + @3774 /* ~I banned whatever manifested in the inner sanctum. The catacombs should be cleared now.~ */ + dark_power_quest_06

/* general chat */
+ ~Global("bsWhatDoYouDo","LOCALS",0)~ + @3733 /* ~What do you do here?~ */ DO ~SetGlobal("bsWhatDoYouDo","LOCALS",1)~ + greetings_07
++ @3734 /* ~Thank you and good day to you.~ */ EXIT
END

/* deprecated
IF ~~ THEN greetings_09
SAY @## /* ~~ */
END

IF ~~ THEN greetings_10
SAY @## /* ~~ */
END
*/

IF ~~ THEN greetings_11
SAY @3740 /* ~Ah, so it is more than half of what we collected.~ */
IF ~~ THEN + greetings_13
END

IF ~~ THEN greetings_12
SAY @3741 /* ~No, no of course not.~ */
IF ~~ THEN + greetings_13
END
END //APPEND

CHAIN
IF ~~ THEN ~BSSATOS~ greetings_13
@3742 /* ~It was an unusually large sum we raised by a charity event here, inside the tower. A lot of wealthy folks like to spend their time here, as the atmosphere is a very special one. Originally, it was a total over 2000 gold...~ */
== ~BSSATOS~ IF ~Global("bsMissingMonk","GLOBAL",5)~ THEN @3743 /* ~...2068, to be exact.~ */
== ~BSSATOS~ IF ~!Global("bsMissingMonk","GLOBAL",5)~ THEN @3744 /* ~...2067, to be exact.~ */
END
+ ~Global("bsMissingMonk","GLOBAL",5) Global("bsPCKnowsExactSum","LOCALS",1)~ + @3745 /* ~2068... that makes a difference to 601 to what was left. 1 gold coin for the beggar in front of the Ilmater's Shrine... and probably 600 with which Shuck tried to pay off the debts.~ */ + greetings_14
++ @3746 /* ~Impressive, for times like these.~ */ + greetings_16
++ @3747 /* ~Aha.~ */ + greetings_15


APPEND ~BSSATOS~

IF ~~ THEN greetings_14
SAY @3748 /* ~(sigh) Yes, poor Martina didn't come far with her round that day...~ */
IF ~~ THEN + greetings_15
END

IF ~~ THEN greetings_15
SAY @3749 /* ~I sincerely hope the gold did good wherever it was spent. If only Soldier Shuck would have talked to us instead of forcing his way to it... much would be different. There is always a way without violence.~ */
= @3750 /* ~Thank you for bringing it, my friend. Please, do undestand that I will not offer you any gold or item as a reward in this case, as no mundane reward would be appropriate. But next time you come here all bruised and battered, I will bestow my god's blessings on you without taking your gold for it.~ */
IF ~~ THEN DO ~EraseJournalEntry(@750) SetGlobal("bsAbbotHeals","GLOBAL",1)~ SOLVED_JOURNAL @751 EXIT
END

IF ~~ THEN greetings_16
SAY @3751 /* ~It is. People want to do good, if they are shown a way how to do so with their own means.~ */
IF ~~ THEN + greetings_15
END

IF ~~ THEN greetings_17
SAY @3752 /* ~Yes, it is sad. So the prisoner spent it all, hm? Sad, really. Thank you for letting me know.~ */
IF ~~ THEN EXIT
END

IF ~~ THEN greetings_18
SAY @3753 /* ~The restless spirits in the catacombs was all we needed help with. I'm afraid - no, actually, I am *thankful* - that there is nothing more from our side.~ */
IF ~~ THEN DO ~SetGlobal("bsAskedForWork","LOCALS",2)~ EXIT
END

IF ~~ THEN greetings_19
SAY @3775 /* ~Ilmater's blessing be with you.~ */
IF ~~ THEN EXIT
END

IF ~~ THEN monastery_stronghold
SAY @3767 /* Feel free to call the first room next to the entrance your own. There is a trunk there you can use for your belongings, noone will trespass your chamber. Fold down the bed anytime you want to rest here. Welcome, <CHARNAME>. */
IF ~~ THEN DO ~AddExperienceParty(500)
SetGlobal("bs_IlmaterMonasteryStronghold","GLOBAL",1)~ JOURNAL @956 EXIT
END


END //APPEND
