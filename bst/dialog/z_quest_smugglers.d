/* this is all dialogues for the "smuggler quests. Exceptions: the "item" dialogues and Captain Dungarth */

/* Questgiver: */
/* Tower Guard Shuck */

BEGIN bsshuck

CHAIN
IF ~Global("bsShucksBrother","GLOBAL",0)~ THEN bsshuck shuck_00
@0 /* You! You are the ones I need to talk to. */
== bsshuck IF ~Global("bsJumpStartDGQuest","GLOBAL",0)~ THEN @1 /* And you came! */
== bsshuck IF ~GlobalGT("bsJumpStartDGQuest","GLOBAL",0)~ THEN @2 /* Please, please listen to me! */
== bsshuck IF ~OR(2)
Global("bsMissingMonk","GLOBAL",4)
Global("bsMissingMonk","GLOBAL",5)~ THEN @3 /* You found the dead monk. I'm not a monster! */
== bsshuck IF ~Global("bsMissingMonk","GLOBAL",10)~ THEN @4 /* I guess they told you I'm a reckless thief. */
== bsshuck @5 /* I need to explain what happened. And... I need your help. */
END
++ @6 /* Fine, I'll listen. */ + shuck_03
++ @7 /* I'm not helping you get out of prison! */ + shuck_01
+ ~Global("bsJumpStartDGQuest","GLOBAL",0)~ + @8 /* Why did you request for me? */ + shuck_03
++ @9 /* Why would I listen to you? */ + shuck_02

APPEND bsshuck

IF ~~ THEN shuck_01
SAY @10 /* What? No! This is not what this is about at *all*! */
++ @11 /* Why me? */ + shuck_03
++ @9 /* Why would I listen to you? */ + shuck_02
END

IF ~~ THEN shuck_02
SAY @12 /* I... I will give you gold. I took some before I came here, right? I still have some of it and will tell you where I put it. */
IF ~~ THEN + shuck_03
END

IF ~~ THEN shuck_03
SAY @13 /* You are the ones that cleared the Nashkel mines. There was discussion between the commander and the Flaming Fist whether you might be a threat or a help, and they settled for "help" for now in the hopes that you are not obliged to Amn. I need a mercenary who can fight, and is ready to face a threat others might run from. You have proven to be such a <PRO_MANWOMAN>. */
IF ~~ THEN + shuck_04
END

END //APPEND

CHAIN
IF ~~ THEN bsshuck shuck_04
@14 /* It's about my brother. He is in trouble... He is the reason I took the gold. */
== bsshuck IF ~OR(2)
Global("bsMissingMonk","GLOBAL",4)
Global("bsMissingMonk","GLOBAL",5)~ THEN @15 /* It's the gold I wanted... I never meant to hurt Martina. The poor woman... I know Lenard and she were lovers. I am sorry she died! It was an accident, I swear. I needed the gold to help my brother! */
== bsshuck @16 /* My brother lives in Nashkel and is being threatened by smugglers. He had... a bad time and lost himself in the Black Lotus for a while. But that is long over! He has... obligations he wasn't able to satisfy, and now they took my gold and still threaten him. Please, help us! */
END
++ @17 /* So, your brother is addicted to Black Lotus and you expect me to bail him out of his debts? */ + shuck_04_1
++ @18 /* Smugglers in Nashkel? Tell me more. */ + shuck_06
+ ~Global("bsSmugglerAttacked","GLOBAL",3)~ + @19 /* Smugglers in Nashkel? Hm... I might have an idea who that would be. Tell me more. */ + shuck_06
++ @20 /* And you expect me to do what? */ + shuck_05

APPEND bsshuck

IF ~~ THEN shuck_04_1
SAY @21 /* I paid all of his debts! But they said it's too late and that he will be sold if I do not bring more. I came back here to get help, but my... deeds were already known so now I'm stuck here in prison. */
IF ~~ THEN + shuck_05
END

IF ~~ THEN shuck_05
SAY @22 /* Someone needs to confront those bastards. Please, you have proven you are capable of fighting. I will make this worthwhile for you! */
IF ~~ THEN + shuck_06
END

IF ~~ THEN shuck_06
SAY @23 /* There was supposed to be a second meeting where I bring more gold, at the Lotus Tent in Nashkel - I came here to ask for some days off, but I was arrested... Please, you take the gold and bring it to the smugglers. Or you keep the gold and confront them - they are no match for you, I swear! */
++ @24 /* Why didn't you tell this to your commander? */ DO ~SetGlobal("bs08","LOCALS",1)~ + shuck_08
++ @25 /* The gold belongs to the Ilmater monks! I cannot take it to smugglers, I am sorry. */ DO ~SetGlobal("bs07","LOCALS",1)~ + shuck_07
++ @26 /* I will do so, but not with the gold you stole. Tell me where it is so I can return what is left! */ + shuck_09
++ @27 /* Fine, tell me where the gold is. */ + shuck_09
++ @28 /* You expect me to confront a gang of smugglers *after* I got the gold? You are a bit naive, don't you think? */ DO ~SetGlobal("bs10","LOCALS",1)~ + shuck_10
END

IF ~~ THEN shuck_07
SAY @29 /* This is not only a personal problem! It's about smugglers who threaten decent towns folk, and... there will be enough riches involved to pay everyone! Please help my brother! */
+ ~Global("bs08","LOCALS",0)~ + @24 /* Why didn't you tell this to your commander? */ DO ~SetGlobal("bs08","LOCALS",1)~ + shuck_08
++ @26 /* I will do so, but not with the gold you stole. Tell me where it is so I can return what is left! */ + shuck_09
++ @27 /* Fine, tell me where the gold is. */ + shuck_09
+ ~Global("bs10","LOCALS",0)~ + @28 /* You expect me to confront a gang of smugglers *after* I got the gold? You are a bit naive, don't you think? */ DO ~SetGlobal("bs10","LOCALS",1)~ + shuck_10
++ @30 /* Nope, not interested. */ + shuck_13
END

IF ~~ THEN shuck_08
SAY @31 /* I need someone who is capable of going to Nashkel... I could ask the captain for help but what can he or the Flaming Fist do? Nothing! They are no help there, in Amnian lands! Also... They would return the gold to the monastery and then all hope would be lost... */
+ ~Global("bs07","LOCALS",0)~ + @25 /* The gold belongs to the Ilmater monks! I cannot take it to smugglers, I am sorry. */ DO ~SetGlobal("bs07","LOCALS",1)~ + shuck_07
++ @27 /* Fine, tell me where the gold is. */ + shuck_09
+ ~Global("bs10","LOCALS",0)~ + @28 /* You expect me to confront a gang of smugglers *after* I got the gold? You are a bit naive, don't you think? */ DO ~SetGlobal("bs10","LOCALS",1)~ + shuck_10
++ @32 /* I'm not going to do that, sorry. */ + shuck_13
++ @33 /* I couldn't care less about your brother, fool. */ + shuck_15
END

IF ~~ THEN shuck_09
SAY @34 /* That means you will help my brother? */
++ @35 /* Yes, I will help him. Tell me what to do. */ + shuck_17
++ @36 /* I didn't say that. */ + shuck_14
++ @33 /* I couldn't care less about your brother, fool. */ + shuck_15
END

IF ~~ THEN shuck_10
SAY @37 /* I have no choice... Please, it is more gold than they demanded. You get paid for your services. They will not attack you if you come as a messenger, I swear! They are just a bunch of thieves smuggling wares to save the harbor fees. They are not blood thirsty if you don't attack them! */
++ @38 /* You just said they enslaved your brother! Sounds like dangerous folks to me. */ DO ~SetGlobal("bs11","LOCALS",1)~ + shuck_11
++ @39 /* You seem to know them quite well, you know. */ DO ~SetGlobal("bs12","LOCALS",1)~ + shuck_12
+ ~Global("bs08","LOCALS",0)~ + @24 /* Why didn't you tell this to your commander? */ DO ~SetGlobal("bs08","LOCALS",1)~ + shuck_08
+ ~Global("bs07","LOCALS",0)~ + @25 /* The gold belongs to the Ilmater monks! I cannot take it to smugglers, I am sorry. */ DO ~SetGlobal("bs07","LOCALS",1)~ + shuck_07
++ @26 /* I will do so, but not with the gold you stole. Tell me where it is so I can return what is left! */ + shuck_09
++ @27 /* Fine, tell me where the gold is. */ + shuck_09
++ @32 /* I'm not going to do that, sorry. */ + shuck_13
++ @33 /* I couldn't care less about your brother, fool. */ + shuck_15
END

IF ~~ THEN shuck_11
SAY @40 /* No, it's a bit more complicated than that... The smugglers threatened about the safety of my brother, but only if I do not deliver the gold in time! */
+ ~Global("bs12","LOCALS",0)~ + @39 /* You seem to know them quite well, you know. */ DO ~SetGlobal("bs12","LOCALS",1)~ + shuck_12
+ ~Global("bs08","LOCALS",0)~ + @24 /* Why didn't you tell this to your commander? */ DO ~SetGlobal("bs08","LOCALS",1)~ + shuck_08
+ ~Global("bs07","LOCALS",0)~ + @25 /* The gold belongs to the Ilmater monks! I cannot take it to smugglers, I am sorry. */ DO ~SetGlobal("bs07","LOCALS",1)~ + shuck_07
++ @26 /* I will do so, but not with the gold you stole. Tell me where it is so I can return what is left! */ + shuck_09
++ @27 /* Fine, tell me where the gold is. */ + shuck_09
++ @32 /* I'm not going to do that, sorry. */ + shuck_13
++ @33 /* I couldn't care less about your brother, fool. */ + shuck_15
END

IF ~~ THEN shuck_12
SAY @41 /* (sigh) My brother was in trouble a *lot*. It's not the first time I had to pay him off, but this time it was by far the greatest sum. Please! */
+ ~Global("bs11","LOCALS",0)~ + @38 /* You just said they enslaved your brother! Sounds like dangerous folks to me. */ DO ~SetGlobal("bs11","LOCALS",1)~ + shuck_11
+ ~Global("bs08","LOCALS",0)~ + @24 /* Why didn't you tell this to your commander? */ DO ~SetGlobal("bs08","LOCALS",1)~ + shuck_08
+ ~Global("bs07","LOCALS",0)~ + @25 /* The gold belongs to the Ilmater monks! I cannot take it to smugglers, I am sorry. */ DO ~SetGlobal("bs07","LOCALS",1)~ + shuck_07
++ @26 /* I will do so, but not with the gold you stole. Tell me where it is so I can return what is left! */ + shuck_09
++ @27 /* Fine, tell me where the gold is. */ + shuck_09
++ @32 /* I'm not going to do that, sorry. */ + shuck_13
++ @33 /* I couldn't care less about your brother, fool. */ + shuck_15
END

IF ~~ THEN shuck_13
SAY @42 /* Please! This is the last hope for my brother! */
++ @27 /* Fine, tell me where the gold is. */ + shuck_09
++ @43 /* I am sorry, your brother got himself into this situation. I do not have time to deal with smugglers currently. */ DO ~EraseJournalEntry(@800)
EraseJournalEntry(@802)
AddJournalEntry(@801,QUEST_DONE)~ + shuck_16
++ @33 /* I couldn't care less about your brother, fool. */ + shuck_15
END

IF ~~ THEN shuck_14
SAY @44 /* You... you wouldn't?... */
++ @45 /* (sigh) Fine, I'll do it. Tell me what I need to know. */ + shuck_17
++ @33 /* I couldn't care less about your brother, fool. */ + shuck_15
END

IF ~~ THEN shuck_15
SAY @46 /* I get it, you are not the helping type. But as I said, there is more gold to have... especially if you would consider working with the smugglers. They are always on the lookout for helpers... I know, because... they offered me gold a thousand times if I'd use my connections for them. */
++ @47 /* Hm. Now *that* sounds interesting. Fine, tell me more. I'll see what I can do for your brother along the way. */ + shuck_17
++ @43 /* I am sorry, your brother got himself into this situation. I do not have time to deal with smugglers currently. */ DO ~EraseJournalEntry(@800)
EraseJournalEntry(@802)
AddJournalEntry(@801,QUEST_DONE)~ + shuck_16
END

IF ~~ THEN shuck_16
SAY @48 /* (moans) Then all hope is lost. They will find a way to make him pay, and I'm in prison. Leave me be, "hero of the Nashkel mines". */
IF ~~ THEN DO ~SetGlobal("bsShucksBrother","GLOBAL",50)~ EXIT
END

IF ~~ THEN shuck_17
SAY @49 /* Thank you! I thank you! First, you take the gold out of the trunk. It's in the Dragon Tower, that's the one right at the Armorer, top floor. You need to open it all the way to see the hidden compartment, or the gold can easily be missed. */
++ @50 /* Wait, the gold is inside your trunk here in the tower? Are you kidding me?! */ + shuck_18
++ @51 /* Very well, then what? */ + shuck_19
END

IF ~~ THEN shuck_18
SAY @52 /* Not... not mine. It's one of the sergeant's, but he is on his week off. */
++ @53 /* Ah, smart. And where do I meet the smugglers? */ + shuck_19
++ @51 /* Very well, then what? */ + shuck_19
END

IF ~~ THEN shuck_19
SAY @54 /* Do you know where the Lotus Tent in Nashkel is? It's to the far east of the carnival. From the tent, just go a little off to the south until the tents can't be seen any more, between the trees. That's where the smugglers meet, usually at dusk - but there is always a contact there, if you know where to look. */
= @55 /* Give them 1000 of the gold and tell them it's from me. They should let my brother go then. Whatever you chose to do, paying or fighting or working with the smugglers, please see to my brother being freed. */
= @56 /* I thank you, <CHARNAME>. And - please hurry! There is not much time left. */
IF ~~ THEN DO ~
EraseJournalEntry(@800)
EraseJournalEntry(@802)
AddJournalEntry(@801,QUEST_DONE)
SetGlobal("bsShucksBrother","GLOBAL",1)~ UNSOLVED_JOURNAL @805 EXIT
END

IF ~Global("bsShuckTalk28","MYAREA",1)
OR(3)
Global("bsShucksBrother","GLOBAL",4)
Global("bsShucksBrother","GLOBAL",5)
Global("bsShucksBrother","GLOBAL",6)~ THEN in_monastery
SAY @57 /* Did you have a chance to speak to me brother? Is he in the moanstery? */
+ ~Global("bsShucksBrother","GLOBAL",7)~ + @58 /* Indeed. He is safe and sound in the Ilmater's Monastery, recovering from his imprisonment. */ + shuck_27
++ @59 /* Nothing new yet. */ + shuck_30
END

IF ~GlobalLT("bsShucksBrother","GLOBAL",50)~ THEN shuck_20
SAY @60 /* There you are again! Any news from my brother? */
+ ~Global("bsShucksBrother","GLOBAL",7)~ + @58 /* Indeed. He is safe and sound in the Ilmater's Monastery, recovering from his imprisonment. */ + shuck_27
+ ~OR(3)
Global("bsShucksBrother","GLOBAL",4)
Global("bsShucksBrother","GLOBAL",5)
Global("bsShucksBrother","GLOBAL",6)
Global("bsShuckKnowsSum","MYAREA",1)~ + @61 /* The sum is paid, he will be in safety shortly. */ DO ~SetGlobal("bsShuckTalk28","MYAREA",1)~ + shuck_28
+ ~OR(3)
Global("bsShucksBrother","GLOBAL",4)
Global("bsShucksBrother","GLOBAL",5)
Global("bsShucksBrother","GLOBAL",6)
Global("bsShuckKnowsSum","MYAREA",0)~ + @62 /* I paid 20,000 gold to the slave traders. He will be in safety shortly. */ DO ~SetGlobal("bsShuckTalk28","MYAREA",1)~ + shuck_28
+ ~Global("bsShucksBrother","GLOBAL",2) !Global("bsShucksBrother","GLOBAL",40)~ + @63 /* Well, apparently he was sold to slave traders... I'm on it, though. */ + shuck_23
+ ~Global("bsShucksBrother","GLOBAL",3)~ + @64 /* I know how to buy him free, but the slavers want 20,000 gold! */ DO ~SetGlobal("bsShuckKnowsSum","MYAREA",1)~ + shuck_25
+ ~Global("bsShucksBrother","GLOBAL",41)~ + @65 /* Well... I think I was a bit too amitious there. The smugglers didn't have time to tell me where your brother is now, but at least I killed the lot! */ + shuck_16
+ ~Global("bsShucksBrother","GLOBAL",30)~ + @66 /* Hm, I decided I don't care. Sorry. */ + shuck_16
+ ~Global("bsShucksBrother","GLOBAL",35)~ + @67 /* I waited too long to make the deal with the slave traders... I am sorry, he is out of my reach. */ + shuck_26
+ ~Global("bsShucksBrother","GLOBAL",40)~ + @68 /* Well... I confronted the slave traders too early, so I don't know where he is. I am sorry. */ + shuck_26
++ @59 /* Nothing new yet. */ + shuck_21
END

IF ~~ THEN shuck_21
SAY @69 /* I thank you for your help. Please hurry! I hope it's not too late... */
IF ~~ THEN EXIT
END

IF ~Global("bsShucksBrother","GLOBAL",50)~ THEN shuck_22
SAY @70 /* All hope is lost... all hope... */
IF ~~ THEN EXIT
END

IF ~~ THEN shuck_23
SAY @71 /* Sl... slave traders?! I never expected them to go that far! */
IF ~~ THEN + shuck_21
END

IF WEIGHT #-1
~Global("bsInquisitorsWork","GLOBAL",2)~ shuck_24
SAY @72 /* We'll... we'll talk later. Please leave... */
IF ~~ THEN EXIT
END

IF ~~ THEN shuck_25
SAY @73 /* That... that much? I don't have anything... I have nothing left... I can't expect you to raise such a sum. He is lost then... */
++ @74 /* Not yet. I will see what I can do. */ + shuck_21
++ @75 /* I am sorry, but there is no way I will spent such a sum for someone I don't even know. */ + shuck_26
++ @76 /* Yes, he is. */ + shuck_26
END

IF ~~ THEN shuck_26
SAY @77 /* (sigh) I thank you for going this far, "hero of the Nashkel mines"! */
IF ~~ THEN DO ~
EraseJournalEntry(@808)
EraseJournalEntry(@809)
EraseJournalEntry(@812)
SetGlobal("bsShucksBrother","GLOBAL",50)~ SOLVED_JOURNAL @807 EXIT
END

IF ~~ THEN shuck_27
SAY @78 /* He... he is? */
IF ~Global("bsShuckKnowsSum","MYAREA",0)~ THEN + shuck_31
IF ~Global("bsShuckKnowsSum","MYAREA",1)~ THEN + shuck_28
IF ~Global("bsShuckTalk28","MYAREA",1)~ THEN + shuck_29
END

IF ~~ THEN shuck_28
SAY @79 /* You paid 20,000 gold to free someone you don't even know! I thank you! Thank you! */
IF ~~ THEN EXIT
IF ~Global("bsShucksBrother","GLOBAL",7)~ THEN + shuck_29
END

IF ~~ THEN shuck_29
SAY @80 /* We are in your debt! Nathoriel is... not the best person, but it is not only his fault. Father died when we were young, and mother fell to the Black Lotus... I raised him, and... I failed to make him a good person. But ah, what am I lamenting - I'm in prison, and what deeds have I done! */
IF ~~ THEN DO ~
EraseJournalEntry(@814)
SetGlobal("bsShucksBrother","GLOBAL",8)~ SOLVED_JOURNAL @815 + shuck_30
END 

IF WEIGHT #-1
~Global("bsShucksBrother","GLOBAL",8)~ THEN shuck_30
SAY @81 /* I thank you for your help. I will pray for you every day. */
IF ~~ THEN EXIT
END

IF ~~ THEN shuck_31
SAY @82 /* Something tells me it was more complicated than just giving the smugglers the gold I had. I thank you! Thank you! */
IF ~~ THEN EXIT
IF ~Global("bsShucksBrother","GLOBAL",7)~ THEN + shuck_29
END

END //APPEND

/* Shuck's brother Nathoriel */

BEGIN bsshckbr

IF ~Global("bsShucksBrother","GLOBAL",6)~ THEN thankyou
SAY @83 /* You are the ones that saved me from those blasted slave traders! I don't know how to repay you. No, I mean it - I don't know how I'll ever repay the sum you spent to free me, so please show a merciful heart and just let it drop. */
IF ~~ THEN + thankyou_01
END

IF ~GlobalGT("bsShucksBrother","GLOBAL",6)~ THEN thankyou_01
SAY @84 /* I appreciate the effort you took to free me, I really do. */
+ ~Global("bsNathorielTalk03","MYAREA",0)~ + @85 /* That's also a way to say "thank you", I guess. */ DO ~SetGlobal("bsNathorielTalk03","MYAREA",1)~ + talk_03
+ ~Global("bsNathorielTalk04","MYAREA",0)~ + @86 /* You are lucky I was ready to part with such a great sum for someone I don't even know. */ DO ~SetGlobal("bsNathorielTalk04","MYAREA",1)~ + talk_04
+ ~Global("bsSQCommanderPayed","GLOBAL",1) Global("bsNathorielTalk08","MYAREA",0)~ + @87 /* The Seatower Guard paid for you, actually. The commander will have a question or two for you regarding the slavers. */ DO ~SetGlobal("bsNathorielTalk08","MYAREA",1)~ + talk_08
+ ~Global("bsNathorielTalk01","MYAREA",0)~ + @88 /* Now what, I thought I'd put you into my mine where you can work your debts off for the rest of your life. */ DO ~SetGlobal("bsNathorielTalk01","MYAREA",1)~ + talk_01
++ @89 /* You come to strength now, the monks should see to your recovery. */ + talk_05
++ @90 /* Well then, good bye. */ + talk_05 
END

IF ~~ THEN talk_01
SAY @91 /* What? You are kidding, I hope? I should be safe here in the monastery, and slavery is against the law in Baldur's Gate! */
++ @92 /* I was kidding - I don't have a mine. */ + talk_02
+ ~GlobalGT("bsConfrontSlaveTraders","GLOBAL",1) Global("bsNathorielTalk08","MYAREA",0)~ + @93 /* You are here for one reason only: so the commander gets the needed information as to *where* the slavers operate! */ DO ~SetGlobal("bsNathorielTalk08","MYAREA",1)~ + talk_08
+ ~GlobalGT("bsConfrontSlaveTraders","GLOBAL",1) Global("bsNathorielTalk08","MYAREA",1)~ + @93 /* You are here for one reason only: so the commander gets the needed information as to *where* the slavers operate! */ DO ~SetGlobal("bsNathorielTalk08","MYAREA",2)~ + talk_09
+ ~Global("bsNathorielTalk03","MYAREA",0)~ + @85 /* That's also a way to say "thank you", I guess. */ DO ~SetGlobal("bsNathorielTalk03","MYAREA",1)~ + talk_03
+ ~Global("bsSQCommanderPayed","GLOBAL",1) Global("bsNathorielTalk08","MYAREA",0)~ + @87 /* The Seatower Guard paid for you, actually. The commander will have a question or two for you regarding the slavers. */ DO ~SetGlobal("bsNathorielTalk08","MYAREA",1)~ + talk_08
+ ~Global("bsNathorielTalk04","MYAREA",0)~ + @86 /* You are lucky I was ready to part with such a great sum for someone I don't even know. */ DO ~SetGlobal("bsNathorielTalk04","MYAREA",1)~ + talk_04
++ @89 /* You come to strength now, the monks should see to your recovery. */ + talk_05
++ @90 /* Well then, good bye. */ + talk_05 
END

IF ~~ THEN talk_02
SAY @94 /* Ah, er, haha...? You are kidding, though, right? I really do not know how to raise this much gold, even if I'd tried. */
+ ~GlobalGT("bsConfrontSlaveTraders","GLOBAL",1) Global("bsNathorielTalk08","MYAREA",1)~ + @93 /* You are here for one reason only: so the commander gets the needed information as to *where* the slavers operate! */ DO ~SetGlobal("bsNathorielTalk08","MYAREA",2)~ + talk_09
+ ~Global("bsNathorielTalk03","MYAREA",0)~ + @85 /* That's also a way to say "thank you", I guess. */ DO ~SetGlobal("bsNathorielTalk03","MYAREA",1)~ + talk_03
+ ~Global("bsSQCommanderPayed","GLOBAL",1) Global("bsNathorielTalk08","MYAREA",0)~ + @87 /* The Seatower Guard paid for you, actually. The commander will have a question or two for you regarding the slavers. */ DO ~SetGlobal("bsNathorielTalk08","MYAREA",1)~ + talk_08
+ ~Global("bsNathorielTalk04","MYAREA",0)~ + @86 /* You are lucky I was ready to part with such a great sum for someone I don't even know. */ DO ~SetGlobal("bsNathorielTalk04","MYAREA",1)~ + talk_04
++ @89 /* You come to strength now, the monks should see to your recovery. */ + talk_05
++ @90 /* Well then, good bye. */ + talk_05 
END

IF ~~ THEN talk_03
SAY @95 /* You do have my sincerest thankfulness, but that's about all I can give you. */
+ ~GlobalGT("bsConfrontSlaveTraders","GLOBAL",1) Global("bsNathorielTalk08","MYAREA",1)~ + @93 /* You are here for one reason only: so the commander gets the needed information as to *where* the slavers operate! */ DO ~SetGlobal("bsNathorielTalk08","MYAREA",2)~ + talk_09
+ ~Global("bsSQCommanderPayed","GLOBAL",1) Global("bsNathorielTalk08","MYAREA",0)~ + @87 /* The Seatower Guard paid for you, actually. The commander will have a question or two for you regarding the slavers. */ DO ~SetGlobal("bsNathorielTalk08","MYAREA",1)~ + talk_08
+ ~Global("bsNathorielTalk04","MYAREA",0)~ + @86 /* You are lucky I was ready to part with such a great sum for someone I don't even know. */ DO ~SetGlobal("bsNathorielTalk04","MYAREA",1)~ + talk_04
+ ~Global("bsNathorielTalk01","MYAREA",0)~ + @88 /* Now what, I thought I'd put you into my mine where you can work your debts off for the rest of your life. */ DO ~SetGlobal("bsNathorielTalk01","MYAREA",1)~ + talk_01
++ @89 /* You come to strength now, the monks should see to your recovery. */ + talk_05
++ @90 /* Well then, good bye. */ + talk_05 
END

IF ~~ THEN talk_04
SAY @96 /* Oh, but we could get to know each other - how about you invite me to a nice dragon ale over in the inn, for example. */
+ ~Global("bsNathorielTalk06","MYAREA",0)~ + @97 /* I'm starting to regret the trouble I went through to save you. */ DO ~SetGlobal("bsNathorielTalk06","MYAREA",1)~ + talk_06
+ ~GlobalGT("bsConfrontSlaveTraders","GLOBAL",1) Global("bsNathorielTalk08","MYAREA",1)~ + @93 /* You are here for one reason only: so the commander gets the needed information as to *where* the slavers operate! */ DO ~SetGlobal("bsNathorielTalk08","MYAREA",2)~ + talk_09
+ ~Global("bsNathorielTalk03","MYAREA",0)~ + @85 /* That's also a way to say "thank you", I guess. */ DO ~SetGlobal("bsNathorielTalk03","MYAREA",1)~ + talk_03
+ ~Global("bsSQCommanderPayed","GLOBAL",1) Global("bsNathorielTalk08","MYAREA",0)~ + @87 /* The Seatower Guard paid for you, actually. The commander will have a question or two for you regarding the slavers. */ DO ~SetGlobal("bsNathorielTalk08","MYAREA",1)~ + talk_08
+ ~Global("bsNathorielTalk01","MYAREA",0)~ + @88 /* Now what, I thought I'd put you into my mine where you can work your debts off for the rest of your life. */ DO ~SetGlobal("bsNathorielTalk01","MYAREA",1)~ + talk_01
++ @89 /* You come to strength now, the monks should see to your recovery. */ + talk_05
++ @90 /* Well then, good bye. */ + talk_05 
END

IF ~~ THEN talk_05
SAY @98 /* Have a good day then. And, say 'hello' to my brother, will you? The shiny knight stuck in prison, who would have guessed. */
IF ~~ THEN EXIT
IF ~GlobalLT("bsShucksBrother","GLOBAL",7)~ THEN DO ~
EraseJournalEntry(@812)
EraseJournalEntry(@813)
SetGlobal("bsShucksBrother","GLOBAL",7)~ UNSOLVED_JOURNAL @814 EXIT
END 

IF ~~ THEN talk_06
SAY @99 /* Yes, that's what Shuck keeps on repeating to say, but there he is, getting himself into prison to save his lost little brother. */
++ @100 /* You disgust me, to be honest. */ DO ~SetGlobal("bsNathorielTalk06","MYAREA",2)~ + talk_07
+ ~GlobalGT("bsConfrontSlaveTraders","GLOBAL",1) Global("bsNathorielTalk08","MYAREA",1)~ + @93 /* You are here for one reason only: so the commander gets the needed information as to *where* the slavers operate! */ DO ~SetGlobal("bsNathorielTalk08","MYAREA",2)~ + talk_09
+ ~Global("bsNathorielTalk03","MYAREA",0)~ + @85 /* That's also a way to say "thank you", I guess. */ DO ~SetGlobal("bsNathorielTalk03","MYAREA",1)~ + talk_03
+ ~Global("bsNathorielTalk01","MYAREA",0)~ + @88 /* Now what, I thought I'd put you into my mine where you can work your debts off for the rest of your life. */ DO ~SetGlobal("bsNathorielTalk01","MYAREA",1)~ + talk_01
++ @86 /* You are lucky I was ready to part with such a great sum for someone I don't even know. */ + talk_04
+ ~Global("bsSQCommanderPayed","GLOBAL",1) Global("bsNathorielTalk08","MYAREA",0)~ + @87 /* The Seatower Guard paid for you, actually. The commander will have a question or two for you regarding the slavers. */ DO ~SetGlobal("bsNathorielTalk08","MYAREA",1)~ + talk_08
++ @89 /* You come to strength now, the monks should see to your recovery. */ + talk_05
++ @90 /* Well then, good bye. */ + talk_05 
END

IF ~~ THEN talk_07
SAY @101 /* Well, ain't I lucky you freed me before realizing this. */
+ ~Global("bsNathorielTalk06","MYAREA",0)~ + @97 /* I'm starting to regret the trouble I went through to save you. */ DO ~SetGlobal("bsNathorielTalk06","MYAREA",1)~ + talk_06
+ ~GlobalGT("bsConfrontSlaveTraders","GLOBAL",1) Global("bsNathorielTalk08","MYAREA",1)~ + @93 /* You are here for one reason only: so the commander gets the needed information as to *where* the slavers operate! */ DO ~SetGlobal("bsNathorielTalk08","MYAREA",2)~ + talk_09
+ ~Global("bsNathorielTalk03","MYAREA",0)~ + @85 /* That's also a way to say "thank you", I guess. */ DO ~SetGlobal("bsNathorielTalk03","MYAREA",1)~ + talk_03
+ ~Global("bsNathorielTalk01","MYAREA",0)~ + @88 /* Now what, I thought I'd put you into my mine where you can work your debts off for the rest of your life. */ DO ~SetGlobal("bsNathorielTalk01","MYAREA",1)~ + talk_01
+ ~Global("bsNathorielTalk04","MYAREA",0)~ + @86 /* You are lucky I was ready to part with such a great sum for someone I don't even know. */ DO ~SetGlobal("bsNathorielTalk04","MYAREA",1)~ + talk_04
+ ~Global("bsSQCommanderPayed","GLOBAL",1) Global("bsNathorielTalk08","MYAREA",0)~ + @87 /* The Seatower Guard paid for you, actually. The commander will have a question or two for you regarding the slavers. */ DO ~SetGlobal("bsNathorielTalk08","MYAREA",1)~ + talk_08
++ @89 /* You come to strength now, the monks should see to your recovery. */ + talk_05
++ @90 /* Well then, good bye. */ + talk_05 
END

IF ~~ THEN talk_08
SAY @102 /* (wails) You leave me at the commander's mercy? Didn't you hear about his interrogator? I'm just a weakened slave trader victim. It's not fair to throw me into the law's mouth like this! */
+ ~Global("bsNathorielTalk06","MYAREA",0)~ + @97 /* I'm starting to regret the trouble I went through to save you. */ DO ~SetGlobal("bsNathorielTalk06","MYAREA",1)~ + talk_06
+ ~Global("bsNathorielTalk06","MYAREA",1)~ + @100 /* You disgust me, to be honest. */ DO ~SetGlobal("bsNathorielTalk06","MYAREA",2)~ + talk_07
++ @93 /* You are here for one reason only: so the commander gets the needed information as to *where* the slavers operate! */ DO ~SetGlobal("bsNathorielTalk08","MYAREA",2)~ + talk_09
+ ~Global("bsNathorielTalk03","MYAREA",0)~ + @85 /* That's also a way to say "thank you", I guess. */ DO ~SetGlobal("bsNathorielTalk03","MYAREA",1)~ + talk_03
+ ~Global("bsNathorielTalk01","MYAREA",0)~ + @88 /* Now what, I thought I'd put you into my mine where you can work your debts off for the rest of your life. */ DO ~SetGlobal("bsNathorielTalk01","MYAREA",1)~ + talk_01
+ ~Global("bsNathorielTalk04","MYAREA",0)~ + @86 /* You are lucky I was ready to part with such a great sum for someone I don't even know. */ DO ~SetGlobal("bsNathorielTalk04","MYAREA",1)~ + talk_04
++ @103 /* This has nothing to do with your former life - or has it? This is about you being a victim of the slave trade and helping to bring justice to the other victims - and for the safety of the city. */ + talk_05 
++ @89 /* You come to strength now, the monks should see to your recovery. */ + talk_05
++ @90 /* Well then, good bye. */ + talk_05 
END

IF ~~ THEN talk_09
SAY @104 /* Alright, I get it! I get it! */
+ ~Global("bsNathorielTalk06","MYAREA",0)~ + @97 /* I'm starting to regret the trouble I went through to save you. */ DO ~SetGlobal("bsNathorielTalk06","MYAREA",1)~ + talk_06
+ ~Global("bsNathorielTalk06","MYAREA",1)~ + @100 /* You disgust me, to be honest. */ DO ~SetGlobal("bsNathorielTalk06","MYAREA",2)~ + talk_07
+ ~Global("bsNathorielTalk03","MYAREA",0)~ + @85 /* That's also a way to say "thank you", I guess. */ DO ~SetGlobal("bsNathorielTalk03","MYAREA",1)~ + talk_03
+ ~Global("bsNathorielTalk01","MYAREA",0)~ + @88 /* Now what, I thought I'd put you into my mine where you can work your debts off for the rest of your life. */ DO ~SetGlobal("bsNathorielTalk01","MYAREA",1)~ + talk_01
+ ~Global("bsNathorielTalk04","MYAREA",0)~ + @86 /* You are lucky I was ready to part with such a great sum for someone I don't even know. */ DO ~SetGlobal("bsNathorielTalk04","MYAREA",1)~ + talk_04
++ @89 /* You come to strength now, the monks should see to your recovery. */ + talk_05
++ @90 /* Well then, good bye. */ + talk_05 
END




/* after talking to Shuck - interrogator is coming */

CHAIN 
IF WEIGHT #-1
~Global("bsInquisitorsWork","GLOBAL",1)~ THEN YSHAFSLG inquisitor
@105 /* Well now, Shuck. I see you had your wish granted. It's time to go to work, then. */
== bsshuck @106 /* I... I have nothing of importance to say! I swear! */
== YSHAFSLG @107 /* How about you let us decide that, hm? */
END
++ @108 /* You are the tower's interrogator? */ + inquisitor_01
++ @109 /* I'll leave you to it, then. */ + inquisitor_02

APPEND YSHAFSLG 
IF ~~ THEN inquisitor_01
SAY @110 /* Indeed, Halfslinger, at your service. */
++ @111 /* Please - don't be too cruel with him. */ + inquisitor_02
++ @112 /* Don't spare that criminal, Halfslinger. */ + inquisitor_02
++ @109 /* I'll leave you to it, then. */ + inquisitor_02
END

IF ~~ THEN inquisitor_02
SAY @113 /* Now, how this goes is all up to you, Shuck, hm? Let's begin... */
IF ~~ THEN DO ~SetGlobal("bsInquisitorsWork","GLOBAL",2)~ EXIT
END

IF WEIGHT #-1
~Global("bsInquisitorsWork","GLOBAL",2)~ inquisitor_03
SAY @114 /* Please, leave, so I can start working. I'll be available for buy and sell shortly in my house. */
IF ~~ THEN EXIT
END

END //APPEND



/* Smuggler in Nashkel */

BEGIN bssmgl01

IF ~Dead("bsslav01")~ THEN slaver_dead
SAY @115 /* Hello, there, traveller! There are many fine berries to find here, if you know where to look... Oh, it's you. Guys, we got company! */
IF ~~ THEN DO ~ClearAllActions() StartCutSceneMode() StartCutScene("bscut001")~ EXIT
END

IF ~True()~ THEN disguise
SAY @116 /* Hello, there, traveller! There are many fine berries to find here, if you know where to look. Of course, you have to know the right kind to pick the edible ones. */
IF ~!Global("bsShucksBrother","GLOBAL",1)~ THEN EXIT
+ ~Global("bsShucksBrother","GLOBAL",1)~ + @117 /* Alright, now that I actually have a suspicion about what you really are, this sounds awfully like a watchword. We aren't looking for berries, but for Shuck's brother. Does that mean anything to you? */ + disguise_00
+ ~Global("bsShucksBrother","GLOBAL",1)~ + @118 /* We are here in Shuck's name. Rings any bell? */ + disguise_00
+ ~Global("bsShucksBrother","GLOBAL",1)~ + @119 /* Well then, have fun looking for your berries. */ EXIT 
END

IF ~~ THEN disguise_00
SAY @120 /* Is that so? Hm, then there is no need for the disguise, I guess. Guys, we got company! */
IF ~~ THEN DO ~ClearAllActions() StartCutSceneMode() StartCutScene("bscut001")~ EXIT
END

BEGIN bssmgl02

/* PC killed Leonhard before learning about smugglers */
IF ~Dead("bsslav01") Global("bsSmugglerQuest","GLOBAL",0)~ THEN slaver_dead
SAY @121 /* I am sorry for the greeting, but you - *accidentally* - killed our business partner in the Seatower, so there is only one thing that will happen here now. I am sure you understand. */
IF ~~ THEN DO ~SetInterrupt(FALSE)
ActionOverride("bssmgl02",DestroyItem("MINHP1")) SetGlobal("bsSmugglerAttacked","GLOBAL",4)
SetGlobal("bsSmugglerQuest","GLOBAL",48)
ActionOverride("bssmgl02",DestroyItem("MINHP1"))
ActionOverride("bssmgl02",Enemy())
SetInterrupt(TRUE)~ EXIT
END

/* PC attacked "berry picker" */
IF ~Global("bsSmugglerAttacked","GLOBAL",3)
Global("bsSmugglerQuest","GLOBAL",0)~ THEN attacked
SAY @122 /* Now there, why would you attack an innocent berry picker! You are a mean person, you know that? */
+ ~!Global("bsShucksBrother","GLOBAL",1)~ + @123 /* Who the hell are you? */ + attacked_01
+ ~!Global("bsShucksBrother","GLOBAL",1)~ + @124 /* Bandits! I will kill you all! */ + attacked_02
+ ~Global("bsShucksBrother","GLOBAL",1)~ + @117 /* Alright, now that I actually have a suspicion about what you really are, this sounds awfully like a watchword. We aren't looking for berries, but for Shuck's brother. Does that mean anything to you? */ + smuggler_00
+ ~Global("bsShucksBrother","GLOBAL",1)~ + @118 /* We are here in Shuck's name. Rings any bell? */ + smuggler_00
++ @125 /* Berry picker, yeah right. */ EXIT
END

IF ~~ THEN attacked_01
SAY @126 /* So you seriously just attacked out of the blue? */
IF ~~ THEN + attacked_02
END

IF ~~ THEN attacked_02
SAY @127 /* We are no bandits, we are *smugglers*. We do not steal, we deliver! On time and for a fair price! See that tent up there in the north? If we do not deliver Black Lotus there every day on time, a lot of people will become very irritated in a very short amount of time. So, please leave us alone. Who knows, maybe you'll have use of us somewhere in the future. */
IF ~~ THEN EXIT
END

/* Holger, after PC told about coming for Shuck's brother to "berry picker" */
CHAIN
IF ~Global("bsShucksBrother","GLOBAL",1)
!Global("bsSmugglerAttacked","GLOBAL",1)
Global("bsSmugglerQuest","GLOBAL",0)~ THEN bssmgl02 smuggler_00
@128 /* Oh, now look at that! Shuck sent you, eh? Thinks he can throw a bunch of heavy armed mercenaries our way to get rid of the debts? */
== bssmgl02 IF ~!Global("bsSmugglerAttacked","GLOBAL",3)~ THEN @129 /* Yes, we are the smugglers, in case you wondered. */
END
++ @130 /* I am here for Shuck's brother, yes. I have the gold you wanted. */ + smuggler_04
++ @131 /* I am here for his brother, but you will not see any gold for it! Tell me where he is, now! */ + smuggler_02
++ @132 /* I won't fight you. I am here because I want to work with you! */ + smuggler_29
++ @133 /* I'm here because I want to fight. The more, the merrier! */ + smuggler_01

APPEND bssmgl02

IF ~~ THEN smuggler_01
SAY @134 /* Oh, but don't you think you are rushing just a little bit? You don't even know how many there are of us, yet! */
++ @135 /* Fine, then I'll wait until I know how many of you there are. */ + smuggler_02
++ @136 /* No, I will fight you now! */ + smuggler_03
END

END //APPEND

CHAIN
IF ~~ THEN bssmgl02 smuggler_02
@137 /* Ho! I like you! You've got spine! */
== bssmgl02 IF ~Class(Player1,PALADIN) %PLAYER1_NO_BLACKGUARD%~ THEN @138 /* A pity you are one of those do-gooders, or I'd have a use for you. */
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
%PLAYER6_NO_BLACKGUARD%~ THEN @139 /* A pity you travel with one of those do-gooders, I'd have use of you. */
END
IF ~~ THEN + smuggler_07


APPEND bssmgl02 

/* PC insisted on fighting */
IF ~~ THEN smuggler_03
SAY @140 /* (sigh) Here we go. Guys... */
IF ~~ THEN DO ~SetGlobal("bsSmugglerAttacked","GLOBAL",1) ActionOverride("bssmgl02",Enemy())~ EXIT
END

IF ~~ THEN smuggler_04
SAY @141 /* You telling me you got all the gold I requested right here? */
IF ~~ THEN + smuggler_02
END

/* after first fight */
IF ~Global("bsShucksBrother","GLOBAL",1) Global("bsSmugglerAttacked","GLOBAL",1) Allegiance(Myself,NEUTRAL) Global("bsSmugglerQuest","GLOBAL",0)~ THEN smuggler_05
SAY @142 /* Alright - alright, I get it. You are too strong for us. But killing us - here - won't help you in finding Shuck's brother now, would it? Please stop killing us, we are smugglers, but we are not murderers or bandits. We do not steal, we deliver! */
++ @131 /* I am here for his brother, but you will not see any gold for it! Tell me where he is, now! */ + smuggler_02
++ @143 /* I couldn't care less about that brother. I am here because I want to work with you! */ + smuggler_29
++ @144 /* Stop talking - I'm not done with you! */ + smuggler_06
END

/* PC insists on fighting again */
IF ~~ THEN smuggler_06
SAY @145 /* Oh - come *on*! Really? */
IF ~~ THEN DO ~SetInterrupt(FALSE)
ActionOverride("bssmgl02",DestroyItem("MINHP1")) SetGlobal("bsSmugglerQuest","GLOBAL",48)
SetGlobal("bsSmugglerAttacked","GLOBAL",4)
ActionOverride("bssmgl02",DestroyItem("MINHP1")) ActionOverride("bssmgl02",Enemy())
SetInterrupt(TRUE)~ EXIT
END

/* Holger introduces himelf */
IF ~~ THEN smuggler_07
SAY @146 /* Let me introduce myself. I am Holger, and I am a smuggler. My mates and me smuggle illicit or very rare goods from Amn to the Sword Coast and Baldur's City. Let me play with open cards here. We know Shuck is in prison now, so it's only a matter of time until the tower interrogator will come to this news: Shuck was our Seatower contact. He told the tower cell when it would be safe to land and make sure the wares got into the city alright. */
++ @147 /* Shuck did what?! */ + smuggler_09
++ @148 /* Oh. */ + smuggler_09
++ @149 /* He told me he needs to bail out his brother from you! */ + smuggler_08
++ @150 /* A-haha, what a sly little soldier. */ + smuggler_09
END

IF ~~ THEN smuggler_08
SAY @151 /* And that is true! */
IF ~~ THEN + smuggler_09
END

IF ~~ THEN smuggler_09
SAY @152 /* Ah, Shuck didn't tell you he did work for us, did he? Well, he did start working for us to bail out his brother, now that is true. Shuck's brother still owes us gold, so we requested the debt being paid, at least. Well, Shuck paid, but too late. */
++ @153 /* What do you mean "Too late"? */ + smuggler_12
++ @154 /* Fine. I have the gold here to bail him out, 1000 was the sum, so give me Shuck's brother. */ + smuggler_12
++ @155 /* I don't care about your problems. Tell me where Shuck's brother is! */ + smuggler_12
++ @156 /* Sounds like you could use some help, hm? */ + smuggler_11
END

END //APPEND

CHAIN
IF ~~ THEN bssmgl02 smuggler_11
@157 /* Help? You mean from you. Yes, that is an intriguing throught. */
== bssmgl02 IF ~Class(Player1,PALADIN) %PLAYER1_NO_BLACKGUARD%~ THEN @158 /* At least if I get myself to trust you. Hmm... */
== bssmgl02 @159 /* Because we get a lot of pressure from all sides. It's not only us doing shady smuggler things, you know? Competition and all that, and other folks are much, much scarier than us. As to Shuck's brother... */
END
IF ~~ THEN + smuggler_12

APPEND bssmgl02 

IF ~~ THEN smuggler_12
SAY @160 /* Well... See, we had to sell that brother's debts to someone else to get our gold in time. We told that fool he should hurry. What does he think we are? Ilmater monks? His brother got himself knee-deep into problems here, we are just business men who want to get our pay! */
++ @161 /* Sold his debts? So where is he now? */ + smuggler_16
++ @162 /* By the nine hells, spit it out already! Where is the brother now? */ + smuggler_16
END

IF ~~ THEN smuggler_13
SAY @163 /* Oh, now that hurt. I live and breathe by the smugglers' honor code! Don't you make fun of it. You'd wish all "criminals" would go by such a code, the world would be peaceful as a monastery - at least for those who can pay. */
++ @164 /* Then tell me where I can find those slave traders! */ + smuggler_17
++ @165 /* I am here to find Shuck's brother and I will not return without him! */ + smuggler_17
END

IF ~~ THEN smuggler_14
SAY @166 /* See, it's not *us* doing slavery, alright? We are just decent smugglers who provide paying customers with things they couldn't get otherwise... or not that cheap, that is. We just... need the traders for their ships as they carry some of our goods on their way from Amn here, so we need to be good friends with them. And we needed the gold to pay off some very irritated customers. It was hard as it is with all the bandits around. These are difficult times for honest smugglers, you know? */
++ @167 /* Honest smugglers? Don't make me laugh. */ + smuggler_13
++ @164 /* Then tell me where I can find those slave traders! */ + smuggler_17
++ @165 /* I am here to find Shuck's brother and I will not return without him! */ + smuggler_17
END

IF ~~ THEN smuggler_15
SAY @168 /* We only sold that soldier's brothers *depts* to them slave traders because gold is scarse in these times of upcoming war and iron crisis - a lot of our customers couldn't pay on time. We have obligations, too! */
++ @169 /* You expect me to have sympathy with your problems? */ + smuggler_18
++ @170 /* Very well, but I'm not done with you, believe me! */ + smuggler_20
++ @171 /* Now that's settled, let's talk business, shall we? */ + smuggler_20
++ @172 /* Then we are done here. Farewell. */ + smuggler_21
END

IF ~~ THEN smuggler_16
SAY @173 /* Well, taken by the slave traders. Probably being transported to a ship in the city's harbor as we speak. What can I say - I am sorry? */
++ @174 /* That means the brother's debts are closed? */ + smuggler_30
++ @175 /* Slave traders?! */ + smuggler_14
++ @164 /* Then tell me where I can find those slave traders! */ + smuggler_17
++ @165 /* I am here to find Shuck's brother and I will not return without him! */ + smuggler_17
END

IF ~~ THEN smuggler_17
SAY @176 /* I respect your wish to keep your promise to Shuck. Fine. */
IF ~~ THEN + smuggler_17_1
END

IF ~~ THEN smuggler_17_1
SAY @177 /* Take this, then. This is a contact note for one of their slave auctions. You could have gotten that from anywhere. I'm just sending a potential customer their way, right? No need for this *help* of mine to backfire to my disadvantage, no? */
++ @178 /* I appreciate it. */ DO ~GiveItemCreate("bssmq001",[PC],1,0,0) EraseJournalEntry(@808) SetGlobal("bsShucksBrother","GLOBAL",2)~ UNSOLVED_JOURNAL @809 + smuggler_19
++ @179 /* Your *help* wouldn't have been needed if you hadn't sold his brother in the first place! */ DO ~GiveItemCreate("bssmq001",[PC],1,0,0) EraseJournalEntry(@808) SetGlobal("bsShucksBrother","GLOBAL",2)~ UNSOLVED_JOURNAL @809 + smuggler_15
++ @170 /* Very well, but I'm not done with you, believe me! */ DO ~GiveItemCreate("bssmq001",[PC],1,0,0) EraseJournalEntry(@808) SetGlobal("bsShucksBrother","GLOBAL",2)~ UNSOLVED_JOURNAL @809 + smuggler_20
++ @171 /* Now that's settled, let's talk business, shall we? */ DO ~GiveItemCreate("bssmq001",[PC],1,0,0) EraseJournalEntry(@808) SetGlobal("bsShucksBrother","GLOBAL",2)~ UNSOLVED_JOURNAL @809 + smuggler_20
++ @172 /* Then we are done here. Farewell. */ DO ~GiveItemCreate("bssmq001",[PC],1,0,0) EraseJournalEntry(@808) SetGlobal("bsShucksBrother","GLOBAL",2)~ UNSOLVED_JOURNAL @809 + smuggler_21
END

IF ~~ THEN smuggler_18
SAY @180 /* If not with us, then with our customers - what do you think the poor lot in that Black Lotus tent would do without us? Wait, you don't have to answer that. *You* probably think it's our fault they are in there in the first place! */
++ @170 /* Very well, but I'm not done with you, believe me! */ + smuggler_20
++ @171 /* Now that's settled, let's talk business, shall we? */ + smuggler_20
++ @172 /* Then we are done here. Farewell. */ + smuggler_21
END

IF ~~ THEN smuggler_19
SAY @181 /* Now that's a reply I like to hear! */
++ @170 /* Very well, but I'm not done with you, believe me! */ + smuggler_20
++ @171 /* Now that's settled, let's talk business, shall we? */ + smuggler_20
++ @172 /* Then we are done here. Farewell. */ + smuggler_21
END

IF ~~ THEN smuggler_20
SAY @182 /* Now, what would you mean with that, pray tell? */
++ @183 /* Nothing. Just that I will have an eye on you and your kind, so better behave. */ + smuggler_21
++ @184 /* (true)Well, times are rough, as you already said. I wouldn't mind some extra business to earn some extra gold, if you know what I mean. */ DO ~IncrementGlobal("bs_Smugglerfriend","GLOBAL",1)~ + smuggler_22
++ @185 /* (lie)You hinted at having a use for me. I want to work for you. */ DO ~IncrementGlobal("bs_Smugglerfriend","GLOBAL",-1)~ + smuggler_22
++ @186 /* I am saying now that I have the information I need, I will kill you! Draw your weapons! */ + smuggler_06
END

IF ~~ THEN smuggler_21
SAY @187 /* Indeed. Farewell to you, too. */
IF ~~ THEN DO ~SetGlobal("bsSmugglersLeave","GLOBAL",1)~ UNSOLVED_JOURNAL @809 EXIT
END

END //APPEND

CHAIN
IF ~~ THEN bssmgl02 smuggler_22
@188 /* You really would like to work for me, hm? */
/* ## NPC reactions */
== bssmgl02 IF ~Class(Player1,PALADIN) %PLAYER1_NO_BLACKGUARD%~ THEN @189 /* Look, I put a lot of trust into you already, alright? Me even talking to a shiny metal suit like you alone is seen as treason by some. But I notice potential when I see it, so let's try this. */
== bssmgl02 IF ~!Global("bsShucksBrother","GLOBAL",30)~ THEN @190 /* I might have a job or two, but first you need to earn our trust. I need to see how you deal with the traders. Because in case you will go there to stirr trouble so that it will boomerang back to *us*, then we will not become business partners, that much is clear. Then I need to see how you fare at the tower. */
== bssmgl02 IF ~Global("bsShucksBrother","GLOBAL",30)~ THEN @191 /* I might have a job or two, but first you need to earn our trust. I need to see how you fare at the tower. */
== bssmgl02 IF ~Global("bsPCMetSmugglerDoppelgangers","GLOBAL",0)~ THEN @192 /* As I already said, the tower's interrogator will get to the information about us through Shuck eventually, anyway, so I don't mind you telling the Tower Commander all of *that*. But how will you go on from there is the real question. Because, if you want to work with me, you'd also want to work with the smuggler cell at the tower, or so I would assume. And there we have the first problem. You still in on this? */
== bssmgl02 IF ~!Dead("bssmgl06") GlobalGT("bsPCMetSmugglerDoppelgangers","GLOBAL",1)~ THEN @193 /* Hmm. I know you helped Juan escape *and* you already solved the mystery why the tower cell didn't communicate with us any more, so we *could* say you already worked for me, and with a very important matter. Fine. I'd have one more task for you. */
END
+ ~OR(2) Dead("bssmgl06") !GlobalGT("bsPCMetSmugglerDoppelgangers","GLOBAL",1)~ + @194 /* Go on. */ + smuggler_22_1
+ ~!Dead("bssmgl06") GlobalGT("bsPCMetSmugglerDoppelgangers","GLOBAL",1)~ + @194 /* Go on. */ + smuggler_24
++ @172 /* Then we are done here. Farewell. */ + smuggler_21


APPEND bssmgl02 

IF ~~ THEN smuggler_22_1
SAY @195 /* Some weeks ago we lost contact with the tower cell - completely. And then the tower cell stopped delivering. We have complaints from all over Baldur's City about customers not receiving their wares! Shuck didn't contact us, either. We had to believe the cell was revealed, imprisoned, or killed, or all together. Actually, we suspected Shuck might have revealed us, but Shuck insists the tower cell stopped talking to *him*, and him doing nothing against us. */
= @196 /* So, let your contact to the Seatower authorities be of our advantage, then: Find out what happened to the smuggler cell that used to operate at Balduran's Tower. Were they taken out? Were they taken over by a rivalling group? Got the slave traders too pricky and thought they could do without us? */
+ ~GlobalGT("bsPCMetSmugglerDoppelgangers","GLOBAL",0)~ + @197 /* I think I already know the answer to that, actually. */ + smuggler_22_2
++ @198 /* I will do that. */ + smuggler_24
++ @199 /* I guess I have no choice than to accept this job. */ + smuggler_24
++ @200 /* I'm not sure I'll have time to deal with this soon. */ + smuggler_23
END

IF ~~ THEN smuggler_22_2
SAY @201 /* Oh? That's interesting. Nevertheless, let me finish what I wanted to say, first. */
IF ~~ THEN + smuggler_24
END

IF ~~ THEN smuggler_23
SAY @202 /* You want to work for us, you better make time. */
IF ~~ THEN + smuggler_24
END

IF ~~ THEN smuggler_24
SAY @203 /* Here's a very important delivery for the cook of the "Helm and Cloak" in north west Baldur's Gate. Do deliver this in the next three days the latest. */
++ @204 /* The "Helm and Cloak" is getting smuggler wares? Aren't they scared of the Flaming Fist finding out about it? */ + smuggler_27
++ @205 /* A sealed box? How can I trust you this will not be to my harm? */ + smuggler_28
++ @206 /* I want to know what is in this box if I am to deliver it for you. */ + smuggler_28
++ @207 /* Alright, I'm on my way. */ + smuggler_25
++ @208 /* What if I don't want to do that? */ + smuggler_26
END

END //APPEND

CHAIN
IF ~~ THEN bssmgl02 smuggler_25
@209 /* Oh, and we expect you not to open that box. The box is sealed, and we expect the seal to be unbroken upon delivery. It's a test, obviously. */
== bssmgl02 IF ~OR(2) Dead("bssmgl06") !GlobalGT("bsPCMetSmugglerDoppelgangers","GLOBAL",1)~ THEN @210 /* Do these two tasks - deliver the box and inquire what happened to the tower cell - and return to me with news. You will not regret it. Hurry with the delivery, though - you have three days. */
== bssmgl02 IF ~!Dead("bssmgl06") GlobalGT("bsPCMetSmugglerDoppelgangers","GLOBAL",1)~ THEN @211 /* Do this task - deliver the box and return to me with news. You will not regret it. Hurry with the delivery, though - you have three days. */
/* ## NPC reactions */
END
/* PC stated truly that they want to work for the smugglers */
IF ~!GlobalLT("bs_Smugglerfriend","GLOBAL",0)~ THEN DO ~GiveItem("bssmq002",[PC])
DestroyItem("bssmq007")
SetGlobal("bsWorkingWithSmugglers","GLOBAL",1)
SetGlobal("bsSmugglerQuest","GLOBAL",1) 
SetGlobal("bsShucksBrother","GLOBAL",2) 
EraseJournalEntry(@808) 
AddJournalEntry(@830,QUEST)
AddJournalEntry(@832,QUEST)
AddJournalEntry(@833,QUEST)
SetGlobalTimer("bsSmugglerQuestTimer1","GLOBAL",FIVE_DAYS)~ UNSOLVED_JOURNAL @809 EXIT
IF ~!GlobalLT("bs_Smugglerfriend","GLOBAL",0)
!Dead("bssmgl06") GlobalGT("bsPCMetSmugglerDoppelgangers","GLOBAL",1)~ THEN DO ~GiveItem("bssmq002",[PC])
DestroyItem("bssmq007")
SetGlobal("bsWorkingWithSmugglers","GLOBAL",1)
SetGlobal("bsSmugglerQuest","GLOBAL",1) 
SetGlobal("bsShucksBrother","GLOBAL",2) 
EraseJournalEntry(@808) 
AddJournalEntry(@830,QUEST)
AddJournalEntry(@833,QUEST)
SetGlobalTimer("bsSmugglerQuestTimer1","GLOBAL",FIVE_DAYS)~ UNSOLVED_JOURNAL @809 + smuggler_36
IF ~!GlobalLT("bs_Smugglerfriend","GLOBAL",0)
Global("bsShucksBrother","GLOBAL",30)~ THEN DO ~GiveItem("bssmq002",[PC])
DestroyItem("bssmq007")
SetGlobal("bsWorkingWithSmugglers","GLOBAL",1)
SetGlobal("bsSmugglerQuest","GLOBAL",1) 
AddJournalEntry(@830,QUEST)
AddJournalEntry(@832,QUEST)
AddJournalEntry(@833,QUEST)
SetGlobalTimer("bsSmugglerQuestTimer1","GLOBAL",FIVE_DAYS)~ EXIT
/* PC pretended that they want to work for the smugglers */
IF ~GlobalLT("bs_Smugglerfriend","GLOBAL",0)~ THEN DO ~GiveItem("bssmq002",[PC])
DestroyItem("bssmq007")
SetGlobal("bsWorkingWithSmugglers","GLOBAL",1)
SetGlobal("bsSmugglerQuest","GLOBAL",1)
SetGlobal("bsShucksBrother","GLOBAL",2)
EraseJournalEntry(@808)
AddJournalEntry(@100128,QUEST)
AddJournalEntry(@832,QUEST)
AddJournalEntry(@833,QUEST)
SetGlobalTimer("bsSmugglerQuestTimer1","GLOBAL",FIVE_DAYS)~ UNSOLVED_JOURNAL @809 EXIT
IF ~GlobalLT("bs_Smugglerfriend","GLOBAL",0)
!Dead("bssmgl06") GlobalGT("bsPCMetSmugglerDoppelgangers","GLOBAL",1)~ THEN DO ~GiveItem("bssmq002",[PC])
DestroyItem("bssmq007")
SetGlobal("bsWorkingWithSmugglers","GLOBAL",1)
SetGlobal("bsSmugglerQuest","GLOBAL",1)
SetGlobal("bsShucksBrother","GLOBAL",2)
EraseJournalEntry(@808)
AddJournalEntry(@100128,QUEST)
AddJournalEntry(@833,QUEST)
SetGlobalTimer("bsSmugglerQuestTimer1","GLOBAL",FIVE_DAYS)~ UNSOLVED_JOURNAL @809 + smuggler_36
IF ~GlobalLT("bs_Smugglerfriend","GLOBAL",0)
Global("bsShucksBrother","GLOBAL",30)~ THEN DO ~GiveItem("bssmq002",[PC])
DestroyItem("bssmq007")
SetGlobal("bsWorkingWithSmugglers","GLOBAL",1)
SetGlobal("bsSmugglerQuest","GLOBAL",1)
AddJournalEntry(@100128,QUEST)
AddJournalEntry(@832,QUEST)
AddJournalEntry(@833,QUEST)
SetGlobalTimer("bsSmugglerQuestTimer1","GLOBAL",FIVE_DAYS)~ EXIT


APPEND bssmgl02 

IF ~~ THEN smuggler_26
SAY @212 /* Then I'll have to send someone else with the box and regret heavily that I just told you all the things I did. And if I regret something, I usually make the ones responsible regret that, too. */
++ @205 /* A sealed box? How can I trust you this will not be to my harm? */ + smuggler_28
++ @206 /* I want to know what is in this box if I am to deliver it for you. */ + smuggler_28
++ @207 /* Alright, I'm on my way. */ + smuggler_25
++ @213 /* Threatening me? You shouldn't have. I will kill you! Draw your weapons! */ + smuggler_06
END

IF ~~ THEN smuggler_27
SAY @214 /* You're not supposed to *tell* them, are you? And don't you judge our customers. What did I say: not all of our wares are illicit, some are just *rare*, alright? */
++ @205 /* A sealed box? How can I trust you this will not be to my harm? */ + smuggler_28
++ @206 /* I want to know what is in this box if I am to deliver it for you. */ + smuggler_28
++ @207 /* Alright, I'm on my way. */ + smuggler_25
++ @208 /* What if I don't want to do that? */ + smuggler_26
END

IF ~~ THEN smuggler_28
SAY @215 /* Ah, but no, you don't see what the point is here. It's not about *you* trusting *me*. The real question is: why would *I* trust *you*? Smuggling means you deliver wares you know as little about as possible. And you do that because you know that I will give you wares that will pay good gold *and* will not harm you - unless you get caught by the law, that is, but I don't need to explain how that's an exception now, do I. */
= @216 /* So, this is what this is about. You need to trust me if you want to work for me. But more crucial is that *I* indeed trust you with my wares. I guarantee you that this box is not poisonous, nor will it explode, nor does it violate any general morale standards. As long as you keep it out of city authorities' way, no harm will come to you from it. */
IF ~~ THEN + smuggler_25
END

IF ~~ THEN smuggler_29
SAY @217 /* Work with us? Now, that's an interesting turn of events. How about we get to know each other first, then? */
IF ~~ THEN + smuggler_07
END

IF ~~ THEN smuggler_30
SAY @218 /* Yes, for us, his debts are closed. */
++ @219 /* (true) Great, because I couldn't care less about the brother. I came here to get in contact with you. I could use some extra gold, as well. */ DO ~IncrementGlobal("bs_Smugglerfriend","GLOBAL",1)
EraseJournalEntry(@808) SetGlobal("bsShucksBrother","GLOBAL",30)~ SOLVED_JOURNAL @807 + smuggler_31
++ @175 /* Slave traders?! */ + smuggler_14
++ @164 /* Then tell me where I can find those slave traders! */ + smuggler_17
++ @165 /* I am here to find Shuck's brother and I will not return without him! */ + smuggler_17
END

IF ~~ THEN smuggler_31
SAY @220 /* Oh, now that is a relief, considering we sold him already. Not him, mind, but his *debts*, of course, but what can I do if the traders take him for refund? So, we can put that whole affair to rest, then. At least I doubt we'll see many mercenaries coming our way from Shuck in the future... */
IF ~~ THEN + smuggler_22
END

/* PC attacked slave traders - unrelated to Holger's request */

IF ~Dead("bsslav01")
Global("bs_SmugglerSlaverConfrontation","GLOBAL",0)
!Global("bsSlaverQuest","GLOBAL",5)
!Global("bsSlaverQuest","GLOBAL",11)
!Global("bsSlaverQuest","GLOBAL",6)
!Global("bsSlaverQuest","GLOBAL",12)
Global("bsNoticedDeadLeonhard","LOCALS",0)~ THEN smuggler_attacked_slavers
SAY @221 /* Now there, <CHARNAME>. You return - but what did you do? Attacked and killed the traders' contact after I gave you the information where to find him! */
IF ~~ THEN DO ~SetGlobal("bsNoticedDeadLeonhard","LOCALS",1)~ + smuggler_32_2
END

IF ~Global("bsDeliverFigs","GLOBAL",1)
GlobalGT("bs_ReportSmugglersToFF","GLOBAL",5)~ THEN first_quest_busted
SAY @222 /* Well, you delived the package to the customer, but - why did you tip off the Flaming Fist? *And* show your face again here. Did you think we wouldn't know? */
IF ~~ THEN + smuggler_32_2
END
END //APPEND

CHAIN
IF ~Global("bsSmugglerQuest","GLOBAL",1) Global("bsDeliverFigs","GLOBAL",1)~ THEN bssmgl02 smuggler_32
@223 /* You return from your first delivery! */ DO ~EraseJournalEntry(@834)
EraseJournalEntry(@835)
EraseJournalEntry(@100147)
SetGlobal("bsDeliverFigs","GLOBAL",2)~
== bssmgl02 IF ~Global("bsSMQOpenedBox","GLOBAL",0) 
		Global("bsSMQAteFigs","GLOBAL",0)
		Global("bsSMQTooLate","GLOBAL",0)~ THEN @224 /* And a successful one it was. Our customer was pleased, and so am I. Well done! */
== bssmgl02 IF ~Global("bsSMQAteFigs","GLOBAL",0) Global("bsSMQOpenedBox","GLOBAL",1)~ THEN @225 /* Someone couldn't hold their curiosity and had to look inside, hm? */
== bssmgl02 IF ~Global("bsSMQAteFigs","GLOBAL",1)~ THEN @226 /* And *eating* parts of the delivery, <CHARNAME>? */
== bssmgl02 IF ~Global("bsSMQTooLate","GLOBAL",1)~ THEN @227 /* I have the feeling you do not understand the priority of these deliveries. We do not do them when we find the time, <CHARNAME>. They are *important* and *urgent*. You dawdled. */
== bssmgl02 IF ~Global("bsSMQOpenedBox","GLOBAL",1)
		Global("bsSMQAteFigs","GLOBAL",0)
		Global("bsSMQTooLate","GLOBAL",0)~ THEN @228 /* Oh well, our customer was fine with it, and the gold he withheld was your share, so I will turn a blind eye to that - this once. This once, <CHARNAME>. Congratulations to your first job done! */
END
IF ~OR(2)
Global("bsSMQAteFigs","GLOBAL",1)
Global("bsSMQTooLate","GLOBAL",1)~ THEN + smuggler_32_1

+ ~Global("bsSMQAteFigs","GLOBAL",0) Global("bsSMQTooLate","GLOBAL",0)~ + @229 /* *Figs*, Holger? Why? */ + smuggler_33
+ ~Global("bsSMQAteFigs","GLOBAL",0) Global("bsSMQTooLate","GLOBAL",0)
GlobalLT("bsPCMetSmugglerDoppelgangers","GLOBAL",4)~ + @230 /* So, what's my next task? */ + smuggler_35
+ ~Global("bsSMQAteFigs","GLOBAL",0) Global("bsSMQTooLate","GLOBAL",0)
Global("bsPCMetSmugglerDoppelgangers","GLOBAL",4)~ + @230 /* So, what's my next task? */ + smuggler_39_1
+ ~Global("bsSMQAteFigs","GLOBAL",0) Global("bsSMQTooLate","GLOBAL",0)~ + @231 /* We are done here, I won't continue working for you. */ + smuggler_34


APPEND bssmgl02 

/* Holger ends cooperation */
IF ~~ THEN smuggler_32_1
SAY @232 /* This is inacceptable behavior. I had high hopes for you, <CHARNAME>, such high hopes. But this will not do. Our business relation is over. Farewell. */
IF ~~ THEN DO ~AddJournalEntry(@836,QUEST_DONE)
SetGlobal("bsWorkingWithSmugglers","GLOBAL",2)
SetGlobal("bsSmugglerQuest","GLOBAL",51)~ EXIT
/* killed guards in 3rd quest */
IF ~Global("bsSmugglerQuest","GLOBAL",8)~ THEN DO ~ActionOverride("bssmgl02",TakePartyItem("bssmq004"))
ActionOverride("bssmgl02",DestroyItem("bssmq004"))
AddJournalEntry(@836,QUEST_DONE)
SetGlobal("bsWorkingWithSmugglers","GLOBAL",2)
SetGlobal("bsSmugglerQuest","GLOBAL",51)~ EXIT
/* busted Holger during 3rd quest */
IF ~Global("bs_ReportSmugglersNashkel","GLOBAL",5)~ THEN DO ~ActionOverride("bssmgl02",TakePartyItem("bssmq004"))
ActionOverride("bssmgl02",DestroyItem("bssmq004"))
AddJournalEntry(@836,QUEST_DONE)
SetGlobal("bs_ReportSmugglersNashkel","GLOBAL",52)
SetGlobal("bsWorkingWithSmugglers","GLOBAL",2)
SetGlobal("bsSmugglerQuest","GLOBAL",51)~ SOLVED_JOURNAL @100116 EXIT
END

/* Holger attacks */
IF ~~ THEN smuggler_32_2
SAY @233 /* And that is absolutely inacceptible behavior - which needs to be punished. */
IF ~~ THEN DO ~ActionOverride("bssmgl02",DestroyItem("MINHP1")) SetGlobal("bsSmugglerAttacked","GLOBAL",4) SetGlobal("bsWorkingWithSmugglers","GLOBAL",2)
SetGlobal("bsSmugglerQuest","GLOBAL",48)
ActionOverride("bssmgl02",DestroyItem("MINHP1"))
ActionOverride("bssmgl02",Enemy())~ EXIT
IF ~Global("bsDeliverFigs","GLOBAL",1)
GlobalGT("bs_ReportSmugglersToFF","GLOBAL",5)~ THEN DO ~SetGlobal("bsSmugglerAttacked","GLOBAL",4) SetGlobal("bsWorkingWithSmugglers","GLOBAL",2)
SetGlobal("bsSmugglerQuest","GLOBAL",48)
ActionOverride("bssmgl02",DestroyItem("MINHP1"))
ActionOverride("bssmgl02",Enemy())~ EXIT
IF ~Global("bsSmugglerQuest","GLOBAL",26)~ THEN DO ~SetGlobal("bsSmugglerAttacked","GLOBAL",4) SetGlobal("bsWorkingWithSmugglers","GLOBAL",2)
SetGlobal("bsSmugglerQuest","GLOBAL",48)
ActionOverride("bssmgl02",DestroyItem("MINHP1"))
ActionOverride("bssmgl02",Enemy())~ EXIT
END


IF ~~ THEN smuggler_33
SAY @234 /* Why yes, <CHARNAME>, figs are perfect for a recruit. They are quite sensitive, need to be delivered fast - and they are totally lawful. Take the mysterious, sealed package to the Flaming Fist, and the only person getting in trouble with them is you! */
+ ~GlobalLT("bsPCMetSmugglerDoppelgangers","GLOBAL",4)~ + @230 /* So, what's my next task? */ + smuggler_35
+ ~Global("bsPCMetSmugglerDoppelgangers","GLOBAL",4)~ + @230 /* So, what's my next task? */ + smuggler_39_1
++ @231 /* We are done here, I won't continue working for you. */ + smuggler_34
END

/* no EraseJournalEntry() here, they are all in the override script (bssmgl02.baf) */
IF ~~ THEN smuggler_34
SAY @235 /* Hm. Oh well, then it is time to say farewell, <CHARNAME>. */
IF ~~ THEN DO ~AddJournalEntry(@837,QUEST_DONE)
		SetGlobal("bsSmugglerQuest","GLOBAL",50)
		SetGlobal("bsWorkingWithSmugglers","GLOBAL",3)~ EXIT
/* PC has sealed box */
IF ~PartyHasItem("bssmq002")~ THEN DO ~ActionOverride("bssmgl02",TakePartyItem("bssmq002"))
		ActionOverride("bssmgl02",DestroyItem("bssmq002"))
		EraseJournalEntry(@832)
EraseJournalEntry(@833)
AddJournalEntry(@837,QUEST_DONE)
		SetGlobal("bsSmugglerQuest","GLOBAL",50)
		SetGlobal("bsWorkingWithSmugglers","GLOBAL",3)~ EXIT
/* third quest canceled - take crate */
IF ~PartyHasItem("bssmq004") OR(2)
	Global("bsSmugglerQuest","GLOBAL",5)
	Global("bsSmugglerQuest","GLOBAL",6)~ THEN DO ~ActionOverride("bssmgl02",TakePartyItem("bssmq004"))
		ActionOverride("bssmgl02",DestroyItem("bssmq004"))
		AddJournalEntry(@837,QUEST_DONE)
		SetGlobal("bsSmugglerQuest","GLOBAL",50)
		SetGlobal("bsWorkingWithSmugglers","GLOBAL",3)~ EXIT
/* third quest successful: reward */
IF ~OR(3)
	Global("bsSmugglerQuest","GLOBAL",9)
	Global("bsSmugglerQuest","GLOBAL",10)
	Global("bsSmugglerQuest","GLOBAL",11)~ THEN DO ~ActionOverride("bssmgl02",TakePartyItem("bssmq004"))
		ActionOverride("bssmgl02",DestroyItem("bssmq004"))
		GiveGoldForce(1500)
		AddexperienceParty(500)
		AddJournalEntry(@837,QUEST_DONE)
		SetGlobal("bsSmugglerQuest","GLOBAL",50)
		SetGlobal("bsWorkingWithSmugglers","GLOBAL",3)~ EXIT
/* 4th quest successful: reward */
IF ~OR(2)
	Global("bsSmugglerQuest","GLOBAL",16)
	Global("bsSmugglerQuest","GLOBAL",17)~ THEN DO ~ActionOverride("bssmgl02",TakePartyItem("bssmq005"))
		ActionOverride("bssmgl02",DestroyItem("bssmq005"))
		GiveGoldForce(800)
		AddexperienceParty(1000)
		AddJournalEntry(@837,QUEST_DONE)
		SetGlobal("bsSmugglerQuest","GLOBAL",50)
		SetGlobal("bsWorkingWithSmugglers","GLOBAL",3)~ EXIT
END

END //APPEND

CHAIN
IF ~~ THEN bssmgl02 smuggler_35
@236 /* Hm, let me see. */
== bssmgl02 IF ~Global("bsSmugglerQuest","GLOBAL",1)~ THEN @237 /* There is still the question of what happened to the tower cell. Let's stick to that for now, as it is really important. */
END
IF ~~ THEN + smuggler_37
IF ~!Dead("bssmgl06") GlobalGT("bsPCMetSmugglerDoppelgangers","GLOBAL",1)
GlobalLT("bsPCMetSmugglerDoppelgangers","GLOBAL",4)~ THEN + smuggler_36


CHAIN
IF ~Global("bsSmugglerQuest","GLOBAL",1)
!Dead("bssmgl06") GlobalGT("bsPCMetSmugglerDoppelgangers","GLOBAL",1)
GlobalLT("bsPCMetSmugglerDoppelgangers","GLOBAL",4)~ THEN bssmgl02 smuggler_36
@238 /* I have to say. What did I hear - the tower cell taken over by doppelgangers! Juan was all high praise about your rescuing mission. */
== bssmgl02 IF ~Global("bsPCMetSmugglerDoppelgangers","GLOBAL",2)~ THEN @239 /* Sort of, since you tried to kill him nontheless. Tsk, tsk, <CHARNAME>, you should know better than to threaten a fellow smuggler. Or you are smarter than you look and strive for a position at the top, hm? */
END
IF ~~ THEN DO ~SetGlobal("bsPCMetSmugglerDoppelgangers","GLOBAL",4)~ + smuggler_40
IF ~GlobalGT("bsDeliverFigs","GLOBAL",1)~ THEN DO ~SetGlobal("bsPCMetSmugglerDoppelgangers","GLOBAL",4)~ + smuggler_39

APPEND bssmgl02
/* reaction: slavers are gone. */
/* PC worked for slavers */
IF ~OR(4)
	Global("bsSlaverQuest","GLOBAL",5)
	Global("bsSlaverQuest","GLOBAL",11)
	Global("bsSlaverQuest","GLOBAL",6)
	Global("bsSlaverQuest","GLOBAL",12)
Global("bs_SmugglerSlaverConfrontation","GLOBAL",0)
Global("bsNoticedDeadSlavers","MYAREA",0)~ THEN slavers_gone
SAY @240 /* My contact from the slavers has stopped coming, <CHARNAME>. Did something happen? */
++ @241 /* You can say that again, Holger. The slavers wanted to come back at you because they blame you for the fact that the smuggler's tunnel is no longer available. They didn't get very far after they told me that, though. */ + slavers_gone_01
++ @242 /* Take a guess. */ + slavers_gone_03
END

/* PC was sent to slaver confrontation by Holger */
IF ~Global("bs_SmugglerSlaverConfrontation","GLOBAL",4)~ THEN smugglerquest_slaverconfrontation
SAY @243 /* You return. This is a good sign. You survived, at least. How did it go? */
++ @244 /* You were right - they tried to enslave me the moment I walked in. */ DO ~EraseJournalEntry(@828)
SetGlobal("bs_SmugglerSlaverConfrontation","GLOBAL",5)~ + slavers_gone_01
++ @245 /* They wanted to deliver a message. Unfortunately there is noone left to do so. */ DO ~EraseJournalEntry(@828)
SetGlobal("bs_SmugglerSlaverConfrontation","GLOBAL",5)~ + slavers_gone_01
++ @246 /* As expected. */ DO ~EraseJournalEntry(@828)
SetGlobal("bs_SmugglerSlaverConfrontation","GLOBAL",5)~ + slavers_gone_02
END

/* PC attacked slave traders - after Holger's request */
IF ~Dead("bsslav01")
OR(5)
	Global("bsSlaverQuest","GLOBAL",5)
	Global("bsSlaverQuest","GLOBAL",11)
	Global("bsSlaverQuest","GLOBAL",6)
	Global("bsSlaverQuest","GLOBAL",12)
	GlobalGT("bs_SmugglerSlaverConfrontation","GLOBAL",3)
Global("bsNoticedDeadLeonhard","LOCALS",0)~ THEN smugglerquest_killed_leonhard
SAY @247 /* Ah, I heard you also killed Leonhard. Well, I guess I can't blame you after the slavers broke our contract. */
IF ~~ THEN DO ~SetGlobal("bsNoticedDeadLeonhard","LOCALS",1)~ EXIT
END

IF ~~ THEN slavers_gone_01
SAY @248 /* Ah, they wanted to send a "greeting", did they? No one has arrived here, so you've done a great job. I suppose I owe you a debt of gratitude, <CHARNAME>. */
IF ~~ THEN + slavers_gone_02
END

IF ~~ THEN slavers_gone_02
SAY @249 /* I thank you and must admit that I am grateful that you stood between me and the angry slavers, because I would not have survived their attack. Oh well. */
IF ~~ THEN + slavers_gone_04
END

IF ~~ THEN slavers_gone_03
SAY @250 /* They... they attacked you? While you were working for them? - Please tell me this didn't have anything to do with me. */
++ @251 /* Yeah, well. The slavers wanted to come back at you because they blame you for the fact that the smuggler's tunnel is no longer available. They didn't get very far after they told me that, though. */ + slavers_gone_01
++ @252 /* "It didn't have anything to do with you." Satisfied? */ + slavers_gone_05
END

IF ~~ THEN slavers_gone_04
SAY @253 /* With the slaver trade routes gone to us, by now at the latest, everything here would have blown up in my face. I am glad that we are already dealing with repositioning ourselves. And I *have* to reposition myself, <CHARNAME>. I had really imagined our collaboration to be different. */
++ @254 /* Does that mean you have nothing more for me to do? */ + slavers_gone_06
++ @255 /* I fear you'll do that without me, Holger. I need to end our collaboration. */ + smuggler_34
END

IF ~~ THEN slavers_gone_05
SAY @256 /* Heh! I like your humor. So it *was* addressed at me? */
IF ~~ THEN + slavers_gone_01
END

IF ~~ THEN slavers_gone_06
SAY @257 /* Not as much as I was hoping - but I'm actually very happy to have you battle-hardened recruits. We're not going to let something like that spoil our mood, are we? */
IF ~~ THEN DO ~SetGlobal("bsNoticedDeadSlavers","MYAREA",1)~ EXIT
END

/* PC does not work with slavers: Holger was summoned */
IF ~Global("bs_SmugglerSlaverConfrontation","GLOBAL",2)~ THEN slaver_summon
SAY @258 /* The slavers have requested a meeting, <CHARNAME>. I'll be honest - I'm not expecting anything good. It's unusual that they want to see me like this. I'd like to send you - because I'm not going there. It would be my death sentence, I already know that, and my rogues aren't strong enough to take them on. */
++ @259 /* Alright, I'll do it. */ + slaver_summon_05
++ @260 /* Why would the slavers want to kill you? */ DO ~SetGlobal("bs_slaver_summon_01","LOCALS",1)~ + slaver_summon_01
++ @261 /* But you want me to let myself be slaughtered? */ DO ~SetGlobal("bs_slaver_summon_02","LOCALS",1)~ + slaver_summon_02
++ @262 /* You should face them like a man, Holger! Don't be such a coward. */ DO ~SetGlobal("bs_slaver_summon_04","LOCALS",1)~ + slaver_summon_04
++ @263 /* Hmm. I like you, but I'm not doing this for you, Holger. */ DO ~SetGlobal("bs_slaver_summon_03","LOCALS",1)~ + slaver_summon_03
++ @264 /* Nah, I wanted to end our collaboration, anyway. */ + smuggler_34
END

IF ~~ THEN slaver_summon_01
SAY @265 /* Oh, I can definitely read a room, <CHARNAME>. The smuggling tunnels to Baldur's Gate are lost, and that's hitting the slavers hard too. I wouldn't say I'm responsible, but I'm sure they'd have no problem blaming me, if only to save their own hides from their bosses. */
++ @259 /* Alright, I'll do it. */ + slaver_summon_05
+ ~Global("bs_slaver_summon_02","LOCALS",0)~ + @261 /* But you want me to let myself be slaughtered? */ DO ~SetGlobal("bs_slaver_summon_02","LOCALS",1)~ + slaver_summon_02
+ ~Global("bs_slaver_summon_04","LOCALS",0)~ + @262 /* You should face them like a man, Holger! Don't be such a coward. */ DO ~SetGlobal("bs_slaver_summon_04","LOCALS",1)~ + slaver_summon_04
+ ~Global("bs_slaver_summon_03","LOCALS",0)~ + @263 /* Hmm. I like you, but I'm not doing this for you, Holger. */ DO ~SetGlobal("bs_slaver_summon_03","LOCALS",1)~ + slaver_summon_03
++ @264 /* Nah, I wanted to end our collaboration, anyway. */ + smuggler_34
END

IF ~~ THEN slaver_summon_02
SAY @266 /* But quite the opposite. I want to send you there because I am convinced that *you* would come out of such a confrontation alive! */
++ @259 /* Alright, I'll do it. */ + slaver_summon_05
+ ~Global("bs_slaver_summon_01","LOCALS",0)~ + @260 /* Why would the slavers want to kill you? */ DO ~SetGlobal("bs_slaver_summon_01","LOCALS",1)~ + slaver_summon_01
+ ~Global("bs_slaver_summon_04","LOCALS",0)~ + @262 /* You should face them like a man, Holger! Don't be such a coward. */ DO ~SetGlobal("bs_slaver_summon_04","LOCALS",1)~ + slaver_summon_04
+ ~Global("bs_slaver_summon_03","LOCALS",0)~ + @263 /* Hmm. I like you, but I'm not doing this for you, Holger. */ DO ~SetGlobal("bs_slaver_summon_03","LOCALS",1)~ + slaver_summon_03
++ @264 /* Nah, I wanted to end our collaboration, anyway. */ + smuggler_34
END

IF ~~ THEN slaver_summon_03
SAY @267 /* I can't blame you. I'm going to disappear now - this means our collaboration is over, unfortunately. What a pity! I still have a lot to do, but this is getting too dicey for me. (sigh) So the smugglers' cell is now signing off completely - I never thought I'd let my customers down like this. */
++ @268 /* Alright, alright, enough of the theatrics - I'll confront your slavers for you. */ + slaver_summon_05
++ @269 /* Farewell, Holger. */ + smuggler_34
+ ~Global("bs_slaver_summon_01","LOCALS",0)~ + @260 /* Why would the slavers want to kill you? */ DO ~SetGlobal("bs_slaver_summon_01","LOCALS",1)~ + slaver_summon_01
+ ~Global("bs_slaver_summon_02","LOCALS",0)~ + @261 /* But you want me to let myself be slaughtered? */ DO ~SetGlobal("bs_slaver_summon_02","LOCALS",1)~ + slaver_summon_02
+ ~Global("bs_slaver_summon_04","LOCALS",0)~ + @262 /* You should face them like a man, Holger! Don't be such a coward. */ DO ~SetGlobal("bs_slaver_summon_04","LOCALS",1)~ + slaver_summon_04
END

IF ~~ THEN slaver_summon_04
SAY @270 /* If I'd face them like a man, I'd be killed like a dog, <CHARNAME>. */
++ @259 /* Alright, I'll do it. */ + slaver_summon_05
+ ~Global("bs_slaver_summon_01","LOCALS",0)~ + @260 /* Why would the slavers want to kill you? */ DO ~SetGlobal("bs_slaver_summon_01","LOCALS",1)~ + slaver_summon_01
+ ~Global("bs_slaver_summon_02","LOCALS",0)~ + @261 /* But you want me to let myself be slaughtered? */ DO ~SetGlobal("bs_slaver_summon_02","LOCALS",1)~ + slaver_summon_02
+ ~Global("bs_slaver_summon_03","LOCALS",0)~ + @263 /* Hmm. I like you, but I'm not doing this for you, Holger. */ DO ~SetGlobal("bs_slaver_summon_03","LOCALS",1)~ + slaver_summon_03
++ @264 /* Nah, I wanted to end our collaboration, anyway. */ + smuggler_34
END

IF ~~ THEN slaver_summon_05
SAY @271 /* Luck really smiled upon me when she send you my way. Meet them at the western shore of the Chionthar, south of Wyrm's Crossing when night has fallen. Go there prepared, this *will* be a hostile confrontation. And - don't let yourself be killed, <CHARNAME>. */
IF ~~ THEN DO ~SetGlobal("bsConfrontSlaveTraders","GLOBAL",7)
SetGlobal("bs_SmugglerSlaverConfrontation","GLOBAL",3)~ UNSOLVED_JOURNAL @829 EXIT
END

/* 5th quest done */

/* smuggler was raided by soldiers */
IF ~Global("bsSmugglerQuest","GLOBAL",26)~ THEN fifth_quest_busted
SAY @272 /* You tipped off the Flaming Fist? *And* show your face again here. Did you think we wouldn't know? */
IF ~~ THEN + smuggler_32_2
END

/* barrel was delivered successful */
IF ~Global("bsSmugglerQuest","GLOBAL",27)~ THEN fifth_quest_done
SAY @273 /* There you are. The second payment for the delivery already arrived. Well done, <CHARNAME>. This was a very lucrative job and largely filled the hole that the tower cell fiasco had torn in our finances. */
IF ~~ THEN DO ~GiveGoldForce(1500)~ + fifth_quest_done_01
END

IF ~~ THEN fifth_quest_done_01
SAY @274 /* I could use your expertise with one more thing, if you are ready. */
IF ~~ THEN DO ~AddexperienceParty(1000)
EraseJournalEntry(@100150)
SetGlobal("bsSmugglerQuest","GLOBAL",28)~ EXIT
END

/* barrel was opened */
IF ~Global("bsSmugglerQuest","GLOBAL",25)~ THEN fifth_quest_failed
SAY @275 /* There you are. The second payment for the delivery did not arrive. Instead, I was told you never showed with the promised delivery? You remember what I told you about trust - you trusting me, I trusting you etcetera? */
+ ~GlobalGT("bs_SmugglerSlaverConfrontation","GLOBAL",0)
Global("bsSMQOpenedBox","GLOBAL",5)~ + @276 /* Holger, I denied working with the slavers for a reason. You can't let me carry a person without a warning! */ + fifth_quest_failed_01
+ ~Global("bs_SmugglerSlaverConfrontation","GLOBAL",0)
Global("bsSMQOpenedBox","GLOBAL",5)~ + @277 /* Holger, you can't let me carry a person without a warning! */ + fifth_quest_failed_01
+ ~GlobalGT("bs_SmugglerDeniedCounter","MYAREA",-1)
Global("bsSMQOpenedBox","GLOBAL",5)~ + @278 /* I noticed a person inside a barrel who didn't respond to any tries of communications - I was trying to *secure* the ware, Holger! Can't you see? */ + fifth_quest_failed_03
+ ~GlobalLT("bs_SmugglerDeniedCounter","MYAREA",0)
Global("bsSMQOpenedBox","GLOBAL",5)~ + @278 /* I noticed a person inside a barrel who didn't respond to any tries of communications - I was trying to *secure* the ware, Holger! Can't you see? */ + fifth_quest_failed_02
IF ~GlobalLT("bsSMQOpenedBox","GLOBAL",5)~ THEN + fifth_quest_failed_02
END

IF ~~ THEN fifth_quest_failed_01
SAY @279 /* Yes, <CHARNAME>, I can, because *I* am not a slaver! */
IF ~Global("bs_SmugglerSlaverConfrontation","GLOBAL",0)~ THEN + fifth_quest_failed_02
IF ~GlobalGT("bs_SmugglerSlaverConfrontation","GLOBAL",0)~ THEN + fifth_quest_failed_03
END

IF ~~ THEN fifth_quest_failed_02
SAY @280 /* I don't care what your reasons for blowing this was. I lost trust in you, as sad as it is. */
IF ~~ THEN + smuggler_32_1
END

IF ~~ THEN fifth_quest_failed_03
SAY @281 /* <CHARNAME>, do you have any idea how much gold you've squandered? I had to spend the commission I got to compensate the contact, so I have no profit at all! That means I have just as much gold as before... (sighs) So, I guess it doesn't matter. Fine. I see your point. You were consistent in your actions until now, so I should probably take some of the blame. */
IF ~~ THEN + fifth_quest_done_01
END


/* 4th quest done */

/* Global("bsSmugglerQuest","GLOBAL",16): PC took vial from table (via info point script).
Global("bsSmugglerQuest","GLOBAL",17): PC received vial from Seatower Captain in dialogue (needs CHR 18 and "Official Amnian Collaboration Pass"(bssmq006)).
Global("bsSmugglerQuest","GLOBAL",18): PC did not succeed to convince Captain in dialogue – quest failed, no vial.
Global("bsSmugglerQuest","GLOBAL",19): PC set off Captain in dialogue – quest failed, no vial. Rep -1.
"bssmq005" */
/* quest failed */
IF ~OR(2)
	Global("bsSmugglerQuest","GLOBAL",18)
	Global("bsSmugglerQuest","GLOBAL",19)~ THEN fourth_quest_done_disappointment
SAY @282 /* You are back - but I see no vial of Calimshan Fragrance. I did get reports about the Seatower Guard being more on alert with regard to smuggler activities as they already were, though. */
++ @283 /* Yes, I'm sorry, Holger. I messed up. */ + fourth_quest_done_disappointment_01
++ @284 /* So you already know. */ + fourth_quest_done_disappointment_01
++ @285 /* Well, these things can happen, no? */ + fourth_quest_done_disappointment_01
END

IF ~~ THEN fourth_quest_done_disappointment_01
SAY @286 /* I sent you there because I thought it's a cake walk for you, <CHARNAME> - and then you go and make the Seatower Guard *aware* of the vial? */
= @287 /* Well, retrieving it now would be a real challenge. One vial is not worth *this* amount of hassle. I'll just put it aside - as well as your failure. I guess it was wishful thinking on my part to leave this to you. I should have known better - and I mean that in all seriousness. I should have known better what kind of tasks to entrust you with - I apologize. */
IF ~~ THEN DO ~EraseJournalEntry(@100106)
EraseJournalEntry(@100132)
SetGlobal("bsSmugglerQuest","GLOBAL",20)~ EXIT
END

/* quest successful */

IF ~PartyHasItem("bssmq005")
OR(2)
	Global("bsSmugglerQuest","GLOBAL",16)
	Global("bsSmugglerQuest","GLOBAL",17)~ THEN fourth_quest_done
SAY @288 /* You are back - and I see a vial of Calimshan Fragrance. You were successful! */
/* Holger gets busted */
IF ~Global("bs_ReportSmugglersNashkel","GLOBAL",8)~ THEN + busted
IF ~!Global("bs_ReportSmugglersNashkel","GLOBAL",8)~ THEN + fourth_quest_done_01
END

END //APPEND

CHAIN
IF ~~ THEN bssmgl02 fourth_quest_done_01
@289 /* Let me take this off your hands and give you your pay. Ah - it's full and as good as new! My assumption regarding the actual *usage* of these kind of presents was correct then. You might not know what these kind of fragrances are worth - this is a task well done, <CHARNAME>. */
== bssmgl02 IF ~Global("bsSmugglerQuest","GLOBAL",17)~ THEN @290 /* I am not entirely *sure* what you did, but I was told the Seatower Guard seems to be on even higher alert with regard to smugglers than they already were. Well, I guess the tunnels are off limits even more in the next future. */
END
IF ~~ THEN DO ~ActionOverride("bssmgl02",TakePartyItem("bssmq005"))
ActionOverride("bssmgl02",DestroyItem("bssmq005"))
GiveGoldForce(800)
AddexperienceParty(1000)
EraseJournalEntry(@100105)
EraseJournalEntry(@100107)
EraseJournalEntry(@100132)
SetGlobal("bsSmugglerQuest","GLOBAL",20)~ EXIT


APPEND bssmgl02


/* 3rd quest done */
/* Global("bsSmugglerQuest","GLOBAL",8): PC attacked the soldiers
Global("bsSmugglerQuest","GLOBAL",9): PC bribed the soldiers (doesn't know crates are empty)
Global("bsSmugglerQuest","GLOBAL",10): Soldiers were pacified using the official guard cooperation pass OR PC announced delivery beforehand (working with Nashkel guard) – PC does not know content of crate.
OR(2)
	GlobalGT("bsSMQOpenedBox","GLOBAL",1)
	Global("bsSmugglerQuest","GLOBAL",11): PC knows crates are empty */
IF ~Global("bsSmugglerQuest","GLOBAL",8)~ THEN third_quest_done_failed
SAY @291 /* You are back - and from the noises I take it that the Night Masks are defeated. I thank you for this, I truly do and will give you your reward. But, <CHARNAME> - you attacked the soldiers? When I said you shouldn't let soldiers grab you with my goods, I meant run away or something like that! But not killing! Do you know what kind of repercussions this will have? Did you think dead soldiers so close to our base was a clever idea? I hate to break it to you that it wasn't - not at all. */
IF ~~ THEN + smuggler_32_1
END

IF ~PartyHasItem("bssmq004")
OR(3)
	Global("bsSmugglerQuest","GLOBAL",9)
	Global("bsSmugglerQuest","GLOBAL",10)
	Global("bsSmugglerQuest","GLOBAL",11)~ THEN third_quest_done
SAY @292 /* You are back - and from the noises I take it that the Night Masks are defeated. Well done, <CHARNAME>! Very well done. Here is your reward, and let me take back the crate. */
IF ~~ THEN + third_quest_done_00
/* PC is working with Nashkel Guard */
IF ~Global("bs_ReportSmugglersNashkel","GLOBAL",5)
!Dead("bssmgl12") !Dead("bssmgl13")~ THEN + busted
END


END //APPEND

CHAIN
IF ~~ THEN bssmgl02 third_quest_done_00
@293 /* I'll give it to Edgar - *now* we can put in the Black Lotus and deliver it for real. */
== bssmgl02 IF ~GlobalLT("bsSMQOpenedBox","GLOBAL",3)
OR(2)
	GlobalGT("bsSMQOpenedBox","GLOBAL",1)
	Global("bsSmugglerQuest","GLOBAL",11)~ THEN @294 /* Oh, I see you opened it. */
END
+ ~Global("bsSmugglerQuest","GLOBAL",9)~ + @295 /* I bribed soldiers, Holger. Do I get compensated? */ + third_quest_done_09
COPY_TRANS_LATE bssmgl02 third_quest_done_09

APPEND bssmgl02

IF ~~ THEN third_quest_done_01
SAY @296 /* Yes, it was, <CHARNAME>. */
++ @297 /* Why? */ + third_quest_done_03
+ ~Global("bs_third_quest_done_02","LOCALS",0)
GlobalLT("bsSMQOpenedBox","GLOBAL",3)~ + @298 /* Are you kidding me, Holger? First you make me deliver highly secret figs, then I risk my life for empty boxes? */ DO ~SetGlobal("bs_third_quest_done_02","LOCALS",1)~ + third_quest_done_02
++ @299 /* Lure the Night Masks out without actually threaten any wares. Smart! */ + third_quest_done_06
+ ~Global("bs_inside_boxes","LOCALS",0)~ + @300 /* It doesn't work this way, Holger. You'll have to tell me what's inside the boxes you have me deliver! */ DO ~SetGlobal("bs_inside_boxes","LOCALS",1)~ + inside_boxes
END

IF ~~ THEN third_quest_done_02
SAY @301 /* Take a step back and look at the full picture. */
IF ~~ THEN + third_quest_done_03
END

IF ~~ THEN third_quest_done_03
SAY @302 /* I told you that the Night Masks *would* attack. It was a trap, <CHARNAME>, a trap for our enemies - and because of you, it not only snapped shut, but also crushed them really well. Don't say I lied to you - I said the Nightshades *wanted* to raid one of our shipments with Black Lotus. I never said I'd let them do that! */
= @303 /* You probably feel betrayed - I respect that assessment. But I did not betray your trust that I would assign you for important tasks, <CHARNAME>. It was clearly a combat mission when you accepted it. The empty crates were worth their volume in gold. Because through them, we taught the Night Masks a lesson. The threat from these vultures should be significantly weakened for some time. You've done a good job, <CHARNAME>, and well deserved your reward! */
++ @304 /* I understand why - lure the Night Masks out without actually threaten any wares. Smart! */ + third_quest_done_06
+ ~Global("bs_inside_boxes","LOCALS",0)~ + @300 /* It doesn't work this way, Holger. You'll have to tell me what's inside the boxes you have me deliver! */ DO ~SetGlobal("bs_inside_boxes","LOCALS",1)~ + inside_boxes
++ @305 /* No, I don't like being played like this. I fear our collaboration is over. */ + smuggler_34
END

IF ~~ THEN third_quest_done_04
SAY @306 /* I hope this cleared it up a little. */
++ @307 /* It cleared it up plenty. I understand now. */ + third_quest_done_07
++ @308 /* It did - but Holger, if I'll have to fight for empty boxes again I'll kill you. */ + third_quest_done_05
+ ~Global("bs_third_quest_done_02","LOCALS",0)~ + @298 /* Are you kidding me, Holger? First you make me deliver highly secret figs, then I risk my life for empty boxes? */ DO ~SetGlobal("bs_third_quest_done_02","LOCALS",1)~ + third_quest_done_02
++ @305 /* No, I don't like being played like this. I fear our collaboration is over. */ + smuggler_34
END

IF ~~ THEN third_quest_done_05
SAY @309 /* Wo-how! I surly hope you didn't mean that literally. But rest assured - I will not let you protect empty boxes again. You have my word. */
IF ~~ THEN + third_quest_done_07
END

IF ~~ THEN third_quest_done_06
SAY @310 /* That was exactly what this was about. */
IF ~~ THEN + third_quest_done_08
END

IF ~~ THEN third_quest_done_07
SAY @311 /* I'm glad we're on the same page. I wouldn't have liked a misunderstanding between us. */
++ @299 /* Lure the Night Masks out without actually threaten any wares. Smart! */ + third_quest_done_06
++ @312 /* I'm glad I could be of service. What now? */ + third_quest_done_08
END

IF ~~ THEN third_quest_done_08
SAY @313 /* Go celebrate this victory. See you soon, <CHARNAME> - whenever you are ready! */
IF ~~ THEN DO ~ActionOverride("bssmgl02",TakePartyItem("bssmq004"))
ActionOverride("bssmgl02",DestroyItem("bssmq004"))
GiveGoldForce(1500)
AddexperienceParty(500)
EraseJournalEntry(@824)
EraseJournalEntry(@825)
EraseJournalEntry(@100102)
EraseJournalEntry(@100110)
SetGlobal("bsSmugglerQuest","GLOBAL",12)~ EXIT
END

IF ~~ THEN third_quest_done_09
SAY @314 /* You managed to do that? This is brilliant! But it is, I'm afraid, 	occupational hazard - you need to *avoid* them next time. I do believe my pay is high enough to compensate your expenses. */
++ @315 /* The crate was empty? */ + third_quest_done_01
+ ~Global("bs_third_quest_done_02","LOCALS",0)
GlobalLT("bsSMQOpenedBox","GLOBAL",3)~ + @298 /* Are you kidding me, Holger? First you make me deliver highly secret figs, then I risk my life for empty boxes? */ DO ~SetGlobal("bs_third_quest_done_02","LOCALS",1)~ + third_quest_done_02
++ @312 /* I'm glad I could be of service. What now? */ + third_quest_done_08
++ @316 /* Just give me my pay. */ + third_quest_done_08
++ @317 /* I'm sorry, Holger, but I need to end our business relations. */ + smuggler_34
END

IF ~~ THEN inside_boxes
SAY @318 /* <CHARNAME>, in case it was not clear - you can rest assured that you won't transport anything that would really get you into trouble with the Flaming Fist. Do you seriously think I'm going to give you newbie the really hot stuff? Well, another organization might do that to spare their own people. But I'm a smuggler, <CHARNAME>! If I don't supply my customers, my reputation suffers. Of course I give the dicey stuff to my experienced rogues. I'm not a lightheaded man who wants to make quick gold and sell his people for it! */
= @319 /* You have to bear in mind that every failed delivery means a customer who doesn't receive their goods. Well, except for the empty box, of course. But that had a different purpose. */
IF ~OR(3)
	Global("bsSmugglerQuest","GLOBAL",9)
	Global("bsSmugglerQuest","GLOBAL",10)
	Global("bsSmugglerQuest","GLOBAL",11)~ THEN + third_quest_done_04
END

IF ~~ THEN empty_box_reproach
SAY @320 /* That's *bait*, <CHARNAME>! Do you seriously think I'd use the real thing when I can get to it without risk? - Go see if the night masks will bite. We'll discuss this later. */
IF ~~ THEN EXIT
END


/* PC is working with Nashkel Guard - Holger will be busted */
IF ~~ THEN busted
SAY @321 /* Now we can - wait, what is going on? */
IF ~~ THEN DO ~SetGlobal("bsSmugglerQuest","GLOBAL",49) ClearAllActions() StartCutSceneMode() StartCutScene("bscut017")~ EXIT
END

IF WEIGHT #-1
~Global("bsSmugglerQuest","GLOBAL",49)~ THEN busted_01
SAY @322 /* Oh, bugger. You called this in, <CHARNAME>, didn't you? */
/* Quest 3: Global("bs_ReportSmugglersNashkel","GLOBAL",5) */
IF ~Global("bs_ReportSmugglersNashkel","GLOBAL",5)~ THEN + busted_third_quest
/* Quest 4: give back vial of flagrance */
IF ~Global("bs_ReportSmugglersNashkel","GLOBAL",8)~ THEN EXTERN bssmgl14 busted_fourth_quest
END
END //APPEND

BEGIN bssmgl14

CHAIN
IF ~~ THEN bssmgl14 busted_fourth_quest
@323 /* We busted you, you scoundrel! We caught you red-handed with this flask of Calimshan Flagrance, illegally imported and sold without paying duties! You'll come with us now - and you better behave! */
== bssmgl02 @324 /* <CHARNAME>, <CHARNAME>... You played me skillfully. What a pity you were on the other side all this time. */
== bssmgl14 @325 /* <CHARNAME> - come to me later and collect your reward! */
END
IF ~~ THEN DO ~ActionOverride("bssmgl02",TakePartyItem("bssmq005"))
ActionOverride("bssmgl02",DestroyItem("bssmq005"))
EraseJournalEntry(@100106)
EraseJournalEntry(@100132)
ReputationInc(1)
SetGlobal("bsSmugglerQuest","GLOBAL",51)
SetGlobal("bs_ReportSmugglersNashkel","GLOBAL",50)
AddJournalEntry(@100120,QUEST_DONE)
EraseJournalEntry(@100112)
EraseJournalEntry(@100118)
SetGlobal("bsWorkingWithSmugglers","GLOBAL",2)~ SOLVED_JOURNAL @100119 EXIT

CHAIN
IF ~~ THEN bssmgl02 busted_third_quest
@326 /* (sigh) Hello, officers. How may I help you? */
== bssmgl14 @327 /* We busted you, you scoundrel! We caught you red-handed with this box filled with - uh... nothing? The box is empty! */
== bssmgl02 @328 /* It is, indeed! This wonderful <PRO_MANWOMAN> has volunteered, so I thought it would be a good thing to help *the honorable Nashkel Guard* rid the area of some criminals! This is all that happened here, dear officer. - Is there a reward for actions like these, if I may ask? */
== bssmgl14 @329 /* This... this - this will not do! There is nothing here - *nothing*! <CHARNAME>, this was a failure - your intel was worth nothing! We will be leaving now. I'll lead the whole investigation myself from now on! */
== bssmgl02 @330 /* Well, <CHARNAME>, I guess it'll be no surprise that I'll be leaving now, too. */
END
IF ~~ THEN + smuggler_32_1

APPEND bssmgl02



/* spare out chapter 7 turbulences for quests in BG */

IF ~Global("Chapter","GLOBAL",%tutu_chapter_7%)
    Global("DukeThanks","GLOBAL",0)
    Global("ENDOFBG1","GLOBAL",0)
OR(2)
	Global("bsSmugglerQuest","GLOBAL",12)
	Global("bsSmugglerQuest","GLOBAL",20)~ THEN break
SAY @331 /* <CHARNAME> - I am not sure what happened, but as long as your likeness hangs at every second corner in Baldur's Gate, I guess it is best to pause our cooperation until things quieted down. Not because I would distance myself from you, but because being chased by the Flaming Fist and smuggling do not go well together. */
IF ~~ THEN EXIT
END

////////////////////////////////////////////////
/* general greeting between smuggler quests */
////////////////////////////////////////////////

IF ~OR(5)
Global("bsSmugglerQuest","GLOBAL",2)
Global("bsSmugglerQuest","GLOBAL",12)
Global("bsSmugglerQuest","GLOBAL",20)
Global("bsSmugglerQuest","GLOBAL",28)
Global("bsSmugglerQuest","GLOBAL",29)~ THEN quest_acquisition
SAY @332 /* Well then, ready for some more action? */
+ ~Global("bsReferToBSTSmugglers","GLOBAL",1)~ + @333 /* Thanks for the smuggler's greeting, Holger. It was nice to see a friendly face in those turbulent times. */ DO ~SetGlobal("bsReferToBSTSmugglers","GLOBAL",2)~ + smuggler_greeting
/* reactions to person in barrel */
// PC works for slavers
+ ~Global("bsSMQOpenedBox","GLOBAL",4)
GlobalGT("bsSmugglerQuest","GLOBAL",27)
GlobalGT("bsSlaverQuest","GLOBAL",3)
GlobalLT("bsSlaverQuest","GLOBAL",12)
Global("bs_smuggled_person","MYAREA",0)~ + @334 /* I didn't think you had it in you to be involved in actual person trafficking, Holger! I see why it comes easy to you to make dealings with the slave traders. */ DO ~SetGlobal("bs_smuggled_person","MYAREA",1)~ + smuggled_person
+ ~Global("bsSMQOpenedBox","GLOBAL",4)
GlobalGT("bsSmugglerQuest","GLOBAL",27)
GlobalGT("bsSlaverQuest","GLOBAL",3)
GlobalLT("bsSlaverQuest","GLOBAL",12)
Global("bs_smuggled_person","MYAREA",0)~ + @335 /* You know I am not aversed to the thought of slave trading, but I do admit I was surprised when I realized that there was a person inside the barrel. */ DO ~SetGlobal("bs_smuggled_person","MYAREA",1)~ + smuggled_person
// PC does not work for slavers
+ ~Global("bsSMQOpenedBox","GLOBAL",4)
GlobalGT("bsSmugglerQuest","GLOBAL",27)
OR(2)
	GlobalLT("bsSlaverQuest","GLOBAL",4)
	GlobalGT("bsSlaverQuest","GLOBAL",11)
Global("bs_smuggled_person","MYAREA",0)~ + @336 /* Holger, I refused to cooperate with the slavers for a reason. Do you have any idea how much you have tested my loyalty by letting me smuggle a person unprepared? */ DO ~SetGlobal("bs_smuggled_person","MYAREA",1)~ + smuggled_person_01
+ ~Global("bsSMQOpenedBox","GLOBAL",4)
GlobalGT("bsSmugglerQuest","GLOBAL",27)
OR(2)
	GlobalLT("bsSlaverQuest","GLOBAL",4)
	GlobalGT("bsSlaverQuest","GLOBAL",11)
Global("bs_smuggled_person","MYAREA",0)~ + @337 /* I was very surprised when I noticed a person inside the barrel, Holger. Are you expanding your trade? */ DO ~SetGlobal("bs_smuggled_person","MYAREA",1)~ + smuggled_person
/* question to contact */
+ ~GlobalGT("bsSmugglerQuest","GLOBAL",20)
OR(2)
	GlobalGT("bs_SmugglerSlaverConfrontation","GLOBAL",4)
	GlobalGT("bsNoticedDeadSlavers","MYAREA",0)
Global("bs_ship_contacts","MYAREA",0)~ + @338 /* That transport contact for the heavy barrel - it seems you did not lose all your routes via ship together with the slavers? */ DO ~SetGlobal("bs_ship_contacts","MYAREA",1)~ + ship_contacts
/* PC is ready for next assignment */
+ ~Global("bsSmugglerQuest","GLOBAL",2)~ + @339 /* Yes. What do you need me to do? */ + boxes_nightmasks
+ ~Global("bsSmugglerQuest","GLOBAL",12)~ + @339 /* Yes. What do you need me to do? */ + get_wares_bs_barracks
+ ~Global("bsSmugglerQuest","GLOBAL",20)~ + @339 /* Yes. What do you need me to do? */ + carry_box_smugglertunnel
+ ~Global("bsSmugglerQuest","GLOBAL",28)~ + @339 /* Yes. What do you need me to do? */ + guard_meeting
+ ~Global("bsSmugglerQuest","GLOBAL",29)~ + @340 /* Yes. I'm ready to guard your meeting. */ + guard_meeting_01
++ @341 /* Maybe later. */ + more_quests_01
++ @317 /* I'm sorry, Holger, but I need to end our business relations. */ + smuggler_34
END



////////////////////////////////////////////////
/* general greeting for active smuggler quests */
////////////////////////////////////////////////

IF ~GlobalGT("bsSmugglerQuest","GLOBAL",0)~ THEN smuggler_37
SAY @342 /* So, do you have any news for me? */
+ ~GlobalGT("bsPCMetSmugglerDoppelgangers","GLOBAL",0)
GlobalLT("bsPCMetSmugglerDoppelgangers","GLOBAL",4)~ + @343 /* The tower cell was taken over by doppelgangers, apparently. */ DO ~SetGlobal("bsPCMetSmugglerDoppelgangers","GLOBAL",4)~ + smuggler_38
+ ~Global("bsSMQOpenedBox","GLOBAL",2)
PartyHasItem("bssmq004")
OR(3)
	Global("bsSmugglerQuest","GLOBAL",5)
	Global("bsSmugglerQuest","GLOBAL",6)
	Global("bsSmugglerQuest","GLOBAL",7)~ + @344 /* The "Black Lotus" box is empty, Holger! */ DO ~SetGlobal("bsSMQOpenedBox","GLOBAL",3)~ + empty_box_reproach
+ ~Global("bsSMQOpenedBox","GLOBAL",2)
PartyHasItem("bssmq004")
OR(3)
	Global("bsSmugglerQuest","GLOBAL",5)
	Global("bsSmugglerQuest","GLOBAL",6)
	Global("bsSmugglerQuest","GLOBAL",7)~ + @345 /* Are you kidding me? First I deliver highly secret figs, and now you let me guard empty boxes with my life? */ DO ~SetGlobal("bsSMQOpenedBox","GLOBAL",3)~ + empty_box_reproach
+ ~GlobalGT("bsSmugglerQuest","GLOBAL",20)
OR(2)
	GlobalGT("bs_SmugglerSlaverConfrontation","GLOBAL",4)
	GlobalGT("bsNoticedDeadSlavers","MYAREA",0)
Global("bs_ship_contacts","MYAREA",0)~ + @338 /* That transport contact for the heavy barrel - it seems you did not lose all your routes via ship together with the slavers? */ DO ~SetGlobal("bs_ship_contacts","MYAREA",1)~ + ship_contacts
++ @346 /* I'm still on it. */ + smuggler_40
+ ~PartyHasItem("bssmq004") OR(2)
	Global("bsSmugglerQuest","GLOBAL",5)
	Global("bsSmugglerQuest","GLOBAL",6)~ + @347 /* I'm sorry, Holger, but I won't face the Night Masks, after all. Please take back the crate. */ + cancel_third_quest
+ ~!Global("bsSmugglerQuest","GLOBAL",5)
!Global("bsSmugglerQuest","GLOBAL",6)
!Global("bsSmugglerQuest","GLOBAL",7)~ + @317 /* I'm sorry, Holger, but I need to end our business relations. */ + smuggler_34
END

IF ~~ THEN smuggled_person
SAY @348 /* I am still a smuggler, nothing more. The customer paid to have his wares being delivered in secret - the "wares" being himself. It was all voluntarily and out of their free will. And, I might add, also not for covering up a crime. At least if you don't consider diplomatic turbulences to be illegal. */
IF ~~ THEN EXIT
END

IF ~~ THEN smuggled_person_01
SAY @349 /* I see your point. You were consistent in your actions until now, so I should probably have given you a hint. */
IF ~~ THEN + smuggled_person
END

IF ~~ THEN smuggler_greeting
SAY @350 /* Appreciated. Yes, I was worried about seeing your likeness for a bounty all over the place. But you found your way back into the city - and quite impressive, if I may say so! */
IF ~~ THEN EXIT
END

IF ~~ THEN cancel_third_quest
SAY @351 /* Wh... - <CHARNAME>, I kept my distance because I am no match for the Night Masks. You handing me this crate now means I'll disappear from here as fast as possible. */
++ @352 /* Yes, sorry. */ + smuggler_34
++ @353 /* Fine, I'll face them. */ + smuggler_40
END

IF ~~ THEN ship_contacts
SAY @354 /* Oh, no, not at all. The slavers were one of our contacts. I only cooperated because their offers were always so increadibly cost-efficient - and because they ran on some routes for which I had no other means, or at least not without taking considerable detours. */
IF ~~ THEN EXIT
END

IF ~~ THEN smuggler_38
SAY @355 /* Doppelgangers! */
IF ~~ THEN + smuggler_39
END

IF ~~ THEN smuggler_39
SAY @356 /* Well, no wonder they did no longer communicate with us. */
= @357 /* Hm, seems I did Shuck wrong, the poor man! I am grief-stricken - or not. */
IF ~~ THEN + smuggler_40
IF ~GlobalGT("bsDeliverFigs","GLOBAL",1) Global("bsPCMetSmugglerDoppelgangers","GLOBAL",4)~ THEN + smuggler_39_1
END

IF ~~ THEN smuggler_39_1
SAY @358 /* Well, you have proven useful, <CHARNAME>. Very much so. */
IF ~~ THEN DO ~EraseJournalEntry(@838) SetGlobal("bsSmugglerQuest","GLOBAL",2)~ + more_quests
END

END //APPEND

/* offer to work for slave traders */
CHAIN
IF ~OR(5)
		Global("bsSmugglerQuest","GLOBAL",2)
		Global("bsSmugglerQuest","GLOBAL",12)
		Global("bsSmugglerQuest","GLOBAL",20)
		Global("bsSmugglerQuest","GLOBAL",28)
		Global("bsSmugglerQuest","GLOBAL",29)
!Dead("bsslav01")
OR(2)
	GlobalGT("bsConfrontSlaveTraders","GLOBAL",0)
	GlobalGT("bsShucksBrother","GLOBAL",29)~ THEN bssmgl02 offer_slavetrader_work
@359 /* I like you and see that you know how to handle your weapons. Our ... partners are always in need of mercenaries to protect their tradings. */
== bssmgl02 @360 /* I am talking about the *helpful* folks with head in Amn who have enough gold to buy off the debts of our customers and enough ships to transport some of our goods. */
== bssmgl02 IF ~GlobalGT("bsConfrontSlaveTraders","GLOBAL",0)~ THEN @361 /* In other words: the slavers. You already met their contact for that friend's brother of yours. */
== bssmgl02 IF ~Global("bsConfrontSlaveTraders","GLOBAL",0)
GlobalGT("bsShucksBrother","GLOBAL",29)~ THEN @362 /* In other words: they are slavers. There is no need to talk around the truth if I want you to work for them. */
== bssmgl02 @363 /* We need to be in good terms with them, and they are often interested in backup against the Flaming Fist for their deliveries near Baldur's Gate. I will recommend you to them. It's easy earned gold - it's seldom that the Flaming Fist turns up at all, and the pay is usually quite good. I'd do it myself, but we will be busy with own stuff for a while. */
END
+ ~!Dead("bsslav01") GlobalGT("bsConfrontSlaveTraders","GLOBAL",0)~ + @364 /* Finally! I was waiting for your recommendation towards them. */ + smuggler_42
+ ~!Dead("bsslav01")~ + @365 /* Fine, I will listen to their offer. */ + smuggler_42
+ ~!Dead("bsslav01")~ + @366 /* Absolutely not. Working for you is alright, but I will not be getting involved with any shady organization. */ DO ~SetGlobal("bs_SmugglerSlaverConfrontation","GLOBAL",1)
SetGlobalTimer("bs_SmugglerSlaverConfrontTimer","GLOBAL",FOUR_DAYS)~ + smuggler_43
+ ~!Dead("bsslav01")~ + @367 /* Don't bother. I'm done working for you, as well. */ + smuggler_34

APPEND bssmgl02 

IF ~~ THEN smuggler_40
SAY @368 /* Don't let me wait too long for more news, <CHARNAME>. */
IF ~~ THEN EXIT
END

/* 3rd quest */
IF ~~ THEN boxes_nightmasks
SAY @369 /* I have a serious problem - as if losing men in Baldur's Gate wasn't enough, I also lost rogues between Baldur's Gate and Nashkel, too - someone is killing them, to an extend that I put a hold on certain deliveries. This is one of the reasons why the loss of the tower cell took so long to be noticed. */
++ @370 /* Don't tell me they're replaced by doppelgangers, too. */ + boxes_nightmasks_01
++ @371 /* Someone? Do you know who it is? */ + boxes_nightmasks_02
++ @317 /* I'm sorry, Holger, but I need to end our business relations. */ + smuggler_34
END

IF ~~ THEN boxes_nightmasks_01
SAY @372 /* I'd assume I wouldn't get to find their corpses then. */
IF ~~ THEN + boxes_nightmasks_02
END

IF ~~ THEN boxes_nightmasks_02
SAY @373 /* I know it is Night Masks and they are not afraid to make this clear. They seem to want to destroy my Black Lotus route. I need you to be my next smugglers on that route. I'll give you big, big boxes the Night Masks can't miss. This would be a fighting assignment, <CHARNAME>, because they *will* attack you. */
+ ~Global("bs_boxes_nightmasks_03","LOCALS",0)~ + @374 /* So I'd be bait? */ DO ~SetGlobal("bs_boxes_nightmasks_03","LOCALS",1)~ + boxes_nightmasks_03
++ @375 /* Hmm, Night Masks. Fine, I'll do it. */ + boxes_nightmasks_05
+ ~Global("bs_boxes_nightmasks_06","LOCALS",0)~ + @376 /* Night Masks - what are they? */ DO ~SetGlobal("bs_boxes_nightmasks_06","LOCALS",1)~ + boxes_nightmasks_06
+ ~Global("bs_boxes_nightmasks_04","LOCALS",0)~ + @377 /* What if I say no? */ DO ~SetGlobal("bs_boxes_nightmasks_04","LOCALS",1)~ + boxes_nightmasks_04
END

IF ~~ THEN boxes_nightmasks_03
SAY @378 /* The boxes will be bait. You will be the defense, and a capable one, I'd say. */
++ @375 /* Hmm, Night Masks. Fine, I'll do it. */ + boxes_nightmasks_05
+ ~Global("bs_boxes_nightmasks_06","LOCALS",0)~ + @376 /* Night Masks - what are they? */ DO ~SetGlobal("bs_boxes_nightmasks_06","LOCALS",1)~ + boxes_nightmasks_06
+ ~Global("bs_boxes_nightmasks_04","LOCALS",0)~ + @377 /* What if I say no? */ DO ~SetGlobal("bs_boxes_nightmasks_04","LOCALS",1)~ + boxes_nightmasks_04
END

IF ~~ THEN boxes_nightmasks_04
SAY @379 /* Then I will bury my Black Lotus smuggle to Baldur's Gate. I lost too many men already. */
+ ~Global("bs_boxes_nightmasks_06","LOCALS",0)~ + @376 /* Night Masks - what are they? */ DO ~SetGlobal("bs_boxes_nightmasks_06","LOCALS",1)~ + boxes_nightmasks_06
+ ~Global("bs_boxes_nightmasks_03","LOCALS",0)~ + @374 /* So I'd be bait? */ DO ~SetGlobal("bs_boxes_nightmasks_03","LOCALS",1)~ + boxes_nightmasks_03
++ @375 /* Hmm, Night Masks. Fine, I'll do it. */ + boxes_nightmasks_05
++ @380 /* I'm sorry, but I'll have to pass on that one. */ + boxes_nightmasks_07
END

IF ~~ THEN boxes_nightmasks_05
SAY @381 /* Great. Meet up with Edgar behind the Lotus Tent upon night fall. He'll give you the precious loot and tell you where to go with it to attract the plunderers. You will return to me, <CHARNAME> - as soon as you defeated whoever will be attacking the delivery. Make them remember we are not defenseless. */
IF ~~ THEN DO ~SetGlobal("bsSmugglerQuest","GLOBAL",3)~ UNSOLVED_JOURNAL @826 EXIT
END

IF ~~ THEN boxes_nightmasks_06
SAY @382 /* It's basically an organization of elite assassins. They carry out contract killings and have started to get a little too involved in the area. */
+ ~Global("bs_boxes_nightmasks_03","LOCALS",0)~ + @374 /* So I'd be bait? */ DO ~SetGlobal("bs_boxes_nightmasks_03","LOCALS",1)~ + boxes_nightmasks_03
++ @375 /* Hmm, Night Masks. Fine, I'll do it. */ + boxes_nightmasks_05
+ ~Global("bs_boxes_nightmasks_04","LOCALS",0)~ + @377 /* What if I say no? */ DO ~SetGlobal("bs_boxes_nightmasks_04","LOCALS",1)~ + boxes_nightmasks_04
END

IF ~~ THEN boxes_nightmasks_07
SAY @383 /* I see. Well, then this has to wait, because I do not have anyone else as capable as you to send there. But fine, I have enough other things to keep me busy. */
IF ~~ THEN DO ~IncrementGlobal("bs_SmugglerDeniedCounter","MYAREA",-1)
SetGlobal("bsSmugglerQuest","GLOBAL",12)~ + more_quests_01
END

/* 4th quest */
IF ~~ THEN get_wares_bs_barracks
SAY @384 /* I did not get payment for several of my deliveries. Considering your connections, I'd like to send you after one of them. */
++ @385 /* Do you want me to collect your gold now? I wanted to work as a smuggler, not a bounty hunter. */ + get_wares_bs_barracks_01
++ @386 /* Sure, who am I supposed to beat up? */ + get_wares_bs_barracks_01
++ @387 /* What do you want me to do? */ + get_wares_bs_barracks_02
++ @341 /* Maybe later. */ + more_quests_01
END

IF ~~ THEN get_wares_bs_barracks_01
SAY @388 /* No, no, don't worry, <CHARNAME>. You won't have anything to do with the client. Not if you can help it, at least. */
IF ~~ THEN + get_wares_bs_barracks_02
END

IF ~~ THEN get_wares_bs_barracks_02
SAY @389 /* I want you to get a special good back for me. It should be with the Captain of the Guard in the Seatower. */
++ @390 /* Holger, are you trying to make me believe that the captain bought smuggled goods?! */ + get_wares_bs_barracks_03
++ @391 /* The Seatower Guard? Are you sure? */ + get_wares_bs_barracks_04
++ @392 /* Oof. I think that's too delicate for me. I'm sorry, Holger. */ + get_wares_bs_barracks_05
END

IF ~~ THEN get_wares_bs_barracks_03
SAY @393 /* No, certainly not the captain. */
IF ~~ THEN + get_wares_bs_barracks_04
END

IF ~~ THEN get_wares_bs_barracks_04
SAY @394 /* His people got the item through Shuck, a gift for their boss - you see? I think there are a lot of innocent people here, and Shuck really has enough problems already. Especially because it might not be Shuck's fault that I haven't received any gold. */
IF ~~ THEN + get_wares_bs_barracks_06
END

IF ~~ THEN get_wares_bs_barracks_05
SAY @395 /* That would be unfortunate. */
IF ~~ THEN + get_wares_bs_barracks_06
END

IF ~~ THEN get_wares_bs_barracks_06
SAY @396 /* I still have enough rogues to get most of my unpaid wares back. But from the Seatower barracks of all places - well, let's put it this way, I'd rather send you there. They seem to visit the place quite unhindered. */
++ @259 /* Alright, I'll do it. */ + get_wares_bs_barracks_08
++ @397 /* I'm sorry, Holger, but I won't do this. */ + get_wares_bs_barracks_07
END

IF ~~ THEN get_wares_bs_barracks_07
SAY @398 /* What a real pity. But well, I can't force you. Let me know if you're ready for another task. */
IF ~GlobalLT("bsSmugglerQuest","GLOBAL",20)~ THEN DO ~IncrementGlobal("bs_SmugglerDeniedCounter","MYAREA",-1)
SetGlobal("bsSmugglerQuest","GLOBAL",20)~ EXIT
IF ~Global("bsSmugglerQuest","GLOBAL",20)~ THEN DO ~IncrementGlobal("bs_SmugglerDeniedCounter","MYAREA",-1)
SetGlobal("bsSmugglerQuest","GLOBAL",28)~ EXIT
END

IF ~~ THEN get_wares_bs_barracks_08
SAY @399 /* Great! I'm sure he kept it in the barracks out of respect for his men who gave it to him. I'm sure you'll find an unobserved moment to retrieve it. */
IF ~~ THEN DO ~SetGlobal("bsSmugglerQuest","GLOBAL",13)~ UNSOLVED_JOURNAL @100104 EXIT
END

END //APPEND

/* 5th quest */
CHAIN
IF ~~ THEN bssmgl02 carry_box_smugglertunnel
@400 /* I have one very delicate delivery through the former smuggler tunnels under the Seatower. Given your unimpeded access to this tunnel, you would be perfect for it. */
== bssmgl02 IF ~CheckStatLT(Player1,18,STR)
CheckStatLT(Player2,18,STR)
CheckStatLT(Player3,18,STR)
CheckStatLT(Player4,18,STR)
CheckStatLT(Player5,18,STR)
CheckStatLT(Player6,18,STR)~ THEN @401 /* You *might* want to stock up on strength enhancements, though. */
== bssmgl02 @402 /* The barrel is a bit heavy - this time, there is something precious inside, you have my word. Something that needs to be handled with great care so not to break it. You must deliver it fast and not reveal the contents under any circumstances - these are the client's explicite orders. Can I count on you? */
END
++ @403 /* Yes, I can do that. */ + carry_box_smugglertunnel_01
++ @404 /* I'm sorry, Holger, but I don't think I can do this. */ + get_wares_bs_barracks_07

APPEND bssmgl02
IF ~~ THEN carry_box_smugglertunnel_01
SAY @405 /* Wonderful. The barrel will be in front of the tailor shop - you remember, where you met the sad remains of the former tower cell in the cellar. Carry it through the tunnels outside to the coast under the Seatower. My contacts will take it from you there. And <CHARNAME> - this is a time sensitive assignment. Lives are at stake - literally. Not to mention that my transport contact won't wait forever. */
IF ~~ THEN DO ~SetGlobal("bsSmugglerQuest","GLOBAL",21)~ UNSOLVED_JOURNAL @100143 EXIT
END

/* 6th quest */
IF ~~ THEN guard_meeting
SAY @406 /* I'd need your fighting prowess again, <CHARNAME>. I need you to guard a meeting I'll have. It's a very important one - I told you we need to reorganize ourselves. I'm not sure what or who will try to disturb us - Nashkel Guard, Night Masks, bears - I need you to bribe the former and kill the latter two. It might even be that I'll need your help against my visitors! Let me know when you are ready. */
IF ~~ THEN DO ~SetGlobal("bsSmugglerQuest","GLOBAL",29)~ UNSOLVED_JOURNAL @100156 EXIT
END

IF ~~ THEN guard_meeting_01
SAY @407 /* Brilliant. Just stand here and be ready - for anything. Do not disturb us, but I assume that goes without saying. */
IF ~~ THEN DO ~EraseJournalEntry(@100156)
SetGlobal("bsSmugglerQuest","GLOBAL",30)
ClearAllActions() StartCutSceneMode() StartCutScene("bscut019")~ EXIT
END

IF WEIGHT #-1
~Global("bsSmugglerQuest","GLOBAL",30)~ THEN checkup
SAY @408 /* We are taking a short break. Everything still alright here? */
++ @409 /* Yes, nothing happened so far. */ + checkup_02
++ @410 /* How did negotiations go so far? */ + checkup_03
++ @411 /* Will it take long still? */ + checkup_01
END

IF ~~ THEN checkup_01
SAY @412 /* It takes as long as it takes, I'm afraid. */
IF ~~ THEN + checkup_02
END

IF ~~ THEN checkup_02
SAY @413 /* Keep it up! */
IF ~~ THEN DO ~SetGlobal("bsSmugglerQuest","GLOBAL",31)
ClearAllActions() StartCutSceneMode() StartCutScene("bscut019")~ EXIT
END

IF ~~ THEN checkup_03
SAY @414 /* Not bad, not bad at all. */
IF ~~ THEN + checkup_02
END

IF WEIGHT #-1
~Global("bsSmugglerQuest","GLOBAL",31)~ THEN meeting_over
SAY @415 /* And - we are done. Everything stayed quiet here? */
++ @416 /* What do you mean, done? Nothing happened! */ + meeting_over_02
++ @417 /* Wait - that's it? No fight, no quarrel, no carnage, no suddenly appearing enemies? */ + meeting_over_00
++ @418 /* Yes, everything stayed quiet here. */ + meeting_over_02
++ @419 /* If I had known that this meeting would be so uneventful, I would have spent my time differently. */ + meeting_over_01
END

IF ~~ THEN meeting_over_00
SAY @420 /* No, nothing of the sort. */
IF ~~ THEN + meeting_over_02
END

IF ~~ THEN meeting_over_01
SAY @421 /* Had I known this meeting would be so uneventful, I wouldn't have bothered you, <CHARNAME>. Hmm, but you never know, you know. */
IF ~~ THEN + meeting_over_02
END
END //APPEND

CHAIN
IF ~~ THEN bssmgl02 meeting_over_02
@422 /* I'm sure your mere presence has greatly reduced any attempts by our business partners to rip us off. And the fact that no Night Masks turned up - well, not everything always has to go wrong, does it? For once, a secret meeting actually remained a secret meeting. I think that's a good sign for this new collaboration I am forming. You've done a very good job, <CHARNAME>. */
= @423 /* It is downright regrettable that I have to pause our smuggling cooperation at this point, as my duties now call me back to the Kings' Tears mother guild - the changing contingencies and new possibilities must be weighed up wisely, this discussion does not work well via carrier pigeons. */
= @424 /* I would love to hire you as my bodyguard and take you with me, but I know you have obligations elsewhere. If there is any chance, then we will meet again. */
== bssmgl02 IF ~GlobalGT("bs_SmugglerDeniedCounter","MYAREA",-2)~ THEN @425 /* I'd not waste such an asset as you, you can believe me that. Be assured that you made a very profitable business contact here - I'd say "friend", but we both know that wouldn't be the truth. */
/* all smuggler quests finished */
== bssmgl02 @426 /* Farewell, <CHARNAME>. */
END
IF ~~ THEN DO ~SetGlobal("bsSmugglerQuest","GLOBAL",40)~ SOLVED_JOURNAL @839 EXIT
IF ~GlobalGT("bs_SmugglerDeniedCounter","MYAREA",-2)~ THEN DO ~
SetGlobal("bsSmugglerQuest","GLOBAL",41)~ SOLVED_JOURNAL @839 EXIT

APPEND bssmgl02
IF ~~ THEN smuggler_42
SAY @427 /* You will hear from me when they tell us more details. */
IF ~~ THEN DO ~SetGlobal("bsSlaverQuest","GLOBAL",1) SetGlobalTimer("bsSlaveTimer2","GLOBAL",ONE_DAY)~ + more_quests
END

IF ~~ THEN smuggler_43
SAY @428 /* Oh, what a pity. Guess I need to send Edgar then, again. */
IF ~~ THEN + more_quests
END

IF ~~ THEN more_quests
SAY @429 /* The losses is a hard blow for us. I still have some orders I need to deliver, but I'll also start reorganizing my standing. */
IF ~~ THEN + more_quests_01
END

IF ~~ THEN more_quests_01
SAY @430 /* If you are ready, I'd have more jobs for you to do. Just say the word. */
IF ~GlobalGT("bsSlaverQuest","GLOBAL",2)~ THEN EXIT
IF ~GlobalLT("bsSlaverQuest","GLOBAL",3)~ THEN UNSOLVED_JOURNAL @827 EXIT
END

END //APPEND


BEGIN bssmgl03

IF ~True()~ THEN smuggler
SAY @431 /* I'm just here for the muscle. Talk to Holger. */
IF ~~ THEN EXIT
END



/* Cook of the Helm & Cloak */

EXTEND_BOTTOM ~MCOOK5~ 0
IF ~AreaCheck("%NWBaldursGate_Helm&Cloak_L1%") PartyHasItem("bssmq002") Global("bsDeliverFigs","GLOBAL",0)~ THEN + delivery
END

CHAIN
IF WEIGHT #-1
~NumTimesTalkedToGT(0) PartyHasItem("bssmq002") Global("bsDeliverFigs","GLOBAL",0)
AreaCheck("%NWBaldursGate_Helm&Cloak_L1%")~ THEN MCOOK5 delivery
@432 /* Oh, I didn't notice the box you have there. That's for me, right? Now, let me see. */
== ~MCOOK5~ IF ~GlobalTimerExpired("bsSmugglerQuestTimer1","GLOBAL")~ THEN @433 /* You are late, you know that, yes? */
== ~MCOOK5~ IF ~Global("bsSMQOpenedBox","GLOBAL",1)~ THEN @434 /* What's this - it's already opened?! Are you trying to trick me? I payed for Calimshan figs exquisitely, now I can't be sure you didn't switch them with cheap Tethyr ones! */
== ~MCOOK5~ IF ~Global("bsSMQAteFigs","GLOBAL",1)~ THEN @435 /* And it's no longer six! Some are missing! */
== ~MCOOK5~ IF ~GlobalTimerExpired("bsSmugglerQuestTimer1","GLOBAL")~ THEN @436 /* And - ugh - they are rotten. So you bring me some rotten figs instead of the promised fresh Calimshan ones. */ DO ~SetGlobal("bsSMQTooLate","GLOBAL",1)~
== ~MCOOK5~ IF ~OR(2)
Global("bsSMQAteFigs","GLOBAL",1)
GlobalTimerExpired("bsSmugglerQuestTimer1","GLOBAL")~ THEN @437 /* I am very disappointed. Very. I will not pay you, as you haven't delivered what I ordered. Get out of my kitchen. Fresh delivery, pfeh. */
== ~MCOOK5~ IF ~Global("bsSMQOpenedBox","GLOBAL",1)
!Global("bsSMQAteFigs","GLOBAL",1)
!GlobalTimerExpired("bsSmugglerQuestTimer1","GLOBAL")~ THEN @438 /* Hm, well, I guess I will accept the broken seal, they do look right. I *will* report this with my next order, however. */
== ~MCOOK5~ IF ~!Global("bsSMQOpenedBox","GLOBAL",1)
!Global("bsSMQAteFigs","GLOBAL",1)
!GlobalTimerExpired("bsSmugglerQuestTimer1","GLOBAL")~ THEN @439 /* Ah, yes, here they are: six marvellous Calimshan figs. */
== ~MCOOK5~ IF ~!Global("bsSMQAteFigs","GLOBAL",1)
!GlobalTimerExpired("bsSmugglerQuestTimer1","GLOBAL")~ THEN @440 /* So here's something extra for you, and now get out of my kitchen, I have work to do. */ DO ~GiveGoldForce(100)~
END
IF ~~ THEN DO ~SetGlobal("bsDeliverFigs","GLOBAL",1)~ EXIT
IF ~Global("bs_ReportSmugglersToFF","GLOBAL",4)~ THEN DO ~SetGlobal("bsDeliverFigs","GLOBAL",1)
SetGlobalTimer("bs_ReportSmugglersToFF_T","GLOBAL",TWO_DAYS)~ EXIT

/* FF appears in kitchen */
BEGIN bssmgl15 //Manip Limmon, FF
CHAIN
IF ~Global("bs_ReportSmugglersToFF","GLOBAL",3)
	AreaCheck("%NWBaldursGate_Helm&Cloak_L1%")~ THEN bssmgl15 bust_cook
@441 /* Hold! You are caught in the act of bying smuggled wares! It might just be figs... but they were smuggled! Pay a penalty fee of 1000 gold coins. If we find you engaging in illegal activities again, we will not be so lenient! */
== ~MCOOK5~ @442 /* What - Ugh, there it goes, the "saved" gold because it was so much cheaper, and then some! I shouldn't have let myself being talked into this. And *you* - don't think I'm so daft not to know it was you who tipped of the Flaming Fist! */
== ~MCOOK5~ @443 /* Now everyone out of my kitchen! Out, out, OUT! */
END
IF ~~ THEN DO ~SetGlobal("bs_ReportSmugglersToFF","GLOBAL",6)~ EXIT



/* Edgar */

BEGIN bssmgl08
IF ~Global("bsSmugglerQuest","GLOBAL",4)~ THEN nightmasks_quest
SAY @444 /* There you are, our new muscle. Ready? */
++ @445 /* Yes. What am I to do? */ + nightmasks_quest_02
++ @446 /* Not quite. I'll be back in a minute. */ + nightmasks_quest_01
END

IF ~~ THEN nightmasks_quest_01
SAY @447 /* Sure, I'll be here. */
IF ~~ THEN EXIT
END

IF ~~ THEN nightmasks_quest_02
SAY @448 /* First, here's the box. Just take this and walk north from here - in the direction of Baldur's Gate. But do it without haste, and especially, not in the shadows or even invisible - this is not about arriving, this is about luring them devils out. Once you're done with the Night Masks, just return to Holger. */
IF ~~ THEN DO ~GiveItemCreate("bssmq004",LastTalkedToBy(Myself),0,0,0)
SetGlobal("bsSmugglerQuest","GLOBAL",5)
EraseJournalEntry(@826)
ActionOverride("bssmgl08",EscapeAreaDestroy(5))~ UNSOLVED_JOURNAL @100103 EXIT
END


/* Night Masks */

BEGIN bssmgl09

IF ~GlobalGT("bsSMQOpenedBox","GLOBAL",1)~ THEN box_open
SAY @449 /* What can I say - do you think we are dumb and blind? So that box is empty. Well played! Well, except for the part where you stumbled all over the place with an empty box. We decided to kill you anyway - and I brought a few more friends with me, because you wanted to play dirty too. */
IF ~~ THEN DO ~SetGlobal("bs_NightMasksAttack","MYAREA",5)~ EXIT
END

IF ~True()~ THEN nightmask1
SAY @450 /* Thank you for the Black Lotus delivery. We'll take it from here. */
++ @451 /* Who are you? Are you killing the smugglers? */ + nightmask1_01
++ @452 /* I don't think so. */ + nightmask1_03
++ @453 /* Please, just take the crate and let me go. This is not my fight! */ + nightmask1_02
END

IF ~~ THEN nightmask1_01
SAY @454 /* That's exactly what we are doing. How about we show you? */
IF ~~ THEN + nightmask1_04
END

IF ~~ THEN nightmask1_02
SAY @455 /* Oh, but it is now! */
IF ~~ THEN + nightmask1_04
END

IF ~~ THEN nightmask1_03
SAY @456 /* Ugh, a "hero". */
IF ~~ THEN + nightmask1_04
END

IF ~~ THEN nightmask1_04
SAY @457 /* Well then, let's dance! */
IF ~~ THEN DO ~SetGlobal("bs_NightMasksAttack","MYAREA",1)~ EXIT
END

BEGIN bssmgl10
IF ~True()~ THEN nightmask2
SAY @458 /* There you are! */
IF ~~ THEN EXTERN bssmgl09 nightmask1
END

/* Amnian Soldiers */
BEGIN bssmgl13
IF ~True()~ THEN filler
SAY @459 /* [BG:EE #8907]I'll box your ears if you step an inch closer! */
IF ~GlobalLT("bsSMQOpenedBox","GLOBAL",2)~ THEN EXTERN bssmgl12 caught
IF ~GlobalGT("bsSMQOpenedBox","GLOBAL",1)~ THEN EXTERN bssmgl12 caught_02
END

IF ~~ THEN recognized
SAY @460 /* Wait - wait, wait. I recognize <PRO_HIMHER> now. It's Telmov's smuggler spy! Why do you escalate the situation like this? Just tell us that you are on one of Telmov's missions! */
IF ~~ THEN EXTERN bssmgl12 caught_05
IF ~Global("bs_ReportSmugglersNashkel","GLOBAL",2)~ THEN EXTERN bssmgl12 caught_04
END

BEGIN bssmgl12
IF ~GlobalLT("bsSMQOpenedBox","GLOBAL",2)
Global("bs_SpawnFFAfterNM","MYAREA",1)~ THEN caught
SAY @461 /* Hold! What happened here? Explain yourself! */
++ @462 /* Well, what can I say - these here were Night Masks, and we were attacked by them! */ + caught_02
+ ~Global("bs_ReportSmugglersNashkel","GLOBAL",2)~ + @463 /* I am <CHARNAME>, I am working with Sergeant Telmov to reveal the smugglers. This is one of the missions. */ DO ~SetGlobal("bs_SpawnFFAfterNM","MYAREA",2)~ + caught_04
+ ~Global("bs_ReportSmugglersNashkel","GLOBAL",5)~ + @463 /* I am <CHARNAME>, I am working with Sergeant Telmov to reveal the smugglers. This is one of the missions. */ DO ~SetGlobal("bs_SpawnFFAfterNM","MYAREA",2)~ + caught_05
+ ~!Global("bs_ReportSmugglersNashkel","GLOBAL",2)
!Global("bs_ReportSmugglersNashkel","GLOBAL",5)~ + @464 /* I'm an adventurer and on my way to Baldurs Gate. */ DO ~SetGlobal("bs_SpawnFFAfterNM","MYAREA",2)~ + caught_02
++ @465 /* I couldn't care less what you soldier pansies think of me! */ DO ~SetGlobal("bs_SpawnFFAfterNM","MYAREA",2)~ + caught_01
END

IF ~~ THEN caught_01
SAY @466 /* Oh, but you should, citizen! */
IF ~~ THEN + caught_02
END

IF ~GlobalGT("bsSMQOpenedBox","GLOBAL",1)
Global("bs_SpawnFFAfterNM","MYAREA",1)~ THEN caught_02
SAY @467 /* We were in pursuit of Night Masks who are said to have been roaming the area. It is late, and your presence here is dubious at best. What is this crate? */
IF ~GlobalGT("bsSMQOpenedBox","GLOBAL",1)~ THEN DO ~SetGlobal("bs_SpawnFFAfterNM","MYAREA",2)~ + empty
IF ~GlobalLT("bsSMQOpenedBox","GLOBAL",2)~ THEN DO ~SetGlobal("bs_SpawnFFAfterNM","MYAREA",2)~ + box_closed
END

IF ~~ THEN box_closed
SAY @468 /* Open it at once! */
+ ~Global("bs_ReportSmugglersNashkel","GLOBAL",2)~ + @463 /* I am <CHARNAME>, I am working with Sergeant Telmov to reveal the smugglers. This is one of the missions. */ + caught_04
+ ~Global("bs_ReportSmugglersNashkel","GLOBAL",5)~ + @463 /* I am <CHARNAME>, I am working with Sergeant Telmov to reveal the smugglers. This is one of the missions. */ + caught_05
+ ~!Global("bs_ReportSmugglersNashkel","GLOBAL",2)
!Global("bs_ReportSmugglersNashkel","GLOBAL",5)~ + @469 /* No, please... ugh, I guess I'm caught. I really don't want to fight soldiers. */ + empty
+ ~!Global("bs_ReportSmugglersNashkel","GLOBAL",2)
!Global("bs_ReportSmugglersNashkel","GLOBAL",5)~ + @470 /* Look, this is just my travel luggage. You don't want to go through my dirty laundry, do you? */ + caught_03
++ @471 /* Of course, please do so. I am sure there is nothing suspicious to see. (At least I'd assume Holger would make sure of that...) */ + empty
+ ~!Global("bs_ReportSmugglersNashkel","GLOBAL",2)
!Global("bs_ReportSmugglersNashkel","GLOBAL",5)
PartyGoldGT(499)~ + @472 /* Well, how about I'll give you, say, 500 gp and we'll just pretend this is not a suspicious crate I'm carrying around at night? */ DO ~SetGlobal("bs_GoldBribe","LOCALS",500)~ EXTERN bssmgl13 bribe
+ ~!Global("bs_ReportSmugglersNashkel","GLOBAL",2)
!Global("bs_ReportSmugglersNashkel","GLOBAL",5)
PartyGoldGT(299)~ + @473 /* Well, how about I'll give you, say, 300 gp and we'll just pretend this is not a suspicious crate I'm carrying around at night? */ DO ~SetGlobal("bs_GoldBribe","LOCALS",300)~ EXTERN bssmgl13 bribe
+ ~!Global("bs_ReportSmugglersNashkel","GLOBAL",2)
!Global("bs_ReportSmugglersNashkel","GLOBAL",5)
PartyGoldGT(99)~ + @474 /* Well, how about I'll give you, say, 100 gp and we'll just pretend this is not a suspicious crate I'm carrying around at night? */ DO ~SetGlobal("bs_GoldBribe","LOCALS",100)~ + bribe
++ @475 /* If it comes to this, then draw your weapons! I won't surrender this crate to you! */ + attack
END

IF ~~ THEN caught_03
SAY @476 /* Open it, or we'll do it by force! */
+ ~Global("bs_ReportSmugglersNashkel","GLOBAL",2)~ + @463 /* I am <CHARNAME>, I am working with Sergeant Telmov to reveal the smugglers. This is one of the missions. */ + caught_04
+ ~Global("bs_ReportSmugglersNashkel","GLOBAL",5)~ + @463 /* I am <CHARNAME>, I am working with Sergeant Telmov to reveal the smugglers. This is one of the missions. */ + caught_05
+ ~!Global("bs_ReportSmugglersNashkel","GLOBAL",2)
!Global("bs_ReportSmugglersNashkel","GLOBAL",5)~ + @469 /* No, please... ugh, I guess I'm caught. I really don't want to fight soldiers. */ + empty
++ @471 /* Of course, please do so. I am sure there is nothing suspicious to see. (At least I'd assume Holger would make sure of that...) */ + empty
+ ~!Global("bs_ReportSmugglersNashkel","GLOBAL",2)
!Global("bs_ReportSmugglersNashkel","GLOBAL",5)
PartyGoldGT(499)~ + @472 /* Well, how about I'll give you, say, 500 gp and we'll just pretend this is not a suspicious crate I'm carrying around at night? */ DO ~SetGlobal("bs_GoldBribe","LOCALS",500)~ EXTERN bssmgl13 bribe
+ ~!Global("bs_ReportSmugglersNashkel","GLOBAL",2)
!Global("bs_ReportSmugglersNashkel","GLOBAL",5)
PartyGoldGT(299)~ + @473 /* Well, how about I'll give you, say, 300 gp and we'll just pretend this is not a suspicious crate I'm carrying around at night? */ DO ~SetGlobal("bs_GoldBribe","LOCALS",300)~ EXTERN bssmgl13 bribe
+ ~!Global("bs_ReportSmugglersNashkel","GLOBAL",2)
!Global("bs_ReportSmugglersNashkel","GLOBAL",5)
PartyGoldGT(99)~ + @474 /* Well, how about I'll give you, say, 100 gp and we'll just pretend this is not a suspicious crate I'm carrying around at night? */ DO ~SetGlobal("bs_GoldBribe","LOCALS",100)~ + bribe
++ @475 /* If it comes to this, then draw your weapons! I won't surrender this crate to you! */ + attack
END

CHAIN
IF ~~ THEN bssmgl12 caught_04
@477 /* A mission? He didn't tell us about it. Is he even aware? */
== bssmgl13 @478 /* He did mention his smuggler spy, though. */
END
IF ~~ THEN DO ~SetGlobal("bs_ReportSmugglersNashkel","GLOBAL",4)~ EXTERN bssmgl12 caught_05

APPEND bssmgl12
IF ~~ THEN caught_05
SAY @479 /* Right, he mentioned something. Fine, we'll do nothing so we won't risk busting the operation then! */
IF ~GlobalGT("bsSMQOpenedBox","GLOBAL",1)~ THEN DO ~SetGlobal("bsSmugglerQuest","GLOBAL",11)
EraseJournalEntry(@100103)~ UNSOLVED_JOURNAL @100110 + caught_07
+ ~GlobalLT("bsSMQOpenedBox","GLOBAL",2)~ + @480 /* Yes, best we'll leave the box untouched. I wouldn't be able to explain why you wouldn't conviscate a box of Black Lotus, I guess. */ DO ~SetGlobal("bsSmugglerQuest","GLOBAL",10)
EraseJournalEntry(@100103)~ UNSOLVED_JOURNAL @100110 + leave
+ ~GlobalLT("bsSMQOpenedBox","GLOBAL",2)~ + @481 /* On the contrary, I'd like to use the situation and open the box. We need to know what is in there if we want to use it to bust the smugglers. */ DO ~SetGlobal("bsSmugglerQuest","GLOBAL",11)
EraseJournalEntry(@100103)~ UNSOLVED_JOURNAL @100110 + caught_06
END

IF ~~ THEN caught_06
SAY @482 /* True words. Well, let's see... */
IF ~~ THEN + caught_07
END

IF ~~ THEN caught_07
SAY @483 /* The crate is empty! Well, seems like Sergeant Telmov doesn't have much luck with busting those smugglers, eh. */
IF ~~ THEN + leave
IF ~Global("bs_ReportSmugglersNashkel","GLOBAL",5)~ THEN UNSOLVED_JOURNAL @100117 + leave
END

IF ~~ THEN bribe
SAY @484 /* Are you trying to bribe us?! */
IF ~~ THEN EXTERN bssmgl13 bribe
END
END //APPEND

CHAIN
IF ~~ THEN bssmgl13 bribe
@485 /* Well - they were headed north... As soon as they're out of Amn, does it really matter what is inside the crate? */
== bssmgl12 @486 /* You mean we should be *thankful* someone brings what we think is Black Lotus *away* from here - and to the morons in Baldur's Gate so they'll be able to smoke themselves into brain loss? */
== bssmgl13 @487 /* Duh? */
END
IF ~~ THEN EXTERN bssmgl12 bribe_01

CHAIN
IF ~~ THEN bssmgl12 bribe_01
@488 /* Hmph, fine. */
== bssmgl12 IF ~Global("bs_GoldBribe","LOCALS",100)~ THEN @489 /* But make it 300 gold coins, at least! */
END
+ ~PartyGoldGT(299)
!Global("bs_GoldBribe","LOCALS",500)~ + @490 /* 300 gold coins, here you are. */ DO ~TakePartyGold(300) SetGlobal("bsSmugglerQuest","GLOBAL",9)
EraseJournalEntry(@100103)~ UNSOLVED_JOURNAL @824 + leave
+ ~Global("bs_GoldBribe","LOCALS",500)~ + @491 /* 500 gold coins, here you are. */ DO ~TakePartyGold(500) SetGlobal("bsSmugglerQuest","GLOBAL",9)
EraseJournalEntry(@100103)~ UNSOLVED_JOURNAL @824 + leave
+ ~!PartyGoldGT(299)~ + @492 /* I don't have that much gold with me, as it seems. */ + bribe_02

APPEND bssmgl12

IF ~~ THEN bribe_02
SAY @493 /* Then open the crate, now! */
+ ~Global("bs_ReportSmugglersNashkel","GLOBAL",2)~ + @463 /* I am <CHARNAME>, I am working with Sergeant Telmov to reveal the smugglers. This is one of the missions. */ + caught_04
+ ~Global("bs_ReportSmugglersNashkel","GLOBAL",5)~ + @463 /* I am <CHARNAME>, I am working with Sergeant Telmov to reveal the smugglers. This is one of the missions. */ + caught_05
++ @494 /* I was afraid you'd say that. */ + empty
++ @475 /* If it comes to this, then draw your weapons! I won't surrender this crate to you! */ + attack
END

IF ~~ THEN empty
SAY @495 /* The crate is empty! Is this a joke? Why are you carrying an empty crate late at night?! */
+ ~GlobalGT("bsSMQOpenedBox","GLOBAL",1)
Global("bs_ReportSmugglersNashkel","GLOBAL",2)~ + @463 /* I am <CHARNAME>, I am working with Sergeant Telmov to reveal the smugglers. This is one of the missions. */ + caught_04
+ ~GlobalGT("bsSMQOpenedBox","GLOBAL",1)
Global("bs_ReportSmugglersNashkel","GLOBAL",5)~ + @463 /* I am <CHARNAME>, I am working with Sergeant Telmov to reveal the smugglers. This is one of the missions. */ + caught_05
++ @496 /* That... is a very good question. */ DO ~SetGlobal("bsSmugglerQuest","GLOBAL",11)
EraseJournalEntry(@100103)~ UNSOLVED_JOURNAL @100102 + hmph
+ ~GlobalLT("bsSMQOpenedBox","GLOBAL",2)~ + @497 /* It is *empty*? Holger, you damned... */ DO ~SetGlobal("bsSmugglerQuest","GLOBAL",11)
EraseJournalEntry(@100103)~ UNSOLVED_JOURNAL @100102 + empty_01
++ @498 /* Well, someone lied to us too. I would have expected it to have been at least a big load of delicious figs. Or stones! Stones are also very popular. */ DO ~SetGlobal("bsSmugglerQuest","GLOBAL",11)
EraseJournalEntry(@100103)~ UNSOLVED_JOURNAL @100102 + empty_01
+ ~GlobalLT("bsSMQOpenedBox","GLOBAL",2)~ + @499 /* See? No contraband in there. Will you leave us alone now? */ DO ~SetGlobal("bsSmugglerQuest","GLOBAL",11)
EraseJournalEntry(@100103)~ UNSOLVED_JOURNAL @100102 + hmph
++ @500 /* Well, you see - the crate *is* the treasure. Have you never heard of the, er, very sturdy crates from Chult? They're all the rage in Baldur's Gate! */ DO ~SetGlobal("bsSmugglerQuest","GLOBAL",11)
EraseJournalEntry(@100103)~ UNSOLVED_JOURNAL @100102 + empty_01
++ @501 /* Disappointed you didn't find a reason to attack us, eh? */ DO ~SetGlobal("bsSmugglerQuest","GLOBAL",11)
EraseJournalEntry(@100103)~ UNSOLVED_JOURNAL @100102 + empty_02
END

IF ~~ THEN empty_01
SAY @502 /* You think this is a joke? */
IF ~~ THEN + leave
IF ~Global("bs_ReportSmugglersNashkel","GLOBAL",5)~ THEN UNSOLVED_JOURNAL @100117 + leave
END

IF ~~ THEN empty_02
SAY @503 /* Watch your mouth! */
IF ~~ THEN + empty_01
END

IF ~~ THEN hmph
SAY @504 /* Hmph. */
IF ~~ THEN + leave
IF ~Global("bs_ReportSmugglersNashkel","GLOBAL",5)~ THEN UNSOLVED_JOURNAL @100117 + leave
END

IF ~~ THEN leave
SAY @505 /* I guess you can go then. No trouble out of you! */
IF ~~ THEN DO ~SetGlobal("bs_SpawnFFAfterNM","MYAREA",3)~ EXIT
END

IF ~~ THEN attack
SAY @506 /* You made a mistake! */
IF ~~ THEN DO ~SetGlobal("bsSmugglerQuest","GLOBAL",8)
EraseJournalEntry(@100103)~ UNSOLVED_JOURNAL @825 EXIT
IF ~OR(2)
	Global("bs_ReportSmugglersNashkel","GLOBAL",2)
	Global("bs_ReportSmugglersNashkel","GLOBAL",5)~ THEN EXTERN bssmgl13 recognized
END
END //APPEND





/* report the smugglers in Nashkel */

/* Sergeant Telmov */
/* SetGlobal("bs_ReportSmugglersNashkel","GLOBAL",2): disables reply option with Bardolan */

APPEND bssmgl14

IF ~NumTimesTalkedTo(0)
!AreaCheck("%NashkelCarnival%")~ THEN first_greeting
SAY @507 /* Greetings. The bandit activities were reduced significantly, but we still have problems with scoundrels of all sorts, taking advantage of the situation. Let me know if you notice anything suspicious or hear of any bandit or smuggling activity - there are always rogues on the loose! */
IF ~~ THEN UNSOLVED_JOURNAL @100112 EXIT
END

/* other soldiers are dead */
IF ~Dead("bssmgl12") Dead("bssmgl13")
AreaCheck("%Nashkel%")~ THEN dead_soldiers
SAY @508 /* You! I can't prove it, but I *know* that it was you who killed my soldiers who were in pursuit of Night Masks. Get out of my sight quickly - be glad I am too busy to just take you to prison until you confess by yourself! */
IF ~~ THEN DO ~EraseJournalEntry(@100112)
EraseJournalEntry(@100115)
EraseJournalEntry(@100117)
EraseJournalEntry(@100118)
SetGlobal("bs_ReportSmugglersNashkel","GLOBAL",53)~ SOLVED_JOURNAL @100121 EXIT
END

/* reward after successful bust */
IF ~Global("bs_ReportSmugglersNashkel","GLOBAL",50)~ THEN reward
SAY @509 /* <CHARNAME>! Here is your well earned reward. This town became a little safer, thanks to you. I will go on patrol again. Have a nice day! */
IF ~~ THEN DO ~SetGlobal("bs_ReportSmugglersNashkel","GLOBAL",51)
AddexperienceParty(1500)
GiveGoldForce(2500)
EraseJournalEntry(@100119)~ SOLVED_JOURNAL @100124 EXIT
END

/* report heavy box after meeting the other soldiers (before giving the box back to holger) - Telmov will know from the other soldiers if CHARNAME revealed themselves */
IF ~Global("bs_ReportSmugglersNashkel","GLOBAL",4)~ THEN masks_mission
SAY @510 /* My comrades told me they met you on a mission! Why didn't I know about this? */
+ ~PartyHasItem("bssmq004")
GlobalLT("bsSMQOpenedBox","GLOBAL",2)
GlobalLT("bsSmugglerQuest","GLOBAL",11)~ + @511 /* I am telling you know. I'll bring the smuggler box to the smuggler lead now. This will be a good opportunity to bust the smugglers. */ DO ~SetGlobal("bs_ReportSmugglersNashkel","GLOBAL",5)~ UNSOLVED_JOURNAL @100125 + ready_to_bust
+ ~PartyHasItem("bssmq004")
OR(2)
	GlobalGT("bsSMQOpenedBox","GLOBAL",1)
	Global("bsSmugglerQuest","GLOBAL",11)~ + @512 /* Don't bother, sergeant - the box is empty, it was really only bait for the Night Masks. */ + masks_mission_01
+ ~GlobalGT("bsSmugglerQuest","GLOBAL",11)~ + @513 /* It was a fake operation to draw Night Masks out. The area is much safer again, but for busting the smugglers it wouldn't have worked. */ + masks_mission_01
++ @514 /* You have to trust me in this, or collaboration won't work. */ + trust
END

IF ~~ THEN masks_mission_01
SAY @515 /* I see. Keep me updated. */
IF ~~ THEN DO ~EraseJournalEntry(@100117)
SetGlobal("bs_ReportSmugglersNashkel","GLOBAL",6)~ EXIT
END
END //APPEND

CHAIN
IF ~~ THEN bssmgl14 trust
@516 /* You make it hard to trust you, <CHARNAME>. */
== bssmgl14 IF ~Global("bs_ReportSmugglersNashkel","GLOBAL",4)~ THEN @517 /* Don't walk around with contraband again, or I will seriously reconsider our agreement. */
END
IF ~Global("bs_ReportSmugglersNashkel","GLOBAL",4)~ THEN DO ~EraseJournalEntry(@100115)
EraseJournalEntry(@100117)
IncrementGlobal("bs_PCAskedForTrust","LOCALS",1)
SetGlobal("bs_ReportSmugglersNashkel","GLOBAL",6)~ EXIT
IF ~Global("bs_ReportSmugglersNashkel","GLOBAL",7)
GlobalGT("bsSmugglerQuest","GLOBAL",19)~ THEN DO ~EraseJournalEntry(@100123)
EraseJournalEntry(@100165)
IncrementGlobal("bs_PCAskedForTrust","LOCALS",1)
SetGlobal("bs_ReportSmugglersNashkel","GLOBAL",9)~ EXIT

APPEND bssmgl14
IF ~~ THEN trust_01
SAY @518 /* You make it hard to trust you, <CHARNAME>. Too hard, in fact. */
IF ~~ THEN + end_collaboration
END

IF ~~ THEN trust_02
SAY @519 /* You keep on saying that, but I reached the end of my patience, <CHARNAME>. */
IF ~~ THEN + end_collaboration
END

/* PC agreed to collaboration but didn't report */
/*
Global("bsSmugglerQuest","GLOBAL",12) - 3rd quest finished
Global("bsSmugglerQuest","GLOBAL",20) - 4th quest finished

Global("bs_ReportSmugglersNashkel","GLOBAL",2) - PC agreed to report smugglers
Global("bs_ReportSmugglersNashkel","GLOBAL",3) - not used
Global("bs_ReportSmugglersNashkel","GLOBAL",7) - PC should have told when they return from BG with smuggler ware (4th quest)

Global("bs_PCHasCollaborationPass","MYAREA",3) - PC received official collaboration pass bssmq006
Global("bs_PCHasCollaborationPass","MYAREA",4) - PC received the pass for getting back the flagrant.
*/

END //APPEND

/* PC said they'd report coming back with flagrant but 4th quest is done */
CHAIN
IF ~Global("bs_ReportSmugglersNashkel","GLOBAL",7)
GlobalGT("bsSmugglerQuest","GLOBAL",19)~ THEN bssmgl14 no_report_fourth_quest
@520 /* <CHARNAME>! What happened to our planned smuggler bust with regard to the smuggler ware you were retrieving from Baldur's Gate? */
== bssmgl14 IF ~GlobalGT("bs_PCHasCollaborationPass","MYAREA",2)~ THEN @521 /* I even gave you an official document for it! */
END
+ ~GlobalGT("bs_PCAskedForTrust","LOCALS",0)~ + @522 /* Seems I forgot to tell you how it went - now that smuggling heist is finished. */ + trust_01
+ ~Global("bs_PCAskedForTrust","LOCALS",0)~ + @522 /* Seems I forgot to tell you how it went - now that smuggling heist is finished. */ + trust
+ ~GlobalGT("bs_PCAskedForTrust","LOCALS",0)~ + @523 /* Erm, oops. Sorry... */ + trust_01
+ ~Global("bs_PCAskedForTrust","LOCALS",0)~ + @514 /* You have to trust me in this, or collaboration won't work. */ + trust
+ ~GlobalGT("bs_PCAskedForTrust","LOCALS",0)~ + @514 /* You have to trust me in this, or collaboration won't work. */ + trust_02


/* PC said they'd report smugglers but smuggler quests are done */
APPEND bssmgl14
IF ~GlobalGT("bs_ReportSmugglersNashkel","GLOBAL",1)
OR(2)
	Global("bsSmugglerQuest","GLOBAL",40)
	Global("bsSmugglerQuest","GLOBAL",41)~ THEN no_reports
SAY @524 /* <CHARNAME>! So much time has passed but you did not provide helpful hints. */
IF ~~ THEN + end_collaboration
END

IF ~~ THEN end_collaboration
SAY @525 /* I can't wait for you any longer. Our collaboration with regard to the smugglers now comes to an end. */
IF ~~ THEN DO ~EraseJournalEntry(@100112)
EraseJournalEntry(@100115)
EraseJournalEntry(@100117)
EraseJournalEntry(@100118)
EraseJournalEntry(@100122)
EraseJournalEntry(@100123)
EraseJournalEntry(@100125)
EraseJournalEntry(@100127)
EraseJournalEntry(@100165)
SetGlobal("bs_ReportSmugglersNashkel","GLOBAL",55)~ SOLVED_JOURNAL @100126 EXIT
END

/* general dialogue */
IF ~True()~ THEN sergeant_01
SAY @526 /* Do you have any bandit or smuggler activities witnessed you like to report? */
+ ~!Dead("bssmgl02")
!Global("bsWorkingWithSmugglers","GLOBAL",1)
GlobalLT("bsSmugglerQuest","GLOBAL",40)
Global("bsSmugglersLeave","GLOBAL",1)
Global("bs_ReportSmugglersNashkel","GLOBAL",1)~ + @527 /* I would like to report a smuggler organization having their meeting point near here. Lieutenant Bardolan said I should talk to you about it. */ + report_smuggler
+ ~!Dead("bssmgl02")
!Global("bsWorkingWithSmugglers","GLOBAL",1)
GlobalLT("bsSmugglerQuest","GLOBAL",40)
Global("bsSmugglersLeave","GLOBAL",1)
GlobalLT("bs_ReportSmugglersNashkel","GLOBAL",2)~ + @528 /* I would like to report a smuggler organization having their meeting point near here. */ + report_smuggler
+ ~Global("bsWorkingWithSmugglers","GLOBAL",1)
GlobalGT("bsSmugglerQuest","GLOBAL",0)
GlobalLT("bsSmugglerQuest","GLOBAL",40)
Global("bs_ReportSmugglersNashkel","GLOBAL",1)~ + @527 /* I would like to report a smuggler organization having their meeting point near here. Lieutenant Bardolan said I should talk to you about it. */ + report_smuggler
+ ~Global("bsWorkingWithSmugglers","GLOBAL",1)
GlobalGT("bsSmugglerQuest","GLOBAL",0)
GlobalLT("bsSmugglerQuest","GLOBAL",40)
GlobalLT("bs_ReportSmugglersNashkel","GLOBAL",2)~ + @528 /* I would like to report a smuggler organization having their meeting point near here. */ + report_smuggler
+ ~!Dead("bssmgl02")
Global("bsSmugglerQuest","GLOBAL",50)
GlobalLT("bs_ReportSmugglersNashkel","GLOBAL",2)~ + @528 /* I would like to report a smuggler organization having their meeting point near here. */ + report_smuggler
+ ~Global("bsWorkingWithSmugglers","GLOBAL",1)
GlobalGT("bsSmugglerQuest","GLOBAL",0)
GlobalLT("bsSmugglerQuest","GLOBAL",40)
GlobalLT("bs_ReportSmugglersNashkel","GLOBAL",2)~ + @529 /* (lie)You know, you won't find much when confronting smugglers unprepaired, and observation takes time and manpower. I could be your spy with them - I pretended I wanted to work with them. This way I could inform you when they are planning real heists, so you could catch them red-handed. */ DO ~IncrementGlobal("bs_Smugglerfriend","GLOBAL",1) SetGlobal("bs_ReportSmugglersNashkel","GLOBAL",2)
EraseJournalEntry(@100112)~ UNSOLVED_JOURNAL @100127 + collaboration
/* sell smuggler meeting point out later, PC still is still working for smugglers */
+ ~Global("bsWorkingWithSmugglers","GLOBAL",1)
GlobalGT("bs_ReportSmugglersNashkel","GLOBAL",1)~ + @530 /* I'll end my spying with the smugglers. If you want to take them out, you need to go to their meeting place, southwest of the lotus tent at the carnival. */ + sold_out_01

/* smugglers are gone */
/* PC never reported */
+ ~GlobalGT("bsSmugglerQuest","GLOBAL",39)
GlobalLT("bs_ReportSmugglersNashkel","GLOBAL",2)~ + @531 /* There was a smuggler organiszation working from Amn but they are gone for now. */ + smuggler_gone
/* PC was recruited but didn't report anything else */
+ ~GlobalGT("bsSmugglerQuest","GLOBAL",40)
GlobalGT("bs_ReportSmugglersNashkel","GLOBAL",1)~ + @532 /* The smuggler organiszation working from Amn are gone now. */ + smuggler_gone_01

/* Holger is dead */
/* box was found on dead Holger */
+ ~Dead("bssmgl02")
PartyHasItem("bssmq002")
GlobalLT("bs_ReportSmugglersNashkel","GLOBAL",54)~ + @533 /* There was a smuggler meeting point near here, southwest of the lotus tent at the Carneval. They are history now, though. I found this box with them. I think it is a delivery for an inn in Baldur's Gate. */ + first_box
/* box is not here */
+ ~Dead("bssmgl02")
!PartyHasItem("bssmq002")
GlobalLT("bs_ReportSmugglersNashkel","GLOBAL",54)~ + @534 /* There was a smuggler meeting point near here, southwest of the lotus tent at the Carneval. They are history now, though. */ + holger_dead

/* first quest - box of figs */
+ ~Global("bsWorkingWithSmugglers","GLOBAL",1)
PartyHasItem("bssmq002")
Global("bs_ReportSmugglersNashkel","GLOBAL",2)
Global("bs_first_box","LOCALS",0)~ + @535 /* The smugglers gave me this suspicious box here I'm supposed to bring to Baldur's Gate. It's a first test job, so I guess it would be best if I'd do this to get on their good side. I just wanted to let you know. */ DO ~SetGlobal("bs_first_box","LOCALS",1)~ + first_box
/* third quest: heavy box */
/* announce the 3rd quest */
+ ~Global("bsWorkingWithSmugglers","GLOBAL",1)
GlobalGT("bsSmugglerQuest","GLOBAL",2)
OR(2)
	PartyHasItem("bssmq004")
	GlobalLT("bsSmugglerQuest","GLOBAL",7)
Global("bs_ReportSmugglersNashkel","GLOBAL",2)~ + @536 /* I'm supposed to carry around a delivery to lure out Night Masks who target smuggling activities of Black Lotus, but I will bring it back to the smuggler lead afterwards. This might be a good opportunity to confront them in the act. */ + second_box
/* warn the sergeant that big box is empty */
+ ~Global("bsWorkingWithSmugglers","GLOBAL",1)
PartyHasItem("bssmq004")
OR(2)
	GlobalGT("bsSMQOpenedBox","GLOBAL",1)
	Global("bsSmugglerQuest","GLOBAL",11)
Global("bs_ReportSmugglersNashkel","GLOBAL",5)~ + @537 /* Good you're still here. Do not come to the smuggler place! The box is empty - there is nothing inside. It really was just bait for the Nght Masks. */ + second_box_05
/* 4th quest - ask for support */
+ ~Global("bs_PCHasCollaborationPass","MYAREA",0)
Global("bs_ReportSmugglersNashkel","GLOBAL",7)
!PartyHasItem("bssmq009")~ + @538 /* Would it now be possible to get something official to state that I am actually working for you? It would definitely make the retrieving of the smuggler item much easier. */ + official_pass_04
/* true */
+ ~Global("bsWorkingWithSmugglers","GLOBAL",1)
OR(2)
	Global("bsSmugglerQuest","GLOBAL",13)
	Global("bsSmugglerQuest","GLOBAL",14)
GlobalGT("bs_ReportSmugglersNashkel","GLOBAL",1)
GlobalLT("bs_ReportSmugglersNashkel","GLOBAL",7)~ + @539 /* (true) The next smuggler heist is up. I am supposed to get wares back from Baldur's Gate. I just wanted to let you know so you can get ready to bust the smugglers once I'll bring it back. */ DO ~EraseJournalEntry(@100115)
SetGlobal("bs_ReportSmugglersNashkel","GLOBAL",7)~ UNSOLVED_JOURNAL @100123 + fourth_quest
/* lie to get the cooperation pass */
+ ~Global("bsWorkingWithSmugglers","GLOBAL",1)
OR(2)
	Global("bsSmugglerQuest","GLOBAL",13)
	Global("bsSmugglerQuest","GLOBAL",14)
GlobalGT("bs_ReportSmugglersNashkel","GLOBAL",1)
GlobalLT("bs_ReportSmugglersNashkel","GLOBAL",7)~ + @540 /* (lie) The next smuggler heist is up. I am supposed to get wares back from Baldur's Gate and return them to teh smugglers. I just wanted to let you know and ask whether I can get your support in any way. */ DO ~EraseJournalEntry(@100115)
SetGlobal("bs_ReportSmugglersNashkel","GLOBAL",7)~ UNSOLVED_JOURNAL @100165 + fourth_quest
/* 4th quest - ready for action */
+ ~Global("bsWorkingWithSmugglers","GLOBAL",1)
PartyHasItem("bssmq005")
OR(2)
	Global("bsSmugglerQuest","GLOBAL",16)
	Global("bsSmugglerQuest","GLOBAL",17)
Global("bs_ReportSmugglersNashkel","GLOBAL",7)~ + @541 /* I am back from Baldur's Gate with the smuggler ware. I'll go and confront the smugglers now. Will you be there? */ DO ~SetGlobal("bs_ReportSmugglersNashkel","GLOBAL",8)
EraseJournalEntry(@100123)
EraseJournalEntry(@100165)~ UNSOLVED_JOURNAL @100118 + ready_to_bust
+ ~Global("bsWorkingWithSmugglers","GLOBAL",1)
PartyHasItem("bssmq005")
OR(2)
	Global("bsSmugglerQuest","GLOBAL",16)
	Global("bsSmugglerQuest","GLOBAL",17)
GlobalLT("bs_ReportSmugglersNashkel","GLOBAL",7)~ + @542 /* I am back from Baldur's Gate with smuggler ware. I'll go and confront the smugglers now. This is your chance to get them red-handed! */ DO ~EraseJournalEntry(@100123)
EraseJournalEntry(@100165)
SetGlobal("bs_ReportSmugglersNashkel","GLOBAL",8)~ UNSOLVED_JOURNAL @100118 + ready_to_bust
/* 4th quest - failed */
+ ~Global("bs_ReportSmugglersNashkel","GLOBAL",7)
OR(2)
	Global("bsSmugglerQuest","GLOBAL",18)
	Global("bsSmugglerQuest","GLOBAL",19)~ + @543 /* There won't be any smuggler bust - I'm sorry, it idn't went as planned in Baldur's Gate so I have nothing to hand over to the smugglers. */ + no_4th_quest
/* general questions */
+ ~Global("bs_sergeant","LOCALS",0)~ + @544 /* What is your status here? */ DO ~SetGlobal("bs_sergeant","LOCALS",1)~ + sergeant
+ ~Global("bs_in_nashkel","LOCALS",0)~ + @545 /* I didn't see you here before. Are you newly stationed to Nashkel? */ DO ~SetGlobal("bs_in_nashkel","LOCALS",1)~ + in_nashkel
++ @546 /* Good day to you. */ EXIT
END

IF ~~ THEN no_4th_quest
SAY @547 /* Alright, that's a pity. */
IF ~~ THEN DO ~EraseJournalEntry(@100123)
EraseJournalEntry(@100165)
SetGlobal("bs_ReportSmugglersNashkel","GLOBAL",9)~ EXIT
END

IF ~~ THEN holger_dead
SAY @548 /* The local smuggler threat is dealt with then, I take it. Thank you for the report, citizen. */
IF ~~ THEN DO ~EraseJournalEntry(@100112)
EraseJournalEntry(@100115)
EraseJournalEntry(@100117)
EraseJournalEntry(@100118)
EraseJournalEntry(@100122)
EraseJournalEntry(@100123)
EraseJournalEntry(@100125)
EraseJournalEntry(@100127)
EraseJournalEntry(@100165)
AddexperienceParty(1000)
GiveGoldForce(1000)
SetGlobal("bs_ReportSmugglersNashkel","GLOBAL",56)~ SOLVED_JOURNAL @100142 EXIT
END

IF ~~ THEN fourth_quest
SAY @549 /* Very good. Make sure you let us know once you return before you give anything compromising back to the smugglers so that we can confront them. */
+ ~Global("bs_PCHasCollaborationPass","MYAREA",0)~ + @550 /* Would it now be possible to get something official to state that I am actually working for you? It would definitely make the retrieving of the smuggler item much easier. It is inside the Seatower Barracks of all places. */ + official_pass_04
+ ~Global("bs_PCHasCollaborationPass","MYAREA",0)~ + @551 /* I'll be on my way. */ + bye
IF ~GlobalGT("bs_PCHasCollaborationPass","MYAREA",0)~ THEN EXIT
END

IF ~~ THEN second_box
SAY @552 /* Night Masks! So the scoundrel make life difficult for each other. What will the delivery be? */
++ @553 /* I don't know. */ + second_box_02
++ @554 /* Black Lotus - duh? */ + second_box_03
+ ~PartyHasItem("bssmq004")~ + @555 /* Do you want to take a look? */ + second_box_01
END

IF ~~ THEN second_box_01
SAY @556 /* I would, but I'm afraid it's best if we don't tamper with the box so as not to arouse suspicion. */
IF ~~ THEN + second_box_02
END

IF ~~ THEN second_box_02
SAY @557 /* Hmm, it could be Black Lotus, indeed, if it is supposed to be bait. */
IF ~~ THEN + second_box_03
END

IF ~~ THEN second_box_03
SAY @558 /* We can't help you against any Night Masks since this would look suspicious. */
IF ~~ THEN DO ~SetGlobal("bs_ReportSmugglersNashkel","GLOBAL",5)~ UNSOLVED_JOURNAL @100125 + ready_to_bust
END

IF ~~ THEN ready_to_bust
SAY @559 /* We will be there when you'll return to the smugglers with the wares. Let's finish this. */
IF ~~ THEN EXIT
END

IF ~~ THEN second_box_05
SAY @560 /* Good that you give me a warning! I'll wait with confronting the smugglers then. */
IF ~~ THEN DO ~SetGlobal("bs_ReportSmugglersNashkel","GLOBAL",6)
EraseJournalEntry(@100125)
EraseJournalEntry(@100117)~ UNSOLVED_JOURNAL @100115 EXIT
END

IF ~~ THEN first_box
SAY @561 /* Do you know what's inside? */
+ ~!Dead("bssmgl02")
Global("bsSMQOpenedBox","GLOBAL",0)~ + @562 /* No, it's a test. He didn't tell me on purpose. */ + first_box_03
+ ~!Dead("bssmgl02")
Global("bsSMQOpenedBox","GLOBAL",0)~ + @563 /* Not the slightest idea. */ + first_box_03
+ ~Dead("bssmgl02")
Global("bsSMQOpenedBox","GLOBAL",0)~ + @563 /* Not the slightest idea. */ + first_box_01
+ ~Global("bsSMQOpenedBox","GLOBAL",1)~ + @564 /* It's figs. */ + first_box_02
+ ~Global("bsSMQOpenedBox","GLOBAL",0)~ + @565 /* If I knew, I wouldn't have said "I have a box here", would I now? */ + first_box_01
++ @566 /* Does it matter? */ + first_box_01
END

IF ~~ THEN first_box_01
SAY @567 /* In this case you best inform our counterpart in Baldurs's Gate so they can catch the people involved when you hand it over! */
++ @568 /* Would it be possible to get something official to state that I am actually working for you? I feel reluctant to walk around with smuggler wares in my back pack. Approaching the Flaming Fist would also be a bit easier if they could see this is part of an official investigation. */ + official_pass
+ ~!Dead("bssmgl02")~ + @569 /* I think I can handle that. */ + bye
+ ~Dead("bssmgl02")~ + @569 /* I think I can handle that. */ + holger_dead
END

IF ~~ THEN first_box_02
SAY @570 /* Figs? */
IF ~~ THEN + first_box_01
END

IF ~~ THEN first_box_03
SAY @571 /* Opening this box here would indeed lead to nothing, since we can't prove it was handed to you by the smugglers. */
IF ~~ THEN + first_box_01
END

IF ~~ THEN sergeant
SAY @572 /* I am Sergeant Telmov. I make sure that our lieutenant's orders are carried out and I ensure the training and discipline of the men under our command. */
IF ~~ THEN EXIT
END

IF ~~ THEN in_nashkel
SAY @573 /* No, on the contrary. The calming of the bandit situation has made it possible for me to return here, I was previously on assignment. Now I'll have more time to address common criminals besides bandits. */
IF ~~ THEN EXIT
END

IF ~~ THEN report_smuggler
SAY @574 /* Smugglers, you say? We did notice some activity, but we weren't sure exactly where they were operating from. Despite the number of soldiers, we don't have the needed manpower to investigate every suspicious incident. */
+ ~!Global("bsWorkingWithSmugglers","GLOBAL",1)~ + @575 /* Their meeting point is southwest of the lotus tent at the carnival. There is usually someone there, disguised as a berry picker. He's the smuggler's contact. */ + sold_out
+ ~Global("bsWorkingWithSmugglers","GLOBAL",1)~ + @576 /* (true) I let myself be hired by them, but I only did so to be able to get more insight into their operations. I will keep you informed. */ DO ~IncrementGlobal("bs_Smugglerfriend","GLOBAL",-1)
SetGlobal("bs_ReportSmugglersNashkel","GLOBAL",2)
EraseJournalEntry(@100112)~ UNSOLVED_JOURNAL @100122 + collaboration
+ ~Global("bsWorkingWithSmugglers","GLOBAL",1)~ + @529 /* (lie)You know, you won't find much when confronting smugglers unprepaired, and observation takes time and manpower. I could be your spy with them - I pretended I wanted to work with them. This way I could inform you when they are planning real heists, so you could catch them red-handed. */ DO ~IncrementGlobal("bs_Smugglerfriend","GLOBAL",1) SetGlobal("bs_ReportSmugglersNashkel","GLOBAL",2)
EraseJournalEntry(@100112)~ UNSOLVED_JOURNAL @100127 + collaboration
++ @577 /* On second thought, I am not sure. I'll go now. */ + bye
END

IF ~~ THEN sold_out
SAY @578 /* Yes, it fits with other reports about suspicious activity we received. */
IF ~~ THEN + sold_out_01
END

IF ~~ THEN sold_out_01
SAY @579 /* If we can't catch them, we can at least make their operation much harder. Thank you for the report, citizen. */
IF ~~ THEN DO ~EraseJournalEntry(@824)
EraseJournalEntry(@825)
EraseJournalEntry(@826)
EraseJournalEntry(@827)
EraseJournalEntry(@828)
EraseJournalEntry(@829)
EraseJournalEntry(@830)
EraseJournalEntry(@832)
EraseJournalEntry(@833)
EraseJournalEntry(@834)
EraseJournalEntry(@835)
EraseJournalEntry(@838)
EraseJournalEntry(@100102)
EraseJournalEntry(@100103)
EraseJournalEntry(@100104)
EraseJournalEntry(@100105)
EraseJournalEntry(@100106)
EraseJournalEntry(@100107)
EraseJournalEntry(@100109)
EraseJournalEntry(@100110)
EraseJournalEntry(@100128)
EraseJournalEntry(@100131)
EraseJournalEntry(@100132)
EraseJournalEntry(@100144)
EraseJournalEntry(@100145)
EraseJournalEntry(@100147)
AddJournalEntry(@100120,QUEST_DONE)
EraseJournalEntry(@100112)
EraseJournalEntry(@100115)
EraseJournalEntry(@100117)
EraseJournalEntry(@100118)
EraseJournalEntry(@100122)
EraseJournalEntry(@100123)
EraseJournalEntry(@100125)
EraseJournalEntry(@100127)
EraseJournalEntry(@100165)
AddexperienceParty(1000)
GiveGoldForce(1000)
SetGlobal("bs_ReportSmugglersNashkel","GLOBAL",54)
SetGlobal("bsWorkingWithSmugglers","GLOBAL",2)
SetGlobal("bsSmugglerQuest","GLOBAL",52)~ SOLVED_JOURNAL @100113 EXIT
END

IF ~~ THEN smuggler_gone
SAY @580 /* Oh? News like these are music to my ears. */
IF ~~ THEN + smuggler_gone_02
END

IF ~~ THEN smuggler_gone_01
SAY @581 /* Usually, news like these are music to my ears, but in this case I was hoping we'd be able to see more acivity to catch them red-handed. */
IF ~~ THEN + smuggler_gone_02
END

IF ~~ THEN smuggler_gone_02
SAY @582 /* Very well, thank you for letting us know. */
IF ~~ THEN DO ~EraseJournalEntry(@100112)
EraseJournalEntry(@100115)
EraseJournalEntry(@100117)
EraseJournalEntry(@100118)
EraseJournalEntry(@100122)
EraseJournalEntry(@100123)
EraseJournalEntry(@100125)
EraseJournalEntry(@100127)
EraseJournalEntry(@100165)
AddexperienceParty(1000)
SetGlobal("bs_ReportSmugglersNashkel","GLOBAL",54)
SetGlobal("bsWorkingWithSmugglers","GLOBAL",2)
SetGlobal("bsSmugglerQuest","GLOBAL",52)~ SOLVED_JOURNAL @100142 EXIT
END
END //APPEND

CHAIN
IF ~~ THEN bssmgl14 collaboration
@583 /* You have proven yourself when freeing the mines. I will trust you on this one. For the time being, we will not take own action against the smugglers but wait for your reports when to hit them hard. You'll let me know if there will be any smuggling activity that we could use to catch them in the act. */
/* ## NPC reactions */
EXIT

APPEND bssmgl14

IF ~~ THEN official_pass
SAY @584 /* Hmm, some official document, you say? Look, I get where you are coming from, but you basically asked me to certify a smuggler operation. */
IF ~~ THEN + official_pass_01
IF ~!Dead("bssmgl02") CheckStatGT(Player1,17,CHR)~ THEN + official_pass_02
IF ~Dead("bssmgl02") CheckStatGT(Player1,17,CHR)~ THEN + official_pass_03
END

IF ~~ THEN official_pass_01
SAY @585 /* With due respect, but this won't happen. Be glad I let you walk with that box at all! */
IF ~!Dead("bssmgl02")~ THEN EXIT
IF ~Dead("bssmgl02")~ THEN + holger_dead
END

IF ~~ THEN official_pass_02
SAY @586 /* Hmm, but you do have a point there. If we can take out their middlemen this will help us in the end, too. */
IF ~~ THEN DO ~SetGlobal("bs_PCHasCollaborationPass","MYAREA",1)~ + official_pass_03
END

IF ~~ THEN official_pass_03
SAY @587 /* Fine. Here, take this - but if I hear you misused this in any form, I'll hunt you down just like I will the smugglers! */
IF ~!Dead("bssmgl02")~ THEN EXIT
IF ~Dead("bssmgl02")~ THEN + holger_dead
END

IF ~~ THEN official_pass_04
SAY @588 /* Hmm, I do admit that you are, in a way, an agent on a mission to our favor. */
IF ~~ THEN + official_pass_05
IF ~CheckStatGT(Player1,15,CHR)~ THEN DO ~SetGlobal("bs_PCHasCollaborationPass","MYAREA",2)~ + official_pass_03
END

IF ~~ THEN official_pass_05
SAY @589 /* It's still a bit much to ask - I still do not really know you, all I have is your word. I hope you understand that I don't see me handing out such a document to you yet. */
IF ~~ THEN EXIT
END

IF ~~ THEN bye
SAY @590 /* Good day, citizen. */
IF ~~ THEN EXIT
END
END //APPEND

CHAIN
IF WEIGHT #-1
~Global("bs_TakeBackSmugglingPass","MYAREA",1)~ THEN bssmgl14 take_back_pass
@591 /* I'll also take back the collaboration document. */
== bssmgl14 IF ~Global("bs_ReportSmugglersNashkel","GLOBAL",55)~ THEN @592 /* I'm not sure why I gave it you in the first place! */
END
IF ~~ THEN DO ~ActionOverride("bssmgl14",TakePartyItem("bssmq006"))
ActionOverride("bssmgl14",DestroyItem("bssmq006"))
EraseJournalEntry(@100114)
SetGlobal("bs_TakeBackSmugglingPass","MYAREA",2)~ EXIT



/* Bardolan is Lieutenant and captain-in-arms */
/* meeting in game: upon entering Nashkel. No sense in adding reply options about the smugglers here

bg1re: Bardolan encounter really only makes sense before Nashkel mines are cleared. I'll add no reply option there.
*/

/*
JAP: leaves Bardolan in Nashkel
@6    = ~But yes, what do you want to know?~
*/
%JAP_BARDOL_ONLY_SLASH%%JAP_BARDOL_ONLY_ASTERIKS%

EXTEND_BOTTOM BARDOL %bardol_jap_6%
+ ~!Dead("bssmgl02")
!Global("bsWorkingWithSmugglers","GLOBAL",1)
GlobalLT("bsSmugglerQuest","GLOBAL",40)
Global("bsSmugglersLeave","GLOBAL",1)
Global("bs_ReportSmugglersNashkel","GLOBAL",0)~ + @528 /* I would like to report a smuggler organization having their meeting point near here. */ DO ~SetGlobal("bs_ReportSmugglersNashkel","GLOBAL",1)~ + report_smuggler
+ ~Global("bsWorkingWithSmugglers","GLOBAL",1)
GlobalGT("bsSmugglerQuest","GLOBAL",0)
GlobalLT("bsSmugglerQuest","GLOBAL",40)
Global("bs_ReportSmugglersNashkel","GLOBAL",0)~ + @528 /* I would like to report a smuggler organization having their meeting point near here. */ DO ~SetGlobal("bs_ReportSmugglersNashkel","GLOBAL",1)~ + report_smuggler
END

APPEND BARDOL
IF ~~ THEN report_smuggler
SAY @593 /* That is good information. Go to the barracks and let Sergeant Telmov know, he'll discuss the details. */
IF ~~ THEN EXIT
END
END //APPEND

%JAP_BARDOL_ONLY_ASTERIKS%%JAP_BARDOL_ONLY_SLASH%



/* report the smugglers in Baldur's Gate. */
/* Manip Limmon (Manip = FF Sergeant)
SetGlobal("bs_ReportSmugglersToFF","GLOBAL",2) - disables reply options for Scar et al */

APPEND bssmgl15

IF ~NumTimesTalkedTo(0)
!AreaCheck("%NWBaldursGate_Helm&Cloak_L1%")~ THEN manip
SAY @594 /* Greetings. With the bridge down, we have more riffraff inside the city again. Good thing the reduced bandit activities made it possible that more mercenaries could return to headquarters. We will need them to handle the criminals trying their luck inside the Gates again. Do not hesitate to report any suspicious or illegal activities you witness. We will have our hands full, but the safety of the city comes first. */
IF ~~ THEN UNSOLVED_JOURNAL @100130 EXIT
IF ~GlobalGT("bs_CityKnowsBSTDoppel","GLOBAL",0)~ THEN UNSOLVED_JOURNAL @100130 + doppelganger_achievement
END

IF ~GlobalGT("bs_CityKnowsBSTDoppel","GLOBAL",0)
Global("bs_ManipNoticesPCsHelp","MYAREA",0)~ THEN doppelganger_achievement
SAY @595 /* Ah, you were the ones revealing the smuggler tunnels beneath the Seatower, were you not? In this case, if you know of any more smuggler activities, come to me at once! */
IF ~~ THEN DO ~SetGlobal("bs_ManipNoticesPCsHelp","MYAREA",1)~ EXIT
END
END //APPEND

CHAIN
IF ~OR(3)
	Global("bs_ReportSmugglersToFF","GLOBAL",6)
	GlobalTimerExpired("bs_ReportSmugglersToFF_T","GLOBAL")
	GlobalGT("bsSmugglerQuest","GLOBAL",39)
OR(2)
	Global("bs_ReportSmugglersToFF","GLOBAL",6)
	Global("bs_ReportSmugglersToFF","GLOBAL",4)
AreaCheck("%SWBaldursGate_FlamingFistHQ_L1%")~ THEN bssmgl15 cook_done
@596 /* Ah, <CHARNAME>. Here is your reward for reporting the cook's smuggler activities. This went rather well. Keep us informed! */
/* Manip Limmon will only give written confirmation if it is realistic that PC will still work with smugglers in Nashkel. This is a bit meta but I don't want to give players a critical item they can't use. i.e. for: 1st quest with figs did not fail, PC still works for smugglers. */
== bssmgl15 IF ~!Global("bsSMQAteFigs","GLOBAL",1)
!Global("bsSMQTooLate","GLOBAL",1)
Global("bs_ReportSmugglersToFF","GLOBAL",4)
Global("bsWorkingWithSmugglers","GLOBAL",1)~ THEN @597 /* I'll also add a confirmation about your help with this bust. I figure it could help securing the Nashkel Guard's support - and if the organizing smugglers are gone there, activities here will cease, too. */
/* ## NPC reactions */
END
IF ~~ THEN DO ~EraseJournalEntry(@100137)
EraseJournalEntry(@100138)
EraseJournalEntry(@100139)
GiveGoldForce(500)
SetGlobal("bs_ReportSmugglersToFF","GLOBAL",7)~ UNSOLVED_JOURNAL @100140 EXIT
IF ~!Global("bsSMQAteFigs","GLOBAL",1)
!Global("bsSMQTooLate","GLOBAL",1)
Global("bs_ReportSmugglersToFF","GLOBAL",4)
Global("bsWorkingWithSmugglers","GLOBAL",1)~ THEN DO ~GiveItemCreate("bssmq009",[PC],0,0,0)
EraseJournalEntry(@100138)
EraseJournalEntry(@100139)
GiveGoldForce(500)
SetGlobal("bs_ReportSmugglersToFF","GLOBAL",5)~ UNSOLVED_JOURNAL @100148 EXIT

APPEND bssmgl15

IF ~True()~ THEN report
SAY @598 /* Do you have anything to report? */
+ ~Global("bsWorkingWithSmugglers","GLOBAL",1)
GlobalGT("bsSmugglerQuest","GLOBAL",0)
GlobalLT("bsSmugglerQuest","GLOBAL",40)
GlobalLT("bs_ReportSmugglersToFF","GLOBAL",2)~ + @599 /* (true) I let myself be hired by smugglers operating in Baldur's Gate, but I only did so to be able to get more insight into their operations. I will keep you informed. */ DO ~IncrementGlobal("bs_Smugglerfriend","GLOBAL",-1)
SetGlobal("bs_ReportSmugglersToFF","GLOBAL",2)
EraseJournalEntry(@100130)~ UNSOLVED_JOURNAL @100133 + collaboration
+ ~Global("bsWorkingWithSmugglers","GLOBAL",1)
GlobalGT("bsSmugglerQuest","GLOBAL",0)
GlobalLT("bsSmugglerQuest","GLOBAL",40)
GlobalLT("bs_ReportSmugglersToFF","GLOBAL",2)~ + @529 /* (lie)You know, you won't find much when confronting smugglers unprepaired, and observation takes time and manpower. I could be your spy with them - I pretended I wanted to work with them. This way I could inform you when they are planning real heists, so you could catch them red-handed. */ DO ~IncrementGlobal("bs_Smugglerfriend","GLOBAL",1) SetGlobal("bs_ReportSmugglersToFF","GLOBAL",2)
EraseJournalEntry(@100130)~ UNSOLVED_JOURNAL @100135 + collaboration
/* PC has first sealed box (figs for cook) */
/* is working for Holger */
+ ~Global("bsWorkingWithSmugglers","GLOBAL",1)
PartyHasItem("bssmq002")
Global("bs_ReportSmugglersToFF","GLOBAL",2)~ + @600 /* I have this sealed box with smuggled wares I am supposed to bring to a cook in the Helm and Cloak Inn. */ + report_first_box
/* not working for Holger */
+ ~!Global("bsWorkingWithSmugglers","GLOBAL",1)
PartyHasItem("bssmq002")
GlobalLT("bs_ReportSmugglersToFF","GLOBAL",3)~ + @601 /* I have this sealed box with smuggled wares from smugglers I busted. I think it was supposed to go to the cook in the Helm and Cloak Inn. */ DO ~EraseJournalEntry(@100141)~ + report_first_box
+ ~Global("bs_ReportSmugglersToFF","GLOBAL",4)
	GlobalTimerNotExpired("bs_ReportSmugglersToFF_T","GLOBAL")~ + @733 /* ~How is the smuggler investigation in the Helm and Cloak inn coming along?~ */ + hel_and_cloack_still_pending
/* PC knows about second heist in BG (5th smuggler quest): transport box through the Seatower tunnels */
+ ~GlobalGT("bs_ReportSmugglersToFF","GLOBAL",1)
!Global("bs_ReportSmugglersToFF","GLOBAL",4)
GlobalLT("bs_ReportSmugglersToFF","GLOBAL",10)
GlobalLT("bs_ReportSmugglersToSeatower","GLOBAL",3)
OR(4)
	Global("bsSmugglerQuest","GLOBAL",13)
	Global("bsSmugglerQuest","GLOBAL",14)
	Global("bsSmugglerQuest","GLOBAL",21)
	Global("bsSmugglerQuest","GLOBAL",22)~ + @602 /* I have knowledge about a smuggler heist in the Seatower. */ + report_seatower
/* smugglers are gone */
/* PC never reported */
+ ~GlobalGT("bsSmugglerQuest","GLOBAL",39)
GlobalLT("bs_ReportSmugglersToFF","GLOBAL",2)
!PartyHasItem("bssmq002")~ + @531 /* There was a smuggler organiszation working from Amn but they are gone for now. */ DO ~SetGlobal("bs_ReportSmugglersToFF","GLOBAL",50)
AddexperienceParty(500)
EraseJournalEntry(@100130)
EraseJournalEntry(@100134)
EraseJournalEntry(@100135)~ SOLVED_JOURNAL @100136 + smuggler_gone
/* PC was recruited but didn't report anything else */
+ ~GlobalGT("bsSmugglerQuest","GLOBAL",39)
Global("bs_ReportSmugglersToFF","GLOBAL",2)~ + @532 /* The smuggler organiszation working from Amn are gone now. */ DO ~SetGlobal("bs_ReportSmugglersToFF","GLOBAL",50)
AddexperienceParty(500)
EraseJournalEntry(@100130)
EraseJournalEntry(@100134)
EraseJournalEntry(@100135)~ SOLVED_JOURNAL @100136 + smuggler_gone_01
/* after Helm and Cloak is done */
+ ~OR(2)
	Dead("bssmgl02")
	GlobalGT("bsSmugglerQuest","GLOBAL",39)
GlobalGT("bs_ReportSmugglersToFF","GLOBAL",5)
GlobalLT("bs_ReportSmugglersToFF","GLOBAL",50)~ + @532 /* The smuggler organiszation working from Amn are gone now. */ DO ~SetGlobal("bs_ReportSmugglersToFF","GLOBAL",50)
AddexperienceParty(300)
EraseJournalEntry(@100130)
EraseJournalEntry(@100134)
EraseJournalEntry(@100130)~ SOLVED_JOURNAL @100136 + smuggler_gone_02

/* PC knows about slave traders in Seatower */

+ ~GlobalGT("bsConfrontSlaveTraders","GLOBAL",0)
!Dead("bsslav01")
Global("bs_ReportSlaveTraders","MYAREA",0)~ + @603 /* I have knowledge of slave traders doing their business right from *inside* the Seatower! */ DO ~SetGlobal("bs_ReportSlaveTraders","MYAREA",1)~ + report_slavers

+ ~Global("bs_sergeant","LOCALS",0)~ + @544 /* What is your status here? */ DO ~SetGlobal("bs_sergeant","LOCALS",1)~ + sergeant_manip

++ @604 /* Noting at the moment. */ + bye
END

IF ~~ THEN hel_and_cloack_still_pending
SAY @734 /* ~We will bust them soon. Come back later to get your reward.~ */
IF ~~ THEN DO ~SetGlobalTimer("bs_ReportSmugglersToFF_T","GLOBAL",1)~ EXIT
END

IF ~~ THEN report_seatower
SAY @605 /* Hmm, this is Seatower territory. In this case, please report to the Captain of the Seatower Guard directly, so he can discuss the details with you. */
IF ~~ THEN DO ~SetGlobal("bs_ReportSmugglersToFF","GLOBAL",10)~ EXIT
END

IF ~~ THEN sergeant_manip
SAY @606 /* I am Manip Limmon. In case you're not familiar with the terminology, a manip is what you would call a sergeant in other military organizations. I am under direct command of our flame - our lieutenant - and help them command the fists - our soldiers. I was ordered to deal with gang delinquencies and organized illegal activities inside the Gates. */
IF ~~ THEN EXIT
END

IF ~~ THEN report_first_box
SAY @607 /* A smuggler delivery! What is inside? */
+ ~Global("bsSMQOpenedBox","GLOBAL",0)~ + @553 /* I don't know. */ + report_first_box_01
+ ~Global("bsSMQOpenedBox","GLOBAL",1)~ + @608 /* It's just figs... But they were smuggled, nontheless. */ + report_first_box_04
+ ~Global("bsWorkingWithSmugglers","GLOBAL",1)~ + @609 /* Actually, this is a test on which the smugglers will decide whether they'll trust me or not. I know this is hard to ask, but would you just turn a blind eye on this one and let me get a full member first? */ + report_first_box_07
+ ~Global("bsWorkingWithSmugglers","GLOBAL",1)~ + @610 /* Is there a way for you not to interfere in a way that my "mission" gets compromised? Like, let it seem like you got a tip from somewhere else and raiding the Helm and Cloak long after I'm gone? This way, I'll be able to deliver better interna in the long run. */ + report_first_box_07
END

IF ~~ THEN report_first_box_01
SAY @611 /* Knowing the contents would help evaluating the sincerity of this legal offence. */
++ @612 /* What are you implying? */ + report_first_box_04
++ @613 /* Smuggled goods is smuggled goods, no? */ + report_first_box_02
++ @614 /* There is no way of looking now without breaking the seal of this box. It could endanger the operation of catching the cook in the Helm and Cloak in the act. */ + report_first_box_03
+ ~Global("bsWorkingWithSmugglers","GLOBAL",1)~ + @609 /* Actually, this is a test on which the smugglers will decide whether they'll trust me or not. I know this is hard to ask, but would you just turn a blind eye on this one and let me get a full member first? */ + report_first_box_07
+ ~Global("bsWorkingWithSmugglers","GLOBAL",1)~ + @610 /* Is there a way for you not to interfere in a way that my "mission" gets compromised? Like, let it seem like you got a tip from somewhere else and raiding the Helm and Cloak long after I'm gone? This way, I'll be able to deliver better interna in the long run. */ + report_first_box_07
++ @615 /* Well, then let's have a look, shall we? */ + report_first_box_03
+ ~PartyHasItem("bssmq006")
!Global("bsWorkingWithSmugglers","GLOBAL",1)~ + @616 /* I do have an official Cooperation Pass from the Nashkel Guard, if that means anything. */ + report_first_box_09
END

IF ~~ THEN report_first_box_02
SAY @617 /* Of course! */
IF ~~ THEN + report_first_box_04
END

IF ~~ THEN report_first_box_03
SAY @618 /* Opening that would be bad for not raising suspicions before we go in, that much is sure. Hmm. */
IF ~~ THEN + report_first_box_04
END

IF ~~ THEN report_first_box_04
SAY @619 /* It's a difference whether we are talking about a rare and protected magical ingredient or something someone just smuggled to save a few gold coins. */
IF ~~ THEN + report_first_box_05
END

IF ~~ THEN report_first_box_05
SAY @620 /* But, I am *not* implying that there is instances where pursuing illegal activities would not be worth it! I was trying to estimate the scale of this transaction, which would determine the manpower I would need to deploy to disrupt it. */
++ @621 /* So, will you be there when I hand over the box? */ + report_first_box_06
+ ~Global("bsSMQOpenedBox","GLOBAL",1)
Global("bsWorkingWithSmugglers","GLOBAL",1)~ + @622 /* Seeing like I probably already compromised this test mission, the best thing we can do is to catch the cook in the Helm and Cloak, at least. */ + report_first_box_06
+ ~Global("bsSMQOpenedBox","GLOBAL",0)
Global("bsWorkingWithSmugglers","GLOBAL",1)~ + @609 /* Actually, this is a test on which the smugglers will decide whether they'll trust me or not. I know this is hard to ask, but would you just turn a blind eye on this one and let me get a full member first? */ + report_first_box_07
+ ~Global("bsSMQOpenedBox","GLOBAL",0)
Global("bsWorkingWithSmugglers","GLOBAL",1)~ + @610 /* Is there a way for you not to interfere in a way that my "mission" gets compromised? Like, let it seem like you got a tip from somewhere else and raiding the Helm and Cloak long after I'm gone? This way, I'll be able to deliver better interna in the long run. */ + report_first_box_07
+ ~Global("bsSMQOpenedBox","GLOBAL",1)
Global("bsWorkingWithSmugglers","GLOBAL",1)~ + @623 /* Is there a chance to leave me out of this? Like, raid the Helm and Cloak long after I am gone? */ + report_first_box_08
+ ~PartyHasItem("bssmq006")
!Global("bsWorkingWithSmugglers","GLOBAL",1)~ + @616 /* I do have an official Cooperation Pass from the Nashkel Guard, if that means anything. */ + report_first_box_09
END

IF ~~ THEN report_first_box_06
SAY @624 /* We will be there when you hand over the box. */
IF ~~ THEN DO ~SetGlobal("bs_ReportSmugglersToFF","GLOBAL",3)~ UNSOLVED_JOURNAL @100137 EXIT
END

IF ~~ THEN report_first_box_07
SAY @625 /* Hmm. Letting a report of an illegal action slide for the "greater good"? */
IF ~~ THEN + report_first_box_08
END

IF ~~ THEN report_first_box_08
SAY @626 /* And why would I do that? */
+ ~Global("bsSMQOpenedBox","GLOBAL",0)~ + @627 /* Like you just said - because you'll gain more in the long run by not "compromising" me now. */ + report_first_box_11
+ ~Global("bsSMQOpenedBox","GLOBAL",0)~ + @628 /* Just make sure the smugglers do not know it was *me* who reported them so they do not lose faith in me. I am all for the people at Helm and Cloak being responsible getting their proper punishment. */ + report_first_box_11
+ ~Global("bsSMQOpenedBox","GLOBAL",1)~ + @629 /* Just make sure the smugglers do not know it was *me* who reported them. I am all for the people at Helm and Cloak being responsible getting their proper punishment. */ + report_first_box_12
+ ~PartyHasItem("bssmq006")~ + @616 /* I do have an official Cooperation Pass from the Nashkel Guard, if that means anything. */ + report_first_box_09
+ ~Global("bsSMQOpenedBox","GLOBAL",1)~ + @630 /* I already gave you the hint. I have no interest in being involved in the punishment, you know. */ + report_first_box_10
++ @631 /* You are right, it's a bit much to ask and also rather suspicious, I guess. */ + report_first_box_06
END

IF ~~ THEN report_first_box_09
SAY @632 /* Let me see. Hmm. Yes, this means a lot. */
IF ~Global("bsWorkingWithSmugglers","GLOBAL",1)~ THEN + report_first_box_11
IF ~!Global("bsWorkingWithSmugglers","GLOBAL",1)~ THEN + report_first_box_06
END

IF ~~ THEN report_first_box_10
SAY @633 /* You won't be. */
IF ~~ THEN + report_first_box_06
END

IF ~~ THEN report_first_box_11
SAY @634 /* Fine, we will hold our horses until you are long out of sight. The cook at Helm and Cloak will not know it was you who gave us the information. Come after a week or so to collect your reward! */
IF ~~ THEN DO ~SetGlobal("bs_ReportSmugglersToFF","GLOBAL",4)~ UNSOLVED_JOURNAL @100138 EXIT
END

IF ~~ THEN report_first_box_12
SAY @635 /* You've already opened the box - do you really think they'd still trust you? */
IF ~~ THEN + report_first_box_06
END

IF ~~ THEN smuggler_gone
SAY @636 /* Alright, that's something I like to hear. */
IF ~~ THEN EXIT
END

IF ~~ THEN smuggler_gone_01
SAY @637 /* So now they're gone? It's a shame we couldn't find a way to catch them when they were still active, but it's still good to hear. */
IF ~~ THEN EXIT
END

IF ~~ THEN smuggler_gone_02
SAY @638 /* So now they're gone? Alright, that's something I like to hear. Thank you for your cooperation regarding this. We might have not been able to crush the full organization here inside the city, but you helped us identifying some of the structures. Farewell. */
IF ~~ THEN EXIT
END

IF ~~ THEN report_slavers
SAY @639 /* Hmm, I think I know who you are referring to. That would be Seatower Commander Airard's area of control. Let him know if you have any more details regarding this. I know he wants to convict the bastards. */
IF ~~ THEN EXIT
END

IF ~~ THEN bye
SAY @640 /* Move on, then. */
IF ~~ THEN EXIT
END

END //APPEND

CHAIN
IF ~~ THEN bssmgl15 collaboration
@641 /* Hmm, fine. You have made a name for yourself already, and I know Scar was looking for you. Keep me informed about any smuggler activities you'll know of. Busting them would be ideal but I also take hints regarding their customers. */
/* ## NPC reactions */
END
IF ~~ THEN + report



/* Dilos in FF HQ */

EXTEND_BOTTOM FLAMBG 0
+ ~!Dead("bssmgl02")
!Global("bsWorkingWithSmugglers","GLOBAL",1)
GlobalLT("bsSmugglerQuest","GLOBAL",40)
Global("bsSmugglersLeave","GLOBAL",1)
Global("bs_ReportSmugglersToFF","GLOBAL",0)~ + @642 /* I would like to report a smuggler organization from Amn operating in Baldur's Gate. */ DO ~SetGlobal("bs_ReportSmugglersToFF","GLOBAL",1)~ + report_smuggler
+ ~Global("bsWorkingWithSmugglers","GLOBAL",1)
GlobalGT("bsSmugglerQuest","GLOBAL",0)
GlobalLT("bsSmugglerQuest","GLOBAL",40)
Global("bs_ReportSmugglersToFF","GLOBAL",0)~ + @642 /* I would like to report a smuggler organization from Amn operating in Baldur's Gate. */ DO ~SetGlobal("bs_ReportSmugglersToFF","GLOBAL",1)~ + report_smuggler
END

CHAIN
IF ~~ THEN FLAMBG report_smuggler
@643 /* Ah. Our manip would be the right address for these sort of reports - Manip Limmon. She should be at the headquarters. */
== FLAMBG IF ~InMyArea("bssmgl15")~ THEN @644 /* She's right over there. */
EXIT

%BG1RE_NT_ONLY_SLASH%%BG1RE_NT_ONLY_ASTERIKS%
/* bg1re's guard Trevor ("Necromancer's Trouble") */
/* SAY  @270  ~What's your business here?~ */

EXTEND_BOTTOM c#q11wat %c#q11wat_270%
+ ~!Dead("bssmgl02")
!Global("bsWorkingWithSmugglers","GLOBAL",1)
GlobalLT("bsSmugglerQuest","GLOBAL",40)
Global("bsSmugglersLeave","GLOBAL",1)
Global("bs_ReportSmugglersToFF","GLOBAL",0)~ + @642 /* I would like to report a smuggler organization from Amn operating in Baldur's Gate. */ DO ~SetGlobal("bs_ReportSmugglersToFF","GLOBAL",1)~ + report_smuggler
+ ~Global("bsWorkingWithSmugglers","GLOBAL",1)
GlobalGT("bsSmugglerQuest","GLOBAL",0)
GlobalLT("bsSmugglerQuest","GLOBAL",40)
Global("bs_ReportSmugglersToFF","GLOBAL",0)~ + @642 /* I would like to report a smuggler organization from Amn operating in Baldur's Gate. */ DO ~SetGlobal("bs_ReportSmugglersToFF","GLOBAL",1)~ + report_smuggler
END

CHAIN
IF ~~ THEN c#q11wat report_smuggler
@643 /* Ah. Our manip would be the right address for these sort of reports - Manip Limmon. She should be at the headquarters. */
== c#q11wat IF ~InMyArea("bssmgl15")~ THEN @644 /* She's right over there. */
EXIT

%BG1RE_NT_ONLY_ASTERIKS%%BG1RE_NT_ONLY_SLASH%

/* Scar - will point to Manip Limmon */

EXTEND_BOTTOM SCAR 14
+ ~!Dead("bssmgl02")
!Global("bsWorkingWithSmugglers","GLOBAL",1)
GlobalLT("bsSmugglerQuest","GLOBAL",40)
Global("bsSmugglersLeave","GLOBAL",1)
Global("bs_ReportSmugglersToFF","GLOBAL",0)~ + @642 /* I would like to report a smuggler organization from Amn operating in Baldur's Gate. */ DO ~SetGlobal("bs_ReportSmugglersToFF","GLOBAL",1)~ + report_smuggler_14
+ ~Global("bsWorkingWithSmugglers","GLOBAL",1)
GlobalGT("bsSmugglerQuest","GLOBAL",0)
GlobalLT("bsSmugglerQuest","GLOBAL",40)
Global("bs_ReportSmugglersToFF","GLOBAL",0)~ + @642 /* I would like to report a smuggler organization from Amn operating in Baldur's Gate. */ DO ~SetGlobal("bs_ReportSmugglersToFF","GLOBAL",1)~ + report_smuggler_14
END

APPEND SCAR
IF ~~ THEN report_smuggler_14
SAY @645 /* Please report this detail to Manip Limmon. You should find her in the headquarters. I am eager to hear about your achievements. */
COPY_TRANS SCAR 14
END

END //APPEND

/* Before Scar wants to bring the PC to Duke Eltan */
EXTEND_BOTTOM SCAR 18
+ ~!Dead("bssmgl02")
!Global("bsWorkingWithSmugglers","GLOBAL",1)
GlobalLT("bsSmugglerQuest","GLOBAL",40)
Global("bsSmugglersLeave","GLOBAL",1)
Global("bs_ReportSmugglersToFF","GLOBAL",0)~ + @642 /* I would like to report a smuggler organization from Amn operating in Baldur's Gate. */ DO ~SetGlobal("bs_ReportSmugglersToFF","GLOBAL",1)~ + report_smuggler_18
+ ~Global("bsWorkingWithSmugglers","GLOBAL",1)
GlobalGT("bsSmugglerQuest","GLOBAL",0)
GlobalLT("bsSmugglerQuest","GLOBAL",40)
Global("bs_ReportSmugglersToFF","GLOBAL",0)~ + @642 /* I would like to report a smuggler organization from Amn operating in Baldur's Gate. */ DO ~SetGlobal("bs_ReportSmugglersToFF","GLOBAL",1)~ + report_smuggler_18
END

/* Before Scar comes to bring the PC to Duke Eltan (second state)*/
EXTEND_BOTTOM SCAR 23
+ ~!Dead("bssmgl02")
!Global("bsWorkingWithSmugglers","GLOBAL",1)
GlobalLT("bsSmugglerQuest","GLOBAL",40)
Global("bsSmugglersLeave","GLOBAL",1)
Global("bs_ReportSmugglersToFF","GLOBAL",0)~ + @642 /* I would like to report a smuggler organization from Amn operating in Baldur's Gate. */ DO ~SetGlobal("bs_ReportSmugglersToFF","GLOBAL",1)~ + report_smuggler_18 //same as 18
+ ~Global("bsWorkingWithSmugglers","GLOBAL",1)
GlobalGT("bsSmugglerQuest","GLOBAL",0)
GlobalLT("bsSmugglerQuest","GLOBAL",40)
Global("bs_ReportSmugglersToFF","GLOBAL",0)~ + @642 /* I would like to report a smuggler organization from Amn operating in Baldur's Gate. */ DO ~SetGlobal("bs_ReportSmugglersToFF","GLOBAL",1)~ + report_smuggler_18 //same as 18
END

/* some more intermediate dialogue */
EXTEND_BOTTOM SCAR 26
+ ~!Dead("bssmgl02")
!Global("bsWorkingWithSmugglers","GLOBAL",1)
GlobalLT("bsSmugglerQuest","GLOBAL",40)
Global("bsSmugglersLeave","GLOBAL",1)
Global("bs_ReportSmugglersToFF","GLOBAL",0)~ + @642 /* I would like to report a smuggler organization from Amn operating in Baldur's Gate. */ DO ~SetGlobal("bs_ReportSmugglersToFF","GLOBAL",1)~ + report_smuggler_26
+ ~Global("bsWorkingWithSmugglers","GLOBAL",1)
GlobalGT("bsSmugglerQuest","GLOBAL",0)
GlobalLT("bsSmugglerQuest","GLOBAL",40)
Global("bs_ReportSmugglersToFF","GLOBAL",0)~ + @642 /* I would like to report a smuggler organization from Amn operating in Baldur's Gate. */ DO ~SetGlobal("bs_ReportSmugglersToFF","GLOBAL",1)~ + report_smuggler_26
END

APPEND SCAR
IF ~~ THEN report_smuggler_18
SAY @646 /* Please report this detail to Manip Limmon. You should find her in the headquarters. Please come with me now. */
COPY_TRANS SCAR 18
END

IF ~~ THEN report_smuggler_26
SAY @647 /* Please report this detail to Manip Limmon. You should find her in the headquarters. Will you come with me now? */
COPY_TRANS SCAR 26
END

END //APPEND

EXTEND_BOTTOM SCAR 8
+ ~!Dead("bssmgl02")
!Global("bsWorkingWithSmugglers","GLOBAL",1)
GlobalLT("bsSmugglerQuest","GLOBAL",40)
Global("bsSmugglersLeave","GLOBAL",1)
Global("bs_ReportSmugglersToFF","GLOBAL",0)~ + @642 /* I would like to report a smuggler organization from Amn operating in Baldur's Gate. */ DO ~SetGlobal("bs_ReportSmugglersToFF","GLOBAL",1)~ + report_smuggler
+ ~Global("bsWorkingWithSmugglers","GLOBAL",1)
GlobalGT("bsSmugglerQuest","GLOBAL",0)
GlobalLT("bsSmugglerQuest","GLOBAL",40)
Global("bs_ReportSmugglersToFF","GLOBAL",0)~ + @642 /* I would like to report a smuggler organization from Amn operating in Baldur's Gate. */ DO ~SetGlobal("bs_ReportSmugglersToFF","GLOBAL",1)~ + report_smuggler
END

EXTEND_BOTTOM SCAR 31
+ ~!Dead("bssmgl02")
!Global("bsWorkingWithSmugglers","GLOBAL",1)
GlobalLT("bsSmugglerQuest","GLOBAL",40)
Global("bsSmugglersLeave","GLOBAL",1)
Global("bs_ReportSmugglersToFF","GLOBAL",0)~ + @642 /* I would like to report a smuggler organization from Amn operating in Baldur's Gate. */ DO ~SetGlobal("bs_ReportSmugglersToFF","GLOBAL",1)~ + report_smuggler
+ ~Global("bsWorkingWithSmugglers","GLOBAL",1)
GlobalGT("bsSmugglerQuest","GLOBAL",0)
GlobalLT("bsSmugglerQuest","GLOBAL",40)
Global("bs_ReportSmugglersToFF","GLOBAL",0)~ + @642 /* I would like to report a smuggler organization from Amn operating in Baldur's Gate. */ DO ~SetGlobal("bs_ReportSmugglersToFF","GLOBAL",1)~ + report_smuggler
END

APPEND SCAR
IF ~~ THEN report_smuggler
SAY @648 /* Please report this detail to Manip Limmon. You should find her in the headquarters. */
IF ~~ THEN EXIT
END

END //APPEND

/* guard in the Seatower Barracks */
BEGIN bssmgl16

IF ~Global("bs_PCWasAtTable","MYAREA",1)~ THEN caught
SAY @649 /* Hey! I see you meddling with the captain's personal stuff. This is definitely not for you! I'll take this and you'll get out of here *very* quickly! Be glad I'll let you live! */
+ ~PartyHasItem("bssmq006")~ + @650 /* Oh, what a bad misunderstanding! You see, I am in the middle of an investigation with regard to smuggler activities in the region. We received a hint that your captain fell prey to a dubious vendor - I was here to silently remove the incriminating evidence. See here, I have an official pass and all. */ + caught_06
+ ~!PartyHasItem("bssmq006")~ + @651 /* Oh, what a bad misunderstanding! You see, I am in the middle of an investigation with regard to smuggler activities in the region. We received a hint that your captain fell prey to a dubious vendor - I was here to silently remove the incriminating evidence. */ + caught_02
++ @652 /* Listen - I really need this vial of fragrance. Any chance we could settle this with a nice sum of gold? */ + caught_01
++ @653 /* Alright, alright - I'm off! */ + caught_01
END

IF ~~ THEN caught_01
SAY @654 /* Get out quickly before I decide that you're one of the scoundrels I'm supposed to protect the tower from! */
IF ~!GlobalLT("bs_Smugglerfriend","GLOBAL",0)~ THEN DO ~ReputationInc(-1)
EraseJournalEntry(@100104)
EraseJournalEntry(@100109)
SetGlobal("bsSmugglerQuest","GLOBAL",19)~ UNSOLVED_JOURNAL @100106 EXIT
IF ~GlobalLT("bs_Smugglerfriend","GLOBAL",0)~ THEN DO ~ReputationInc(-1)
EraseJournalEntry(@100104)
EraseJournalEntry(@100109)
SetGlobal("bsSmugglerQuest","GLOBAL",19)~ UNSOLVED_JOURNAL @100132 EXIT
END

IF ~~ THEN caught_02
SAY @655 /* Smugglers? */
IF ~~ THEN + caught_04
IF ~%BGT_VAR%
OR(2) Dead("Sarevok") GlobalGT("DukeThanks","GLOBAL",0)~ THEN + caught_03
IF ~GlobalGT("bsDoppelgangerQuest","GLOBAL",15)
!Global("bsDoppelgangerQuest","GLOBAL",19)
!Global("bsDoppelgangerQuest","GLOBAL",20)~ THEN + caught_03
END

IF ~~ THEN caught_03
SAY @656 /* Listen, I know what you did for this tower and this city. */
IF ~~ THEN + caught_05
END

IF ~~ THEN caught_04
SAY @657 /* You can't just come here and take stuff! But you sound honest enough. If this is true, this is serious matter. */
IF ~~ THEN + caught_05
END

IF ~~ THEN caught_05
SAY @658 /* I'll put this vial somewhere safe, and you go talk to our captain about this, alright? I can't just give it to you, I'm sure you'll understand. */
IF ~~ THEN DO ~SetGlobal("bsSmugglerQuest","GLOBAL",14)~ UNSOLVED_JOURNAL @100109 EXIT
END

IF ~~ THEN caught_06
SAY @659 /* This is from Amn! Hmm. If this is true, this is serious matter. */
IF ~~ THEN + caught_05
END

IF ~Global("bs_ItIsNight","MYAREA",1)~ THEN get_out
SAY @660 /* This is no place for you at this hour! Leave at once. */
IF ~~ THEN DO ~SetGlobal("bs_ItIsNight","MYAREA",2)
ActionOverride(Player1,LeaveAreaLUAPanic("ys0103","",[693.399],15))
ActionOverride(Player1,LeaveAreaLUA("ys0103","",[693.399],15))
ActionOverride(Player2,LeaveAreaLUA("ys0103","",[658.369],15))
ActionOverride(Player3,LeaveAreaLUA("ys0103","",[695.346],15))
ActionOverride(Player4,LeaveAreaLUA("ys0103","",[726.376],15))
ActionOverride(Player5,LeaveAreaLUA("ys0103","",[759.356],15))
ActionOverride(Player6,LeaveAreaLUA("ys0103","",[723.326],15))
MultiPlayerSync()~ EXIT
IF ~Global("bs_KickedOutOnce","MYAREA",0)~ THEN DO ~SetGlobal("bs_ItIsNight","MYAREA",2)
SetGlobal("bs_KickedOutOnce","MYAREA",1)
ActionOverride(Player1,LeaveAreaLUAPanic("ys0103","",[693.399],15))
ActionOverride(Player1,LeaveAreaLUA("ys0103","",[693.399],15))
ActionOverride(Player2,LeaveAreaLUA("ys0103","",[658.369],15))
ActionOverride(Player3,LeaveAreaLUA("ys0103","",[695.346],15))
ActionOverride(Player4,LeaveAreaLUA("ys0103","",[726.376],15))
ActionOverride(Player5,LeaveAreaLUA("ys0103","",[759.356],15))
ActionOverride(Player6,LeaveAreaLUA("ys0103","",[723.326],15))
MultiPlayerSync()~ JOURNAL @100108 EXIT
END
/* radom lines from setup.tra */
IF ~RandomNum(4,1)
!Global("bs_ItIsNight","MYAREA",1)~ THEN BEGIN 1
  SAY @1110
  IF ~~ THEN EXIT
END

IF ~RandomNum(4,2)
!Global("bs_ItIsNight","MYAREA",1)~ THEN BEGIN 2
  SAY @1111
  IF ~~ THEN EXIT
END

IF ~RandomNum(4,3)
!Global("bs_ItIsNight","MYAREA",1)~ THEN BEGIN 3
  SAY @1122
  IF ~~ THEN EXIT
END

IF ~RandomNum(4,4)
!Global("bs_ItIsNight","MYAREA",1)~ THEN BEGIN 4
  SAY @1097
  IF ~~ THEN EXIT
END


/* Ambassador, 5th smuggler quest */

BEGIN bssmgl17
IF ~!InMyArea("bssmgl19")
!InMyArea("bssmgl18")
Global("bsSmugglerQuest","GLOBAL",24)~ THEN out
SAY @661 /* What is this? I - I tried *so hard* not to let myself be known but this is just too much! Your colleague told me I should be really, really quiet for everything to go smoothly and yet, here I am! */
++ @662 /* Er... */ + out_02
++ @663 /* Who are you? */ + out_01
++ @664 /* You were in there of your own free will? */ + out_01
+ ~!Global("bsSMQOpenedBox","GLOBAL",5)~ + @665 /* You were inside the barrel? */ + out_01
+ ~Global("bsSMQOpenedBox","GLOBAL",5)~ + @666 /* Fear not! I saved you from inside that barrel, dear sir! */ + out_01
END

IF ~~ THEN out_01
SAY @667 /* Are you kidding me? */
IF ~~ THEN + out_02
END

IF ~~ THEN out_02
SAY @668 /* Great - just great. I spent a *whole* lot of gold to get out of town undetected, and now it's all for nothing! Here I am now, outside this barrel in gods know where. You will *not* get the second part of the fee, I tell you! */
+ ~Global("bsSMQOpenedBox","GLOBAL",5)~ + @669 /* Excuse me, I thought someone in there was in danger! */ + danger
++ @670 /* Why did you let yourself be smuggled out of the city? */ + ambassador
++ @671 /* So you are a criminal?! */ + criminal
++ @672 /* Wait, wait - I belong to the smugglers. Just get back in there and I'll bring you to the promised contact. You have my word! */ + out_03
++ @673 /* You want to just go now? After the effort you took to be in that barrel? */ + out_02
END

IF ~~ THEN out_03
SAY @674 /* Ah, it's not that easy - it never is. */
IF ~~ THEN + ambassador
END

IF ~~ THEN criminal
SAY @675 /* What? Whatch your mouth! Right now, *you* are the criminal here! */
IF ~~ THEN + ambassador
END

IF ~~ THEN danger
SAY @676 /* A-aHAHAhaha! */
IF ~~ THEN + ambassador
END

CHAIN
IF ~~ THEN bssmgl17 ambassador
@677 /* I guess it doesn't matter to tell you my motive. I am ambassador - ambassador from Crimmor. That is in Amn, in case you are not aware. I... am not fond of being in this city any more. Let's keep the reasons for that private, but I assure you they are not illegal or morally offensive. But to leave officially, I'd need to apply for discharge from my home authorities, there would be farewell ceremonies, I'd need to wait for my official replacement and introduce them appropriately... (sigh) So I bailed. Or, at least, I tried. (scoffs) */
== bssmgl17 IF ~!Dead("Sarevok")~ THEN @678 /* On top, current tensions between Baldur's Gate and Amn do not help with the overal situations. The city was even sealed until not so long ago. That is why I got into contact with you people in the first place. */
== bssmgl17 IF ~Global("bsSMQOpenedBox","GLOBAL",5)~ THEN @679 /* Please understand that I will no longer trust you with my onward journey after you opened the barrel contrary to the explicit agreements. */
== bssmgl17 @680 /* Well, I guess this is a sign from the gods that there is no easy way out of some responsibilities. (sigh) Thank you, I'll find my own way from here. */
END
IF ~~ THEN DO ~EraseJournalEntry(@100144)
EraseJournalEntry(@100145)
SetGlobal("bsSmugglerQuest","GLOBAL",25)~ UNSOLVED_JOURNAL @100146 EXIT
IF ~Global("bs_ReportSmugglersToSeatower","GLOBAL",6)~ THEN DO ~EraseJournalEntry(@100144)
EraseJournalEntry(@100145)
EraseJournalEntry(@100149)
AddJournalEntry(@100151,QUEST)
SetGlobal("bsSmugglerQuest","GLOBAL",25)
SetGlobal("bsSmugglerQuestTimer5","GLOBAL",1) // timer "expired"
~ UNSOLVED_JOURNAL @100146 EXIT

//smuggler contact for barrel transfer
BEGIN bssmgl18

IF ~!PartyHasItem("bssmq008")~ THEN no_barrel
SAY @681 /* Ho there! Where's the delivery? Make haste and get it! Tide is good for leaving. */
IF ~~ THEN EXIT
END

IF ~PartyHasItem("bssmq008")~ THEN barrel_delivery
SAY @682 /* Ah, here you are. And I see the barrel. */
IF ~~ THEN + barrel_delivery_01
IF ~Global("bs_ReportSmugglersToSeatower","GLOBAL",6)~ THEN + busted
END

IF ~~ THEN barrel_delivery_01
SAY @683 /* Let me take this off your hand. */
IF ~~ THEN DO ~SetGlobal("bsSmugglerQuest","GLOBAL",23)~ EXIT
END

IF ~~ THEN barrel_delivery_done
SAY @684 /* Your work here is done. Do not follow us! */
IF ~~ THEN DO ~EraseJournalEntry(@100144)
EraseJournalEntry(@100145)
SetGlobal("bsSmugglerQuest","GLOBAL",27)
~ UNSOLVED_JOURNAL @100150 EXIT
END

IF ~~ THEN busted
SAY @685 /* Let me take this off your... - wait! Soldiers! */
IF ~~ THEN DO ~SetGlobal("bs_ReportSmugglersToSeatower","GLOBAL",9)
ClearAllActions() StartCutSceneMode() StartCutScene("bscut018")~ EXIT
END

CHAIN
IF ~!InMyArea("bssmgl19")
InMyArea("bssmgl18")
Global("bsSmugglerQuest","GLOBAL",24)~ THEN bssmgl17 out_smuggler
@686 /* Ah, it's good to stretch my legs again. I wasn't sure it would really work to get away from my duties like this... Who are all these people? */
== bssmgl18 @687 /* Don't worry, they are just our muscle. They were leaving. */
END
++ @688 /* Er, yes, I am leaving. Good journey, sir. */ EXTERN bssmgl18 barrel_delivery_done
++ @665 /* You were inside the barrel? */ EXTERN bssmgl17 out_smuggler_01
++ @663 /* Who are you? */ EXTERN bssmgl17 out_smuggler_01
++ @689 /* Is Holger into Person smuggling now? */ EXTERN bssmgl17 out_smuggler_01

CHAIN
IF ~~ THEN bssmgl17 out_smuggler_01
@690 /* Why... are they posing questions? You guaranteed that I would leave the city completely incognito. */
== bssmgl18 @691 /* They are not. They were *leaving*. */
END
IF ~~ THEN EXTERN bssmgl18 barrel_delivery_done


BEGIN bssmgl19
/*-timer run out, barrel is gone. PC is back in bs1000 or bs1011: Tower Sergeant will appear and ask about smuggler bust. Rep -1. */
IF WEIGHT #-1
~Global("bs_ReportSmugglersToSeatower","GLOBAL",7)~ THEN failed
SAY @692 /* <CHARNAME>! What happened to the planned smuggler bust? We waited, but noone showed! You wasted our time, as it seems! */
+ ~Global("bsSMQOpenedBox","GLOBAL",5)~ + @693 /* No, I thought I am rescuing someone from inside the barrel, I swear! But then the whole operation blew apart. */ + failed_02
+ ~!Global("bsSMQOpenedBox","GLOBAL",5)~ + @694 /* I apologize. An important mission led me astray and I didn't have enough time. */ + failed_02
++ @695 /* I would have told the captain, but you beat me to it. */ + failed_01
+ ~!Global("bsSMQOpenedBox","GLOBAL",5)~ + @696 /* Woops, yeah, I'm not sure what happened there, either. */ + failed_01
END

IF ~~ THEN failed_01
SAY @697 /* Hmph, it's a failed mission then. You should take this more seriously! */
IF ~~ THEN DO ~ReputationInc(-1)
EraseJournalEntry(@100151)
SetGlobal("bs_ReportSmugglersToSeatower","GLOBAL",8)~ UNSOLVED_JOURNAL @100152 EXIT
END

IF ~~ THEN failed_02
SAY @698 /* Hmph, it's a failed mission then. Well, these things can happen. Let us know if you'll hear anything else. */
IF ~~ THEN DO ~EraseJournalEntry(@100151)
SetGlobal("bs_ReportSmugglersToSeatower","GLOBAL",8)~ UNSOLVED_JOURNAL @100152 EXIT
END

IF WEIGHT #-1
~Global("bs_ReportSmugglersToSeatower","GLOBAL",9)~ THEN tower_guard
SAY @699 /* You are arrested for trafficking and smuggling! The evidence is inside this barrel! */
IF ~~ THEN DO ~SetGlobal("bsSmugglerQuest","GLOBAL",23)~ EXIT
END

/* Transfer of barrel gets disrupted by the FF */
CHAIN
IF ~InMyArea("bssmgl19")
InMyArea("bssmgl18")
Global("bsSmugglerQuest","GLOBAL",24)~ THEN bssmgl17 out_ff
@700 /* Ah, it's good to stretch my legs... Wait - soldiers? That's... not going as planned, I see. */
== bssmgl19 @701 /* Oh, Ambassador! I was informed about your sudden leave, your note raised quite the commotion inside the palace. Were you in any kind of danger, sir? */
== bssmgl17 @702 /* What? No-nonono, no danger. I just... just wanted to return home. I apologize for the confusion I caused. I guess this is a sign from the gods that there is no easy way out of some responsibilities. (sigh) */
== bssmgl19 @703 /* We will accompany you back to the palace if you let us, sir. */
= @704 /* Well, this is not exactly the kind of smuggler wares I was hoping for, but we caught this man and his colleagues red handed. <CHARNAME>, come by the captain's office later to get your reward! */
END
IF ~~ THEN DO ~EraseJournalEntry(@100144)
EraseJournalEntry(@100145)
EraseJournalEntry(@100149)
AddJournalEntry(@100154,QUEST)
SetGlobal("bs_ReportSmugglersToSeatower","GLOBAL",10)
SetGlobal("bsSmugglerQuest","GLOBAL",26)~ UNSOLVED_JOURNAL @100153 EXIT

BEGIN bssmgl20
IF ~True()~ THEN soldier
SAY @705 /* I serve the Flaming Fist! */
IF ~~ THEN EXIT
END


/* Bonus quest: after Sarevok's death. Either in BG1 or SoD */
/* works with an own "Holger" cre */
BEGIN bssmglb2
IF ~GlobalGT("bsSmugglerQuestBonus","GLOBAL",0)
GlobalLT("bsSmugglerQuestBonus","GLOBAL",4)~ THEN hello_again
SAY @706 /* <CHARNAME>! It is good to see you again - and in such good standing, as it is. */
+ ~Global("bsReferToBSTSmugglers","GLOBAL",1)~ + @333 /* Thanks for the smuggler's greeting, Holger. It was nice to see a friendly face in those turbulent times. */ DO ~SetGlobal("bsReferToBSTSmugglers","GLOBAL",2)~ + smuggler_greeting
++ @707 /* Holger! Are you back at Baldur's gate now? */ + hello_again_01
++ @708 /* Do you have more smuggler quests for me? */ + hello_again_02
++ @709 /* Sorry, but I do not have time for you. */ + hello_again_04
END

IF ~~ THEN hello_again_01
SAY @710 /* I am, indeed. */
IF ~~ THEN DO ~SetGlobal("bs_hello_again_03","LOCALS",1)~ + hello_again_03
END

IF ~~ THEN hello_again_02
SAY @711 /* I do, indeed. */
IF ~~ THEN DO ~SetGlobal("bs_hello_again_03","LOCALS",1)~ + hello_again_03
END

IF ~~ THEN hello_again_03
SAY @712 /* I would have one thing I could use your help with. Seeing how you go in and out of the palace nowawadays - I could use your assistance with... *securing* a collaboration I'm currently forging. */
IF ~~ THEN + hello_again_06
END

IF ~~ THEN ruby_wine
SAY @713 /* Oh no, I'm not a man of inefficient little things, <CHARNAME>. Well, yes of *course* I am also interested in the Duke's private stash - but it is by no means my main interest. Plus, with your help, I'll actually secure unlimited access to it, among other things. */
IF ~~ THEN + hello_again_06
END

IF ~~ THEN smuggler_greeting
SAY @714 /* Appreciated. Yes, I was worried about seeing your likeness for bounty all over the place. But you found your way back into the city - and quite impressive, if I may say so! */
IF ~~ THEN + hello_again_03
IF ~Global("bs_hello_again_03","LOCALS",1)~ THEN + hello_again_06
END

IF ~~ THEN hello_again_04
SAY @715 /* Well, then see you around, I guess. */
IF ~~ THEN + hello_again_bye
END

IF ~~ THEN hello_again_05
SAY @716 /* Give this to a Flaming Fist guard inside the palace. His name is Bruce. As far as I know he should be on duty on the second floor. Just give it to him and tell him greetings from me. He'll know. */
IF ~~ THEN DO ~GiveItemCreate("bssmq010",[PC],0,0,0)
EraseJournalEntry(@100158)
SetGlobal("bsSmugglerQuestBonus","GLOBAL",4)~ UNSOLVED_JOURNAL @100160 EXIT
END

IF ~~ THEN hello_again_06
SAY @717 /* Can I count on you? */
+ ~Global("bsReferToBSTSmugglers","GLOBAL",1)~ + @333 /* Thanks for the smuggler's greeting, Holger. It was nice to see a friendly face in those turbulent times. */ DO ~SetGlobal("bsReferToBSTSmugglers","GLOBAL",2)~ + smuggler_greeting
+ ~GlobalGT("BD_SDD119_PLAY","GLOBAL",0)
Global("bs_ruby_wine","LOCALS",0)~ + @718 /* Do you want me to get ruby wine from the palace's cellar, too? */ DO ~SetGlobal("bs_ruby_wine","LOCALS",1)~ + ruby_wine
++ @719 /* Of course. What do you need me to do? */ + hello_again_05
++ @720 /* I'm sorry, I can't do that. */ + hello_again_04
END

IF ~Global("bsSmugglerQuestBonus","GLOBAL",4)~ THEN hello_again_waiting
SAY @721 /* It's always good to see you. */
IF ~~ THEN EXIT
END

IF ~Global("bsSmugglerQuestBonus","GLOBAL",5)~ THEN hello_again
SAY @722 /* I heard back from Bruce. Well done, <CHARNAME>. Shuck's "replacement" is installed, now I am fully back in business! */
IF ~~ THEN + hello_again_bye
END

IF ~~ THEN hello_again_bye
SAY @723 /* It's a real shame, <CHARNAME>, but you've become *too* famous to be a good smuggler. Well, at least for the kind of business I do. You should aim for bigger and more political coups if you want to stay in the trade. Again, it was a pleasure working with you, but this is farewell. You won't see me again, not if I'm as good at staying in the shadows as I always claim to be. Farewell. */
IF ~~ THEN DO ~EraseJournalEntry(@100158)
SetGlobal("bsSmugglerQuestBonus","GLOBAL",6)~ SOLVED_JOURNAL @100159 EXIT
IF ~Global("bsSmugglerQuestBonus","GLOBAL",5)~ THEN DO ~GiveGoldForce(1000)
AddexperienceParty(500)
EraseJournalEntry(@100158)
EraseJournalEntry(@100160)
EraseJournalEntry(@100161) SetGlobal("bsSmugglerQuestBonus","GLOBAL",7)
ActionOverride("bssmgl02",EscapeAreaDestroy(5))~ SOLVED_JOURNAL @100162 EXIT
END

BEGIN bssmgl21

IF ~StateCheck(Myself,STATE_CHARMED)
~ THEN BEGIN 1 // from:
  SAY @724 /* [BG:EE #7550]Move along friends, just make sure not to make any trouble. */
  IF ~~ THEN EXIT
END

IF ~PartyHasItem("bssmq010")~ THEN bribe
SAY @725 /* [BG:EE #7549]You there. Make sure you don't make any trouble. */
++ @726 /* I have this for you, with greetings from Holger. */ + bribe_01
++ @727 /* I'm on my way. */ EXIT
END

IF ~~ THEN bribe_01
SAY @728 /* Holger! What the... A-ahahaha! This is *brilliant*. I told him to impress me, and well - having you deliver me this, *here* of all places - yes, I am impressed. Tell him I'm in - actually, I can tell him myself. It's my break time now. See you around! */
IF ~~ THEN DO ~EraseJournalEntry(@100160)
SetGlobal("bsSmugglerQuestBonus","GLOBAL",5)
ActionOverride("bssmgl21",TakePartyItem("bssmq010"))
ActionOverride("bssmgl21",EscapeAreaDestroy(5))~ UNSOLVED_JOURNAL @100161 EXIT
END

IF ~!PartyHasItem("bssmq010")~ THEN no_bribe
SAY @725 /* [BG:EE #7549]You there. Make sure you don't make any trouble. */
IF ~~ THEN EXIT
END


APPEND bsslvmsg

IF ~OR(2)
Global("bsSmugglerQuestBonus","GLOBAL",1)
Global("bsSmugglerQuestBonus","GLOBAL",2)~ THEN message_bonus
SAY @729 /* Hey, I have a message for <CHARNAME>. Greetings from Holger - if you are available, please come and meet him in the Three Old Kegs.  */
IF ~~ THEN DO ~SetGlobal("bsSmugglerQuestBonus","GLOBAL",3) ActionOverride("bsslvmsg",EscapeAreaDestroy(5))~ UNSOLVED_JOURNAL @100158 EXIT
END
END //APPEND


/* easter egg: refer to the smugglers if meeting the smuggler in chapter 6/7
Global("bsWorkingWithSmugglers","GLOBAL",1)
*/

INTERJECT smuggl 1 bsReferToBSTSmugglers
== smuggl IF ~Global("bsWorkingWithSmugglers","GLOBAL",1)~ THEN @730 /* Well, *actually* I am here because we noticed you are in trouble. We won't let one of us stand in the rain, so Holger wants me to say 'hello'. */
END smuggl 8

I_C_T smuggl 2 bsReferToBSTSmugglers
== smuggl IF ~Global("bsWorkingWithSmugglers","GLOBAL",1)~ THEN @731 /* Well, I'm here because we noticed your troubles. We won't let one of us stand in the rain, no? I'm a smuggler, at your service, and Holger wants me to say 'hello'. */
END

I_C_T smuggl 3 bsReferToBSTSmugglers
== smuggl IF ~Global("bsWorkingWithSmugglers","GLOBAL",1)~ THEN @731 /* Well, I'm here because we noticed your troubles. We won't let one of us stand in the rain, no? I'm a smuggler, at your service, and Holger wants me to say 'hello'. */
END

/* EasterEgg in ToB: greetings from Holger from Amkethran's smuggler
only if PC helped approvingly */
I_C_T IF_FILE_EXISTS AMCARRAS 4 bs_ToBSmugglerGreeting
== AMCARRAS IF ~!Dead("bssmgl02")
Global("bsWorkingWithSmugglers","GLOBAL",1)
Global("bsSmugglerQuestBonus","GLOBAL",7)~ THEN @732 /* Oh, wait a minute. I think I know you from our associate, Holger. Rings a bell? He praised you to the skies for your big help in reinstating smuggling business in Baldur's Gate. Well, in this case I am even more inclined to make a you a god offer. */
END
