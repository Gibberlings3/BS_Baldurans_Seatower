BEGIN bsalgbk

/* Book Of the Planes bsalgbk.bcs */
IF ~!Global("bs_bsalgbkopened","MYAREA",2)~ THEN open
SAY @530 /*
@530 = ~You found this old book buried in the far corner of Alguine's library. You try to read the book but the more you read, the less sense it makes. Much of the book seems to be just... missing... and the rest of it seems to be written by someone not much older than a child. Worse, each time you open the book the pages have changed.~
*/
+ ~RandomNum(6,1)~ + @3500 /* ~Open another page~ */ DO ~IncrementGlobal("bs_bsalgbkopened","MYAREA",1)~ GOTO InfiniteStaircase
+ ~RandomNum(6,2)~ + @3500 /* ~Open another page~ */ DO ~IncrementGlobal("bs_bsalgbkopened","MYAREA",1)~ GOTO NineHells
+ ~RandomNum(6,3)~ + @3500 /* ~Open another page~ */ DO ~IncrementGlobal("bs_bsalgbkopened","MYAREA",1)~ GOTO TheGods
+ ~RandomNum(6,4)~ + @3500 /* ~Open another page~ */ GOTO Troubles
+ ~RandomNum(6,5)~ + @3500 /* ~Open another page~ */ DO ~IncrementGlobal("bs_bsalgbkopened","MYAREA",1)~ GOTO Lands
+ ~RandomNum(6,6)~ + @3500 /* ~Open another page~ */ DO ~IncrementGlobal("bs_bsalgbkopened","MYAREA",1)~ GOTO Races
++ @3505 /* ~Close the book~ */ GOTO Close1
END

IF ~Global("bs_bsalgbkopened","MYAREA",2)~ THEN open
SAY @530 /*
@530 = ~You found this old book buried in the far corner of Alguine's library. You try to read the book but the more you read, the less sense it makes. Much of the book seems to be just... missing... and the rest of it seems to be written by someone not much older than a child. Worse, each time you open the book the pages have changed.~
*/
++ @3500 /* ~Open another page~ */ GOTO Troubles
++ @3505 /* ~Close the book~ */ GOTO Close1
END

//---------------------------------------------------------
IF ~~ THEN BEGIN Close1
	SAY @3553
	IF~~THEN DO ~SetGlobal("bsPlaneBookCreation","MYAREA",0) DestroySelf()~ EXIT
END


//---------------------------------------------------------
// Chapter headings
IF ~~ THEN BEGIN InfiniteStaircase
	SAY @3501 /* ~The Infinite Staircase~ */
	IF~~THEN REPLY @3502 /* ~The Staircase~ */ GOTO Infinite1
	IF~~THEN REPLY @3503 /* ~The Mad Sorceress~ */ GOTO Infinite2
	IF~~THEN REPLY @3504 /* ~The Doorways~ */ GOTO Infinite3
	IF~~THEN REPLY @3505 /* ~Close the book~ */ GOTO Close1
END

IF ~~ THEN BEGIN NineHells
	SAY @3506 /* ~Baator, or, The Nine Hells~ */
	IF~~THEN REPLY @3507 /* ~Avernus~ */ GOTO Avernus
	IF~~THEN REPLY @3508 GOTO Cania
	IF~~THEN REPLY @3509 GOTO Dis
	IF~~THEN REPLY @3510 GOTO Maladomini
	IF~~THEN REPLY @3511 GOTO Malbolge
	IF~~THEN REPLY @3512 GOTO Minauros
	IF~~THEN REPLY @3513 GOTO Nessus
	IF~~THEN REPLY @3514 GOTO Phlegethos
	IF~~THEN REPLY @3515 GOTO Stygia
	IF~~THEN REPLY @3505 GOTO Close1
END

IF ~~ THEN BEGIN TheGods
	SAY @3516
	IF~~THEN REPLY @3517 GOTO gChultan
	IF~~THEN REPLY @3518 GOTO gDrow
	IF~~THEN REPLY @3519 GOTO gDwarves
	IF~~THEN REPLY @3520 GOTO gElven
	IF~~THEN REPLY @3521 GOTO gFaerunian
	IF~~THEN REPLY @3522 GOTO gGnomish
	IF~~THEN REPLY @3523 GOTO gHalfling
	IF~~THEN REPLY @3524 GOTO gJhaamdathan
	IF~~THEN REPLY @3525 GOTO gMulhorandi
	IF~~THEN REPLY @3526 GOTO gOrcish
	IF~~THEN REPLY @3527 GOTO gTalfiric
	IF~~THEN REPLY @3505 GOTO Close1
END

IF ~~ THEN BEGIN Troubles
	SAY @3528 /* ~The Time of Troubles~ */
	IF~~THEN REPLY @3529 /* ~What happened in the Time of Troubles~ */ DO ~SetGlobal("bs_bsalgbkopened","MYAREA",3)~ GOTO time1
	IF~~THEN REPLY @3530 /* ~What happened afterwards~ */ GOTO time2
	IF~~THEN REPLY @3505 GOTO Close1
END

IF ~~ THEN BEGIN Lands
	SAY @3531
	IF~~THEN REPLY @3532 GOTO Aglarond
	IF~~THEN REPLY @3533 GOTO Amn
	IF~~THEN REPLY @3534 GOTO Anauroch
	IF~~THEN REPLY @3535 GOTO Calimshan
	IF~~THEN REPLY @3536 GOTO Chessenta
	IF~~THEN REPLY @3537 GOTO Cormyr
	IF~~THEN REPLY @3538 GOTO Damara
	IF~~THEN REPLY @3539 GOTO Dambrath
	IF~~THEN REPLY @3540 GOTO Icewind
	IF~~THEN REPLY @3541 GOTO Impiltur
	IF~~THEN REPLY @3542 GOTO Mulhorand
	IF~~THEN REPLY @3543 GOTO Narfell
	IF~~THEN REPLY @3544 GOTO Sembia
	IF~~THEN REPLY @3545 GOTO Thay
	IF~~THEN REPLY @3546 GOTO Lots
	IF~~THEN REPLY @3505 GOTO Close1
END

IF ~~ THEN BEGIN Races
	SAY @3547
	IF~~THEN REPLY @3518 GOTO Drow
	IF~~THEN REPLY @3519 GOTO Dwarves
	IF~~THEN REPLY @3548 GOTO Elves
	IF~~THEN REPLY @3549 GOTO Gnomes
	IF~~THEN REPLY @3550 GOTO Halflings
	IF~~THEN REPLY @3551 GOTO Humans
	IF~~THEN REPLY @3552 GOTO Orcs
	IF~~THEN REPLY @3505 GOTO Close1
END



//---------------------------------------------------------
// Infinite Staircase
IF ~~ THEN BEGIN Infinite1
	SAY @3555
	IF~~THEN GOTO InfiniteStaircase
END

IF ~~ THEN BEGIN Infinite2
	SAY @3556
	IF~~THEN GOTO InfiniteStaircase
END

IF ~~ THEN BEGIN Infinite3
	SAY @3557
	IF~~THEN GOTO InfiniteStaircase
END

//---------------------------------------------------------
// Nine Hells
IF ~~ THEN BEGIN Avernus
	SAY @3558
	IF~~THEN GOTO NineHells
END

IF ~~ THEN BEGIN Cania
	SAY @3559
	IF~~THEN GOTO NineHells
END

IF ~~ THEN BEGIN Dis
	SAY @3560
	IF~~THEN GOTO NineHells
END

IF ~~ THEN BEGIN Minauros
	SAY @3561
	IF~~THEN GOTO NineHells
END

IF ~~ THEN BEGIN Phlegethos
	SAY @3562
	IF~~THEN GOTO NineHells
END

IF ~~ THEN BEGIN Stygia
	SAY @3563
	IF~~THEN GOTO NineHells
END

IF ~~ THEN BEGIN Malbolge
	SAY @3564
	IF~~THEN GOTO NineHells
END

IF ~~ THEN BEGIN Maladomini
	SAY @3565
	IF~~THEN GOTO NineHells
END

IF ~~ THEN BEGIN Nessus
	SAY @3566
	IF~~THEN GOTO NineHells
END

//---------------------------------------------------------
IF ~~ THEN BEGIN gChultan
	SAY @3564
	IF~~THEN GOTO TheGods
END

IF ~~ THEN BEGIN gDrow
	SAY @3567
	IF~~THEN GOTO TheGods
END

IF ~~ THEN BEGIN gDwarves
	SAY @3568
	IF~~THEN GOTO TheGods
END

IF ~~ THEN BEGIN gElven
	SAY @3569
	IF~~THEN GOTO TheGods
END

IF ~~ THEN BEGIN gGnomish
	SAY @3570
	IF~~THEN GOTO TheGods
END

IF ~~ THEN BEGIN gHalfling
	SAY @3571
	IF~~THEN GOTO TheGods
END

IF ~~ THEN BEGIN gFaerunian
	SAY @3572
	IF~~THEN GOTO TheGods
END

IF ~~ THEN BEGIN gMulhorandi
	SAY @3564
	IF~~THEN GOTO TheGods
END

IF ~~ THEN BEGIN gJhaamdathan
	SAY @3564
	IF~~THEN GOTO TheGods
END

IF ~~ THEN BEGIN gTalfiric
	SAY @3564
	IF~~THEN GOTO TheGods
END

IF ~~ THEN BEGIN gOrcish
	SAY @3573
	IF~~THEN GOTO TheGods
END

//---------------------------------------------------------
// Troubles
CHAIN
IF ~~ THEN bsalgbk time1
@3574 /* ~Someone has erased this page by scraping the ink off with a rough stone and then making a drawing of a tree. The tree looks oddly familiar. Some of the following pages seem to be missing too.~ */
== bsalgbk IF ~Global("bsReadBook","MYAREA",0)~ THEN @3554 /* ~A wave of weariness sweeps through you and vanishes as fast as it came. A voice in your head says 'Now <PRO_HESHE> saw.'~ */ DO~SetGlobal("bsReadBook","MYAREA",1)~ 
END
IF~GlobalGT("bs_TalkingBooks","GLOBAL",0)~THEN GOTO Troubles
IF~Global("bs_TalkingBooks","GLOBAL",0)~THEN DO ~SetGlobal("bs_TalkingBooks","GLOBAL",1)~ GOTO Troubles


APPEND bsalgbk

IF ~~ THEN BEGIN time2
	SAY @3564 /* ~This page is blank.~ */
	IF~~THEN GOTO Troubles
END

//---------------------------------------------------------
// Lands
IF ~~ THEN BEGIN Aglarond
	SAY @3575
	IF~~THEN GOTO Lands
END

IF ~~ THEN BEGIN Amn
	SAY @3576
	IF~~THEN GOTO Lands
END

IF ~~ THEN BEGIN Anauroch
	SAY @3577
	IF~~THEN GOTO Lands
END

IF ~~ THEN BEGIN Calimshan
	SAY @3578
	IF~~THEN GOTO Lands
END

IF ~~ THEN BEGIN Chessenta
	SAY @3564
	IF~~THEN GOTO Lands
END

IF ~~ THEN BEGIN Cormyr
	SAY @3579
	IF~~THEN GOTO Lands
END

IF ~~ THEN BEGIN Damara
	SAY @3580
	IF~~THEN GOTO Lands
END

IF ~~ THEN BEGIN Dambrath
	SAY @3564
	IF~~THEN GOTO Lands
END

IF ~~ THEN BEGIN Icewind
	SAY @3581
	IF~~THEN GOTO Lands
END

IF ~~ THEN BEGIN Impiltur
	SAY @3582
	IF~~THEN GOTO Lands
END

IF ~~ THEN BEGIN Mulhorand
	SAY @3583
	IF~~THEN GOTO Lands
END

IF ~~ THEN BEGIN Narfell
	SAY @3584
	IF~~THEN GOTO Lands
END

IF ~~ THEN BEGIN Sembia
	SAY @3585
	IF~~THEN GOTO Lands
END

IF ~~ THEN BEGIN Thay
	SAY @3586
	IF~~THEN GOTO Lands
END

IF ~~ THEN BEGIN Lots
	SAY @3587
	IF~~THEN GOTO Lands
END

//---------------------------------------------------------
// Races
IF ~~ THEN BEGIN Drow
	SAY @3588
	IF~~THEN GOTO Races
END

IF ~~ THEN BEGIN Dwarves
	SAY @3589
	IF~~THEN GOTO Races
END

IF ~~ THEN BEGIN Elves
	SAY @3564
	IF~~THEN GOTO Races
END

IF ~~ THEN BEGIN Gnomes
	SAY @3590
	IF~~THEN GOTO Races
END

IF ~~ THEN BEGIN Halflings
	SAY @3591
	IF~~THEN GOTO Races
END

IF ~~ THEN BEGIN Humans
	SAY @3564
	IF~~THEN GOTO Races
END

IF ~~ THEN BEGIN Orcs
	SAY @3592
	IF~~THEN GOTO Races
END

END //APPEND

