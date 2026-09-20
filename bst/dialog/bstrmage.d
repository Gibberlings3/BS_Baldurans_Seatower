/* Tower mage Master Shizell 
The diviner prepares potions and other magicks in his workroom.
> Dialogue notes: He's a bit scatter-brained and will spout irrelevant tidbits possibly spouted with relevant hints. More to the point: he will sell potions if the party is persistent.
*/

BEGIN bstrmage


IF ~AreaCheck("bs1011") Global("bsBlackPearlQuest","GLOBAL",0)~ THEN welcome
SAY @0 /* Oh, welcome to my study. I am Master Shizell, the Seatower mage. You look like adventurers who get around. Amongst other things, I am on the lookout for a very rare black pearl. Not the usual kind, but one taken freshly out of its shell. If you ever come across any, please consider bringing it here and I will compensate you accordingly. */
IF ~~ THEN DO ~SetGlobal("bsBlackPearlQuest","GLOBAL",1)~ UNSOLVED_JOURNAL @850 EXIT
END

IF ~AreaCheck("bs1011") RandomNum(8,1)~ THEN greeting_1
SAY @1 /* (humms) */
IF ~~ THEN + open_shop
END

IF ~AreaCheck("bs1011") RandomNum(8,2)
!Global("bsDoppelgangerQuest","GLOBAL",6)~ THEN greeting_2
SAY @2 /* Hm... more powder or more liquid? It's all about the ratio! */
IF ~~ THEN + open_shop
END

IF ~AreaCheck("bs1011") RandomNum(8,3)
!Global("bsDoppelgangerQuest","GLOBAL",6)~ THEN greeting_3
SAY @3 /* Slowly mixing... sloooowly... I don't want to repeat what happened last time. */
IF ~~ THEN + open_shop
END

IF ~AreaCheck("bs1011") RandomNum(8,4)
!Global("bsDoppelgangerQuest","GLOBAL",6)~ THEN greeting_4
SAY @4 /* If stirred properly, this should be *just* as good as the expensive stuff! */
IF ~~ THEN + open_shop
END

IF ~AreaCheck("bs1011") RandomNum(8,5)
!Global("bsDoppelgangerQuest","GLOBAL",6)~ THEN greeting_5
SAY @5 /* Just one more drop... That should do it. */
IF ~~ THEN + open_shop
END


IF ~AreaCheck("ys0103")~ THEN open_shop_doppelgangerquest
SAY @6 /* Is there anything else you want? We should focus on the doppelganger invasion now. */
/* Doppelganger quest */
+ ~Global("bsDoppelgangerQuest","GLOBAL",9) Global("bsDoppelSoldiersStart","MYAREA",0)~ + @7 /* I was told to come here if I want to fight against the doppelgangers. */ + dp_quest_05
+ ~GlobalGT("bs_MageUsesMimicPowder","GLOBAL",0)
GlobalLT("bs_MageUsesMimicPowder","GLOBAL",3)~ + @8 /* What exactly is this "Mimic Powder"? How does it work? */ DO ~SetGlobal("bs_MageUsesMimicPowder","GLOBAL",3)~ + dp_quest_04
++ @9 /* Please show me your wares. */ + shop_01
END

IF ~AreaCheck("bs1011")~ THEN open_shop
SAY @10 /* Is there anything else you want? */
/* Doppelganger quest */
+ ~GlobalGT("bs_MageUsesMimicPowder","GLOBAL",0)
GlobalLT("bs_MageUsesMimicPowder","GLOBAL",3)~ + @8 /* What exactly is this "Mimic Powder"? How does it work? */ DO ~SetGlobal("bs_MageUsesMimicPowder","GLOBAL",3)~ + dp_quest_04

/* fire elemental in storeroom */
+ ~GlobalGT("bsFireElementQuest","GLOBAL",0)
GlobalLT("bsFireElementQuest","GLOBAL",9)
Global("bsAskedFEMage","MYAREA",0)~ + @11 /* There is a fire elemental in the storeroom. */ DO ~SetGlobal("bsAskedFEMage","MYAREA",1)~ + fire_elemental
+ ~GlobalLT("bsFireElementQuest","GLOBAL",8)
PartyHasItem("bsbarrl1") Global("bsAskedCBMage","MYAREA",0)~ + @2014 /* ~[PC talking to a male] Could you coat the inside of this barrel with a fireproof layer? It needs to contain a trapped fire elemental for a time.~ */ DO ~SetGlobal("bsAskedCBMage","MYAREA",1)~ + coat_barrel

/* open shop */
+ ~Global("bsMageOpenedShop","MYAREA",0)~ + @12 /* Do you sell any magic items? */ + shop
+ ~Global("bsMageOpenedShop","MYAREA",1)~ + @9 /* Please show me your wares. */ + shop_01

/* Umber Hulk Plate  */
+ ~PartyHasItem("bsplat02") Global("bsMageUmberHulkPlate","MYAREA",0)~ + @13 /* The armorer made this Umber Hulk Plate and said you expressed interest in enchanting it? */ DO ~SetGlobal("bsMageUmberHulkPlate","MYAREA",1)~ + enchant_umberplate
+ ~PartyHasItem("bsplat02") Global("bsMageUmberHulkPlate","MYAREA",1)
PartyHasItem("POTN21") PartyHasItem("SCRL67") PartyHasItem("MISC42")
PartyGoldGT(5999)~ + @14 /* Please enchant the Umber Hulk Plate. */ + enchant_umberplate_01

/* fed ex quests */
+ ~Global("bsPearlLocation","GLOBAL",0)~ + @15 /* Where do you think I could find such a black pearl? */ DO ~SetGlobal("bsPearlLocation","GLOBAL",1)~ + pearllocation
+ ~Global("bsMageErrands","MYAREA",0)~ + @16 /* Do you have any more errands to do? */ DO ~SetGlobal("bsMageErrands","MYAREA",1)~ + errands
+ ~PartyHasItem("cdbpearl")
GlobalLT("bsBlackPearlQuest","GLOBAL",2)~ + @17 /* I have a black pearl here... would this suffice for your purposes? */ + wrong_pearl
+ ~PartyHasItem("bsblkprl")~ + @18 /* I found a fresh black pearl! It was in a seacave right under this tower. */ DO ~TakePartyItem("bsblkprl") DestroyItem("bsblkprl") SetGlobal("bsFoundBlackPearl","GLOBAL",4) SetGlobal("bsPearlLocation","GLOBAL",1)~ + pearl
+ ~Global("bsMageErrands","MYAREA",1)
OR(2)
PartyHasItem("MISC1I")
PartyHasItem("bdbellad") GlobalLT("bsBroughtBelladonna","GLOBAL",2)~ + @19 /* I have a Belladonna flower for you. */ + belladonna
+ ~Global("bsMageErrands","MYAREA",1) PartyHasItem("MISC01") Global("bsBroughtWolfpelt","MYAREA",0)~ + @20 /* I have a Winter Wolf pelt for you. */ DO ~TakePartyItemNum("MISC01",1) DestroyItem("MISC01") SetGlobal("bsBroughtWolfpelt","MYAREA",1)~ + winterwolf
+ ~Global("bsMageErrands","MYAREA",1) PartyHasItem("MISC12") Global("bsBroughtAnkheg","MYAREA",0)~ + @21 /* I have an Ankheg shell for you. */ DO ~TakePartyItemNum("MISC12",1) DestroyItem("MISC12") SetGlobal("bsBroughtAnkheg","MYAREA",1)~ + ankhegshell

/* High Level Encounter (Glabrezu) */
+ ~Global("bsPCFoundHighLevEnc","GLOBAL",2)
Global("bsToldHighLevEnc","MYAREA",0)~ + @22 /* We found some kind of ritual chamber down in the caves. Do you know anything about it? */ + high_level
+ ~Dead("BSGLABRE")
Global("bsToldHighLevEnc","MYAREA",0)~ + @23 /* We cleared some kind of ritual chamber. It was a prison of a Glabrezu. */ + high_level
+ ~Dead("BSGLABRE")
Global("bsToldHighLevEnc","MYAREA",1)~ + @24 /* We cleared the ritual chamber. It was a prison of a Glabrezu. */ DO ~SetGlobal("bsToldHighLevEnc","MYAREA",2)~ + high_level_01

/* sell other stuff */
+ ~PartyHasItem("MISC6Y") GlobalLT("bsGotMimicBlood","GLOBAL",2)~ + @25 /* I found some mimic blood. Do you have a use for it? */ + mimicblood
+ ~HasItem("MISC6Y",Myself)~ + @26 /* Would you sell back the mimic blood? I need it for something else. */ + mimicblood_02
+ ~PartyHasItem("bsdopd2")~ + @27 /* Do you have further use for the empty flask of your mimic "powder"? */ + empty_flask

/* end dialogue line */
++ @28 /* I'll be on my way. */ EXIT 
END

IF ~~ THEN enchant_umberplate
SAY @29 /* Yes, did he mention that? I have an idea for an enchantment. It would need one potion of Clarity, one scroll of Armor, and one diamond. Oh - and I'd need payment, too. 6000 gold. I should be able to make it a very suitable armor to kill more of its kind by giving it protection against their strongest mind confusing spells. */
IF ~~ THEN UNSOLVED_JOURNAL @100178 + open_shop
END

IF ~~ THEN enchant_umberplate_01
SAY @30 /* With pleasure! I'm trying a new way of applying the anchantment, it's why I was interested in trying it on a freshly made hide armor. It should only take a moment! */
IF ~~ THEN DO ~SetGlobal("bsMageUmberHulkPlate","MYAREA",2)
ClearAllActions()
StartCutSceneMode()
StartCutScene("bscut002")~ EXIT
END

IF WEIGHT #-1
~Global("bsMageUmberHulkPlate","MYAREA",2)~ THEN enchant_umberplate_done
SAY @31 /* And - here you are! I think this worked quite well. I found potential to optimize a few things, though. I need to return to the scetch board, please do not bring any more armor to me for the time being. */
IF ~~ THEN DO ~SetGlobal("bsMageUmberHulkPlate","MYAREA",3)~ EXIT
END


CHAIN
IF ~~ THEN bstrmage high_level
@32 /* I wasn't aware such a dungeon lies beneath the tower! This is fascinating. Hmm, I have a theory where it could originate from, but I'd need to do a lot of research to actually proof anything. Fact is, with all the history around Baldur's Gate in general and Balduran's Seatower especially, I am not surprised we find unknown dungeons beneath it. */
== bstrmage IF ~Global("bsBlackPearlQuest","GLOBAL",2)~ THEN @33 /* *Apparently*, there also is a seacave that harbored a black pearl I wasn't aware of, either - for instance. */
END
IF ~~ THEN DO ~SetGlobal("bsToldHighLevEnc","MYAREA",1)~ EXIT
IF ~Dead("BSGLABRE")~ THEN + high_level_01


APPEND bstrmage
IF ~~ THEN high_level_01
SAY @34 /* A Glabrezu is a mighty foe. It takes lots of magic to contain such a creature. Hmm, hmm, no, then my first theory about the origins of the dungeon do not hold. This will need much more investigation, yes, yes ... Ah - thank you for informing me about this. */
IF ~~ THEN DO ~SetGlobal("bsToldHighLevEnc","MYAREA",2)~ EXIT
END

IF ~~ THEN fire_elemental
SAY @35 /* The storeroom? How did it get there; did the cook stir the fire too much? They do get attracted to great fires sometimes. Let the Tower Guard deal with it if you don't want to fight it yourself. Or, even better - get it back into the fire. It needs to be a big fire, though - a large fire will help it return to its home plane. I'm sure it didn't want to end up in the damp cellar. */
IF ~~ THEN  UNSOLVED_JOURNAL @906 /* ~Fire Elemental in the Seatower Storeroom

Master Shizell, the Tower Mage, suggested that instead of fighting it, the fire elemental be returned to its home plane by luring it back to a large enough fire.~ */ EXIT
END

IF ~~ THEN coat_barrel
SAY @36 /* Ah, I'm not so confident with enchanting wood in such... mundane shape. Maybe Garalt or Matha could help you with this? That would be the tower armorer or fletcher. I am sure I can sell you the needed magics for it, though, if you want to have a look. */
IF ~~ THEN EXIT
END

IF ~~ THEN shop
SAY @37 /* Magic items? You mean like potions and scrolls and stuff? */
IF ~~ THEN DO ~SetGlobal("bsMageOpenedShop","MYAREA",1)~ + shop_01
END

IF ~~ THEN shop_01
SAY @38 /* Very well. */
IF ~~ THEN DO ~StartStore("bstrmage",LastTalkedToBy(Myself))~ EXIT
END

IF ~~ THEN errands
SAY @39 /* Actually, I do. I am working on fortifying the Seatower's magical defences. For this I need some ingredients normally not available in any shop: one flower of the Belladonna plant, an Ankheg shell, and the pelt of a Winter Wolf. If you happen to get hold of one or all of those things then bring them to me and I will pay you accordingly. */
IF ~~ THEN UNSOLVED_JOURNAL @852 EXIT
END

IF ~~ THEN pearllocation
SAY @40 /* Oh, it is said that they tend to form inside shells found in calm pools of salty water - which are rather rare. Maybe you will get lucky looking in a secluded tidepool - but I don't know where to look for one along the coast - all the nearby ones have already been picked over. I wouldn't be asking every adventurer who shows up on my doorstep if I knew where to find them, and the places one was found usually do not contain a second one. */
IF ~~ THEN DO ~EraseJournalEntry(@850)~ UNSOLVED_JOURNAL @851 EXIT
END

IF ~~ THEN pearl
SAY @41 /* A black pearl! You are the first one to actually return with one. And it was... it was right under this tower?! Now I feel foolish. All this time it was right behind a wall... Thank you for bringing it to me. Here is 2000 gold as compensation. */
IF ~~ THEN DO ~GiveGoldForce(2000) 
EraseJournalEntry(@850)
EraseJournalEntry(@851)
EraseJournalEntry(@858)
SetGlobal("bsBlackPearlQuest","GLOBAL",2)~ UNSOLVED_JOURNAL @857 EXIT
END

IF ~~ THEN belladonna
SAY @42 /* Wonderful! I sense you had to go far for that one. */
+ ~Global("bsBroughtBelladonna","GLOBAL",1)~ + @43 /* Yes, yes. I had to go really, *really* far and master the most dangerous of situations to get it. It was guarded - by a dragon, I tell you. A dragon! */ + belladonna_02
+ ~Global("bsBroughtBelladonna","GLOBAL",1)~ + @44 /* Actually, I found it right in this kitchen's storeroom. */ + belladonna_03
+ ~Global("bsBroughtBelladonna","GLOBAL",1)~ + @45 /* Whatever. I'm here now. */ + belladonna_01
IF ~Global("bsBroughtBelladonna","GLOBAL",0)~ THEN + belladonna_01
END

IF ~~ THEN belladonna_01
SAY @46 /* Here is your payment, 300 gold. */
IF ~PartyHasItem("bdbellad")~ THEN DO ~TakePartyItemNum("bdbellad",1) DestroyItem("MISC1I") GiveGoldForce(300) SetGlobal("bsBroughtBelladonna","GLOBAL",2)~ UNSOLVED_JOURNAL @853 EXIT
IF ~PartyHasItem("MISC1I")~ THEN DO ~TakePartyItemNum("MISC1I",1) DestroyItem("MISC1I") GiveGoldForce(300) SetGlobal("bsBroughtBelladonna","GLOBAL",2)~ UNSOLVED_JOURNAL @853 EXIT
END

IF ~~ THEN belladonna_02
SAY @47 /* A dragon? Surely you jest! */
IF ~~ THEN + belladonna_01
END

IF ~~ THEN belladonna_03
SAY @48 /* The kit... Well, *I* will not go there and give it back - and I really do have a good use for it. Ahem. This will be our little secret, yes? */
IF ~~ THEN + belladonna_01
END

IF ~~ THEN winterwolf
SAY @49 /* Great! And such a fluffy one. I'll give you 600 gold for it. */
IF ~~ THEN DO ~GiveGoldForce(600)~ UNSOLVED_JOURNAL @854 EXIT
END

IF ~~ THEN ankhegshell
SAY @50 /* Indeed! I hope it didn't put up too much of a fight. Here is 500 gold for your efforts. */
IF ~~ THEN DO ~GiveGoldForce(500)~ UNSOLVED_JOURNAL @855 EXIT
END
END //APPEND

CHAIN
IF ~~ THEN bstrmage mimicblood
@51 /* Oh, yes, that always comes in handy. I'll give you 500 gold for it. */
== bstrmage IF ~GlobalGT("bsGotMimicBlood","GLOBAL",0)~ THEN @52 /* This will be the last I am buying. I do not need it regularly. */
== bstrmage IF ~!HasItem("MISC6Y",Myself) GlobalGT("bsGotMimicBlood","GLOBAL",0)~ THEN @53 /* That's weird. I could have sworn I already bought one from you, but I can't seem to find it anywhere... Still, this will be the last one I'll buy from you. */
END
++ @54 /* Sounds like a good deal. */ DO ~TakePartyItem("MISC6Y") GiveGoldForce(500) IncrementGlobal("bsGotMimicBlood","GLOBAL",1)~ + mimicblood_01
++ @55 /* No, I'll keep it then. */ + open_shop

APPEND bstrmage
IF ~~ THEN mimicblood_01
SAY @56 /* Here you are. */
IF ~~ THEN EXIT
END

IF ~~ THEN mimicblood_02
SAY @57 /* I do, actually. I would sell it to you for 500 gold. */
+ ~PartyGoldGT(499)~ + @54 /* Sounds like a good deal. */ DO ~GiveItem("MISC6Y",[PC]) TakePartyGold(500)~ + mimicblood_01
+ ~!PartyGoldGT(499)~ + @58 /* Seems I don't have enough gold. */ + open_shop
++ @59 /* No, maybe I'll find another one elsewhere. */ + open_shop
END

IF ~~ THEN empty_flask
SAY @60 /* I do, actually! Those half-open flask are rather hard to come by. Here, a little gold as a compensation. */
IF ~~ THEN DO ~GiveGoldForce(150) TakePartyItem("bsdopd2") DestroyItem("bsdopd2")~ EXIT
END

END //APPEND


CHAIN
IF ~~ THEN bstrmage wrong_pearl
@61 /* Ah, no, this one is already too dry. */
== bstrmage IF ~Global("BS_MageMentionsDrying","MYAREA",0)~ THEN @62 /* I want a fresh one for a special drying process I invented - it should make the pearl even more powerful. */ DO ~SetGlobal("BS_MageMentionsDrying","MYAREA",1)~
END
IF ~~ THEN + open_shop
