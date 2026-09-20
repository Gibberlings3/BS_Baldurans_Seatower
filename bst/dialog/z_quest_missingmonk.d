/* Missing monk quest - Smugglers in the Seatower quest */


/* Missing monk quest: Lenard misses his lover Martina */

BEGIN bslenard

IF ~Global("bsMissingMonk","GLOBAL",0)~ THEN lenard
SAY @0 /* You look like a person who gets around! I need someone willing to go on a small investigation for me. My... my loved one is missing, and I can't leave my post. Would you be willing to search for her? It's not far, just a quick lookaround in the city's north east whether anyone knows where she went. */
++ @1 /* Tell me more. */ + lenard_03
++ @2 /* No, I don't have time for that. */ + lenard_01
END

IF ~~ THEN lenard_01
SAY @3 /* Are you sure? You could just ask about her next time you'll be near the Ilmater Shrine near the Blushing Mermaid. */
++ @4 /* Fine, tell me more. */ + lenard_03
++ @5 /* Blushing Mermaid? Well, if you'll reward me so that I can afford a visit inside as well - why not. */ + lenard_03
++ @6 /* I said no. You need to look for someone else. */ + lenard_02
END

IF ~~ THEN lenard_02
SAY @7 /* Dang. It's not that important, I'm sure she's just helping the poor somewhere, as she usually does. Anyway, I need to resume my rounds. */
= @8 /* Oh, and I think the Seatower Commander is looking for you. Something about one of our prisoners who wants to talk to you. Best you go to the commander's office, it's on the tower's second floor. */
IF ~~ THEN DO ~SetGlobal("bsMissingMonk","GLOBAL",10)
ActionOverride("bslenard",EscapeArea())~ UNSOLVED_JOURNAL @799 EXIT
END

IF ~~ THEN lenard_03
SAY @9 /* Her name is Martina and she is a monk of the Ilmater Monastery here in the Tower. See... the captain doesn't approve of in-tower liaisons, it's not against any official rules but we all know he despises mingling of tower folks. So I'm a bit bound to keeping this low... I reported her missing already and the commander sent a comrade to investigate already, so anything I can do about this without deserting my post is done, I need an outsider to help. */
= @10 /* So, apparently Martina was seen at the Ilmater Shrine in north east Baldur's Gate before she left again, but that's now also over two week ago! The abbot thinks it's nothing uncommon and doesn't see a need for another search party. I know that Martina helps the poor wherever she finds them and that her duties as a monk of Ilmater means that she will stay and help wherever she see's people in need. It wouldn't be the first time that this has caused her absence for weeks at a time without notice. But this time it's been too long without any message to me, which is uncommon. */
= @11 /* I am quite desperate to hear any news. If you'd just go to the Ilmater Shrine in the north east of the town and ask about her whereabouts and whether she was seen after we searched for her, I would be really grateful and will give you a magical necklace I won in last year's sparring contest. */
++ @12 /* I'll do it. */ DO ~SetGlobal("bsMissingMonk","GLOBAL",1)~ UNSOLVED_JOURNAL @793 + lenard_04
++ @2 /* No, I don't have time for that. */ + lenard_02
END

IF ~~ THEN lenard_04
SAY @13 /* Thank you! Please let me know as soon as possible what you find out. I'll be around-not that I have a choice in the matter, haha. */
IF ~~ THEN EXIT
END

/* while investigating */
IF ~GlobalLT("bsMissingMonk","GLOBAL",3)~ THEN lenard_05
SAY @14 /* Thank you for looking into Martina's whereabouts. Let me know as soon as you know anything! */
IF ~OR(2) !Global("bsMissingMonk","GLOBAL",2) Global("bsGaveMoreHints","LOCALS",1)~ THEN EXIT
+ ~Global("bsMissingMonk","GLOBAL",2) Global("bsGaveMoreHints","LOCALS",0)~ + @15 /* Martina met a soldier on the first day of her round. This wasn't you I presume? */ + lenard_08
+ ~Global("bsMissingMonk","GLOBAL",2) Global("bsGaveMoreHints","LOCALS",0)~ + @16 /* Something came up. On her round to spread the alms, a beggar saw Martina go behind the Ilmater Shrine and a soldier of the Watch followed her in a suspicious manner. */ + lenard_08
+ ~Global("bsMissingMonk","GLOBAL",2) Global("bsGaveMoreHints","LOCALS",0)~ + @17 /* Well, someone is lying, either the beggar who saw Martina with a soldier the day she started giving the alms, or you about not seeing her since she left, or that partner you mentioned who also said he didn't see her that day. */ + lenard_08
+ ~Global("bsMissingMonk","GLOBAL",2) Global("bsGaveMoreHints","LOCALS",0)~ + @18 /* I'm on it. */ + lenard_04
END

/* once Martina's body is found */
IF ~Global("bsMissingMonk","GLOBAL",3)~ THEN lenard_06
SAY @19 /* Hello! I finally got a day off and could come look for myself. One of the beggars said he last saw her going here - with a soldier of the Seatower Guard no less?! From what he said this must have been my comrade, but... Is... is this... Martina?! */
++ @20 /* Lenard, I am very sorry. This seems to be Martina. */ + lenard_07
++ @21 /* You tell me. */ + lenard_07
++ @22 /* Who else would it be? */ + lenard_07
END

IF ~~ THEN lenard_07
SAY @23 /* She... she is... No... no, please, no... */
= @24 /* I... I feared as much, but I was hoping... Thank... thank you for finding her for me. Here is the necklace, as promised... I will take her back to the monastery and will tell about my comrade's suspicious involvement. Why would he...? (sigh) Come by the tower again, I am sure the abbot would like to talk to you, and maybe the Seatower Commander, as well. */
IF ~~ THEN DO ~SetGlobal("bsMissingMonk","GLOBAL",4) 
GiveItemCreate("%tutu_var%AMUL14",[PC],1,0,0)
EraseJournalEntry(@793)
EraseJournalEntry(@794)
EraseJournalEntry(@795)
EraseJournalEntry(@796)
ActionOverride("bslenard",EscapeArea())~ UNSOLVED_JOURNAL @797 EXIT
END

IF ~~ THEN lenard_08
SAY @25 /* A... a soldier of the Watch would have been with her? This is the day my comrade said he couldn't find her! This doesn't add up. Now I get a real bad feeling. */
= @26 /* He is on errands for the Captain outside of the tower currently, so I can't make him explain himself. Please, as pointless as it seems, go and see whether you'll find any more clues around the Ilmater Shrine. Gods, how I wished I could leave my post! */
IF ~~ THEN DO ~SetGlobal("bsGaveMoreHints","LOCALS",1)~ EXIT
END


/* %NEBaldursGate_IlmatersShrine% */
/* Beggar in Shrine of Ilmater */

APPEND BEGGBA

IF WEIGHT #-1
~AreaCheck("%NEBaldursGate_IlmatersShrine%") Global("bsMissingMonk","GLOBAL",1) Global("bsAskedMM","MYAREA",0)
GlobalLT("bsAskedMissingMonk","GLOBAL",2)~ THEN beggar_in_shrine
SAY @27 /* Please, if you will, good <SIRMAAM>. Spare a coin? */
++ @28 /* I'm looking for a monk of Ilmater who goes by the name Martina. Have you seen her lately? */ + beggar_in_shrine_01
+ ~PartyGoldGT(0)~ + @29 /* Sure, here you go. */ DO ~TakePartyGold(1)~ + beggar_in_shrine_02
++ @30 /* Not now. */ EXIT
END

IF ~~ THEN beggar_in_shrine_01
SAY @31 /* Martina? I know her alright, but I haven't seen her for quite a while. I wasn't here at the shrine until last week, though. Maybe ask others of my kind, as we do switch places from time to time. */
IF ~~ THEN DO ~SetGlobal("bsAskedMM","MYAREA",1)~ UNSOLVED_JOURNAL @794
EXIT
END

IF ~~ THEN beggar_in_shrine_02
SAY @32 /* Thank you very much kind <SIRMAAM>! */
++ @28 /* I'm looking for a monk of Ilmater who goes by the name Martina. Have you seen her lately? */ + beggar_in_shrine_01
++ @33 /* Farewell. */ EXIT
END

END //APPEND

BEGIN bsmm001

IF ~True()~ THEN beggar01
SAY @34 /* Hello! You wouldn't mind parting with a coin or two? */
+ ~Global("bsMissingMonk","GLOBAL",1) Global("bsAskedMissingMonk","GLOBAL",0)~ + @28 /* I'm looking for a monk of Ilmater who goes by the name Martina. Have you seen her lately? */ DO ~SetGlobal("bsAskedMissingMonk","GLOBAL",1)~ + beggar01_02
+ ~PartyGoldGT(0)~ + @29 /* Sure, here you go. */ DO ~TakePartyGold(1)~ + beggar01_01
++ @30 /* Not now. */ EXIT
END

IF ~~ THEN beggar01_01
SAY @35 /* Thank you for your generosity! */
+ ~Global("bsMissingMonk","GLOBAL",1) Global("bsAskedMissingMonk","GLOBAL",0)~ + @28 /* I'm looking for a monk of Ilmater who goes by the name Martina. Have you seen her lately? */ DO ~SetGlobal("bsAskedMissingMonk","GLOBAL",1)~ + beggar01_02
++ @36 /* Good day. */ EXIT
END

IF ~~ THEN beggar01_02
SAY @37 /* I know her, she's a good soul. Comes in irregular intervals and gives coins to all of us. She says her rounds need to be irregular or we would rely on them too much, the gods bless her. I haven't seen her for weeks, though. I was at the palace the last three weeks, and my comrade Blurt was here at the shrine, in case that matters. He's at the palace now, in case you want to ask him, too. */
IF ~~ THEN UNSOLVED_JOURNAL @795 EXIT
END


IF WEIGHT #-1
~GlobalGT("bsMissingMonk","GLOBAL",2) 
GlobalLT("bsMissingMonk","GLOBAL",5)
GlobalLT("bsAskedMM","MYAREA",2)~ THEN beggar02_09
SAY @38 /* What a shame to hear about Martina. I surely hope they'll get the bastard who did this! */ 
IF ~~ THEN DO ~SetGlobal("bsAskedMM","MYAREA",2)~ EXIT
END

IF WEIGHT #-1
~Global("bsMissingMonk","GLOBAL",5) GlobalLT("bsAskedMM","MYAREA",3)~ THEN beggar02_10
SAY @39 /* Ah, it's you again. Thank you for helping getting that bastard who killed Martina! Poor gal, she was such a good woman. */ 
IF ~~ THEN DO ~SetGlobal("bsAskedMM","MYAREA",3)~ EXIT
END



/* Beggar in front of palace */

BEGIN bsmm002

IF ~True()~ THEN beggar02
SAY @40 /* Greetings, good <LADYLORD>. Could ye spare but a bit of change? */
+ ~Global("bsMissingMonk","GLOBAL",1) Global("bsAskedMissingMonk","GLOBAL",1)~ + @28 /* I'm looking for a monk of Ilmater who goes by the name Martina. Have you seen her lately? */ DO ~SetGlobal("bsAskedMissingMonk","GLOBAL",2)~ + beggar02_02
+ ~PartyGoldGT(0)~ + @29 /* Sure, here you go. */ DO ~TakePartyGold(1) SetGlobal("bsGaveCoin","LOCALS",1)~ + beggar02_01
++ @30 /* Not now. */ EXIT
END

IF ~~ THEN beggar02_01
SAY @41 /* Thank ye yo much! */
+ ~Global("bsMissingMonk","GLOBAL",1) Global("bsAskedMissingMonk","GLOBAL",1)~ + @28 /* I'm looking for a monk of Ilmater who goes by the name Martina. Have you seen her lately? */ DO ~SetGlobal("bsAskedMissingMonk","GLOBAL",2)~ + beggar02_02
++ @42 /* Good day to you. */ EXIT
END

IF ~~ THEN beggar02_02
SAY @43 /* Funny you'd ask about her. Two weeks ago when I was begging in front of the Shrine of Ilmater, a soldier of the Seatower came asking about her, too. Turns out she spent more time collecting alms for the poor than anticipated and they got worried at the tower's monastery about her whereabouts. Well, she came with the gold, and I got my coin, may the gods bless her. */
= @44 /* I guess the soldier was her loved one she always tells about, since I saw them going behind the Ilmater's shrine shortly afterwards, heh. */
++ @45 /* They went behind the shrine? Together? */ + beggar02_03
++ @46 /* Wait a minute. It was not her lover who came investigating for her, as far as I know. */ + beggar02_04
++ @47 /* And this helps me how? */ + beggar02_05
END

IF ~~ THEN beggar02_03
SAY @48 /* Well, not "together" together, but close enough for me to notice, but it could have been a coincidence, now that I think of it. */
IF ~~ THEN + beggar02_04
END

IF ~~ THEN beggar02_04
SAY @49 /* Now that I think about it, I only saw Lenard later on when he was looking for her. I just assumed that the soldier who was with her earlier at the shrine was her lover. I hadn't given it much thought but now that I think about it, I'm beginning to wonder why the soldier spent so much time behind the shrine. I wonder what he was doing... maybe sleeping off a hangover? Heh. I haven't seen Martina since she spread the alms that day. Then again, I wasn't expecting to see her come around again anytime soon. */
++ @50 /* Your friends at the shrine say that they haven't received alms from Martina in a while now. */ + beggar02_06
++ @51 /* Thank you for your help. */ + beggar02_08
END

IF ~~ THEN beggar02_05
SAY @52 /* Sorry, it's all I can tell you. */
IF ~~ THEN + beggar02_04
END

IF ~~ THEN beggar02_06
SAY @53 /* You mean lime? He didn't get any alms from Martina when she visited? I didn't know that. Now that is odd. After doing handouts in front of the shrine she usually does her rounds here at the palace. So even with talking to that soldier lad she should have been by the palace not much later. She must have skipped going here that day. Well, her rounds are at irregular intervals. Now I'm even more glad I was at the shrine that day! */
++ @54 /* Either that or something happened. Have a good day. */ + beggar02_07
++ @51 /* Thank you for your help. */ + beggar02_08
END

IF ~~ THEN beggar02_07
SAY @55 /* Oh, that would be a shame, really. Martina is such a nice person. I surely hope she's alright. */
IF ~~ THEN + beggar02_08
END

CHAIN
IF ~~ THEN bsmm002 beggar02_08
@56 /* Have a good day, good <SIRMAAM>. */
== bsmm002 IF ~Global("bsGaveCoin","LOCALS",0)~ THEN @57 /* And I wouldn't mind a spare coin for my efforts, heh. */
END
IF ~~ THEN DO ~SetGlobal("bsMissingMonk","GLOBAL",2)~ UNSOLVED_JOURNAL @796 EXIT

APPEND bsmm002


IF WEIGHT #-1
~GlobalGT("bsMissingMonk","GLOBAL",2) 
GlobalLT("bsMissingMonk","GLOBAL",5)
 GlobalLT("bsAskedMM","MYAREA",2)~ THEN beggar01_03
SAY @58 /* You found Martina, have the gods mercy. I can't believe she was buried there all this time. The poor gal. */
IF ~~ THEN DO ~SetGlobal("bsAskedMM","MYAREA",2)~ EXIT
END


IF WEIGHT #-1
~Global("bsMissingMonk","GLOBAL",5) GlobalLT("bsAskedMM","MYAREA",3)~ THEN beggar01_04
SAY @59 /* We heard about Martina's murderer. May he rot in prison for all I care! To think I thought it's her loved one who snuck up to her... The world is an evil place. */
IF ~~ THEN DO ~SetGlobal("bsAskedMM","MYAREA",3)~ EXIT
END

END //APPEND
