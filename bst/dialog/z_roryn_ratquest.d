/* this file contains the following:
1. Dialogue for Roryn, the Inn Master 
2. "Cage the Rabbits" sidequest (trigger during the "Strange Happenings in Room No. 3.4" quest)
3. "Rats in the Seatower Inn" side quest (triggers after the rabbits are caged)
4. Dialogues of all relevant quest cres
*/

APPEND bsroryn //RORYN, Seatower Inn Master

IF ~Global("bsSpokenTo","LOCALS",0)~ THEN greetings
SAY ~Welcome to the Seatower Inn. There's food an' rooms available fo' those who can afford 'em. I am the inn master, Roryn th' name.~
IF ~~ THEN DO ~OpenDoor("DOOR 01") SetGlobal("bsSpokenTo","LOCALS",1)~ + greetings_01
IF ~GlobalGT("bsRabbitQuest","GLOBAL",1)~ THEN DO ~OpenDoor("DOOR 01") SetGlobal("bsSpokenTo","LOCALS",1)~ + rabbitquest
END

IF ~GlobalGT("bsRabbitQuest","GLOBAL",1) Global("bsCollectRabbits","GLOBAL",0)~ THEN rabbitquest
SAY ~I am very sorry for th' trouble and all th' li'l rabbits up there.~ 
IF ~Global("bsPCSquashedRabbit","GLOBAL",0)~ THEN + greetings_04
IF ~GlobalGT("bsPCSquashedRabbit","GLOBAL",0)~ THEN DO ~SetGlobal("bsCollectRabbits","GLOBAL",3)~ + greetings_03
END

IF ~Global("bsSpokenTo","LOCALS",1)~ THEN greetings_01
SAY ~How can I be o' service?~
++ ~Let me see what you have.~ DO ~StartStore("bsroryn",LastTalkedToBy(Myself))~ EXIT
+ ~GlobalGT("bsCookSawDwarf","GLOBAL",0) Global("bsSpokenCook","LOCALS",0)~ + ~You're a dwarf! I just had a... conversation with the cook with regard to what she thinks of dwarves...~ DO ~SetGlobal("bsSpokenCook","LOCALS",1)~ + greetings_02
+ ~Global("bsCollectRabbits","GLOBAL",1)~ + ~About the rabbits...~ + greetings_11
+ ~Global("bsRatQuest","GLOBAL",1)~ + ~I won't go searching for your rats after all.~ + ratquest_01
+ ~Global("bsAskedChildren","LOCALS",0)
OR(2)
Global("bsRatQuest","GLOBAL",2)
Global("bsRatQuest","GLOBAL",4)~ + ~I have a suspicion about the rats on the second floor. Is there any child around who stays here currently?~ DO ~SetGlobal("bsAskedChildren","LOCALS",1)~ + ratdone_01
+ ~Global("bsAzalaHello","MYAREA",1)
Global("bsAskedAzalaPet","LOCALS",0)
OR(2)
Global("bsRatQuest","GLOBAL",2)
Global("bsRatQuest","GLOBAL",4)~ + ~Your daughter Azala... Does she have a pet animal, by any chance?~ DO ~SetGlobal("bsAskedAzalaPet","LOCALS",1)~ + ratdone_02
+ ~OR(2)
PartyHasItem("bstqrat1")
PartyHasItem("bstqrat2")~ + ~I found a rat on the second floor...~ + ratdone_04
+ ~Global("bsRatQuest","GLOBAL",5)~ + ~How is Azala?~ + ratdone_06
++ ~Nothing, good day.~ + greetings_05
END

IF ~~ THEN greetings_02
SAY ~Ah, well, she's a good soul, ye know. We go t'gether really well - as long as I don' go into th' kitchen.~
IF ~~ THEN + greetings_01
END

IF ~~ THEN greetings_03
SAY ~But why did ye have t' kill a rabbit on the good floor. Ach, I need to wipe the spot right away or it will give a stain. I'll not charge ye anything this time, but please, don't spill anything else inside the tower!~
IF ~~ THEN + greetings_04
END

IF ~~ THEN greetings_04
SAY ~I'll send Barney to take care of those right away, and then there's nothin' to remind us of tha' incident. Well, maybe after he also wiped th' floors.~
++ ~What was it with this mage? He looked rather desperate.~ + greetings_07
++ ~I very much hope such an animal plague inside the rooms won't happen again!~ + greetings_06
++ ~You do that, good man.~ DO ~SetGlobal("bsCollectRabbits","GLOBAL",3)~ + greetings_05
END

IF ~~ THEN greetings_05
SAY ~Good day and have a pleasant stay at the Seatower Inn!~
IF ~~ THEN EXIT
END

IF ~~ THEN greetings_06
SAY ~Och, me too, believe me that!~
++ ~What was it with this mage? He looked rather desperate.~ + greetings_07
+ ~!Global("bsCollectRabbits","GLOBAL",3)~ + ~How about I help you with collecting the rabbits?~ + greetings_10
++ ~Well, I'll leave you to collecting those rabbits.~ DO ~SetGlobal("bsCollectRabbits","GLOBAL",3)~ + greetings_05
END

IF ~~ THEN greetings_07
SAY ~Ach, that's Mr. Klaus. Came here some months ago, got kind o' trapped when the bridges went up. Always made a very frightened impression, if ye ask me. Constantly talkes about an "Ulf" and that he's got to save 'im.~
+ ~Global("bsSpokeUlf","LOCALS",0)~ + ~Ulf? Is that a friend of his?~ DO ~SetGlobal("bsSpokeUlf","LOCALS",1)~ + greetings_08
+ ~Global("bsSpokeWhyRabbits","LOCALS",0)~ + ~Why rabbits?~ DO ~SetGlobal("bsSpokeWhyRabbits","LOCALS",1)~ + greetings_09
+ ~!Global("bsCollectRabbits","GLOBAL",3)~ + ~How about I help you with collecting the rabbits?~ + greetings_10
++ ~Well, I'll leave you to collecting those rabbits.~ DO ~SetGlobal("bsCollectRabbits","GLOBAL",3)~ + greetings_05
END

IF ~~ THEN greetings_08
SAY ~I believe so, yes, but he never told more. He wasn't always thinkin' clear, if ye knows what I mean.~
+ ~Global("bsSpokeWhyRabbits","LOCALS",0)~ + ~Why rabbits?~ DO ~SetGlobal("bsSpokeWhyRabbits","LOCALS",1)~ + greetings_09
+ ~!Global("bsCollectRabbits","GLOBAL",3)~ + ~How about I help you with collecting the rabbits?~ + greetings_10
++ ~Well, I'll leave you to collecting those rabbits.~ DO ~SetGlobal("bsCollectRabbits","GLOBAL",3)~ + greetings_05
END

IF ~~ THEN greetings_09
SAY ~I am pretty sure he tried to conjure somethin' else, but couldn't concentrate enough. Still, as long as it was a bunny or two, there was no real reason to kick 'im out of the inn before.~
+ ~Global("bsSpokeUlf","LOCALS",0)~ + ~Ulf? Is that a friend of his?~ DO ~SetGlobal("bsSpokeUlf","LOCALS",1)~ + greetings_08
+ ~!Global("bsCollectRabbits","GLOBAL",3)~ + ~How about I help you with collecting the rabbits?~ + greetings_10
++ ~Well, I'll leave you to collecting those rabbits.~ DO ~SetGlobal("bsCollectRabbits","GLOBAL",3)~ + greetings_05
END

IF ~~ THEN greetings_10
SAY ~Och! That would be a great help. Barney's still busy outside. Here's a cage where you can put 'em in. I'll give you 50 gold for every of those little hoppers, eh?~
IF ~~ THEN DO ~GiveItemCreate("bscage",[PC],0,0,0) SetGlobal("bsCollectRabbits","GLOBAL",1)~ UNSOLVED_JOURNAL @780 EXIT
END

IF ~~ THEN greetings_11
SAY ~Wha' of 'em?~
+ ~GlobalGT("bsRabbitCaught","GLOBAL",0) PartyHasItem("bscage")~ + ~I'm done collecting, I think.~ + greetings_14
+ ~GlobalGT("bsRabbitCaught","GLOBAL",0) PartyHasItem("bscage")~ + ~I won't collect any more rabbits. Here's back your cage.~ + greetings_14
+ ~Global("bsRabbitCaught","GLOBAL",0)~ + ~I won't collect them, after all.~ + greetings_13
/*
+ ~False() PartyHasItem("bscage")~ + ~I sold them somewhere else. Here's back your cage.~ + 
*/
++ ~How many do you think are there?~ + greetings_28
++ ~I'll go back to chasing them.~ + greetings_12
END

IF ~~ THEN greetings_12
SAY ~You do that! Barney is looking foreward to collecting th' droppings.~
IF ~~ THEN EXIT
END

IF ~~ THEN greetings_13
SAY ~I see. Well, thanks anyway!~
IF ~~ THEN DO ~TakePartyItem("bscage") DestroyItem("bscage") SetGlobal("bsCollectRabbits","GLOBAL",3) EraseJournalEntry(@780)~ SOLVED_JOURNAL @782 + greetings_05
END

IF ~~ THEN greetings_14
SAY ~So, how much ye've got?~
IF ~Global("bsRabbitCaught","GLOBAL",1)~ THEN + greetings_15
IF ~Global("bsRabbitCaught","GLOBAL",2)~ THEN + greetings_16
IF ~GlobalGT("bsRabbitCaught","GLOBAL",2)~ THEN + greetings_17
END

IF ~~ THEN greetings_15
SAY ~I see just the one. That's 50 gold, then!~
IF ~~ THEN DO ~GiveGoldForce(50)~ + greetings_27
END

IF ~~ THEN greetings_16
SAY ~I see just the two. That's 100 gold, then!~
IF ~~ THEN DO ~GiveGoldForce(100)~ + greetings_27
END

IF ~~ THEN greetings_17
SAY ~One, two...~
IF ~Global("bsRabbitCaught","GLOBAL",3)~ THEN + greetings_18
IF ~Global("bsRabbitCaught","GLOBAL",4)~ THEN + greetings_19
IF ~Global("bsRabbitCaught","GLOBAL",5)~ THEN + greetings_20
IF ~Global("bsRabbitCaught","GLOBAL",6)~ THEN + greetings_21
IF ~Global("bsRabbitCaught","GLOBAL",7)~ THEN + greetings_22
IF ~Global("bsRabbitCaught","GLOBAL",8)~ THEN + greetings_23
IF ~Global("bsRabbitCaught","GLOBAL",9)~ THEN + greetings_24
IF ~Global("bsRabbitCaught","GLOBAL",10)~ THEN + greetings_25
IF ~Global("bsRabbitCaught","GLOBAL",11)~ THEN + greetings_26
END

IF ~~ THEN greetings_18
SAY ~...three! That makes 150 gold, then.~
IF ~~ THEN DO ~GiveGoldForce(150)~ + greetings_27
END

IF ~~ THEN greetings_19
SAY ~...four! That makes 200 gold, then.~
IF ~~ THEN DO ~GiveGoldForce(200)~ + greetings_27
END

IF ~~ THEN greetings_20
SAY ~...five! That makes 250 gold, then.~
IF ~~ THEN DO ~GiveGoldForce(250)~ + greetings_27
END

IF ~~ THEN greetings_21
SAY ~...six! That makes 300 gold, then.~
IF ~~ THEN DO ~GiveGoldForce(300)~ + greetings_27
END

IF ~~ THEN greetings_22
SAY ~...seven! That makes 350 gold, then.~
IF ~~ THEN DO ~GiveGoldForce(350)~ + greetings_27
END

IF ~~ THEN greetings_23
SAY ~...eight! That makes 400 gold, then.~
IF ~~ THEN DO ~GiveGoldForce(400)~ + greetings_27
END

IF ~~ THEN greetings_24
SAY ~...nine! That makes 450 gold, then.~
IF ~~ THEN DO ~GiveGoldForce(450)~ + greetings_27
END

IF ~~ THEN greetings_25
SAY ~...ten! That makes 500 gold, then.~
IF ~~ THEN DO ~GiveGoldForce(500)~ + greetings_27
END

IF ~~ THEN greetings_26
SAY ~...eleven! That makes 550 gold, then.~
IF ~~ THEN DO ~GiveGoldForce(550)~ + greetings_27
END

END //APPEND

CHAIN
IF ~~ THEN bsroryn greetings_27
~Here's yer gold, and thank ye for yer efforts!~
== bstq009 ~Oooh, so cute! Can I pet that one?~
== bsroryn ~Lass, not now... I need to get them out of th' inn, and fast.~
END
IF ~~ THEN DO ~TakePartyItem("bscage") DestroyItem("bscage") SetGlobal("bsCollectRabbits","GLOBAL",3) AddExperienceParty(500)
EraseJournalEntry(@780)~ SOLVED_JOURNAL @781 EXIT


APPEND bsroryn 

IF ~~ THEN greetings_28
SAY ~Well, I'd say there is at least ten of 'em.~
+ ~GlobalGT("bsRabbitCaught","GLOBAL",0) PartyHasItem("bscage")~ + ~I'm done collecting, I think.~ + greetings_14
+ ~GlobalGT("bsRabbitCaught","GLOBAL",0) PartyHasItem("bscage")~ + ~I won't collect any more rabbits. Here's back your cage.~ + greetings_14
+ ~Global("bsRabbitCaught","GLOBAL",0)~ + ~I won't collect them, after all.~ + greetings_13
/*
+ ~False() PartyHasItem("bscage")~ + ~I sold them somewhere else. Here's back your cage.~ + 
*/
++ ~I'll go back to chasing them.~ + greetings_12
END

END //APPEND


/* Roryn's daughter Azala */

BEGIN bstq009
IF ~True()~ THEN azala
SAY ~Hullo!~
IF ~~ THEN EXIT
IF ~Global("bsAzalaHello","MYAREA",0)~ THEN DO ~SetGlobal("bsAzalaHello","MYAREA",1)~ EXTERN bsroryn azala_hello
END


APPEND bsroryn 
IF ~~ THEN azala_hello
SAY ~That's my little Azala.~
= ~She's my daughter. My other two are ill and me wife Dorna has her hands full nursing 'em, so I brought her to work with me. I hope she didn't do anything, she's usually quiet and no bother at all.~
IF ~~ THEN EXIT
END
END //APPEND




/* Rats in the Seatower Inn */
CHAIN
IF ~AreaCheck("bs1010")~ THEN bstq006 ratquest
~A rat! I saw a rat upstairs!~
== bsroryn ~Ma'am, we are very sorry for the inconvenience. Surely ye saw one of th' rabbits that were set free inside the house, but the situation is being...~
== bstq006 ~Excuse ME, do you think I can't tell a rat from a *rabbit*? I tell you, I saw a *rat* on the second floor of this very establishment.~
== bsroryn ~The second floor? Hm, thank you very much m'lady. There were no rats in the cellar this morning but if a guest is reporting a sighting I need to send Barney up this instant.~
END
++ ~This reminds me of old days... I could kill those rats for you.~ EXTERN bstq009 ratquest_02
++ ~Well, I won't have anything to do with this. Good luck to you.~ EXTERN bsroryn ratquest_01


CHAIN
IF ~~ THEN bsroryn ratquest_01
~I understand ye well. Hey ho, Barney, grap the club and the spare traps and go fight those beasts!~
== bsroryn ~Azala, Mom sent a message for ye. Ye do not look well at all, go on home.~ 
END
IF ~~ THEN DO ~SetGlobal("bsRatQuest","GLOBAL",10)
ActionOverride("bstq006",EscapeArea())
ActionOverride("bstq009",EscapeArea())~ EXIT //quest end


CHAIN
IF ~~ THEN bstq009 ratquest_02
~I'm sure it's a rabbit. You have to look for a *rabbit*, and... and bring it to me!~
== bsroryn ~Maybe, lass, but if it's indeed rats, and not one of those hoppers that found the stairways, it needs ot be dealt with quickly. Tell ye what, Barney's still busy upstairs swiping the floor from the hopper droppings. If ye went up one floor and see what ye find - I'll give ye 50 gold for every rat ye find before Barney gets to it. If it's a rabbit just let it hop, Barney will take care o' that later. Rats are more important. And, please, be ye as discreet as possible...~
= ~No, Azala, not you. Stay with Poppa, please.~ DO ~SetGlobal("bsRatQuest","GLOBAL",1)
AddJournalEntry(@790,QUEST)
ActionOverride("bstq006",EscapeArea())~
== ~%IMOEN_JOINED%~ IF ~InParty("%IMOEN_DV%") InMyArea("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN ~Heh, yes, I think I remember old Reevor's rat plague. He was grumbling about your "bad" performance loud enough for half of Candlekeep to hear.~
== ~%KHALID_JOINED%~ IF ~InParty("khalid") InMyArea("khalid") !StateCheck("khalid",CD_STATE_NOTVALID)~ THEN ~Some things just have to be d-done.~
== ~%JAHEIRA_JOINED%~ IF ~InParty("jaheira") InMyArea("jaheira") !StateCheck("jaheira",CD_STATE_NOTVALID)~ THEN ~Rats do not belong inside a house but do endanger the health of the inhabitants. We do good by clearing them out.~
== ~%DYNAHEIR_JOINED%~ IF ~InParty("dynaheir") InMyArea("dynaheir") !StateCheck("dynaheir",CD_STATE_NOTVALID)~ THEN ~There is honor even in the smallest errand.~
== ~%AJANTIS_JOINED%~ IF ~InParty("ajantis") InMyArea("ajantis") !StateCheck("ajantis",CD_STATE_NOTVALID)~ THEN ~Yes, I guess it can be seen as an honorable task.~ 
== ~%AJANTIS_JOINED%~ IF ~InParty("ajantis") InMyArea("ajantis") !StateCheck("ajantis",CD_STATE_NOTVALID)~ THEN ~I do think our time is better spent elsewhere, though.~
== ~%SKIE_JOINED%~ IF ~InParty("skie") InMyArea("skie") !StateCheck("skie",CD_STATE_NOTVALID)~ THEN ~*I* will not touch a *rat*!~
== ~%MINSC_JOINED%~ IF ~InParty("MINSC") InMyArea("MINSC") !StateCheck("MINSC",CD_STATE_NOTVALID)~ THEN ~Minsc is not too sure about this. They are small, furry animals, just like Boo...~
== ~%MINSC_JOINED%~ IF ~InParty("MINSC") InMyArea("MINSC") !StateCheck("MINSC",CD_STATE_NOTVALID) HasItem("MISC84","MINSC")~ THEN ~(squeak)~ [GAM_48]
== MINSCJ IF ~InParty("MINSC") InMyArea("MINSC") !StateCheck("MINSC",CD_STATE_NOTVALID) HasItem("MISC84","MINSC")~ THEN ~Oh, Boo is right. Boo doesn't make number two in <CHARNAME>'s food. And he has no tail!~
== ~%MONTARON_JOINED%~ IF ~InParty("montaron") InMyArea("montaron") !StateCheck("montaron",CD_STATE_NOTVALID)~ THEN ~This *has* to be a joke.~
== ~%KAGAIN_JOINED%~ IF ~InParty("kagain") InMyArea("kagain") !StateCheck("kagain",CD_STATE_NOTVALID)~ THEN ~Ah, yes, rats. Always a nuisance to keep out, of a shop just as well as an inn.~
== ~%EDWIN_JOINED%~ IF ~InParty("EDWIN") InMyArea("EDWIN") !StateCheck("EDWIN",CD_STATE_NOTVALID)~ THEN ~To waste our power on vermin? Why don't we clear the whole inn, starting right here with this hall?!~
EXIT


BEGIN bstq010 

IF ~NumTimesTalkedTo(0)~ THEN rat
SAY ~(The rat looks... shiny, as if it was washed and combed. It is also unusually fat. Upon taking a closer look, you discover a tiny little bow of pink ribbon on its tail.)~
IF ~~ THEN + rat_00
END

IF ~NumTimesTalkedToGT(0)~ THEN rat_00
SAY ~(The rat is rather slow. You could grab it and take it with you.)~
++ ~(Grab the rat).~ + rat_02
++ ~(You let it wander off.)~ + rat_01
++ ~(You kill the rat.)~ + rat_03
END

IF ~~ THEN rat_01
SAY ~(With a faint squeak the rat turns away.)~
IF ~~ THEN DO ~SetGlobal("bsRatQuest","GLOBAL",2)~ EXIT
END


CHAIN
IF ~~ THEN bstq010 rat_02
~(You place the rat in one of your pockets.)~ DO ~GiveItemCreate("bstqrat1",[PC],1,0,0) SetGlobal("bsRatQuest","GLOBAL",4)~
== %IMOEN_JOINED% IF ~InParty("%IMOEN_DV%") InMyArea("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN ~Ooh, look at those little whiskers! And the ribbon! She is so cute!~
== ~%KHALID_JOINED%~ IF ~InParty("khalid") InMyArea("khalid") !StateCheck("khalid",CD_STATE_NOTVALID)~ THEN ~Oh, I think this rat b-belongs to a child - looking at the ribbon on its tail.~
== %IMOEN_JOINED% IF ~InParty("%IMOEN_DV%") InMyArea("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN ~I like the idea of a little furry pet rat. Although this one seems to belong to someone else.~
== ~%SKIE_JOINED%~ IF ~InParty("skie") InMyArea("skie") !StateCheck("skie",CD_STATE_NOTVALID)~ THEN ~*Who* would take a *rat* as a pet?! Ewwwww!~
== ~%ELDOTH_JOINED%~ IF ~InParty("eldoth") InMyArea("eldoth") !StateCheck("eldoth",CD_STATE_NOTVALID)~ THEN ~There is all sorts of ladies here with their offspring, who knows what those spoilt brats like to do to pass their time.~
== ~%SKIE_JOINED%~ IF ~InParty("skie") InMyArea("skie") !StateCheck("skie",CD_STATE_NOTVALID)~ THEN ~Oh, you mean to anger the nanny? Hm... But a *rat*? Ewwwww!~
== %IMOEN_JOINED% IF ~InParty("%IMOEN_DV%") InMyArea("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID) InParty("MINSC")~ THEN ~How about Minsc takes it and I get Boo?~
== ~%MINSC_JOINED%~ IF ~InParty("MINSC") InMyArea("MINSC") !StateCheck("MINSC",CD_STATE_NOTVALID) HasItem("MISC84","MINSC")
InParty("%IMOEN_DV%") InMyArea("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN ~It will be a cold day in hell before I give up Boo!~
== ~%MINSC_JOINED%~ IF ~InParty("MINSC") InMyArea("MINSC") !StateCheck("MINSC",CD_STATE_NOTVALID) HasItem("MISC84","MINSC")~ THEN ~<CHARNAME> has to take care of squeeking companion for whomever it belongs now!~
== %GARRICK_JOINED% IF ~InParty("garrick") InMyArea("garrick") !StateCheck("garrick",CD_STATE_NOTVALID)~ THEN ~Are you sure you have enough grain on you? These little guys like to eat.~
== %JAHEIRA_JOINED% IF ~InParty("JAHEIRA") InMyArea("JAHEIRA") !StateCheck("JAHEIRA",CD_STATE_NOTVALID) InParty("garrick") InMyArea("garrick") !StateCheck("garrick",CD_STATE_NOTVALID)~ THEN ~Garrick, this animal doesn't really look starved. I am sure it will do fine without anything to eat for a while. At least for as long as it takes <CHARNAME> to return it to its... "owner".~
== %JAHEIRA_JOINED% IF ~InParty("JAHEIRA") InMyArea("JAHEIRA") !StateCheck("JAHEIRA",CD_STATE_NOTVALID)~ THEN ~We should find whoever claims this creature fast. This has wasted enough time already.~
== ~%EDWIN_JOINED%~ IF ~InParty("EDWIN") InMyArea("EDWIN") !StateCheck("EDWIN",CD_STATE_NOTVALID)~ THEN ~How about we roast it and stuff it down the "owners" neck? What a waste of time.~
== %MONTARON_JOINED% IF ~InParty("montaron") InMyArea("montaron") !StateCheck("montaron",CD_STATE_NOTVALID)~ THEN ~How about we roast it and eat the good parts ourselves before returning it to the "owner". No need to let it go to waste.~
== ~%KAGAIN_JOINED%~ IF ~InParty("kagain") InMyArea("kagain") !StateCheck("kagain",CD_STATE_NOTVALID)~ THEN ~A pet rat in an inn... This has potential to become really entertaining. At least if I have a say in this.~
== %IMOEN_JOINED% IF ~InParty("%IMOEN_DV%") InMyArea("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN ~Pink ribbon? Combed fur? I bet all of <CHARNAME>'s gold she belongs to a girl.~
EXIT

CHAIN
IF ~~ THEN bstq010 rat_03
~(You kill the rat with one stroke of your weapon and take the carcass with you.)~ 
== %IMOEN_JOINED% IF ~InParty("%IMOEN_DV%") InMyArea("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN ~Ooh, look at the ribbon! Looks like what I always did to Mr. Dolly. <CHARNAME> - I think you just made someone very sad.~
== ~%KHALID_JOINED%~ IF ~InParty("khalid") InMyArea("khalid") !StateCheck("khalid",CD_STATE_NOTVALID)~ THEN ~I think this rat b-belonged to a child - looking at the ribbon on its tail.~
== ~%SKIE_JOINED%~ IF ~InParty("skie") InMyArea("skie") !StateCheck("skie",CD_STATE_NOTVALID)~ THEN ~*Who* would take a *rat* as a pet?! Ewwwww!~
== ~%ELDOTH_JOINED%~ IF ~InParty("eldoth") InMyArea("eldoth") !StateCheck("eldoth",CD_STATE_NOTVALID)~ THEN ~There is all sorts of ladies here with their offspring, who knows what those spoilt brats like to do to pass their time.~
== ~%SKIE_JOINED%~ IF ~InParty("skie") InMyArea("skie") !StateCheck("skie",CD_STATE_NOTVALID)~ THEN ~Oh, you mean to anger the nanny? Hm... But a *rat*? Ewwwww!~
END
IF ~~ THEN DO ~GiveItemCreate("bstqrat2",[PC],1,0,0) SetGlobal("bsRatQuest","GLOBAL",3)~ EXIT

CHAIN
IF ~~ THEN bsroryn ratdone_01
~Oh? Well, there are some children around the main hall but none of them are staying in the rooms currently, so... Oh, and then there's me little Azala, at least today.~
== bsroryn IF ~Global("bsAzalaHello","MYAREA",0)~ THEN ~She's my daughter. My other two are ill and me wife Dorna has her hands full nursing 'em, so I brought her to work with me. I hope she didn't do anything, she's usually quiet and no bother at all.~ DO ~SetGlobal("bsAzalaHello","MYAREA",1)~
END
+ ~Global("bsAskedAzalaPet","LOCALS",0)~ + ~Your daughter Azala... Does she have a pet animal, by any chance?~ DO ~SetGlobal("bsAskedAzalaPet","LOCALS",1)~ + ratdone_02
+ ~OR(2)
PartyHasItem("bstqrat1")
PartyHasItem("bstqrat2")~ + ~I found a rat on the second floor...~ + ratdone_04
+ ~!PartyHasItem("bstqrat1")
!PartyHasItem("bstqrat2")~ + ~We'll see about that. I'll bring you any rat I'll find.~ + ratdone_03

APPEND bsroryn

IF ~~ THEN ratdone_02
SAY ~No, but funny ye should ask - she's been clammorin' for one for weeks.~
+ ~Global("bsAskedChildren","LOCALS",0)
OR(2)
Global("bsRatQuest","GLOBAL",2)
Global("bsRatQuest","GLOBAL",4)~ + ~I have a suspicion about the rats on the second floor. Is there any child around who stays here currently?~ DO ~SetGlobal("bsAskedChildren","LOCALS",1)~ + ratdone_01
+ ~OR(2)
PartyHasItem("bstqrat1")
PartyHasItem("bstqrat2")~ + ~I found a rat on the second floor...~ + ratdone_04
+ ~!PartyHasItem("bstqrat1")
!PartyHasItem("bstqrat2")~ + ~We'll see about that. I'll bring you any rat I'll find.~ + ratdone_03
END

IF ~~ THEN ratdone_03
SAY ~And I'll look foreward to it - well, not really, but ye know what I mean.~
IF ~~ THEN EXIT
END

END //APPEND

CHAIN
IF ~~ THEN bsroryn ratdone_04
~Good! Just the one? Oh... it has a pink ribbon on its tail?!~
== bstq009 ~(screams) What?!~
== bsroryn ~What is it, Azala?~
== bstq009 ~Is she, is she really dead?~
== bsroryn ~What ye talking about, lass?~
== bstq009 ~(sob) The rat was my Betsy (sob). I found her in the street last Friday and I nursed her and I didn't want to leave her alone at home so I took her with me and I let her run but only if she was not hungry and I took away the poop and I am sorry the lady saw her and I shouldn't have let her run but she escaped me and I hoped noone would see her and then you told me to stay close and I couldn't go search for her and then I was sidetracked by all the rabbits and (takes breath)~
== bsroryn ~Ye brought a *rat* into the guest rooms? O' my inn? Azala, do ye have any idea what ye done?~
END
+ ~Dead("bstq010")~ + ~Betsy is dead, I confess. Azala, I am very sorry.~ + ratdone_05
+ ~Dead("bstq010") PartyHasItem("bstqrat2")~ + ~Here's your rat. Can anyone take this carcass off me?~ + ratdone_05

+ ~!Dead("bstq010")~ + ~She is not dead, Azala.~ + ratdone_05
+ ~!Dead("bstq010") PartyHasItem("bstqrat1")~ + ~Hush, Azala. I have her here, see?~ + ratdone_05

++ ~Really? After I just walked through more than ten rabbits upstairs, here's a child that wants a pet animal that desperately that she doesn't know what else to do than to tame a *rat*?~ + ratdone_05

++ ~Whatever - can someone hush this child?~ + ratdone_05


CHAIN
IF ~~ THEN bsroryn ratdone_05
~Och. I'm sorry about this whole thing!~

//rat dead
== bstq009 IF ~Dead("bstq010")~ THEN ~(wails)~

//rat not dead
== bstq009 IF ~!Dead("bstq010")~ THEN ~Betsy! She's still alive! Oh, I was *so* scared you killed her! Thank you! Thank you!~

== bsroryn ~Azala, Mom sent a message for ye. Go on home. Take th' rat, an' we'll talk about this later.~ 

== bsroryn ~Well, this surely wasn't what I expected, but ye defeated one rat. Here is yer 50 gold.~ 

//ending
== bsroryn ~Thank ye for helping, although none of us expected things to go this way. Please enjoy yer stay at the Seatower Inn. And if ye have to chase another rodent through the guest rooms ye have a round on the house, I swear ye!~ DO ~GiveGoldForce(50) 
TakePartyItem("bstqrat2") DestroyItem("bstqrat2") 
TakePartyItem("bstqrat1") DestroyItem("bstqrat1")
SetGlobal("bsRatQuest","GLOBAL",5) 
AddExperienceParty(200) EraseJournalEntry(@791)
AddJournalEntry(@792,QUEST_DONE)
ActionOverride("bstq009",EscapeArea())~
EXIT

APPEND bsroryn 

IF ~~ THEN ratdone_06
SAY ~Thank ye for asking. Don't ye worry about it. She'll have a pet rabbit. No, not a white one, saw too much o' those! The rat didn't sit well with us, anyway. There are limits t' good taste, as ye know well enough. I was sorry for her, she liked it so much, but it's better this way.~
IF ~~ THEN DO ~SetGlobal("bsRatQuest","GLOBAL",6)~ EXIT
END

END //APPEND
