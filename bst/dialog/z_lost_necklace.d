/* quest "The Lost Necklace" */

BEGIN bsqln001 //Melly
IF ~Global("bs_LostNecklaceQuest","GLOBAL",2)~ THEN in_barracks
SAY @0 /* (sniffle) */ //I want my mommy!
IF ~~ THEN EXIT
END

IF ~AreaCheck("bs1010")
GlobalGT("bs_LostNecklaceQuest","GLOBAL",3)~ THEN in_tavern
SAY @1 /* Did you see my necklace? */
IF ~~ THEN EXTERN bsqln002 lost_necklace_01
IF ~Global("bs_LostNecklaceGreeting","MYAREA",0)~ THEN EXTERN bsqln002 lost_necklace
END

BEGIN bsqln002 //Mrs. Souter
IF ~AreaCheck("ys0103")
GlobalGT("bs_LostNecklace","MYAREA",3)
GlobalLT("bs_LostNecklace","MYAREA",9)~ THEN searching
SAY @2 /* Excuse me, I don't have time to chat. I have to go and pick up my daughter from the Seatower Captain. */
IF ~~ THEN EXIT
END

IF ~AreaCheck("bs1010")
GlobalGT("bs_LostNecklaceQuest","GLOBAL",3)
Global("bs_LostNecklaceGreeting","MYAREA",0)~ THEN lost_necklace
SAY @3 /* My daughter! We had a look at the big chain in the Winch house and suddenly she was *gone*! I am so glad she was found so quickly. And now she is missing her necklace. */
IF ~~ THEN DO ~SetGlobal("bs_LostNecklaceGreeting","MYAREA",1)~ + lost_necklace_01
END

IF ~AreaCheck("bs1010")
GlobalGT("bs_LostNecklaceQuest","GLOBAL",3)
GlobalLT("bs_LostNecklaceQuest","GLOBAL",10)
Global("bs_LostNecklaceGreeting","MYAREA",1)~ THEN lost_necklace_01
SAY @4 /* (sigh) She must have lost her necklace while roaming around. */
+ ~PartyHasItem("bsqln001")~ + @5 /* Might it be this one, by any chance? */ EXTERN bsqln001 necklace
++ @6 /* (lie) Oh, such a pity. I think I saw your necklace - in the beak of a magpie, flying high over the towers! */ EXTERN bsqln001 necklace_gone

+ ~Global("bs_LostNecklaceQuest","GLOBAL",4)~ + @7 /* Alright, I'll look for your necklace. Where could it be? */ DO ~SetGlobal("bs_LostNecklaceQuest","GLOBAL",5)~ UNSOLVED_JOURNAL @100078 EXTERN bsqln001 necklace_where
++ @8 /* And thankfully, none of this is my problem. */ + bye_dignified
++ @9 /* A pity. good day. */ + bye
END

IF ~~ THEN bye_dignified
SAY @10 /* Indeed. If you'll excuse us. */
IF ~~ THEN EXIT
END

IF ~~ THEN bye
SAY @11 /* Good day to you, too, <PRO_SIRMAAM>. */
IF ~~ THEN EXIT
END

CHAIN
IF ~~ THEN bsqln001 necklace_where
@12 /* Anywere from here ... to the apples! */
== bsqln002 @13 /* Darling, I think the good <PRO_MANWOMAN> needs it a bit more specific. - Good <PRO_SIRMAAM>, I was told my daughter was found in one of the baskets in the East Tower - wherever that is, and I lost her in the Winch house. My assumption is that she must have lost her necklace somewhere between these two. But we already searched everywhere... I don't know what she means by "apples". I am sure she doesn't mean the kitchen. That cook makes sure noone comes into there! I would be very grateful if you could keep an eye out. She is very fond of that necklace. */
== ~%SKIE_JOINED%~ IF ~InParty("skie") InMyArea("skie") !StateCheck("skie",CD_STATE_NOTVALID)~ THEN @14 /* [Skie]I can *so* relate to that. I also used to have a necklace that I was *so* fond of.... Wait, where did that actually go? */
EXIT

CHAIN
IF ~~ THEN bsqln001 necklace
@15 /* My necklace! */
== bsqln002 @16 /* Why yes, it is, indeed! Thank you so much for fidning it - and returning it to us! How do you say, Melly? */
== bsqln001 @17 /* Thank you. */
== bsqln002 @18 /* Take this for compensation. Ah - we can finally go home! Come on, Melly. What an exciting day! */
== ~%IMOEN_JOINED%~ IF ~InParty("%IMOEN_DV%") InMyArea("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @19 /* [Imoen]Aww, did you see the look in her eyes? That was fun, <CHARNAME>! */
END
IF ~~ THEN DO ~ActionOverride("bsqln001",TakePartyItem("bsqln001"))
GiveGoldForce(500)
EraseJournalEntry(@100078)
EraseJournalEntry(@100080)
AddexperienceParty(250) SetGlobal("bs_LostNecklaceQuest","GLOBAL",11)~ SOLVED_JOURNAL @100081 EXIT

CHAIN
IF ~~ THEN bsqln001 necklace_gone
@20 /* What? No! My necklace! */
== ~%IMOEN_JOINED%~ IF ~InParty("%IMOEN_DV%") InMyArea("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @21 /* [Imoen]Aww, did you see the hope die in her eyes? That was no fun, <CHARNAME>! */
== ~%JAHEIRA_JOINED%~ IF ~InParty("jaheira") InMyArea("jaheira") !StateCheck("jaheira",CD_STATE_NOTVALID)~ THEN @22 /* [Jaheira]You have a cruel heart, <CHARNAME>. */
== ~%KHALID_JOINED%~ IF ~InParty("khalid") InMyArea("khalid") !StateCheck("khalid",CD_STATE_NOTVALID)~ THEN @23 /* [Khalid]G-gorion would not be proud, <CHARNAME>. */
== bsqln002 @24 /* Hmm, I'm not sure I like that look in your eyes, <PRO_SIRMAAM>, but the <PRO_MANWOMAN> has a point, Melly - we won't find the necklace again, at least not today. We're going home now. Come on, Melly. (sigh) What an exciting day. */
END
IF ~~ THEN DO ~AddexperienceParty(250)
EraseJournalEntry(@100078)
EraseJournalEntry(@100080) SetGlobal("bs_LostNecklaceQuest","GLOBAL",10)~ SOLVED_JOURNAL @100079 EXIT


BEGIN bsqln003 //Tower Guard
IF ~Global("bs_LostNecklaceQuest","GLOBAL",2)
Global("bs_toldstory","GLOBAL",0)~ THEN in_barracks
SAY @25 /* This girl was hiding in one of the baskets - right next to the stones for the trebuchets! */
IF ~~ THEN DO ~SetGlobal("bs_toldstory","GLOBAL",1)~ EXIT
END
IF ~Global("bs_toldstory","GLOBAL",1)~ THEN in_barracks_01
SAY @26 /* It's alright. Your mom's already here. */
IF ~~ THEN EXIT
END


/*


[FCHIL02] //crying girl

*/
