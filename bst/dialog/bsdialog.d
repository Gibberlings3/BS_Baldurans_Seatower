BEGIN bsdialog

IF ~Global("bsDream151","GLOBAL",3)~ THEN BEGIN 0
	SAY @9302
	=@9303
	=@9304
	=@9305
	IF~~THEN
		DO~SetGlobal("bsDream151","GLOBAL",4) SetGlobal("bsDreamDone","GLOBAL",1)~
	EXIT
END

// Test, test, test
IF ~Global("bsDreamComplete","GLOBAL",3)~ THEN BEGIN 1
	SAY@9306
	IF~~THEN REPLY @9307 GOTO 2
	IF~~THEN REPLY @9308 GOTO 3
	IF~~THEN REPLY @9309 GOTO 4
	IF~~THEN REPLY @9310 GOTO 5
	IF~~THEN REPLY @9311 GOTO 6
	IF~~THEN REPLY @9312 GOTO 7
END

IF~~THEN BEGIN 2
	SAY@9313
	IF~~THEN
		DO~SetGlobal("bsDreamDone","GLOBAL",1)
	ActionOverride(Protagonist,AddSpecialAbility("SPIN119"))
	//ActionOverride(Protagonist,MoveToSavedLocationn("bsBeginDream","GLOBAL"))				~
	EXIT
END

IF~~THEN BEGIN 3
	SAY@9313
	IF~~THEN
		DO~SetGlobal("bsDreamDone","GLOBAL",1)
ActionOverride(Protagonist,AddSpecialAbility("SPPR416"))
	//ActionOverride(Protagonist,MoveToSavedLocationn("bsBeginDream","GLOBAL"))		
~
	EXIT
END

IF~~THEN BEGIN 4
	SAY@9313
	IF~~THEN
		DO~SetGlobal("bsDreamDone","GLOBAL",1)
ActionOverride(Protagonist,AddSpecialAbility("SPIN958"))
	//ActionOverride(Protagonist,MoveToSavedLocationn("bsBeginDream","GLOBAL"))
~
	EXIT
END

IF~~THEN BEGIN 5
	SAY@9313
	IF~~THEN
		DO~SetGlobal("bsDreamDone","GLOBAL",1)ActionOverride(Protagonist,AddSpecialAbility("SPIN118"))
	//ActionOverride(Protagonist,MoveToSavedLocationn("bsBeginDream","GLOBAL"))
~
	EXIT
END

IF~~THEN BEGIN 6
	SAY@9313
	IF~~THEN
		DO~SetGlobal("bsDreamDone","GLOBAL",1)
ActionOverride(Protagonist,AddSpecialAbility("SPWI483"))
	//ActionOverride(Protagonist,MoveToSavedLocationn("bsBeginDream","GLOBAL"))
~
	EXIT
END

IF~~THEN BEGIN 7
	SAY@9313
	IF~~THEN
		DO~SetGlobal("bsDreamDone","GLOBAL",1)
ActionOverride(Protagonist,AddSpecialAbility("SPPR701"))
	//ActionOverride(Protagonist,MoveToSavedLocationn("bsBeginDream","GLOBAL"))
~
	EXIT
END

