EXTEND_BOTTOM HALBAZ 0
+ ~Global("bsGotAlmiranScroll","LOCALS",0) PartyHasItem("BSALMIRN")~ + @2850 + bst_10
+ ~GlobalGT("bsDreamDone","GLOBAL",0) PartyHasItem("BSALMIRN")~ + @2862 + scroll
END

EXTEND_BOTTOM HALBAZ 1
+ ~Global("bsGotAlmiranScroll","LOCALS",0) PartyHasItem("BSALMIRN")~ + @2850 + bst_10
+ ~GlobalGT("bsDreamDone","GLOBAL",0) PartyHasItem("BSALMIRN")~ + @2862 + scroll
END

APPEND HALBAZ

	IF~~THEN BEGIN bst_10
    SAY@2851
    IF~~THEN REPLY @2852 GOTO bst_11
  	IF ~~ THEN REPLY @2861 /* ~Perhaps another time.~ */ EXIT
	END

	IF~~THEN BEGIN bst_11
    SAY@2853
    IF~~THEN REPLY @2854 GOTO bst_12
  	IF ~~ THEN REPLY @2861 /* ~Perhaps another time.~ */ EXIT
	END

	IF~~THEN BEGIN bst_12
    SAY@2855
    IF~~THEN REPLY @2856 GOTO bst_13
  	IF ~~ THEN REPLY @2861 /* ~Perhaps another time.~ */ EXIT
	END

	IF~~THEN BEGIN bst_13
    SAY@2857
    IF~~THEN REPLY @2858 GOTO bst_14
  	IF ~~ THEN REPLY @2861 /* ~Perhaps another time.~ */ EXIT
	END

	IF~~THEN BEGIN bst_14
    SAY@2859
    IF ~~ THEN
    SOLVED_JOURNAL @762
			DO~SetGlobal("bsGotAlmiranScroll","LOCALS",1)
				 EraseJournalEntry(@760)
				EraseJournalEntry(@761)~
    EXIT
	END

IF ~~ THEN scroll
SAY @2863
  ++ @2864 + scroll_01
  ++ @2865 + scroll_02
  ++ @2868 + scroll_03
  	IF ~~ THEN REPLY @2861 /* ~Perhaps another time.~ */ EXIT
END

IF ~~ THEN scroll_01
SAY @2866
IF ~~ THEN DO ~TakePartyItem("BSALMIRN") DestroyItem("BSALMIRN") SetGlobal("bsDrinHasScroll","MYAREA",1)~ EXIT
END

IF ~~ THEN scroll_02
SAY @2867
  ++ @2864 + scroll_01
  ++ @2868 + scroll_03
END

IF ~~ THEN scroll_03
SAY @2869
IF ~~ THEN DO ~TakePartyItem("BSALMIRN") DestroyItem("BSALMIRN") 
GiveGoldForce(1000) SetGlobal("bsDrinHasScroll","MYAREA",2)~ EXIT
END

IF WEIGHT #-1
~Global("bsDrinHasScroll","MYAREA",1)~ THEN scroll_reward
SAY @2870
IF ~~ THEN DO ~GiveItemCreate("bsavring",[PC],0,0,0) SetGlobal("bsDrinHasScroll","MYAREA",2)~ EXIT
END

END //APPEND