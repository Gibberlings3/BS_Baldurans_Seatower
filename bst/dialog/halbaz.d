EXTEND_BOTTOM HALBAZ 0
+ ~!Global("bsAlguineAnnoyed","GLOBAL",1) !Global("bsDreamDone","GLOBAL",2)
Global("bsGotAlmiranScroll","MYAREA",0) PartyHasItem("BSALMIRN")~ + @2850 + bst_10
+ ~Global("bsGotAlmiranScroll","MYAREA",1)
PartyHasItem("BSALMIRN")~ + @2862 + scroll
+ ~Global("bsGotAlmiranScroll","MYAREA",0)
OR(2)
		Global("bsAlguineAnnoyed","GLOBAL",1)
		Global("bsDreamDone","GLOBAL",2)
PartyHasItem("BSALMIRN")~ + @2871 + scroll_04
END

EXTEND_BOTTOM HALBAZ 1
+ ~!Global("bsAlguineAnnoyed","GLOBAL",1) !Global("bsDreamDone","GLOBAL",2)
Global("bsGotAlmiranScroll","MYAREA",0) PartyHasItem("BSALMIRN")~ + @2850 + bst_10
+ ~Global("bsGotAlmiranScroll","MYAREA",1)
PartyHasItem("BSALMIRN")~ + @2862 + scroll
+ ~Global("bsGotAlmiranScroll","MYAREA",0)
OR(2)
		Global("bsAlguineAnnoyed","GLOBAL",1)
		Global("bsDreamDone","GLOBAL",2)
PartyHasItem("BSALMIRN")~ + @2871 + scroll_04
END

APPEND HALBAZ

	IF~~THEN BEGIN bst_10
    SAY @2851
    IF~~THEN REPLY @2852 GOTO bst_11
  	IF ~~ THEN REPLY @2861 /* ~Perhaps another time.~ */ EXIT
	END

	IF~~THEN BEGIN bst_11
    SAY @2853
    IF~~THEN REPLY @2854 GOTO bst_12
  	IF ~~ THEN REPLY @2861 /* ~Perhaps another time.~ */ EXIT
	END

	IF~~THEN BEGIN bst_12
    SAY @2855
    IF~~THEN REPLY @2856 GOTO bst_13
  	IF ~~ THEN REPLY @2861 /* ~Perhaps another time.~ */ EXIT
	END

	IF~~THEN BEGIN bst_13
    SAY @2857
    IF~~THEN REPLY @2858 GOTO bst_14
  	IF ~~ THEN REPLY @2861 /* ~Perhaps another time.~ */ EXIT
	END

	IF~~THEN BEGIN bst_14
    SAY @2859
    IF ~~ THEN
    SOLVED_JOURNAL @762
			DO~SetGlobal("bsGotAlmiranScroll","MYAREA",1)
				 EraseJournalEntry(@760)
				EraseJournalEntry(@761)~
    EXIT
	END

IF ~~ THEN scroll
SAY @2863
  + ~OR(2)
		Global("bsAlguineAnnoyed","GLOBAL",1)
		Global("bsDreamDone","GLOBAL",2)~ + @2864 + scroll_01
  + ~!Global("bsAlguineAnnoyed","GLOBAL",1)
	!Global("bsDreamDone","GLOBAL",2)~+ @2873 + scroll_01
  ++ @2865 + scroll_02
  ++ @2868 + scroll_03
  	IF ~~ THEN REPLY @2861 /* ~Perhaps another time.~ */ EXIT
END

IF ~~ THEN scroll_01
SAY @2866
IF ~~ THEN DO ~TakePartyItem("BSALMIRN") DestroyItem("BSALMIRN") SetGlobal("bsDrinHasScroll","MYAREA",1)~ EXIT
IF~Global("bsFreedUlf","GLOBAL",0)~THEN
		DO ~TakePartyItem("BSALMIRN") DestroyItem("BSALMIRN")
		EraseJournalEntry(@761)
		EraseJournalEntry(@762)
		AddJournalEntry(@770,QUEST_DONE)
		SetGlobal("bsFreedUlf","GLOBAL",-1)
		SetGlobal("bsDrinHasScroll","MYAREA",1)~
	EXIT
END

IF ~~ THEN scroll_02
SAY @2867
  + ~OR(2)
		Global("bsAlguineAnnoyed","GLOBAL",1)
		Global("bsDreamDone","GLOBAL",2)~ + @2864 + scroll_01
  + ~!Global("bsAlguineAnnoyed","GLOBAL",1)
	!Global("bsDreamDone","GLOBAL",2)~+ @2873 + scroll_01
  ++ @2868 + scroll_03
END

IF ~~ THEN scroll_03
SAY @2869
IF ~~ THEN DO ~TakePartyItem("BSALMIRN") DestroyItem("BSALMIRN") 
GiveGoldForce(1000) SetGlobal("bsDrinHasScroll","MYAREA",3)~ EXIT
END

IF ~~ THEN scroll_04
SAY @2872
IF ~~ THEN + scroll
END

IF WEIGHT #-1
~Global("bsDrinHasScroll","MYAREA",1)~ THEN scroll_reward
SAY @2870
IF ~~ THEN DO ~GiveItemCreate("ring46",[PC],0,0,0) SetGlobal("bsDrinHasScroll","MYAREA",2)~ EXIT
END

END //APPEND
