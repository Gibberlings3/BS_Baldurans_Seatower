BEGIN bsalgbk

IF~RandomNum(8,1)~THEN BEGIN Open1
	SAY @3500
	IF~~THEN GOTO InfiniteStaircase
END

IF~RandomNum(8,3)~THEN BEGIN Open2
	SAY @3500
	IF~~THEN GOTO NineHells
END

IF~RandomNum(8,4)~THEN BEGIN Open3
	SAY @3500
	IF~~THEN GOTO TheGods
END

IF~
	OR(3)
		RandomNum(8,2)
		RandomNum(8,5)
		RandomNum(8,8)~THEN BEGIN Open4
	SAY @3500
	IF~~THEN GOTO Troubles
END

IF~RandomNum(8,6)~THEN BEGIN Open5
	SAY @3500
	IF~~THEN GOTO Lands
END

IF~RandomNum(8,7)~THEN BEGIN Open6
	SAY @3500
	IF~~THEN GOTO Races
END

//---------------------------------------------------------
// Chapter headings
IF ~~ THEN BEGIN InfiniteStaircase
	SAY @3501
	IF~~THEN REPLY @3502 GOTO Infinite1
	IF~~THEN REPLY @3503 GOTO Infinite2
	IF~~THEN REPLY @3504 GOTO Infinite3
	IF~~THEN REPLY @3505 GOTO Close1
END

IF ~~ THEN BEGIN NineHells
	SAY @3506
	IF~~THEN REPLY @3507 GOTO Avernus
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
	SAY @3528
	IF~~THEN REPLY @3529 GOTO time1
	IF~~THEN REPLY @3530 GOTO time2
	IF~~THEN REPLY @3505 GOTO Close2
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
IF ~~ THEN BEGIN Close1
	SAY @3553
	IF~~THEN EXIT
END

IF ~~ THEN BEGIN Close2
	SAY @3554
	IF~~THEN EXIT
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
IF ~~ THEN BEGIN time1
	SAY @3574
	IF~~THEN
		DO~SetGlobal("bsReadBook","GLOBAL",1)~
	GOTO Troubles
END

IF ~~ THEN BEGIN time2
	SAY @3564
	IF~~THEN
		DO~SetGlobal("bsReadBook","GLOBAL",1)~
	GOTO Troubles
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

