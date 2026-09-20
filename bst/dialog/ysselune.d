BEGIN ysselune

// First time talked to
IF ~NumTimesTalkedTo(0)~ 1
  SAY @1015
  + ~Global("bs_adventurer","LOCALS",0)~ + @1016 DO ~SetGlobal("bs_adventurer","LOCALS",1)~ + 2
  + ~Global("bsAskedForWork","LOCALS",0)~ + @1017 /* ~Anything going on here that would need an adventurer?~ */ DO ~SetGlobal("bsAskedForWork","LOCALS",1)~ + 21
  ++ @1018 + 3
  ++ @1034 + 7
  + ~OR(12)
    HPPercentLT(Player1,100)
    HPPercentLT(Player2,100)
    HPPercentLT(Player3,100)
    HPPercentLT(Player4,100)
    HPPercentLT(Player5,100)
    HPPercentLT(Player6,100)
    !StateCheck(Player1,CD_STATE_NOTVALID)
    !StateCheck(Player2,CD_STATE_NOTVALID)
    !StateCheck(Player3,CD_STATE_NOTVALID)
    !StateCheck(Player4,CD_STATE_NOTVALID)
    !StateCheck(Player5,CD_STATE_NOTVALID)
    !StateCheck(Player6,CD_STATE_NOTVALID)~ + @1019 + 4
  ++ @1020 + 5
END

IF ~~ 21
  SAY @1023 /* ~Well, there's supposed to be a dark power lurking in the catacombs but no-one knows what it is, but of course, as a Priestess of Selune I can't condone rumours.~ */
  + ~Global("bsClearedCatacombs","GLOBAL",0)~ + @1024 /* ~A dark power?~ */ DO ~AddJournalEntry(@774,QUEST)
SetGlobal("bsClearedCatacombs","GLOBAL",1)~ + 22 
  + ~Global("bsClearedCatacombs","GLOBAL",0)~ + @1022 /* ~Is that all you know?~ */ DO ~AddJournalEntry(@774,QUEST)
SetGlobal("bsClearedCatacombs","GLOBAL",1)~ + 22 
  + ~GlobalGT("bsClearedCatacombs","GLOBAL",1)~ + @1021 /* ~The monks are already organizing help for this.~ */ + 23 
END

IF ~~ 22
  SAY @1025 /* ~So the monks say. They should keep the catacombs clean but no-one has been down there for days! They are so lazy, those monks! Pain-Bearer, fuff!!! Sleep-Weaver more like!~ */
  ++ @1026 /* ~Are you sure about that?~ */ + 23
  + ~Global("bs_adventurer","LOCALS",0)~ + @1028 DO ~SetGlobal("bs_adventurer","LOCALS",1)~ + 2
  ++ @1034 + 7
  + ~OR(12)
    HPPercentLT(Player1,100)
    HPPercentLT(Player2,100)
    HPPercentLT(Player3,100)
    HPPercentLT(Player4,100)
    HPPercentLT(Player5,100)
    HPPercentLT(Player6,100)
    !StateCheck(Player1,CD_STATE_NOTVALID)
    !StateCheck(Player2,CD_STATE_NOTVALID)
    !StateCheck(Player3,CD_STATE_NOTVALID)
    !StateCheck(Player4,CD_STATE_NOTVALID)
    !StateCheck(Player5,CD_STATE_NOTVALID)
    !StateCheck(Player6,CD_STATE_NOTVALID)~ + @1019 + 4
  ++ @1020 + 5
END

IF ~~ 23
  SAY @1027 /* ~How would I know? What do you think I am - a gossip? I am a Priestess, remember!~ */
  + ~Global("bs_adventurer","LOCALS",0)~ + @1028 DO ~SetGlobal("bs_adventurer","LOCALS",1)~ + 2
  ++ @1034 + 7
  + ~OR(12)
    HPPercentLT(Player1,100)
    HPPercentLT(Player2,100)
    HPPercentLT(Player3,100)
    HPPercentLT(Player4,100)
    HPPercentLT(Player5,100)
    HPPercentLT(Player6,100)
    !StateCheck(Player1,CD_STATE_NOTVALID)
    !StateCheck(Player2,CD_STATE_NOTVALID)
    !StateCheck(Player3,CD_STATE_NOTVALID)
    !StateCheck(Player4,CD_STATE_NOTVALID)
    !StateCheck(Player5,CD_STATE_NOTVALID)
    !StateCheck(Player6,CD_STATE_NOTVALID)~ + @1019 + 4
  ++ @1020 + 5
END

IF ~~ 2
  SAY @1029
  IF ~~ + 6
END

IF ~~ 3
  SAY @1030
  IF ~~ + 6
END

IF ~~ 4
  SAY @1031
  IF ~~ DO ~StartStore("ysselune",LastTalkedToBy())~ EXIT
END

IF ~~ 5
  SAY @1032
  IF ~~ EXIT
END

IF ~~ 6
  SAY @1033
  + ~Global("bsClearedCatacombs","GLOBAL",0)~ + @1017 DO ~AddJournalEntry(@774,QUEST)
SetGlobal("bsClearedCatacombs","GLOBAL",1)~ + 21
  ++ @1034 + 7
  + ~OR(12)
    HPPercentLT(Player1,100)
    HPPercentLT(Player2,100)
    HPPercentLT(Player3,100)
    HPPercentLT(Player4,100)
    HPPercentLT(Player5,100)
    HPPercentLT(Player6,100)
    !StateCheck(Player1,CD_STATE_NOTVALID)
    !StateCheck(Player2,CD_STATE_NOTVALID)
    !StateCheck(Player3,CD_STATE_NOTVALID)
    !StateCheck(Player4,CD_STATE_NOTVALID)
    !StateCheck(Player5,CD_STATE_NOTVALID)
    !StateCheck(Player6,CD_STATE_NOTVALID)~ + @1019 + 4
  ++ @1035 + 8
  ++ @1020 + 5
END

IF ~~ 7
  SAY @1036
  IF ~~ DO ~StartStore("ysselune",LastTalkedToBy())~ EXIT
END

IF ~~ 8
  SAY @1037
  = @1038
  + ~Global("bs_history","LOCALS",0)~ + @1039 DO ~SetGlobal("bs_history","LOCALS",1)~ + 9
  + ~Global("bs_worshippers","LOCALS",0)~ + @1040 DO ~SetGlobal("bs_worshippers","LOCALS",1)~ + 10
  + ~Global("bs_shar","LOCALS",0)~ + @1041 DO ~SetGlobal("bs_shar","LOCALS",1)~ + 11
  ++ @1042 + 12
END

IF ~~ 9
  SAY @1043
  = @1044
  = @1045
  IF ~~ + 13
END

IF ~~ 10
  SAY @1046
  + ~Global("bs_swordslady","LOCALS",0)~ + @1047 DO ~SetGlobal("bs_swordslady","LOCALS",1)~ + 14
  + ~Global("bs_oraclesmoon","LOCALS",0)~ + @1048 DO ~SetGlobal("bs_oraclesmoon","LOCALS",1)~ + 15
  + ~Global("bs_silverstars","LOCALS",0)~ + @1049 DO ~SetGlobal("bs_silverstars","LOCALS",1)~ + 16
  ++ @1042 + 12
END

IF ~~ 11
  SAY @1050
  IF ~~ + 13
END

IF ~~ 12
  SAY @1051
  ++ @1034 + 7
  + ~OR(12)
    HPPercentLT(Player1,100)
    HPPercentLT(Player2,100)
    HPPercentLT(Player3,100)
    HPPercentLT(Player4,100)
    HPPercentLT(Player5,100)
    HPPercentLT(Player6,100)
    !StateCheck(Player1,CD_STATE_NOTVALID)
    !StateCheck(Player2,CD_STATE_NOTVALID)
    !StateCheck(Player3,CD_STATE_NOTVALID)
    !StateCheck(Player4,CD_STATE_NOTVALID)
    !StateCheck(Player5,CD_STATE_NOTVALID)
    !StateCheck(Player6,CD_STATE_NOTVALID)~ + @1019 + 4
  ++ @1020 + 5
END

IF ~~ 13
  SAY @1052
  + ~Global("bs_history","LOCALS",0)~ + @1039 DO ~SetGlobal("bs_history","LOCALS",1)~ + 9
  + ~Global("bs_worshippers","LOCALS",0)~ + @1040 DO ~SetGlobal("bs_worshippers","LOCALS",1)~ + 10
  + ~Global("bs_shar","LOCALS",0)~ + @1041 DO ~SetGlobal("bs_shar","LOCALS",1)~ + 11
  ++ @1042 + 12
END

IF ~~ 14
  SAY @1053
  + ~Global("bs_oraclesmoon","LOCALS",0)~ + @1048 DO ~SetGlobal("bs_oraclesmoon","LOCALS",1)~ + 15
  + ~Global("bs_silverstars","LOCALS",0)~ + @1049 DO ~SetGlobal("bs_silverstars","LOCALS",1)~ + 16
  ++ @1054 + 12
END

IF ~~ 15
  SAY @1055
  + ~Global("bs_swordslady","LOCALS",0)~ + @1047 DO ~SetGlobal("bs_swordslady","LOCALS",1)~ + 14
  + ~Global("bs_silverstars","LOCALS",0)~ + @1049 DO ~SetGlobal("bs_silverstars","LOCALS",1)~ + 16
  ++ @1054 + 12
END

IF ~~ 16
  SAY @1056
  = @1057
  = @1058
  + ~Global("bs_swordslady","LOCALS",0)~ + @1047 DO ~SetGlobal("bs_swordslady","LOCALS",1)~ + 14
  + ~Global("bs_oraclesmoon","LOCALS",0)~ + @1048 DO ~SetGlobal("bs_oraclesmoon","LOCALS",1)~ + 15
  ++ @1054 + 12
END


// Second time talked to
IF ~NumTimesTalkedToGT(0)~ 17
  SAY @1059
  + ~Global("bsAskedForWork","LOCALS",0)~ + @1017 DO ~SetGlobal("bsAskedForWork","LOCALS",1)~ + 21
  ++ @1034 + 7
  + ~OR(12)
    HPPercentLT(Player1,100)
    HPPercentLT(Player2,100)
    HPPercentLT(Player3,100)
    HPPercentLT(Player4,100)
    HPPercentLT(Player5,100)
    HPPercentLT(Player6,100)
    !StateCheck(Player1,CD_STATE_NOTVALID)
    !StateCheck(Player2,CD_STATE_NOTVALID)
    !StateCheck(Player3,CD_STATE_NOTVALID)
    !StateCheck(Player4,CD_STATE_NOTVALID)
    !StateCheck(Player5,CD_STATE_NOTVALID)
    !StateCheck(Player6,CD_STATE_NOTVALID)~ + @1019 + 4
  + ~Global("bs_adventurer","LOCALS",0)~ + @1028 DO ~SetGlobal("bs_adventurer","LOCALS",1)~ + 2
  ++ @1035 + 8
  ++ @1020 + 5
END
