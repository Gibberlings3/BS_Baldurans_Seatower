/* add to "bsrsd08" (CHARNAME's bed in the monastery) */
APPEND bsrsd08
IF WEIGHT #-1
~Global("bs_MoggyIsHere","MYAREA",1)~ THEN cat_blocking
SAY @0 /* The bed is freshly made and ready to use. At least, it would be, but you can't fold the bed down. The cat is in the way. */
IF ~~ THEN DO ~SetGlobal("bs_MoggysBed","MYAREA",2)
SetGlobal("bs_TalkToPC","LOCALS",1)
SetGlobalTimer("bs_RatSpawnTimer","GLOBAL",ONE_DAY)~ EXIT
END
END //APPEND


/* Moggy the Cat */

BEGIN bsmoggy

IF ~Global("bs_PCTalkedToMoggy","LOCALS",0)~ THEN hello
SAY @1 /* A stray cat that has found a home in the monastery. The Ilmater monks seem to take their mission of caring for the needy very seriously, indeed. */
IF ~~ THEN DO ~SetGlobal("bs_PCTalkedToMoggy","LOCALS",1)~ + cat_00
END

/* she will bite at some point. It's a cat */
IF ~RandomNum(10,8)
Global("bs_MoggysWrath","LOCALS",0)~ THEN cat_00_bite
SAY @2 /* The cat looks at you. */
++ @3 /* You reach down to pet her. */ + cat_00_bite_1
+ ~Global("bs_MoggyIsHere","MYAREA",1)
Global("bs_MoggysBed","MYAREA",2)~ + @4 /* I want to fold down the bed. Would you step aside a bit, hmm? */ + no_reaction

/* praise her to avert her wrath */
+ ~PartyHasItem("bsdedrat") Global("bs_SpawnRatItem","MYAREA",1)~ + @5 /* This dead rat is from you, yes? A present? That was *so* nice of you, Moggy. Thank you *so* much! */ DO ~SetGlobal("bs_PresentFound","LOCALS",1)
SetGlobal("bs_MoggyHappy","LOCALS",6)
SetGlobal("bs_SpawnRatItem","MYAREA",0)
SetGlobalTimer("bs_RatSpawnTimer","GLOBAL",FIVE_DAYS)~ + legrub
+ ~OR(2)
	PartyHasItem("bsdedrat")
	Global("bs_PresentFound","LOCALS",1)
Global("bs_SpawnRatItem","MYAREA",0)~ + @5 /* This dead rat is from you, yes? A present? That was *so* nice of you, Moggy. Thank you *so* much! */ DO ~IncrementGlobal("bs_MoggyHappy","LOCALS",1)~ + legrub

+ ~OR(2)
	PartyHasItem("bsdedrat")
	Global("bs_PresentFound","LOCALS",1)
RandomNum(3,1)~ + @6 /* Would you stop putting dead vermin into my chest? */ DO ~SetGlobal("bs_PresentFound","LOCALS",1)~ + cat_00_bite
+ ~OR(2)
	PartyHasItem("bsdedrat")
	Global("bs_PresentFound","LOCALS",1)
RandomNum(3,2)~ + @6 /* Would you stop putting dead vermin into my chest? */ DO ~SetGlobal("bs_PresentFound","LOCALS",1)~ + cat_00_bite
+ ~OR(2)
	PartyHasItem("bsdedrat")
	Global("bs_PresentFound","LOCALS",1)
RandomNum(3,3)~ + @6 /* Would you stop putting dead vermin into my chest? */ DO ~SetGlobal("bs_PresentFound","LOCALS",1)~ + enough
++ @7 /* You leave the cat be. */ EXIT 
END


/* normal interaction dialogue */
IF ~OR(2)
	!RandomNum(10,8)
	Global("bs_MoggysWrath","LOCALS",1)~ THEN cat_00
SAY @2 /* The cat looks at you. */
+ ~RandomNum(8,1)
!Global("bs_MoggyHappy","LOCALS",6)~ + @3 /* You reach down to pet her. */ DO ~IncrementGlobal("bs_MoggyHappy","LOCALS",1)~ + pet_success
+ ~RandomNum(8,2)
!Global("bs_MoggyHappy","LOCALS",6)~ + @3 /* You reach down to pet her. */ DO ~SetGlobal("bs_MoggyHappy","LOCALS",0)~ + pet_careful
+ ~RandomNum(8,3)
!Global("bs_MoggyHappy","LOCALS",6)~ + @3 /* You reach down to pet her. */ DO ~SetGlobal("bs_MoggyHappy","LOCALS",0)~ + pet_scratch
+ ~RandomNum(8,4)
!Global("bs_MoggyHappy","LOCALS",6)~ + @3 /* You reach down to pet her. */ DO ~IncrementGlobal("bs_MoggyHappy","LOCALS",1)~ + pet_success
+ ~RandomNum(8,5)
!Global("bs_MoggyHappy","LOCALS",6)~ + @3 /* You reach down to pet her. */ DO ~SetGlobal("bs_MoggyHappy","LOCALS",0)~ + pet_careful
+ ~RandomNum(8,6)
!Global("bs_MoggyHappy","LOCALS",6)~ + @3 /* You reach down to pet her. */ DO ~IncrementGlobal("bs_MoggyHappy","LOCALS",1)~ + pet_success
+ ~RandomNum(8,7)
!Global("bs_MoggyHappy","LOCALS",6)~ + @3 /* You reach down to pet her. */ DO ~IncrementGlobal("bs_MoggyHappy","LOCALS",1)~ + pet_success
+ ~RandomNum(8,8)
!Global("bs_MoggyHappy","LOCALS",6)~ + @3 /* You reach down to pet her. */ DO ~SetGlobal("bs_MoggyHappy","LOCALS",0)~ + pet_careful

+ ~Global("bs_MoggyHappy","LOCALS",6)~ + @3 /* You reach down to pet her. */ + purr

+ ~Global("bs_MoggyIsHere","MYAREA",1)
Global("bs_MoggysBed","MYAREA",2)~ + @4 /* I want to fold down the bed. Would you step aside a bit, hmm? */ + no_reaction

/* praise Moggy after finding a rat to collect her favor */
+ ~PartyHasItem("bsdedrat") Global("bs_SpawnRatItem","MYAREA",1)~ + @5 /* This dead rat is from you, yes? A present? That was *so* nice of you, Moggy. Thank you *so* much! */ DO ~SetGlobal("bs_PresentFound","LOCALS",1)
SetGlobal("bs_MoggyHappy","LOCALS",6)
SetGlobal("bs_SpawnRatItem","MYAREA",0)
SetGlobalTimer("bs_RatSpawnTimer","GLOBAL",FIVE_DAYS)~ + legrub

/* PC can praise her any time, but it will only lead to instant purr the first time after a present */
+ ~OR(2)
	PartyHasItem("bsdedrat")
	Global("bs_PresentFound","LOCALS",1)
Global("bs_SpawnRatItem","MYAREA",0)~ + @5 /* This dead rat is from you, yes? A present? That was *so* nice of you, Moggy. Thank you *so* much! */ DO ~IncrementGlobal("bs_MoggyHappy","LOCALS",1)~ + legrub

+ ~OR(2)
	PartyHasItem("bsdedrat")
	Global("bs_PresentFound","LOCALS",1)
RandomNum(3,1)~ + @6 /* Would you stop putting dead vermin into my chest? */ DO ~SetGlobal("bs_PresentFound","LOCALS",1)~ + cat_00
+ ~OR(2)
	PartyHasItem("bsdedrat")
	Global("bs_PresentFound","LOCALS",1)
RandomNum(3,2)~ + @6 /* Would you stop putting dead vermin into my chest? */ DO ~SetGlobal("bs_PresentFound","LOCALS",1)~ + cat_00
+ ~OR(2)
	PartyHasItem("bsdedrat")
	Global("bs_PresentFound","LOCALS",1)
RandomNum(3,3)~ + @6 /* Would you stop putting dead vermin into my chest? */ DO ~SetGlobal("bs_PresentFound","LOCALS",1)~ + enough
++ @7 /* You leave the cat be. */ EXIT 
END

IF ~~ THEN legrub
SAY @9 /* Moggy strokes around your legs, obviously very pleased with herself. */
IF ~~ THEN + cat_00
END

IF ~~ THEN pet_success
SAY @10 /* Moggy lets you pet her. */
IF ~~ THEN + cat_00
END

IF ~~ THEN pet_careful
SAY @11 /* Moggy lets you pet her, but her tail is twitching. */
IF ~~ THEN + cat_00
END

IF ~~ THEN pet_scratch
SAY @12 /* Moggy lost patience. You get a scratch from her claws. */
IF ~~ THEN DO ~ApplyDamage(LastTalkedToBy(Myself),1,PIERCING)~ EXIT
END

IF ~~ THEN cat_00_bite_1
SAY @13 /* This was not the time! You sparked Moggy's Wraith! The cat bites you. */
IF ~~ THEN DO ~ApplyDamage(LastTalkedToBy(Myself),3,PIERCING) ForceSpellRes("bsmoggyd",LastTalkedToBy(Myself)) SetGlobal("bs_MoggysWrath","LOCALS",1)~ EXIT
END

IF ~~ THEN purr
SAY @14 /* You earned Moggy's Favor. The cat purrs, her eyes half closed. A moment of complete peace. */
IF ~~ THEN DO ~SetGlobal("bs_MoggyHappy","LOCALS",0) ForceSpellRes("bsmoggyf",LastTalkedToBy(Myself))~ EXIT
END

IF ~~ THEN no_reaction
SAY @15 /* The cat gives you a look, making it perfectly clear that she can sit wherever she wants for as long as she wants - but because she really, really feels generous today, she might consider stepping aside - in a minute. */
IF ~~ THEN EXIT
END

IF ~~ THEN enough
SAY @16 /* Moggy lost interest and walks away. */
IF ~~ THEN DO ~SetGlobal("bs_MoggyHappy","LOCALS",0)~ EXIT
END
