/* Tower mage Master Shizell 
The diviner prepares potions and other magicks in his workroom.
> Dialogue notes: He's a bit scatter-brained and will spout irrelevant tidbits possibly spouted with relevant hints. More to the point: he will sell potions if the party is persistent.
*/

BEGIN bstrmage


IF ~AreaCheck("bs1011") Global("bsBlackPearlQuest","GLOBAL",0)~ THEN welcome
SAY ~Oh, welcome to my study. I am Master Shizell, the Seatower mage. You look like adventurers who get around. Amongst other things, I am on the lookout for a very rare black pearl. Not the usual kind, but one taken freshly out of its shell. If you ever come across any, please consider bringing it here and I will compensate you accordingly.~
IF ~~ THEN DO ~SetGlobal("bsBlackPearlQuest","GLOBAL",1)~ UNSOLVED_JOURNAL @850 EXIT
END

IF ~AreaCheck("bs1011") RandomNum(8,1)~ THEN greeting_1
SAY ~(humms)~
IF ~~ THEN + open_shop
END

IF ~AreaCheck("bs1011") RandomNum(8,2)
!Global("bsDoppelgangerQuest","GLOBAL",6)~ THEN greeting_2
SAY ~Hm... more powder or more liquid? It's all about the ratio!~
IF ~~ THEN + open_shop
END

IF ~AreaCheck("bs1011") RandomNum(8,3)
!Global("bsDoppelgangerQuest","GLOBAL",6)~ THEN greeting_3
SAY ~Slowly mixing... sloooowly... I don't want to repeat what happened last time.~
IF ~~ THEN + open_shop
END

IF ~AreaCheck("bs1011") RandomNum(8,4)
!Global("bsDoppelgangerQuest","GLOBAL",6)~ THEN greeting_4
SAY ~If stirred properly, this should be *just* as good as the expensive stuff!~
IF ~~ THEN + open_shop
END

IF ~AreaCheck("bs1011") RandomNum(8,5)
!Global("bsDoppelgangerQuest","GLOBAL",6)~ THEN greeting_5
SAY ~Just one more drop... That should do it.~
IF ~~ THEN + open_shop
END

IF ~OR(2)
AreaCheck("bs1011") 
GlobalGT("bsDoppelgangerQuest","GLOBAL",5)~ THEN open_shop
SAY ~Is there anything else you want?~
/* Doppelganger quest */
+ ~Global("bsDoppelgangerQuest","GLOBAL",9) Global("bsDoppelSoldiersStart","MYAREA",0)~ + ~I was told to come here if I want to fight against the doppelgangers.~ + dp_quest_05
+ ~PartyHasItem("bsdopdr") Global("bsDGQAskedMP","GLOBAL",0)~ + ~What exactly is this "Mimic Powder"? How does it work?~ DO ~SetGlobal("bsDGQAskedMP","GLOBAL",1)~ + dp_quest_04
+ ~PartyHasItem("MISC6Y") GlobalLT("bsGotMimicBlood","GLOBAL",2)~ + ~I found some mimic blood. Do you have a use for it?~ + mimicblood
+ ~HasItem("MISC6Y",Myself)~ + ~Would you sell back the mimic blood? I need it for something else.~ + mimicblood_02
+ ~PartyHasItem("bsdopd2")~ + ~Do you have further use for the empty flask of your mimic "powder"?~ + empty_flask

/* fire elemental in storeroom */
+ ~GlobalGT("bsFireElementQuest","GLOBAL",0)
GlobalLT("bsFireElementQuest","GLOBAL",9)
Global("bsAskedFEMage","GLOBAL",0)~ + ~There is a fire elemental in the storeroom.~ DO ~SetGlobal("bsAskedFEMage","GLOBAL",1)~ + fire_elemental
+ ~GlobalLT("bsFireElementQuest","GLOBAL",8)
PartyHasItem("bsbarrl1") Global("bsAskedCBMage","GLOBAL",0)~ + @2014 /* ~[PC talking to a male] Could you coat the inside of this barrel with a fireproof layer? It needs to contain a trapped fire elemental for a time.~ */ DO ~SetGlobal("bsAskedCBMage","GLOBAL",1)~ + coat_barrel

/* open shop */
+ ~Global("bsMageOpenedShop","GLOBAL",0)~ + ~Do you sell any magic items?~ + shop
+ ~Global("bsMageOpenedShop","GLOBAL",1)~ + ~Please show me your wares.~ + shop_01

/* fed ex quests */
+ ~Global("bsPearlLocation","GLOBAL",0)~ + ~Where do you think I could find such a Black Pearl?~ DO ~SetGlobal("bsPearlLocation","GLOBAL",1)~ + pearllocation
+ ~Global("bsMageErrands","GLOBAL",0)~ + ~Do you have any more errands to do?~ DO ~SetGlobal("bsMageErrands","GLOBAL",1)~ + errands
+ ~PartyHasItem("cdbpearl")~ + ~I have a black pearl here... would this suffice for your purposes?~ + wrong_pearl
+ ~PartyHasItem("bsblkprl")~ + ~I found a fresh Black Pearl! It was in a sea cave right under this tower.~ DO ~TakePartyItem("bsblkprl") DestroyItem("bsblkprl") SetGlobal("bsFoundBlackPearl","GLOBAL",4) SetGlobal("bsPearlLocation","GLOBAL",1)~ + pearl
+ ~Global("bsMageErrands","GLOBAL",1) 
OR(2)
PartyHasItem("MISC1I")
PartyHasItem("bdbellad") Global("bsBroughtBelladonna","GLOBAL",0)~ + ~I have a Belladonna flower for you.~ DO ~SetGlobal("bsBroughtBelladonna","GLOBAL",1)~ + belladonna
+ ~Global("bsMageErrands","GLOBAL",1) PartyHasItem("MISC01") Global("bsBroughtWolfpelt","GLOBAL",0)~ + ~I have a Winter Wolf pelt for you.~ DO ~TakePartyItemNum("MISC01",1) DestroyItem("MISC01") SetGlobal("bsBroughtWolfpelt","GLOBAL",1)~ + winterwolf
+ ~Global("bsMageErrands","GLOBAL",1) PartyHasItem("MISC12") Global("bsBroughtAnkheg","GLOBAL",0)~ + ~I have an Ankheg shell for you.~ DO ~TakePartyItemNum("MISC12",1) DestroyItem("MISC12") SetGlobal("bsBroughtAnkheg","GLOBAL",1)~ + ankhegshell

/* end dialogue line */
++ ~I'll be on my way.~ EXIT 
END

IF ~~ THEN fire_elemental
SAY ~The storeroom? How did it get there; did the cook stir the fire too much?  They do get attracted to great fires sometimes. Let the Tower Guard deal with it if you don't want to fight it yourself. Or, even better - get it back into the fire. It needs to be a big fire, though - a large fire will help it return to its home plane. I'm sure it didn't want to end up in the damp cellar.~
IF ~~ THEN  UNSOLVED_JOURNAL @906 /* ~Fire Elemental in the Seatower Storeroom

Master Shizell, the Tower Mage, suggested that instead of fighting it, the fire elemental be returned to its home plane by luring it back to a large enough fire.~ */ EXIT
END

IF ~~ THEN coat_barrel
SAY ~Ah, I'm not so confident with enchanting wood in such... mundane shape. Maybe Garalt or Matha could help you with this? That would be the tower armorer or fletcher. I am sure I can sell you the needed magics for it, though, if you want to have a look.~
IF ~~ THEN EXIT
END

IF ~~ THEN shop
SAY ~Magic items? You mean like potions and scrolls and stuff?~
IF ~~ THEN DO ~SetGlobal("bsMageOpenedShop","GLOBAL",1)~ + shop_01
END

IF ~~ THEN shop_01
SAY ~Very well.~
IF ~~ THEN DO ~StartStore("bstrmage",LastTalkedToBy(Myself))~ EXIT
END

IF ~~ THEN errands
SAY ~Actually, I do. I am working on fortifying the Seatower's magical defences. For this I need some ingredients normally not available in any shop: one flower of the Belladonna plant, an Ankheg shell, and the pelt of a Winter Wolf. If you happen to get hold of one or all of those things then bring them to me and I will pay you accordingly.~
IF ~~ THEN UNSOLVED_JOURNAL @852 EXIT
END

IF ~~ THEN pearllocation
SAY ~Oh, it is said that they tend to form inside shells found in calm pools of salty water - which are rather rare. Maybe you will get lucky looking in a secluded tidepool - but I don't know where to look for one along the coast - all the nearby ones have already been picked over. I wouldn't be asking every adventurer who shows up on my doorstep if I knew where to find them, and the places one was found usually do not contain a second one.~
IF ~~ THEN DO ~EraseJournalEntry(@850)~ UNSOLVED_JOURNAL @851 EXIT
END

IF ~~ THEN pearl
SAY ~A black pearl! You are the first one to actually return with one. And it was... it was right under this tower?! Now I feel foolish. All this time it was right behind a wall... Thank you for bringing it to me. Here is 2000 gold as compensation.~
IF ~~ THEN DO ~GiveGoldForce(2000) 
EraseJournalEntry(@850)
EraseJournalEntry(@851)
EraseJournalEntry(@858)
SetGlobal("bsBlackPearlQuest","GLOBAL",2)~ UNSOLVED_JOURNAL @857 EXIT
END

IF ~~ THEN belladonna
SAY ~Wonderful! I sense you had to go far for that one. Here is your payment, 300 gold.~
IF ~PartyHasItem("bdbellad")~ THEN DO ~TakePartyItemNum("bdbellad",1) DestroyItem("MISC1I") GiveGoldForce(300)~ UNSOLVED_JOURNAL @853 EXIT
IF ~PartyHasItem("MISC1I")~ THEN DO ~TakePartyItemNum("MISC1I",1) DestroyItem("MISC1I") GiveGoldForce(300)~ UNSOLVED_JOURNAL @853 EXIT
END

IF ~~ THEN winterwolf
SAY ~Great! And such a fluffy one. I'll give you 600 gold for it.~
IF ~~ THEN DO ~GiveGoldForce(600)~ UNSOLVED_JOURNAL @854 EXIT
END

IF ~~ THEN ankhegshell
SAY ~Indeed! I hope it didn't put up too much of a fight. Here is 500 gold for your efforts.~
IF ~~ THEN DO ~GiveGoldForce(500)~ UNSOLVED_JOURNAL @855 EXIT
END

CHAIN
IF ~~ THEN bstrmage mimicblood
~Oh, yes, that always comes in handy. I'll give you 500 gold for it.~
== bstrmage IF ~GlobalGT("bsGotMimicBlood","GLOBAL",0)~ THEN ~This will be the last I am buying. I do not need it regularly.~
== bstrmage IF ~!HasItem("MISC6Y",Myself) GlobalGT("bsGotMimicBlood","GLOBAL",0)~ THEN ~That's weird. I could have sworn I already bought one from you, but I can't seem to find it anywhere... Still, this will be the last one I'll buy from you.~
END
++ ~Sounds like a good deal.~ DO ~TakePartyItem("MISC6Y") GiveGoldForce(500) IncrementGlobal("bsGotMimicBlood","GLOBAL",1)~ + mimicblood_01
++ ~No, I'll keep it then.~ + open_shop

APPEND bstrmage
IF ~~ THEN mimicblood_01
SAY ~Here you are.~
IF ~~ THEN EXIT
END

IF ~~ THEN mimicblood_02
SAY ~I do, actually. I would sell it to you for 500 gold.~
+ ~PartyGoldGT(499)~ + ~Sounds like a good deal.~ DO ~GiveItem("MISC6Y",[PC]) TakePartyGold(500)~ + mimicblood_01
+ ~!PartyGoldGT(499)~ + ~Seems I don't have enough gold.~ + open_shop
++ ~No, maybe I'll find another one elsewhere.~ + open_shop
END

IF ~~ THEN empty_flask
SAY ~I do, actually! Those half-open flask are rather hard to come by. Here, a little gold as a compensation.~
IF ~~ THEN DO ~GiveGoldForce(150) TakePartyItem("bsdopd2") DestroyItem("bsdopd2")~ EXIT
END

END //APPEND


CHAIN
IF ~~ THEN bstrmage wrong_pearl
~Ah, no, this one is already too dry.~
== bstrmage IF ~Global("BS_MageMentionsDrying","MYAREA",0)~ THEN ~I want a fresh one for a special drying process I invented - it should make the pearl even more powerful.~ DO ~SetGlobal("BS_MageMentionsDrying","MYAREA",1)~
END
IF ~~ THEN + open_shop
