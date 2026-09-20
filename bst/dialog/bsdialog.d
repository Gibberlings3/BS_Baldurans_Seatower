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

/* evil rewards */
IF ~Global("bsDreamComplete","GLOBAL",3)
Global("bsDreamEvil","GLOBAL",6)~ THEN BEGIN 1
	SAY @9306
	IF~~THEN REPLY #%StrRef_CauseSeriousWounds% /* ~Cause Serious Wounds% */ DO ~SetGlobal("bsDreamDone","GLOBAL",1)
	ActionOverride(Protagonist,AddSpecialAbility("bsppr414"))~ GOTO 2
	IF~~THEN REPLY @9308 /* ~Cloak of Fear~ */ DO ~SetGlobal("bsDreamDone","GLOBAL",1)
	ActionOverride(Protagonist,AddSpecialAbility("%spin203%"))~ GOTO 2
	IF~~THEN REPLY @9307 /* ~Contagion~ */ DO ~SetGlobal("bsDreamDone","GLOBAL",1)
	ActionOverride(Protagonist,AddSpecialAbility("bspwi409"))~ GOTO 2
	IF~~THEN REPLY #22624 /* ~Emotion, Hopelessness~ */ DO ~SetGlobal("bsDreamDone","GLOBAL",1)
	ActionOverride(Protagonist,AddSpecialAbility("bspwi411"))~ GOTO 2
	IF~~THEN REPLY #22618 /* ~Mental Domination~ */ DO ~SetGlobal("bsDreamDone","GLOBAL",1) ActionOverride(Protagonist,AddSpecialAbility("bsppr405"))~ GOTO 2
	IF~~THEN REPLY #20963 /* ~Polymorph Other~ */ DO ~SetGlobal("bsDreamDone","GLOBAL",1)
	ActionOverride(Protagonist,AddSpecialAbility("bspwi415"))~ GOTO 2
END

/* good rewards */
IF ~Global("bsDreamComplete","GLOBAL",3)
Global("bsDreamGood","GLOBAL",6)~ THEN BEGIN 1_1
	SAY @9306
	IF~~THEN REPLY #12114 /* ~Cure Serious Wounds~ */ DO ~SetGlobal("bsDreamDone","GLOBAL",1)
	ActionOverride(Protagonist,AddSpecialAbility("bsppr401"))~ GOTO 2
	IF~~THEN REPLY #12102 /* ~Free Action~ */ DO ~SetGlobal("bsDreamDone","GLOBAL",1) ActionOverride(Protagonist,AddSpecialAbility("bsppr403"))~ GOTO 2
	IF~~THEN REPLY @9311 /* ~Holy Power~ */ DO ~SetGlobal("bsDreamDone","GLOBAL",1)
	ActionOverride(Protagonist,AddSpecialAbility("bsppr412"))~ GOTO 2
	IF~~THEN REPLY @9310 /* ~Lesser Restoration~ */ DO ~SetGlobal("bsDreamDone","GLOBAL",1) ActionOverride(Protagonist,AddSpecialAbility("bsppr417"))~ GOTO 2
	IF~~THEN REPLY #12115 /* ~Neutralize Poison~ */ DO ~SetGlobal("bsDreamDone","GLOBAL",1) ActionOverride(Protagonist,AddSpecialAbility("bsppr404"))~ GOTO 2
	IF~~THEN REPLY #12087 /* ~Remove Curse~ */ DO ~SetGlobal("bsDreamDone","GLOBAL",1)
	ActionOverride(Protagonist,AddSpecialAbility("bspwi410"))~ GOTO 2
END

/* not good, not evil rewards */
IF ~Global("bsDreamComplete","GLOBAL",3)
GlobalLT("bsDreamGood","GLOBAL",6)
GlobalLT("bsDreamEvil","GLOBAL",6)~ THEN BEGIN 1_2
	SAY @9306
	IF~~THEN REPLY #12021 /* ~Improved Invisibility~ */ DO ~SetGlobal("bsDreamDone","GLOBAL",1) ActionOverride(Protagonist,AddSpecialAbility("bspwi405"))~ GOTO 2
	IF~~THEN REPLY #13003 /* ~Minor Globe of Invulnerability~ */ DO ~SetGlobal("bsDreamDone","GLOBAL",1) ActionOverride(Protagonist,AddSpecialAbility("bspwi406"))~ GOTO 2
	IF~~THEN REPLY #22177 /* ~Otiluke's Resilient Sphere */ DO ~SetGlobal("bsDreamDone","GLOBAL",1) ActionOverride(Protagonist,AddSpecialAbility("bspwi413"))~ GOTO 2
	IF~~THEN REPLY #%StrRef_SecretWord% /* ~Secret Word~ */ DO ~SetGlobal("bsDreamDone","GLOBAL",1) ActionOverride(Protagonist,AddSpecialAbility("bspwi419"))~ GOTO 2
	IF~~THEN REPLY #22608 /* ~Spirit Armor~ */ DO ~SetGlobal("bsDreamDone","GLOBAL",1) ActionOverride(Protagonist,AddSpecialAbility("bspwi414"))~ GOTO 2
	IF~~THEN REPLY @9312 /* ~Stoneskin~ */ DO ~SetGlobal("bsDreamDone","GLOBAL",1)
	ActionOverride(Protagonist,AddSpecialAbility("bspwi408"))~ GOTO 2
END

IF~~THEN BEGIN 2
	SAY @9313
	IF~~THEN EXIT
END



/* deprecated
// Test, test, test
IF ~Global("bsDreamComplete","GLOBAL",3)~ THEN BEGIN 1
	SAY @9306
	IF~~THEN REPLY @9307 /* ~Charm Person~ */ GOTO 2
	IF~~THEN REPLY @9308 /* ~Cloak of Fear~ */ GOTO 3
	IF~~THEN REPLY @9309 /* ~Cure Serious Wounds~ */ GOTO 4
	IF~~THEN REPLY @9310 /* ~Invisibility~ */ GOTO 5
	IF~~THEN REPLY @9311 /* ~Create Morningstar~ */ GOTO 6
	IF~~THEN REPLY @9312 /* ~Shield of the Archons~ */ GOTO 7
END

IF~~THEN BEGIN 2
	SAY @9313
	IF~~THEN
		DO~SetGlobal("bsDreamDone","GLOBAL",1)
	ActionOverride(Protagonist,AddSpecialAbility("%spin119%")) 
	//ActionOverride(Protagonist,MoveToSavedLocationn("bsBeginDream","GLOBAL"))
~
	EXIT
END

IF~~THEN BEGIN 3
	SAY @9313
	IF~~THEN
		DO~SetGlobal("bsDreamDone","GLOBAL",1)
ActionOverride(Protagonist,AddSpecialAbility("%spin203%")) 
	//ActionOverride(Protagonist,MoveToSavedLocationn("bsBeginDream","GLOBAL"))		
~
	EXIT
END

IF~~THEN BEGIN 4
	SAY @9313
	IF~~THEN
		DO~SetGlobal("bsDreamDone","GLOBAL",1)
ActionOverride(Protagonist,AddSpecialAbility("SPIN958"))
	//ActionOverride(Protagonist,MoveToSavedLocationn("bsBeginDream","GLOBAL"))
~
	EXIT
END

IF~~THEN BEGIN 5
	SAY @9313
	IF~~THEN
		DO~SetGlobal("bsDreamDone","GLOBAL",1)ActionOverride(Protagonist,AddSpecialAbility("SPIN118"))
	//ActionOverride(Protagonist,MoveToSavedLocationn("bsBeginDream","GLOBAL"))
~
	EXIT
END

IF~~THEN BEGIN 6
	SAY @9313
	IF~~THEN
		DO~SetGlobal("bsDreamDone","GLOBAL",1)
ActionOverride(Protagonist,AddSpecialAbility("SPWI483"))
	//ActionOverride(Protagonist,MoveToSavedLocationn("bsBeginDream","GLOBAL"))
~
	EXIT
END

IF~~THEN BEGIN 7
	SAY @9313
	IF~~THEN
		DO~SetGlobal("bsDreamDone","GLOBAL",1)
ActionOverride(Protagonist,AddSpecialAbility("bsspr701"))
	//ActionOverride(Protagonist,MoveToSavedLocationn("bsBeginDream","GLOBAL"))
~
	EXIT
END
*/

