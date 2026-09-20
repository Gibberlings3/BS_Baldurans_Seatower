/* Note: the text in brackets differ from the ra strings, e.g. still mention Tritherion instead of Valkur */

/* This is for side quests on the Old Temple Island that have nothing to do with the main quest */

/* Old Hermit (bs0105, library) */

BEGIN bsihermi

IF ~GlobalLT("bs_HermitQuests","GLOBAL",2)~ THEN first_meeting
SAY @0 /* Did you see it? It only shows itself for such short periods of time. But it was here! It was! Where is my notebook? Did you see my notebook? */
+ ~PartyHasItem("bsihrnt")
Global("bs_who","LOCALS",1) Global("bs_place","LOCALS",1)~ + @1 /* Is this the notebook you were looking for? It was on your desk! */ + notebook_01
+ ~Global("bs_who","LOCALS",0)~ + @2 /* Who are you? */ DO ~SetGlobal("bs_who","LOCALS",1)~ + who
+ ~Global("bs_place","LOCALS",0)~ + @3 /* What is this place? */ DO ~SetGlobal("bs_place","LOCALS",1)~ + place
+ ~Global("bs_place","LOCALS",1)
Global("bs_who","LOCALS",1)
Global("bs_rat","LOCALS",0)~ + @4 /* What is driving you crazy? */ DO ~SetGlobal("bs_rat","LOCALS",1)~ + rat
+ ~Global("bs_place","LOCALS",1)
Global("bs_who","LOCALS",1)
Global("bs_temple_ruins","LOCALS",0)~ + @5 /* I meant the old temple ruins. */ DO ~SetGlobal("bs_temple_ruins","LOCALS",1)~ + temple_ruins
+ ~Global("bs_place","LOCALS",1)
Global("bs_who","LOCALS",1)
Global("bs_HermitQuests","GLOBAL",0)~ + @6 /* I'll go look for your notebook. */ DO ~SetGlobal("bs_HermitQuests","GLOBAL",1)~ UNSOLVED_JOURNAL @974 + notebook

++ @7 /* I'll leave you to whatever it is you are doing. */ + leaving_01
END

IF ~~ THEN leaving_01
SAY @8 /* Yes, yes - not that I'm doing much, with it always hiding and my notebook missing! */
IF ~~ THEN EXIT
END

IF ~~ THEN leaving_02
SAY @9 /* Yes, thanks. */
IF ~~ THEN EXIT
END

IF ~~ THEN leaving_03
SAY @10 /* I'm glad to hear it. */
IF ~~ THEN EXIT
END

CHAIN
IF ~~ THEN bsihermi who
@11 /* Who I am? Me? You are funny, walzing into my home and asking me who I am. Well, my name is Theome, but I guess I'm an old hermit now, mumbling to herself, eh? You wait until you have reached my age and are stranded on a secluded island! Wait - you *are* stranded on a secluded island. */
== bsihermi IF ~!Race(Player1,ELF)~ THEN @12 /* Hmm, but being the <PRO_RACE> that you are, I am not sure you'll actually reach my age. Well, isn't that sad. */
== bsihermi @13 /* Feel free to take a rest in here. I'm used to it, although noone was here for longer now. And - I might be inhabitating this library, but it's not like it's *mine*. */
END
+ ~Global("bs_place","LOCALS",1)
Global("bs_rat","LOCALS",0)~ + @4 /* What is driving you crazy? */ DO ~SetGlobal("bs_rat","LOCALS",1)~ + rat
+ ~Global("bs_temple_ruins","LOCALS",1)
Global("bs_island","LOCALS",0)~ + @14 /* Do you know where we *are*? */ DO ~SetGlobal("bs_island","LOCALS",1)~ + island
+ ~Global("bs_place","LOCALS",1)
Global("bs_temple_ruins","LOCALS",0)~ + @5 /* I meant the old temple ruins. */ DO ~SetGlobal("bs_temple_ruins","LOCALS",1)~ + temple_ruins
+ ~Global("bs_place","LOCALS",1)
Global("bs_HermitQuests","GLOBAL",0)~ + @6 /* I'll go look for your notebook. */ DO ~SetGlobal("bs_HermitQuests","GLOBAL",1)~ UNSOLVED_JOURNAL @974 + notebook
+ ~Global("bs_place","LOCALS",1)
PartyHasItem("bsihrnt")~ + @1 /* Is this the notebook you were looking for? It was on your desk! */ + notebook_01
+ ~Global("bs_place","LOCALS",0)~ + @3 /* What is this place? */ DO ~SetGlobal("bs_place","LOCALS",1)~ + place
++ @7 /* I'll leave you to whatever it is you are doing. */ + leaving_01

APPEND bsihermi

IF ~~ THEN place
SAY @15 /* Well, this is a library - or it was, at least. Isn't that obvious? */
++ @5 /* I meant the old temple ruins. */ DO ~SetGlobal("bs_temple_ruins","LOCALS",1)~ + temple_ruins
++ @16 /* Do you think this is funny? */ + not_funny
END

IF ~~ THEN not_funny
SAY @17 /* What do you mean, "funny". Do I look like I'm having fun? That thing is driving me crazy and I'm constantly losing my notebook! */
+ ~Global("bs_temple_ruins","LOCALS",0)~ + @5 /* I meant the old temple ruins. */ DO ~SetGlobal("bs_temple_ruins","LOCALS",1)~ + temple_ruins
+ ~Global("bs_temple_ruins","LOCALS",1)
Global("bs_island","LOCALS",0)~ + @14 /* Do you know where we *are*? */ DO ~SetGlobal("bs_island","LOCALS",1)~ + island
+ ~Global("bs_who","LOCALS",1)
Global("bs_rat","LOCALS",0)~ + @4 /* What is driving you crazy? */ DO ~SetGlobal("bs_rat","LOCALS",1)~ + rat
+ ~Global("bs_who","LOCALS",1)
Global("bs_HermitQuests","GLOBAL",0)~ + @6 /* I'll go look for your notebook. */ DO ~SetGlobal("bs_HermitQuests","GLOBAL",1)~ UNSOLVED_JOURNAL @974 + notebook
+ ~Global("bs_who","LOCALS",1)
PartyHasItem("bsihrnt")~ + @1 /* Is this the notebook you were looking for? It was on your desk! */ + notebook_01
+ ~Global("bs_who","LOCALS",0)~ + @2 /* Who are you? */ DO ~SetGlobal("bs_who","LOCALS",1)~ + who
++ @7 /* I'll leave you to whatever it is you are doing. */ + leaving_01
END

IF ~~ THEN rat
SAY @18 /* Well, the rat! Didn't you see it? Malicious little creature! It nibbles on my notes and sometimes takes a whole page away to stuff its nest. Not nest, it's not a bird. You know, its rat nest! */
+ ~Global("bs_place","LOCALS",1)
Global("bs_temple_ruins","LOCALS",0)~ + @5 /* I meant the old temple ruins. */ DO ~SetGlobal("bs_temple_ruins","LOCALS",1)~ + temple_ruins
+ ~Global("bs_temple_ruins","LOCALS",1)
Global("bs_island","LOCALS",0)~ + @14 /* Do you know where we *are*? */ DO ~SetGlobal("bs_island","LOCALS",1)~ + island
+ ~Global("bs_HermitQuests","GLOBAL",0)~ + @6 /* I'll go look for your notebook. */ DO ~SetGlobal("bs_HermitQuests","GLOBAL",1)~ UNSOLVED_JOURNAL @974 + notebook
+ ~PartyHasItem("bsihrnt")~ + @1 /* Is this the notebook you were looking for? It was on your desk! */ + notebook_01
++ @7 /* I'll leave you to whatever it is you are doing. */ + leaving_01
END

IF ~~ THEN temple_ruins
SAY @19 /* Ah, the temple ruins. I found some old scribings, found some hints and clues - but the name of this island is "Old Temple Island" - they forgot who got worshipped here, and maybe it's not important any more. Such a place of emptyness, abandonment and despair! Well, it's not abandoned any more, seeing how the Sahuagin found it for their malicious intent. And it's not exactly empty, with all the people running around outside and downstairs... and inside! You are the first people to come into the library for some time, though. Guess I scared them away, heh. */
+ ~Global("bs_island","LOCALS",0)~ + @14 /* Do you know where we *are*? */ DO ~SetGlobal("bs_island","LOCALS",1)~ + island
+ ~Global("bs_rat","LOCALS",0)~ + @4 /* What is driving you crazy? */ DO ~SetGlobal("bs_rat","LOCALS",1)~ + rat
+ ~Global("bs_HermitQuests","GLOBAL",0)~ + @6 /* I'll go look for your notebook. */ DO ~SetGlobal("bs_HermitQuests","GLOBAL",1)~ UNSOLVED_JOURNAL @974 + notebook
+ ~PartyHasItem("bsihrnt")~ + @1 /* Is this the notebook you were looking for? It was on your desk! */ + notebook_01
++ @7 /* I'll leave you to whatever it is you are doing. */ + leaving_01
END

IF ~~ THEN island
SAY @20 /* Well, we are on an island - don't look at me like that, I wasn't finished! - we are on an island in the Korinn Archipelago north of the Sea of Moonshae called "Old Temple Island". I could point it to you on a map, but I don't have one. */
IF ~~ THEN EXIT
END

IF ~~ THEN notebook
SAY @21 /* That would be appreciated. Much appreciated! There is nothing in there, actually. But I need the empty pages to write things down! I have no idea where I left it. It might be here in this library - maybe somewhere between the books? Or I lost it when I went down into the temple ruins. Or outside? Ah, I'm getting old. No - I *am* old. Well, you go and search for it. */
+ ~Global("bs_rat","LOCALS",0)~ + @4 /* What is driving you crazy? */ DO ~SetGlobal("bs_rat","LOCALS",1)~ + rat
+ ~Global("bs_place","LOCALS",1)
Global("bs_temple_ruins","LOCALS",0)~ + @5 /* I meant the old temple ruins. */ DO ~SetGlobal("bs_temple_ruins","LOCALS",1)~ + temple_ruins
+ ~Global("bs_temple_ruins","LOCALS",1)
Global("bs_island","LOCALS",0)~ + @14 /* Do you know where we *are*? */ DO ~SetGlobal("bs_island","LOCALS",1)~ + island
+ ~PartyHasItem("bsihrnt")~ + @1 /* Is this the notebook you were looking for? It was on your desk! */ + notebook_01
++ @7 /* I'll leave you to whatever it is you are doing. */ + leaving_01
END

IF ~~ THEN notebook_01
SAY @22 /* Ah - yes, this is my notebook. On my desk? Go figure. No wonder I didn't find it! Who could have guessed it's on my *desk*? Thank you so much. I owe you a favor, young one. */
IF ~~ THEN DO ~ActionOverride("bsihermi",TakePartyItem("bsihrnt"))
ActionOverride("bsihermi",DestroyItem("bsihrnt"))
SetGlobal("bs_HermitQuests","GLOBAL",2)
EraseJournalEntry(@974)
EraseJournalEntry(@975)
AddexperienceParty(100)~ SOLVED_JOURNAL @976 EXIT
IF ~GlobalGT("bs_HermitQuests","GLOBAL",4)
!Global("bs_HermitQuests","GLOBAL",6)~ THEN DO ~ActionOverride("bsihermi",TakePartyItem("bsihrnt"))
ActionOverride("bsihermi",DestroyItem("bsihrnt"))
EraseJournalEntry(@974)
EraseJournalEntry(@975)
AddexperienceParty(100)~ SOLVED_JOURNAL @976 EXIT
END

IF ~OR(2)
Global("bs_HermitQuests","GLOBAL",2)
Global("bs_HermitQuests","GLOBAL",3)~ THEN hello_again
SAY @23 /* There! The rat! Did you see it? It's always hiding, blasted creature. */
+ ~Global("bs_ti_SquirrelQuest","GLOBAL",2)~ + @24 /* There is pirates out there who claim you polymorphed one of their own into a squirrel. */ DO ~SetGlobal("bs_ti_SquirrelQuest","GLOBAL",3)~ UNSOLVED_JOURNAL @998 + squirrel
+ ~Global("bs_HermitQuests","GLOBAL",2)~ + @25 /* Is there any way I can help you with that rat? */ + rat_help
+ ~PartyHasItem("bsichees") Global("bs_PCCheese","LOCALS",0)~ + @26 /* I have some cheese here... */ DO ~SetGlobal("bs_PCCheese","LOCALS",1)~ + cheese
+ ~Global("bs_came_here","LOCALS",0)~ + @27 /* How did you end up here? */ DO ~SetGlobal("bs_came_here","LOCALS",1)~ + came_here
+ ~Global("bs_temple_ruins","LOCALS",1)
Global("bs_island","LOCALS",0)~ + @14 /* Do you know where we *are*? */ DO ~SetGlobal("bs_island","LOCALS",1)~ + island
+ ~Global("bs_more_about_ruins","LOCALS",0)~ + @28 /* Can you tell me more about these ruins? */ DO ~SetGlobal("bs_more_about_ruins","LOCALS",1)~ + more_about_ruins
+ ~Global("bs_sahuagin","LOCALS",0)~ + @29 /* You noticed the Sahuagin downstairs, right? Do you know what they are up to? */ DO ~SetGlobal("bs_sahuagin","LOCALS",1)~ + sahuagin
+ ~Global("bs_sahuagin","LOCALS",1)~ + @30 /* Can you tell me more about the Sahuagins? */ DO ~SetGlobal("bs_sahuagin","LOCALS",2)~ + sahuagin_not_yet
+ ~Global("bs_HermitQuests","GLOBAL",3)~ + @31 /* I'm on it. */ + leaving_02
++ @32 /* Do you have anything to spare? */ + shop
++ @7 /* I'll leave you to whatever it is you are doing. */ + leaving_02
END

IF ~~ THEN cheese
SAY @33 /* Cheese! These creatures must like cheese, don't they? Put it somewhere near the shelves, I'm sure it'll come out to get it. Not *on* the shelves, mind you - we don't want the books to smell of cheese on top of it all! */
IF ~~ THEN UNSOLVED_JOURNAL @979 EXIT
END

IF ~~ THEN rat_help
SAY @34 /* If you'll manage to kill it - I don't care how! But it's very shy. If I had *something* to attract it - you know, something they like to eat, maybe. What do rats eat? Cheese, fruits, nuts? Sometimes I get the impression *this* one is living of paper, ha! Oh, and don't hesitate to use fire in here. It's so damp everyhwere - damp and cold, cold, cold - unless you bombard me with any spells, I won't mind. Kill the rat and I'll give you my most treasured magic item! That's how much this is worth to me! */
IF ~~ THEN DO ~SetGlobal("bs_HermitQuests","GLOBAL",3)
SetGlobal("bs_TalkedAboutRat","LOCALS",1)~ UNSOLVED_JOURNAL @978 EXIT
END

IF ~~ THEN came_here
SAY @35 /* You really want to know? It's a tiny little bit embarrassing. For me, I mean. I was attempting to teleport to Calimshan, when I noticed my attempts being drawn to one certain place, and one place only. I frantically tried to escape whatever I was being drawn to, and landed here instead. This is not the embarrassing part; that I managed to escape the calling is something I'm rather proud of. It's my attempt to travel by teleportation over such a long distance which was foolish. There is a trap set up for mages who do that, apparently, of which I wasn't aware - which makes sense, because otherwise it wouldn't be a *trap* any more, right? I do not feel like trying where I'd end up, as you can imagie, because - it's obviously a trap, and I don't want to be trapped, you see?- so I'm kind of stuck here for the time being. The time being over a decade now... (sigh) Well, whatever, this is hardly your problem. I mean, that *I* am stuck here. That *you* are, however, is definitely your problem. */
IF ~~ THEN + hello_again
IF ~GlobalGT("bs_HermitQuests","GLOBAL",4)
!Global("bs_HermitQuests","GLOBAL",6)~ THEN + relaxed
END

IF ~~ THEN more_about_ruins
SAY @36 /* It was impressive temple grounds - all left and forgotten, it's always the same. There is not much I can say. Other than that the Sahuagin found a use for it, obviously - and that the island is a refuge to many who were stranded in the Moonshae Seas. That's the peculiar thing about this island - it is easy to reach due to the currents and wind direction - but it is prone to get ships stranded *because* of the currents and the wind, and due to all the underwater rock formations. So, almost every castaway is able to reach it, but there is near to no way off. It would be a lot more crowded weren't the darn Sahuagin here, feeding off the castaways. Anyway, I wrote my findings about the temple complex down, they should be in one of the shelfs. If the rat didn't eat them. */
IF ~~ THEN + hello_again
IF ~GlobalGT("bs_HermitQuests","GLOBAL",4)
!Global("bs_HermitQuests","GLOBAL",6)~ THEN + relaxed
END
END //APPEND

CHAIN
IF ~~ THEN bsihermi sahuagin
@37 /* They found their way here some months past, and guarded off the arena room. That doesn't mean I wasn't able to sneak inside to have a peek at what they are doing in there. They are preparing it for something big - something really big. I should probably interfere, but then - I am not strong enough against all their forces, and I like to live. Even if it is in a damp library. */
== bsihermi IF ~GlobalLT("bs_HermitQuests","GLOBAL",4)~ THEN @38 /* Also - how am I supposed to *concentrate* with everyone and their *rat* sabotaging my work! - I didn't mean you, actually. I quite enjoy our little chat, at least so far you didn't try to harm me, so that's a big plus. */
END
IF ~~ THEN + hello_again
IF ~GlobalGT("bs_HermitQuests","GLOBAL",4)
!Global("bs_HermitQuests","GLOBAL",6)~ THEN + relaxed

APPEND bsihermi
IF ~~ THEN sahuagin_not_yet
SAY @39 /* The Sahuagin - yes, they are a threat and they are working on *something* - blasted, I can't get *one* thought together with this stupid rat running around! */
IF ~~ THEN EXIT
END

IF ~~ THEN squirrel
SAY @40 /* Wha - he's still a squirrel? I just wanted to scare them a bit so they'd leave me alone. I even considered the rough pirate life and demeanor for the curse - pirates like to bicker, don't they? Always rough and brutal - one good punch and he goes back to being the lout he was. Really surprised that hasn't happened already, I thought that was foolproof with pirates. */
IF ~~ THEN + hello_again
IF ~GlobalGT("bs_HermitQuests","GLOBAL",4)
!Global("bs_HermitQuests","GLOBAL",6)~ THEN + relaxed
END
END //APPEND

CHAIN
IF ~Global("bs_HermitQuests","GLOBAL",4)~ THEN bsihermi rat_dead
@41 /* It's dead! It's really dead. Thank you! Thank you so much. Here is your reward. */
== bsihermi IF ~Global("bs_TalkedAboutRat","LOCALS",1)~ THEN @42 /* Ah, it makes my heart ache to part with it, but I promised you, so here it is! An item from Balduran - yes, the famous founder of Baldur's Gate, no less! You will find no finer piece, and you can stick it onto your hair, too! */
== bsihermi IF ~Global("bs_TalkedAboutRat","LOCALS",0)~ THEN @43 /* Ah, it makes my heart ache to part with it, but for this great deed you deserve my most treasured possession, so here it is! An item from Balduran - yes, the famous founder of Baldur's Gate, no less! You will find no finer piece, and you can stick it onto your hair, too! */
END
IF ~~ THEN DO ~GiveItem("bsbalfrk",LastTalkedToBy(Myself))
ActionOverride("bsiherat",DestroySelf())
SetGlobal("bs_HermitQuests","GLOBAL",5)
EraseJournalEntry(@978)
EraseJournalEntry(@979)
AddexperienceParty(350)~ SOLVED_JOURNAL @980 EXIT
IF ~GlobalGT("bs_RatShowsItself","LOCALS",3)~ THEN DO ~GiveItem("bsbalfrk",LastTalkedToBy(Myself))
ActionOverride("bsiherat",DestroySelf())
SetGlobal("bs_HermitQuests","GLOBAL",5)
EraseJournalEntry(@978)
EraseJournalEntry(@979)
AddexperienceParty(350)
AddJournalEntry(@996,QUEST_DONE)~ SOLVED_JOURNAL @980 EXIT

APPEND bsihermi
IF ~Global("bs_UmberHulkQuest","GLOBAL",2)~ THEN umber_hulk
SAY @44 /* Did you feel that? I was afraid it would come this one day. That blasted creature! */
++ @45 /* Another one? */ + umber_hulk_02
++ @46 /* This was not a rat - I hope. */ + umber_hulk_01
++ @47 /* What was that? */ + umber_hulk_02
++ @48 /* You'll tell me even if I'll say "farewell" now, won't you? */ + umber_hulk_03
END

IF ~~ THEN umber_hulk_01
SAY @49 /* Ahaha, no, not a rat. *This* creature does not only threaten my notes. */
IF ~~ THEN + umber_hulk_02
END

IF ~~ THEN umber_hulk_02
SAY @50 /* I *think* it's that Umber Hulk down in the caves. It's digging its tunnels with such enthusiasm it didn't even notice me when I saw it some time ago. It's still on it, isn't it? Seems what I feared is happening - it's right under the library now. */
IF ~~ THEN + umber_hulk_03
END
END //APPEND

CHAIN
IF ~GlobalLT("bs_UmberHulkQuest","GLOBAL",5)
GlobalGT("bs_HermitQuests","GLOBAL",4)
!Global("bs_HermitQuests","GLOBAL",6)
PartyHasItem("bsiumbhh")~ THEN bsihermi noticed_hide
@51 /* I notice now that you seem to have killed the Umber Hulk down in the caves? I appreciate it. */
== bsihermi IF ~Global("bs_UmberHulkQuest","GLOBAL",0)~ THEN @52 /* That creature was digging nonstop for weeks - my fear was it would threaten the library floor's stability at some point. But it also means that it was a strong one. I am sure its hide is remarkable, you did good in collecting it. Gifted armorers can make wonderful platemails out of them - much better than Ankheg! */
== bsihermi IF ~Global("bs_balduran","MYAREA",2)
GlobalGT("bs_UmberHulkQuest","GLOBAL",0)~ THEN @53 /* You *still* won't get Balduan's boots for it. */
END
IF ~~ THEN DO ~SetGlobal("bs_UmberHulkQuest","GLOBAL",5)~ EXIT

CHAIN
IF ~~ THEN bsihermi umber_hulk_03
@54 /* Ah, don't worry. The floor will not cave in just like that- But if I allow that Umber Hulk to proceed, it *will* destabilize the floor. (sigh) I'll take care of it once I regained my strength. This Umber Hulk was digging nonstop for weeks now, it must be a strong one. I am sure its hide will be remarkable. Gifted armorers can make wonderful platemails out of them - much better than Ankheg! Sooo - if you feel like taking it on, you know... Be my guest! */
== bsihermi IF ~Global("bs_balduran","MYAREA",2)~ THEN @55 /* You will *not* get Balduan's boots for it, though. */
END
IF ~~ THEN DO ~SetGlobal("bs_UmberHulkQuest","GLOBAL",3)~ UNSOLVED_JOURNAL @100074 EXIT

APPEND bsihermi
IF ~GlobalGT("bs_HermitQuests","GLOBAL",4)
!Global("bs_HermitQuests","GLOBAL",6)~ THEN relaxed
SAY @56 /* Do you want anything else, young one? */
+ ~Global("bs_door_riddle","LOCALS",0)
GlobalGT("bs_DoorJournalEntry","MYAREA",0)
GlobalGT("bs_i_HiddenDoorOpened","GLOBAL",0)
GlobalLT("bs_i_HiddenDoorOpened","GLOBAL",3)~ + @57 /* You mentioned in one of your notes that the door riddle to open the hidden door to where the castaways are hiding would be really simple. I can't figure out how it works, though - please enlighten me. */ DO ~SetGlobal("bs_door_riddle","LOCALS",1)~ + door_riddle
+ ~PartyHasItem("bsihrnt")~ + @1 /* Is this the notebook you were looking for? It was on your desk! */ + notebook_01
+ ~Global("bs_ti_SquirrelQuest","GLOBAL",2)~ + @24 /* There is pirates out there who claim you polymorphed one of their own into a squirrel. */ DO ~SetGlobal("bs_ti_SquirrelQuest","GLOBAL",3)~ UNSOLVED_JOURNAL @998 + squirrel
+ ~Global("bs_SahuaginPortalRoom","GLOBAL",2)
Global("bs_HermitQuests","GLOBAL",8)~ + @58 /* The great portal is destroyed. */ DO ~SetGlobal("bs_HermitQuests","GLOBAL",10)~ + portal_done
+ ~Global("bs_HermitQuests","GLOBAL",7)~ + @59 /* Alright, I'll destroy the portal. */ + stop_sahuagin_03
+ ~Global("bs_silver_fork","LOCALS",0)~ + @60 /* The silver fork was your most treasured possession? */ DO ~SetGlobal("bs_silver_fork","LOCALS",1)~ + silver_fork_01
+ ~Global("bs_silver_fork","LOCALS",0)~ + @61 /* That silver fork - that's a joke, right? */ DO ~SetGlobal("bs_silver_fork","LOCALS",1)~ + silver_fork
+ ~Global("bs_balduran","MYAREA",0)~ + @62 /* How do you come into possession of items from Balduran? */ DO ~SetGlobal("bs_balduran","MYAREA",1)
SetGlobal("bs_BalduransItems","GLOBAL",2)~ + balduran
+ ~Global("bs_balduran","MYAREA",1)
GlobalLT("bs_HermitQuests","GLOBAL",9)~ + @63 /* Is there really no way for you to give me those Boots of Balduran? */ DO ~SetGlobal("bs_balduran","MYAREA",2)~ + boots_promise
+ ~Global("bs_balduran","MYAREA",1)
GlobalGT("bs_HermitQuests","GLOBAL",8)~ + @63 /* Is there really no way for you to give me those Boots of Balduran? */ DO ~SetGlobal("bs_balduran","MYAREA",3)~ + boots_after
+ ~Global("bs_came_here","LOCALS",0)~ + @27 /* How did you end up here? */ DO ~SetGlobal("bs_came_here","LOCALS",1)~ + came_here
+ ~OR(2) Global("bs_temple_ruins","LOCALS",1) Global("bs_came_here","LOCALS",1)
Global("bs_island","LOCALS",0)~ + @14 /* Do you know where we *are*? */ DO ~SetGlobal("bs_island","LOCALS",1)~ + island
+ ~Global("bs_more_about_ruins","LOCALS",0)~ + @28 /* Can you tell me more about these ruins? */ DO ~SetGlobal("bs_more_about_ruins","LOCALS",1)~ + more_about_ruins
+ ~Global("bs_sahuagin","LOCALS",0)~ + @29 /* You noticed the Sahuagin downstairs, right? Do you know what they are up to? */ DO ~SetGlobal("bs_sahuagin","LOCALS",1)~ + sahuagin
+ ~GlobalGT("bs_sahuagin","LOCALS",0)
GlobalLT("bs_HermitQuests","GLOBAL",7)~ + @64 /* About the Sahuagin... */ + saguahin_more
++ @32 /* Do you have anything to spare? */ + shop
++ @7 /* I'll leave you to whatever it is you are doing. */ + leaving_02
END

IF ~~ THEN door_riddle
SAY @65 /* Well, in that case, you are not worthy to open that door, sorry. - Young <PRO_MANWOMAN>, do you think I can remember the exact combination? I know it was really simple - so simple that I didn't think I needed to write it down. Hmm... Just count the number of fish in the tanks. Or was it the order of appearance? Anyway, it had something to do with the sea creatures that were in the tanks. You'll notice when you compare which ones are actually *there* and which choices are offered at the door puzzle. And then you just have to press them in the right order. It *was* logical, I remember that. */
IF ~~ THEN UNSOLVED_JOURNAL @100082 + relaxed
END

IF ~~ THEN balduran
SAY @66 /* Well, my theory is simple, and, er, a little plain - the items came here, either with or without Balduran. - How am I supposed to know? It's not like I found his body or - *scoffs* - his *journal*, you know? But it's two of his things - three, actually, if one is being pedantic. - See these boots? Yes, they were from Balduran, too, both of them, and there were still together after all this time. No, don't even think about asking. I'm not going to give them to you, because I think they are quite nifty, so I want to keep them. */
= @67 /* It makes you wonder, though. What fate occurred to him so he had to part with these items... *Could* part with them. Didn't need them any more... */
++ @68 /* Well, I guess it's not so uncommon to get new boots. I woudn't worry too much about it. */ + balduran_01
++ @69 /* Yes, it's weird he'd lose his boots... It's not a good sign, I wager. */ + balduran_02
++ @70 /* Yes, it's *definitely* a tragedy to lose one's fork. */ + balduran_03
++ @7 /* I'll leave you to whatever it is you are doing. */ + leaving_02
END

IF ~~ THEN balduran_01
SAY @71 /* His boots? */
IF ~~ THEN + balduran_04
END

IF ~~ THEN balduran_02
SAY @72 /* I'm not talking about his boots! */
IF ~~ THEN + balduran_04
END

IF ~~ THEN balduran_03
SAY @73 /* Was that sarcasm? Young one, let me tell you something. */
IF ~~ THEN + balduran_04
END

IF ~~ THEN balduran_04
SAY @74 /* You think the boots are the more crucial possession? Please. It's nothing special to get new boots! You can get new boots on every corner! But a *fork*? And a silver one, with engravings, meaning someone special gave it to you? This tells a story, I tell you, and a sad and tragic one, I am sure! I can't even think about it without feeling my eyes tearing up. */
++ @75 /* Er, if you say so. */ + balduran_06
++ @76 /* You have a point there. */ + balduran_06
++ @77 /* I am sorry. I definitely agree that, to a seafarer, a fork is much more important than boots. */ + balduran_05
++ @7 /* I'll leave you to whatever it is you are doing. */ + leaving_02
END

IF ~~ THEN balduran_05
SAY @78 /* Sarcasm. Always sarcasm! */
IF ~~ THEN + balduran_06
END

IF ~~ THEN balduran_06
SAY @79 /* It does make you wonder, though, what *did* happen to him. I am sure he didn't plan on just vanishing one day. */
+ ~OR(5)
    Global("BGDraInfo","GLOBAL",1) //BGT
    Global("OHDradeelInfo","GLOBAL",1) //EE
    Global("DraQuest","GLOBAL",1)
    Global("DraUnquest","GLOBAL",1)
    Global("dradeelhelp","GLOBAL",1)~ + @80 /* Well, I have seen what is supposed to have been his last ship, stranded on an island, with his elven companion still alive. He could tell a vivid story of how they came here, but not what happened to Balduran after it. */ + balduran_08
+ ~Global("bs_BalduransLogbook","GLOBAL",1)~ + @81 /* Well, I did find Balduran's logbook - at least the one he used until his last known ship stranded on a secluded island. */ + balduran_10
++ @82 /* I guess we'll never know. */ + balduran_07
++ @83 /* Maybe someone will find out, some day. */ + balduran_07
END

IF ~~ THEN balduran_07
SAY @84 /* Maybe someone does and regrets it, because - well, he *did* vanish without a trace, didn't he? There's a reason for that. There is always a reason. */
IF ~~ THEN + balduran_09
END

IF ~~ THEN balduran_08
SAY @85 /* You did? His ship you say? Was it near here? Ah, it doesn't matter. - You just *had* to mention the part about the elven companion still wandering around on the island, didn't you? */
IF ~~ THEN + balduran_09
END
END //APPEND

CHAIN
IF ~~ THEN bsihermi balduran_09
@86 /* Imagine that - being stranded on a remote island... */
== bsihermi IF ~GlobalLT("bs_HermitQuests","GLOBAL",9)~ THEN @87 /* (sigh) Well, I'm sure nobody will pay any attention to *my* possessions if they turn up anywhere. */
== bsihermi IF ~GlobalGT("bs_HermitQuests","GLOBAL",8)~ THEN @88 /* For a long time I thought that would be my fate, as well. (sigh) Well, I'm sure no one would have paid any attention to *my* possessions if they had appeared anywhere. */
END
IF ~~ THEN + relaxed

APPEND bsihermi
IF ~~ THEN balduran_10
SAY @89 /* You did? His logbook? I thought I'm jesting when I mentioned his journal. - And it *still* doesn't tell what happened to him? */
IF ~~ THEN + balduran_09
END

IF ~~ THEN boots_promise
SAY @90 /* Arrgh, I should have kept my mouth shut! Sure - if you, hmm, if you, let's say - if you'll find me a way off this island that does *not* include a ship. Alright? Got it? In case my sarcasm is lost on you, let me spell it out: NO! You will not get these boots! */
IF ~~ THEN EXIT
END

IF ~~ THEN shop
SAY @91 /* Hmm, I guess I could sell you some of my stuff. It's not like I have much use for it here. */
IF ~~ THEN DO ~StartStore("bsihermi",LastTalkedToBy(Myself))~ EXIT
END

IF ~~ THEN silver_fork
SAY @92 /* I am at a loss about what you mean. */
++ @93 /* Your most treasured possession and magic item? This fork? */ + silver_fork_01
++ @94 /* I expected something else. You know, something really useful. */ + silver_fork_03
++ @95 /* Ah, don't worry. I appreciate the thought. */ + leaving_03
END

IF ~~ THEN silver_fork_01
SAY @96 /* Yes! Isn't it marvellous? */
++ @97 /* If you cherish it so much, maybe we could trade it for something more useful to me? */ + silver_fork_03
++ @95 /* Ah, don't worry. I appreciate the thought. */ + leaving_03
++ @98 /* It surely is. I just expected something else. You know, something more useful. */ + silver_fork_03
++ @99 /* Well... */ + silver_fork_04
++ @100 /* No, it isn't. */ + silver_fork_02
END

IF ~~ THEN silver_fork_02
SAY @101 /* Oh! - You don't cherish it? */
++ @97 /* If you cherish it so much, maybe we could trade it for something more useful to me? */ + silver_fork_03
++ @95 /* Ah, don't worry. I appreciate the thought. */ + silver_fork_05
++ @102 /* I'm not saying that. But I expected something else. You know, something really useful. */ + silver_fork_03
++ @103 /* No, I don't. */ + silver_fork_04
END

IF ~~ THEN silver_fork_03
SAY @104 /* But it is useful! It lets everyone see better in the dark. You can eat with it dignified - you can even scratch your head with it, too! */
IF ~~ THEN + silver_fork_04
END

IF ~~ THEN silver_fork_04
SAY @105 /* Alright. I see you don't like it. But it *is* yours now - taking it back would feel wrong, as much as I'm missing it already. */
IF ~~ THEN + silver_fork_05
END

IF ~~ THEN silver_fork_05
SAY @106 /* You are clearly not satisfied with my reward. But-but... */
IF ~~ THEN + silver_fork_06
IF ~Global("bs_GotGreenstoneAmulet","MYAREA",0)~ THEN + greenstone_amulet
END

IF ~~ THEN silver_fork_06
SAY @107 /* I don't *have* anything else - I'm so sorry. */
IF ~~ THEN + relaxed
END

IF ~~ THEN greenstone_amulet
SAY @108 /* I don't have anything special to give - just this old junk. Well, maybe you'll have a use for this. */
IF ~~ THEN DO ~GiveItemCreate("bsgrstne",LastTalkedToBy(Myself),3,0,0)
SetGlobal("bs_GotGreenstoneAmulet","MYAREA",1)~ + relaxed
END

IF ~~ THEN saguahin_more
SAY @109 /* Do you have more specific questions? */
+ ~Global("bs_saguahin_more_01","LOCALS",0)~ + @110 /* Do you know what exactly they are up to? */ DO ~SetGlobal("bs_saguahin_more_01","LOCALS",1)~ + saguahin_more_01
+ ~Global("bs_guarded_room","LOCALS",0)~ + @111 /* What do they use the guarded room for? */ DO ~SetGlobal("bs_guarded_room","LOCALS",1)~ + bs_guarded_room
+ ~Global("bs_guarded_room","LOCALS",1)
Global("bs_SahuaginPortalRoom","GLOBAL",0)~ + @112 /* Suppose I want to go into the guarded room, any hints and tips how to do that without stirring every Sahuagin on this island? */ DO ~SetGlobal("bs_guarded_room","LOCALS",2)~ + bs_guarded_room_01
+ ~Global("bs_stop_sahuagin","LOCALS",0)~ + @113 /* You said you think they should be stopped with what they are working on. Any idea how? */ DO ~SetGlobal("bs_stop_sahuagin","LOCALS",1)~ + stop_sahuagin
+ ~Global("bs_stop_sahuagin","LOCALS",1)
PartyHasItem("bsispop")~ + @114 /* I found this seemingly dry spore powder on the Myconides in the below caves. Might this be dry enough for our purpose? */ DO ~SetGlobal("bs_stop_sahuagin","LOCALS",2)~ + stop_sahuagin_01
++ @7 /* I'll leave you to whatever it is you are doing. */ + leaving_02
END

IF ~~ THEN saguahin_more_01
SAY @115 /* That's easily answered: hunting and plundering! - And this time, with the help of something big. I don't understand their language that good, but I understood enough to know that they are preparing to call on a god of theirs - I even think I overheard summoning some god's avatar, but that seems very far stretched, I think. Whatever they are planning - I am sure it will affect people's settlements at the coast, because it's *Sahuagin* we are talking about. This island is a place very well chosen to prepare a nasty surprise, considering it is almost impossible to reach by ship without intensive knowledge about the surrounding underwater rock formation. I mean - it is easy to reach, but not if you were planning on leaving again, if you know what I mean. It's also why I fear the Sahuagin will remain unstopped and will most definitely succeed, unless Ill come up with something really smart. */
IF ~~ THEN UNSOLVED_JOURNAL @982 + saguahin_more
END

IF ~~ THEN bs_guarded_room
SAY @116 /* I call the guarded room "arena" because it surely looks like one. It has huge doorways, probably leading to more temple halls in the past, but whatever was behind them caved in long ago. The Sahuagin are turning the doorways into portals - they are not dumb, those creatures. Last time I peaked, one was still under construction, but another one of the portals had a steady connection to somewhere under water, and they went and came back with trophies, so I can only assume it was underground of some human city. It seems closed now, though - and the Sahuagin didn't seem to be pleased about that, I can tell you. */
IF ~~ THEN + saguahin_more
IF ~GlobalLT("bs_SawPortalRoom","GLOBAL",2)~ THEN DO ~EraseJournalEntry(@100006)
SetGlobal("bs_SawPortalRoom","GLOBAL",2)~ UNSOLVED_JOURNAL @983 + saguahin_more
END

IF ~~ THEN bs_guarded_room_01
SAY @117 /* You should be able to sneak past the guards at the door without problems if you are invisible. Also, I found old schematics which indicated that there seem to have been a direct passage starting in the old chapel downstairs, which so far, I didn't discover. */
= @118 /* But, whichever way you chose, the real problem is the magic *inside*. I never triggered it, gods be thanked, but there is definitely some sort of safety measure, so you should make sure you stay invisible - or prepare for a good battle. Because *then* I have the feeling it will not only be the guards outside the entrance that will become a problem with regard to leaving this place in a hurry, oh no. */
= @119 /* But - since Sahuagin don't use magic, this seems to be a mechanism from times long past. The Sahuagin seem to have found a way around it - otherwise they wouldn't be able to work in this room without having to fight monsters. See if you can find anything once you're inside. */
IF ~~ THEN DO ~AddJournalEntry(@100072,QUEST)~ UNSOLVED_JOURNAL @984 + saguahin_more
IF ~GlobalLT("bs_SecretPassageOpen","GLOBAL",4)~ THEN DO ~AddJournalEntry(@100003,QUEST)
AddJournalEntry(@100072,QUEST)~ UNSOLVED_JOURNAL @984 + saguahin_more
IF ~Global("bs_SecretPassageOpen","GLOBAL",0)~ THEN DO ~AddJournalEntry(@100001,QUEST)
AddJournalEntry(@100072,QUEST)
SetGlobal("bs_SecretPassageOpen","GLOBAL",1)~ UNSOLVED_JOURNAL @984 + saguahin_more
END

IF ~~ THEN stop_sahuagin
SAY @120 /* Other than killing any Sahuagin showing its head here - no. No idea whatsoever. Because, the powerful portal they are still working on got created using blood of a mighty sea creature. We would need the blood of a land creature to close it. Poweful blood. Powerful enough to render the portal unusable. It's still not completed, so this should actually destroy it, not only turn it to dormant. */
= @121 /* There is no such creature here, that's one of the reasons why I didn't get any further with any measure I considered. I pondered, for example, that such powerful blood *could* be created by *some* blood of a land creature plus very, *very* dry something something of a land something. Very, *extremely* dry. You see where I am getting at? Here, in this damb place. In this *damn* place. Ha! */
IF ~~ THEN UNSOLVED_JOURNAL @987 + saguahin_more
END

IF ~~ THEN stop_sahuagin_01
SAY @122 /* Dry spore powder... Why - this could actually work! This is as dry as baby powder... Buah! It surely doesn't smell as good. - Wait here. Wait just a short moment. I know it made sense to keep that blasted rat's blood. This might *actually* work... */
IF ~~ THEN DO ~ActionOverride("bsihermi",TakePartyItem("bsispop"))
ActionOverride("bsihermi",DestroyItem("bsispop"))
SetGlobal("bs_HermitQuests","GLOBAL",6)
EraseJournalEntry(@982)
EraseJournalEntry(@983)
EraseJournalEntry(@984)
EraseJournalEntry(@100006)
ClearAllActions() StartCutSceneMode() StartCutScene("bscut002")~ SOLVED_JOURNAL @985 EXIT
END
END //APPEND

CHAIN
IF ~Global("bs_HermitQuests","GLOBAL",6)~ THEN bsihermi stop_sahuagin_02
@123 /* Look at that. Blood of a mimicked powerful land creature. No worries, it's not only the rat blood and the spores, it also contains quite some magic, too. So! Now - someone only needs to go inside and destroy that darn thing... */
/* only Sahuagin dead (check for barons and priestess) */
== bsihermi IF ~Global("bs_SahuaginPortalRoom","GLOBAL",0)
    Dead("bsisagr1")
    Dead("bsisagb1")
    Dead("bsisagp1")~ THEN @124 /* I know you already took care of the Sahuagin that were here presently, but whatever is guarding the arena is still active, and I don't expect it to be easy to defeat. */
/* only Portal room already cleared */
== bsihermi IF ~Global("bs_SahuaginPortalRoom","GLOBAL",1)
    OR(3) !Dead("bsisagr1")
    !Dead("bsisagb1")
    !Dead("bsisagp1")~ THEN @125 /* I know you already took care of the arena's defence system, but there are still Sahuagin here, and they won't respond kindly to destroying their work. And, frankly - I'd prefer them dead if we break their toys. */
/* nothing was done yet */
== bsihermi IF ~Global("bs_SahuaginPortalRoom","GLOBAL",0)
    OR(3) !Dead("bsisagr1")
    !Dead("bsisagb1")
    !Dead("bsisagp1")~ THEN @126 /* And it won't be easy. Whatever is guarding the arena is still active, and I don't expect it to be easily defeated - plus there is also still Sahuagin here, and they won't respond kindly to destroying their work. Frankly - I'd prefer them dead if we break their toys. */
== bsihermi @127 /* My great plan had one great detriment - I am quite drained from what I just did. So, I'm afraid I'll be no help in fighting anything for another week or so. So... */
END
+ ~OR(4)
    Global("bs_SahuaginPortalRoom","GLOBAL",0)
    !Dead("bsisagr1")
    !Dead("bsisagb1")
    !Dead("bsisagp1")~ + @128 /* I'll do it, don't worry. */ + stop_sahuagin_03
+ ~OR(4)
    Global("bs_SahuaginPortalRoom","GLOBAL",0)
    !Dead("bsisagr1")
    !Dead("bsisagb1")
    !Dead("bsisagp1")~ + @129 /* Yes, indeed. "Someone" needs to do that. */ + stop_sahuagin_05
IF ~Dead("bsisagr1")
    Dead("bsisagb1")
    Dead("bsisagp1")
    Global("bs_SahuaginPortalRoom","GLOBAL",1)~ THEN + stop_sahuagin_02_01

/* Sahuagin dead (check for barons and priestess) and Portal room already cleared */
APPEND bsihermi
IF ~~ THEN stop_sahuagin_02_01
SAY @130 /* You already took care of the Sahuagin that were here presently, *and* the arena's defence system. It's basically just walking in there and applying the blood tincture. I should be able to do that. */
++ @128 /* I'll do it, don't worry. */ + stop_sahuagin_03_01
++ @131 /* Yes, I think my work here is done. I am sure you'll be able to handle the rest on your own. */ DO ~SetGlobal("bs_HermitQuests","GLOBAL",9)
SetGlobal("bs_POP","GLOBAL",2)
SetGlobal("bs_SahuaginPortalRoom","GLOBAL",2)~ + stop_sahuagin_07
END

IF ~~ THEN stop_sahuagin_03
SAY @132 /* Thank. You. I am serious! I wish you all the luck of this world, young <PRO_MANWOMAN>. And no Sahuagin on your heels. */
IF ~~ THEN + stop_sahuagin_04
END

IF ~~ THEN stop_sahuagin_03_01
SAY @133 /* Thank you. */
IF ~~ THEN + stop_sahuagin_04
END
END //APPEND

CHAIN
IF ~~ THEN bsihermi stop_sahuagin_04
@134 /* Take it. Make sure you apply it to the correct doorway, because I fear there are no more rats nor dry spores available currently. And apply it properly so it can develop its full effect, not just some sprinkles, alright? And make sure there is no monsters around any more before you do, or they might get in the way, and - I'll be quiet now, just make sure this *works*, alright? */
== bsihermi IF ~OR(4)
    Global("bs_SahuaginPortalRoom","GLOBAL",0)
    !Dead("bsisagr1")
    !Dead("bsisagb1")
    !Dead("bsisagp1")~ THEN @135 /* Also take these. These might come in handy, and like I said, there can't be enough fire in this place! */ DO ~GiveItemCreate("POTN10",LastTalkedToBy(Myself),5,0,0)
GiveItemCreate("POTN13",LastTalkedToBy(Myself),2,0,0)~
END
IF ~~ THEN DO ~GiveItemCreate("bsiblood",LastTalkedToBy(Myself),0,0,0)
EraseJournalEntry(@989)
SetGlobal("bs_HermitQuests","GLOBAL",8)~ UNSOLVED_JOURNAL @988 EXIT
IF ~Global("bs_GotGreenstoneAmulet","MYAREA",0)~ THEN DO ~GiveItemCreate("bsiblood",LastTalkedToBy(Myself),0,0,0)
EraseJournalEntry(@989)
SetGlobal("bs_HermitQuests","GLOBAL",8)~ UNSOLVED_JOURNAL @988 + stop_sahuagin_06

APPEND bsihermi
IF ~~ THEN stop_sahuagin_05
SAY @136 /* Ahaha. Emotional pressure doesn't work on you, what a shame. I mean, for *you* that's great, of course. It's not that I wouldn't try to do it - it would actually be a valid reason to challenge the Sahuagin and see who will prevail, but it will be wiser to wait until I am recovered. Let me know - you know, in case you change your mind etceterapehpeh. */
IF ~~ THEN DO ~SetGlobal("bs_HermitQuests","GLOBAL",7)
EraseJournalEntry(@987)~ UNSOLVED_JOURNAL @989 EXIT
END
END //APPEND

CHAIN
IF ~~ THEN bsihermi stop_sahuagin_06
@137 /* Wait, I feel like I should give you something else. */
== bsihermi IF ~Dead("bsispore")~ THEN @138 /* And yes, it's hilarious I'll give this to you now - *after* you battled the Myconids. */
END
IF ~~ THEN + greenstone_amulet

APPEND bsihermi
IF ~~ THEN stop_sahuagin_07
SAY @139 /* I definitely will be able to. Even if new Sahuagin arrive in the meantime, I'll find a way to get past them before they restart manufacturing. */
IF ~~ THEN + portal_done
END

IF ~~ THEN portal_done
SAY @140 /* I thank you. You did a good deed here, for many people who won't even know. We probably didn't stop whatever the Sahuagin were planning, but we surely delayed it, and made their life a little bit more inconvenient - well, and you also shortened quite a few of theirs, too. */
= @141 /* Wait - that means there is another possible portal at my disposal now, doesn't it? I *should* be able to open it to a safe location - safe and somewhere on the main lands. Oh yes, this is brilliant! It'll also be open to any castaways. - And any Sahuagins that might come here - alright, I'll think of a solution for that. But, the important thing is that I will be able to open a portal that will bring people away from here! I'll only need to recover first, and then collect some ingredients... Thank you, again. There is so little I can give you as a reward. Trinkets. Nothing but trinkets. */
IF ~~ THEN DO ~GiveItemCreate("MISC36",LastTalkedToBy(Myself),3,0,0)
GiveItemCreate("MISC39",LastTalkedToBy(Myself),1,0,0)
GiveItemCreate("MISC45",LastTalkedToBy(Myself),1,0,0)
EraseJournalEntry(@987)
EraseJournalEntry(@988)
EraseJournalEntry(@989)
EraseJournalEntry(@990)
~ SOLVED_JOURNAL @991 EXIT
IF ~Global("bs_GotGreenstoneAmulet","MYAREA",0)~ THEN DO ~GiveItemCreate("MISC36",LastTalkedToBy(Myself),3,0,0)
GiveItemCreate("MISC39",LastTalkedToBy(Myself),1,0,0)
GiveItemCreate("MISC45",LastTalkedToBy(Myself),1,0,0)
EraseJournalEntry(@987)
EraseJournalEntry(@988)
EraseJournalEntry(@989)
EraseJournalEntry(@990)
~ SOLVED_JOURNAL @991 + stop_sahuagin_06
IF ~Global("bs_balduran","MYAREA",2)~ THEN + give_boots
END

IF ~~ THEN give_boots
SAY @142 /* Wait agin - that... that also means you *did* open a way off this island without involving a ship. Oh - gods... (long sigh). Fine. I stand by my word, even if it was supposedly given in jest. Don't you *dare* make fun of any holes in my socks, you hear me? Walking around without boots until I get me a new pair is emarassing enough! */
IF ~~ THEN DO ~GiveItemCreate("MISC36",LastTalkedToBy(Myself),3,0,0)
GiveItemCreate("MISC39",LastTalkedToBy(Myself),1,0,0)
GiveItemCreate("MISC45",LastTalkedToBy(Myself),1,0,0)
GiveItem("bsbdboot",LastTalkedToBy(Myself))
EraseJournalEntry(@987)
EraseJournalEntry(@988)
EraseJournalEntry(@989)
EraseJournalEntry(@990)
SetGlobal("bs_balduran","MYAREA",3)~ SOLVED_JOURNAL @991 EXIT
IF ~Global("bs_GotGreenstoneAmulet","MYAREA",0)~ THEN DO ~GiveItemCreate("MISC36",LastTalkedToBy(Myself),3,0,0)
GiveItemCreate("MISC39",LastTalkedToBy(Myself),1,0,0)
GiveItemCreate("MISC45",LastTalkedToBy(Myself),1,0,0)
GiveItem("bsbdboot",LastTalkedToBy(Myself))
EraseJournalEntry(@987)
EraseJournalEntry(@988)
EraseJournalEntry(@989)
EraseJournalEntry(@990)
SetGlobal("bs_balduran","MYAREA",3)~ SOLVED_JOURNAL @991 + stop_sahuagin_06
END

IF ~~ THEN boots_after
SAY @143 /* You really are determined to eat me out of my house and home, yes? - Well, in a way, you also made it *possible* that I'm leaving this place, so... (sigh). Fine. I can understand why they would appeal to an adventurer like you. I wanted to try walking barefood anyway; I heard it is supposed to be quite healthy. */
IF ~~ THEN DO ~GiveItem("bsbdboot",LastTalkedToBy(Myself))~ EXIT
END
END //APPEND

/* Pirate Capatain: in BSPIRCPT.d - Own file for legacy reasons. */

/* Effy, Pirate Mage */

BEGIN bsprtmag

IF ~GlobalLT("bs_ti_SquirrelQuest","GLOBAL",2)~ THEN pirate_mage
SAY @144 /* Be careful with that squirrel. I'll roast you if you hurt him, you hear? */
+ ~Global("bs_ti_SquirrelQuest","GLOBAL",1)~ + @145 /* What about a squirrel? You captain said I should ask you. */ + squirrel_story
+ ~Global("bs_ti_SquirrelQuest","GLOBAL",0)~ + @146 /* What about a squirrel? */ + squirrel_story
++ @147 /* The last one who talked to me in that tone of voice is eating daisy roots. Would you like to join them? */ + pirate_mage_01
++ @148 /* And here I was, thinking you might want to have help with whatever it is you are occupied with, but fine, I don't need this. */ + squirrel_story_00
++ @149 /* Good day and good bye to you, too! */ + good_bye
END

IF ~~ THEN pirate_mage_01
SAY @150 /* Ooo - I'm so scared. Can't you just see my knees shaking? They'll rattle all the way from here to that boat! */
++ @151 /* You can be glad I'm not here to fight all of you pirates, or I would shut that mouth of yours. */ + pirate_mage_02
+ ~Global("bs_ti_SquirrelQuest","GLOBAL",1)~ + @152 /* I think we started on the wrong foot. What about a squirrel? You captain said I should ask you. */ + squirrel_story
+ ~Global("bs_ti_SquirrelQuest","GLOBAL",0)~ + @153 /* I think we started on the wrong foot. What about a squirrel? */ + squirrel_story
++ @148 /* And here I was, thinking you might want to have help with whatever it is you are occupied with, but fine, I don't need this. */ + squirrel_story_00
++ @149 /* Good day and good bye to you, too! */ + good_bye
END

IF ~~ THEN pirate_mage_02
SAY @154 /* Yeah, sure. */
+ ~Global("bs_ti_SquirrelQuest","GLOBAL",1)~ + @152 /* I think we started on the wrong foot. What about a squirrel? You captain said I should ask you. */ + squirrel_story
+ ~Global("bs_ti_SquirrelQuest","GLOBAL",0)~ + @153 /* I think we started on the wrong foot. What about a squirrel? */ + squirrel_story
++ @148 /* And here I was, thinking you might want to have help with whatever it is you are occupied with, but fine, I don't need this. */ + squirrel_story_00
++ @149 /* Good day and good bye to you, too! */ + good_bye
END

IF ~~ THEN squirrel_story_00
SAY @155 /* Oh, bit sensitive, aren't we? Well, if you want to hear the story - */
IF ~~ THEN + squirrel_story
END

IF ~~ THEN squirrel_story
SAY @156 /* Turns out there is an old mage in that old library. Turns out she is a pretty decent mage. Turns out she can polymorph people into squirrels. Did you see the squirrel hopping around here somewhere? That is Purug, my mate. Yes, mate as in "mate". And I prefer him much more human shaped, as you can imagine. So far, I didn't succeed in turning him back, nothing worked, not remove curse, no polymorph spell I tried. */
IF ~~ THEN DO ~SetGlobal("bs_ti_SquirrelQuest","GLOBAL",2)~ UNSOLVED_JOURNAL @997 + squirrel_story_01
END

IF ~GlobalGT("bs_ti_SquirrelQuest","GLOBAL",1)
GlobalLT("bs_ti_SquirrelQuest","GLOBAL",7)
Global("bs_StoppedSquirrelQuest","MYAREA",0)~ THEN squirrel_story_01
SAY @157 /* Just keep your fingers off him, alright? */
+ ~Global("bs_ti_SquirrelQuest","GLOBAL",3)~ + @158 /* The funny thing is, the old mage said that hitting him would actually turn him back. */ + squirrel_story_02
+ ~Global("bs_ti_SquirrelQuest","GLOBAL",4)~ + @159 /* I told you how to free him. It's your decision what to make of it. */ + squirrel_story_03
+ ~Global("bs_StartStore","LOCALS",0)~ + @160 /* Do you have anything you would sell? */ DO ~SetGlobal("bs_StartStore","LOCALS",1)~ + store
+ ~Global("bs_StartStore","LOCALS",1)~ + @160 /* Do you have anything you would sell? */  DO ~StartStore("bsprtmag",LastTalkedToBy())~ EXIT
++ @161 /* Good day. */ + good_bye
END

IF ~~ THEN store
SAY @162 /* Hmm, I might have a potion or two. */
IF ~~ THEN DO ~StartStore("bsprtmag",LastTalkedToBy())~ EXIT
END

IF ~~ THEN squirrel_story_02
SAY @163 /* Did you lose your mind? I'm not going to hit my mate while he's a squirrel! One good punch and he'll be dead! Nah, I'm sure she was messing with you. That sly old fox! */
IF ~~ THEN DO ~SetGlobal("bs_ti_SquirrelQuest","GLOBAL",4)~ UNSOLVED_JOURNAL @993 EXIT
END

IF ~~ THEN squirrel_story_03
SAY @164 /* You really sure this in't just a late revenge from that old hag? (sigh) Fine. */
IF ~~ THEN DO ~SetGlobal("bs_StoppedSquirrelQuest","MYAREA",1)
EraseJournalEntry(@993)
EraseJournalEntry(@995)
EraseJournalEntry(@997)
EraseJournalEntry(@998)~ SOLVED_JOURNAL @994 + reward
END

IF ~~ THEN reward
SAY @165 /* Here is my treasure - don't frown upon it, it's the most delicious cheese you'll ever taste, and I kept it for Purug originally, but I figured - once he's capable of eating it again, he'll actually be more than happy to share. */
IF ~~ THEN DO ~ActionOverride("bsprtmag",GiveItem("bsichees",LastTalkedToBy(Myself)))~ EXIT
IF ~GlobalGT("bs_HermitQuests","GLOBAL",4)~ THEN DO ~ActionOverride("bsprtmag",GiveItem("bsichees",LastTalkedToBy(Myself)))~ SOLVED_JOURNAL @100057 EXIT
END

IF ~~ THEN good_bye
SAY @166 /* Talk to the captain, if you have more questions. */
IF ~~ THEN EXIT
END

IF ~Global("bs_ti_SquirrelQuest","GLOBAL",7)~ THEN done
SAY @167 /* Looks like giving Purug a good flogging did the trick, eh? And here I was, trying to *protect* him from harm. */
IF ~~ THEN DO ~SetGlobal("bs_ti_SquirrelQuest","GLOBAL",8)
EraseJournalEntry(@993)
EraseJournalEntry(@994)
EraseJournalEntry(@995)
EraseJournalEntry(@997)
EraseJournalEntry(@998)~ SOLVED_JOURNAL @100056 EXIT
IF ~Global("bs_StoppedSquirrelQuest","MYAREA",0)~ THEN DO ~SetGlobal("bs_ti_SquirrelQuest","GLOBAL",9)
EraseJournalEntry(@993)
EraseJournalEntry(@994)
EraseJournalEntry(@995)
EraseJournalEntry(@997)
EraseJournalEntry(@998)~ SOLVED_JOURNAL @100056 + reward
END

IF ~OR(2)
GlobalGT("bs_ti_SquirrelQuest","GLOBAL",7)
Global("bs_StoppedSquirrelQuest","MYAREA",1)~ THEN after
SAY @168 /* Hello again. */
+ ~Global("bs_StartStore","LOCALS",0)~ + @160 /* Do you have anything you would sell? */ DO ~SetGlobal("bs_StartStore","LOCALS",1)~ + store
+ ~Global("bs_StartStore","LOCALS",1)~ + @160 /* Do you have anything you would sell? */  DO ~StartStore("bsprtmag",LastTalkedToBy())~ EXIT
++ @161 /* Good day. */ + good_bye
END

/* bsipsqrl, squirrel pirate in squirrel form */
BEGIN bsipsqrl
IF ~True()~ THEN squirrel
SAY @169 /* This squirrel seems a little too trusting for a squirrel, but it escapes being caught. */
IF ~~ THEN EXIT
END

/* Purug, squirrel pirate in pirate form */
BEGIN bspirats
IF ~GlobalLT("bs_ti_SquirrelQuest","GLOBAL",6)~ THEN no_longer_squirrel
SAY @170 /* Oh, wow! I have hands again! And a voice! Listen - I won't hold a grudge that you attacked me. Can we just part in piece? I want to enjoy my true form a little longer. */
IF ~~ THEN DO ~SetGlobal("bs_ti_SquirrelQuest","GLOBAL",6)
EraseJournalEntry(@993)
EraseJournalEntry(@994)
EraseJournalEntry(@998)~ UNSOLVED_JOURNAL @995 EXIT
END

IF ~GlobalGT("bs_ti_SquirrelQuest","GLOBAL",5)~ THEN no_longer_squirrel_01
SAY @171 /* I understand now that you were *saving* me. Freed by a good slap - I have to say, I like the humor of that old woman. */
IF ~~ THEN EXIT
END

//pirate with store
BEGIN bspiratd
IF ~True()~ THEN store
SAY @172 /* Heyho! Can I interest you in some of my things? */
++ @173 /* Sure, show me what you've got. */ DO ~StartStore("bspiratd",LastTalkedToBy())~ EXIT
++ @174 /* Not today. */ EXIT
END

// generic pirate dialogue
BEGIN bspirate
IF ~RandomNum(4,1)~ THEN pirate_01
SAY @175 /* What a godsforsaken island. */
IF ~~ THEN EXIT
END
IF ~RandomNum(4,2)~ THEN pirate_01
SAY @176 /* I know what *L*'ll do when we get off this island, that's for sure! */
IF ~~ THEN EXIT
END
IF ~RandomNum(4,3)~ THEN pirate_01
SAY @177 /* Talk to the captain. */
IF ~~ THEN EXIT
END
IF ~RandomNum(4,4)~ THEN pirate_01
SAY @178 /* Can't wait until we are back at sea. */
IF ~~ THEN EXIT
END


/* A Girl and Binky, in bs0102, sarcophagus */

BEGIN bsidgirl //A Girl

IF ~Global("bs_BinkyWakeup","GLOBAL",1)~ THEN first_time
SAY @179 /* Don't open it that much. Close it again and go away! Otherwise Binky will wake up. I warned you! This is *my* hiding place! */
IF ~~ THEN DO ~SetGlobal("bs_BinkyWakeup","GLOBAL",2)
ActionOverride("bsidgirl",DestroySelf())~ UNSOLVED_JOURNAL @1012 EXIT
END

IF ~Global("bs_BinkyWakeup","GLOBAL",5)~ THEN second_time
SAY @180 /* Aww, now you broke Binky. Oh well. I guess I'll search for another hiding place. */
IF ~~ THEN DO ~AddexperienceParty(100)
        SetGlobal("bs_BinkyWakeup","GLOBAL",6)
        EraseJournalEntry(@1012)
        EraseJournalEntry(@1014)
        ClearAllActions()
        StartCutSceneMode()
        StartCutScene("bscut014")~ SOLVED_JOURNAL @1013 EXIT
END

BEGIN bsidooms //Doomsayer Binky

IF ~Global("bs_BinkyWakeup","GLOBAL",3)~ THEN doomsayer
SAY @181 /* Sssstormss shall bring doom to theeee... */
IF ~~ THEN DO ~SetGlobal("bs_BinkyWakeup","GLOBAL",4)
ActionOverride("bsidooms",Enemy())~ UNSOLVED_JOURNAL @1014 EXIT
END


/* Umber Hulk in bs0103 */

BEGIN bsiumhlk
IF ~Global("bs_AngerTheHulk","MYAREA",0)~ THEN busy
SAY @182 /* The Umber Hulk seems to be busy digging. It's not paying any attention to you - yet. However, you can't be sure that you'll be able to approach it again unscathed. */
IF ~~ THEN DO ~SetGlobal("bs_AngerTheHulk","MYAREA",1) ActionOverride("bsiumhlk",Face(4))~ EXIT
END

IF ~Global("bs_AngerTheHulk","MYAREA",1)~ THEN now
SAY @183 /* The Umber Hulk notices you! */
IF ~~ THEN DO ~IncrementGlobal("bs_AngerTheHulk","MYAREA",1) ActionOverride("bsiumhlk",Enemy())~ EXIT
END

/* Valkur priest in bs0101 */

BEGIN bsitrnpr

IF ~Global("bs_LacedonQuest","MYAREA",2)~ THEN priest_blessing_done
SAY @184 /* It is done. The Lacedons are no more, the cursed people are free at last. I blessed the boulder, knocked sand off and applied it to the poor souls. We did a good deed today, my friend. We helped others to their freedom. Trithereon will be pleased! */
IF ~~ THEN DO ~SetGlobal("bs_LacedonQuest","MYAREA",3)
AddexperienceParty(500)
EraseJournalEntry(@1005) EraseJournalEntry(@1006)~ SOLVED_JOURNAL @1007 EXIT
END

CHAIN
IF ~Global("bs_MeetsPriest","GLOBAL",0)~ THEN bsitrnpr priest
@185 /* Welcome. I am Mollager, priest of Trithereon. I am stranded here, just as you are, and I made this old and forgotten chapel my abode, and this common hammer my weapon, heh. Let me know if you are in need of temple services, I am more than ready to serve. */
== bsitrnpr IF ~!Dead("BSILCDN2")~ THEN @186 /* A warning, friend - further down the aisle are Lacedons, poor cursed souls. Not all of them lost their senses, but most have, so they can no longer tell friend from foe. I am sure I could help them, but I lack the physical strength needed to set them free. */
END
IF ~~ THEN DO ~SetGlobal("bs_MeetsPriest","GLOBAL",1)~ + priest_00

APPEND bsitrnpr
IF ~Dead("bsilcdn2")
NumDeadGT("bsilcdn1",1)
Global("bs_NoticesLacedonsDeath","LOCALS",0)~ THEN lacedons_dead
SAY @187 /* It is a real pity you killed the Lacedons, my friend. They were cursed people, we could have freed them without sending their souls to the afterlife. Well, what is done is done. I hope they'll find peace with the deity they've chosen. */
IF ~~ THEN DO ~SetGlobal("bs_NoticesLacedonsDeath","LOCALS",1)~ + priest_00
END

IF ~True()~ THEN priest_00
SAY @188 /* Is there anything I can help you with? */
+ ~GlobalGT("bs_HermitQuests","GLOBAL",8)
Global("bs_KnowPortal","LOCALS",0)~ + @189 /* The old mage in the library said she'll open a portal to the shore in the near future. I figured that's interesting for you, too. */ DO ~SetGlobal("bs_KnowPortal","LOCALS",1)~ + portal
+ ~OR(2) Dead("bsisagr1") GlobalGT("bs_RebelDeal","GLOBAL",2)
Global("bs_sahuagin_level","LOCALS",0)~ + @190 /* The Sahuagin are gone from this level. They should not come back again. */ DO ~SetGlobal("bs_sahuagin_level","LOCALS",1)~ + level_cleared
+ ~!Dead("BSILCDN2")
Global("bs_LacedonQuest","MYAREA",0)~ + @191 /* Physical strength to set the Lacedons free? Do you want me to kill them? */ DO ~SetGlobal("bs_LacedonQuest","MYAREA",1)~ + priest_lacedons_01
+ ~!Dead("BSILCDN2")
Global("bs_LacedonQuest","MYAREA",0)~ + @192 /* How do you think the Lacedons could be saved? */ DO ~SetGlobal("bs_LacedonQuest","MYAREA",1)~ + priest_lacedons_02
+ ~!Dead("BSILCDN2")
Global("bs_LacedonQuest","MYAREA",1)
Global("bs_LacedonUmberlee","LOCALS",0)~ + @193 /* I am here on a mission for Umberlee ... so to say. I fear helping the Lacedons might anger her and endanger my way off this island. */ DO ~SetGlobal("bs_LacedonUmberlee","LOCALS",1)~ + anger_umberlee
+ ~!Dead("BSILCDN2")
Global("bs_LacedonQuest","MYAREA",1)
NumItemsGT("bsistone","Altar01",0)~ + @194 /* I put a heavy stone on the altar. Do you think this works? */ + priest_lacedons_04
+ ~Global("bs_SecretPassageMechanism","MYAREA",1)
GlobalLT("bs_SecretPassageOpen","GLOBAL",2)~ + @195 /* When I put a boulder on the altar, it bulged. Do you have an idea what is going on? */ DO ~SetGlobal("bs_SecretPassageMechanism","MYAREA",2)~ + altar_mechanism
+ ~Global("bs_SecretPassageOpen","GLOBAL",2)
GlobalLT("bs_SecretPassageMechanism","MYAREA",3)~ + @196 /* A secret passage has opened behind the statue. Do you have an idea where it could lead to? */ DO ~SetGlobal("bs_SecretPassageMechanism","MYAREA",3)~ + secret_passage
+ ~GlobalGT("bsTalkedToPirate","GLOBAL",0)
Global("bs_AskedHammer","LOCALS",0)~ + @197 /* There is pirates outside who would have a good use for your craftman's hammer. */ DO ~SetGlobal("bs_AskedHammer","LOCALS",1)~ + pirate_hammer
+ ~PartyHasItem("BLUN01")
Global("bs_AskedHammer","LOCALS",1)~ + @198 /* Could I change your hammer against this normal club? */ DO ~SetGlobal("bs_AskedHammer","LOCALS",2)~ + pirate_hammer_02
+ ~PartyHasItem("HAMM01")
OR(2) Global("bs_AskedHammer","LOCALS",1) Global("bs_AskedHammer","LOCALS",2)~ + @199 /* Could I change your hammer against this normal war hammer? */ DO ~SetGlobal("bs_AskedHammer","LOCALS",3)~ + pirate_hammer_01
+ ~PartyHasItem("BLUN08")
OR(2) Global("bs_AskedHammer","LOCALS",1) Global("bs_AskedHammer","LOCALS",2)~ + @200 /* Could I change your hammer against this normal flail? */ DO ~SetGlobal("bs_AskedHammer","LOCALS",4)~ + pirate_hammer_01
+ ~PartyHasItem("BLUN02")
!PartyHasItem("BLUN08")
OR(2) Global("bs_AskedHammer","LOCALS",1) Global("bs_AskedHammer","LOCALS",2)~ + @200 /* Could I change your hammer against this normal flail? */ DO ~SetGlobal("bs_AskedHammer","LOCALS",5)~ + pirate_hammer_01
+ ~PartyHasItem("BLUN04")
OR(2) Global("bs_AskedHammer","LOCALS",1) Global("bs_AskedHammer","LOCALS",2)~ + @201 /* Could I change your hammer against this normal mace? */ DO ~SetGlobal("bs_AskedHammer","LOCALS",6)~ + pirate_hammer_01
+ ~PartyHasItem("BLUN06")
OR(2) Global("bs_AskedHammer","LOCALS",1) Global("bs_AskedHammer","LOCALS",2)~ + @202 /* Could I change your hammer against this normal morning star? */ DO ~SetGlobal("bs_AskedHammer","LOCALS",7)~ + pirate_hammer_01
++ @203 /* I am in need of your deity's services. */ DO ~StartStore("bsitrnpr",LastTalkedToBy())~ EXIT
+ ~Global("bs_moreAboutGod","LOCALS",0)~ + @204 /* Tell me more about Trithereon. */ DO ~SetGlobal("bs_moreAboutGod","LOCALS",1)~ + priest_trithereon
+ ~Global("bs_sahuagin_threat","LOCALS",0)
!Dead("bsisagr1") !GlobalGT("bs_RebelDeal","GLOBAL",2)~ + @205 /* Aren't you afraid of the Sahuagins? */ DO ~SetGlobal("bs_sahuagin_threat","LOCALS",1)~ + sahuagin_threat
+ ~Global("bs_sahuagin","LOCALS",0)
GlobalLT("bs_SahuaginPortalRoom","GLOBAL",2)~ + @206 /* Do you know what the Sahuagin are here for? */ DO ~SetGlobal("bs_sahuagin","LOCALS",1)~ + sahuagin
++ @207 /* Farewell. */ + good_bye
END

IF ~~ THEN sahuagin_threat
SAY @208 /* I wouldn't say that, but I'm cautious about the threat they pose. It's not long since they've actually been on this level. But I know how to fight back, and luckily for me, they don't seem interested in another confrontation with the Lacedons, so after some scouting they haven't ventured this deep into these corridors again. */
IF ~~ THEN + priest_00
END

IF ~~ THEN level_cleared
SAY @209 /* That is great news. It will make the lives of the castaways much easier. And, well, mine, too. */
IF ~~ THEN + priest_00
END

IF ~~ THEN altar_mechanism
SAY @210 /* Oh? It seems it is some old mechanism of sorts. I am sure this place has more secrets than meet the eye, but I do not know what this was for. */
IF ~~ THEN + priest_00
END

IF ~~ THEN secret_passage
SAY @211 /* Indeed! Unfortunately, I do not know where it leads to. I can only advise you to be cautious. */
IF ~~ THEN + priest_00
END

IF ~~ THEN portal
SAY @212 /* Ah? This is great news for any starnded soul on this island. I'll make sure everyone will know about it. Thank you for informing me. */
IF ~~ THEN + priest_00
END

IF ~~ THEN good_bye
SAY @213 /* Trithereon's blessing be with you. */
IF ~~ THEN EXIT
END

IF ~~ THEN anger_umberlee
SAY @214 /* I understand your worry. Yet, you walk freely in this temple, and I do not sense her presence with you. Umberlee's church seem to rely on you for whatever it is you came here for, and I would believe you have some sort of leverage - at least until your work is done. */
IF ~~ THEN + priest_00
END

IF ~~ THEN sahuagin
SAY @215 /* They are here on behalf of their king. They used to be on the lower levels only, but spread out to here not too long ago. They threaten the castaways that used to live in these halls. I haven't seen those poor people for longer now, they seem to hide. I hope they managed to avoid being caught - those Sea Devils do not hesitate to make people their meal if they have the chance! */
++ @216 /* Castaways? */ + castaways
++ @217 /* I see. */ + priest_00
++ @207 /* Farewell. */ + good_bye
END

IF ~~ THEN castaways
SAY @218 /* Yes, there is poor people here, stranded on this island like we are. Most of them are no fighters, so they are hiding ever since the Sahuagin came onto this level of the temple ruins. */
IF ~~ THEN + priest_00
END

IF ~~ THEN pirate_hammer
SAY @219 /* I am willing to exchange this hammer for another - or any blunt weapon, for that matter, but I'm afraid I cannot just give it away, since it is my only weapon. - Nothing too fancy, I am not trying to profit from it, but it should be a real weapon, because that is the purpose I am using this craftman's tool for. */
IF ~~ THEN UNSOLVED_JOURNAL @1002 + priest_00
END

IF ~~ THEN pirate_hammer_01
SAY @220 /* Why yes, I would galdly do so. I will help by giving away the hammer, and I helped myself by getting a better weapon. Trithereon will be pleased! */
IF ~~ THEN EXIT
END

IF ~~ THEN pirate_hammer_02
SAY @221 /* I'm afraid not, my friend. I could have made such a wooden weapon myself at any time if I had considered it worthwhile. I will only echange my hammer for a weapon that was crafted by a smith. */
IF ~~ THEN + priest_00
END

END //APPEND

CHAIN
IF ~~ THEN bsitrnpr priest_trithereon
@222 /* Trithereon is the god of freedom, the god of the ability to fight for oneself and to help those in need. My lord blesses those who fight for themselves and for others. He is kind and supports the creativity of his followers to fulfill his dogmas. That is why I can use this chapel, this altar to pay homage to him, even if it was built for a long forgotten deity. */
== bsitrnpr IF ~HasItem("bsihammr","bsitrnpr")~ THEN @223 /* It is also the reason why, although only wielding a craftman's hammer, I am confident that my lord looks favorably on my efforts to help myself. */
END
IF ~~ THEN + priest_00

APPEND bsitrnpr
IF ~~ THEN priest_lacedons_01
SAY @224 /* Oh no! Not at all. What an unfortunate misunderstanding. I am glad you asked! */
IF ~~ THEN + priest_lacedons_02
END

IF ~~ THEN priest_lacedons_02
SAY @225 /* From what I understand, they were followers of Umberlee who fell out of favor with their goddess. The bitch queen cursed them into their current, wretched state. I'm *sure* Trithereon would grant me the power to lift the curse, but I need something to apply it to; something that is the opposite of Umberlee's domain, something that stands as a clear mark against the flowing waters of the seas - solid, dry, and heavy. */
= @226 /* I tried blessing sand I collected outside, I tried stones, *many* stones, and big stones as big as I could carry, but it didn't suffice, they were all too small against Umberlee's wrath. I am still convinced that a boulder so heavy it nearly can't be lifted by a single person would be the symbol needed to redeem the poor souls. */
IF ~~ THEN DO ~SetGlobal("bs_i_CursedTemple","GLOBAL",1)~ + priest_lacedons_03
END

IF ~~ THEN priest_lacedons_03
SAY @227 /* If you intend to help, go look around - search for a heavy boulder - and bring it here. Place it on the altar, and I will bless it with Trithereon's mercy to free the Lacedons. */
IF ~~ THEN UNSOLVED_JOURNAL @1006 + priest_00
IF ~Global("bs_LacedonJournalEntry","LOCALS",0)~ THEN DO ~SetGlobal("bs_LacedonJournalEntry","LOCALS",1)
AddJournalEntry(@1005,QUEST)~ UNSOLVED_JOURNAL @1006 + priest_00
END

END //APPEND

CHAIN
IF ~~ THEN bsitrnpr priest_lacedons_04
@228 /* Brilliant! Stone is a synonym for mountains, for land, for anything outside Umberlee's domain. This boulder shoulr be heavy enough. I will bestow it with Trithereon's blessing and find a way to use it on the Lacedons. Let us finally free those poor souls. */
== %EDWIN_JOINED% IF ~InParty("Edwin") See("Edwin") !StateCheck("Edwin",CD_STATE_NOTVALID)~ THEN @229 /* I can think of an easy way to use such a boulder on a Lacedon so they'll be freed from the curse, and with a lot less fuss, too. (Why are we wasting our time here?) */
END
IF ~~ THEN DO ~SetGlobal("bs_LacedonQuest","MYAREA",2) ClearAllActions() StartCutSceneMode() StartCutScene("bscut002")~ EXIT



/* Lacedons in bs0101 */

BEGIN bsilcdn2 //Higher Lacedon
IF ~OR(2)
GlobalLT("bs_LacedonQuest","MYAREA",3)
Global("bs_LacedonQuest","MYAREA",98)~ THEN explain_curse
SAY @230 /* Diddd herd them in theeere... Waiting... Waiting for currrse to be brokennn... Cursed by Umberleeeee... Warning, my friennnnd... Minnnd clouded by many... do not enterrr... */
IF ~~ THEN DO ~SetGlobal("bs_i_CursedTemple","GLOBAL",1)~ EXIT
IF ~Global("bs_LacedonJournalEntry","LOCALS",0)~ THEN DO ~SetGlobal("bs_LacedonJournalEntry","LOCALS",1)~ UNSOLVED_JOURNAL @1005 EXIT
END

IF ~Global("bs_LacedonQuest","MYAREA",3)
Global("bs_LacedonTransformation","LOCALS",1)~ THEN curse_done
SAY @231 /* You lifted the curse and took Umberlee's wrath from us. We are indepted to you. */
++ @232 /* You are pirates! */ + curse_done_01
++ @233 /* What happened to you? */ + curse_done_02
++ @234 /* Whatever. Any reward? */ + good_bye
++ @235 /* I'll take my leave. */ + good_bye
END

IF ~~ THEN curse_done_01
SAY @236 /* We were, yes. */
++ @233 /* What happened to you? */ + curse_done_02
++ @234 /* Whatever. Any reward? */ + good_bye
++ @235 /* I'll take my leave. */ + good_bye
END

IF ~~ THEN curse_done_02
SAY @237 /* We angered Umberlee by entering this temple and getting too interested in the old gods it was built for. Her curse is lifted, but I guess we can call ourselves lucky if we'll survive one more boat trip. */
+ ~GlobalGT("bsTalkedToPirate","GLOBAL",0)~ + @238 /* There is pirates outside, are these your folks? */ + pirates_01
+ ~GlobalGT("bsTalkedToPirate","GLOBAL",0)~ + @239 /* The pirates outise mentioned not daring to go into these temples. */ + pirates
++ @234 /* Whatever. Any reward? */ + good_bye
++ @235 /* I'll take my leave. */ + good_bye
END

IF ~~ THEN pirates
SAY @240 /* Yes, well possible we are the reason for that, haha. */
IF ~~ THEN + pirates_02
END

IF ~~ THEN pirates_01
SAY @241 /* I think you have no idea just how long we were trapped in this cursed state. */
IF ~~ THEN + pirates_02
END

IF ~~ THEN pirates_02
SAY @242 /* We were trapped here for very long. If there is any pirates outside, they don't belong to us - and they are smart for not coming into here. */
IF ~~ THEN + good_bye
END

IF ~~ THEN good_bye
SAY @243 /* Take anything you find in here as a reward. It's not much, but it's all we have, and we part with it gladly for our rescue. Really, all we'd have a use for is some candles to lighten up this dark and damp place. I know there is lots downstairs in the crypt, though. We'll rest a little and then'll go wandering again. */
IF ~~ THEN DO ~SetGlobal("bs_LacedonQuest","MYAREA",4)~ UNSOLVED_JOURNAL  @100035 EXIT
END

IF ~~ THEN good_bye_01
SAY @244 /* Thank you for freeing us. */
IF ~~ THEN EXIT
END

IF ~GlobalGT("bs_LacedonQuest","MYAREA",3)~ THEN done
SAY @245 /* Greetings, savior. */
+ ~GlobalGT("bs_HermitQuests","GLOBAL",8)
Global("bs_KnowPortal","LOCALS",0)~ + @189 /* The old mage in the library said she'll open a portal to the shore in the near future. I figured that's interesting for you, too. */ DO ~SetGlobal("bs_KnowPortal","LOCALS",1)~ + portal
+ ~PartyHasItem("bsicandl")~ + @246 /* I have a candle for you, if you want. */ + candle
++ @247 /* Good bye. */ + good_bye_01
END

IF ~~ THEN candle
SAY @248 /* If I want? I definitely want! Thank you! I can't give you nothin' but a smile and a heartfelt "thank you" for it. */
IF ~~ THEN DO ~ActionOverride("bsilcdn2",TakePartyItem("bsicandl"))
ActionOverride("bsilcdn2",DestroyItem("bsicandl"))
EraseJournalEntry(@100035)
AddexperienceParty(100)
SetGlobal("bs_LacedonQuest","MYAREA",5)~ SOLVED_JOURNAL @100036 EXIT
END

IF ~~ THEN portal
SAY @249 /* That is wonderful news, thank you! We'll keep an eye open for it, then. Who would have thought we can leave this island without having to go on a ship and risking Umberlee's wrath again! */
IF ~~ THEN EXIT
END

BEGIN bsilcdn3 //neutral Lacedon
IF ~GlobalLT("bs_LacedonQuest","MYAREA",3)~ THEN plea
SAY @250 /* Helpppp usss... */
IF ~~ THEN EXIT
END

IF ~GlobalGT("bs_LacedonQuest","MYAREA",2)
GlobalGT("bs_LacedonTransformation","LOCALS",0)~ THEN thanks
SAY @244 /* Thank you for freeing us. */
IF ~~ THEN EXIT
END

/* dialogue of helper cres, used for door riddle in bs0101 and dripping water in bs0103 */
BEGIN bsihidor
/*Door Riddle in bs0101 */
IF ~AreaCheck("bs0101")
Global("bs_SolvedDoorRiddle","MYAREA",1)~ THEN riddle
SAY @251 /* You notice that several outlines of sea creatures have been carved into the wall. It seems the torch handle can be moved towards each of these pictures. */
++ @252 /* You try to move the handle. */ + riddle_01
++ @253 /* You leave the riddle alone. */ DO ~SetGlobal("bs_SolvedDoorRiddle","MYAREA",0)
SetGlobal("bs_i_HiddenDoorOpened","GLOBAL",1)
ActionOverride("bsihidor",DestroySelf())~ EXIT
END

IF ~~ THEN riddle_01
SAY @254 /* Choose which sea creature's picture you want to move the torch handle to. */
++ @255 /* Turtle. */ + riddle_01_interim
++ @256 /* Swordfish. */ + riddle_01_interim
++ @257 /* Jellyfish. */ + riddle_01_interim
++ @258 /* Kraken. */ + riddle_01_interim
++ @259 /* Octopus. */ DO ~IncrementGlobal("bs_SolvedDoorRiddle","MYAREA",1)~ + riddle_01_interim
++ @260 /* Sahuagin. */ + riddle_01_interim
++ @261 /* Ray. */ + riddle_01_interim
++ @262 /* Whale. */ + riddle_01_interim
++ @263 /* Sea Horse. */ + riddle_01_interim
++ @253 /* You leave the riddle alone. */ DO ~SetGlobal("bs_SolvedDoorRiddle","MYAREA",0)
SetGlobal("bs_i_HiddenDoorOpened","GLOBAL",1)
ActionOverride("bsihidor",DestroySelf())~ EXIT
END

IF ~~ THEN riddle_01_interim
SAY @264 /* The handle stays at the position. */
IF ~~ THEN + riddle_02
END

IF ~~ THEN riddle_02
SAY @265 /* Choose which sea creature's picture you want to move the torch handle to now. */
++ @255 /* Turtle. */  DO ~IncrementGlobal("bs_SolvedDoorRiddle","MYAREA",1)~ + riddle_02_interim
++ @256 /* Swordfish. */ + riddle_02_interim
++ @257 /* Jellyfish. */ + riddle_02_interim
++ @258 /* Kraken. */ + riddle_02_interim
++ @259 /* Octopus. */ + riddle_02_interim
++ @260 /* Sahuagin. */ + riddle_02_interim
++ @261 /* Ray. */ + riddle_02_interim
++ @262 /* Whale. */ + riddle_02_interim
++ @263 /* Sea Horse. */ + riddle_02_interim
++ @253 /* You leave the riddle alone. */ DO ~SetGlobal("bs_SolvedDoorRiddle","MYAREA",0)
SetGlobal("bs_i_HiddenDoorOpened","GLOBAL",1)
ActionOverride("bsihidor",DestroySelf())~ EXIT
END

IF ~~ THEN riddle_02_interim
SAY @264 /* The handle stays at the position. */
IF ~~ THEN + riddle_03
END

IF ~~ THEN riddle_03
SAY @265 /* Choose which sea creature's picture you want to move the torch handle to now. */
++ @255 /* Turtle. */ + riddle_04
++ @256 /* Swordfish. */  DO ~IncrementGlobal("bs_SolvedDoorRiddle","MYAREA",1)~ + riddle_04
++ @257 /* Jellyfish. */ + riddle_04
++ @258 /* Kraken. */ + riddle_04
++ @259 /* Octopus. */ + riddle_04
++ @260 /* Sahuagin. */ + riddle_04
++ @261 /* Ray. */ + riddle_04
++ @262 /* Whale. */ + riddle_04
++ @263 /* Sea Horse. */ + riddle_04
++ @253 /* You leave the riddle alone. */ DO ~SetGlobal("bs_SolvedDoorRiddle","MYAREA",0)
SetGlobal("bs_i_HiddenDoorOpened","GLOBAL",1)
ActionOverride("bsihidor",DestroySelf())~ EXIT
END

IF ~~ THEN riddle_04
SAY @266 /* The handle returns to its original position. */
= @267 /* You hear a series of clicks. */
IF ~GlobalLT("bs_SolvedDoorRiddle","MYAREA",4)~ THEN + riddle_05
IF ~Global("bs_SolvedDoorRiddle","MYAREA",4)~ THEN + riddle_06
END

IF ~~ THEN riddle_05
SAY @268 /* The clicks sound as if something is returning to its original state, until everything is silent again. */
IF ~~ THEN DO ~SetGlobal("bs_SolvedDoorRiddle","MYAREA",0)
SetGlobal("bs_i_HiddenDoorOpened","GLOBAL",1)
ActionOverride("bsihidor",DestroySelf())~ EXIT
END

IF ~~ THEN riddle_06
SAY @269 /* A mechanism has been set in motion. */
IF ~~ THEN DO ~SetGlobal("bs_SolvedDoorRiddle","MYAREA",5)
SetGlobal("bs_i_HiddenDoorOpened","GLOBAL",3)
ActionOverride("bsihidor",DestroySelf())~ EXIT
END

/* dripping water in bs0103 */
BEGIN bsidrips
IF ~AreaCheck("bs0103")
Global("bs_CollectDrippingWater","MYAREA",1)~ THEN watercollect
SAY @270 /* Water drops from the ceiling, forming stalactites over the years. The water tastes a bit stale, yet fresh enough to be drinkable. With some patience, you could collect a small bottle of it. */
++ @271 /* You hold a small bottle under the dripping water, waiting until it is full. */ DO ~SetGlobal("bs_CollectDrippingWater","MYAREA",2) ClearAllActions() StartCutSceneMode() StartCutScene("bscut007")~ EXIT
++ @272 /* You leave the dripping water alone. */ DO ~SetGlobal("bs_CollectDrippingWater","MYAREA",0)
ActionOverride("bsidrips",DestroySelf())~ EXIT
END

IF ~AreaCheck("bs0103")
Global("bs_CollectDrippingWater","MYAREA",2)~ THEN watercollect_01
SAY @273 /* You stow away the bottle with water. */
IF ~~ THEN + watercollect_02
END

IF ~~ THEN watercollect_02
SAY @274 /* With some more patience, you could collect another small bottle of water. */
COPY_TRANS_LATE bsidrips watercollect
END

/* Castaways in bs0102 */

/* guard. Has key for outer door (bsislkey) */
BEGIN bsicst01
IF ~!HasItem("bsislkey",Myself)
GlobalLT("bs_OpenDoorQuest","MYAREA",3)
Global("bs_NoKey","MYAREA",0)~ THEN notices
SAY @275 /* Ah, you're a real smart one, yes? Stealing the key. Well, you better behave yourself, because I am watching you! */
IF ~~ THEN DO ~SetGlobal("bs_NoKey","MYAREA",1)~ EXIT
END

CHAIN
IF ~Global("bs_OpenDoorQuest","MYAREA",0)~ THEN bsicst01 castaway_guard
@276 /* New faces? Well, Hegomee is right, you do look like you can defend yourself. The door is closed to normal folks, but if you bring me 10 arrows, I'll open it for you if you wish. */
== bsicst01 IF ~Global("bs_SahuaginThreatGone","GLOBAL",0)~ THEN @277 /* And be careful around the prisoner. He's a sly fox and restrained for a reason, I tell you. */
END
IF ~~ THEN DO ~SetGlobal("bs_OpenDoorQuest","MYAREA",1)~ EXIT

APPEND bsicst01
IF ~Global("bs_MotherhasCloth","MYAREA",4)~ THEN mother_happy
SAY @278 /* You did a good deed there. I never saw the mother that happy. She's still trapped in her own mind, but at least she is happy. Thank you. */
IF ~~ THEN DO ~SetGlobal("bs_MotherhasCloth","MYAREA",5)~ EXIT
END

IF ~GlobalGT("bs_OpenDoorQuest","MYAREA",0)~ THEN castaway_guard_01
SAY @279 /* I'm watching you, so be aware. */
+ ~NumItemsPartyGT("AROW01",9)
Global("bs_OpenDoorQuest","MYAREA",1)~ + @280 /* Here are your 10 arrows. */ + open_door01
+ ~Global("bs_SahuaginThreatGone","GLOBAL",0)
InMyArea("bsicst02")
!Dead("bsicst02")
Global("bs_prisoner","LOCALS",0)~ + @281 /* What is it with the prisoner? */ DO ~SetGlobal("bs_prisoner","LOCALS",1)~ + prisoner
+ ~Global("bs_mother","LOCALS",0)~ + @282 /* What's with that woman over there? */ DO ~SetGlobal("bs_mother","LOCALS",1)~ + mother
++ @283 /* I'm not here to make trouble. */ + bye
+ ~Global("bs_SahuaginThreatGone","GLOBAL",0)
InMyArea("bsicst02")
!Dead("bsicst02")
GlobalGT("bs_SpokeToRebelCastaway","GLOBAL",0)~ + @284 /* You know what - I actually like Fomthard's ideas. Bad luck for you, it seems. */ + attack
END

IF ~~ THEN open_door01
SAY @285 /* Great. Just a moment - */
IF ~~ THEN DO ~SetGlobal("bs_OpenDoorQuest","MYAREA",2)~ EXIT
END

IF ~~ THEN prisoner
SAY @286 /* For one, he tried to kill Hegomee. And also, he's a sick bastard who wants to make peace with the Sahuagin by feeding some of us off to them! Keep your distance, it's not worth listening to his babble. */
IF ~~ THEN + castaway_guard_01
END

IF ~~ THEN mother
SAY @287 /* That's a sad story. She and others were chased by Sahuagin, barely made it away, and among the ones who weren't so lucky was her young son, and we know that he is dead by now. She lost her mind due to the shock. There is nothing we can do for her than comfort and listen. */
IF ~~ THEN DO ~SetGlobal("bs_KnowsAboutSahuaginVictim","GLOBAL",1)~ + castaway_guard_01
END

IF ~~ THEN bye
SAY @288 /* That better be true. */
IF ~~ THEN EXIT
END

IF ~~ THEN attack
SAY @289 /* Damn - you can't be serious! */
IF ~~ THEN DO ~ActionOverride("bsicst01",Enemy())~ EXIT
END
END //APPEND

/* Fomthard, prisoner, rebel leader */
BEGIN bsicst02

IF ~Global("bs_SahuaginThreatGone","GLOBAL",1)
Global("bs_ChangeOfLeadership","GLOBAL",0)~ THEN solved
SAY @290 /* You made the Sahuagin leave, or so I heard. Well done! Guess I don't need any more ambition to become the leader of this sad group of people, then. The guard still looks at me suspiciously, but I'm a free man again, thanks to you. */
IF ~~ THEN DO ~SetGlobal("bs_ChangeOfLeadership","GLOBAL",15)~ SOLVED_JOURNAL @100029 + gone
END

IF ~Global("bs_ChangeOfLeadership","GLOBAL",0)
Global("bs_SpokeToRebelCastaway","GLOBAL",0)~ THEN rebel_castaway
SAY @291 /* Fresh blood! Not literally - no worries, *you*'d be the last I'd send to the Sahuagins. Greetings, Fomthard's my name. Yes, I'm a prisoner to our uppity "leader" Hegomee, who makes us hide and starve and tells us that we are "safe" this way. When was the last time any of us had a good meal - heck, could drench our thirst with a good sip of *water*? Not everyone agrees to Hegomee, have a look around and listen to the people! But I won't get free unless that guard is gone. If you kill him for me, I'll take over this hide out and reward you for it. */
IF ~~ THEN DO ~SetGlobal("bs_SpokeToRebelCastaway","GLOBAL",1)~ UNSOLVED_JOURNAL @100024 EXIT
END

IF ~Global("bs_ChangeOfLeadership","GLOBAL",0)
GlobalGT("bs_SpokeToRebelCastaway","GLOBAL",0)~ THEN rebel_castaway_01
SAY @292 /* So, what'dya think? */
+ ~Global("bs_02","LOCALS",0)~ + @293 /* You want to make a deal with the Sahuagin by offering them people? */ DO ~SetGlobal("bs_02","LOCALS",1)~ + rebel_castaway_02
+ ~Global("bs_02","LOCALS",0)
Global("bs_03","LOCALS",0)~ + @294 /* I think you are a sick bastard. */ DO ~SetGlobal("bs_02","LOCALS",2)~ + rebel_castaway_02
+ ~Global("bs_02","LOCALS",1)
Global("bs_03","LOCALS",0)~ + @294 /* I think you are a sick bastard. */ DO ~SetGlobal("bs_02","LOCALS",3)~ + rebel_castaway_06
+ ~Global("bs_02","LOCALS",2)
Global("bs_03","LOCALS",0)~ + @295 /* I still think you are a sick bastard. */ DO ~SetGlobal("bs_02","LOCALS",3)~ + rebel_castaway_06
+ ~Global("bs_03","LOCALS",0)~ + @296 /* I'm considering helping you. */ DO ~SetGlobal("bs_03","LOCALS",1)~ + rebel_castaway_03
+ ~Global("bs_03","LOCALS",0)~ + @297 /* I think you are right where you belong and should stay there. */ + rebel_castaway_04
+ ~Global("bs_03","LOCALS",1)~ + @298 /* I need to go. */ + rebel_castaway_05
END

IF ~~ THEN rebel_castaway_02
SAY @299 /* Yes, my method might seem brutal, but look at them - look at that mother over there, broken by the loss of her child. She's nothing but a babbling mess, so what's the point in keeping her "safe"? She could follow her child - she would be better off, believe me, and *we* would profit by the Sahuagin leaving us alone for some time. You see what I mean? How is waiting here until we *all* starve seen as the less cruel option? */
IF ~~ THEN UNSOLVED_JOURNAL @100025 + rebel_castaway_01
END

IF ~~ THEN rebel_castaway_03
SAY @300 /* Isn't that music to my ears! I can take on Hegomee myself, but for that, the guard needs to go. You know what to do. */
IF ~~ THEN DO ~SetGlobal("bs_SpokeToRebelCastaway","GLOBAL",2)~ EXIT
END

IF ~~ THEN rebel_castaway_04
SAY @301 /* Phhh, as if I'd go anywhere, being held here like this. */
IF ~~ THEN EXIT
END

IF ~~ THEN rebel_castaway_05
SAY @302 /* Don't forget - the guard! You need to kill him to set me free. */
IF ~~ THEN EXIT
END

IF ~~ THEN rebel_castaway_06
SAY @303 /* Ha! You have spine, I like you. You'll see that my method is more efficient in the end, you just wait. */
IF ~~ THEN EXIT
END

IF ~Global("bs_ChangeOfLeadership","GLOBAL",1)~ THEN change
SAY @304 /* You killed the guard! */
/* Hegomee is still alive and situation is not safe */
IF ~!Dead("bsicst04")
Global("bs_SahuaginThreatGone","GLOBAL",0)~ THEN + change_01
/* Hegomee is still alive but situation is already safe */
IF ~!Dead("bsicst04")
Global("bs_SahuaginThreatGone","GLOBAL",1)~ THEN + change_02
/* Hegomee is dead and situation is not safe */
IF ~Dead("bsicst04")
Global("bs_SahuaginThreatGone","GLOBAL",0)~ THEN + change_03
/* Hegomee is dead and situation is already safe */
IF ~Dead("bsicst04")
Global("bs_SahuaginThreatGone","GLOBAL",1)~ THEN + change_04
END

/* Hegomee is still alive and situation is not safe */
IF ~~ THEN change_01
SAY @305 /* Time for a change around here, I guess. Watch me taking that idiot Hegomee down! */
IF ~~ THEN DO ~SetGlobal("bs_ChangeOfLeadership","GLOBAL",2)~ UNSOLVED_JOURNAL @100026 EXIT
END

/* Hegomee is still alive but situation is already safe */
IF ~~ THEN change_02
SAY @306 /* What for, you idiot? I was as good as free already - Hegomee stands to his word. Ugh, I have nothing to do with this. */
IF ~~ THEN DO ~SetGlobal("bs_ChangeOfLeadership","GLOBAL",10)~ SOLVED_JOURNAL @100027 + gone
END

/* Hegomee is dead and situation is not safe */
IF WEIGHT #-1
~Global("bs_ChangeOfLeadership","GLOBAL",4)~ THEN change_03
SAY @307 /* With Hegomee dead, I guess that makes me the chief now, huh? */
IF ~~ THEN + new_leader
END

/* Hegomee is dead and situation is already safe */
IF ~~ THEN change_04
SAY @308 /* So, you killed them both - and for nothing, because I was as good as free already. You know what? Screw this. I'll make myself scarce. */
IF ~~ THEN DO ~SetGlobal("bs_ChangeOfLeadership","GLOBAL",17)~ SOLVED_JOURNAL @100027 + gone
END

IF ~~ THEN new_leader
SAY @309 /* Well, time for change in these parts. You - feel free to keep Hegomee's things. I think his sword wasn't all bad. It should be some compensation for your efforts. Everyone - I'll go and scout, and'll try to make some sort of contract with any Sahuagins left on this island. Don't make anything foolish while I'm away. */
IF ~~ THEN DO ~SetGlobal("bs_ChangeOfLeadership","GLOBAL",20)
EraseJournalEntry(@100024)
EraseJournalEntry(@100025)
EraseJournalEntry(@100026)
AddexperienceParty(250)~ SOLVED_JOURNAL @100028 EXIT
END

IF ~~ THEN gone
SAY @310 /* I'll go scouting then, I guess. See ya - or not! */
IF ~~ THEN DO ~EraseJournalEntry(@100024)
EraseJournalEntry(@100025)~ EXIT
END


/* Confused Mother (bs0102) */
BEGIN bsicst03
IF ~PartyHasItem("bsiwstcl")
GlobalLT("bs_MotherhasCloth","MYAREA",2)~ THEN waistcloth
SAY @311 /* Oh - that cloth - that was my baby's! It has to be! Surely he got it from my sister, she has three girls, you see. Yes, surely she gave it to him... It is what will keep him warm! */
IF ~~ THEN + waistcloth_00
END

IF ~Global("bs_MotherhasCloth","MYAREA",2)~ THEN waistcloth_00
SAY @312 /* Please, give me this cloth! */
+ ~PartyHasItem("bsiwstcl")~ + @313 /* This pink waistcloth? I found it on a... Never mind. Here, take it if it reminds you of your boy. */ + waistcloth_03
+ ~PartyHasItem("bsiwstcl")~ + @314 /* Sure, what do you give me for it, hmm? */ + waistcloth_01
+ ~PartyHasItem("bsiwstcl")~ + @315 /* Fingers off. I found it, it's mine. */ DO ~SetGlobal("bs_rejectedOnce","MYAREA",1)~ + waistcloth_02
+ ~!PartyHasItem("bsiwstcl")~ + @316 /* The pink cloth? I got rid of it somehwere. */ DO ~EraseJournalEntry(@100051)
SetGlobal("bs_MotherhasCloth","MYAREA",2)~ UNSOLVED_JOURNAL @100052 + waistcloth_00_a
++ @317 /* I'll think about it. */ DO ~EraseJournalEntry(@100051)
SetGlobal("bs_MotherhasCloth","MYAREA",2)~ UNSOLVED_JOURNAL @100052 + waistcloth_00_a
END

IF ~~ THEN waistcloth_00_a
SAY @318 /* Oh, my poor boy... */
IF ~~ THEN EXIT
END

IF ~~ THEN waistcloth_01
SAY @319 /* I-I-I don't have much. Only-only these 5 gold coins... */
++ @320 /* Fine, better than nothing. */ DO ~GiveGoldForce(5)~ + waistcloth_03
++ @321 /* Don't bother. Just take it. */ + waistcloth_03
+ ~Global("bs_rejectedOnce","MYAREA",0)~ + @315 /* Fingers off. I found it, it's mine. */ DO ~SetGlobal("bs_rejectedOnce","MYAREA",1)~ + waistcloth_02
+ ~Global("bs_rejectedOnce","MYAREA",1)~ + @322 /* Nah, that's not good enough. I'll keep it. */ + waistcloth_02_a
END

IF ~~ THEN waistcloth_02
SAY @323 /* No... no, please - I need this waistcloth. */
++ @324 /* And I said no. */ + waistcloth_02_a
+ ~PartyHasItem("bsiwstcl")~ + @314 /* Sure, what do you give me for it, hmm? */ + waistcloth_01
++ @317 /* I'll think about it. */ DO ~EraseJournalEntry(@100051)
SetGlobal("bs_MotherhasCloth","MYAREA",2)~ UNSOLVED_JOURNAL @100052 + waistcloth_00_a
END

IF ~Global("bs_MotherhasCloth","MYAREA",3)~ THEN waistcloth_02_a
SAY @325 /* My boy... (sob) */
IF ~~ THEN EXIT
IF ~GlobalLT("bs_MotherhasCloth","MYAREA",3)~ THEN DO ~EraseJournalEntry(@100051)
EraseJournalEntry(@100052)
EraseJournalEntry(@100071)
AddexperienceParty(100)
SetGlobal("bs_MotherhasCloth","MYAREA",3)~ SOLVED_JOURNAL @100054 EXIT
END

IF ~~ THEN waistcloth_03
SAY @326 /* Yes! Thank you, thank you! */
IF ~~ THEN DO ~ActionOverride("bsicst03",TakePartyItem("bsiwstcl"))
ActionOverride("bsicst03",DestroyItem("bsiwstcl"))
SetGlobal("bs_MotherhasCloth","MYAREA",4)
EraseJournalEntry(@100052)
EraseJournalEntry(@100071)
AddexperienceParty(100)
SetGlobal("bs_MotherhasCloth","MYAREA",4)~ SOLVED_JOURNAL @100053 EXIT
END

IF ~GlobalGT("bs_MotherhasCloth","MYAREA",3)~ THEN waistcloth_04
SAY @327 /* See, here is your cloth, my darling. I can cuddle you up now... Is it comfortable? My dear boy, you'll never be cold again... */
IF ~~ THEN EXIT
END

IF ~!PartyHasItem("bsiwstcl")
Global("bs_MotherhasCloth","MYAREA",0)~ THEN babbling
SAY @328 /* My baby... my poor baby... I lost him... I lost my baby. Have you seen him? A small boy with brown hair... such lovely brown hair... It's so cold here. */
IF ~~ THEN DO ~SetGlobal("bs_MotherhasCloth","MYAREA",1)~ UNSOLVED_JOURNAL @100051 + babbling_01
END

IF ~Global("bs_MotherhasCloth","MYAREA",1)~ THEN babbling_01
SAY @329 /* He must be so cold. I have to find him something warm... */
IF ~~ THEN EXIT
END


/* Castaways in bs0101 */
/* Hegomee, leader of Castaways (bs0101) */
BEGIN bsicst04
IF ~Dead("bsicst01")
Global("bs_GuardDead","MYAREA",0)~ THEN guard_dead
SAY @330 /* You killed the guard - what was that for? I will let it slide, but make sure not to cause any more trouble! */
IF ~~ THEN DO ~SetGlobal("bs_GuardDead","MYAREA",1)~ EXIT
END

IF ~Global("bs_CastawayIntroSpeech","MYAREA",0)~ THEN leader
SAY @331 /* Lo and behold! New faces, and such capable ones at that. My name is Hegomee. You solved the door riddle, so you are welcome here - as long as you do not stir any commotion. Stay away from the prisoner downstairs, do not let anyone through those doors who doesn't have my approval, and we will be glad to have you. Tension is a bit high currently since we are trapped between Lacedons and Sahuagin to all sides, but we are confident that both threats will be over soon. Talk to me if you are not afraid to lend a hand. Otherwise, feel free to rest here as long as you want. */
IF ~~ THEN DO ~SetGlobal("bs_CastawayIntroSpeech","MYAREA",1)
ActionOverride("bsicst04",MoveToPointNoInterrupt([2782.2119]) ActionOverride("bsicst04",Face(6))~ EXIT
END

IF ~Global("bs_CastawayIntroSpeech","MYAREA",1)~ THEN questions
SAY @332 /* Is there anything you want to know? */
+ ~GlobalGT("bs_HermitQuests","GLOBAL",8)
Global("bs_KnowPortal","LOCALS",0)~ + @189 /* The old mage in the library said she'll open a portal to the shore in the near future. I figured that's interesting for you, too. */ DO ~SetGlobal("bs_KnowPortal","LOCALS",1)~ + portal
+ ~Global("bs_help","LOCALS",1)
Dead("bsisagr1")
Dead("bsisagb1")
Dead("bsisagp1")
Global("bs_sahuagin_island","LOCALS",0)
GlobalGT("bs_sahuagin_level","LOCALS",0)~ + @333 /* Actually, all Sahuagin are gone from this island, at least for now. */ DO ~SetGlobal("bs_sahuagin_island","LOCALS",1)~ + sahuagin_island
+ ~Global("bs_help","LOCALS",1)
OR(2) Dead("bsisagr1") GlobalGT("bs_RebelDeal","GLOBAL",2)
OR(2) Dead("bsisagp1") !InMyArea("bsisagp1")
Global("bs_sahuagin_level","LOCALS",0)~ + @190 /* The Sahuagin are gone from this level. They should not come back again. */ DO ~SetGlobal("bs_sahuagin_level","LOCALS",1) SetGlobal("bs_SahuaginThreatGone","GLOBAL",1) SetGlobal("bs_prisoner","LOCALS",2)~ + level_cleared_01
+ ~Global("bs_help","LOCALS",1)
GlobalGT("bs_LacedonQuest","MYAREA",2)
Global("bs_lacedon_gone","LOCALS",0)~ + @334 /* The Lacedons are redeemed. I can't speak for the people they turned into, but at least they are no brainless monsters any more. */ DO ~SetGlobal("bs_lacedon_gone","LOCALS",1)~ + level_cleared
+ ~Global("bs_help","LOCALS",1)
Dead("bsilcdn2")
NumDeadGT("bsilcdn1",1)
Global("bs_lacedon_gone","LOCALS",0)~ + @335 /* The Lacedons shouldn't be a problem any more. You should be able to reach the stairs again. */ DO ~SetGlobal("bs_lacedon_gone","LOCALS",1)~ + level_cleared
+ ~Global("bs_who","LOCALS",0)~ + @2 /* Who are you? */ DO ~SetGlobal("bs_who","LOCALS",1)~ + who
+ ~Global("bs_help","LOCALS",0)~ + @336 /* You meantioned lending a hand? */ DO ~SetGlobal("bs_help","LOCALS",1)~ + help
+ ~Global("bs_prisoner","LOCALS",0)~ + @337 /* What's up with the prisoner? */ DO ~SetGlobal("bs_prisoner","LOCALS",1)~ + prisoner
+ ~Global("bs_SahuaginThreatGone","GLOBAL",0)
OR(2) GlobalGT("bs_SpokeToRebelCastaway","GLOBAL",0)
    Global("bs_HegomeeRumor","MYAREA",1)
Global("bs_rumor","LOCALS",0)~ + @338 /* Rumor is you keep everyone locked in here, risking all of you to starve to death. */ DO ~SetGlobal("bs_rumor","LOCALS",1)~ + rumor
+ ~Global("bs_SahuaginThreatGone","GLOBAL",0)
OR(2) GlobalGT("bs_SpokeToRebelCastaway","GLOBAL",0)
    Global("bs_HegomeeRumor","MYAREA",1)
Global("bs_rumor","LOCALS",0)~ + @339 /* Your strategy is to sit out the danger outside? */ DO ~SetGlobal("bs_rumor","LOCALS",1)~ + rumor_01
+ ~GlobalGT("bs_SpokeToRebelCastaway","GLOBAL",0)
Global("bs_rebel_sympathy","LOCALS",0)
!Global("bs_sahuagin_island","LOCALS",1)
!GlobalGT("bs_sahuagin_level","LOCALS",0)
!Global("bs_lacedon_gone","LOCALS",1)~ + @340 /* You know what - I actually like Fomthard's ideas better than yours. */ DO ~SetGlobal("bs_rebel_sympathy","LOCALS",1)~ + rebel_sympathy
++ @341 /* I'll be going. */ + bye
END

IF ~~ THEN prisoner
SAY @342 /* Fomthard was a very valuable member of this community, but he is currently suffering from mild delusions. I can't let him harm anyone else, so he'll stay restrained for now. Best you keep your distance. */
IF ~~ THEN + questions
END

IF ~~ THEN portal
SAY @343 /* That-that is news I would never believed to hear, and so soon. Thank you for letting us know. This will save all of us. */
IF ~~ THEN + questions
END

IF ~~ THEN sahuagin_island
SAY @344 /* From the whole island? This is interesting news, although I doubt it will hold for long. They tend to come and go in the lower levels. We'll see. It is a great relieve for now, to be sure. */
IF ~~ THEN + questions
END

IF ~~ THEN who
SAY @345 /* If you mean the poor people here, we are all castaways who stranded on this island one way or the other. If you mean me, I am Hegomee, trained fighter from far north, and currently leader of these people in need. */
IF ~~ THEN + questions
END

IF ~~ THEN rumor
SAY @346 /* That... is not entirely untrue, although a rather malicious phrasing of my actual concern. */
IF ~~ THEN + rumor_01
END

IF ~~ THEN rumor_01
SAY @347 /* These people are no fighters. I alone am no match against neither Sahuagin nor Lacedons. The priest outside told me the Lacedons are cursed people who could be saved and that he is working on it, so I am confident that we will have access to the library and the Old Hermit again, soon. The Sahuagin on this level of the ruins came here not so long ago, it seems they have differences they need to sort out. Their actual dealings are further down, they also need to submerge into the water from time to time - I am convinced they will be off this level again soon, too. It is safest for us to wait this out, we are in no position to fight either party. Especially not with Fomthard going crazy like this. */
IF ~~ THEN + questions
END

IF ~~ THEN bye
SAY @348 /* May the gods be with you. */
IF ~~ THEN EXIT
END

IF ~~ THEN rebel_sympathy
SAY @349 /* What-what am I to conclude from your words? */
++ @350 /* Nothing, don't worry. I just think there's some truth to his plan, but I'm not going to interfere in your affairs. */ + rebel_sympathy_01
++ @351 /* You understood me. Draw your weapon! */ + rebel_sympathy_02
END

IF ~~ THEN rebel_sympathy_01
SAY @352 /* You are making the right choice. Stay away from Fomthard, he is a very gifted orator and has won many a person over with his honeyed words. These fools don't understand that they will be the first to be sacrificed! */
IF ~~ THEN EXIT
END

IF ~~ THEN rebel_sympathy_02
SAY @353 /* You are making a big mistake. Anyone coming to death here will be on your conscience! */
IF ~~ THEN DO ~ActionOverride("bsicst04",Enemy())~ EXIT
END

IF ~~ THEN level_cleared
SAY @354 /* Wonderful. Thank you for telling us. */
IF ~~ THEN + questions
END

IF ~~ THEN level_cleared_01
SAY @355 /* Great news! Hmm, this means there might be no need to hold Fomthard any longer. No Sahuagin threat means no way to go through with his mad plan. I'll consider letting him go. */
IF ~~ THEN DO ~AddexperienceParty(100)~ + questions
END


CHAIN
IF ~~ THEN bsicst04 help
@356 /* Our greatest concern is that we are locked in between Sahuagin and Lacedons. If there is anything you can do to help clear at least one path in this level of the ruins, you would free us from being imprisoned here. But, I do not expect you to solve this for us, although you could ask the priest in the chapel whether there is something you could do to help him redeem the Lacedons. That you are capable of walking around outside this hideout is already a great chance. Ask around if people are in need of something you could bring back to us. */
== bsicst04 IF ~Global("bs_WaterQuest","MYAREA",0)~ THEN @357 /* Especially our quartermaster. Please ask him whether he is missing something that could be found outside. */
== bsicst04 IF ~GlobalGT("bs_WaterQuest","MYAREA",1)~ THEN @358 /* I know you alread asked our quartermaster. Whatever he told you will be a great help to us. */
END
IF ~~ THEN + questions


/* Quartermaster */
BEGIN bsicst05
IF ~Global("bs_WaterQuest","MYAREA",0)~ THEN quartermaster
SAY @359 /* Welcome. I am the quartermaster, although this title is far too fancy for the tragedy I administer here. I see you can walk these ruins without being caught by Sahuagin or worse. If you come into the caves, there is a place where fresh water falls from the ceiling. We'd be in need of as much as you can carry, if I might be so bold to ask this of you. Going there is too dangerous for us. I am not referring to us being locked in by Sahuagin and Lacedons on this floor, I am confident this will be solved in the near future. I am talking about the bloody Malenti in those caves. They have a water hole where they are emerging. As long as that doesn't get closed, there will always be the danger of meeting Malenti when going there. Not that I'm sure it actually *can* be closed, I didn't exactly have a close look at it. */
IF ~~ THEN DO ~SetGlobal("bs_WaterQuest","MYAREA",1)
AddJournalEntry(@100009,QUEST)~ UNSOLVED_JOURNAL @100014 EXIT
END

IF ~Global("bs_CountWater","MYAREA",2)
GlobalGT("bs_ReceivedWater","MYAREA",9)
GlobalLT("bs_ReceivedWater","MYAREA",1000)~ THEN enough_water
SAY @360 /* And with that, I have my needed 10 bottles. Thank you so much. I'll still take any water you'll bring, but for now, we have enough so noone has to go thirsty. */
IF ~~ THEN DO ~SetGlobal("bs_ReceivedWater","MYAREA",1000)
SetGlobal("bs_CountWater","MYAREA",0)
SetGlobal("bs_WaterQuest","GLOBAL",3)
EraseJournalEntry(@100014)
EraseJournalEntry(@100016)
EraseJournalEntry(@100042)
AddexperienceParty(1000)~ SOLVED_JOURNAL @100017 EXIT
END

IF ~Global("bs_CountWater","MYAREA",2)~ THEN more_water
SAY @361 /* Wonderful. I'd take more, but this is already a great help. */
IF ~~ THEN DO ~SetGlobal("bs_CountWater","MYAREA",0)~ EXIT
END

IF ~PartyHasItem("bsdrwate")~ THEN brings_water
SAY @362 /* I see you bring water. Would this be for us? */
++ @363 /* Yes, please take all of them. */ + brings_water_01
++ @364 /* Let me think about that. */ + bye
END

IF ~~ THEN brings_water_01
SAY @365 /* Great! I'll buy every bottle for 5 gold coins, as a small compensation. */
IF ~~ THEN DO ~SetGlobal("bs_CountWater","MYAREA",1)~ EXIT
END

IF ~GlobalGT("bs_WaterQuest","MYAREA",0)~ THEN quartermaster_01
SAY @366 /* Is there anything I can do for you? */
+ ~GlobalLT("bs_ChangeOfLeadership","GLOBAL",20)
Global("bs_SahuaginThreatGone","GLOBAL",0)
OR(2) GlobalGT("bs_SpokeToRebelCastaway","GLOBAL",0)
    Global("bs_HegomeeRumor","MYAREA",1)
Global("bs_leader_dispute","LOCALS",0)~ + @367 /* What is your take with regard to the rivalry between your leader and the prisoner? */ DO ~SetGlobal("bs_leader_dispute","LOCALS",1)~ + leader_dispute
+ ~Global("bs_WaterholeIsBlocked","GLOBAL",1)~ + @368 /* The water hole where the Malenti were emerging is closed, at least for now. */ + waterhole_closed
+ ~GlobalLT("bs_WaterQuest","GLOBAL",2)~ + @369 /* How much water would you need? */ + water
+ ~Global("bs_shop","LOCALS",0)~ + @32 /* Do you have anything to spare? */ DO ~SetGlobal("bs_shop","LOCALS",1)~ + shop
+ ~Global("bs_shop","LOCALS",1)~ + @32 /* Do you have anything to spare? */ DO ~StartStore("bsicst05",LastTalkedToBy(Myself))~ EXIT
++ @341 /* I'll be going. */ + bye
END

IF ~~ THEN waterhole_closed
SAY @370 /* Wonderful news. As soon as the situation allows, we'll be able to collect water again. */
IF ~~ THEN DO ~SetGlobal("bs_WaterholeIsBlocked","GLOBAL",2)
EraseJournalEntry(@100009)
EraseJournalEntry(@100011)
EraseJournalEntry(@100012)
EraseJournalEntry(@100014)
EraseJournalEntry(@100016)
EraseJournalEntry(@100042)
AddexperienceParty(250)
AddJournalEntry(@100015,QUEST_DONE)~ SOLVED_JOURNAL @100010 EXIT
END

IF ~~ THEN shop
SAY @371 /* I do, actually. Everything except food. */
IF ~~ THEN DO ~StartStore("bsicst05",LastTalkedToBy(Myself))~ EXIT
END

IF ~~ THEN water
SAY @372 /* Well, all of us are thirsty. At least 10 bottles of water, I would say. */
++ @373 /* 10 bottles! I'll be covered in moss when I'll attempt to wait until all of them are full. */ DO ~SetGlobal("bs_WaterQuest","GLOBAL",2)~ UNSOLVED_JOURNAL @100016 + water_01
+ ~GlobalLT("bs_WaterholeIsBlocked","GLOBAL",2)~ + @374 /* I'll see what I can do. */ DO ~SetGlobal("bs_WaterQuest","GLOBAL",2)~ UNSOLVED_JOURNAL @100016 + water_02
+ ~Global("bs_WaterholeIsBlocked","GLOBAL",2)~ + @374 /* I'll see what I can do. */ DO ~SetGlobal("bs_WaterQuest","GLOBAL",2)~ UNSOLVED_JOURNAL @100016 + water_04
END

IF ~~ THEN water_01
SAY @375 /* I know it takes a long time to collect them from the dripping drops. */
IF ~GlobalLT("bs_WaterholeIsBlocked","GLOBAL",2)~ THEN + water_03
IF ~Global("bs_WaterholeIsBlocked","GLOBAL",2)~ THEN + water_04
END

IF ~~ THEN water_02
SAY @376 /* Much appreciated. */
IF ~~ THEN EXIT
END

IF ~~ THEN water_03
SAY @377 /* I'd go and do it, I wouldn't mind the wait. I do mind the monster threat, though. You might catch moss, but I'll probably get eaten while waiting for the bottles to fill. */
IF ~~ THEN EXIT
END

IF ~~ THEN water_04
SAY @378 /* You don't have to bother, you already did so much for us. I'll go and do it, I don't mind the wait. The threat of Malenti would have bothered me, however. You might have caught moss, but I would have been eaten while waiting for the bottles to be filled, most probably. */
IF ~~ THEN EXIT
END

IF ~~ THEN bye
SAY @379 /* Do that, do that. And come back again. Because it'll mean you'll be still alive. */
IF ~~ THEN EXIT
END

CHAIN
IF ~~ THEN bsicst05 leader_dispute
@380 /* I am with our leader Hegomee. That priest in the chapel is working on redeeming the Lacedons, and the Sahuagin will retreat down from where they came eventually. We are safe here. There is no need to endanger anyone. */
== bsicst05 IF ~GlobalLT("bs_ReceivedWater","MYAREA",1000)~ THEN @381 /* Water is really the only thing that is starting to run low, and even this is not yet life endangering. */
== bsicst05 IF ~GlobalGT("bs_ReceivedWater","MYAREA",999)~ THEN @382 /* Water was really the only thing that started to run low, and even this will last a good while longer now, thanks to your help. */
END
IF ~~ THEN + quartermaster_01

/* Castaways */
BEGIN bsicst08
BEGIN bsicst06

CHAIN
IF ~GlobalLT("bs_ChangeOfLeadership","GLOBAL",20) Global("bs_SahuaginThreatGone","GLOBAL",0)
Global("bs_FirstTimeTalkedTo","LOCALS",0)~ THEN bsicst06 castaway1
@383 /* Hegomee is just a coward, hiding behind the big doors! We are running out of food, are we not? He should go out there and look for provisions. Waiting for the Sahuagin to go away - and what if it takes too long? */
DO ~SetGlobal("bs_HegomeeRumor","MYAREA",1) SetGlobal("bs_FirstTimeTalkedTo","LOCALS",1)~
== bsicst08 IF ~See("bsicst08") !StateCheck("bsicst08",CD_STATE_NOTVALID)~ THEN @384 /* "He"? Do you expect him to go alone against the Sahuagin or the Lacedons? Hegomee is the only real fighter here, you know we can't leave Fomthard without a guard. Do you want to go out there with him? */
== bsicst06 @385 /* I'm just saying. Sitting here like ducks can't be the right thing to do, either. */
EXIT

APPEND bsicst06
%Add_Random_Castaway_Dialogue%
END //APPEND

BEGIN bsicst07 //
IF ~GlobalLT("bs_ChangeOfLeadership","GLOBAL",20) Global("bs_SahuaginThreatGone","GLOBAL",0)
Global("bs_FirstTimeTalkedTo","LOCALS",0)~ THEN castaway2
SAY @386 /* Oh, a new face! You look like you can take care of yourself. We could use more people with combat experience, that's for sure. Then maybe we'll get out of here again sooner than later. I am sure you already heard about Fomthard trying to kill Hegomee - *kill*, I tell you. Still - I know that noone wants to be the one being sacrificed to the Sahuagin - I don't, either! - but I see the wisdom in Fomthard's approach. There is no way of telling how long it will take until the Sahuagin will leave this level again, and we can't just wait until all of us are too weak to fight! */
IF ~~ THEN DO ~SetGlobal("bs_FirstTimeTalkedTo","LOCALS",1)~ EXIT
END

%Add_Random_Castaway_Dialogue%

APPEND bsicst08 //
IF ~GlobalLT("bs_ChangeOfLeadership","GLOBAL",20) Global("bs_SahuaginThreatGone","GLOBAL",0)
Global("bs_FirstTimeTalkedTo","LOCALS",0)~ THEN castaway3
SAY @387 /* Hello! Did you come here to help? You don't look like someone in need yourself, that is why I am asking. I would be so glad. I am so glad Hegomee is our leader, too. Sacrificing the weaker would be madness! I can't believe anyone would suggest such a thing. I can't believe we're even talking about this! */
IF ~~ THEN DO ~SetGlobal("bs_FirstTimeTalkedTo","LOCALS",1)~ EXIT
END

%Add_Random_Castaway_Dialogue%
END //APPEND

BEGIN bsicst09
IF ~GlobalLT("bs_ChangeOfLeadership","GLOBAL",20) Global("bs_SahuaginThreatGone","GLOBAL",0)
Global("bs_FirstTimeTalkedTo","LOCALS",0)~ THEN castaway4
SAY @388 /* Be careful who you trust. There are some people here who would no longer be alive if it weren't for Fomthard. Yes, Fomthard! He's the one who could sneak past the Lacedons and the Malenti and whatnot. The others aren't aware, but I noticed we are running out on stuff. What is Hegomee doing? Praying to his god and locking us in here to starve! It's logical we should listen to Fomthard, there is no way around his idea. */
IF ~~ THEN DO ~SetGlobal("bs_HegomeeRumor","MYAREA",1) SetGlobal("bs_FirstTimeTalkedTo","LOCALS",1)~ EXIT
END

%Add_Random_Castaway_Dialogue%

BEGIN bsicst10
IF ~Global("bs_DiddysDagger","MYAREA",0)
Global("bs_SahuaginThreatGone","GLOBAL",0)~ THEN diddy
SAY @389 /* You were outside, right? Did you find my dagger, I had to leave it in the dormitory. We needed to leave in such a hurry, I couldn't retrieve it from my hiding place! The dormitory is right outside to the left, you can't miss it, it's where all the bunk beds are in - mine was the second from the door. The dagger is hidden between two loose planks of the upper bed. */
IF ~~ THEN DO ~SetGlobal("bs_DiddysDagger","MYAREA",1)~ UNSOLVED_JOURNAL @100019 EXIT
END

IF ~Global("bs_DiddysDagger","MYAREA",0)
Global("bs_SahuaginThreatGone","GLOBAL",1)~ THEN late_quest
SAY @390 /* You were outside earlier, right? Did you find my dagger by any chance, I had to leave it in the dormitory. We needed to leave in such a hurry, I couldn't retrieve it from my hiding place! The dormitory is right outside to the left, you can't miss it, it's where all the bunk beds are in - mine was the second from the door. The dagger is hidden between two loose planks of the upper bed. Did you take it by any chance? I can't find it any more. */
IF ~~ THEN + no_dagger_05
IF ~See("bsicst07") !StateCheck("bsicst07",CD_STATE_NOTVALID)~ THEN EXTERN bsicst07 no_dagger_00_chain
END

IF ~GlobalGT("bs_DiddysDagger","MYAREA",0)
GlobalLT("bs_DiddysDagger","MYAREA",3)~ THEN diddy_01
SAY @391 /* You didn't find my dagger, by any chance? */
+ ~Global("bs_DiddysDagger","MYAREA",2)~ + @392 /* We looked, actually. There was no dagger, though. */ + no_dagger
+ ~Global("bs_DiddysDagger","MYAREA",2)~ + @393 /* Listen, lady. I searched where you told me, but there was nothing there! */ + no_dagger
+ ~GlobalLT("bs_DiddysDagger","MYAREA",2)~ + @394 /* Are you sure the dagger is in the hiding place? I am reluctant to walk there just to find nothing. */ + diddy_04
+ ~Global("bs_reward","LOCALS",0)~ + @395 /* If I bring you the dagger, what do I get? */ DO ~SetGlobal("bs_reward","LOCALS",1)~ + reward
+ ~GlobalLT("bs_DiddysDagger","MYAREA",2)
Global("bs_errand","LOCALS",0)~ + @396 /* Do I look like an errand <PRO_GIRLBOY> to you? */ DO ~SetGlobal("bs_errand","LOCALS",1)~ + diddy_02
+ ~Global("bs_sqee","LOCALS",0)~ + @397 /* I am on it. */ DO ~SetGlobal("bs_sqee","LOCALS",1)~ + diddy_06
+ ~Global("bs_sqee","LOCALS",1)~ + @397 /* I am on it. */ + diddy_05
+ ~GlobalLT("bs_DiddysDagger","MYAREA",2)~ + @317 /* I'll think about it. */ + diddy_05
++ @398 /* See you later. */ + bye
END

IF ~~ THEN diddy_02
SAY @399 /* N-No? But like someone who can watch out for themselves, someone strong who is not afraid to walk outside next to whatever monsters are waiting, someone who has enough weapons so they would have no need for one lousy dagger. */
++ @400 /* Flattery? Alright, it's working. I'll look for your dagger. */ + diddy_05
++ @401 /* So you noticed I *don't* look like an errand <PRO_GIRLBOY>. */ + diddy_03
+ ~Global("bs_reward","LOCALS",0)~ + @395 /* If I bring you the dagger, what do I get? */ DO ~SetGlobal("bs_reward","LOCALS",1)~ + reward
++ @317 /* I'll think about it. */ + diddy_05
END

IF ~~ THEN diddy_03
SAY @402 /* It's just - in case you'll be searching our dormitory anyway, I'm sure you'll have no need for one small dagger - but to me, it's the world. */
IF ~~ THEN EXIT
END

IF ~~ THEN diddy_04
SAY @403 /* Ab-so-lutely. Unless I am having dementia and noone told me. */
++ @404 /* I am serious. You better not make me go through your used bed cloths for nothing. */ + no_dagger_00
+ ~Global("bs_reward","LOCALS",0)~ + @395 /* If I bring you the dagger, what do I get? */ DO ~SetGlobal("bs_reward","LOCALS",1)~ + reward
+ ~Global("bs_errand","LOCALS",0)~ + @396 /* Do I look like an errand <PRO_GIRLBOY> to you? */ DO ~SetGlobal("bs_errand","LOCALS",1)~ + diddy_02
++ @398 /* See you later. */ + bye
END

IF ~~ THEN diddy_05
SAY @405 /* Thank you! */
IF ~~ THEN EXIT
END

IF ~~ THEN diddy_06
SAY @406 /* That means you'll look for my dagger? */
IF ~~ THEN + diddy_05
END

IF ~~ THEN reward
SAY @407 /* Er, I have a healing potion?... */
++ @408 /* Ah, don't bother. I'll just get you your dagger. */ DO ~SetGlobal("bs_PromisedReward","MYAREA",-1)~ + diddy_05
++ @409 /* Then take good care of it. It is mine. */ DO ~SetGlobal("bs_sqee","LOCALS",1)
SetGlobal("bs_PromisedReward","MYAREA",1)~ + diddy_06
++ @410 /* I can't be bothered with this. */ + diddy_03
END

IF ~~ THEN bye
SAY @411 /* I hope so! */
IF ~~ THEN EXIT
END

IF ~~ THEN no_dagger
SAY @412 /* No? But... Did you search the planks? */
IF ~~ THEN + no_dagger_00
END

IF ~~ THEN no_dagger_00
SAY @413 /* I definitely left it there. I left my dagger between the loose planks of my bed. I swear to the gods up and below! */
IF ~~ THEN + no_dagger_05
IF ~See("bsicst07") !StateCheck("bsicst07",CD_STATE_NOTVALID)~ THEN EXTERN bsicst07 no_dagger_00_chain
END

CHAIN
IF ~~ THEN bsicst07 no_dagger_00_chain
@414 /* Is it about your dagger? Your dagger is no longer there. I have it. */
== bsicst10 IF ~See("bsicst07") !StateCheck("bsicst07",CD_STATE_NOTVALID)~ THEN @415 /* Y-*You* took my dagger? Why didn't you say so earlier! Please give it - */
== bsicst07 IF ~See("bsicst07") !StateCheck("bsicst07",CD_STATE_NOTVALID)~ THEN @416 /* It's mine now. Rule is, if someone loses something and someone else finds it, it belongs to the finder. */
== bsicst10 IF ~See("bsicst07") !StateCheck("bsicst07",CD_STATE_NOTVALID)~ THEN @417 /* But I didn't lose my dagger! It was stashed in my hiding place! */
== bsicst07 IF ~See("bsicst07") !StateCheck("bsicst07",CD_STATE_NOTVALID)~ THEN @418 /* Could you retrieve it yourself? No. You hired someone else to do it. So it was lost to you. */
== bsicst10 IF ~See("bsicst07") !StateCheck("bsicst07",CD_STATE_NOTVALID)~ THEN @419 /* But-but... Ugh, I can't believe this. You're not giving it back, are you? */
== bsicst07 IF ~See("bsicst07") !StateCheck("bsicst07",CD_STATE_NOTVALID)~ THEN @420 /* Nope. */
== bsicst10 IF ~See("bsicst07") !StateCheck("bsicst07",CD_STATE_NOTVALID)~ THEN @421 /* And when were you planning on telling me? */
== bsicst07 IF ~See("bsicst07") !StateCheck("bsicst07",CD_STATE_NOTVALID)~ THEN @422 /* Told you now. */
== bsicst10 IF ~See("bsicst07") !StateCheck("bsicst07",CD_STATE_NOTVALID)~ THEN @423 /* Well, isn't this fantastic. */
END
IF ~~ THEN EXTERN bsicst10 no_dagger_01
IF ~See("bsicst07") !StateCheck("bsicst07",CD_STATE_NOTVALID)~ THEN EXTERN bsicst10 no_dagger_02


APPEND bsicst10
IF ~~ THEN no_dagger_01
SAY @424 /* But... If you say it's no longer there... */
IF ~~ THEN + no_dagger_02
END

IF ~~ THEN no_dagger_02
SAY @425 /* I am very sorry. It seems I asked you to retrieve my dagger for naught. (sigh) */
IF ~~ THEN + no_dagger_05
IF ~Global("bs_DiddysDagger","MYAREA",2)~ THEN + no_dagger_03
END

IF ~~ THEN no_dagger_03
SAY @426 /* Well, since you didn't bring me my dagger, it's only fair that I won't give you a reward... right? */
++ @427 /* Keep what little you have left, I don't need your trinkets. */ + no_dagger_04_b
+ ~Global("bs_PromisedReward","MYAREA",-1)~ + @428 /* Of course. I already said so. */ + no_dagger_04
+ ~Global("bs_PromisedReward","MYAREA",1)~ + @429 /* Excuse me? We've already talked about it. You can't wriggle out of it now just because it didn't go the way you wanted. */ DO ~SetGlobal("bs_PromisedReward","MYAREA",2)~ + no_dagger_04
++ @430 /* I went out there for you and searched where you were pointing me. Hand it over. */ DO ~SetGlobal("bs_PromisedReward","MYAREA",2)~ + no_dagger_04
END
END //APPEND

CHAIN
IF ~~ THEN bsicst10 no_dagger_04
@431 /* Eeep! Alright, alright! Here it is, one healing potion. It's really all I got. */
DO ~GiveItem("potn08",LastTalkedToBy(Myself))~
== bsicst07 IF ~See("bsicst07") !StateCheck("bsicst07",CD_STATE_NOTVALID)~ THEN @432 /* Bwahaha, you just lost a potion way more valuable than a dagger. You could've traded it for a *short sword* with our quartermaster! */
== bsicst10 IF ~See("bsicst07") !StateCheck("bsicst07",CD_STATE_NOTVALID)~ THEN @433 /* I wasn't *aware* I'm not getting my dagger back, you bumbling idiot! */
END
IF ~~ THEN + no_dagger_05

APPEND bsicst10
IF ~~ THEN no_dagger_04_b
SAY @434 /* Thank you. Thank you so much. */
IF ~~ THEN + no_dagger_05
END

IF ~~ THEN no_dagger_05
SAY @435 /* Well, that's me then, I guess. Poorer on possessions, but *so* much richer on experiences! Ugh... */
+ ~See("bsicst07") !StateCheck("bsicst07",CD_STATE_NOTVALID)~ + @436 /* We're not done here. Hey, pal - hand back her dagger to her. It is hers, and you know it well! */ DO ~SetGlobal("bs_DiddysDagger","MYAREA",5)~ EXTERN bsicst07 hand_back_dagger
+ ~See("bsicst07") !StateCheck("bsicst07",CD_STATE_NOTVALID)~ + @437 /* Well, Mr. I-Have-Your-Dagger-Now has a point, I'm afraid. Nothing I can do there. */ + no_dagger_09
++ @438 /* I'm sorry it went that way for you, but I don't see it as my responsibility to do anything more. */ + no_dagger_09
+ ~See("bsicst07") !StateCheck("bsicst07",CD_STATE_NOTVALID)~ + @439 /* Chin up! Forget about that idiot. Here is a gold coin, this should be enough for a dagger from your quartermaster. */ DO ~ActionOverride("bsicst10",TakePartyGold(1))~ + no_dagger_08
+ ~OR(2) !See("bsicst07") StateCheck("bsicst07",CD_STATE_NOTVALID)~ + @440 /* Chin up! Here is a gold coin, this should be enough for a dagger from your quartermaster. */ + no_dagger_08
+ ~Global("bs_SahuaginThreatGone","GLOBAL",0)~ + @441 /* Yep, making experiences is especially important if you are a castaway on a secluded island. Glad I could be of service. */ + no_dagger_06
END
END //APPEND

APPEND bsicst07
IF ~~ THEN hand_back_dagger
SAY @442 /* But... I... Well... Ugh, here it is. Happy now? */
IF ~~ THEN DO ~ActionOverride("bsicst07",GiveItem("dagg01","bsicst10"))~ EXTERN bsicst10 no_dagger_08
END
END //APPEND

APPEND bsicst10
IF ~~ THEN no_dagger_06
SAY @443 /* Th-That's *sarcasm*! How can you make fun of me in such a dire situation!... */
IF ~~ THEN DO ~SetGlobal("bs_DiddysDagger","MYAREA",3)
TriggerActivation("bs0101tA",FALSE)
EraseJournalEntry(@100019)
EraseJournalEntry(@100020)
AddexperienceParty(100)~ SOLVED_JOURNAL @100022 + no_dagger_07
IF ~Global("bs_PromisedReward","MYAREA",2)~ THEN DO ~ReputationInc(-1)
SetGlobal("bs_DiddysDagger","MYAREA",3)
TriggerActivation("bs0101tA",FALSE)
EraseJournalEntry(@100019)
EraseJournalEntry(@100020)
AddexperienceParty(100)~ SOLVED_JOURNAL @100022 + no_dagger_07
END

IF ~Global("bs_DiddysDagger","MYAREA",3)~ THEN no_dagger_07
SAY @444 /* Leave me alone! All of you, leave me alone! */
IF ~~ THEN EXIT
END

IF ~~ THEN no_dagger_08
SAY @445 /* You... Oh, you're incredible! Thank you! Thank you so much. */
IF ~~ THEN + no_dagger_10
IF ~GlobalLT("bs_DiddysDagger","MYAREA",5)~ THEN + no_dagger_12
END

IF ~~ THEN no_dagger_09
SAY @446 /* (sigh) I was afraid you'd say that. */
IF ~~ THEN DO ~SetGlobal("bs_DiddysDagger","MYAREA",4)
TriggerActivation("bs0101tA",FALSE)
EraseJournalEntry(@100019)
EraseJournalEntry(@100020)
AddexperienceParty(100)~ SOLVED_JOURNAL @100022 + no_dagger_11
END

IF ~GlobalGT("bs_DiddysDagger","MYAREA",4)~ THEN no_dagger_10
SAY @447 /* I'll treasure this dagger better, I promise! I will never leave it lying around again. */
IF ~Global("bs_DiddysDagger","MYAREA",7)~ THEN EXIT
IF ~GlobalLT("bs_DiddysDagger","MYAREA",7)~ THEN DO ~TriggerActivation("bs0101tA",FALSE)
EraseJournalEntry(@100019)
EraseJournalEntry(@100020)
AddexperienceParty(100)
SetGlobal("bs_DiddysDagger","MYAREA",7)~ SOLVED_JOURNAL @100021 EXIT
END

IF ~Global("bs_DiddysDagger","MYAREA",4)~ THEN no_dagger_11
SAY @448 /* Thank you for trying, I guess. */
IF ~~ THEN EXIT
END

IF ~~ THEN no_dagger_12
SAY @449 /* I'll go and get a new one right now! */
IF ~~ THEN DO ~SetGlobal("bs_DiddysDagger","MYAREA",6) ClearAllActions() StartCutSceneMode() StartCutScene("bscut002")~ EXIT
END

END //APPEND

/* Fragmented Apparition */
/* ghost form */
BEGIN bsiphtm1
IF ~Global("bs_ApparitionsMerge","MYAREA",0)~ THEN apparition
SAY @450 /* The ghostly apparition seems to be looking for something, but at the same time doesn't seem to notice anything other than the bright brazier in front of it. */
IF ~~ THEN DO ~FaceObject("Brazier05")~ EXIT
END

IF ~Global("bs_ApparitionsMerge","MYAREA",1)~ THEN freed
SAY @451 /* You... freeeed me. Thank you. */
IF ~~ THEN DO ~SetGlobal("bs_ApparitionsMerge","MYAREA",2)~ EXIT
END

BEGIN bsiphtm2
IF ~Global("bs_ApparitionsMerge","MYAREA",0)~ THEN apparition2
SAY @452 /* Like the other one at the entrance of the crypt, the ghostly apparition doesn't seem to notice anything other than the bright brazier in front of it. */
IF ~~ THEN DO ~FaceObject("Brazier02")~ EXIT
END

/* gaseous form */
BEGIN bsiphtg1
IF ~True()~ THEN mist_form
SAY @453 /* In this misty form, the apparition does not seem to react at all. */
IF ~~ THEN EXIT
END


/* Add cross reference to Balduran's fate to Dradeel */
/*
Global("bs_BalduransItems","GLOBAL",1)
*/
EXTEND_BOTTOM dradee 22
+ ~Global("bs_BalduransItems","GLOBAL",1)~ + @454 /* Did Balduran still have his personal belongings when you got separated? I was on another secluded island and found some of Balduran's items there. */ + bst_reference
+ ~Global("bs_BalduransItems","GLOBAL",2)~ + @455 /* Did Balduran still have his boots - and his silver fork? Those where on another secluded island. I wonder whether he got there before or after his ship stranded here. */ + bst_reference_01
END

APPEND dradee
IF ~~ THEN bst_reference
SAY @456 /* His possessions? Well, I'd figure he took as much as he could and run... somewhere... */
IF ~~ THEN + bst_reference_02
END

IF ~~ THEN bst_reference_01
SAY @457 /* Did he still have his boots? What do you think, someone running away *without* their boots? - Well, of course that can happen if you are surprised by such an attack. I can tell you the last time I saw him, he still had his boots on. Not that I'd remember what they looked like. Regarding his silver fork I don't know. I haven't found it anywhere around here, that's for sure. It would have enabled me to dine with a little more dignity all these years. */
IF ~~ THEN + bst_reference_02
END

IF ~~ THEN bst_reference_02
SAY @458 /* Young <PRO_MANWOMAN>, I spent centuries on this island since, but didn't see a trace of Balduran or his possessions. I can't even get to mine, as it is. I really could use the help. */
COPY_TRANS dradee 22
END

END //APPEND

/* Add cross reference to Balduran's fate to Mendas */

EXTEND_BOTTOM MENDA1 5
+ ~GlobalGT("bs_BalduransItems","GLOBAL",0)~ + @459 /* A shipwreck on a remote island? I'm beginning to wonder if I've been there by chance - although I don't think so. But could this island you're talking about be somewhere in the Moonshae Seas? Some of Balduran's personal belongings made it there. */ + bst_crossreference
END

APPEND MENDA1
IF ~~ THEN bst_crossreference
SAY @460 /* Moonshae... Ah, no, this island is untouched yet, shipwreck untouched, too. Lots of forgotten treasures, if you help. */
COPY_TRANS MENDA1 5
END
END //APPEND
