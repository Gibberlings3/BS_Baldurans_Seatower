/* pirate captain on Old Temple Island. Own file for legacy reasons. */
BEGIN BSPIRCPT

IF ~Global("bsTalkedToPirate","GLOBAL",0)~ THEN BEGIN 0
	SAY @3600 /* ~Well, look what we have here men. Our ticket off this gods-forsaken island!~ */
	IF~~THEN REPLY @3601 /* ~Oh?~ */ GOTO pirate_01
	IF~~THEN REPLY @3602 /* ~Your what?~ */ GOTO pirate_01
END

IF ~GlobalGT("bsTalkedToPirate","GLOBAL",0)
GlobalLT("bsTalkedToPirate","GLOBAL",3)~ THEN again
SAY @3603 /* A hammer would be really, *really* helpful. */
+ ~Global("bs_pirate_04","LOCALS",1)~ + @3604 /* I do have a portal that will take me back. */ DO ~SetGlobal("bs_pirate_04","LOCALS",2)~ + pirate_05
+ ~Dead("bsihermi")
Global("bs_pirate_07","LOCALS",1)~ + @3605 /* The mage is no problem any more. */ DO ~SetGlobal("bs_pirate_07","LOCALS",2)~ + pirate_08
+ ~PartyHasItem("bsihammr")~ + @3606 /* You mean, a hammer like this one? */ + hammer_given
+ ~Global("bs_MeetsPriest","GLOBAL",0)
Global("bs_pirate_03","LOCALS",0)
GlobalLT("bs_pirate_06","LOCALS",2)
!PartyHasItem("bsihammr")~ + @3607 /* Where would I find such a hammer? */ DO ~SetGlobal("bs_pirate_03","LOCALS",1)~ + pirate_03
+ ~Global("bs_pirate_04","LOCALS",0)~ + @3608 /* What do I get out of it? */ DO ~SetGlobal("bs_pirate_04","LOCALS",1)~ + pirate_04
+ ~Global("bs_MeetsPriest","GLOBAL",1)
Global("bs_pirate_06","LOCALS",0)
!PartyHasItem("bsihammr")~ + @3609 /* I think I met someone inside who has such a hammer. I'll try and get it for you. */ DO ~SetGlobal("bs_pirate_06","LOCALS",2)~ + pirate_06
+ ~Global("bs_pirate_06","LOCALS",0)~ + @3610 /* I'll see what I can find. */ DO ~SetGlobal("bs_pirate_06","LOCALS",1)~ + pirate_06
+ ~Global("bsTalkedToPirate","GLOBAL",2)~ + @3611 /* I'm on it. */ + on_it
+ ~Global("bs_pirate_07","LOCALS",0)~ + @3612 /* You afraid of going down there? */ DO ~SetGlobal("bs_pirate_07","LOCALS",1)~ + pirate_07
+ ~Global("bs_ti_SquirrelQuest","GLOBAL",0)~ + @3613 /* You mentioned people coming back as squirrels? */ DO ~SetGlobal("bs_ti_SquirrelQuest","GLOBAL",1)~ + pirate_09
+ ~Global("bs_pirate_10","LOCALS",0)~ + @3614 /* Do you know what the Sahuagin are doing here? */ DO ~SetGlobal("bs_pirate_10","LOCALS",1)~ + pirate_10
+ ~Global("bsTalkedToPirate","GLOBAL",0)~ + @3615 /* This is not my problem. */ + pirate_02
+ ~GlobalGT("bsTalkedToPirate","GLOBAL",0)~ + @3616 /* I'll be going. */ + bye
END

IF ~GlobalGT("bsTalkedToPirate","GLOBAL",3)~ THEN done
SAY @3617 /* Our hero! We still have some work to do. But the boat should be ready in ... two weeks? Let us know if you'd be interested in joining us. */
+ ~Global("bs_pirate_07","LOCALS",0)~ + @3612 /* You afraid of going down there? */ DO ~SetGlobal("bs_pirate_07","LOCALS",1)~ + pirate_07
+ ~Global("bs_ti_SquirrelQuest","GLOBAL",0)~ + @3613 /* You mentioned people coming back as squirrels? */ DO ~SetGlobal("bs_ti_SquirrelQuest","GLOBAL",1)~ + pirate_09
+ ~Global("bs_pirate_10","LOCALS",0)~ + @3614 /* Do you know what the Sahuagin are doing here? */ DO ~SetGlobal("bs_pirate_10","LOCALS",1)~ + pirate_10
+ ~OR(3)
Global("bs_pirate_07","LOCALS",0) Global("bs_ti_SquirrelQuest","GLOBAL",0)
Global("bs_pirate_10","LOCALS",0)~ + @3616 /* I'll be going. */ + bye
IF ~Global("bs_pirate_07","LOCALS",1) GlobalGT("bs_ti_SquirrelQuest","GLOBAL",0)
Global("bs_pirate_10","LOCALS",1)~ THEN EXIT
END

IF ~~ THEN pirate_01
SAY @3618 /* Well, you emerged from within this forsaken island still in one piece, neither dead, nor a Lacedon, nor a squirrel, so you can obviously hold your own in there. */
= @3619 /* See, it's like this. That storm that blew up in the islands last week? It wrecked us here, that's what it did. That boat over there - that would be our way off this island. But it is damaged. We do have the material needed to repair it, but what we'd need is a good hammer. There is only so much you can replace a real craftman's hammer with stones or weapons. */
IF ~~ THEN + again
END

IF ~~ THEN pirate_02
SAY @3620 /* No, it's not, but it *could* be a way for you to earn some nice pirate treasures, ain't that right? Think about it. */
IF ~~ THEN DO ~SetGlobal("bsTalkedToPirate","GLOBAL",1)~ EXIT
END

IF ~~ THEN pirate_03
SAY @3621 /* There surely is one somewhere between all the saved shipments and stuff that got collected here over the decades. I'm afraid you'll have to dig a bit through whatever is down there. */
IF ~~ THEN + again
END

IF ~~ THEN pirate_04
SAY @3622 /* Well, sparkling, valuable pirate treasure, for one. And maybe this will be your way off the island, as well? Unless, of course, you have a portal that takes you back, haha! */
IF ~~ THEN + again
END

IF ~~ THEN pirate_05
SAY @3623 /* Oh. Well, then you won't need any hammer yourself, do you? Sounds like a win-win to me! */
IF ~~ THEN + again
END

IF ~~ THEN pirate_06
SAY @3624 /* Splendid! Men, start collecting everything for our hero's reward. */
IF ~~ THEN DO ~SetGlobal("bsTalkedToPirate","GLOBAL",2)~ UNSOLVED_JOURNAL @1001 EXIT
END

IF ~~ THEN pirate_07
SAY @3625 /* Ridiculous, isn't it? Well - let's not phrase it like that. We aren't *afraid*. We are - cautious, very cautious. That main entrance up there - that's the tempel entrance of whoever god was worshipped here, and our Bitch Queen doesn't like her followers to go through there, not at all, and we were just shipwrecked, so we really do not want to anger her even more. We *did* peak into that entrance right here - only to run into a crazy mage who turned out to be quite capable last time we tried to, erm, ask for some supplies. So, no. We won't go in there, unless we are desparate enough to dare either angering our Queen or that crazy mage. Also, it's not like we can't work on the repairs at all. It would just go so much quicker. */
IF ~~ THEN DO ~SetGlobal("bs_i_CursedTemple","GLOBAL",1)~ + again
IF ~GlobalGT("bsTalkedToPirate","GLOBAL",3)~ THEN DO ~SetGlobal("bs_i_CursedTemple","GLOBAL",1)~ + done
END

IF ~~ THEN pirate_08
SAY @3626 /* Oho! I said you can hold your ground. Well, you see - it's not that she was a *barrier* that hindered us to proceed further down. We do not *want* to go further down into a temple that angers our Bitch Queen, unless we are in dire need. So, that treasure in exchange of one hammer is still waiting for you! */
IF ~~ THEN + again
END

IF ~~ THEN pirate_09
SAY @3627 /* (sigh) Yes, that's a story you best ask Effy up there. Let's just say - we are neither the only people here, nor the most powerful ones. */
IF ~~ THEN + again
IF ~GlobalGT("bsTalkedToPirate","GLOBAL",3)~ THEN + done
END

IF ~~ THEN pirate_10
SAY @3628 /* Sahuagin? There is Sahuagin here? Damn Sea Devils, they didn't show up here so far. I hope it stays that way! */
IF ~~ THEN + again
IF ~GlobalGT("bsTalkedToPirate","GLOBAL",3)~ THEN + done
END

IF ~~ THEN on_it
SAY @3629 /* That's my <PRO_MANWOMAN>! */
IF ~~ THEN EXIT
END

IF ~~ THEN bye
SAY @3630 /* You do that. */
IF ~~ THEN EXIT
END

CHAIN
IF ~~ THEN BSPIRCPT hammer_given
@3631 /* By my uncle's beard - you're my <PRO_MANWOMAN>! That's exactly what I was talking about. Men - give these nice folks everything we can spare. This is worth it. */
 == BSPIRCPT IF ~HasItem("bsprtmag","bsichees")~ THEN @3632 /* Effy, honey, I said *everything*. */
 == bsprtmag IF ~HasItem("bsprtmag","bsichees")~ THEN @3633 /* Captain, *honey*, this piece of cheese is for Purug, and you know it. */
 == BSPIRCPT IF ~HasItem("bsprtmag","bsichees")
 GlobalLT("bs_ti_SquirrelQuest","GLOBAL",7)~ THEN @3634 /* You still believe you can revert his squirrel polymorph? */
 == BSPIRCPT IF ~HasItem("bsprtmag","bsichees")~ THEN @3635 /* Fine. - Everything except the cheese, then. */
 END
 IF ~~ THEN DO ~SetGlobal("bsTalkedToPirate","GLOBAL",3)
 EraseJournalEntry(@1001)
 EraseJournalEntry(@1002)
 EraseJournalEntry(@1003)~ SOLVED_JOURNAL @1000 EXIT


