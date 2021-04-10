
/* Questgiver: */
/* Tower Guard Shuck */

BEGIN bsshuck

CHAIN
IF ~Global("bsShucksBrother","GLOBAL",0)~ THEN bsshuck shuck_00
~You! You are the ones I need to talk to.~
== bsshuck IF ~Global("bsJumpStartDGQuest","GLOBAL",0)~ THEN ~And you came!~
== bsshuck IF ~GlobalGT("bsJumpStartDGQuest","GLOBAL",0)~ THEN ~Please, please listen to me!~
== bsshuck IF ~OR(2)
Global("bsMissingMonk","GLOBAL",4)
Global("bsMissingMonk","GLOBAL",5)~ THEN ~You found the dead monk. I'm not a monster!~
== bsshuck IF ~Global("bsMissingMonk","GLOBAL",10)~ THEN ~I guess they told you I'm a reckless thief.~
== bsshuck ~I need to explain what happened. And... I need your help.~
END
++ ~Fine, I'll listen.~ + shuck_03
++ ~I'm not helping you get out of prison!~ + shuck_01
+ ~Global("bsJumpStartDGQuest","GLOBAL",0)~ + ~Why did you request for me?~ + shuck_03
++ ~Why would I listen to you?~ + shuck_02

APPEND bsshuck

IF ~~ THEN shuck_01
SAY ~What? No! This is not what this is about at *all*!~
++ ~Why me?~ + shuck_03
++ ~Why would I listen to you?~ + shuck_02
END

IF ~~ THEN shuck_02
SAY ~I... I will give you gold. I took some before I came here, right? I still have some of it and will tell you where I put it.~
IF ~~ THEN + shuck_03
END

IF ~~ THEN shuck_03
SAY ~You are the ones that cleared the Nashkel mines. There was discussion between the commander and the Flaming Fist whether you might be a threat or a help, and they settled for "help" for now in the hopes that you are not obliged to Amn. I need a mercenary who can fight, and is ready to face a threat others might run from. You have proven to be such a <PRO_MANWOMAN>.~
IF ~~ THEN + shuck_04
END

END //APPEND

CHAIN
IF ~~ THEN bsshuck shuck_04
~It's about my brother. He is in trouble... He is the reason I took the gold.~
== bsshuck IF ~OR(2)
Global("bsMissingMonk","GLOBAL",4)
Global("bsMissingMonk","GLOBAL",5)~ THEN ~It's the gold I wanted... I never meant to hurt Martina. The poor woman... I know Lenard and she were lovers. I am sorry she died! It was an accident, I swear. I needed the gold to help my brother!~
== bsshuck ~My brother lives in Nashkel and is being threatened by smugglers. He had... a bad time and lost himself in the Black Lotus for a while. But that is long over! He has... obligations he wasn't able to satisfy, and now they took my gold and still threaten him. Please, help us!~
END
++ ~So, your brother is addicted to Black Lotus and you expect me to bail him out of his debts?~ + shuck_04_1
++ ~Smugglers in Nashkel? Tell me more.~ + shuck_06
+ ~Global("bsSmugglerAttacked","GLOBAL",3)~ + ~Smugglers in Nashkel? Hm... I might have an idea who that would be. Tell me more.~ + shuck_06
++ ~And you expect me to do what?~ + shuck_05

APPEND bsshuck

IF ~~ THEN shuck_04_1
SAY ~I paid all of his debts! But they said it's too late and that he will be sold if I do not bring more. I came back here to get help, but my... deeds were already known so now I'm stuck here in prison.~
IF ~~ THEN + shuck_05
END

IF ~~ THEN shuck_05
SAY ~Someone needs to confront those bastards. Please, you have proven you are capable of fighting. I will make this worthwhile for you!~
IF ~~ THEN + shuck_06
END

IF ~~ THEN shuck_06
SAY ~There was supposed to be a second meeting where I bring more gold, at the Lotus Tent in Nashkel - I came here to ask for some days off, but I was arrested... Please, you take the gold and bring it to the smugglers. Or you keep the gold and confront them - they are no match to you, I swear!~
++ ~Why didn't you tell this to your commander?~ DO ~SetGlobal("bs08","LOCALS",1)~ + shuck_08
++ ~The gold belongs to the Ilmater monks! I cannot take it to smugglers, I am sorry.~ DO ~SetGlobal("bs07","LOCALS",1)~ + shuck_07
++ ~I will do so, but not with the gold you stole. Tell me where it is so I can return what is left!~ + shuck_09
++ ~Fine, tell me where the gold is.~ + shuck_09
++ ~You expect me to confront a gang of smugglers *after* I got the gold? You are a bit naive, don't you think?~ DO ~SetGlobal("bs10","LOCALS",1)~ + shuck_10
END

IF ~~ THEN shuck_07
SAY ~This is not only a personal problem! It's about smugglers who threaten decent towns folk, and... there will be enough riches involved to pay everyone! Please help my brother!~
+ ~Global("bs08","LOCALS",0)~ + ~Why didn't you tell this to your commander?~ DO ~SetGlobal("bs08","LOCALS",1)~ + shuck_08
++ ~I will do so, but not with the gold you stole. Tell me where it is so I can return what is left!~ + shuck_09
++ ~Fine, tell me where the gold is.~ + shuck_09
+ ~Global("bs10","LOCALS",0)~ + ~You expect me to confront a gang of smugglers *after* I got the gold? You are a bit naive, don't you think?~ DO ~SetGlobal("bs10","LOCALS",1)~ + shuck_10
++ ~Nope, not interested.~ + shuck_13
END

IF ~~ THEN shuck_08
SAY ~I need someone who is capable of going to Nashkel... I could ask the captain for help but what can he or the Flaming Fist do? Nothing! They are no help there, in Amnish lands! Also... They would return the gold to the monastery and then all hope would be lost...~
+ ~Global("bs07","LOCALS",0)~ + ~The gold belongs to the Ilmater monks! I cannot take it to smugglers, I am sorry.~ DO ~SetGlobal("bs07","LOCALS",1)~ + shuck_07
++ ~Fine, tell me where the gold is.~ + shuck_09
+ ~Global("bs10","LOCALS",0)~ + ~You expect me to confront a gang of smugglers *after* I got the gold? You are a bit naive, don't you think?~ DO ~SetGlobal("bs10","LOCALS",1)~ + shuck_10
++ ~I'm not going to do that, sorry.~ + shuck_13
++ ~I couldn't care less about your brother, fool.~ + shuck_15
END

IF ~~ THEN shuck_09
SAY ~That means you will help my brother?~
++ ~Yes, I will help him. Tell me what to do.~ + shuck_17
++ ~I didn't say that.~ + shuck_14
++ ~I couldn't care less about your brother, fool.~ + shuck_15
END

IF ~~ THEN shuck_10
SAY ~I have no choice... Please, it is more gold than they demanded. You get paid for your services. They will not attack you if you come as a messenger, I swear! They are just a bunch of thieves smuggling wares to save the harbor fees. They are not blood thirsty if you don't attack them!~
++ ~You just said they enslaved your brother! Sounds like dangerous folks to me.~ DO ~SetGlobal("bs11","LOCALS",1)~ + shuck_11
++ ~You seem to know them quite well, you know.~ DO ~SetGlobal("bs12","LOCALS",1)~ + shuck_12
+ ~Global("bs08","LOCALS",0)~ + ~Why didn't you tell this to your commander?~ DO ~SetGlobal("bs08","LOCALS",1)~ + shuck_08
+ ~Global("bs07","LOCALS",0)~ + ~The gold belongs to the Ilmater monks! I cannot take it to smugglers, I am sorry.~ DO ~SetGlobal("bs07","LOCALS",1)~ + shuck_07
++ ~I will do so, but not with the gold you stole. Tell me where it is so I can return what is left!~ + shuck_09
++ ~Fine, tell me where the gold is.~ + shuck_09
++ ~I'm not going to do that, sorry.~ + shuck_13
++ ~I couldn't care less about your brother, fool.~ + shuck_15
END

IF ~~ THEN shuck_11
SAY ~No, it's a bit more complicated than that... The smugglers threatened about the safety of my brother, but only if I do not deliver the gold in time!~
+ ~Global("bs12","LOCALS",0)~ + ~You seem to know them quite well, you know.~ DO ~SetGlobal("bs12","LOCALS",1)~ + shuck_12
+ ~Global("bs08","LOCALS",0)~ + ~Why didn't you tell this to your commander?~ DO ~SetGlobal("bs08","LOCALS",1)~ + shuck_08
+ ~Global("bs07","LOCALS",0)~ + ~The gold belongs to the Ilmater monks! I cannot take it to smugglers, I am sorry.~ DO ~SetGlobal("bs07","LOCALS",1)~ + shuck_07
++ ~I will do so, but not with the gold you stole. Tell me where it is so I can return what is left!~ + shuck_09
++ ~Fine, tell me where the gold is.~ + shuck_09
++ ~I'm not going to do that, sorry.~ + shuck_13
++ ~I couldn't care less about your brother, fool.~ + shuck_15
END

IF ~~ THEN shuck_12
SAY ~(sigh) My brother was in trouble a *lot*. It's not the first time I had to pay him off, but this time it was by far the greatest sum. Please!~
+ ~Global("bs11","LOCALS",0)~ + ~You just said they enslaved your brother! Sounds like dangerous folks to me.~ DO ~SetGlobal("bs11","LOCALS",1)~ + shuck_11
+ ~Global("bs08","LOCALS",0)~ + ~Why didn't you tell this to your commander?~ DO ~SetGlobal("bs08","LOCALS",1)~ + shuck_08
+ ~Global("bs07","LOCALS",0)~ + ~The gold belongs to the Ilmater monks! I cannot take it to smugglers, I am sorry.~ DO ~SetGlobal("bs07","LOCALS",1)~ + shuck_07
++ ~I will do so, but not with the gold you stole. Tell me where it is so I can return what is left!~ + shuck_09
++ ~Fine, tell me where the gold is.~ + shuck_09
++ ~I'm not going to do that, sorry.~ + shuck_13
++ ~I couldn't care less about your brother, fool.~ + shuck_15
END

IF ~~ THEN shuck_13
SAY ~Please! This is the last hope for my brother!~
++ ~Fine, tell me where the gold is.~ + shuck_09
++ ~I am sorry, your brother got himself into this situation. I do not have time to deal with smugglers currently.~ DO ~EraseJournalEntry(@800)
EraseJournalEntry(@802)
AddJournalEntry(@801,QUEST_DONE)~ + shuck_16
++ ~I couldn't care less about your brother, fool.~ + shuck_15
END

IF ~~ THEN shuck_14
SAY ~You... you wouldn't?...~
++ ~(sigh) Fine, I'll do it. Tell me what I need to know.~ + shuck_17
++ ~I couldn't care less about your brother, fool.~ + shuck_15
END

IF ~~ THEN shuck_15
SAY ~I get it, you are not the helping type. But as I said, there is more gold to have... especially if you would consider working with the smugglers. They are always on the lookout for helpers... I know, because... they offered me gold a thousand times if I'd use my connections for them.~
++ ~Hm. Now *that* sounds interesting. Fine, tell me more. I'll see what I can do for your brother along the way.~ + shuck_17
++ ~I am sorry, your brother got himself into this situation. I do not have time to deal with smugglers currently.~ DO ~EraseJournalEntry(@800)
EraseJournalEntry(@802)
AddJournalEntry(@801,QUEST_DONE)~ + shuck_16
END

//## "Hero of Baldur's Gate" - later!
IF ~~ THEN shuck_16
SAY ~(moans) Then all hope is lost. They will find a way to make him pay, and I'm in prison. Leave me be, "hero of the Nashkel mines".~
IF ~~ THEN DO ~SetGlobal("bsShucksBrother","GLOBAL",50)~ EXIT
END

IF ~~ THEN shuck_17
SAY ~Thank you! I thank you! First, you take the gold out of the trunk. It's in the Dragon Tower, that's the one right at the Armorer, top floor. You need to open it all the way to see the hidden compartment, or the gold can easily be missed.~
++ ~Wait, the gold is inside your trunk here in the tower? Are you kidding me?!~ + shuck_18
++ ~Very well, then what?~ + shuck_19
END

IF ~~ THEN shuck_18
SAY ~Not... not mine. It's one of the sergeant's, but he is on his week off.~
++ ~Ah, smart. And where do I meet the smugglers?~ + shuck_19
++ ~Very well, then what?~ + shuck_19
END

IF ~~ THEN shuck_19
SAY ~Do you know where the Lotus Tent in Nashkel is? It's to the far east of the carnival. From the tent, just go a little off to the south until the tents can't be seen any more, between the trees. That's where the smugglers meet, usually at dusk - but there is always a contact there, if you know where to look.~
= ~Give them 1000 of the gold and tell them it's from me. They should let my brother go then. Whatever you chose to do, paying or fighting or working with the smugglers, please see to my brother being freed.~
= ~I thank you, <CHARNAME>. And - please hurry! There is not much time left.~
IF ~~ THEN DO ~
EraseJournalEntry(@800)
EraseJournalEntry(@802)
AddJournalEntry(@801,QUEST_DONE)
SetGlobal("bsShucksBrother","GLOBAL",1)~ UNSOLVED_JOURNAL @805 EXIT
END

IF ~GlobalLT("bsShucksBrother","GLOBAL",50)~ THEN shuck_20
SAY ~There you are again! Any news from my brother?~
+ ~Global("bsShucksBrother","GLOBAL",7)~ + ~Indeed. He is safe and sound in the Ilmater's Monastery, recovering from his imprisonment.~ + shuck_27
+ ~OR(3)
Global("bsShucksBrother","GLOBAL",4)
Global("bsShucksBrother","GLOBAL",5)
Global("bsShucksBrother","GLOBAL",6)~ + ~The sum is paid, he will be in safety shortly.~ DO ~SetGlobal("bsShuckTalk28","GLOBAL",1)~ + shuck_28
+ ~Global("bsShucksBrother","GLOBAL",2) !Global("bsShucksBrother","GLOBAL",40)~ + ~Well, appearently he was sold to slave traders... I'm on it, though.~ + shuck_23
+ ~Global("bsShucksBrother","GLOBAL",3)~ + ~I know how to buy him free, but the slavers want 20,000 gold!~ + shuck_25
+ ~Global("bsShucksBrother","GLOBAL",41)~ + ~Well... I think I was a bit too amitious there. The smugglers didn't have time to tell me where your brother is now, but at least I killed the lot!~ + shuck_16
+ ~Global("bsShucksBrother","GLOBAL",30)~ + ~Hm, I decided I don't care. Sorry.~ + shuck_16
+ ~Global("bsShucksBrother","GLOBAL",35)~ + ~I waited too long to make the deal with the slave traders... I am sorry, he is out of my reach.~ + shuck_26
+ ~Global("bsShucksBrother","GLOBAL",40)~ + ~Well... I confronted the slave traders too early, so I don't know where he is. I am sorry.~ + shuck_26
++ ~Nothing new yet.~ + shuck_21
END

IF ~~ THEN shuck_21
SAY ~I thank you for your help. Please hurry! I hope it's not too late...~
IF ~~ THEN EXIT
END

IF ~Global("bsShucksBrother","GLOBAL",50)~ THEN shuck_22
SAY ~All hope is lost... all hope...~
IF ~~ THEN EXIT
END

IF ~~ THEN shuck_23
SAY ~Sl... slave traders?! I never expected them to go that far!~
IF ~~ THEN + shuck_21
END

IF WEIGHT #-1
~Global("bsInquisitorsWork","GLOBAL",2)~ shuck_24
SAY ~We'll... we'll talk later. Please leave...~
IF ~~ THEN EXIT
END

IF ~~ THEN shuck_25
SAY ~That... that much? I don't have anything... I have nothing left... I can't expect you to raise such a sum. He is lost then...~
++ ~Not yet. I will see what I can do.~ + shuck_21
++ ~I am sorry, but there is no way I will spent such a sum for someone I don't even know.~ + shuck_26
++ ~Yes, he is.~ + shuck_26
END

IF ~~ THEN shuck_26
SAY ~(sigh) I thank you for going this far, "hero of the Nashkel mines"!~
IF ~~ THEN DO ~
EraseJournalEntry(@808)
EraseJournalEntry(@809)
EraseJournalEntry(@812)
SetGlobal("bsShucksBrother","GLOBAL",50)~ SOLVED_JOURNAL @807 EXIT
END

IF ~~ THEN shuck_27
SAY ~He... he is?~
IF ~~ THEN + shuck_28
IF ~Global("bsShuckTalk28","GLOBAL",1)~ THEN + shuck_29
END

IF ~~ THEN shuck_28
SAY ~You paid 20,000 gold to free someone you don't even know! I thank you! Thank you!~
IF ~~ THEN EXIT
IF ~Global("bsShucksBrother","GLOBAL",7)~ THEN + shuck_29
END

IF ~~ THEN shuck_29
SAY ~We are in your debt! Nathoriel is... not the best person, but it is not only his fault. Father died when we were young, and mother fell to the Black Lotus... I raised him, and... I failed to make him a good person. But ah, what am I lamenting - I'm in prison, and what deeds have I done!~
IF ~~ THEN DO ~
EraseJournalEntry(@814)
SetGlobal("bsShucksBrother","GLOBAL",8)~ SOLVED_JOURNAL @815 + shuck_30
END 

IF WEIGHT #-1
~Global("bsShucksBrother","GLOBAL",8)~ THEN shuck_30
SAY ~I thank you for your help. I will pray for you every day.~
IF ~~ THEN EXIT
END

/*
IF ~~ THEN shuck_
SAY 
END

*/

END //APPEND

/* Shuck's brother Nathoriel */

BEGIN bsshckbr

IF ~Global("bsShucksBrother","GLOBAL",6)~ THEN thankyou
SAY ~You are the ones that saved me from those blasted slave traders! I don't know how to repay you. No, I mean it - I don't know how I'll ever repay the sum you spent to free me, so please show a merciful heart and just let it drop.~
IF ~~ THEN + thankyou_01
END

IF ~GlobalGT("bsShucksBrother","GLOBAL",6)~ THEN thankyou_01
SAY ~I appreciate the effort you took to free me, I really do.~
+ ~Global("bsNathorielTalk03","MYAREA",0)~ + ~That's also a way to say "thank you", I guess.~ DO ~SetGlobal("bsNathorielTalk03","MYAREA",1)~ + talk_03
+ ~Global("bsNathorielTalk04","MYAREA",0)~ + ~You are lucky I was ready to part with such a great sum for someone I don't even know.~ DO ~SetGlobal("bsNathorielTalk04","MYAREA",1)~ + talk_04
+ ~Global("bsSQCommanderPayed","GLOBAL",1) Global("bsNathorielTalk08","MYAREA",0)~ + ~The Seatower Guard paid for you, actually. The commander will have a question or two for you regarding the slavers.~ DO ~SetGlobal("bsNathorielTalk08","MYAREA",1)~ + talk_08
+ ~Global("bsNathorielTalk01","MYAREA",0)~ + ~Now what, I thought I'd put you into my mine where you can work your debts off for the rest of your life.~ DO ~SetGlobal("bsNathorielTalk01","MYAREA",1)~ + talk_01
++ ~You come to strength now, the monks should see to your recovery.~ + talk_05
++ ~Well then, good bye.~ + talk_05 
END

IF ~~ THEN talk_01
SAY ~What? You are kidding, I hope? I should be safe here in the monastery, and slavery is against the law in Baldur's Gate!~
++ ~I was kidding - I don't have a mine.~ + talk_02
+ ~GlobalGT("bsConfrontSlaveTraders","GLOBAL",1) Global("bsNathorielTalk08","MYAREA",0)~ + ~You are here for one reason only: so the commander gets the needed information as to *where* the slavers operate!~ DO ~SetGlobal("bsNathorielTalk08","MYAREA",1)~ + talk_08
+ ~GlobalGT("bsConfrontSlaveTraders","GLOBAL",1) Global("bsNathorielTalk08","MYAREA",1)~ + ~You are here for one reason only: so the commander gets the needed information as to *where* the slavers operate!~ DO ~SetGlobal("bsNathorielTalk08","MYAREA",2)~ + talk_09
+ ~Global("bsNathorielTalk03","MYAREA",0)~ + ~That's also a way to say "thank you", I guess.~ DO ~SetGlobal("bsNathorielTalk03","MYAREA",1)~ + talk_03
+ ~Global("bsSQCommanderPayed","GLOBAL",1) Global("bsNathorielTalk08","MYAREA",0)~ + ~The Seatower Guard paid for you, actually. The commander will have a question or two for you regarding the slavers.~ DO ~SetGlobal("bsNathorielTalk08","MYAREA",1)~ + talk_08
+ ~Global("bsNathorielTalk04","MYAREA",0)~ + ~You are lucky I was ready to part with such a great sum for someone I don't even know.~ DO ~SetGlobal("bsNathorielTalk04","MYAREA",1)~ + talk_04
++ ~You come to strength now, the monks should see to your recovery.~ + talk_05
++ ~Well then, good bye.~ + talk_05 
END

IF ~~ THEN talk_02
SAY ~Ah, er, haha...? You are kidding, though, right? I really do not know how to raise this much gold, even if I'd tried.~
+ ~GlobalGT("bsConfrontSlaveTraders","GLOBAL",1) Global("bsNathorielTalk08","MYAREA",1)~ + ~You are here for one reason only: so the commander gets the needed information as to *where* the slavers operate!~ DO ~SetGlobal("bsNathorielTalk08","MYAREA",2)~ + talk_09
+ ~Global("bsNathorielTalk03","MYAREA",0)~ + ~That's also a way to say "thank you", I guess.~ DO ~SetGlobal("bsNathorielTalk03","MYAREA",1)~ + talk_03
+ ~Global("bsSQCommanderPayed","GLOBAL",1) Global("bsNathorielTalk08","MYAREA",0)~ + ~The Seatower Guard paid for you, actually. The commander will have a question or two for you regarding the slavers.~ DO ~SetGlobal("bsNathorielTalk08","MYAREA",1)~ + talk_08
+ ~Global("bsNathorielTalk04","MYAREA",0)~ + ~You are lucky I was ready to part with such a great sum for someone I don't even know.~ DO ~SetGlobal("bsNathorielTalk04","MYAREA",1)~ + talk_04
++ ~You come to strength now, the monks should see to your recovery.~ + talk_05
++ ~Well then, good bye.~ + talk_05 
END

IF ~~ THEN talk_03
SAY ~You do have my sincerest thankfulness, but that's about all I can give you.~
+ ~GlobalGT("bsConfrontSlaveTraders","GLOBAL",1) Global("bsNathorielTalk08","MYAREA",1)~ + ~You are here for one reason only: so the commander gets the needed information as to *where* the slavers operate!~ DO ~SetGlobal("bsNathorielTalk08","MYAREA",2)~ + talk_09
+ ~Global("bsSQCommanderPayed","GLOBAL",1) Global("bsNathorielTalk08","MYAREA",0)~ + ~The Seatower Guard paid for you, actually. The commander will have a question or two for you regarding the slavers.~ DO ~SetGlobal("bsNathorielTalk08","MYAREA",1)~ + talk_08
+ ~Global("bsNathorielTalk04","MYAREA",0)~ + ~You are lucky I was ready to part with such a great sum for someone I don't even know.~ DO ~SetGlobal("bsNathorielTalk04","MYAREA",1)~ + talk_04
+ ~Global("bsNathorielTalk01","MYAREA",0)~ + ~Now what, I thought I'd put you into my mine where you can work your debts off for the rest of your life.~ DO ~SetGlobal("bsNathorielTalk01","MYAREA",1)~ + talk_01
++ ~You come to strength now, the monks should see to your recovery.~ + talk_05
++ ~Well then, good bye.~ + talk_05 
END

IF ~~ THEN talk_04
SAY ~Oh, but we could get to know each other - how about you invite me to a nice dragon ale over in the inn, for example.~
+ ~Global("bsNathorielTalk06","MYAREA",0)~ + ~I start regretting the trouble I went through to save you.~ DO ~SetGlobal("bsNathorielTalk06","MYAREA",1)~ + talk_06
+ ~GlobalGT("bsConfrontSlaveTraders","GLOBAL",1) Global("bsNathorielTalk08","MYAREA",1)~ + ~You are here for one reason only: so the commander gets the needed information as to *where* the slavers operate!~ DO ~SetGlobal("bsNathorielTalk08","MYAREA",2)~ + talk_09
+ ~Global("bsNathorielTalk03","MYAREA",0)~ + ~That's also a way to say "thank you", I guess.~ DO ~SetGlobal("bsNathorielTalk03","MYAREA",1)~ + talk_03
+ ~Global("bsSQCommanderPayed","GLOBAL",1) Global("bsNathorielTalk08","MYAREA",0)~ + ~The Seatower Guard paid for you, actually. The commander will have a question or two for you regarding the slavers.~ DO ~SetGlobal("bsNathorielTalk08","MYAREA",1)~ + talk_08
+ ~Global("bsNathorielTalk01","MYAREA",0)~ + ~Now what, I thought I'd put you into my mine where you can work your debts off for the rest of your life.~ DO ~SetGlobal("bsNathorielTalk01","MYAREA",1)~ + talk_01
++ ~You come to strength now, the monks should see to your recovery.~ + talk_05
++ ~Well then, good bye.~ + talk_05 
END

IF ~~ THEN talk_05
SAY ~Have a good day then. And, say 'hello' to my brother, will you? The shiny knight stuck in prison, who would have guessed.~
IF ~~ THEN DO ~
EraseJournalEntry(@812)
EraseJournalEntry(@813)
SetGlobal("bsShucksBrother","GLOBAL",7)~ UNSOLVED_JOURNAL @814 EXIT
END 

IF ~~ THEN talk_06
SAY ~Yes, that's what Shuck keeps on repeating to say, but there he is, getting himself into prison to save his lost little brother.~
++ ~You disgust me, to be honest.~ DO ~SetGlobal("bsNathorielTalk06","MYAREA",2)~ + talk_07
+ ~GlobalGT("bsConfrontSlaveTraders","GLOBAL",1) Global("bsNathorielTalk08","MYAREA",1)~ + ~You are here for one reason only: so the commander gets the needed information as to *where* the slavers operate!~ DO ~SetGlobal("bsNathorielTalk08","MYAREA",2)~ + talk_09
+ ~Global("bsNathorielTalk03","MYAREA",0)~ + ~That's also a way to say "thank you", I guess.~ DO ~SetGlobal("bsNathorielTalk03","MYAREA",1)~ + talk_03
+ ~Global("bsNathorielTalk01","MYAREA",0)~ + ~Now what, I thought I'd put you into my mine where you can work your debts off for the rest of your life.~ DO ~SetGlobal("bsNathorielTalk01","MYAREA",1)~ + talk_01
++ ~You are lucky I was ready to part with such a great sum for someone I don't even know.~ + talk_04
+ ~Global("bsSQCommanderPayed","GLOBAL",1) Global("bsNathorielTalk08","MYAREA",0)~ + ~The Seatower Guard paid for you, actually. The commander will have a question or two for you regarding the slavers.~ DO ~SetGlobal("bsNathorielTalk08","MYAREA",1)~ + talk_08
++ ~You come to strength now, the monks should see to your recovery.~ + talk_05
++ ~Well then, good bye.~ + talk_05 
END

IF ~~ THEN talk_07
SAY ~Well, ain't I lucky you freed me before realizing this.~
+ ~Global("bsNathorielTalk06","MYAREA",0)~ + ~I start regretting the trouble I went through to save you.~ DO ~SetGlobal("bsNathorielTalk06","MYAREA",1)~ + talk_06
+ ~GlobalGT("bsConfrontSlaveTraders","GLOBAL",1) Global("bsNathorielTalk08","MYAREA",1)~ + ~You are here for one reason only: so the commander gets the needed information as to *where* the slavers operate!~ DO ~SetGlobal("bsNathorielTalk08","MYAREA",2)~ + talk_09
+ ~Global("bsNathorielTalk03","MYAREA",0)~ + ~That's also a way to say "thank you", I guess.~ DO ~SetGlobal("bsNathorielTalk03","MYAREA",1)~ + talk_03
+ ~Global("bsNathorielTalk01","MYAREA",0)~ + ~Now what, I thought I'd put you into my mine where you can work your debts off for the rest of your life.~ DO ~SetGlobal("bsNathorielTalk01","MYAREA",1)~ + talk_01
+ ~Global("bsNathorielTalk04","MYAREA",0)~ + ~You are lucky I was ready to part with such a great sum for someone I don't even know.~ DO ~SetGlobal("bsNathorielTalk04","MYAREA",1)~ + talk_04
+ ~Global("bsSQCommanderPayed","GLOBAL",1) Global("bsNathorielTalk08","MYAREA",0)~ + ~The Seatower Guard paid for you, actually. The commander will have a question or two for you regarding the slavers.~ DO ~SetGlobal("bsNathorielTalk08","MYAREA",1)~ + talk_08
++ ~You come to strength now, the monks should see to your recovery.~ + talk_05
++ ~Well then, good bye.~ + talk_05 
END

IF ~~ THEN talk_08
SAY ~(wails) You leave me at the commander's mercy? Didn't you hear about his interrogator? I'm just a weakened slave trader victim. It's not fair to throw me into the law's mouth like this!~
+ ~Global("bsNathorielTalk06","MYAREA",0)~ + ~I start regretting the trouble I went through to save you.~ DO ~SetGlobal("bsNathorielTalk06","MYAREA",1)~ + talk_06
+ ~Global("bsNathorielTalk06","MYAREA",1)~ + ~You disgust me, to be honest.~ DO ~SetGlobal("bsNathorielTalk06","MYAREA",2)~ + talk_07
++ ~You are here for one reason only: so the commander gets the needed information as to *where* the slavers operate!~ DO ~SetGlobal("bsNathorielTalk08","MYAREA",2)~ + talk_09
+ ~Global("bsNathorielTalk03","MYAREA",0)~ + ~That's also a way to say "thank you", I guess.~ DO ~SetGlobal("bsNathorielTalk03","MYAREA",1)~ + talk_03
+ ~Global("bsNathorielTalk01","MYAREA",0)~ + ~Now what, I thought I'd put you into my mine where you can work your debts off for the rest of your life.~ DO ~SetGlobal("bsNathorielTalk01","MYAREA",1)~ + talk_01
+ ~Global("bsNathorielTalk04","MYAREA",0)~ + ~You are lucky I was ready to part with such a great sum for someone I don't even know.~ DO ~SetGlobal("bsNathorielTalk04","MYAREA",1)~ + talk_04
++ ~You are lucky I was ready to part with such a great sum for someone I don't even know.~ + talk_04
++ ~This has nothing to do with your former life - or has it? This is about you being a slave trader victim, and a help to bring justice to the other victims and the city!~ + talk_05 
++ ~You come to strength now, the monks should see to your recovery.~ + talk_05
++ ~Well then, good bye.~ + talk_05 
END

IF ~~ THEN talk_09
SAY ~Alright, I get it! I get it!~
+ ~Global("bsNathorielTalk06","MYAREA",0)~ + ~I start regretting the trouble I went through to save you.~ DO ~SetGlobal("bsNathorielTalk06","MYAREA",1)~ + talk_06
+ ~Global("bsNathorielTalk06","MYAREA",1)~ + ~You disgust me, to be honest.~ DO ~SetGlobal("bsNathorielTalk06","MYAREA",2)~ + talk_07
+ ~Global("bsNathorielTalk03","MYAREA",0)~ + ~That's also a way to say "thank you", I guess.~ DO ~SetGlobal("bsNathorielTalk03","MYAREA",1)~ + talk_03
+ ~Global("bsNathorielTalk01","MYAREA",0)~ + ~Now what, I thought I'd put you into my mine where you can work your debts off for the rest of your life.~ DO ~SetGlobal("bsNathorielTalk01","MYAREA",1)~ + talk_01
+ ~Global("bsNathorielTalk04","MYAREA",0)~ + ~You are lucky I was ready to part with such a great sum for someone I don't even know.~ DO ~SetGlobal("bsNathorielTalk04","MYAREA",1)~ + talk_04
++ ~You come to strength now, the monks should see to your recovery.~ + talk_05
++ ~Well then, good bye.~ + talk_05 
END




/* after talking to Shuck - interrogator is coming */

CHAIN 
IF WEIGHT #-1
~Global("bsInquisitorsWork","GLOBAL",1)~ THEN YSHAFSLG inquisitor
~Well now, Shuck. I see you had your wish granted. It's time to go to work, then.~
== bsshuck ~I... I have nothing of importance to say! I swear!~
== YSHAFSLG ~How about you let us decide that, hm?~
END
++ ~You are the tower's interrogator?~ + inquisitor_01
++ ~I'll leave you to it, then.~ + inquisitor_02

APPEND YSHAFSLG 
IF ~~ THEN inquisitor_01
SAY ~Indeed, Halfslinger, at your service.~
++ ~Please - don't be too cruel with him.~ + inquisitor_02
++ ~Don't spare that criminal, Halfslinger.~ + inquisitor_02
++ ~I'll leave you to it, then.~ + inquisitor_02
END

IF ~~ THEN inquisitor_02
SAY ~Now, how this goes is all up to you, Shuck, hm? Let's begin...~
IF ~~ THEN DO ~SetGlobal("bsInquisitorsWork","GLOBAL",2)~ EXIT
END

IF WEIGHT #-1
~Global("bsInquisitorsWork","GLOBAL",2)~ inquisitor_03
SAY ~Please, leave, so I can start working. I'll be available for buy and sell shortly in my house.~
IF ~~ THEN EXIT
END

END //APPEND



/* Smuggler in Nashkel */

BEGIN bssmgl01

IF ~Dead("bsslav01")~ THEN slaver_dead
SAY ~Hello, there, traveller! There are many fine berries to find here, if you know where to look... Oh, it's you. Guys, we got company!~
IF ~~ THEN DO ~ClearAllActions() StartCutSceneMode() StartCutScene("bscut001")~ EXIT
END

IF ~True()~ THEN disguise
SAY ~Hello, there, traveller! There are many fine berries to find here, if you know where to look. Of course, you have to know the right kind to pick the edible ones.~
IF ~!Global("bsShucksBrother","GLOBAL",1)~ THEN EXIT
+ ~Global("bsShucksBrother","GLOBAL",1)~ + ~Alright, now that I actually have a suspicion about what you really are, this sounds awfully like a watchword. We aren't looking for berries, but for Shuck's brother. Does that mean anything to you?~ + disguise_00
+ ~Global("bsShucksBrother","GLOBAL",1)~ + ~We are here in Shuck's name. Rings any bell?~ + disguise_00
+ ~Global("bsShucksBrother","GLOBAL",1)~ + ~Well then, have fun looking for your berries.~ EXIT 
END

IF ~~ THEN disguise_00
SAY ~Is that so? Hm, then there is no need for the disguise, I guess. Guys, we got company!~
IF ~~ THEN DO ~ClearAllActions() StartCutSceneMode() StartCutScene("bscut001")~ EXIT
END

BEGIN bssmgl02

IF ~Dead("bsslav01") Global("bsSmugglerQuest","GLOBAL",0)~ THEN slaver_dead
SAY ~I am sorry for the greeting, but you - *accidentally* - killed our business partner in the Seatower, so there is only one thing that will happen here now. I am sure you understand.~
IF ~~ THEN DO ~ActionOverride("bssmgl02",DestroyItem("MINHP1")) SetGlobal("bsSmugglerAttacked","GLOBAL",4) 
SetGlobal("bsWorkingWithSmugglers","GLOBAL",0)
ActionOverride("bssmgl02",Enemy())~ EXIT
END

IF ~Global("bsSmugglerAttacked","GLOBAL",3)
Global("bsSmugglerQuest","GLOBAL",0)~ THEN attacked
SAY ~Now there, why would you attack an innocent berry picker! You are a mean person, you know that?~
+ ~!Global("bsShucksBrother","GLOBAL",1)~ + ~Who the hell are you?~ + attacked_01
+ ~!Global("bsShucksBrother","GLOBAL",1)~ + ~Bandits! I will kill you all!~ + attacked_02
+ ~Global("bsShucksBrother","GLOBAL",1)~ + ~Alright, now that I actually have a suspicion about what you really are, this sounds awfully like a watchword. We aren't looking for berries, but for Shuck's brother. Does that mean anything to you?~ + smuggler_00
+ ~Global("bsShucksBrother","GLOBAL",1)~ + ~We are here in Shuck's name. Rings any bell?~ + smuggler_00
++ ~Berry picker, yeah right.~ EXIT
END

IF ~~ THEN attacked_01
SAY ~So you seriously just attacked out of the blue?~
IF ~~ THEN + attacked_02
END

IF ~~ THEN attacked_02
SAY ~We are no bandits, we are *smugglers*. We do not steal, we deliver! On time and for a fair price! See that tent up there in the north? If we do not deliver Black Lotus there every day on time, a lot of people will become very irritated in a very short amount of time. So, please leave us alone. Who knows, maybe you'll have use of us somewhere in the future.~
IF ~~ THEN EXIT
END

CHAIN
IF ~Global("bsShucksBrother","GLOBAL",1)
!Global("bsSmugglerAttacked","GLOBAL",1)
Global("bsSmugglerQuest","GLOBAL",0)~ THEN bssmgl02 smuggler_00
~Oh, now look at that! Shuck sent you, eh? Thinks he can throw a bunch of heavy armed mercenaries our way to get rid of the debts?~
== bssmgl02 IF ~!Global("bsSmugglerAttacked","GLOBAL",3)~ THEN ~Yes, we are the smugglers, in case you wondered.~
END
++ ~I am here for Shuck's brother, yes. I have the gold you wanted.~ + smuggler_04
++ ~I am here for his brother, but you will not see any gold for it! Tell me where he is, now!~ + smuggler_02
++ ~I won't fight you. I am here because I want to work with you!~ + smuggler_29
++ ~I'm here because I want to fight. The more, the merrier!~ + smuggler_01

APPEND bssmgl02

IF ~~ THEN smuggler_01
SAY ~Oh, but don't you think you are rushing just a little bit? You don't even know how many there are of us, yet!~
++ ~Fine, then I'll wait until I know how many of you there are.~ + smuggler_02
++ ~No, I will fight you now!~ + smuggler_03
END

END //APPEND

CHAIN
IF ~~ THEN bssmgl02 smuggler_02
~Ho! I like you! You've got spine!~
== bssmgl02 IF ~Class(Player1,PALADIN) %PLAYER1_NO_BLACKGUARD%~ THEN ~A pity you are one of those do-gooders, or I'd have a use for you.~
== bssmgl02 IF ~!Class(Player1,PALADIN) 
OR(5)
Class(Player2,PALADIN)
Class(Player3,PALADIN)
Class(Player4,PALADIN)
Class(Player5,PALADIN)
Class(Player6,PALADIN)
%PLAYER2_NO_BLACKGUARD%
%PLAYER3_NO_BLACKGUARD%
%PLAYER4_NO_BLACKGUARD%
%PLAYER5_NO_BLACKGUARD%
%PLAYER6_NO_BLACKGUARD%~ THEN ~A pity you travel with one of those do-gooders, I'd have use of you.~
END
IF ~~ THEN + smuggler_07


APPEND bssmgl02 

IF ~~ THEN smuggler_03
SAY ~(sigh) Here we go. Guys...~
IF ~~ THEN DO ~SetGlobal("bsSmugglerAttacked","GLOBAL",1) ActionOverride("bssmgl02",Enemy())~ EXIT
END

IF ~~ THEN smuggler_04
SAY ~You telling me you got all the gold I requested right here?~
IF ~~ THEN + smuggler_02
END

IF ~Global("bsShucksBrother","GLOBAL",1) Global("bsSmugglerAttacked","GLOBAL",1) Allegiance(Myself,NEUTRAL) Global("bsSmugglerQuest","GLOBAL",0)~ THEN smuggler_05
SAY ~Alright - alright, I get it. You are too strong for us. But killing us - here - won't help you in finding Shuck's brother now, would it? Please stop killing us, we are smugglers, but we are not murderers or bandits. We do not steal, we deliver!~
++ ~I am here for his brother, but you will not see any gold for it! Tell me where he is, now!~ + smuggler_02
++ ~I couldn't care less about that brother. I am here because I want to work with you!~ + smuggler_29
++ ~Stop talking - I'm not done with you!~ + smuggler_06
END

IF ~~ THEN smuggler_06
SAY ~Oh - come *on*! Really?~
IF ~~ THEN DO ~ActionOverride("bssmgl02",DestroyItem("MINHP1")) SetGlobal("bsSmugglerAttacked","GLOBAL",4) ActionOverride("bssmgl02",Enemy())~ EXIT
END

IF ~~ THEN smuggler_07
SAY ~Let me introduce myself. I am Holger, and I am a smuggler. My mates and me smuggle illicit or very rare goods from Amn to the Sword Coast and Baldur's City. Let me play with open cards here. We know Shuck is in prison now, so it's only a matter of time until the tower interrogator will come to this news: Shuck was our Seatower contact. He told the tower cell when it would be safe to land and make sure the wares got into the city alright.~
++ ~Shuck did what?!~ + smuggler_09
++ ~Oh.~ + smuggler_09
++ ~He told me he needs to bail out his brother from you!~ + smuggler_08
++ ~A-haha, sly little solder.~ + smuggler_09
END

IF ~~ THEN smuggler_08
SAY ~And that is true!~
IF ~~ THEN + smuggler_09
END

IF ~~ THEN smuggler_09
SAY ~Ah, Shuck didn't tell you he did work for us, did he? Well, he did start working for us to bail out his brother, now that is true. Shuck's brother still owes us gold, so we requested the debt being paid, at least. Well, Shuck paid, but too late.~
++ ~What do you mean "Too late"?~ + smuggler_12
++ ~Fine. I have the gold here to bail him out, 1000 was the sum, so give me Shuck's brother.~ + smuggler_12
++ ~I don't care about your problems. Tell me where Shuck's brother is!~ + smuggler_12
++ ~Sounds like you could use some help, hm?~ + smuggler_11
END

END //APPEND

CHAIN
IF ~~ THEN bssmgl02 smuggler_11
~Help? You mean from you. Yes, that is an intriguing throught.~
== bssmgl02 IF ~Class(Player1,PALADIN) %PLAYER1_NO_BLACKGUARD%~ THEN ~At least if I get myself to trust you. Hmm...~
== bssmgl02 ~Because we get a lot of pressure from all sides. It's not only us doing shady smuggler things, you know? Competition and all that, and other folks are much, much scarier than us. As to Shuck's brother...~
END
IF ~~ THEN + smuggler_12

APPEND bssmgl02 

IF ~~ THEN smuggler_12
SAY ~Well... See, we had to sell that brother's debts to someone else to get our gold in time. We told that fool he should hurry. What does he think we are? Ilmater monks? His brother got himself knee-deep into problems here, we are just business men who want to get our pay!~
++ ~Sold his debts? So where is he now?~ + smuggler_16
++ ~By the nine hells, spit it out already! Where is the brother now?~ + smuggler_16
END

IF ~~ THEN smuggler_13
SAY ~Oh, now that hurt. I live and breathe by the smugglers' honor code! Don't you make fun of it. You'd wish all "criminals" would go by such a code, the world would be peaceful as a monastery - at least for those who can pay.~
++ ~Then tell me where I can find those slave traders!~ + smuggler_17
++ ~I am here to find Shuck's brother and I will not return without him!~ + smuggler_17
END

IF ~~ THEN smuggler_14
SAY ~See, it's not *us* doing slavery, alright? We are just decent smugglers who provide paying customers with things they couldn't get otherwise... or not that cheap, that is. We just... need the traders for their ships as they carry some of our goods on their way from Amn here, so we need to be good friends with them. And we needed the gold to pay off some very irritated customers. It was hard as it is with all the bandits around. These are difficult times for honest smugglers, you know?~
++ ~Honest smugglers? Don't make me laugh.~ + smuggler_13
++ ~Then tell me where I can find those slave traders!~ + smuggler_17
++ ~I am here to find Shuck's brother and I will not return without him!~ + smuggler_17
END

IF ~~ THEN smuggler_15
SAY ~We only sold that soldier's brothers *depts* to them slave traders because gold is scarse in these times of upcoming war and iron crisis - a lot of our customers couldn't pay on time. We have obligations, too!~
++ ~You expect me to have sympathy with your problems?~ + smuggler_18
++ ~Very well, but I'm not done with you, believe me!~ + smuggler_20
++ ~Now that's settled, let's talk business, shall we?~ + smuggler_20
++ ~Then we are done here. Farewell.~ + smuggler_21
END

IF ~~ THEN smuggler_16
SAY ~Well, taken by the slave traders. Probably being transported to a ship in the city's harbor as we speak. What can I say - I am sorry?~
++ ~That means the brother's debts are closed?~ + smuggler_30
++ ~Slave traders?!~ + smuggler_14
++ ~Then tell me where I can find those slave traders!~ + smuggler_17
++ ~I am here to find Shuck's brother and I will not return without him!~ + smuggler_17
END

IF ~~ THEN smuggler_17
SAY ~I respect your wish to keep your promise to Shuck. Fine.~
IF ~~ THEN + smuggler_17_1
END

IF ~~ THEN smuggler_17_1
SAY ~Take this, then. This is a contact note for one of their slave auctions. You could have gotten that from anywhere. I'm just sending a potentional customer their way, right? No need for this *help* of mine to backfire to my disadvantage, no?~
++ ~I appreciate it.~ DO ~GiveItemCreate("bssmq001",[PC],1,0,0) EraseJournalEntry(@808) SetGlobal("bsShucksBrother","GLOBAL",2)~ UNSOLVED_JOURNAL @809 + smuggler_19
++ ~Your *help* wouldn't have been needed wouldn't you have sold the brother in the first place!~ DO ~GiveItemCreate("bssmq001",[PC],1,0,0) EraseJournalEntry(@808) SetGlobal("bsShucksBrother","GLOBAL",2)~ UNSOLVED_JOURNAL @809 + smuggler_15
++ ~Very well, but I'm not done with you, believe me!~ DO ~GiveItemCreate("bssmq001",[PC],1,0,0) EraseJournalEntry(@808) SetGlobal("bsShucksBrother","GLOBAL",2)~ UNSOLVED_JOURNAL @809 + smuggler_20
++ ~Now that's settled, let's talk business, shall we?~ DO ~GiveItemCreate("bssmq001",[PC],1,0,0) EraseJournalEntry(@808) SetGlobal("bsShucksBrother","GLOBAL",2)~ UNSOLVED_JOURNAL @809 + smuggler_20
++ ~Then we are done here. Farewell.~ DO ~GiveItemCreate("bssmq001",[PC],1,0,0) EraseJournalEntry(@808) SetGlobal("bsShucksBrother","GLOBAL",2)~ UNSOLVED_JOURNAL @809 + smuggler_21
END

IF ~~ THEN smuggler_18
SAY ~If not with us, then with our customers - what do you think the poor lot in that Black Lotus tent would do without us? Wait, you don't have to answer that. *You* probably think it's our fault they are in there in the first place!~
++ ~Very well, but I'm not done with you, believe me!~ + smuggler_20
++ ~Now that's settled, let's talk business, shall we?~ + smuggler_20
++ ~Then we are done here. Farewell.~ + smuggler_21
END

IF ~~ THEN smuggler_19
SAY ~Now that's a reply I like to hear!~
++ ~Very well, but I'm not done with you, believe me!~ + smuggler_20
++ ~Now that's settled, let's talk business, shall we?~ + smuggler_20
++ ~Then we are done here. Farewell.~ + smuggler_21
END

IF ~~ THEN smuggler_20
SAY ~Now, what would you mean with that, pray tell?~
++ ~Nothing. Just that I will have an eye on you and your kind, so better behave.~ + smuggler_21
++ ~Well, times are rough, as you already said. I wouldn't mind some extra business to earn some extra gold, if you know what I mean.~ + smuggler_22
++ ~I am saying now that I have the information I need, I will kill you! Draw your weapons!~ + smuggler_06
END

IF ~~ THEN smuggler_21
SAY ~Indeed. Farewell to you, too.~
IF ~~ THEN DO ~SetGlobal("bsSmugglersLeave","GLOBAL",1)~ UNSOLVED_JOURNAL @809 EXIT
END

END //APPEND

CHAIN
IF ~~ THEN bssmgl02 smuggler_22
~You really would like to work for me, hm?~
== bssmgl02 IF ~Class(Player1,PALADIN) %PLAYER1_NO_BLACKGUARD%~ THEN ~Look, I put a lot of trust into you already, alright? Me even talking to a shiny metal suit like you alone is seen as treason by some. But I notice potential when I see it, so let's try this.~
== bssmgl02 IF ~!Global("bsShucksBrother","GLOBAL",30)~ THEN ~I might have a job or two, but first you need to earn our trust. I need to see how you deal with the traders. Because in case you will go there to stirr trouble so that it will boomerang back to *us*, then we will not become business partners, that much is clear. Then I need to see how you fare at the tower.~
== bssmgl02 IF ~Global("bsShucksBrother","GLOBAL",30)~ THEN ~I might have a job or two, but first you need to earn our trust. I need to see how you fare at the tower.~
== bssmgl02 IF ~Global("bsPCMetSmugglerDoppelgangers","GLOBAL",0)~ THEN ~As I already said, the tower's interrogator will get to the information about us through Shuck eventually, anyway, so I don't mind you telling the Tower Commander all of *that*. But how will you go on from there is the real question. Because, if you want to work with me, you'd also want to work with the smuggler cell at the tower, or so I would assume. And there we have the first problem. You still in on this?~
== bssmgl02 IF ~!Dead("bssmgl06") GlobalGT("bsPCMetSmugglerDoppelgangers","GLOBAL",1)~ THEN ~Hmm. I know you helped Juan escape *and* you already solved the mystery why the tower cell didn't communicate with us any more, so we *could* say you already worked for me, and with a very important matter. Fine. I'd have one more task for you.~
END
+ ~OR(2) Dead("bssmgl06") !GlobalGT("bsPCMetSmugglerDoppelgangers","GLOBAL",1)~ + ~Go on.~ + smuggler_22_1
+ ~!Dead("bssmgl06") GlobalGT("bsPCMetSmugglerDoppelgangers","GLOBAL",1)~ + ~Go on.~ + smuggler_24
++ ~Then we are done here. Farewell.~ + smuggler_21


APPEND bssmgl02 

IF ~~ THEN smuggler_22_1
SAY ~Some weeks ago we lost contact with the tower cell - completely. And then the tower cell stopped delivering. We have complaints from all over Baldur's City about customers not receiving their wares! Shuck didn't contact us, either. We had to believe the cell was revealed, imprisoned, or killed, or all together. Actually, we suspected Shuck might have revealed us, but Shuck insists the tower cell stopped talking to *him*, and him doing nothing against us.~
= ~So, let your contact to the Seatower authorities be of our advantage, then: Find out what happened to the smuggler cell that used to operate at Balduran's Tower. Were they taken out? Were they taken over by a rivalling group? Got the slave traders too pricky and thought they could do without us?~
+ ~GlobalGT("bsPCMetSmugglerDoppelgangers","GLOBAL",0)~ + ~I think I already know the answer to that, actually.~ + smuggler_22_2
++ ~I will do that.~ + smuggler_24
++ ~I guess I have no choice than to accept this job.~ + smuggler_24
++ ~I'm not sure I'll have time to deal with this soon.~ + smuggler_23
END

IF ~~ THEN smuggler_22_2
SAY ~Oh? That's interesting. Nevertheless, let me finish what I wanted to say, first.~
IF ~~ THEN + smuggler_24
END

IF ~~ THEN smuggler_23
SAY ~You want to work for us, you better make time.~
IF ~~ THEN + smuggler_24
END

IF ~~ THEN smuggler_24
SAY ~Here's a very important delivery for the cook of the "Helm and Cloak" in north west Baldur's Gate. Do deliver this in the next three days the latest.~
++ ~The "Helm and Cloak" is getting smuggler wares? Aren't they scared of the Flaming Fist finding out about it?~ + smuggler_27
++ ~A sealed box? How can I trust you this will not be to my harm?~ + smuggler_28
++ ~I want to know what is in this box if I am to deliver it for you.~ + smuggler_28
++ ~Alright, I'm on my way.~ + smuggler_25
++ ~What if I don't want to do that?~ + smuggler_26
END

END //APPEND

CHAIN
IF ~~ THEN bssmgl02 smuggler_25
~Oh, and we expect you not to open that box. The box is sealed, and we expect the seal to be unbroken upon delivery. It's a test, obviously.~
== bssmgl02 IF ~OR(2) Dead("bssmgl06") !GlobalGT("bsPCMetSmugglerDoppelgangers","GLOBAL",1)~ THEN ~Do these two tasks - deliver the box and inquire what happened to the tower cell - and return to me with news. You will not regret it. Hurry with the delivery, though - you have three days.~
== bssmgl02 IF ~!Dead("bssmgl06") GlobalGT("bsPCMetSmugglerDoppelgangers","GLOBAL",1)~ THEN ~Do this task - deliver the box and return to me with news. You will not regret it. Hurry with the delivery, though - you have three days.~
END
IF ~~ THEN DO ~GiveItemCreate("bssmq002",[PC],1,0,0)
SetGlobal("bsWorkingWithSmugglers","GLOBAL",1)
SetGlobal("bsSmugglerQuest","GLOBAL",1) 
SetGlobal("bsShucksBrother","GLOBAL",2) 
EraseJournalEntry(@808) 
AddJournalEntry(@830,QUEST)
AddJournalEntry(@832,QUEST)
AddJournalEntry(@833,QUEST)
SetGlobalTimer("bsSmugglerQuestTimer1","GLOBAL",FIVE_DAYS)~ UNSOLVED_JOURNAL @809 EXIT

IF ~!Dead("bssmgl06") GlobalGT("bsPCMetSmugglerDoppelgangers","GLOBAL",1)~ THEN DO ~GiveItemCreate("bssmq002",[PC],1,0,0)
SetGlobal("bsWorkingWithSmugglers","GLOBAL",1)
SetGlobal("bsSmugglerQuest","GLOBAL",1) 
SetGlobal("bsShucksBrother","GLOBAL",2) 
EraseJournalEntry(@808) 
AddJournalEntry(@830,QUEST)
AddJournalEntry(@833,QUEST)
SetGlobalTimer("bsSmugglerQuestTimer1","GLOBAL",FIVE_DAYS)~ UNSOLVED_JOURNAL @809 + smuggler_36

IF ~Global("bsShucksBrother","GLOBAL",30)~ THEN DO ~GiveItemCreate("bssmq002",[PC],1,0,0)
SetGlobal("bsWorkingWithSmugglers","GLOBAL",1)
SetGlobal("bsSmugglerQuest","GLOBAL",1) 
AddJournalEntry(@830,QUEST)
AddJournalEntry(@832,QUEST)
AddJournalEntry(@833,QUEST)
SetGlobalTimer("bsSmugglerQuestTimer1","GLOBAL",FIVE_DAYS)~ EXIT


APPEND bssmgl02 

IF ~~ THEN smuggler_26
SAY ~Then I'll have to send someone else with the box and regret heavily that I just told you all the things I did. And if I regret something, I usually make the ones responsible regret that, too.~
++ ~A sealed box? How can I trust you this will not be to my harm?~ + smuggler_28
++ ~I want to know what is in this box if I am to deliver it for you.~ + smuggler_28
++ ~Alright, I'm on my way.~ + smuggler_25
++ ~Threatening me? You shouldn't have. I will kill you! Draw your weapons!~ + smuggler_06
END

IF ~~ THEN smuggler_27
SAY ~You're not supposed to *tell* them, are you? And don't you judge our customers. What did I say: not all of our wares are illicit, some are just *rare*, alright?~
++ ~A sealed box? How can I trust you this will not be to my harm?~ + smuggler_28
++ ~I want to know what is in this box if I am to deliver it for you.~ + smuggler_28
++ ~Alright, I'm on my way.~ + smuggler_25
++ ~What if I don't want to do that?~ + smuggler_26
END

IF ~~ THEN smuggler_28
SAY ~Ah, but no, you don't see what the point is here. It's not about *you* trusting *me*. The real question is: why would *I* trust *you*? Smuggling means you deliver wares you know as little about as possible. And you do that because you know that I will give you wares that will pay good gold *and* will not harm you - unless you get caught by the law, that is, but I don't need to explain how that's an exception now, do I.~
= ~So, this is what this is about. You need to trust me if you want to work for me. But more crucial is that *I* indeed trust you with my wares. I guarantee you that this box is not poisonous, nor will it explode, nor does it violate any general morale standards. As long as you keep it out of city authorities' way, no harm will come to you from it.~
IF ~~ THEN + smuggler_25
END

IF ~~ THEN smuggler_29
SAY ~Work with us? Now, that's an interesting turn of events. How about we get to know each other first, then?~
IF ~~ THEN + smuggler_07
END

IF ~~ THEN smuggler_30
SAY ~Yes, for us, his debts are closed.~
++ ~Great, because I couldn't care less about the brother. I came here to get in contact with you. I could use some extra gold, as well.~ DO ~EraseJournalEntry(@808) SetGlobal("bsShucksBrother","GLOBAL",30)~ SOLVED_JOURNAL @807 + smuggler_31
++ ~Slave traders?!~ + smuggler_14
++ ~Then tell me where I can find those slave traders!~ + smuggler_17
++ ~I am here to find Shuck's brother and I will not return without him!~ + smuggler_17
END

IF ~~ THEN smuggler_31
SAY ~Oh, now that is a relief, considering we sold him already. Not him, mind, but his *debts*, of course, but what can I do if the traders take him for refund? So, we can put that whole affair to rest, then. At least I doubt we'll see many mercenaries coming our way from Shuck in the future...~
IF ~~ THEN + smuggler_22
END

/* PC attacked slave traders */

IF ~Dead("bsslav01") Global("bsNoticedDeadSlavers","LOCALS",0)~ THEN smuggler_attacked_slavers
SAY ~Now there, <CHARNAME>. You return - but what did you do? Attacked and killed the traders' contact after I gave you the information where to find him!~
IF ~~ THEN DO ~SetGlobal("bsNoticedDeadSlavers","LOCALS",1)~ + smuggler_32_2
IF ~GlobalGT("bsSlaverQuest","GLOBAL",4)~ THEN DO ~SetGlobal("bsNoticedDeadSlavers","LOCALS",1)~ + smuggler_attacked_slavers_00
END

IF ~~ THEN smuggler_attacked_slavers_00
SAY ~Fortunately, this seemed to be some... internal differences, so we wash our hands of it, I suppose. Still, you actions deprived us from an important ressource. Oh well, we will find a way around that, I guess.~
IF ~~ THEN EXIT
END

END //APPEND

CHAIN
IF ~Global("bsSmugglerQuest","GLOBAL",1) Global("bsDeliverFigs","GLOBAL",1)~ THEN bssmgl02 smuggler_32
~You return from your first delivery!~ DO ~SetGlobal("bsDeliverFigs","GLOBAL",2)~
== bssmgl02 IF ~Global("bsSMQOpenedBox","GLOBAL",0) 
		Global("bsSMQAteFigs","GLOBAL",0)
		Global("bsSMQTooLate","GLOBAL",0)~ THEN ~And a successful one it was. Our customer was pleased, and so am I. Well done!~
== bssmgl02 IF ~Global("bsSMQAteFigs","GLOBAL",0) Global("bsSMQOpenedBox","GLOBAL",1)~ THEN ~Someone couldn't hold their curiosity and had to look inside, hm?~
== bssmgl02 IF ~Global("bsSMQAteFigs","GLOBAL",1)~ THEN ~And *eating* parts of the delivery, <CHARNAME>?~
== bssmgl02 IF ~Global("bsSMQTooLate","GLOBAL",1)~ THEN ~I have the feeling you do not understand the priority of these deliveries. We do not do them when we find the time, <CHARNAME>. They are *important* and *urgent*. You dawdled.~
== bssmgl02 IF ~Global("bsSMQOpenedBox","GLOBAL",1)
		Global("bsSMQAteFigs","GLOBAL",0)
		Global("bsSMQTooLate","GLOBAL",0)~ THEN ~Oh well, our customer was fine with it, and the gold he withheld was your share, so I will turn a blind eye to that - this once. This once, <CHARNAME>. Congratulations to your first job done!~ DO ~
EraseJournalEntry(@834)
EraseJournalEntry(@835)~
END
IF ~OR(2)
Global("bsSMQAteFigs","GLOBAL",1)
Global("bsSMQTooLate","GLOBAL",1)~ THEN + smuggler_32_1

+ ~Global("bsSMQAteFigs","GLOBAL",0) Global("bsSMQTooLate","GLOBAL",0)~ + ~*Figs*, Holger? Why?~ + smuggler_33
+ ~Global("bsSMQAteFigs","GLOBAL",0) Global("bsSMQTooLate","GLOBAL",0)~ + ~So, what's my next task?~ + smuggler_35
+ ~Global("bsSMQAteFigs","GLOBAL",0) Global("bsSMQTooLate","GLOBAL",0)~ + ~We are done here, I won't continue working for you.~ + smuggler_34


APPEND bssmgl02 


IF ~~ THEN smuggler_32_1
SAY ~This is inacceptable behavior. I had high hopes for you, <CHARNAME>, such high hopes. But this will not do. Our business relation is over. Farewell.~
IF ~~ THEN DO ~AddJournalEntry(@836,QUEST_DONE)
SetGlobal("bsSmugglersLeave","GLOBAL",1) SetGlobal("bsWorkingWithSmugglers","GLOBAL",0)~ EXIT
END

IF ~~ THEN smuggler_32_2
SAY ~And that is absolutely inacceptible behavior - which needs to be punished.~
IF ~~ THEN DO ~ActionOverride("bssmgl02",DestroyItem("MINHP1")) SetGlobal("bsSmugglerAttacked","GLOBAL",4) SetGlobal("bsWorkingWithSmugglers","GLOBAL",0) ActionOverride("bssmgl02",Enemy())~ EXIT
END


IF ~~ THEN smuggler_33
SAY ~Why yes, <CHARNAME>, figs are perfect for a recruit. They are quite sensitive, need to be delivered fast - and they are totally lawful. Take the mysterious, sealed package to the Flaming Fist, and the only person getting in trouble with them is you!~
++ ~So, what's my next task?~ + smuggler_35
++ ~We are done here, I won't continue working for you.~ + smuggler_34
END

IF ~~ THEN smuggler_34
SAY ~Hm. Oh well, then it is time to say farewell, <CHARNAME>.~
IF ~~ THEN DO ~EraseJournalEntry(@830)
		EraseJournalEntry(@832)
		EraseJournalEntry(@833)
		EraseJournalEntry(@834)
		EraseJournalEntry(@835)
		EraseJournalEntry(@836)
		EraseJournalEntry(@838)
		EraseJournalEntry(@839)
AddJournalEntry(@837,QUEST_DONE)
SetGlobal("bsSmugglersLeave","GLOBAL",1)
SetGlobal("bsSmugglerQuest","GLOBAL",50) 
SetGlobal("bsWorkingWithSmugglers","GLOBAL",0)~ EXIT
END

END //APPEND

CHAIN
IF ~~ THEN bssmgl02 smuggler_35
~Hm, let me see.~
== bssmgl02 IF ~Global("bsSmugglerQuest","GLOBAL",1)~ THEN ~There is still the question of what happened to the tower cell. Let's stick to that for now, as it is really important.~
END
IF ~~ THEN + smuggler_37
IF ~!Dead("bssmgl06") GlobalGT("bsPCMetSmugglerDoppelgangers","GLOBAL",1)~ THEN + smuggler_36


CHAIN
IF ~Global("bsSmugglerQuest","GLOBAL",1)
!Dead("bssmgl06") GlobalGT("bsPCMetSmugglerDoppelgangers","GLOBAL",1)~ THEN bssmgl02 smuggler_36
~I have to say. What did I hear - the tower cell taken over by doppelgangers! Juan was all high praise about your rescuing mission.~
== bssmgl02 IF ~Global("bsPCMetSmugglerDoppelgangers","GLOBAL",2)~ THEN ~Sort of, since you tried to kill him nontheless. Tsk, tsk, <CHARNAME>, you should know better than to threaten a fellow smuggler. Or you are smarter than you look and strive for a position at the top, hm?~
END
IF ~~ THEN DO ~SetGlobal("bsPCMetSmugglerDoppelgangers","GLOBAL",4)~ + smuggler_40
IF ~GlobalGT("bsDeliverFigs","GLOBAL",1)~ THEN DO ~SetGlobal("bsPCMetSmugglerDoppelgangers","GLOBAL",4)~ + smuggler_39


APPEND bssmgl02 
IF ~GlobalGT("bsSmugglerQuest","GLOBAL",0)~ THEN smuggler_37
SAY ~So, do you have any news for me?~
+ ~GlobalGT("bsPCMetSmugglerDoppelgangers","GLOBAL",0)
GlobalLT("bsPCMetSmugglerDoppelgangers","GLOBAL",4)~ + ~The tower cell was taken over by doppelgangers, appearently.~ DO ~SetGlobal("bsPCMetSmugglerDoppelgangers","GLOBAL",4)~ + smuggler_38
++ ~I'm still on it.~ + smuggler_40
++ ~We are done here, I won't continue working for you.~ + smuggler_34
END

IF ~~ THEN smuggler_38
SAY ~Doppelgangers!~
IF ~~ THEN + smuggler_39
END

IF ~~ THEN smuggler_39
SAY ~Well, no wonder they did no longer communicate with us.~
= ~Hm, seems I did Shuck wrong, the poor man! I am grief-stricken - or not.~
IF ~~ THEN + smuggler_40
IF ~GlobalGT("bsDeliverFigs","GLOBAL",1) Global("bsPCMetSmugglerDoppelgangers","GLOBAL",4)~ THEN + smuggler_39_1
END

END //APPEND

CHAIN
IF ~~ THEN bssmgl02 smuggler_39_1
~Well, you have proven useful, <CHARNAME>. Very much so.~
DO ~EraseJournalEntry(@838) SetGlobal("bsSmugglerQuest","GLOBAL",2)~ 
== bssmgl02 IF ~!Dead("bsslav01")~ THEN ~I like you and see that you know how to handle your weapons. Our ... partners are always in need of mercenaries to protect their tradings.~
== bssmgl02 IF ~!Dead("bsslav01")~ THEN ~I am talking about the *helpful* folks with head in Amn who have enough gold to buy off the debts of our customers and enough ships to transport some of our goods.~
== bssmgl02 IF ~!Dead("bsslav01") GlobalGT("bsConfrontSlaveTraders","GLOBAL",0)~ THEN ~In other words: the slavers. You already met their contact for that friend's brother of yours.~
== bssmgl02 IF ~!Dead("bsslav01") Global("bsConfrontSlaveTraders","GLOBAL",0)~ THEN ~In other words: they are slavers. There is no need to talk around the truth if I want you to work for them.~
== bssmgl02 IF ~!Dead("bsslav01")~ THEN ~We need to be in good terms with them, and they are often interested in backup against the Flaming Fist for their deliveries near Baldur's Gate. I will recommend you to them. It's easy earned gold - it's seldom that the Flaming Fist turns up at all, and the pay is usually quite good. I'd do it myself, but we will be busy with own stuff for a while.~
END
IF  ~Dead("bsslav01")~ THEN + smuggler_41 //## more smuggler quests would go here.

+ ~!Dead("bsslav01") GlobalGT("bsConfrontSlaveTraders","GLOBAL",0)~ + ~Finally! I was waiting for your recommendation towards them.~ + smuggler_42
+ ~!Dead("bsslav01")~ + ~Fine, I will listen to their offer.~ + smuggler_42
+ ~!Dead("bsslav01")~ + ~I'm sorry Holger, but I won't make it. I'm very busy as it is.~ + smuggler_43
+ ~!Dead("bsslav01")~ + ~Absolutely not. Working for you is alright, but I will not be getting involved with any shady organization.~ + smuggler_43
+ ~!Dead("bsslav01")~ + ~Don't bother. I'm done working for you, as well.~ + smuggler_34

APPEND bssmgl02 

IF ~~ THEN smuggler_40
SAY ~Don't let me wait too long for more news, <CHARNAME>.~
IF ~~ THEN EXIT
END

END //APPEND

/* all smuggler quests finished */
CHAIN
IF ~~ THEN bssmgl02 smuggler_41
~You did everything I could use your help with, <CHARNAME>. We need to go and collect new wares for now, and also it's always a good idea to move camp once in a while. It was great working with you. I will not forget your help.~
//[## Fence] == bssmgl02 ~Theopold will stay here though, just in case you want to fence something.~
== bssmgl02 ~Farewell, <CHARNAME>. Maybe we'll meet again.~
END
IF ~~ THEN DO ~SetGlobal("bsSmugglerQuest","GLOBAL",10) SetGlobal("bsSmugglersLeave","GLOBAL",1)~ SOLVED_JOURNAL @839 EXIT


APPEND bssmgl02 

IF ~~ THEN smuggler_42
SAY ~You will hear from me when they tell us more details.~
IF ~~ THEN DO ~SetGlobal("bsSlaverQuest","GLOBAL",1) SetGlobalTimer("bsSlaveTimer2","GLOBAL",ONE_DAY)~ + smuggler_41
//IF ~~ THEN DO ~SetGlobal("bsSlaverQuest","GLOBAL",1) SetGlobalTimer("bsSlaveTimer2","GLOBAL",ONE_DAY)~ + ## more smuggler quests would go here.
END

IF ~~ THEN smuggler_43
SAY ~Oh, what a pity. Guess I need to send Edgar then, again.~
IF ~~ THEN + smuggler_41
//IF ~~ THEN DO ~##~ + ## more smuggler quests would go here.
END


 


END //APPEND

BEGIN bssmgl03

IF ~True()~ THEN smuggler
SAY ~I'm just here for the muscle. Talk to Holger.~
IF ~~ THEN EXIT
END

/* Cook of the Helm & Cloak */

EXTEND_BOTTOM ~%tutu_var%MCOOK5~ 0
IF ~AreaCheck("%NWBaldursGate_Helm&Cloak_L1%") PartyHasItem("bssmq002") Global("bsDeliverFigs","GLOBAL",0)~ THEN + delivery
END

CHAIN
IF WEIGHT #-1
~NumTimesTalkedToGT(0) PartyHasItem("bssmq002") Global("bsDeliverFigs","GLOBAL",0)
AreaCheck("%NWBaldursGate_Helm&Cloak_L1%")~ THEN %tutu_var%MCOOK5 delivery
~Oh, I didn't notice the box you have there. That's for me, right? Now, let me see.~
== ~%tutu_var%MCOOK5~ IF ~GlobalTimerExpired("bsSmugglerQuestTimer1","GLOBAL")~ THEN ~You are late, you know that, yes?~ 
== ~%tutu_var%MCOOK5~ IF ~Global("bsSMQOpenedBox","GLOBAL",1)~ THEN ~What's this - it's already opened?! Are you trying to trick me? I payed for Calimshan figs exquisitely, now I can't be sure you didn't switch them with cheap Tethyr ones!~ 
== ~%tutu_var%MCOOK5~ IF ~Global("bsSMQAteFigs","GLOBAL",1)~ THEN ~And it's no longer six! Some are missing!~ 
== ~%tutu_var%MCOOK5~ IF ~GlobalTimerExpired("bsSmugglerQuestTimer1","GLOBAL")~ THEN ~And - ugh - they are rotten. So you bring me some rotten figs instead of the promised fresh Calimshan ones.~ DO ~SetGlobal("bsSMQTooLate","GLOBAL",1)~
== ~%tutu_var%MCOOK5~ IF ~OR(2)
Global("bsSMQAteFigs","GLOBAL",1)
GlobalTimerExpired("bsSmugglerQuestTimer1","GLOBAL")~ THEN ~I am very disappointed. Very. I will not pay you, as you haven't delivered what I ordered. Get out of my kitchen. Fresh delivery, pfeh.~ DO ~AddJournalEntry(@835,QUEST)~
== ~%tutu_var%MCOOK5~ IF ~Global("bsSMQOpenedBox","GLOBAL",1)
!Global("bsSMQAteFigs","GLOBAL",1)
!GlobalTimerExpired("bsSmugglerQuestTimer1","GLOBAL")~ THEN ~Hm, well, I guess I will accept the broken seal, they do look right. I *will* report this with my next order, however.~ DO ~AddJournalEntry(@834,QUEST)~
== ~%tutu_var%MCOOK5~ IF ~!Global("bsSMQOpenedBox","GLOBAL",1)
!Global("bsSMQAteFigs","GLOBAL",1)
!GlobalTimerExpired("bsSmugglerQuestTimer1","GLOBAL")~ THEN ~Ah, yes, here they are: six marvellous Calimshan figs.~ DO ~AddJournalEntry(@834,QUEST)~
== ~%tutu_var%MCOOK5~ IF ~!Global("bsSMQAteFigs","GLOBAL",1)
!GlobalTimerExpired("bsSmugglerQuestTimer1","GLOBAL")~ THEN ~So here's something extra for you, and now get out of my kitchen, I have work to do.~ DO ~GiveGoldForce(100)~
END
IF ~~ THEN DO ~EraseJournalEntry(@833) TakePartyItem("bssmq002") DestroyItem("bssmq002") SetGlobal("bsDeliverFigs","GLOBAL",1)~ EXIT



/* easter egg: refer to the smugglers if meeting the smuggler in chapter 6/7 
Global("bsWorkingWithSmugglers","GLOBAL",1)
*/

INTERJECT %tutu_var%smuggl 1 bsReferToBSTSmugglers
== %tutu_var%smuggl IF ~Global("bsWorkingWithSmugglers","GLOBAL",1)~ THEN ~Well, *actually* I am here because we noticed you are in trouble. We won't let one of us stand in the rain, so Holger wants me to say 'hello'.~
END %tutu_var%smuggl 8

I_C_T %tutu_var%smuggl 2 bsReferToBSTSmugglers
== %tutu_var%smuggl IF ~Global("bsWorkingWithSmugglers","GLOBAL",1)~ THEN ~Well, I'm here because we noticed your troubles. We won't let one of us stand in the rain, no? I'm a smuggler, at your service, and Holger wants me to say 'hello'.~
END

I_C_T %tutu_var%smuggl 3 bsReferToBSTSmugglers
== %tutu_var%smuggl IF ~Global("bsWorkingWithSmugglers","GLOBAL",1)~ THEN ~Well, I'm here because we noticed your troubles. We won't let one of us stand in the rain, no? I'm a smuggler, at your service, and Holger wants me to say 'hello'.~
END

