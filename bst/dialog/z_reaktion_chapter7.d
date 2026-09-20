/* tower guards: will bring PC in front of the commander if doppelganger invasion was revealed */
BEGIN bsch7grd
IF ~GlobalGT("bs_CityKnowsBSTDoppel","GLOBAL",0)
Global("bs_TowerArrestCh7","GLOBAL",0)~ THEN tower_arrest
SAY @0 /* Hold there, <CHARNAME>! You are accused of murder, the Flaming Fist is looking for you all over the city. Our commander requests to see you. You have no choice but to follow us quietly. */
IF ~~ THEN DO ~SetGlobal("bs_TowerArrestCh7","GLOBAL",1) ClearAllActions() StartCutSceneMode() StartCutScene("bscut011")~ EXIT
END

/* commander: will let the PC go this once */
BEGIN bscmdch7
IF ~True()~ THEN arrested
SAY @1 /* You are wanted for the murder of the Iron Throne leaders. I have no choice but to hand you over to the Flaming Fist, <CHARNAME>. You helped us - and the city - very much by revealing the ongoing doppelganger invasion. I think it only fair to give you a chance to explain yourself. */
++ @2 /* What if I told you that I was fraimed, and that doppelgangers were involved as well? */ + arrested_01
++ @3 /* It was a setup. You just said yourself how it is posible to have people "see" a person doing things they never did. */ + arrested_02
++ @4 /* Yes, I killed them. But they were connected to the doppelganger ongoings and the general evil that came over this city and half of the Sword Coast. */ + arrested_05
++ @5 /* Do what you must. I guess I don't have a choice to prevent my arrest, anyway. */ DO ~SetGlobal("bs_TowerArrestCh7","GLOBAL",3)~ + arrested_03
END

IF ~~ THEN arrested_01
SAY @6 /* In that case... I would believe you. */
IF ~~ THEN + arrested_04
END

IF ~~ THEN arrested_02
SAY @7 /* Are you referring to doppelgangers? - Yes, I believe you. */
IF ~~ THEN + arrested_04
END

IF ~~ THEN arrested_03
SAY @8 /* Then so be it. My soldiers shall bring you to the Flaming Fist headquarters immediately. */
COPY_TRANS FFHUNT 2
END

IF ~~ THEN arrested_04
SAY @9 /* Fine. I will let you go - this once. Leave the tower as a free <PRO_MANWOMAN>, but do not come here again before the murder accusations are cleared. I will not be able to explain to my soldiers why they'd have to arrest you a second time. */
IF ~~ THEN DO ~SetGlobal("bs_TowerArrestCh7","GLOBAL",2) ClearAllActions() StartCutSceneMode() StartCutScene("bscut012")~ EXIT
END

IF ~~ THEN arrested_05
SAY @10 /* Hmm. This is a tough decision, <CHARNAME>. But - I believe you. */
IF ~~ THEN + arrested_04
END
