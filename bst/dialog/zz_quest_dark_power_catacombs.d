/* "Dark Power in the Seatower Catacombs" */

/* King of the Restless Dead: dialogue in ysrsdead.d */
/* Abbot of the Ilmater Monastery: dialogue in bssatos.d */

/* "bscckey" - key to hidden door in catacombs */

/* Gerrit, the surviving monk. Is in chapel in Ilmater Monastery ys0123 [1084.305] */

BEGIN bsrsd01

IF ~GlobalLT("bsClearedCatacombs","GLOBAL",18)
GlobalLT("bs_toldstory","LOCALS",3)
Global("bs_TalkedToGerrit","MYAREA",0)~ THEN gerrit
SAY @0 /* Oh, I really hope everything will be alright! */
IF ~~ THEN DO ~SetGlobal("bs_TalkedToGerrit","MYAREA",1)~ + gerrit_00
END

IF ~GlobalLT("bsClearedCatacombs","GLOBAL",18)
GlobalLT("bs_toldstory","LOCALS",3)~ THEN gerrit_00
SAY @1 /* My poor brethren... */
+ ~Dead("bsrsd07")
Global("bs_knowsdeath","LOCALS",0)~ + @2 /* I am sorry, Gerrit, but both Muck and Fuller are dead. */ DO ~SetGlobal("bs_knowsdeath","LOCALS",1)~ + gerrit_09
+ ~!Dead("bsrsd07")
GlobalGT("bsClearedCatacombs","GLOBAL",6)
GlobalLT("bs_toldstory","LOCALS",3)~ + @3 /* We spoke to Fuller, and he told us about the ritual. You could have been a *little* more elaborate about what you and your brethren tried in there. The abbot had no idea, either! */ DO ~SetGlobal("bs_toldstory","LOCALS",3)~ + gerrit_07
+ ~GlobalGT("bsClearedCatacombs","GLOBAL",2) 
GlobalLT("bsClearedCatacombs","GLOBAL",6)
GlobalLT("bs_toldstory","LOCALS",2)~ + @4 /* We accepted to have a look inside the catacombs. The abbot mentioned you were the only one making it out. What exactly happened? */ DO ~SetGlobal("bs_toldstory","LOCALS",2)~ + gerrit_04
+ ~GlobalLT("bsClearedCatacombs","GLOBAL",3) Global("bs_toldstory","LOCALS",0)~ + @5 /* That doesn't sound good - what happened to your brethren? */ DO ~SetGlobal("bs_toldstory","LOCALS",1)~ + gerrit_01
++ @6 /* I'll leave you to your prayers. */ + gerrit_02
END

IF ~~ THEN gerrit_01
SAY @7 /* We... were facing a great evil, and could not tame it. Oh, my poor brethren, if only I knew what happened to them! */
++ @8 /* Any way I could help? */ + gerrit_03
++ @6 /* I'll leave you to your prayers. */ + gerrit_02
END

IF ~~ THEN gerrit_02
SAY @9 /* Go with Ilmater's blessing. */
IF ~~ THEN EXIT
END

IF ~~ THEN gerrit_03
SAY @10 /* Ilmater bless you for even suggesting, my friend. We had adventurers help clearing the catacombs before, but this time, only someone with high fighting prowess should go for our brethren... Talk to the abbot, he is the one to decide. */
IF ~Global("bsClearedCatacombs","GLOBAL",0)~ THEN UNSOLVED_JOURNAL @774 EXIT
IF ~GlobalGT("bsClearedCatacombs","GLOBAL",0)~ THEN EXIT
END

CHAIN
IF ~~ THEN bsrsd01 gerrit_04
@11 /* We-we went into the Inner Sanctum to do our cantations and to-to chant a blessing to pacify the Restless Spirits that usually wander the catacombs - when something went horribly wrong and a Great Evil manifested... We were swamped with skeletons, tried to fight them - until we realized we had no chance against the numbers, so we tried to escape. It was only outside that I realized that my two brethren did not make it out... */
== bsrsd01 IF ~Global("bsClearedCatacombs","GLOBAL",3)~ THEN @12 /* Muck had the key to the inner sanctum with him, and he and Fuller are still inside, their fate unknown to us... (moans) */
== bsrsd01 IF ~GlobalGT("bsClearedCatacombs","GLOBAL",4)
GlobalLT("bsClearedCatacombs","GLOBAL",6)~ THEN @13 /* Poor Muck had the key to the inner sanctum with him... Fuller is still inside, his fate unknown to us... (moans) */
END
++ @14 /* And you really don't know what the evil is that has manifested itself, or where it came from? */ + gerrit_05
++ @15 /* I know enough. */ + gerrit_06

APPEND bsrsd01
IF ~~ THEN gerrit_05
SAY @16 /* No, but I was the one who heard what it said. It-it called itself the protector of the Restless Dead, their "king" even, who commands them... apart from that, I really do not know. */
IF ~~ THEN DO ~SetGlobal("bs_KnowsKingOfTheDead","GLOBAL",1)~ UNSOLVED_JOURNAL @943 + gerrit_06
END

IF ~~ THEN gerrit_06
SAY @17 /* Thank you for looking inside!... Thank you so much. Ilmater shall bless you, and please find Muck and Fuller... */
IF ~~ THEN EXIT
END
END //APPEND

CHAIN 
IF ~OR(4)
	Global("bsClearedCatacombs","GLOBAL",18)
	Global("bsClearedCatacombs","GLOBAL",19)
	Global("bsClearedCatacombs","GLOBAL",20)
	Global("bsClearedCatacombs","GLOBAL",21)
InMyArea("bsrsd07")
!Dead("bsrsd07")
GlobalLT("bs_toldstory","LOCALS",3)~ THEN bsrsd01 gerrit_07
@18 /* I... I am *so* sorry! I was so afraid... There is no excuse for not telling sooner what we did, but I did not lie about not *knowing* what exactly happened. We thought we were chanting a protection blessing! */
== bsrsd01  IF ~!Dead("bsrsd07")~ THEN @19 /* Thank you for saving Fuller - and finding poor Muck. */
== bsrsd01  IF ~Global("bsClearedCatacombs","GLOBAL",32)
Dead("bsrsd07")~ THEN @20 /* Thank you for ... for finding poor Fuller and Muck. */
END
IF ~GlobalLT("bs_toldstory","LOCALS",3)~ THEN DO ~SetGlobal("bs_toldstory","LOCALS",3)~ + gerrit_final_1
IF ~GlobalGT("bs_toldstory","LOCALS",2)~ THEN + gerrit_final_1

APPEND bsrsd01
IF ~Global("bsClearedCatacombs","GLOBAL",32)
GlobalLT("bs_toldstory","LOCALS",4)~ THEN gerrit_08
SAY @21 /* You - you banned the great evil we so recklessly awakened. */
IF ~GlobalLT("bs_toldstory","LOCALS",3)~ THEN DO ~SetGlobal("bs_toldstory","LOCALS",4)~ + gerrit_07
IF ~Global("bs_toldstory","LOCALS",3)~ THEN DO ~SetGlobal("bs_toldstory","LOCALS",4)~ + gerrit_final_1
END

IF ~~ THEN gerrit_09
SAY @22 /* Oh no... My poor brethren. Thank you for ... for finding them. */
IF ~~ THEN + gerrit_07
END

IF ~Global("bsClearedCatacombs","GLOBAL",30)~ THEN gerrit_10
SAY @23 /* Ilmater be with you for your help. */
IF ~~ THEN EXIT
END

IF ~InMyArea("bsrsd07")
!Dead("bsrsd07")~ THEN gerrit_final
SAY @24 /* Thank you so much for saving Fuller. - And... and help cleaning up our mess... */
IF ~~ THEN EXIT
END

IF ~True()~ THEN gerrit_final_1
SAY @25 /* I need to repent for what I've done... */
IF ~~ THEN EXIT
END

END //APPEND


/* Fuller: monk in the inner catacombs */
BEGIN bsrsd07 /* Fuller */
/* Global("bs_RemoveMonks","MYAREA",1) */
IF ~GlobalLT("bsClearedCatacombs","GLOBAL",7)~ THEN fuller_00_0
SAY @26 /* Ilmater be blessed! I tried to fight them back and retrieve the scroll, but there is just too many... I apologize, I should start from the beginning. My brethren and I got hold of a scroll with Kelemvor's symbol. With all our knowledge, we were convinced that it was a blessing to give protection to this place, thinking it would give the Restless Dead peace. Instead, we awakened an undead entity that now declares our presence as intrusion and summons undead to "defend" the catacombs. I tried anything in my might to stop it but I am too weak to overcome its defenses. The only way is to retrieve the summoning scroll and ban it with it - the scroll still lies in the inner sanctum. */
= @27 /* Is... is that Muck lying on the ground over there? Oh, my poor brother... */
IF ~~ THEN + fuller_01
END

IF ~GlobalGT("bsTalkedToRestlessDead","GLOBAL",0)
GlobalLT("bsTalkedToRestlessDead","GLOBAL",10)
Global("bs_TalkAboutKotD","LOCALS",0)
AreaCheck("ys0119")~ THEN fuller_00_1
SAY @28 /* You could approach the inner sanctum without stirring any more skeletons! What happened? */
++ @29 /* We had a... chat with the restless dead in the catacombs. */ DO ~SetGlobal("bs_TalkAboutKotD","LOCALS",1)~ + greetings_13
++ @30 /* Yes, piece of cake. The entity showed itself to me, by the way. */ DO ~SetGlobal("bs_TalkAboutKotD","LOCALS",1)~ + greetings_13
++ @31 /* Whatever. What now? */ DO ~SetGlobal("bs_TalkAboutKotD","LOCALS",1)~ + fuller_01
END

IF ~~ THEN fuller_01
SAY @32 /* I will wait here at the entrance to the inner catacombs and make sure no skeleton makes its way into the mausoleum. */
IF ~~ THEN DO ~SetGlobal("bsClearedCatacombs","GLOBAL",7)
EraseJournalEntry(@941)
AddJournalEntry(@945,QUEST)
JumpToPoint([1351.976])
MoveToPoint([1351.976])
Face(5)~ UNSOLVED_JOURNAL @946 + fuller_01_a
END

IF ~GlobalGT("bsClearedCatacombs","GLOBAL",6)
GlobalLT("bsClearedCatacombs","GLOBAL",11)
GlobalLT("bsTalkedToRestlessDead","GLOBAL",10)~ THEN fuller_01_a
SAY @33 /* Please, retrieve the scroll so we can ban the great evil that manifested here. */
+ ~Global("bs_LogikCheck","LOCALS",0)~ + @34 /* Let me get this straight. You used a scroll you didn't properly understand, but you are sure the same scroll will get rid of the problem it created? */ DO ~SetGlobal("bs_LogikCheck","LOCALS",1)~ + fuller_02
+ ~PartyHasItem("bsrsd07")~ + @35 /* Here is the scroll. Now what? */ + fuller_03
++ @36 /* I'll come back later. */ EXIT
END

IF ~~ THEN fuller_02
SAY @37 /* Oh, we could *read* it alright. We just didn't *understand* what "Kelemvor's Protection" actually means. That it would not soothe the undead, but instead summon an entity that actively uses undead to protect the catacombs from "intruders". */
IF ~~ THEN EXIT
END

IF ~~ THEN fuller_03
SAY @38 /* It needs to be used to cast the banning. Anyone can do it with the scroll. I'll do it, if you hand it to me - I'll just need to get my brethren for backing. */
++ @39 /* You said you were swamped with skeletons when you tried to approach the inner sanctum - which didn't happen for me. I have a feeling this is something I should do. */ + fuller_07
++ @40 /* Let me hold on to it for now. I'll think about it. */ + fuller_04
++ @41 /* Take it. I'll leave it to you to perform the banning. */ + fuller_09
END

IF ~Global("bsClearedCatacombs","GLOBAL",11)
GlobalLT("bsTalkedToRestlessDead","GLOBAL",10)~ THEN fuller_04
SAY @42 /* Please, give the scroll to Abbot Guoremor if not to me - or, if you are inclined, you could use it yourself. */
IF ~GlobalLT("bsClearedCatacombs","GLOBAL",11)~ THEN DO ~SetGlobal("bsClearedCatacombs","GLOBAL",11)~ EXIT

+ ~Global("bsClearedCatacombs","GLOBAL",11)~ + @43 /* You said you were swamped with skeletons when you tried to approach the inner sanctum. I have a feeling this is something I should do. */ + fuller_07
+ ~Global("bsClearedCatacombs","GLOBAL",11)~ + @41 /* Take it. I'll leave it to you to perform the banning. */ + fuller_09
+ ~Global("bsClearedCatacombs","GLOBAL",11)~ + @36 /* I'll come back later. */ EXIT
END

IF ~~ THEN fuller_05
SAY @44 /* I am not surprised it is able to, seeing how it coordinated its attacks - just that it chose you to reveal itself, after everything I tried. */
++ @45 /* Don't take it personal. I guess it's just a coincidence. */ + fuller_06
++ @46 /* Maybe it doesn't like being drawn here. It was kind of annoyed about being disturbed. */ + fuller_08
+ ~Global("bsKnowBhaal","GLOBAL",1)~ + @47 /* Well, I know why, but it's not important now. */ + fuller_06
++ @31 /* Whatever. What now? */ + fuller_01
END

IF ~~ THEN fuller_06
SAY @48 /* You are right. We need to focus on what is important now. */
IF ~~ THEN + fuller_01
END

IF ~~ THEN fuller_07
SAY @49 /* I would be ever grateful if you do. */
++ @50 /* I'll ban the undead entity now. You get yourself to savety, you have done enough. */ + fuller_10
++ @51 /* I'll do it. Stay here. I'm sure there will be nasty surprises and I could use the help. */ + fuller_11
END

IF ~~ THEN fuller_08
SAY @52 /* I am really grateful the abbot sent you. */ 
IF ~~ THEN + fuller_01
END

IF ~~ THEN fuller_09
SAY @53 /* Thank you for all you've done. I'll go see the abbot now - to avow what we've done. I'll also take poor Muck along. Your work here is done, helpful adventurer. Please do not disturb the rest of the graves - I think we had enough restless undead for a day. */
IF ~~ THEN DO ~TakePartyItem("bsrsd07") DestroyItem("bsrsd07")
EraseJournalEntry(@941)  
EraseJournalEntry(@942) 
EraseJournalEntry(@943) 
EraseJournalEntry(@946)
EraseJournalEntry(@947)
SetGlobal("bsClearedCatacombs","GLOBAL",19) SetGlobal("bs_RemoveMonks","MYAREA",1)~ UNSOLVED_JOURNAL @948 EXIT
END

IF ~~ THEN fuller_10
SAY @54 /* Thank you. Thank you so much. I'll go see the abbot now - to avow what we've done. I'll also take poor Muck along. Please come into the monastery when you are done here. */
IF ~GlobalLT("bsTalkedToRestlessDead","GLOBAL",10)~ THEN DO ~EraseJournalEntry(@941)  
EraseJournalEntry(@942) 
EraseJournalEntry(@946)
SetGlobal("bsClearedCatacombs","GLOBAL",18) SetGlobal("bs_RemoveMonks","MYAREA",1) ClearAllActions() StartCutSceneMode() StartCutScene("bscut002")~ UNSOLVED_JOURNAL @949 EXIT
IF ~Global("bsTalkedToRestlessDead","GLOBAL",10)~ THEN DO ~EraseJournalEntry(@941)  
EraseJournalEntry(@942) 
EraseJournalEntry(@946)
SetGlobal("bsClearedCatacombs","GLOBAL",20) SetGlobal("bs_RemoveMonks","MYAREA",1) ClearAllActions() StartCutSceneMode() StartCutScene("bscut002")~ UNSOLVED_JOURNAL @950 EXIT
END

IF ~~ THEN fuller_11
SAY @55 /* Alright. I will be here, having your back. */
IF ~~ THEN DO ~EraseJournalEntry(@941)  
EraseJournalEntry(@942) 
EraseJournalEntry(@946)
SetGlobal("bsClearedCatacombs","GLOBAL",12)~ UNSOLVED_JOURNAL @949 EXIT
END

/* initiate dialogue after restless Dead was banned */
IF ~Global("bsTalkedToRestlessDead","GLOBAL",10)
AreaCheck("ys0119")~ THEN fuller_12
SAY @56 /* You did it! I could feel the power surge going through the catacombs. Well, and all the raised skeletons were a clear indication, too. I apologize for my bad humor. */
IF ~~ THEN + fuller_10
END

IF ~~ THEN greetings_13
SAY @57 /* Is that so! What exactly did you find? */
++ @58 /* A skeleton which proclaimed to be the ruler of the dead manifested in the inner sanctuary and said curious things about my father. */ + fuller_05
++ @59 /* There was a talking skeleton in the inner sanctuary. It itself can't be fought, though, it only sends its minions. */ + fuller_05
++ @31 /* Whatever. What now? */ + fuller_01
END

IF ~AreaCheck("ys0123")~ THEN fuller_14
SAY @60 /* Thank you so much for your help. */
IF ~~ THEN EXIT
END

///////////////////////////////////////////////////////////////////////
/* Scroll with Kelemvor's Symbol */
BEGIN bsrsds7

IF ~AreaCheck("ys0119") Global("bs_PCIsOverKRDTrigger","MYAREA",1)~ THEN BEGIN kelemvor_scroll_00
SAY @61 /* You look at the symbols on the scroll's page. The symbols arrange themselves to something you can read. */
++ @62 /* You focus on the scroll's magic, ready to reverse the spell that summoned the protector of the Restless Dead. */ + kelemvor_scroll_01
++ @63 /* You leave the scroll be. */ EXIT
END

IF ~~ THEN BEGIN kelemvor_scroll_01
SAY @64 /* You vocalize the banning spell. While doing so, the scroll crumbles to dust in your hands. */
IF ~~ THEN DO ~SetGlobal("bsTalkedToRestlessDead","GLOBAL",3) ClearAllActions() StartCutSceneMode() StartCutScene("bscut010")~ EXIT
END

IF ~OR(2)
	!AreaCheck("ys0119") 
	!Global("bs_PCIsOverKRDTrigger","MYAREA",1)~ THEN BEGIN kelemvor_scroll_02
SAY @65 /* You look at the symbols on the scroll's page. The symbols start moving, but they do not stop and they do not form anything you could read. It seems you are too far away to the summoned undead you are aiming to ban. */
IF ~~ THEN EXIT
END

///////////////////////////////////////////////////////////////////////
/* side quest: Lord Dlusker's Tomb Visit */

/* noble lady and son: approach PC after they step out of the monastery */
/* names in Mausoleum and Catacombs inspired by
https://forgottenrealms.fandom.com/wiki/Dlusker
https://forgottenrealms.fandom.com/wiki/Nobility_of_Baldur%27s_Gate */

BEGIN bsrsd02 /* Lady Dlusker */
BEGIN bsrsd03 /* Young Lord Dlusker */

IF ~GlobalLT("bs_LadyDluskersPlea","GLOBAL",2)~ THEN younglord_00
SAY @66 /* And who do we have here? */
IF ~GlobalGT("bs_LadyDluskersPlea","GLOBAL",0)
GlobalLT("bsClearedCatacombs","GLOBAL",4)~ THEN EXTERN bsrsd02 lady_02
IF ~Global("bs_LadyDluskersPlea","GLOBAL",0)~ THEN EXTERN bsrsd02 lady_00
IF ~Dead("bsrsd04")~ THEN EXTERN bsrsd02 lady_08
END

IF ~OR(2)
Global("bs_LadyDluskersPlea","GLOBAL",2)
Global("bs_LadyDluskersPlea","GLOBAL",3)~ THEN younglord_01
SAY @67 /* You heard my mother. */
IF ~!Dead("bsrsd04")~ THEN EXIT
IF ~Dead("bsrsd04")~ THEN EXTERN bsrsd02 lady_07
END

IF ~GlobalGT("bs_LadyDluskersPlea","GLOBAL",3)~ THEN younglord_02
SAY @68 /* I... I can't believe father is dead! Where will the needed gold come from now? */
IF ~~ THEN EXIT
END

CHAIN
IF ~Global("bs_LadyDluskersPlea","GLOBAL",0)
GlobalLT("bsClearedCatacombs","GLOBAL",4)
!Dead("bsrsd04")~ THEN bsrsd02 lady_00
@69 /* Hello there! Are you on your way into the mausoleum? */
== bsrsd03 IF ~!Class(LastTalkedToBy(Myself),MONK)
See("bsrsd03") !StateCheck("bsrsd03",CD_STATE_NOTVALID)~ THEN @70 /* Mother, look at them. They are not monks from the monastery, and also *surely* do not own a family tomb in the Seatower! */
== bsrsd03 IF ~Class(LastTalkedToBy(Myself),MONK)
See("bsrsd03") !StateCheck("bsrsd03",CD_STATE_NOTVALID)~ THEN @71 /* Mother, look at them. They might be monks, but I've never seen them at the monastery, and they also *surely* do not own a family tomb in the Seatower! */
== bsrsd02 IF ~See("bsrsd03") !StateCheck("bsrsd03",CD_STATE_NOTVALID)~ THEN @72 /* You are right, my dear - my bad. */
END
+ ~Global("bsClearedCatacombs","GLOBAL",3)~ + @73 /* As a matter of fact, I am. I got the key from the abbot and will have a look inside the catacombs. */ + lady_03
+ ~GlobalLT("bsClearedCatacombs","GLOBAL",3)~ + @74 /* Whether I go into the what? */ + lady_01
+ ~GlobalLT("bsClearedCatacombs","GLOBAL",3)~ + @75 /* So, this is the entrance to a mausoleum? */ + lady_05
++ @76 /* Watch your tone. */ + lady_04
++ @77 /* I need to get going. */ + lady_02

APPEND bsrsd02
IF ~~ THEN lady_01
SAY @78 /* Oh, don't worry, good <SIRMAAM>. */
IF ~~ THEN + lady_02
END

IF ~Global("bs_LadyDluskersPlea","GLOBAL",1)
!Dead("bsrsd04")~ THEN lady_02
SAY @79 /* Good day to you. */
IF ~GlobalLT("bsClearedCatacombs","GLOBAL",3)
GlobalGT("bs_LadyDluskersPlea","GLOBAL",0)~ THEN EXIT
+ ~Global("bsClearedCatacombs","GLOBAL",3)
Global("bs_LadyDluskersPlea","GLOBAL",1)~ + @80 /* I am now on my way into the mausoleum. I got the key from the abbot and will have a look inside the catacombs. */ + lady_03
+ ~Global("bsClearedCatacombs","GLOBAL",3)
Global("bs_LadyDluskersPlea","GLOBAL",1)~ + @77 /* I need to get going. */ EXIT
IF ~Global("bs_LadyDluskersPlea","GLOBAL",0)~ THEN DO ~SetGlobal("bs_LadyDluskersPlea","GLOBAL",1)~ EXIT
END

IF ~~ THEN lady_03
SAY @81 /* Is that so! In that case, good <SIRMAAM>, please keep an eye out for my husband, Lord Dlusker. He went inside to pay respects at our family tomb, but it took him an awful long time already and I fear something happened. */
+ ~See("bsrsd03") !StateCheck("bsrsd03",CD_STATE_NOTVALID)~ + @82 /* How did your husband get into there? The abbot said it is locked to public! */ EXTERN bsrsd03 younglord_03
++ @83 /* Seems like your husband got himself into trouble. I'll have a look out for him. */ + lady_06
++ @84 /* I can't promise anything. */ + lady_06
END

IF ~~ THEN lady_04
SAY @85 /* I apologize in case we offended you, <SIRMAAM>. */
+ ~Global("bsClearedCatacombs","GLOBAL",3)~ + @73 /* As a matter of fact, I am. I got the key from the abbot and will have a look inside the catacombs. */ + lady_03
+ ~GlobalLT("bsClearedCatacombs","GLOBAL",3)~ + @74 /* Whether I go into the what? */ + lady_01
+ ~GlobalLT("bsClearedCatacombs","GLOBAL",3)~ + @75 /* So, this is the entrance to a mausoleum? */ + lady_05
++ @77 /* I need to get going. */ + lady_02
END

IF ~~ THEN lady_05
SAY @86 /* It is indeed, and it also contains our family tomb. */
IF ~~ THEN + lady_02
END
END //APPEND

CHAIN
IF ~~ THEN bsrsd03 younglord_03
@87 /* Well, duh - we are not "the public", we *own* one of the tombs, you nitwit. */
== bsrsd02 @88 /* Hester, please! - Forgive us, good <SIRMAAM>, we are both quite anxious about Lord Dlusker's whereabouts. The abbot did alert us to problems in the catacombs, but my husband only went into the mausoleum. */
END
IF ~~ THEN EXTERN bsrsd02 lady_06


APPEND bsrsd02
IF ~Global("bs_LadyDluskersPlea","GLOBAL",2)
!Dead("bsrsd04")~ THEN lady_06
SAY @89 /* You'd do us a great favor, <SIRMAAM>. */
IF ~Or(2)
	GlobalGT("bs_LadyDluskersPlea","GLOBAL",1)
	Dead("bsrsd04")~ THEN EXIT
IF ~GlobalLT("bs_LadyDluskersPlea","GLOBAL",2)
!Dead("bsrsd04")~ THEN DO ~SetGlobal("bs_LadyDluskersPlea","GLOBAL",2)~ UNSOLVED_JOURNAL @931 EXIT
END

IF ~~ THEN lady_07
SAY @90 /* Hester, please! */
IF ~~ THEN + lady_08
END

IF ~Dead("bsrsd04")
GlobalLT("bs_LadyDluskersPlea","GLOBAL",4)~ THEN lady_08
SAY @91 /* Good <SIRMAAM>, we heard terrifying noises from within the mausoleum. Did you happen to have encountered my husband, Lord Dlusker, and can tell us about his wereabouts? */
++ @92 /* I indeed found him. I am afraid he is dead. */ DO ~SetGlobal("bs_LadyDluskersPlea","GLOBAL",4)~ + lady_09
++ @93 /* I'll talk to you later. */ DO ~SetGlobal("bs_LadyDluskersPlea","GLOBAL",3)~ + lady_06
END

IF ~Global("bs_LadyDluskersPlea","GLOBAL",4)~ THEN lady_09
SAY @94 /* My husband is d... dead? */
+ ~PartyHasItem("bsrsd04")~ + @95 /* See here? Your husband wanted to call on an ancestor, but the magic somehow backfired and turned him into a zombie. We had to kill him. */ DO ~SetGlobal("bs_LadyDluskersPlea","GLOBAL",5)~ + lady_10
+ ~Dead("bsrsd05")~ + @96 /* He, and your ancestor he tried to revive with a spell. Well, the ancestor was dead already, I figure, but now his apparition your husband summoned is dead, too. */ DO ~SetGlobal("bs_LadyDluskersPlea","GLOBAL",5)~ + lady_10
++ @93 /* I'll talk to you later. */ + lady_06
END
END //APPEND

CHAIN
IF ~~ THEN bsrsd02 lady_10
@97 /* He... he cast a spell on our family grave? Oh no, the fool, why would he do that! */
== bsrsd02 IF ~See("bsrsd03") !StateCheck("bsrsd03",CD_STATE_NOTVALID)~ THEN @98 /* What... what is this? Hester, did you know about this? */
== bsrsd03 IF ~See("bsrsd03") !StateCheck("bsrsd03",CD_STATE_NOTVALID)~ THEN @99 /* Well... Father hoped we would learn about the treasure our ancestor hinted about in his journal, had we only the chance to talk to him... */
END
+ ~Global("bs_OpenedDluskerTomb","GLOBAL",1)
See("bsrsd03") !StateCheck("bsrsd03",CD_STATE_NOTVALID)~ + @100 /* It seems the only treasure you'll get from your ancestor was what he took with him into his tomb. */ EXTERN bsrsd03 younglord_2_01
+ ~Global("bs_OpenedDluskerTomb","GLOBAL",1)~ + @101 /* Well, inside that grave waited a nasty surprise, I can tell you. */ + lady_12
+ ~Global("bs_OpenedDluskerTomb","GLOBAL",0)~ + @102 /* Well, judging from the sounds coming from within the tomb, *something* in there is very much ready to wander around, I reckon. */ UNSOLVED_JOURNAL @935 + lady_11

APPEND bsrsd03
IF ~~ THEN younglord_2_01
SAY @103 /* I do not like the sound of that! Did you plunder our family's grave?! */
+ ~Global("bs_TookGemDluskerTomb","GLOBAL",0)~ + @104 /* Of course not! */ EXTERN bsrsd02 lady_12
+ ~Global("bs_TookGemDluskerTomb","GLOBAL",0)~ + @105 /* Well, maybe I should have, considering your impertinent behavior! */ EXTERN bsrsd02 lady_12
+ ~Global("bs_TookGemDluskerTomb","GLOBAL",1)~ + @106 /* (lie) Of course not! */ EXTERN bsrsd02 lady_12
+ ~PartyHasItem("amul12") Global("bs_TookGemDluskerTomb","GLOBAL",1)~ + @107 /* I took a necklace out, but of course it is yours. */ EXTERN bsrsd02 lady_12
+ ~!PartyHasItem("amul12") Global("bs_TookGemDluskerTomb","GLOBAL",1)~ + @108 /* I took a necklace out, but it's gone now. Sorry. */ EXTERN bsrsd02 lady_12
+ ~Global("bs_TookGemDluskerTomb","GLOBAL",1)~ + @109 /* Well, I'm glad I did, considering your impertinent behavior! */ EXTERN bsrsd02 lady_12
++ @110 /* Young man, you need to watch your tone - this instant. */ EXTERN bsrsd02 lady_12
END
END //APPEND

APPEND bsrsd02
IF ~Global("bs_LadyDluskersPlea","GLOBAL",5)~ THEN lady_11
SAY @111 /* Please, good <SIRMAAM>, would you look into our family's tomb and make sure everything is alright? */
IF ~!Dead("bsrsd05")~ THEN EXIT
+ ~Dead("bsrsd05")
See("bsrsd03") !StateCheck("bsrsd03",CD_STATE_NOTVALID)~ + @100 /* It seems the only treasure you'll get from your ancestor was what he took with him into his tomb. */ EXTERN bsrsd03 younglord_2_01
+ ~Dead("bsrsd05")~ + @101 /* Well, inside that grave waited a nasty surprise, I can tell you. */ + lady_12
END
END //APPEND

CHAIN
IF ~Global("bs_LadyDluskersPlea","GLOBAL",6)~ THEN bsrsd02 lady_12
@112 /* We are so grateful for your help. Please, I beg you to hand to us whatever you found inside the grave of our ancestors. We are in dire need of financial support, and with my husband gone, I... I... (moans) */
== bsrsd02 IF ~PartyHasItem("bsrsd04")~ THEN @113 /* I see my husbands journal on you - I'll take this right out of your hands, and please forgive me for being so bold. */ DO ~TakePartyItem("bsrsd04")~
== bsrsd02 IF ~Global("bs_OfferedMagicItems","LOCALS",0)~ THEN @114 /* If there was anything magical on my husband, please feel free to keep it - as a reward of sorts. With my husband gone, I do not have any use for it, we can't sell it without everyone knowing about our dire situation - and I really, really do not want to posess anything that lead to this desaster. */ DO ~SetGlobal("bs_OfferedMagicItems","LOCALS",1)~
END
+ ~Global("bs_TookGemDluskerTomb","GLOBAL",0)~ + @115 /* Of course. I didn't touch the tomb's contents, it's all still there. */ DO ~SetGlobal("bs_TookGemDluskerTomb","GLOBAL",2)~ + lady_13
+ ~PartyHasItem("amul12") Global("bs_TookGemDluskerTomb","GLOBAL",1)~ + @116 /* Of course. Here is the family necklace from the tomb. */ DO ~ActionOverride("bsrsd02",TakePartyItemNum("amul12",1)~ + lady_13
+ ~!PartyHasItem("amul12") Global("bs_TookGemDluskerTomb","GLOBAL",1)~ + @117 /* Let me come back soon with all I could find. */ DO ~SetGlobal("bs_LadyDluskersPlea","GLOBAL",6)~ + lady_06
++ @118 /* Good lady, I fought a zombie *and* a wraith in your name. I guess a little compensation is more than justified. I'll keep whatever treasure there was. */ + lady_14

APPEND bsrsd02
IF ~~ THEN lady_13
SAY @119 /* Thank you. Thank you *so* much. I hope whatever my husband had on him will be enough to compensate you for your efforts - and to buy your silence about what happened here. */
IF ~~ THEN SOLVED_JOURNAL @936 + lady_15
END

IF ~~ THEN lady_14
SAY @120 /* Oh no - I... I see your point, but this is most unfortunate. Thank you, <SIRMAAM>, nontheless. You had compensation for your efforts enough, I would wager. Oh, what has this world become. */
IF ~~ THEN DO ~ReputationInc(-1)~ SOLVED_JOURNAL @937 + lady_15
END

IF ~~ THEN lady_15
SAY @121 /* Come, Hester. Let us close this chapter as soon as possible. */
IF ~~ THEN DO ~AddExperienceParty(500)
EraseJournalEntry(@931)
EraseJournalEntry(@932)
EraseJournalEntry(@933)
EraseJournalEntry(@934)
EraseJournalEntry(@935)
SetGlobal("bs_LadyDluskersPlea","GLOBAL",7)~ EXIT
END
END //APPEND

///////////////////////////////////////////////////////////////////////////////
/* Dialogue for interaction with bed in Ilmater Monastery */

BEGIN bsrsd08
IF ~True()~ THEN bed
SAY @122 /* The bed is freshly made and ready to use. */
++ @123 /* You fold it down and put yourself to bed for a full night's sleep (8 hours). */ DO ~SetGlobal("bs_TalkToPC","LOCALS",1) RestParty()~ EXIT 
++ @124 /* You spend the time until midnight. */ DO ~DayNight(MIDNIGHT) SetGlobal("bs_TalkToPC","LOCALS",1) StartMovie("RESTINN")~ EXIT  
++ @125 /* You spend the time until eleven at night. */ DO ~DayNight(23) SetGlobal("bs_TalkToPC","LOCALS",1) StartMovie("RESTINN")~ EXIT  
++ @126 /* You spend the time until midday. */ DO ~DayNight(NOON) SetGlobal("bs_TalkToPC","LOCALS",1) StartMovie("RESTINN")~ EXIT  
++ @127 /* You spend the time until eleven at noon. */ DO ~DayNight(11) SetGlobal("bs_TalkToPC","LOCALS",1) StartMovie("RESTINN")~ EXIT  
++ @128 /* You spend the time until ten at noon. */ DO ~DayNight(10) SetGlobal("bs_TalkToPC","LOCALS",1) StartMovie("RESTINN")~ EXIT 
++ @129 /* You spend the time until dawn starts (6 am). */ DO ~DayNight(DAWN_START) SetGlobal("bs_TalkToPC","LOCALS",1) StartMovie("RESTINN")~ EXIT  
++ @130 /* You spend the time until dawn ends (7 am). */ DO ~DayNight(DAWN_END) SetGlobal("bs_TalkToPC","LOCALS",1) StartMovie("RESTINN")~ EXIT  
++ @131 /* You spend the time until dusk starts (9 pm). */ DO ~DayNight(DUSK_START) SetGlobal("bs_TalkToPC","LOCALS",1) StartMovie("RESTINN")~ EXIT  
++ @132 /* You spend the time until dusk ends (10 pm). */ DO ~DayNight(DUSK_END) SetGlobal("bs_TalkToPC","LOCALS",1) StartMovie("RESTINN")~ EXIT      
++ @133 /* You leave the bed be. */ DO ~SetGlobal("bs_TalkToPC","LOCALS",1)~ EXIT
END

///////////////////////////////////////////////////////////////////////////////
