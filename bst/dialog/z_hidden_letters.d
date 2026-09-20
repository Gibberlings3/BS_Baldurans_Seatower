/* hidden letters side quest */


BEGIN bshdlet1

IF ~Global("bs_HiddenLetters","GLOBAL",1)~ THEN caught
SAY @0 /* Oh! Where did you come from? I-I was only admiring the great stone work of these walls. I didn't do anything else. I mean, what else would I do touching the stones? - I'll be leaving, then. */
IF ~~ THEN DO ~SetInterrupt(FALSE)
SetGlobal("bs_HiddenLetters","GLOBAL",2) ActionOverride("bshdlet1", EscapeAreaDestroy(5))
SetInterrupt(TRUE)~ EXIT
END

IF ~Global("bs_HiddenLetters","GLOBAL",21)
OR(3)
    HasItem("bshdlet1","wallhole")
    HasItem("bshdlet2","wallhole")
    HasItem("bshdlet3","wallhole")~ THEN look_what_i_found
SAY @1 /* Oh - there *is* a letter! I thought it's gone... Ahem. Good day to you, dear <PRO_SIRMAAM>. */
IF ~~ THEN DO ~SetInterrupt(FALSE)
SetGlobal("bs_HiddenLetters","GLOBAL",22)
ActionOverride("bshdlet1", EscapeAreaDestroy(5))
SetInterrupt(TRUE)~ EXIT
END

IF ~Global("bs_HiddenLetters","GLOBAL",21)
!HasItem("bshdlet1","wallhole")
!HasItem("bshdlet2","wallhole")
!HasItem("bshdlet3","wallhole")~ THEN gone
SAY @2 /* Oh, he didn't reply... My letter is gone, so he must have taken it, it was such a good hiding place. But no reply... */
+ ~Global("bs_HiddenLetters","GLOBAL",3)~ + @3 /* I must apologize. I took your letter without realizing the consequences. */ + gone_01
+ ~OR(2)
Global("bs_HiddenLetters","GLOBAL",6)
Global("bs_HiddenLetters","GLOBAL",9)~ + @4 /* I must apologize. I took your correspondence without realizing the consequences. */ + gone_01
++ @5 /* It was a crappy hiding place. I found your correspondence. */ + gone_01
++ @6 /* Woops, I knew I shouldn't have taken it. */ + gone_01
++ @7 /* Maybe, you know, the letter was removed by other means. Someone found it, a mouse used it for their nest, these kind of things. */ + gone_02
++ @8 /* So, the letter is gone. So what? Go and fight for your love, girl! Do not let yourself be put aside without hearing it from him, personally. */ + gone_02
++ @9 /* Oh, yes. I am sure he forgot about you completely! This has to be the only reason for a missing reply, the signs are obvious! */ + gone_02
+ ~OR(3)
PartyHasItem("bshdlet1")
PartyHasItem("bshdlet2")
PartyHasItem("bshdlet3")~ + @10 /* No, I took your precious letter. What would it be worth to you, hmm? */ + gone_09
++ @11 /* I couldn't care less. I'll take my leave. */ + gone_10
END

IF ~~ THEN gone_01
SAY @12 /* You...? */
+ ~PartyHasItem("bshdlet1")~ + @13 /* Yes. Here, take it back, and my apologies. */ DO ~ActionOverride("bshdlet1",TakePartyItem("bshdlet1")) ActionOverride("bshdlet1",DestroyItem("bshdlet1"))~ + gone_06
+ ~PartyHasItem("bshdlet2")~ + @13 /* Yes. Here, take it back, and my apologies. */ DO ~ActionOverride("bshdlet1",TakePartyItem("bshdlet2")) ActionOverride("bshdlet1",DestroyItem("bshdlet2"))~ + gone_06
+ ~PartyHasItem("bshdlet3")~ + @13 /* Yes. Here, take it back, and my apologies. */ DO ~ActionOverride("bshdlet1",TakePartyItem("bshdlet3")) ActionOverride("bshdlet1",DestroyItem("bshdlet3"))~ + gone_06
++ @14 /* Yes, I did, but I can't give them back. I do apologize. */ + gone_04
++ @15 /* And I appreciated it very much. You know, as an adventurer you never know when you'll need to go behind the bushes. */ + gone_03
++ @16 /* Yep, and they are gone. Best you get lost, too. */ + gone_07
+ ~OR(3)
PartyHasItem("bshdlet1")
PartyHasItem("bshdlet2")
PartyHasItem("bshdlet3")~ + @17 /* Well, let's say I'd have your precious letter. What would it be worth to you, hmm? */ + gone_09
END

IF ~~ THEN gone_02
SAY @18 /* You-you think...? */
+ ~PartyHasItem("bshdlet1")~ + @19 /* Actually, it was me who took your correspondence. Apologies. Here, take it back. */ DO ~ActionOverride("bshdlet1",TakePartyItem("bshdlet1")) ActionOverride("bshdlet1",DestroyItem("bshdlet1"))~ + gone_06
+ ~PartyHasItem("bshdlet2")~ + @19 /* Actually, it was me who took your correspondence. Apologies. Here, take it back. */ DO ~ActionOverride("bshdlet1",TakePartyItem("bshdlet2")) ActionOverride("bshdlet1",DestroyItem("bshdlet2"))~ + gone_06
+ ~PartyHasItem("bshdlet3")~ + @19 /* Actually, it was me who took your correspondence. Apologies. Here, take it back. */ DO ~ActionOverride("bshdlet1",TakePartyItem("bshdlet3")) ActionOverride("bshdlet1",DestroyItem("bshdlet3"))~ + gone_06
++ @20 /* Actually, it was me who took your correspondence, but I can't give them back. I do apologize. */ + gone_04
++ @21 /* I do believe that you should not read too much into a missing letter but should look for certainty, yes. */ + gone_04
++ @22 /* If there is no letter even though this is your hidden place for messages, then I do believe he is not *that* interested in you, yes. */ + gone_05
++ @23 /* No, I took your precious letter, and they are gone. Best you get lost, too. */ + gone_07
+ ~OR(3)
PartyHasItem("bshdlet1")
PartyHasItem("bshdlet2")
PartyHasItem("bshdlet3")~ + @10 /* No, I took your precious letter. What would it be worth to you, hmm? */ + gone_09
++ @24 /* This conversation took long enough. I'll take my leave. */ + gone_10
END

IF ~~ THEN gone_03
SAY @25 /* That's-that's *disgusting* Get away from me, you brute! */
IF ~~ THEN DO ~ReputationInc(-1) SetGlobal("bs_HiddenLetters","GLOBAL",22) ActionOverride("bshdlet1", EscapeAreaDestroy(5))~ EXIT
END

IF ~~ THEN gone_04
SAY @26 /* I... I need to go to him, at *once*! */
IF ~~ THEN DO ~SetGlobal("bs_HiddenLetters","GLOBAL",22) ActionOverride("bshdlet1", EscapeAreaDestroy(5))~ EXIT
END

IF ~~ THEN gone_05
SAY @27 /* Oh no! I feared this would happen! */
IF ~~ THEN DO ~SetGlobal("bs_HiddenLetters","GLOBAL",22) ActionOverride("bshdlet1", EscapeAreaDestroy(5))~ EXIT
END

IF ~~ THEN gone_06
SAY @28 /* Well, thank you - I guess. Ugh, the secret hiding place was not so secret after all! */
IF ~~ THEN + gone_04
END

IF ~~ THEN gone_07
SAY @29 /* You-you're such a brute! */
IF ~~ THEN DO ~ReputationInc(-1) SetGlobal("bs_HiddenLetters","GLOBAL",22) ActionOverride("bshdlet1", EscapeAreaDestroy(5))~ EXIT
END

IF ~~ THEN gone_09
SAY @30 /* You-you're such a bute! Fine, take *this* in exchange. */
IF ~PartyHasItem("bshdlet1")~ THEN DO ~ActionOverride("bshdlet1",GiveItemCreate("ring17",LastTalkedToBy(Myself),1,0,0)) ActionOverride("bshdlet1",TakePartyItem("bshdlet1")) ActionOverride("bshdlet1",DestroyItem("bshdlet1")) ReputationInc(-1)~ + gone_04
IF ~PartyHasItem("bshdlet2")~ THEN DO ~ActionOverride("bshdlet1",GiveItemCreate("ring17",LastTalkedToBy(Myself),1,0,0))  ActionOverride("bshdlet1",TakePartyItem("bshdlet2")) ActionOverride("bshdlet1",DestroyItem("bshdlet2")) ReputationInc(-1)~ + gone_04
IF ~PartyHasItem("bshdlet3")~ THEN DO ~ActionOverride("bshdlet1",GiveItemCreate("ring17",LastTalkedToBy(Myself),1,0,0))  ActionOverride("bshdlet1",TakePartyItem("bshdlet3")) ActionOverride("bshdlet1",DestroyItem("bshdlet3")) ReputationInc(-1)~ + gone_04
END

IF ~~ THEN gone_10
SAY @31 /* Ugh. Rude! */
IF ~~ THEN DO ~SetGlobal("bs_HiddenLetters","GLOBAL",22) ActionOverride("bshdlet1", EscapeAreaDestroy(5))~ EXIT
END
