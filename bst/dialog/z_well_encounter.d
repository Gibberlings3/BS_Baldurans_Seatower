/* Seatower Well */
BEGIN bswllspy

IF ~True()~ THEN well
SAY ~The tower's well. Due to the near sea, the water is rather brackish, but good enough for non-consumer use and watering the farm grounds.~

/* Fire proof barrel for Seatower Armorer quest: barrel can be filled with water when fire elemental is gone */
+ ~PartyHasItem("bsbarrl3") GlobalGT("bsFireElementQuest","GLOBAL",9)~ + ~You use the well to fill the barrel with water.~ + full_barrel

/* Fire elemental in Storeroom: evil solution */
+ ~PartyHasItem("bsbarrl4")~ + ~You put the barrel with the fire elemental into the well.~ + drown_elemental

/* well interactions */
+ ~Global("bsDrinkWellWater","MYAREA",0)~ + ~You try a sip of the well water.~ DO ~SetGlobal("bsDrinkWellWater","MYAREA",1)~ + drink
+ ~Global("bsGoldIntoWell_1","MYAREA",0) NumInParty(1)~ + ~You throw a gold coin into the well as it is tradition for making a wish.~ DO ~SetGlobal("bsGoldIntoWell_1","MYAREA",1)~ + splish
+ ~Global("bsGoldIntoWell","MYAREA",0) NumInPartyGT(1)~ + ~You throw a gold coin into the well as it is tradition for making a wish.~ DO ~SetGlobal("bsGoldIntoWell","MYAREA",1)~ + splish
+ ~GlobalGT("bsGoldIntoWell","MYAREA",0)
GlobalLT("bsGoldIntoWell","MYAREA",5) NumInPartyGT(1)~ + ~You throw another gold coin into the well as it is tradition for making a wish.~ + splish_again
+ ~Global("bsTauntWellSpirit","MYAREA",0)~ + ~You let a pepple stone fall into the well.~ DO ~SetGlobal("bsTauntWellSpirit","MYAREA",1)~ + plunk
+ ~GlobalGT("bsTauntWellSpirit","MYAREA",0) GlobalLT("bsTauntWellSpirit","MYAREA",9)~ + ~You let another pepple stone fall into the well.~ DO ~IncrementGlobal("bsTauntWellSpirit","MYAREA",1)~ + plunk_again
+ ~Global("bsTauntWellSpirit","MYAREA",9)~ + ~You let the tenth pepple stone fall into the well.~ + spirit_angered
++ ~You leave the well alone.~ DO ~ActionOverride("bswllspy",DestroySelf())~ EXIT 
END

IF ~~ THEN drown_elemental
SAY ~The barrel is on the water surface, slowly sinking from water entering the intereor.~
++ ~You take the barrel out again.~ DO ~ActionOverride("bswllspy",DestroySelf())~ EXIT  
++ ~You watch the barrel fill itself completely with water, drowning the fire elemental.~ + drown_elemental_01
END

IF ~~ THEN drown_elemental_01
SAY ~The barrel is full of water now. The fire elemental is dead.~
IF ~~ THEN DO ~TakePartyItem("bsbarrl4") DestroyItem("bsbarrl4") 
GiveItemCreate("bsbarrl2",[PC],0,0,0)
EraseJournalEntry(@901)
EraseJournalEntry(@904)
EraseJournalEntry(@906)
EraseJournalEntry(@910)
AddexperienceParty(500)
ReputationInc(-1)
SetGlobal("bsFireElementQuest","GLOBAL",11) ActionOverride("bswllspy",DestroySelf())~ SOLVED_JOURNAL @903 EXIT
END

IF ~~ THEN full_barrel
SAY ~The barrel is full of water now.~
IF ~~ THEN DO ~TakePartyItem("bsbarrl3") DestroyItem("bsbarrl3") GiveItemCreate("bsbarrl2",[PC],0,0,0) ActionOverride("bswllspy",DestroySelf())~ EXIT
END

IF ~~ THEN drink
SAY ~The water tastes salty and a little moldy, but better than some you had out in the wild.~
IF ~~ THEN DO ~ActionOverride("bswllspy",DestroySelf())~ EXIT
END

CHAIN
IF ~~ THEN bswllspy splish
~The coin hitting the surface makes a distinguished "splish" sound, then sinks out of sight into the water.~ DO ~TakePartyGold(1) DestroyGold(1)~
/* Imoen and Alora want, too */
== ~%IMOEN_JOINED%~ IF ~InParty("%IMOEN_DV%") InMyArea("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN ~[Imoen] Oh, I want to do that, too. What did you wish for, <CHARNAME>? Wait! Don't tell me, or it won't come true. There! And gone it is. I wish for a nice, comfortable house in a not-too-big city, with servants and a *cat* just for me... not, I mean I will *not* wish *this*, because you're not supposed to say it out loud!~ DO ~TakePartyGold(1) DestroyGold(1)~
== ~%ALORA_JOINED%~ IF ~InParty("alora") InMyArea("alora") !StateCheck("alora",CD_STATE_NOTVALID)~ THEN ~[Alora] Me too, me too! (Alora breathes in audibly, coin in hand.) Now, in you go. Make me happy!~ DO ~TakePartyGold(1) DestroyGold(1)~
END
IF ~~ THEN DO ~ActionOverride("bswllspy",DestroySelf())~ EXIT

CHAIN
IF ~~ THEN bswllspy splish_again
~This coin also makes a distinguished "splish" sound when hitting the water surface, then tumbles out of sight into the water.~ DO ~TakePartyGold(1) DestroyGold(1)~
/* after second time Global("bsGoldIntoWell","MYAREA",1) */
== ~%JAHEIRA_JOINED%~ IF ~Global("bsGoldIntoWell","MYAREA",1)
InParty("jaheira") InMyArea("jaheira") !StateCheck("jaheira",CD_STATE_NOTVALID)~ THEN ~[Jaheira] I do *not* know what you are trying to accomplish with this, <CHARNAME>. Please tell me you do not believe in wish-granting wells.~
== ~%IMOEN_JOINED%~ IF ~Global("bsGoldIntoWell","MYAREA",1)
InParty("%IMOEN_DV%") InMyArea("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN ~[Imoen] Give it time, give it time, <CHARNAME>! It won't go quicker if you wish for it several times. Although - this is really fun. *giggles* Aaaand - hop!~ DO ~TakePartyGold(1) DestroyGold(1)~

/* after third time Global("bsGoldIntoWell","MYAREA",2) */
== ~%JAHEIRA_JOINED%~ IF ~Global("bsGoldIntoWell","MYAREA",2)
InParty("jaheira") InMyArea("jaheira") !StateCheck("jaheira",CD_STATE_NOTVALID)~ THEN ~(sigh)~
== ~%DYNAHEIR_JOINED%~ IF ~Global("bsGoldIntoWell","MYAREA",2)
InParty("dynaheir") InMyArea("dynaheir") !StateCheck("dynaheir",CD_STATE_NOTVALID)~ THEN ~We best not scold <CHARNAME> for this game - <PRO_HESHE> has little enough pleasure in <PRO_HISHER> life to be sure.~

/* after 4rd time Global("bsGoldIntoWell","MYAREA",3) */
== ~%IMOEN_JOINED%~ IF ~Global("bsGoldIntoWell","MYAREA",3)
InParty("%IMOEN_DV%") InMyArea("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN ~[Imoen] You know that I have to restrict myself every time you do that so I won't do it, too, right? I'm sooo prooooud of myself for not throwing in the whole purse!~
== ~%MINSC_JOINED%~ IF ~Global("bsGoldIntoWell","MYAREA",3)
InParty("minsc") InMyArea("minsc") !StateCheck("minsc",CD_STATE_NOTVALID)~ THEN ~[Minsc] Minsc doesn't understand why <CHARNAME> wants to use the well for cleaning all those gold coins... What, Boo? Ah! I see. <CHARNAME> is stashing them for later. Very smart!~
== ~%ELDOTH_JOINED%~ IF ~Global("bsGoldIntoWell","MYAREA",3)
InParty("eldoth") InMyArea("eldoth") !StateCheck("eldoth",CD_STATE_NOTVALID)~ THEN ~[Eldoth] Just in case anyone is considering throwing all our gold into that well be assured I will expect you to get it out again.~
== ~%KAGAIN_JOINED%~ IF ~Global("bsGoldIntoWell","MYAREA",3)
InParty("kagain") InMyArea("kagain") !StateCheck("kagain",CD_STATE_NOTVALID)~ THEN ~[Kagain] Anyone thinking about throwing all our gold into that well will die by my hand.~
== ~%AJANTIS_JOINED%~ IF ~Global("bsGoldIntoWell","MYAREA",3)
InParty("ajantis") InMyArea("ajantis") !StateCheck("ajantis",CD_STATE_NOTVALID)
InParty("%IMOEN_DV%") InMyArea("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN ~[Ajantis, with Imoen] That would be a great waste indeed, Imoen. I never know when you are talking in jest and when...~
== ~%IMOEN_JOINED%~ IF ~Global("bsGoldIntoWell","MYAREA",3)
InParty("%IMOEN_DV%") InMyArea("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)
InParty("ajantis") InMyArea("ajantis") !StateCheck("ajantis",CD_STATE_NOTVALID)~ THEN ~[Imoen, with Ajantis] ...when I am about to make something completely foolish? Ah, Ajantis!...~
== ~%IMOEN_JOINED%~ IF ~Global("bsGoldIntoWell","MYAREA",3)
InParty("%IMOEN_DV%") InMyArea("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN ~[Imoen] No worries. I would *never* throw in my whole purse!...~
== ~%AJANTIS_JOINED%~ IF ~Global("bsGoldIntoWell","MYAREA",3)
InParty("ajantis") InMyArea("ajantis") !StateCheck("ajantis",CD_STATE_NOTVALID)
InParty("%IMOEN_DV%") InMyArea("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN ~[Ajantis, with Imoen] That's a relief to hear.~
== ~%IMOEN_JOINED%~ IF ~Global("bsGoldIntoWell","MYAREA",3)
InParty("%IMOEN_DV%") InMyArea("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN ~[Imoen] I would throw in someone else's, of course! *giggles*~

/* for the 5th coin NPC will comment Global("bsGoldIntoWell","MYAREA",4) */
== ~%ALORA_JOINED%~ IF ~Global("bsGoldIntoWell","MYAREA",4)
InParty("alora") InMyArea("alora") !StateCheck("alora",CD_STATE_NOTVALID)~ THEN ~[Alora] Had I known you separate so easily with gold coins, <CHARNAME>, I wouldn't have spent so much time looking through pockets elsehwere. *giggles* Don't let me spoil your fun, though!~
== ~%MONTARON_JOINED%~ IF ~Global("bsGoldIntoWell","MYAREA",4)
InParty("montaron") InMyArea("montaron") !StateCheck("monatron",CD_STATE_NOTVALID)~ THEN ~[Montaron] Had I known you separate so easily with gold coins, I wouldn't have joined force with you, <CHARNAME>. Are we *done* here?!~
== ~%IMOEN_JOINED%~ IF ~Global("bsGoldIntoWell","MYAREA",4)
InParty("%IMOEN_DV%") InMyArea("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN ~[Imoen] I know I just did it myself, but... Imagining all the coins at the bottom of the cold, dark water - for *millenials* before someone makes them shine again is rather depressing... Have to focus on the wishes! The wishes. I hope you wished for someting great, <CHARNAME>!~
== ~%YESLICK_JOINED%~ IF ~Global("bsGoldIntoWell","MYAREA",4)
InParty("yeslick") InMyArea("yeslick") !StateCheck("yeslick",CD_STATE_NOTVALID)
Gender(Player1,MALE)~ THEN ~[Yeslick, PC male] I'm not sure what you are wishing there for, lad, but I'm pretty sure doing it multiple times will not increase the likelyhood of it coming true.~
== ~%YESLICK_JOINED%~ IF ~Global("bsGoldIntoWell","MYAREA",4)
InParty("yeslick") InMyArea("yeslick") !StateCheck("yeslick",CD_STATE_NOTVALID)
Gender(Player1,FEMALE)~ THEN ~[Yeslick, PC female] I'm not sure what you are wishing there for, gal, but I'm pretty sure doing it multiple times will not increase the likelyhood of it coming true.~
== ~%KHALID_JOINED%~ IF ~Global("bsGoldIntoWell","MYAREA",4)
InParty("khalid") InMyArea("khalid") !StateCheck("khalid",CD_STATE_NOTVALID)~ THEN ~[khalid] I d-don't know what you are wishing for, <CHARNAME>, but I surely hope it's worth the gold.~
== ~%KAGAIN_JOINED%~ IF ~Global("bsGoldIntoWell","MYAREA",4)
InParty("kagain") InMyArea("kagain") !StateCheck("kagain",CD_STATE_NOTVALID)~ THEN ~[Kagain] There is *no* wish that justifies thowing away gold like this.~
== ~%SHARTEEL_JOINED%~ IF ~Global("bsGoldIntoWell","MYAREA",4)
InParty("sharteel") InMyArea("sharteel") !StateCheck("sharteel",CD_STATE_NOTVALID)~ THEN ~[Shar-Teel] Foolish believes. The gold is better spent on equipment for our tasks.~
== ~%XAN_JOINED%~ IF ~Global("bsGoldIntoWell","MYAREA",4)
InParty("xan") InMyArea("xan") !StateCheck("xan",CD_STATE_NOTVALID)~ THEN ~[Xan] I will not elaborate why the human tradition of throwing gold into wells is a completely foolish thing to do - and futile on top of it.~
== ~%ELDOTH_JOINED%~ IF ~Global("bsGoldIntoWell","MYAREA",4)
InParty("eldoth") InMyArea("eldoth") !StateCheck("eldoth",CD_STATE_NOTVALID)~ THEN ~[Eldoth] The next gold coins you feel like throwing away you just give to me. I can make dreams come true, too - at least as "well" as this well.~
== ~%SKIE_JOINED%~ IF ~Global("bsGoldIntoWell","MYAREA",4)
InParty("skie") InMyArea("skie") !StateCheck("skie",CD_STATE_NOTVALID)~ THEN ~[Skie] The next gold coins you feel like throwing away you just put here into my purse, <CHARNAME>!~
== ~%GARRICK_JOINED%~ IF ~Global("bsGoldIntoWell","MYAREA",4)
InParty("garrick") InMyArea("garrick") !StateCheck("garrick",CD_STATE_NOTVALID)~ THEN ~[Garrick] This is so picturesque - <CHARNAME>, standing at the Seatower's well, wishing for <PRO_HISHER> heartfelt desires... Would you do that once more, please? I need to capture the spirit right...~
== ~%SAFANA_JOINED%~ IF ~Global("bsGoldIntoWell","MYAREA",4)
InParty("safana") InMyArea("safana") !StateCheck("safana",CD_STATE_NOTVALID)~ THEN ~[Safana] How can you waste gold for such a childish play. There are far better ways to spend gold in a city.~
== ~%EDWIN_JOINED%~ IF ~Global("bsGoldIntoWell","MYAREA",4)
InParty("edwin") InMyArea("edwin") !StateCheck("edwin",CD_STATE_NOTVALID)~ THEN ~[Edwin] I guess you are the only one trying to taunt the "well spirit" with gold coins instead of pepples, <CHARNAME>. (Foolish behavior. I guess I can be thankful <PRO_HESHE> only throws one gold coin at a time.)~
== ~%KIVAN_JOINED%~ IF ~Global("bsGoldIntoWell","MYAREA",4)
InParty("kivan") InMyArea("kivan") !StateCheck("kivan",CD_STATE_NOTVALID)~ THEN ~[Kivan] One day they'll find a drowned fool in that well who was attracted by all the gold coins at the bottom.~
END
IF ~~ THEN DO ~IncrementGlobal("bsGoldIntoWell","MYAREA",1) ActionOverride("bswllspy",DestroySelf())~ EXIT

APPEND bswllspy

IF ~~ THEN plunk
SAY ~After a relatively short time, you hear a "plunk" sound when the pepple hits the water surface.~
IF ~~ THEN DO ~ActionOverride("bswllspy",DestroySelf())~ EXIT
END

IF ~~ THEN plunk_again
SAY ~You hear again a "plunk" sound when the pepple hits the water surface.~
IF ~~ THEN DO ~ActionOverride("bswllspy",DestroySelf())~ EXIT
END

IF ~~ THEN spirit_angered
SAY ~The expected "plunk" sound is swallowed by the angry hiss of a drowned spirit you disturbed!~
IF ~~ THEN DO ~SetGlobal("bsTauntWellSpirit","MYAREA",10) CreateCreature("bsplsprt",[3679.2105],12) ActionOverride("bswllspy",DestroySelf())~ EXIT
END

END //APPEND


/* short dialogue lines for mother with children */

BEGIN bswellma
 
IF ~True()~ THEN mother
SAY ~We like coming to the tower. The children like the animals and it is safe here.~
IF ~~ THEN EXIT
END

BEGIN bswellgl
 
IF ~True()~ THEN girl
SAY ~I will save some of my bread and feed the seagulls later!~
IF ~~ THEN EXIT
END

BEGIN bswellbo

IF ~True()~ THEN boy
SAY ~I want to go pet the cows later!~
IF ~~ THEN EXIT
END
