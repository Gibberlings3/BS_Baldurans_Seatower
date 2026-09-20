BEGIN ~YSMCOOK2~

// CHARNAME is a dwarf
IF ~OR(6)
Race(Player1,DWARF)
Race(Player2,DWARF)
Race(Player3,DWARF)
Race(Player4,DWARF)
Race(Player5,DWARF)
Race(Player6,DWARF)
		Global("ys_AppDwarf","MYAREA",0)~THEN BEGIN 10
	SAY@2044 /* ~'Oo - you're a dwarf. Cookie don't like dwarves.~ */
	IF ~~ THEN REPLY@2045 /* ~What??~ */ DO~SetGlobal("ys_AppDwarf","MYAREA",1)~ GOTO 11
	+ ~GlobalGT("bsCookSawDwarf","GLOBAL",0)~ + @2052 /* ~Yes, I noticed.~ */ DO~SetGlobal("ys_AppDwarf","MYAREA",1)~ EXIT
	IF~Race(Player1,DWARF)~THEN
	REPLY@2046 /* ~So what's new? I've heard that a few too many times for one lifetime.~ */ DO~SetGlobal("ys_AppDwarf","MYAREA",1)~ EXIT
	IF~~THEN REPLY @2040 /* ~Oh, alright.~ */ DO~SetGlobal("ys_AppDwarf","MYAREA",1)~ EXIT
END

// Fletcher quest
IF ~Global("ys_GetFeathers","GLOBAL",3)~THEN BEGIN 3
	SAY@2030 /* ~'Allo. Cookie been bending your ear again, 'as she? Wot can I do to 'elp?~ */
	IF~~THEN REPLY@2031 /* ~'Cookie' there says you've got two plump geese to pluck. The fletcher would like the feathers for his arrows.~ */ GOTO 4
	IF~~THEN REPLY@2032 /* ~Nothing.~ */ EXIT
END

IF ~~THEN BEGIN 4
	SAY@2033 /* ~Oh them old things. Get all over the kitchen they do. Take as many as you like.~ */
	IF~~THEN
	DO~EraseJournalEntry(@724) SetGlobal("ys_GetFeathers","GLOBAL",4)
	GiveItemCreate("ysgoosef",Player1,0,0,0)~
	REPLY@2034 /* ~Thank you.~ */ UNSOLVED_JOURNAL @723 EXIT
END

// Halfslinger quest
IF ~Global("ys_HalfslingerAle","GLOBAL",1)~THEN BEGIN 5
	SAY @2035 /* ~'Allo. Wot you want this time?~ */
	IF~~THEN REPLY @2036 /* ~A pot of ale...?~ */ GOTO 6
	IF~~THEN REPLY @2032 /* ~Nothing.~ */ EXIT
END

IF ~~ THEN BEGIN 6
	SAY @2037 /* ~A pot of ale??!! That's more than my life's worth to give you that! Umm. Cookie won't be too 'appy with you wanting that either.~ */
	IF~~THEN REPLY @2038 /* ~Are you sure you can't help?~ */ GOTO 7
	IF~Gender(Player1,MALE)~THEN REPLY @2039 /* ~I'll give you a big kiss.~ */ DO ~SetGlobal("bs_OfferedCookKiss","MYAREA",1)~ GOTO 8
	IF~Gender(Player1,FEMALE)~THEN REPLY @2039 /* ~I'll give you a big kiss.~ */ DO ~SetGlobal("bs_OfferedCookKiss","MYAREA",1)~ GOTO 9
	IF~~THEN
	DO~SetGlobal("ys_HalfslingerAle","GLOBAL",2)~
	REPLY @2040 /* ~Oh, alright.~ */ EXIT
END

IF ~~ THEN BEGIN 7
	SAY @2041 /* ~Nah. You'll 'ave to talk to Cookie about that.~ */
	IF~~THEN
	DO~SetGlobal("ys_HalfslingerAle","GLOBAL",2)~
	EXIT
END

IF ~~ THEN BEGIN 8
	SAY @2042 /* ~*giggle* Me boyfriend wouldn't like it. Nah. You'll 'ave to talk to Cookie.~ */
	IF~~THEN
	DO~SetGlobal("ys_HalfslingerAle","GLOBAL",2)~
	EXIT
END

IF ~~ THEN BEGIN 9
	SAY @2043 /* ~*shriek* but you're a girlie!! Uhh - no. Talk to Cookie, go on.~ */
	IF~~THEN
	DO~SetGlobal("ys_HalfslingerAle","GLOBAL",2)~
	EXIT
END




CHAIN
IF ~~ THEN ysmcook2 11
	@2047 /* ~Cookie don't like dwarves. You know - little hairy things like you. Says they're only here to steal her ale.~ */
== ysmcook2 IF ~Global("bsCookSawDwarf","GLOBAL",0)~ THEN @2051 /* ~You talk to cookie an' see.~ */
EXIT


APPEND ysmcook2

// Normal poor wit
IF ~Global("ysmcook2","LOCALS",0)~ THEN BEGIN 0
  SAY @2048 /* ~Go talk to her. I'm only the apprentice 'round here.~ */
  IF ~~ THEN DO ~SetGlobal("ysmcook2","LOCALS",1)~ EXIT
END

IF ~Global("ysmcook2","LOCALS",1)~ THEN BEGIN 1
  SAY @2049 /* ~Wot I said before.~ */
  IF ~~ THEN DO ~SetGlobal("ysmcook2","LOCALS",2)~ EXIT
END

IF ~True()~ THEN BEGIN 2
  SAY @2050 /* ~Some people 'ave got real cloth ears.~ */
  IF ~~ THEN EXIT
END

END //APPEND
