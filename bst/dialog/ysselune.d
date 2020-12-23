BEGIN ysselune

// First time talked to
IF ~NumTimesTalkedTo(0)~ 1
  SAY @1015
  ++ @1016 + 2
  + ~Global("bsAskedForWork","LOCALS",0)~ + @1017 /* ~Anything going on here that would need an adventurer?~ */ DO ~SetGlobal("bsAskedForWork","LOCALS",1)~ + 21
  ++ @1018 + 3
  ++ @1019 + 4
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
  ++ @1028 + 2
  ++ @1019 + 4
  ++ @1020 + 5
END

IF ~~ 23
  SAY @1027 /* ~How would I know? What do you think I am - a gossip? I am a Priestess, remember!~ */
  ++ @1028 + 2
  ++ @1019 + 4
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
  ++ @1019 + 4
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
  ++ @1039 + 9
  ++ @1040 + 10
  ++ @1041 + 11
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
  ++ @1047 + 14
  ++ @1048 + 15
  ++ @1049 + 16
  ++ @1042 + 12
END

IF ~~ 11
  SAY @1050
  IF ~~ + 13
END

IF ~~ 12
  SAY @1051
  ++ @1034 + 7
  ++ @1019 + 6
  ++ @1020 + 5
END

IF ~~ 13
  SAY @1052
  ++ @1039 + 9
  ++ @1040 + 10
  ++ @1041 + 11
  ++ @1042 + 12
END

IF ~~ 14
  SAY @1053
  ++ @1048 + 15
  ++ @1049 + 16
  ++ @1054 + 12
END

IF ~~ 15
  SAY @1055
  ++ @1047 + 14
  ++ @1049 + 16
  ++ @1054 + 12
END

IF ~~ 16
  SAY @1056
  = @1057
  = @1058
  ++ @1047 + 14
  ++ @1048 + 15
  ++ @1054 + 12
END


// Second time talked to
IF ~NumTimesTalkedToGT(0)~ 17
  SAY @1059
  ++ @1034 + 7
  + ~Global("bsAskedForWork","LOCALS",0)~ + @1017 DO ~SetGlobal("bsAskedForWork","LOCALS",1)~ + 21
  ++ @1019 + 6
  ++ @1028 + 2
  ++ @1035 + 8
  ++ @1020 + 5
END