//Guoremor

BEGIN ~BSSATOS~


/* first greeting */

IF ~NumTimesTalkedTo(0)~ THEN greetings
SAY @3700
IF ~~ THEN + greetings_08
IF ~Global("bsMissingMonk","GLOBAL",4)~ THEN + missing_monk
END

/* Missing Monk Quest */

IF ~Global("bsMissingMonk","GLOBAL",4)~ THEN missing_monk
SAY @3701 /* ~You are the ones that found poor Martina. Yes, there is a lot of greed and evil in this world. We Followers of Ilmater try to do our best, but there is only so much we can do. Appearently, soldier Shuck had a lot of debts to pay for, so he forced his way to our collected alms, killing poor Martina in the process. Please, as a sign of our gratitude, take these scrolls. May they help you doing good.~ */
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

/* Abbot promised to heal the party (cannot happen for NumTimesTalkedTo(0)) */

IF ~Global("bsAbbotHeals","GLOBAL",2)~ THEN healing
SAY @3703 /* ~I see you bear injuries from your last battles, my friends. Did you come to call on my debts? Should I restore you to full health?~ */
++ @3704 /* ~Yes, please do so, and thanks.~ */ + healing_00
++ @3705 /* ~No, not today. I'll spare that for another day.~ */ + greetings_08
END

IF ~~ THEN healing_00
SAY @3706 /* ~With pleasure. Please wait until I am finished.~ */
IF ~~ THEN DO ~SetGlobal("bsAbbotHeals","GLOBAL",3)~ EXIT
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


/* Restless Dead */

IF ~~ THEN greetings_01
SAY @3709 /* ~Well... we would have a task for a group of fearless adventurers. There is evil inside the tower's catacombs, and usually we monks of Ilmater take care it does not accumulate to a point where it cannot be handled properly. Unfortunately, due to recent events we were not able to do our incantations regularly and now we are not sure what manifested inside. We would need someone with the necessary capabilities to go into the inner sanctuary and look what they'll find.~ */
++ @3710 /* ~What do you think would await me there?~ */ + greetings_02
++ @3711 /* ~I'll do it.~ */ + greetings_03
++ @3712 /* ~What would be the reward?~ */ + greetings_04
++ @3713 /* ~I'm not interested.~ */ + greetings_05
END

IF ~~ THEN greetings_02
SAY @3714 /* ~We call it the restless spirits. Skeletons, mainly... but maybe even something much darker. You should prepare to fight against undead.~ */
++ @3711 /* ~I'll do it.~ */ + greetings_03
++ @3712 /* ~What would be the reward?~ */ + greetings_04
++ @3713 /* ~I'm not interested.~ */ + greetings_05
END

IF ~~ THEN greetings_03
SAY @3715 /* ~Wonderful. This takes a huge burden off our shoulders. The first tomb presents no danger, but do not go into the catacombs hastily, and please respect the rest of the dead, or there will be consequences - not from us, but from the restless dead themselves.~ */
= @3716 /* ~I will give you two keys. The first one is for the catacombs itself, but only we monks have the key for the inner sanctuary where the evil arises. You need to find the hidden door. Walk through it and be prepared to face great evil. I will give you one reward right away, because it would be foolish not to.~ */
IF ~~ THEN DO ~GiveItemCreate("bscckey",[PC],1,0,0)
GiveItemCreate("bscdkey",[PC],1,0,0)
GiveItemCreate("SCRL09",[PC],1,0,0)
EraseJournalEntry(@774)
SetGlobal("bsClearedCatacombs","GLOBAL",3)~ UNSOLVED_JOURNAL @775 EXIT
END

IF ~~ THEN greetings_04
SAY @3717 /* ~We do not have much to give, but I will forward you a gold reward from the Tower Captain, as well as some scrolls and potions from our fund.~ */
++ @3710 /* ~What do you think would await me there?~ */ + greetings_02
++ @3711 /* ~I'll do it.~ */ + greetings_03
++ @3713 /* ~I'm not interested.~ */ + greetings_05
END

IF ~~ THEN greetings_05
SAY @3718 /* ~Ah well, this would have been too easy for us, ha. Then we will deal with this ourselves later. Until then, the catacombs will stay locked so there won't be any danger for the common folk. Please be so kind and do not spread the rumor, least it stirrs a panic - or attracts fearnoughts to endanger themselves.~ */
IF ~~ THEN DO ~SetGlobal("bsClearedCatacombs","GLOBAL",2)~ EXIT
END

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

/* normal greeting */

IF ~True()~ THEN greetings_08
SAY @3726 /* ~Is there anything else I can do for you?~ */
+ ~GlobalGT("bsShucksBrother","GLOBAL",0) Global("bsPCSawStolenGold","GLOBAL",1) PartyGoldGT(1466)~ + @3727 /* ~I have here what is left of the alms that were stolen by the soldier.~ */ DO ~TakePartyGold(1467) SetGlobal("bsPCSawStolenGold","GLOBAL",2)~ + greetings_06

+ ~GlobalGT("bsShucksBrother","GLOBAL",0) Global("bsPCSawStolenGold","GLOBAL",1) PartyGoldGT(1466)~ + @3728 /* ~What a pity so much gold was stolen from your monastery. Especially pitiful that it will never be recovered.~ */ DO ~EraseJournalEntry(@750) AddJournalEntry(@752,QUEST_DONE) SetGlobal("bsPCSawStolenGold","GLOBAL",2)~ + greetings_17

+ ~Global("bsClearedCatacombs","GLOBAL",0)
OR(2)
GlobalLT("bsMissingMonk","GLOBAL",5)
Global("bsMissingMonk","GLOBAL",10)~ + @1017 /* ~Anything going on here that would need an adventurer?~ */ + greetings_01
+ ~Global("bsClearedCatacombs","GLOBAL",1)~ + @3729 /* ~The priestess of Selune said you have some troubles in the catacombs worth for an adventurer?~ */ + greetings_01
+ ~GlobalGT("bsMissingMonk","GLOBAL",4) 
GlobalLT("bsMissingMonk","GLOBAL",10) GlobalLT("bsClearedCatacombs","GLOBAL",2)~ + @3730 /* ~Is there anything more you'd need help with?~ */ DO ~SetGlobal("bsAskedForWork","LOCALS",1)~ + greetings_01
+ ~GlobalGT("bsClearedCatacombs","GLOBAL",1)
Global("bsAskedForWork","LOCALS",0)~ + @3730 /* ~Is there anything more you'd need help with?~ */ + greetings_18
+ ~Global("bsClearedCatacombs","GLOBAL",2)~ + @3731 /* ~About the task you offered me - I would be ready to do it now.~ */ + greetings_03
+ ~Global("bsClearedCatacombs","GLOBAL",4)~ + @3732 /* ~We had a... chat with the restless dead in the catacombs.~ */ + greetings_09
+ ~Global("bsWhatDoYouDo","LOCALS",0)~ + @3733 /* ~What do you do here?~ */ DO ~SetGlobal("bsWhatDoYouDo","LOCALS",1)~ + greetings_07
++ @3734 /* ~Thank you and good day to you.~ */ EXIT
END

IF ~~ THEN greetings_09
SAY @3735 /* ~Is that so! What exactly did you find?~ */
++ @3736 /* ~A skeleton which proclaimed to be the ruler of the dead manifested in the inner sanctuary and said curious things about my father.~ */ + greetings_10
++ @3737 /* ~There is a talking skeleton in the inner sanctuary. I couldn't fight it, though, it only sends it minions.~ */ + greetings_10
++ @3738 /* ~If you treat carefully, be polite and do not disturb the rest of the dead, the catacombs should be safe.~ */ + greetings_10
END

IF ~~ THEN greetings_10
SAY @3739 /* ~Indeed? Interesting. This should suffice until we are strong enough to do the usual cantations again. You did us a great deed, indeed. Let me give you your reward, you earned it. Ilmater's mercy be with you.~ */
IF ~~ THEN DO ~GiveGoldForce(500)
GiveItemCreate("POTN20",[PC],3,0,0)
GiveItemCreate("POTN21",[PC],2,0,0)
GiveItemCreate("RESTORE",[PC],2,0,0)
EraseJournalEntry(@775)
SetGlobal("bsClearedCatacombs","GLOBAL",5)~ SOLVED_JOURNAL @775 EXIT
END

IF ~~ THEN greetings_11
SAY @3740 /* ~Ah, so it is more than half of what we collected.~ */
IF ~~ THEN + greetings_13
END

IF ~~ THEN greetings_12
SAY @3741 /* ~No, no of course not.~ */
IF ~~ THEN + greetings_13
END

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
SAY @3753 /* ~The restless spirits in the catacombs was all we needed help with. I'm afraid there is nothing more from our side.~ */
IF ~~ THEN DO ~SetGlobal("bsAskedForWork","LOCALS",1)~ EXIT
END


END //APPEND