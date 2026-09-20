/* Dialogues of prisoners in Seatower Prison ys0106 */

/*
> [Zelle 6 - Zelle direkt bei Wachen] Ein Pyromane / Magier, der vor vielen Jahren durch seine Zauber einen großen Stadtbrand ausgelöst hat
Bettleranimation
*/
BEGIN bspris01

CHAIN
IF ~NumTimesTalkedTo(0)~ THEN bspris01 pyromaniac
@0 /* Ah, a new face! You look kinder than those cold guards. Dear <PRO_SIRMAAM>, you wouldn't have anything for me to warm me up? It is so cold and damp in this place. Just a small thing so I could make a little fire here on the stones... */
== bsprgrd2 IF ~InMyArea("bsprgrd2") !StateCheck("bsprgrd2",CD_STATE_NOTVALID)~ THEN @1 /* Do not listen to that man. He's a pyromaniac who burned down half the lower city. He's in here because he would do it again. He won't get his hands on any flammable substances ever again. */
== bspris01 @2 /* Just something really small. A toothpick would do! I already burnt all my hair... */
EXIT

APPEND bspris01
IF ~RandomNum(3,1)~ THEN pyromaniac_01
SAY @3 /* Just a tiny little thing I could burn? Noone would know! */
IF ~~ THEN EXIT
END

IF ~RandomNum(3,2)~ THEN pyromaniac_02
SAY @4 /* See the flames, the flames! */
IF ~~ THEN EXIT
END

IF ~RandomNum(3,3)~ THEN pyromaniac_03
SAY @5 /* I miss the light, the bright flames, the heat - and the screams! */
IF ~~ THEN EXIT
END
END //APPEND


/*
> [Zelle 5 - ganz rechts im Gang] The Amnish spy is a female assassin who will try to beguile the party. She will use all her charms trying to talk the party into helping her escape. If Safana is with the party, she will see through this type of ruse (like sees through like). If the party agrees, she will laugh at them and escape the area. If not, she will no longer be there when the party returns anyway, having picked the lock herself. She will later be found in the Iron Throne (ar0614 or thereabouts), spying or conspiring with them. She'll be fully armed at this point, a formidible opponent.
ar0614 [1076.492]
-Wenn sie im Gefängnis vor dem 2. Besuch im Eisenthron getroffen wird, dann taucht sie als Gegner im Eisenthron auf.
Wenn später, dann kommt nur der 1. Dialog und sie ist nach 5 Tagen weg.
*/
BEGIN bspris02
IF ~Global("bs_PrisonAmnishSpy","GLOBAL",0)~ THEN prison
SAY @6 /* How about you remove my shackles - it would give me the freedom to *move* in a way to show you my gratitude, handsome. */
++ @7 /* Who are you? */ + prison_05
++ @8 /* What are you suggesting? */ + prison_03
++ @9 /* Are you trying to seduce me? */ + prison_04
++ @10 /* Nice try. I'm not falling for your tricks. */ + prison_04
++ @11 /* Lady, you are in here for a reason, I am pretty sure of that. */ + prison_01
++ @12 /* Since you are in here you are not an innocent! */ + prison_02
+ ~CheckStatGT(Player1,17,STR)~ + @13 /* Hmm, now that sounds about the treatment I'd deserve. */ + prison_06_str
+ ~CheckStatGT(Player1,17,INT)
!CheckStatGT(Player1,17,STR)~ + @13 /* Hmm, now that sounds about the treatment I'd deserve. */ + prison_06_int
+ ~CheckStatGT(Player1,17,WIS)
!CheckStatGT(Player1,17,INT)
!CheckStatGT(Player1,17,STR)~ + @13 /* Hmm, now that sounds about the treatment I'd deserve. */ + prison_06_wis
+ ~CheckStatGT(Player1,17,DEX)
!CheckStatGT(Player1,17,WIS)
!CheckStatGT(Player1,17,INT)
!CheckStatGT(Player1,17,STR)~ + @13 /* Hmm, now that sounds about the treatment I'd deserve. */ + prison_06_dex
+ ~CheckStatGT(Player1,17,CON)
!CheckStatGT(Player1,17,DEX)
!CheckStatGT(Player1,17,WIS)
!CheckStatGT(Player1,17,INT)
!CheckStatGT(Player1,17,STR)
!CheckStatGT(Player1,17,CHR)~ + @13 /* Hmm, now that sounds about the treatment I'd deserve. */ + prison_06_con
+ ~CheckStatGT(Player1,17,CHR)
!CheckStatGT(Player1,17,DEX)
!CheckStatGT(Player1,17,WIS)
!CheckStatGT(Player1,17,INT)
!CheckStatGT(Player1,17,STR)~ + @13 /* Hmm, now that sounds about the treatment I'd deserve. */ + prison_06_chr
+ ~!CheckStatGT(Player1,17,CON)
!CheckStatGT(Player1,17,DEX)
!CheckStatGT(Player1,17,WIS)
!CheckStatGT(Player1,17,INT)
!CheckStatGT(Player1,17,STR)
!CheckStatGT(Player1,17,CHR)~ + @13 /* Hmm, now that sounds about the treatment I'd deserve. */ + prison_06
++ @14 /* I don't want to talk to you. */ + prison_18
END

IF ~~ THEN prison_01
SAY @15 /* A combination of unfavorable circumstances, nothing more! But you are right, there is a reason for everything. The reason for me showing you my gratitude, for example, would be you releasing me from this prison, hmm? */
IF ~CheckStatGT(Player1,17,STR)~ THEN + prison_06_str
IF ~CheckStatGT(Player1,17,INT)
!CheckStatGT(Player1,17,STR)~ THEN + prison_06_int
IF ~CheckStatGT(Player1,17,WIS)
!CheckStatGT(Player1,17,INT)
!CheckStatGT(Player1,17,STR)~ THEN + prison_06_wis
IF ~CheckStatGT(Player1,17,DEX)
!CheckStatGT(Player1,17,WIS)
!CheckStatGT(Player1,17,INT)
!CheckStatGT(Player1,17,STR)~ THEN + prison_06_dex
IF ~CheckStatGT(Player1,17,CON)
!CheckStatGT(Player1,17,DEX)
!CheckStatGT(Player1,17,WIS)
!CheckStatGT(Player1,17,INT)
!CheckStatGT(Player1,17,STR)
!CheckStatGT(Player1,17,CHR)~ THEN + prison_06_con
IF ~CheckStatGT(Player1,17,CHR)
!CheckStatGT(Player1,17,DEX)
!CheckStatGT(Player1,17,WIS)
!CheckStatGT(Player1,17,INT)
!CheckStatGT(Player1,17,STR)~ THEN + prison_06_chr
IF ~!CheckStatGT(Player1,17,CON)
!CheckStatGT(Player1,17,DEX)
!CheckStatGT(Player1,17,WIS)
!CheckStatGT(Player1,17,INT)
!CheckStatGT(Player1,17,STR)
!CheckStatGT(Player1,17,CHR)~ THEN + prison_06
END

IF ~~ THEN prison_02
SAY @16 /* Oh, you are definitely right that I am not... *innocent*. Free me, and I will show you just what a naughty girl I can be... */
COPY_TRANS_LATE bspris02 prison_01
END

IF ~~ THEN prison_03
SAY @17 /* Well, I think you already know. */
IF ~~ THEN + prison_04
END

IF ~~ THEN prison_04
SAY @18 /* Can you blame me for trying when coincidence blesses me with meeting someone like you? */
COPY_TRANS_LATE bspris02 prison_01
END

IF ~~ THEN prison_05
SAY @19 /* Oh, I was hoping we could hold off on the chit chat until after you freed me from these heavy chains! I'd be all yours then, for any... examination you'd fancy, handsome. */
COPY_TRANS_LATE bspris02 prison_01
END

IF ~~ THEN prison_06
SAY @20 /* [no stats > 17]It must have been fate who brought us together! */
IF ~~ THEN + prison_07
IF ~Global("C#BGQE_NPCReactions","GLOBAL",0)
InParty("SAFANA") Detect("SAFANA") !StateCheck("SAFANA",CD_STATE_NOTVALID)~ THEN EXTERN %SAFANA_JOINED% safana_interjection
END

IF ~~ THEN prison_06_str
SAY @21 /* [PC's STR > 17]It must have been fate who brought me together with such a *strong* <PRO_MANWOMAN>! */
COPY_TRANS_LATE bspris02 prison_06
END

IF ~~ THEN prison_06_int
SAY @22 /* [PC's INT > 17]It must have been fate who brought me together with such a *smart* <PRO_MANWOMAN>! */
COPY_TRANS_LATE bspris02 prison_06
END

IF ~~ THEN prison_06_wis
SAY @23 /* [PC's WIS > 17]It must have been fate who brought me together with such a *wise* <PRO_MANWOMAN>! */
COPY_TRANS_LATE bspris02 prison_06
END

IF ~~ THEN prison_06_dex
SAY @24 /* [PC's DEX > 17]It must have been fate who brought me together with such a *skilled* <PRO_MANWOMAN>! */
COPY_TRANS_LATE bspris02 prison_06
END

IF ~~ THEN prison_06_con
SAY @25 /* [PC's CON > 17]It must have been fate who brought me together with such a *tough* <PRO_MANWOMAN>! */
COPY_TRANS_LATE bspris02 prison_06
END

IF ~~ THEN prison_06_chr
SAY @26 /* [PC's CHR > 17]It must have been fate who brought me together with such an *impressive* <PRO_MANWOMAN>! */
COPY_TRANS_LATE bspris02 prison_06
END


CHAIN
IF ~~ THEN %SAFANA_JOINED% safana_interjection
@27 /* [Safana](scoffs) <CHARNAME>, please tell me you see that wench for what she is - a manipulator who's trying to wiggle her way out of *prison* by buttering her words up seductively. I know *exactly where this'll end - she'll laugh in your face the moment you'll open those shackles. */
== bspris02 @28 /* Oh, so you're inferring me from yourself, hmm? I don't know what your history with that woman is, dear stranger, but don't blame me for instantly falling for someone so handsome. I'd say I'm not that bad myself, hmm? */
== %SAFANA_JOINED% @29 /* [Safana]Phhhh. */
END
++ @30 /* Hmm, I do think you're not bad, indeed. */ EXTERN bspris02 prison_09
++ @31 /* I am sorry. Even if I wanted to, I can't let you just go. */ EXTERN bspris02 prison_08
++ @32 /* You are so not my type. */ EXTERN bspris02 prison_10
++ @33 /* Don't bother any further. You'll stay exactly where you are. */ EXTERN bspris02 prison_16

APPEND bspris02
IF ~~ THEN prison_07
SAY @34 /* Don't blame me for instantly falling for someone so handsome. I'd say I'm not that bad myself, hmm? */
++ @30 /* Hmm, I do think you're not bad, indeed. */ + prison_09
++ @31 /* I am sorry. Even if I wanted to, I can't let you just go. */ + prison_08
++ @32 /* You are so not my type. */ + prison_10
++ @33 /* Don't bother any further. You'll stay exactly where you are. */ + prison_16
END

IF ~~ THEN prison_08
SAY @35 /* Oh, I understand! But will you at least open these shackles? I'd so much like to show you my gratitude, but with these chains, I can barely move. */
IF ~~ THEN + prison_11
END

IF ~~ THEN prison_09
SAY @36 /* So it is settled, then? */
IF ~~ THEN + prison_11
END

IF ~~ THEN prison_10
SAY @37 /* Oh, so <PRO_HESHE> is not only handsome, but also honest and direct! You can't leave me here like this. Not after meeting you the way we did! */
IF ~~ THEN + prison_11
END

IF ~~ THEN prison_11
SAY @38 /* I'm sure such a heroic person like you won't have a problem with opening the locks that hold these chains. */
++ @39 /* Tell me who you are, first. */ + prison_12
++ @40 /* I'm not freeing a criminal. */ + prison_12
++ @33 /* Don't bother any further. You'll stay exactly where you are. */ + prison_16
END

IF ~~ THEN prison_12
SAY @41 /* Oh, they say I'm an Amnian spy! Can you believe that? They put me into this prison and chained me to this wall! Even if I'd be from Amn - can you blame the Amnians for wanting to know what is happening? Everyone talked about war! Can you imagine a *war* between the Sword Coast and Amn? */
++ @42 /* You are right, this shouldn't be a reason to chain you up like this. */ + prison_13
++ @33 /* Don't bother any further. You'll stay exactly where you are. */ + prison_16
END

IF ~~ THEN prison_13
SAY @43 /* So... Can I hope that there won't be any chains on me when I'll show you my gratitude for freeing me? */
++ @44 /* Hmm, now that does sound good. Here - your shackles are gone. Now come here... */ + prison_14
++ @45 /* You do not need to do any such thing. I removed your chains nontheless. You are free to go. */ + prison_15
++ @46 /* Absolutely not. You stay right where you are. I don't believe a word you are saying. */ + prison_16
++ @47 /* Were you a mere spy, I don't think they'd chain you up like that. No, there is more you didn't tell me. You will stay right here. */ + prison_16
END

IF ~~ THEN prison_14
SAY @48 /* What - you really thought "come here" would be part of what we'll do now? Ahahaha! */
IF ~~ THEN + prison_15
END

IF ~~ THEN prison_15
SAY @49 /* Free from the chains at last! Thank you so much, my *savior*! (laughs) Thanks for setting me free, I thought I'd have to do it myself. */
IF ~~ THEN DO ~SetInterrupt(FALSE)
ReputationInc(-1)
SetGlobal("bs_PrisonAmnishSpy","GLOBAL",2) ActionOverride("bspris02",EscapeAreaDestroy(5))
SetInterrupt(TRUE)~ EXIT
END

IF ~~ THEN prison_16
SAY @50 /* Aww. Seems you are not only handsome but also have brains. Very well then. Can't blame a girl for trying. */
IF ~~ THEN DO ~SetGlobal("bs_PrisonAmnishSpy","GLOBAL",1)
SetGlobalTimer("bs_PrisonAmnishSpyTimer","MYAREA",ONE_DAY)~ EXIT
END

IF ~Global("bs_PrisonAmnishSpy","GLOBAL",1)~ THEN prison_17
SAY @51 /* Oh, don't hurt me, please! I'm such an innocent woman. (laughs) */
IF ~~ THEN EXIT
END

IF ~~ THEN prison_18
SAY @52 /* Hmm, what a pity. Come back soon, handsome! */
IF ~~ THEN EXIT
END
END //APPEND

/* will be gone next time PC enters prison */


/* in the Iron Throne */
/* only before Sarevok's corronation */
CHAIN
IF ~GlobalGT("bs_PrisonAmnishSpy","GLOBAL",2)~ THEN bspris02 iron_throne
@53 /* Aww, look at who it is. */
== bspris02 IF ~Global("bs_PrisonAmnishSpy","GLOBAL",4)~ THEN @54 /* My savior. (laughs) */
== bspris02 IF ~Global("bs_PrisonAmnishSpy","GLOBAL",12)~ THEN @55 /* The <PRO_MANWOMAN> who broke my heart! See, I made my own way here. (laughs) */
END
++ @56 /* What are you dong here? */ + iron_throne_05
++ @57 /* So you *are* an Amnian spy, investigating the Iron Throne? */ + iron_throne_05
++ @58 /* I should punish you where you stand, for being the escaped criminal that you are! */ + iron_throne_04
+ ~Global("bs_PrisonAmnishSpy","GLOBAL",4)~ + @59 /* I haven't forgotten how you tricked me, you know. */ + iron_throne_04
++ @60 /* Let's just pretend we didn't see each other. */ + iron_throne_01

APPEND bspris02

IF ~~ THEN iron_throne_01
SAY @61 /* Hmm. Alright, I'll take the deal - but only because you asked so nicely. Take care, handsome. */
IF ~~ THEN DO ~IncrementGlobal("bs_PrisonAmnishSpy","GLOBAL",1) ActionOverride("bspris02",EscapeAreaDestroy(5))~ EXIT
END

IF ~~ THEN iron_throne_02
SAY @62 /* Oh, doesn't it fit together in your small head? "But if she's from Amn, shouldn't she be on *my* side in this conflict?" */
IF ~~ THEN + iron_throne_03
END

IF ~~ THEN iron_throne_03
SAY @63 /* I am not working for the Iron Throne, and yet, here I am - trying to *escalate" the conflict between Amn and Baldur's Gate. Complicated, isn't it? */
++ @64 /* So we are enemies, I'm afraid. */ + iron_throne_06
++ @65 /* I don't want to fight you. Can we just pretend we didn't see each other? */ + iron_throne_01
END

IF ~~ THEN iron_throne_04
SAY @66 /* Aww, you are getting cuter every time we meet. */
IF ~~ THEN + iron_throne_05
END

IF ~~ THEN iron_throne_05
SAY @67 /* My presence here is simple, really - forces inside the Iron Throne are working for war at the Sword Coast - and I am, too, for my own masters. */
++ @68 /* What? Who are you working for, then? */ + iron_throne_02
++ @69 /* ...That makes us enemies? */ + iron_throne_03
++ @65 /* I don't want to fight you. Can we just pretend we didn't see each other? */ + iron_throne_01
END

IF ~~ THEN iron_throne_06
SAY @70 /* We are, handsome - you are endagering my mission, so I'll kill you here and now. */
IF ~~ THEN DO ~IncrementGlobal("bs_PrisonAmnishSpy","GLOBAL",2) ActionOverride("bspris02",Enemy())~ EXIT
END

END //APPEND



/*
> [Zelle 4 - zweite von rechts im Gang] The bandit is from the bandit camps, which the party has already ransacked. He might talk more about the Iron Throne if pressed, but otherwise will just taunt the party. Evil parties can help him get a message to another bandit contact in the city. If they agree to this, they can help him escape for an XP reward (but reputation penalty). Otherwise, the party can just kill him.
*/


BEGIN bspris03
IF ~NumTimesTalkedTo(0)~ THEN bandit
SAY @71 /* Oh, now look at who we have here. <CHARNAME>, the bandit camp crasher. Well, I made it out of there alive, but turns out the Flaming Fist pansies are no fools, either. */
++ @72 /* You're a bandit? Seems I missed one skalp. */ + bandit_01
++ @73 /* You're not a normal bandit if they put you here. */ DO ~SetGlobal("bs_bandit_02","LOCALS",1)~ + bandit_02
+ ~!Alignment(Player1,MASK_EVIL)~ + @14 /* I don't want to talk to you. */ + bandit_end
+ ~Alignment(Player1,MASK_EVIL)~ + @14 /* I don't want to talk to you. */ + bandit_offer
END

IF ~~ THEN bandit_01
SAY @74 /* Ain't I the lucky one then. */
++ @73 /* You're not a normal bandit if they put you here. */ DO ~SetGlobal("bs_bandit_02","LOCALS",1)~ + bandit_02
++ @75 /* What about I take yours now? */ DO ~SetGlobal("bs_attack","LOCALS",1)~ + bandit_attack
+ ~!Alignment(Player1,MASK_EVIL)~ + @14 /* I don't want to talk to you. */ + bandit_end
+ ~Alignment(Player1,MASK_EVIL)~ + @14 /* I don't want to talk to you. */ + bandit_offer
END

IF ~~ THEN bandit_02
SAY @76 /* Hmm, you could say that, but I wasn't a division leader, either. I was just.. a little bit better informed than those fools. Didn't help me much, though, except to "stay alive". */
++ @77 /* Better informed? What do you know then? */ + bandit_information
+ ~Global("bs_attack","LOCALS",0)~ + @78 /* How about I change the latter for you. */ DO ~SetGlobal("bs_attack","LOCALS",1)~ + bandit_attack
+ ~!Alignment(Player1,MASK_EVIL)~ + @79 /* Talking to you is pointless. */ + bandit_end
+ ~Alignment(Player1,MASK_EVIL)~ + @79 /* Talking to you is pointless. */ + bandit_offer
END

IF ~~ THEN bandit_attack
SAY @80 /* What - here, now? Aren't you afraid of the guards watching if you go around slaying their prisoners? */
++ @81 /* No, I'm not. */ + bandit_attack_01
++ @82 /* Well, what choice did I have with you attacking me first - you understand? */ + bandit_attack_01
+ ~Global("bs_bandit_02","LOCALS",0)~ + @83 /* I was just shaking my fist. Although your presence in here means you were more than a minion. */ DO ~SetGlobal("bs_bandit_02","LOCALS",1)~ + bandit_02
+ ~Global("bs_bandit_02","LOCALS",1)~ + @84 /* I was just shaking my fist. What do you know then, if you were so well informed? */ DO ~SetGlobal("bs_bandit_02","LOCALS",2)~ + bandit_information
END

IF ~~ THEN bandit_information
SAY @85 /* Well, everyone thought we are being hired by the Zenths. *I* knew it wasn't them. */
++ @86 /* Who was it then? */ + bandit_information_01
+ ~!Alignment(Player1,MASK_EVIL)~ + @79 /* Talking to you is pointless. */ + bandit_end
+ ~Alignment(Player1,MASK_EVIL)~ + @79 /* Talking to you is pointless. */ + bandit_offer
END

IF ~~ THEN bandit_information_01
SAY @87 /* What, you think I'd just tell you? */
+ ~!Alignment(Player1,MASK_EVIL)~ + @88 /* I guess it doesn't matter. It's not like I think you could tell me much. */ + bandit_end
+ ~Alignment(Player1,MASK_EVIL)~ + @88 /* I guess it doesn't matter. It's not like I think you could tell me much. */ + bandit_offer
++ @89 /* You need some "motivation", huh? */ + bandit_information_02
+ ~!Alignment(Player1,MASK_EVIL)~ + @79 /* Talking to you is pointless. */ + bandit_end
+ ~Alignment(Player1,MASK_EVIL)~ + @79 /* Talking to you is pointless. */ + bandit_offer
END

IF ~~ THEN bandit_information_02
SAY @90 /* Alright, alright! It's the Iron Throne. *They* stirred up all the trouble, probably to profit from the chaos. There, I told you! */
IF ~!Alignment(Player1,MASK_EVIL)~ THEN + bandit_end
IF ~Alignment(Player1,MASK_EVIL)~ THEN + bandit_offer
END

IF ~~ THEN bandit_attack_01
SAY @91 /* You've got to be kidding me! Man, it's a shame we're on different sides. */
IF ~~ THEN DO ~ActionOverride("bspris03",Enemy())~ EXIT
END

IF ~~ THEN bandit_end
SAY @92 /* Well, I'm afraid *you*'ll need to leave. I'm kind of stuck here. */
IF ~~ THEN EXIT
END

/* evil PC */
CHAIN
IF ~~ THEN bspris03 bandit_offer
@93 /* Listen - I know I was on the opposite side. But truth be told - wouldn't you agree I'd be of more use outside this prison? I never went after you and didn't care about some personal agenda of the higher ups. There is no more bandit activities, I won't make you any problems. */
/* this refers to Caelar's raising an army - should only play in BG1 */
== bspris03 IF ~Global("ENDOFBG1","GLOBAL",0)
        Global("bd_plot","global",0)~ THEN @94 /* Someone is recruiting mercenaries up at the High Moor, that's where we'll be going - I'll be out of your hair and no harm done to this city, either, see? */
== bspris03 @95 /* All you'd have to do is bring this note to a contact of mine. Will you do that? */
END
++ @96 /* Pff, you'd reveal more bandits to me? Do you wish death to your "contact"? */ + bandit_offer_02
++ @97 /* What would be in it for me? */ + bandit_offer_03
++ @98 /* No, I won't. */ + bandit_offer_01
++ @99 /* Conspiring, eh? Guess I do have to end you after all. */ + bandit_attack_01

APPEND bspris03

IF ~~ THEN bandit_offer_01
SAY @100 /* I was afraid you'd say that. */
IF ~~ THEN + bandit_end
END

IF ~~ THEN bandit_offer_02
SAY @101 /* I'm not that stupid, don't worry. */
IF ~~ THEN + bandit_offer_04
END

IF ~~ THEN bandit_offer_03
SAY @102 /* A nice sum of gold. */
IF ~~ THEN + bandit_offer_04
END

IF ~~ THEN bandit_offer_04
SAY @103 /* I'll tell you where to put the note - and how to find the hidden gold. You just put the note in a specififc place - that's it. I trust you - you won't go running to the Flaming Fist about this. And even if - there is nothing to tell them, other than that you accepted a note you won't be able to read and that they'll need to guard a place where noone will show. */
++ @104 /* Fine, I'll do it. That reward better be worth it. */ + bandit_offer_05
++ @98 /* No, I won't. */ + bandit_offer_01
++ @99 /* Conspiring, eh? Guess I do have to end you after all. */ + bandit_attack_01
END

IF ~~ THEN bandit_offer_05
SAY @105 /* It will. Here is the note. If you leave the city by the bridge and head north, there will be one single tree that usually has red leaves around this time of year. You need to loosen the bark a little at the lowest branch hole. Just hide the note in there. You'll find gold in there as well - the safety stash is already in, and I wrote them they should put some more in when they take it out. Thanks, man. */
IF ~~ THEN DO ~GiveItemCreate("bspris3a",LastTalkedToBy(Myself),1,0,0) SetGlobal("bs_BanditHiddenGold","GLOBAL",1)~ UNSOLVED_JOURNAL @100085 EXIT
END

IF ~Global("bs_BanditHiddenGold","GLOBAL",1)~ THEN waiting
SAY @106 /* I'm counting on you. */
IF ~~ THEN EXIT
END

IF ~GlobalGT("bs_BanditHiddenGold","GLOBAL",1)~ THEN waiting
SAY @107 /* Did you do it? */
IF ~~ THEN EXIT
END

IF ~NumTimesTalkedToGT(0)~ THEN done
SAY @108 /* You still here? */
IF ~~ THEN EXIT
END
END //APPEND

/*
> [Zelle 3 zweite von links im Gang] eine Priesterin Talonas, die die Brunnen der Stadt vergiftete und zum Tod vieler Bewohner führte
*/
BEGIN bspris04

IF ~NumTimesTalkedTo(0)~ THEN talona_pr
SAY @109 /* Talona, I sacrificed them all for you! All for you. Take me to you, my goddes, Mother of All Plagues! I did it for you - they all drank the blessed waters, they all fell ill, all died in your name! The streets, full with corpses, to give glory to you! Why.... why have you forsaken me... */
IF ~~ THEN EXIT
END

IF ~RandomNum(3,1)~ THEN talona_pr_01
SAY @110 /* Take me to you, my goddes, Mother of All Plagues! */
IF ~~ THEN EXIT
END

IF ~RandomNum(3,2)~ THEN talona_pr_02
SAY @111 /* All for you, only for you! */
IF ~~ THEN EXIT
END

IF ~RandomNum(3,3)~ THEN talona_pr_03
SAY @112 /* Why have you forsaken me? */
IF ~~ THEN EXIT
END


/*
> [Zelle 2 - ganz links im Gang]  Der Kapitän eines Handelsschiffes, der bei seiner Rückkehr aus Chult die Pocken eingeschleppt hat.

Captain Dorsay
*/


BEGIN bspris05

IF ~NumTimesTalkedTo(0)~ THEN captain
SAY @113 /* It finally happened! The guards have been bribed at last, and you're here to avenge your dead relatives! Guards! GUARDS! - Ah, it's no use calling them if they let you through! My fate is sealed! */
++ @114 /* Calm yourself, I'm not here for any such thing. */ + captain_01
++ @115 /* I thought your fate was already sealed, with you being here in this prison and all. */ + captain_03
++ @116 /* Oh, so you are a murderer? Maybe I *should* avenge dead people then! */ + captain_02
++ @117 /* (yawn) So, you are a murderer. Why am I not surprised? Oh, wait - maybe because this is the Seatower Prison. */ + captain_03
++ @118 /* I shouldn't be talking to you. */ + captain_end
END

IF ~~ THEN captain_01
SAY @119 /* Who-who are you then? */
++ @120 /* I am <CHARNAME>. Who are you? */ + captain_05
++ @121 /* Tell me why you are here. */ + captain_04
++ @118 /* I shouldn't be talking to you. */ + captain_end
END

IF ~~ THEN captain_02
SAY @122 /* Noooo!... */
IF ~~ THEN + captain_04
END

IF ~~ THEN captain_03
SAY @123 /* So you have come to mock me. Isn't being here enough punishment? */
++ @124 /* I just wanted to talk to you, is all. */ + captain_01
++ @125 /* I don't know, what was it you did? */ + captain_04
++ @121 /* Tell me why you are here. */ + captain_04
++ @118 /* I shouldn't be talking to you. */ + captain_end
END

IF ~~ THEN captain_04
SAY @126 /* I did nothing! */
++ @127 /* Oh, come *on*! You wouldn't be here then. */ + captain_06
++ @128 /* You just mentioned dead people. Maybe you should stop denying your crimes! */ + captain_06
++ @129 /* "Nothing", huh? And what exactly was that "nothing" that brought you here? */ + captain_06
END

IF ~~ THEN captain_05
SAY @130 /* My name is Dorsay - I was a sea captain once. */
IF ~~ THEN + captain_04
END

IF ~~ THEN captain_06
SAY @131 /* It-it is true! I did nothing... when the first sailors became sick, I did nothing... when half the crew lay down and the first died, when the symptoms were clearly visible... I did nothing, because I wanted to have the goods unloaded. I denied that there was a threat for the city when we go ashore. There is rules for quarantine - I quarantined the crew, but not the wares. How should I know that it was really the plague we brought from Chult! Ah, if you are not here to hurt me and aren't guards either, best you leave me to my fate. */
IF ~~ THEN EXIT
END

IF ~NumTimesTalkedToGT(0)~ THEN captain_again
SAY @132 /* The sea... she's calling to me. So near and yet so far away... */
IF ~~ THEN EXIT
END

IF ~~ THEN captain_end
SAY @133 /* Then you better go! */
IF ~~ THEN EXIT
END



/*
> [Zelle 1 - ganz hinten rechts vereinzelt] Jemand, der völlig unschuldig dort einsitzt und den die PCs tatsächlich befreien können, wenn sie weiter recherchieren? Ist Verwandter einer der Herzöge, wurde der Intrige bezichtigt, ist aber unschuldig?
bspris6a.itm - letter to Slythe
bspris6b.itm - evidence
*/


BEGIN bspris06

IF ~Global("bs_KnowsPrisonerIntrigue","GLOBAL",0)~ THEN intrigue
SAY @134 /* Who.. who are you? You are no guards. */
++ @135 /* I am <CHARNAME>, and I gained access to this prison and am allowed to talk to the prisoners. */ + friendly
++ @136 /* I'm posing the questions. Tell me who you are. */ + name
++ @137 /* You look surprisingly sophisticated for someone who committed crimes that led to life imprisonment in this dungeon. */ + sophisticated
++ @138 /* Ah, another murderer waiting for their justice! */ + unfriendly
++ @14 /* I don't want to talk to you. */ + bye
END

IF ~~ THEN friendly
SAY @139 /* Such... such friendly face. It's been years since someone addressed me so kindly. */
++ @7 /* Who are you? */ + name
++ @140 /* Why are you here? */ + name
++ @141 /* Well, that could be over soon, depending on why you are here. Tell me! */ + name
++ @137 /* You look surprisingly sophisticated for someone who committed crimes that led to life imprisonment in this dungeon. */ + sophisticated
++ @142 /* I'm afraid that was my good deed for the day. Now you'll have to answer for the murder you committed! */ + unfriendly
END

IF ~~ THEN unfriendly
SAY @143 /* No, please! No! I-I did not kill anyone. Don't you even know what I'm being accused of? */
++ @144 /* Please tell me. */ + name
++ @145 /* And what would that be? */ + name
++ @146 /* No, and I don't want to hear it, either. */ + bye
END

IF ~~ THEN sophisticated
SAY @147 /* Oh, this is the dungeons for the real dangerous criminals, not just thugs and murderers. - I'm not saying that I *am* such a criminal... */
++ @140 /* Why are you here? */ + name
++ @148 /* (sigh) Of course not. Let me guess - you are innocent? */ + name
++ @149 /* If you are in here, I am sure you are at least a murderer! */ + unfriendly
END

IF ~~ THEN name
SAY @150 /* I am Timothy Malastair. I am cousin to Duke Eltan. I was accused... I was convicted of orchestrating an assassination attempt on Duke Eltan, which is high treason. Had I intended to increase my family shares of the Flaming Fist, this would at least have made sense, but I was aspirant to a leader role in the Iron Throne at that time! Yes, I know it is lame that I insist I am innocent, but it is the truth! I thank you for listening to me - I don't expect you to believe me, but it felt good to be able to talk about it, at least. */
IF ~~ THEN DO ~SetGlobal("bs_KnowsPrisonerIntrigue","GLOBAL",1)~ EXIT
END

IF ~~ THEN bye
SAY @151 /* And I can't hold it against you. */
IF ~~ THEN EXIT
END

IF ~GlobalGT("bs_KnowsPrisonerIntrigue","GLOBAL",0)
GlobalLT("bs_KnowsPrisonerIntrigue","GLOBAL",8)
AreaCheck("ys0106")~ THEN waiting
SAY @152 /* As much as I enjoyed talking to you, I know you have more pressing matters to attend to. */
IF ~OR(2)
    !PartyHasItem("bspris6b")
    GlobalGT("bs_KnowsPrisonerIntrigue","GLOBAL",2)~ THEN EXIT
+ ~PartyHasItem("bspris6b")
GlobalLT("bs_KnowsPrisonerIntrigue","GLOBAL",3)~ + @153 /* I have here evidence for your innocence! */ + evidence
+ ~PartyHasItem("bspris6b")
GlobalLT("bs_KnowsPrisonerIntrigue","GLOBAL",3)~ + @154 /* I'll be going. */ EXIT
END

IF ~~ THEN evidence
SAY @155 /* You... how... After all these years?! This is brilliant! Please, hand it over to Eltan or some other authority quickly! */
++ @156 /* (true) I will. */ + freed
++ @157 /* You see no problem in Duke Eltan getting this? The accusation was that you tried to kill him, after all. He might hold a grudge or feel embarrassed that he was wrong. */ + eltan
++ @158 /* Yes, you see, I was thinking - this must be very valuable to you, don't you think? */ + ransom
++ @159 /* What? No, I wasn't planning on helping you. I wanted to show this to you and laugh into your face! */ + ransom
END

IF ~~ THEN freed
SAY @160 /* Oh, thank you - thank you! Ah, my heart - I need to calm myself a little, it feels like I'm going to burst. To dream of freedom, after all these years... */
IF ~~ THEN DO ~SetGlobal("bs_KnowsPrisonerIntrigue","GLOBAL",5)~ EXIT
END

IF ~~ THEN eltan
SAY @161 /* What? Oh, no. Eltan is not like that. He takes these matters very seriously - which means that he put me here when the evidence pointed to my guilt, but he'll make sure I'll be freed if that is no longer the case. Please, give it to him - or the Seatower Commander, who might be more available. */
++ @156 /* (true) I will. */ + freed
++ @158 /* Yes, you see, I was thinking - this must be very valuable to you, don't you think? */ + ransom
++ @159 /* What? No, I wasn't planning on helping you. I wanted to show this to you and laugh into your face! */ + ransom
END

IF ~~ THEN ransom
SAY @162 /* Is it - is it gold that you want? I can send a letter to my mother and have someone meet you. They will be there! How do.... 3000 gold sound to you? */
++ @163 /* That sounds great! Where will I meet her? */ + ransom_01
++ @164 /* Ah, that look of hope in your eyes! It's priceless. And now we'll let it die. See this note with the evidence? Woops, how clumsy of me - now it's nothing but shreds. I don't think anyone can still read what was written on it. */ + ransom_02
END

IF ~~ THEN ransom_01
SAY @165 /* Let's say... behind the Temple of Helm, in the North of Baldur's Gate. Please, go there and hand over the note. You'll be my savior, regardless of the gold you are requesting. */
IF ~~ THEN DO ~SetGlobal("bs_KnowsPrisonerIntrigue","GLOBAL",3)~ UNSOLVED_JOURNAL @100097 EXIT
END

IF ~~ THEN ransom_02
SAY @166 /* No! No - how can-how can you - the evidence! After all this time... so near... I... */
IF ~~ THEN DO ~SetGlobal("bs_KnowsPrisonerIntrigue","GLOBAL",7)~ EXIT
END

/* Follow-up after Sarvok's Death in BG1: Malastair will be in the IT building */
CHAIN
IF ~AreaCheck("%BaldursGateDocks_IronThrone_L1%")
Global("bs_PrisonerIntrigueThanks","GLOBAL",0)~ THEN bspris06 free
@167 /* Ah, it is you! <CHARNAME>, the city's savior - and my very personal one, too! The Dukes have asked me to oversee what will happen to this building. Who would have thought that the years in the dungeons would now be the reason why I enjoy the full trust of the dukes and, so to speak, have great influence on the reconstruction of the local branch. The ways of the gods are indeed inscrutable. */
== bspris06 IF ~GlobalGT("bs_KnowsPrisonerIntrigue","GLOBAL",8)~ THEN @168 /* By the way, my mother wants you to have this - as a small compensation for your troubles. She explicitely apologizes for not showing her gratitude in a more appropriate manner. */ DO ~GiveGoldForce(3000)~
== bspris06 @169 /* Well, I need to leave and ponder how this can be salvaged and how much I want to be involved. It was nice to see you again, <CHARNAME>. Farewell. */
END
IF ~~ THEN DO ~SetGlobal("bs_PrisonerIntrigueThanks","GLOBAL",1) ActionOverride("bspris06",EscapeAreaDestroy(5))~ EXIT

/* follow up in SoD */

%SOD_ONLY_SLASH%%SOD_ONLY_ASTERIKS%
CHAIN
IF ~AreaCheck("bd0111")~ THEN bspris06 sod
@170 /* <CHARNAME>! Greetings. Look what this place turned into. It's not exactly how I pictured this to go. But, a merchant must seize opportunities when they arise. */
== bspris06 IF ~Global("bs_PrisonerIntrigueThanks","GLOBAL",0)~ THEN @171 /* The Dukes have asked me to oversee what will happen to this building. Who would have thought that the years in the dungeons would now be the reason why I enjoy the full trust of the dukes and, so to speak, have great influence on the reconstruction of the local branch. The ways of the gods are indeed inscrutable. */
== bspris06 IF ~Global("bs_PrisonerIntrigueThanks","GLOBAL",0)
GlobalGT("bs_KnowsPrisonerIntrigue","GLOBAL",8)~ THEN @168 /* By the way, my mother wants you to have this - as a small compensation for your troubles. She explicitely apologizes for not showing her gratitude in a more appropriate manner. */ DO ~GiveGoldForce(3000)~
END
+ ~Global("bs_PrisonerIntrigueThanks","GLOBAL",0)
GlobalGT("bs_KnowsPrisonerIntrigue","GLOBAL",8)~ + @172 /* I am glad to see you well. I thank you for the gold. */ + sod_00
+ ~OR(2)
!Global("bs_PrisonerIntrigueThanks","GLOBAL",0)
!GlobalGT("bs_KnowsPrisonerIntrigue","GLOBAL",8)~ + @173 /* I am glad to see you well. */ + sod_00
COPY_TRANS_LATE bspris06 sod_00

APPEND bspris06
IF ~~ THEN sod_00
SAY @174 /* I am in your debt, <CHARNAME>. */
++ @175 /* Opportunities? You are not charging these poor people for staying here, are you? */ + sod_01
++ @176 /* So you are making gold out of the buidling being turned into a nursery. You are a real salesperson, I have to say. */ + sod_02
++ @177 /* Great to see you are busy, but I need to go. */ + sod_03
++ @14 /* I don't want to talk to you. */ + sod_03
END

IF ~~ THEN sod_01
SAY @178 /* What? No, absolutely not! - But we do sell the bandages to the priests and get a compensation from the dukes. */
IF ~~ THEN + sod_02
END

IF ~~ THEN sod_02
SAY @179 /* Well, it all costs and the building *does* suffer - it will need some reconstruction when these troubled times are over. */
IF ~~ THEN + sod_03
END

IF ~~ THEN sod_03
SAY @180 /* I won't keep you any longer. I am sure we all have lots to do. Farewell, my savior. */
IF ~~ THEN DO ~SetGlobal("bs_PrisonerIntrigueThanks","GLOBAL",2) ActionOverride("bspris06",EscapeAreaDestroy(5))~ EXIT
END
END //APPEND
%SOD_ONLY_ASTERIKS%%SOD_ONLY_SLASH%


//Lady Malastair
BEGIN bspris07
IF ~!See(Player1)~ THEN no_charname
SAY @181 /* Good evening. Are you here on account of <CHARNAME>? */
+ ~PartyHasItem("bspris6b")~ + @182 /* Yes, <PRO_HESHE> sent me. */ + ransom
++ @183 /* No, <PRO_HESHE> will be here shortly. */ + no_evidence
END

IF ~See(Player1)
!PartyHasItem("bspris6b")~ THEN no_evidence
SAY @184 /* I am waiting for the evidence for my son's innocence. Please hasten and bring it to me. */
IF ~~ THEN EXIT
END

IF ~See(Player1)
PartyHasItem("bspris6b")~ THEN ransom
SAY @185 /* So you came. Show me the evidence, please. */
++ @186 /* Here, take it for free. I decided not make gold out of your family's misery. */ DO ~SetGlobal("bs_KnowsPrisonerIntrigue","GLOBAL",9)
EraseJournalEntry(@100094)
EraseJournalEntry(@100097)
TakePartyItem("bspris6b") DestroyItem("bspris6b")~ SOLVED_JOURNAL @100100 + leaving
++ @187 /* Here you are. Give me the agreed sum. */ DO ~SetGlobal("bs_KnowsPrisonerIntrigue","GLOBAL",8)
EraseJournalEntry(@100094)
EraseJournalEntry(@100097)
GiveGoldForce(3000)
TakePartyItem("bspris6b") DestroyItem("bspris6b")~ SOLVED_JOURNAL @100098 + leaving_01
++ @188 /* I will, but the price just went up. It's 5000 gold now. */ DO ~SetGlobal("bs_KnowsPrisonerIntrigue","GLOBAL",8)
EraseJournalEntry(@100094)
EraseJournalEntry(@100097)
GiveGoldForce(5000)
TakePartyItem("bspris6b") DestroyItem("bspris6b")~ SOLVED_JOURNAL @100098 + leaving_02
++ @189 /* What, no words of thanks, of hope that your son will go free again, no tears, no emotions? */ + ransom_03
++ @190 /* Ah, I changed my mind. I'll go now. */ + ransom_01
END

IF ~~ THEN ransom_01
SAY @191 /* Please - if it is more gold you want - we will pay more. */
++ @192 /* Alright, 5000 gold and this is yours. */ DO ~SetGlobal("bs_KnowsPrisonerIntrigue","GLOBAL",8)
EraseJournalEntry(@100094)
EraseJournalEntry(@100097)
GiveGoldForce(5000)
TakePartyItem("bspris6b") DestroyItem("bspris6b")~ SOLVED_JOURNAL @100098 + leaving_02
++ @193 /* Nah, I just changed my mind. I will hold onto it - maybe light a fire with it, or use it when I'll go behind the bushes... who knows. */ + ransom_02
END

IF ~~ THEN ransom_02
SAY @194 /* Oh no... How can someone be so cruel? My guards are not strong enough to take you on, and we both know it. Change your mind and come back, I beg you. */
IF ~~ THEN EXIT
END

IF ~~ THEN ransom_03
SAY @195 /* I would be... very thankful if you would hand over the evidence that will free my son from his unmerited prison sentence... my <PRO_LADYLORD>. */
++ @196 /* See? That wasn't so hard. Here you are. */ DO ~SetGlobal("bs_KnowsPrisonerIntrigue","GLOBAL",8)
EraseJournalEntry(@100094)
EraseJournalEntry(@100097)
GiveGoldForce(3000)
TakePartyItem("bspris6b") DestroyItem("bspris6b")~ SOLVED_JOURNAL @100098 + leaving_01
++ @186 /* Here, take it for free. I decided not make gold out of your family's misery. */ DO ~SetGlobal("bs_KnowsPrisonerIntrigue","GLOBAL",9)
EraseJournalEntry(@100094)
EraseJournalEntry(@100097)
TakePartyItem("bspris6b") DestroyItem("bspris6b")~ SOLVED_JOURNAL @100100 + leaving
++ @188 /* I will, but the price just went up. It's 5000 gold now. */ DO ~SetGlobal("bs_KnowsPrisonerIntrigue","GLOBAL",8)
EraseJournalEntry(@100094)
EraseJournalEntry(@100097)
GiveGoldForce(5000)
TakePartyItem("bspris6b") DestroyItem("bspris6b")~ SOLVED_JOURNAL @100098 + leaving_02
++ @190 /* Ah, I changed my mind. I'll go now. */ + ransom_01
END

IF ~~ THEN leaving
SAY @197 /* I thank you. There seems to be a last spark of honor in you. */
IF ~~ THEN + leaving_03
END

IF ~~ THEN leaving_01
SAY @198 /* I thank you. There seems to be some sort of honor in you left, if one can call it that. */
IF ~~ THEN + leaving_03
END

IF ~~ THEN leaving_02
SAY @199 /* I did not expect otherwise, but still, I thank you. */
IF ~~ THEN + leaving_03
END

IF ~~ THEN leaving_03
SAY @200 /* I will be leaving now. You'd be wise not to stirr any trouble. */
IF ~~ THEN EXIT
END


//Bodyguards
BEGIN bspris08
IF ~RandomNum(3,1)~ THEN bodyguard_01
SAY @201 /* This is close enough. */
IF ~~ THEN EXIT
END

IF ~RandomNum(3,2)~ THEN bodyguard_02
SAY @202 /* Take a step back, please. */
IF ~~ THEN EXIT
END

IF ~RandomNum(3,3)~ THEN bodyguard_03
SAY @203 /* Talk to her Ladyship, not me. */
IF ~~ THEN EXIT
END



/* hand in evidence */
/* to Seatower Commander: in bstrcmdr.d */

/* Duke Eltan */
/* As commander of the Flaming Fist, Duke Eltan would be someone the evidence in favor of his cousin could be handed to, too.
Adding reply options to Duke Eltan is a bit complicated, because in the original BG1 game, he is no longer present with an appropriate dialogue after ch7: he is found sick in his chambers and can be handed to the Harbor Master who then vanishes (with Eltan).
With mods, we have:
bg1ub puts him into the Harbor Master's Building after he was brought there [deltan2.dlg]
bg1re puts him into the Harbor Master's building after he was brought there until after the failed coronation, then he will be in the palace (compatible with bg1ub) [DELTAN2.dlg; adds new dialogue state after Sarevok's death if EBG1 is not installed]
EndlessBG1: puts Eltan into the palace after Sarevok's death (will yield to Transitions) [DELTAN2.dlg]
Transitions: puts Eltan into the palace after Sarevok's death. [DELTAN.dlg]
SoD: Eltan will be in the palace until the PC is ready to march out [BDELTAN.dlg state 10]*/

/* add reply options to DELTAN2 state 2 */
/* can be added anyhow; will only show if a mod places Eltan into the harbor master's building and enables state 2 (like bg1ub and bg1re do) */

EXTEND_BOTTOM DELTAN2 2
+ ~PartyHasItem("bspris6b")
GlobalGT("bs_KnowsPrisonerIntrigue","GLOBAL",0)
GlobalLT("bs_KnowsPrisonerIntrigue","GLOBAL",8)~ + @204 /* I have evidence here to prove that your cousin Malastair is innocent of the attempt on your life for which he was convicted. It was Sarevok all along! */ DO ~SetGlobal("bs_KnowsPrisonerIntrigue","GLOBAL",10)
EraseJournalEntry(@100094)
EraseJournalEntry(@100097)
AddexperienceParty(250)
ReputationInc(1)
TakePartyItem("bspris6b") DestroyItem("bspris6b")~ SOLVED_JOURNAL @100095  + give_evidence
END

APPEND DELTAN2
IF ~~ THEN give_evidence
SAY @205 /* Timothy? He would be innocent? Let me have this at once! */
IF ~Dead("Sarevok")~ THEN + give_evidence_02
IF ~!Dead("Sarevok")~ THEN + give_evidence_01
END

IF ~~ THEN give_evidence_01
SAY @206 /* Ah - just how far do this snake's intrigues go?! I thank you for bringing this to me. I swear, as soon as the situation is resolved and I have full command of the Flaming Fist again, I will see to it that Timothy gets to his rights. I pray to the gods that you will succeed in stopping Sarevok, <CHARNAME>. */
IF ~~ THEN EXIT
END

IF ~~ THEN give_evidence_02
SAY @207 /* Ah - just how far did this snake's intrigues go?! I thank you for bringing this to my attention. I swear on my honor as commander of the Flaming Fist that I will see to it that Timothy gets to his rights. */
IF ~~ THEN EXIT
END

/* Follow-up if evidence was given to commander */
IF WEIGHT #-1
~Dead("Sarevok")
OR(2)
    Global("bs_KnowsPrisonerIntrigue","GLOBAL",9)
    Global("bs_KnowsPrisonerIntrigue","GLOBAL",11)~ THEN thanks
SAY @208 /* <CHARNAME>, I also heard it was you who found the evidence that my cousin convicted for an assassination attempt on me, Timothy Malastair, was indeed innocent. I thank you for handing it in and giving our family a chance to heal. Our gratitude is yours. */
IF ~~ THEN DO ~SetGlobal("bs_KnowsPrisonerIntrigue","GLOBAL",12)~ EXIT
END

END //APPEND

ADD_TRANS_TRIGGER DELTAN2 2 ~False()~ DO 0 UNLESS ~False()~

/* bg1re also inserts another state with reply options */
%BG1RE_ONLY_SLASH%%BG1RE_ONLY_ASTERIKS%

EXTEND_BOTTOM DELTAN2 %deltan2_12%
+ ~PartyHasItem("bspris6b")
GlobalGT("bs_KnowsPrisonerIntrigue","GLOBAL",0)
GlobalLT("bs_KnowsPrisonerIntrigue","GLOBAL",8)~ + @204 /* I have evidence here to prove that your cousin Malastair is innocent of the attempt on your life for which he was convicted. It was Sarevok all along! */ DO ~SetGlobal("bs_KnowsPrisonerIntrigue","GLOBAL",10)
EraseJournalEntry(@100094)
EraseJournalEntry(@100097)
AddexperienceParty(250)
ReputationInc(1)
TakePartyItem("bspris6b") DestroyItem("bspris6b")~ SOLVED_JOURNAL @100095  + give_evidence
END
%BG1RE_ONLY_ASTERIKS%%BG1RE_ONLY_SLASH%

/* bg1re without EBG1/Transitions: add reply option to new dialogue state after Sarevok's death */
%BG1RE_NO_EBG1_ONLY_SLASH%%BG1RE_NO_EBG1_ONLY_ASTERIKS%

EXTEND_BOTTOM DELTAN2 %deltan2_322%
+ ~PartyHasItem("bspris6b")
GlobalGT("bs_KnowsPrisonerIntrigue","GLOBAL",0)
GlobalLT("bs_KnowsPrisonerIntrigue","GLOBAL",8)~ + @204 /* I have evidence here to prove that your cousin Malastair is innocent of the attempt on your life for which he was convicted. It was Sarevok all along! */ DO ~SetGlobal("bs_KnowsPrisonerIntrigue","GLOBAL",10)
EraseJournalEntry(@100094)
EraseJournalEntry(@100097)
AddexperienceParty(250)
ReputationInc(1)
TakePartyItem("bspris6b") DestroyItem("bspris6b")~ SOLVED_JOURNAL @100095 + give_evidence
END

%BG1RE_NO_EBG1_ONLY_ASTERIKS%%BG1RE_NO_EBG1_ONLY_SLASH%


/* EndlessBG1: add reply option to dialogue state after Sarevok's death */

%EBG1_ONLY_SLASH%%EBG1_ONLY_ASTERIKS%

EXTEND_BOTTOM DELTAN2 %deltan2_70%
+ ~PartyHasItem("bspris6b")
GlobalGT("bs_KnowsPrisonerIntrigue","GLOBAL",0)
GlobalLT("bs_KnowsPrisonerIntrigue","GLOBAL",8)~ + @204 /* I have evidence here to prove that your cousin Malastair is innocent of the attempt on your life for which he was convicted. It was Sarevok all along! */ DO ~SetGlobal("bs_KnowsPrisonerIntrigue","GLOBAL",10)
EraseJournalEntry(@100094)
EraseJournalEntry(@100097)
AddexperienceParty(250)
ReputationInc(1)
TakePartyItem("bspris6b") DestroyItem("bspris6b")~ SOLVED_JOURNAL @100095 + give_evidence
END

%EBG1_ONLY_ASTERIKS%%EBG1_ONLY_SLASH%

/* Transitions: add reply option to dialogue state after Sarevok's death */

%TRANSITIONS_ONLY_SLASH%%TRANSITIONS_ONLY_ASTERIKS%

EXTEND_BOTTOM DELTAN %deltan_2057%
+ ~PartyHasItem("bspris6b")
GlobalGT("bs_KnowsPrisonerIntrigue","GLOBAL",0)
GlobalLT("bs_KnowsPrisonerIntrigue","GLOBAL",8)~ + @204 /* I have evidence here to prove that your cousin Malastair is innocent of the attempt on your life for which he was convicted. It was Sarevok all along! */ DO ~SetGlobal("bs_KnowsPrisonerIntrigue","GLOBAL",10)
EraseJournalEntry(@100094)
EraseJournalEntry(@100097)
AddexperienceParty(250)
ReputationInc(1)
TakePartyItem("bspris6b") DestroyItem("bspris6b")~ SOLVED_JOURNAL @100095 + give_evidence
END

APPEND DELTAN

IF ~~ THEN give_evidence
SAY @209 /* Timothy? He would be innocent? Let me have this at once! Ah - just how far did this snake's intrigues go?! I thank you for bringing this to my attention. I swear on my honor as commander of the Flaming Fist that I will see to it that Timothy gets to his rights. */
IF ~~ THEN EXIT
END

END //APPEND

ADD_TRANS_TRIGGER DELTAN %deltan_2057% ~False()~ DO 0

%TRANSITIONS_ONLY_ASTERIKS%%TRANSITIONS_ONLY_SLASH%


/* SoD: add dialogue option */

%SOD_ONLY_SLASH%%SOD_ONLY_ASTERIKS%

EXTEND_BOTTOM BDELTAN 10
+ ~PartyHasItem("bspris6b")
GlobalGT("bs_KnowsPrisonerIntrigue","GLOBAL",0)
GlobalLT("bs_KnowsPrisonerIntrigue","GLOBAL",8)~ + @204 /* I have evidence here to prove that your cousin Malastair is innocent of the attempt on your life for which he was convicted. It was Sarevok all along! */ DO ~SetGlobal("bs_KnowsPrisonerIntrigue","GLOBAL",10)
EraseJournalEntry(@100094)
EraseJournalEntry(@100097)
AddexperienceParty(250)
ReputationInc(1)
TakePartyItem("bspris6b") DestroyItem("bspris6b")~ SOLVED_JOURNAL @100095 + give_evidence
END

APPEND BDELTAN

IF ~~ THEN give_evidence
SAY @209 /* Timothy? He would be innocent? Let me have this at once! Ah - just how far did this snake's intrigues go?! I thank you for bringing this to my attention. I swear on my honor as commander of the Flaming Fist that I will see to it that Timothy gets to his rights. */
IF ~~ THEN EXIT
END

/* Follow-up if evidence was given to commander */
IF WEIGHT #-1
~GlobalLT("BD_plot","global",55)
AreaCheck("bd0102")
OR(2)
    Global("bs_KnowsPrisonerIntrigue","GLOBAL",9)
    Global("bs_KnowsPrisonerIntrigue","GLOBAL",11)~ THEN thanks
SAY @208 /* <CHARNAME>, I also heard it was you who found the evidence that my cousin convicted for an assassination attempt on me, Timothy Malastair, was indeed innocent. I thank you for handing it in and giving our family a chance to heal. Our gratitude is yours. */
IF ~~ THEN DO ~SetGlobal("bs_KnowsPrisonerIntrigue","GLOBAL",12)~ EXIT
END

END //APPEND

%SOD_ONLY_ASTERIKS%%SOD_ONLY_SLASH%
