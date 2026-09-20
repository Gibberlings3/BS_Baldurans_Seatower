BEGIN ysrsdead

IF ~Global("bsTalkedToRestlessDead","GLOBAL",3)~ THEN banning
SAY @1441 /* ~You... were told... not to intrude... in my halls. You... have disobeyed that request... Very well... <CHARNAME> of Candlekeep... Pray to your dead father... for salvation.... and face the restless dead.~ */
IF ~~ THEN DO ~TakePartyItem("bsrsd07")
DestroyItem("bsrsd07")
EraseJournalEntry(@941)  
EraseJournalEntry(@942) 
EraseJournalEntry(@943) 
EraseJournalEntry(@946)
EraseJournalEntry(@947)
EraseJournalEntry(@949)
EraseJournalEntry(@953)
EraseJournalEntry(@954)
EraseJournalEntry(@955)
SetGlobal("bsTalkedToRestlessDead","GLOBAL",8)~ UNSOLVED_JOURNAL @950 EXIT
END

IF ~Global("bsTalkedToRestlessDead","GLOBAL",1)~ THEN kofd_0
SAY @1400 /* ~Who... callss? Who... disturbs uss?~ */
++ @1401 /* ~I am <CHARNAME> of Candlekeep.~ */ + kofd_14
++ @1403 /* ~Carloan Noname.~ */ + kofd_4
++ @1402 /*  ~Who are you?~ */ + kofd_1
++ @1411 /* ~Are you the Great Evil that haunts this place?~ */ + kofd_1
+ ~Global("bs_KnowsKingOfTheDead","GLOBAL",1)~ + @1413 /* ~I heard you call yourself the King of the Restless Dead?~ */ + kofd_1
++ @1444 /* ~Why do you not send your minions after me?~ */ + kofd_1
++ @1412 /* ~There is no need to exchange pleasantries. I am here to clear this place from your presence.~ */ + kofd_3
END

/* PC didn't comply */
IF ~~ THEN kofd_1
SAY @1404 /* ~You... have disturbed me. I... will ask the questions. Who... are you?~ */
++ @1401 /* ~I am <CHARNAME> of Candlekeep.~ */ + kofd_14
++ @1403 /* ~Carloan Noname.~ */ + kofd_4
++ @1405 /* ~Give me your name first.~ */ + kofd_2
++ @1412 /* ~There is no need to exchange pleasantries. I am here to clear this place from your presence.~ */ + kofd_3
END

IF ~~ THEN kofd_2
SAY @1406 /* ~I... do not give my name... to intruders... in my domain. Your last chance... mortal... what is your name?~ */
++ @1401 /* ~I am <CHARNAME> of Candlekeep.~ */ + kofd_14
++ @1403 /* ~Carloan Noname.~ */ GOTO kofd_4
++ @1407 /* ~And I don't give my name to skeletons in the closet.~ */ GOTO kofd_3
++ @1415 /* ~This is not "your domain".~ */ + kofd_3
++ @1412 /* ~There is no need to exchange pleasantries. I am here to clear this place from your presence.~ */ + kofd_3
END

IF ~~ THEN BEGIN kofd_3
SAY @1408 /* ~So you say... rude intruder... intruder with no name...~ */
IF ~~ THEN + kofd_5
END

/* PC lied about name */
IF ~~ THEN kofd_4
SAY @1409 /* ~Well... Carloan Noname... Noname the Liar... for that is who you are...~ */
IF ~~ THEN + kofd_5
END

IF ~~ THEN kofd_5
SAY @1416 /* ~Or... should I call you... <CHARNAME> of Candlekeep?~ */
+ ~Global("bsKnowBhaal","GLOBAL",1) Gender(Protagonist,MALE)~ + @1429 /* ~I am <CHARNAME> of Candlekeep as you say. Giving away my name at the request of every stranger is not safe these days.~ */ + kofd_7
+ ~Global("bsKnowBhaal","GLOBAL",1) Gender(Protagonist,FEMALE)~ + @1429 /* ~I am <CHARNAME> of Candlekeep as you say. Giving away my name at the request of every stranger is not safe these days.~ */ + kofd_8
+ ~!Global("bsKnowBhaal","GLOBAL",1)~ + @1429 /* ~I am <CHARNAME> of Candlekeep as you say. Giving away my name at the request of every stranger is not safe these days.~ */ + kofd_6
++ @1417 /* ~So you know me and have a reason not to swamp me with your minions? Why?~ */ + kofd_realm
++ @1423 /* ~So you know my name. Why ask then?~ */ + kofd_realm
++ @1424 /* ~How did you find out my name, eh??~ */ + kofd_realm
END

IF ~~ THEN kofd_6
SAY @1440 /* ~No... it is not...~ */
IF ~~ THEN + kofd_realm
END

IF ~~ THEN kofd_7
SAY @1430 /* ~No... it is not... son... of the Lord of Murder.~ */
IF ~~ THEN + kofd_realm
END

IF ~~ THEN kofd_8
SAY @1431 /* ~No... it is not... daughter... of the Lord of Murder.~ */
IF ~~ THEN + kofd_realm
END

IF ~~ THEN kofd_9
SAY @1428 /* ~So... you have the wit... to recognise me... but there are no accidents... in my realm.~ */ 
IF ~~ THEN + kofd_final
END

IF ~~ THEN kofd_10
SAY @1432 /* ~What is it that you want? Why... have you disturbed us?~ */
++ @1433 /* ~In truth, I came here to see what I'd find. I would ask almost the same question of you: why are you here?~ */ + kofd_13
+ ~OR(3)
CheckStatGT(Protagonist,15,CHR)
CheckStatGT(Protagonist,15,INT)
Global("bs_KnowsKingOfTheDead","GLOBAL",1)~ + @1410 /* ~I didn't mean it, oh King of the Restless Dead.~ */ + kofd_9
++ @1434 /* ~Old graves contain old gold, Skeleton King, and I am poor.~ */ + kofd_11
++ @1418 /* ~Is there any chance that you will simply return to where you came from?~ */ + kofd_11
++ @1419 /* ~The monks didn't mean to summon you. It is you who is disturbing this place.~ */ + kofd_12
++ @1420 /* ~Disturned you? You are the great pain in the butt here!~ */ + kofd_11
END

IF ~~ THEN BEGIN kofd_11
SAY @1435 /* ~If I had... the means... I would laugh... mortal. You are ever... the truthful <PRO_RACE>... when you wish. One day... that... truth will... get you into more trouble... than you can handle.~ */
++ @1436 /* ~I think it already has.~ */ + kofd_final
++ @1437 /* ~Not a chance.~ */ + kofd_12
END

IF ~~ THEN kofd_12
SAY @1438 /* ~Do not... be so flippant, mortal.~ */
IF ~~ THEN + kofd_final
END

IF ~~ THEN kofd_13
SAY @1439 /* ~Curiosity, mortal. I... am not... immune to it.~ */
IF ~~ THEN + kofd_final
END

/* PC told real name */
IF ~~ THEN kofd_14
SAY @1414 /* ~You... answer with truth, <CHARNAME> of Candlekeep, but I do not think that... is all you are.~ */
++ @1421 /* ~What do you mean?~ */ + kofd_realm
++ @1423 /* ~So you know my name. Why ask then?~ */ + kofd_realm
++ @1424 /* ~How did you find out my name, eh??~ */ + kofd_realm
++ @1417 /* ~So you knew me and have a reason not to swamp me with your minions? Why?~ */ + kofd_realm
END

CHAIN
IF ~~ THEN ysrsdead kofd_realm
@1425 /* ~I rule... the realm of the restless dead, mortal... and you... are bound here at the end of your days... as was your father...~ */
== ysrsdead IF ~Global("bsKnowBhaal","GLOBAL",1)~ THEN @1443 /* ~Yesss... the Lord of Murder is... now... under my dominion and... serves me.~ */
END
+ ~!Global("bsKnowBhaal","GLOBAL",1)~ + @1442 /* ~My father?! What are you talking about?~ */ + kofd_realm_1
++ @1426 /* ~And who do you serve, King of the Restless Dead?~ */ + kofd_realm_1

APPEND ysrsdead

IF ~~ THEN kofd_realm_1
SAY @1427 /* ~I serve... Lord Kelemvor Lyonsbane... Lord of Death. Yess... even your father... served him... and hated him.~ */
IF ~~ THEN + kofd_10
END

IF ~~ THEN kofd_final
SAY @1422 /* ~I... give you... fair warning... Tread lightly... in my halls or... face the restless dead.~ */
IF ~!Global("bsKnowBhaal","GLOBAL",1)
Global("bsDreamDone","GLOBAL",2)~ THEN DO ~SetGlobal("bsTalkedToRestlessDead","GLOBAL",2)
EraseJournalEntry(@943) 
	ForceSpellRes("BS00001",Myself)
	ActionOverride("ysrsdead",DestroySelf())~ UNSOLVED_JOURNAL @953 EXIT
IF ~!Global("bsKnowBhaal","GLOBAL",1)
!Global("bsDreamDone","GLOBAL",2)~ THEN DO ~SetGlobal("bsTalkedToRestlessDead","GLOBAL",2)
EraseJournalEntry(@943) 
	ForceSpellRes("BS00001",Myself)
	ActionOverride("ysrsdead",DestroySelf())~ UNSOLVED_JOURNAL @954 EXIT
IF ~Global("bsKnowBhaal","GLOBAL",1)~ THEN DO ~SetGlobal("bsTalkedToRestlessDead","GLOBAL",2)
EraseJournalEntry(@943) 
	ForceSpellRes("BS00001",Myself)
	ActionOverride("ysrsdead",DestroySelf())~ UNSOLVED_JOURNAL @955 EXIT
END
END //APPEND
