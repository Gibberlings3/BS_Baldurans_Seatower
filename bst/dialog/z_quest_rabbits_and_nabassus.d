/* Note: Quest for caging the rabbits is in roryn_ratquest.d */


BEGIN bstq007
BEGIN bstq008

/* Quest: 101 Rabbits or Two Mages in Trouble (not an official title) */

BEGIN bsghast2 //Ulf

IF ~Global("bsFreedUlf","GLOBAL",0)~ THEN free
SAY ~Free! I am free at last! I thank you, my saviors, for freeing me from being controlled by this Nabassu Fledgling. His Death Gaze hit me right when my friend and I entered these halls, and I was bound to serve him ever since.~
= ~Klaus made it outside, but... I don't think he is well, considering you must have the scroll to enter the dungeons...?~
+ ~!Dead("bstq004")~ + ~He is alive, if you are worried about that.~ + free_01
++ ~Last time I saw him he was in Balduran's Seatower, conjuring rabbits. *Lots* of rabbits.~ + free_03
++ ~Oh, he gave it to me on his own free will. At least I would call it that.~ + free_02
++ ~What of it?~ + free_01
++ ~Oh, you mean that crazy mage was talking about saving *you*? I thought he was talking about our "host" Alguine!~ + free_07
END

IF ~~ THEN free_01
SAY ~Oh, I wasn't implying anything!~
IF ~~ THEN + free_04
END

IF ~~ THEN free_02
SAY ~He did?~
IF ~~ THEN + free_04
END

IF ~~ THEN free_03
SAY ~Erm, rabbits?...~
IF ~~ THEN + free_04
END

IF ~~ THEN free_04
SAY ~Just that I thought he would... well, search for a way to help me, is all.~
++ ~Oh, he did. Believe me, he did.~ + free_05
++ ~Well - here we are! No?~ + free_05
++ ~He wasn't really able to, but I think he tried.~ + free_05
++ ~Why don't you go and find out yourself.~ + free_06
END

IF ~~ THEN free_05
SAY ~Ah! Oh! I see!~
IF ~~ THEN + free_06
END

IF ~~ THEN free_06
SAY ~I need to find him and see how he fares. The poor man, he must be really desperate... Thank you, my saviors. I have nothing on me that could be of use to you, but next time we meet, I'll have something ready to give you!~
IF ~~ THEN DO ~SetGlobal("bsFreedUlf","GLOBAL",1) 
EraseJournalEntry(@763)
ActionOverride("bsghast2",CreateVisualEffectObject("SPDIMNDR",Myself))
ActionOverride("bsghast2",DestroySelf())~ UNSOLVED_JOURNAL @764 EXIT
END

IF ~~ THEN free_07
SAY ~Crazy Mage? Are you talking about Klaus, by any chance?~
++ ~I think that was his name, yes. He was searching for someone strong enough to save "him". So I guess he was referring to you?~ + free_05
++ ~What of it?~ + free_04
END

/* guest in bs1011.are seatower second floor */

BEGIN bstq006 //noblewoman guest

IF ~AreaCheck("bs1011")~ THEN guest
SAY ~Rats! There is rats everywhere! I swear I saw rats running around above. This is so filthy!~
IF ~~ THEN DO ~EscapeArea()~ UNSOLVED_JOURNAL @785 EXIT
END


/* guest in ys0113.are Seatower third floor */

BEGIN bstq005 //male guest

IF ~True()~ THEN guest
SAY ~Don't open that door! He's doing it again. That man is *crazy*!~
IF ~~ THEN DO ~EscapeArea()~ UNSOLVED_JOURNAL @786 EXIT
END

BEGIN bstq004 //Klaus

IF ~Global("bsRabbitQuest","GLOBAL",0)~ THEN rabbits
SAY ~I need to conjure the right ones. The right ones will free him! The right ones will kill the beast. The right ones...~
IF ~~ THEN DO ~SetGlobal("bsCreateAnotherRabbit","MYAREA",1) SetGlobal("bsRabbitQuest","GLOBAL",1)~ EXIT
END

//bsroryn: from roryn_ratquest.d
BEGIN bsroryn //RORYN, inn staff

CHAIN
IF ~Global("bsRabbitQuest","GLOBAL",1)~ THEN bstq004 rabbits_01
~Not the right one! Never the right one... I... I will never save him... Never...~
== bsroryn ~Oh no, Mr. Klaus! Ye remember what was said, don't ye? Now I need t' kick ye ou' of th' inn... I'm very sorry, ye need t' believe me that!~
= ~Come o', grab yer things - leave t' rabbits, I'll go chasing them in a moment - and follow me, please...~
END
IF ~~ THEN DO ~SetGlobal("bsRabbitQuest","GLOBAL",2) 
EraseJournalEntry(@785)
EraseJournalEntry(@786)~ UNSOLVED_JOURNAL @787 EXIT



/* outside, BS1000.are [1523.1794],14 */

APPEND bstq004 //Klaus

IF ~Global("bsRabbitQuest","GLOBAL",4)~ outside
SAY ~Now I can call the right ones! Do you want to see?~
++ ~Ah, here you are. What is it you want to show me?~ + outside_04
++ ~What do you mean, you can conjure brown rabbits now?~ + outside_03
+ ~GlobalGT("bsCollect Rabbits","GLOBAL",1)~ + ~Leave me be, I just chased all your stupid rabbits through the tavern's ails, I really don't want to see any more.~ + outside_01
++ ~Don't you dare conjure another rabbit in my presence.~ + outside_01
END

IF ~~ THEN outside_01
SAY ~But... it's the right ones now! It has to be. I need to show someone, or I won't be sure!~
IF ~~ THEN DO ~SetGlobal("bsRabbitQuest","GLOBAL",5)
EraseJournalEntry(@787)~ UNSOLVED_JOURNAL @788 EXIT
END

IF ~Global("bsRabbitQuest","GLOBAL",5)~ THEN outside_02
SAY ~Can I show you now?~
++ ~Now I have time, yes.~ + outside_04
++ ~(sigh) Fine, then show me.~ + outside_04
++ ~No.~ EXIT 
END

IF ~~ THEN outside_03
SAY ~No, the color is irrelevant.~
IF ~~ THEN + outside_04
END

IF ~~ THEN outside_04
SAY ~It's the teeth! Look at the teeth!~
IF ~~ THEN DO ~SetGlobal("bsRabbitQuest","GLOBAL",6)~ EXIT
END

IF ~Global("bsRabbitQuest","GLOBAL",7) 
Global("bsRQ_InitiateDialogue","LOCALS",0)~ THEN failure_failsafe
SAY ~Need to test it... the right ones!~
IF ~~ THEN EXIT
END

IF ~Global("bsRabbitQuest","GLOBAL",7) 
Global("bsRQ_InitiateDialogue","LOCALS",1)~ THEN failure
SAY ~No! NO!! Dead! It is dead... It is not strong enough... Never strong enough...~

/*
++ ~What in the names of the gods was that?~ + failure_01
++ ~A vampiric rabbit? Really?~ + failure_01
++ ~Why don't we try whether you are strong enough, you idiot!~ + failure_01
*/
// ## quest not ready, workaround for EAOB
IF ~~ THEN EXTERN bstq007 failure_03
END

IF ~~ THEN failure_01
SAY ~But *you* are! You are strong enough! Take this, and go inside. Destiny wants you to! Destiny! Yes! And save him... Please save him...~ 
++ ~It will be an honor to help your friend.~ + failure_02
++ ~Er, what?~ + failure_02
++ ~We are talking about a person, yes? Not a rabbit? And especially not this last type, hm?~ + failure_02
++ ~A dungeon to explore? Sure, why not.~ + failure_02
++ ~Stop tucking filthy scrolls into my rope!~ + failure_02
END

END //APPEND


CHAIN
IF ~~ THEN bstq004 failure_02
~He is in the ruins, the old ruins in the Wood of Sharp Teeth, he is trapped!~
== %DYNAHEIR_JOINED% IF ~InParty("Dynaheir") See("Dynaheir") !StateCheck("Dynaheir",CD_STATE_NOTVALID)~ THEN @2924
== %EDWIN_JOINED% IF ~InParty("Edwin") See("Edwin") !StateCheck("Edwin",CD_STATE_NOTVALID)~ THEN @2922
END
IF ~~ THEN EXTERN bstq007 failure_03


CHAIN
IF ~~ THEN bstq007 failure_03
~Now *what* in Selune's name was that? We have enough trouble and work fighting off the abominations that disgrace our goddess' realms, we do *not* need new undead creations on top of it!~
END
++ ~It was a vampiric rabbit, I wager.~ EXTERN bstq007 selune_02
++ ~Oh, that's rich. Now where were you people when I actually *fought* that undead rabbit?~ EXTERN bstq007 selune_01

APPEND bstq007

IF ~~ THEN selune_01
SAY ~I came here as fast as we could. You did make enough noise, mind.~
IF ~~ THEN + selune_02
END

END //APPEND

CHAIN
IF ~~ THEN bstq007 selune_02
~Well then, what to do with this stupid fool?!~
== bstq008 ~This man is very troubled, Priestess of Selune. We monks of Ilmater will take him in and give him shelter, until his racing mind calms down again.~
== bstq007 ~Pftt, suit yourselves. But I guarantee you, we will *not* be able to hear your screams if that madman continues to conjure vampriric rabbits inside the monastery. (snort)~
END

/*
IF ~~ THEN DO ~GiveItemCreate("bsalmirn",Player1,0,0,0)
EraseJournalEntry(@787)
EraseJournalEntry(@788) 
AddJournalEntry(@789,QUEST_DONE) 
AddJournalEntry(@760,QUEST) 
SetGlobal("bsRabbitQuest","GLOBAL",8)~ EXIT

IF ~InParty("Edwin") See("Edwin") !StateCheck("Edwin",CD_STATE_NOTVALID)~ THEN DO ~GiveItemCreate("bsalmirn",Player1,0,0,0)
EraseJournalEntry(@787)
EraseJournalEntry(@788) 
AddJournalEntry(@789,QUEST_DONE) 
AddJournalEntry(@761,QUEST) 
SetGlobal("bsRabbitQuest","GLOBAL",8)~ EXIT
*/
// ## quest not ready, workaround for EAOB
IF ~~ THEN DO ~EraseJournalEntry(@787)
EraseJournalEntry(@788) 
AddJournalEntry(@789,QUEST_DONE) 
SetGlobal("bsRabbitQuest","GLOBAL",8)~ EXIT

APPEND bstq004


IF ~GlobalGT("bsFreedUlf","GLOBAL",2)~ THEN inmonastery
SAY ~Thank you so much for helping us!~
IF ~~ THEN EXIT
END

IF ~Global("bsRabbitQuest","GLOBAL",10) Global("bsFreedUlf","GLOBAL",0)~ THEN inmonastery_01
SAY ~Save him... need to find a way, a way...~
IF ~~ THEN EXIT
END

IF ~Global("bsRabbitQuest","GLOBAL",10) GlobalGT("bsFreedUlf","GLOBAL",0)~ THEN inmonastery_02
SAY ~You... you made it!~
IF ~~ THEN EXTERN bsghast2 seatower
END


END //APPEND

CHAIN
IF ~Global("bsFreedUlf","GLOBAL",2)~ THEN bsghast2 seatower
~Oh! Oh, look who is here, Klaus! It's the adventurers who saved me! Welcome! Welcome, my friends.~
== bstq004 ~I... I thank you for saving my friend.~
== bsghast2 ~I said I would have a reward ready when next we meet. Let me get it quickly.~
END
++ ~Don't worry about a reward.~ + seatower_01
++ ~It's good to see you all well.~ + seatower_03
++ ~It's about time!~ + seatower_02

APPEND bsghast2 

IF ~~ THEN seatower_01
SAY ~What? Oh, nonono.~
IF ~~ THEN + seatower_02
END

IF ~~ THEN seatower_02
SAY ~You deserve a reward, and we are more than willing to give you one for what you've done.~
IF ~~ THEN DO ~GiveItemCreate("SCRLAL",[PC],1,0,0) GiveItemCreate("SCRL2G",[PC],1,0,0) GiveItemCreate("SCRL62",[PC],1,0,0) GiveItemCreate("POTN29",[PC],1,0,0) 
EraseJournalEntry(@764)
EraseJournalEntry(@765)
SetGlobal("bsFreedUlf","GLOBAL",3)~ SOLVED_JOURNAL @766 + seatower_03
END

END //APPEND

CHAIN
IF ~~ THEN bsghast2 seatower_03
~What you did for us was generous, to say the least. Here, I hope this will be of use to you. All I can say is - it's a bad idea to go dungeon crawling if you are a group of two mages, only. A very bad idea.~
== bsghast2 IF ~NumInParty(2) Class(Player1,MAGE_ALL) OR(5) Class(Player2,MAGE_ALL) Class(Player3,MAGE_ALL) Class(Player4,MAGE_ALL) Class(Player5,MAGE_ALL) Class(Player6,MAGE_ALL)~ THEN ~I mean... er, it was for *us*, that is. Heh.~
== bsghast2 ~I do not mean to sound unthankful, but Klaus is in a very bad condition, and needs to rest again, soon.~
END
IF ~~ THEN + seatower_04

APPEND bsghast2

IF ~~ THEN seatower_04
SAY ~Do you have any more questions?~
+ ~Global("bsAskedDungeon","LOCALS",0)~ + ~Can you tell me something about this dungeon?~ DO ~SetGlobal("bsAskedDungeon","LOCALS",1)~ + seatower_05
+ ~Global("bsAskedRabbits","LOCALS",0)~ + ~Alright, I can't keep quiet any more. WHY RABBITS?~ DO ~SetGlobal("bsAskedRabbits","LOCALS",1)~ EXTERN bstq004 seatower_06
++ ~No more question. I hope you'll be fine.~ + seatower_07
++ ~I'll leave you two alone, then.~ + seatower_07
END

IF ~~ THEN seatower_05
SAY ~The Labyrinth of Future Memories, yes. We read about it in some very old tome, and discovered the Almiran's scroll soon afterwards. We don't know too much about it, though, there is only little to find - mainly descriptions of people who found the entrance and been into it. At least of those who came out sane, as it can go quite differently, too. The Thayan mage Almiran was the first who managed to find a direct entry and stabilized it with his scroll. What became of him we don't know.~
= ~Appearently, only the one given the scroll will see "future memories" of his life. We didn't know this when we aquired the scroll, Klaus was the chosen one in our case, I just went along and watched him suffer...~
IF ~~ THEN + seatower_04
END

END //APPEND

CHAIN
IF ~~ THEN bstq004 seatower_06
~Didn't... mean to. Was aiming for bigger... but was also scared to really call anything else.~
== bsghast2 ~Poor Klaus has a concentration span of a toddler since the fight with the Nabassu, I guess the dungeon added to it. As I already said, we appreciate your help - with everything.~
END
IF ~~ THEN EXTERN bsghast2 seatower_04


CHAIN
IF ~~ THEN bsghast2 seatower_07
~Our sincere thanks will accompany you, friend. We are very sorry you were in so much trouble because of us.~
== bstq004 ~Really sorry... didn't know how else to help Ulf...~
== bsghast2 ~Klaus, don't overstrain yourself. Come, sit down for a moment.~
== bstq004 ~Not right. You are the one who was turned into a Ghast all these months... Should take care of you, not the other way around...~
== bsghast2 ~Nonsense. I'm as good as new. You are the one worrying and searching all those times, weakened by that dungeon. Here, take this blanket... Do you want to drink something? I could ask the cook for one of her fine broths...~
EXIT

APPEND bsghast2 

IF ~GlobalGT("bsFreedUlf","GLOBAL",2)~ THEN seatower_08
SAY ~You will always be welcome here, friend.~
IF ~~ THEN EXIT
END

END //APPEND


BEGIN bsrabbit

IF ~!PartyHasItem("bscage")~ THEN rabbit
SAY ~(The rabbit is easy to catch. You could take it - but what would you do with a struggling rabit in your backpack?)~
IF ~~ THEN EXIT
END

IF ~PartyHasItem("bscage")~ THEN rabbit_01
SAY ~(The rabbit is easy to catch.)~
++ ~(You take it up.)~ + rabbit_03
++ ~(You let it go.)~ + rabbit_02
END

IF ~~ THEN rabbit_02
SAY ~(The rabbit hops away.)~
IF ~~ THEN EXIT
END

IF ~~ THEN rabbit_03
SAY ~(You put it into the cage.)~
IF ~~ THEN DO ~IncrementGlobal("bsRabbitCaught","GLOBAL",1) ActionOverride(Myself,DestroySelf())~ EXIT
END