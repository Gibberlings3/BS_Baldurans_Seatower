/* interaction with Seatower Well in z_well_encounter.d */

/* fire element */
BEGIN bsfrelem

CHAIN
IF ~True()~ THEN bsfrelem fire_elemental
~The fire elemental is literally blocking the way to the alestore. It hovers in the least moist corner of the cellar and doesn't show any intentions of attacking you. It's flames seem to be dimmer than what you would expect.~
== ~%IMOEN_JOINED%~ IF ~InParty("%IMOEN_DV%") InMyArea("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @10250
== ~%AJANTIS_JOINED%~ IF ~InParty("ajantis") InMyArea("ajantis") !StateCheck("ajantis",CD_STATE_NOTVALID)~ THEN @10251
== ~%KAGAIN_JOINED%~ IF ~InParty("kagain") InMyArea("kagain") !StateCheck("kagain",CD_STATE_NOTVALID)~ THEN @10252
== ~%JAHEIRA_JOINED%~ IF ~InParty("jaheira") InMyArea("jaheira") !StateCheck("jaheira",CD_STATE_NOTVALID)~ THEN @10253
== ~%DYNAHEIR_JOINED%~ IF ~InParty("dynaheir") InMyArea("dynaheir") !StateCheck("dynaheir",CD_STATE_NOTVALID)~ THEN @10254
== bsfrelem IF ~PartyHasItem("bsbarrl1") Global("bsWoodBarrelInfo","LOCALS",0)~ THEN ~(You could try and trap the fire elemental in the wooden barrel, but it would probably eat through the wood rather quickly. The barrel would best have a fire-proof coating on the inside.)~ DO ~SetGlobal("bsWoodBarrelInfo","LOCALS",1)~
END
IF ~!PartyHasItem("bsbarrl3")~ THEN EXIT
+ ~PartyHasItem("bsbarrl3")~ + ~You trap the fire elemental inside the fire proof barrel.~ DO ~ActionOverride("bsfrelem",TakePartyItem("bsbarrl3")) ActionOverride("bsfrelem",DestroyItem("bsbarrl3")) GiveItemCreate("bsbarrl4",[PC],0,0,0) 
EraseJournalEntry(@909)
SetGlobal("bsFireElementQuest","GLOBAL",9)
SetGlobalTimer("bsFireElementTimer","GLOBAL",TWO_DAYS)~ UNSOLVED_JOURNAL @910 EXIT
+ ~PartyHasItem("bsbarrl3")~ + ~You refrain from using the barrel.~ EXIT



/* tower beacon guard */
BEGIN bsgrdbcn

IF ~NumTimesTalkedTo(0)~ THEN guard
SAY ~Stand away, citizen. Presence of civilians on the roof top is allowed, but we are here to ensure you stay safe.~
IF ~~ THEN + guard_01
END

IF ~NumTimesTalkedToGT(0)~ THEN guard_01
SAY ~Please stay away from the beacon. The fire is dangerous in various ways.~
+ ~PartyHasItem("bsbarrl4")~ + ~I have a trapped fire elemental here, I will release it into the flames.~ + guard_08
+ ~GlobalGT("bsFireElementQuest","GLOBAL",0)
GlobalLT("bsFireElementQuest","GLOBAL",9)
Global("bsElemental","LOCALS",0)~ + ~We have a fire elemental situation in the kitchen's storeroom...~ DO ~SetGlobal("bsElemental","LOCALS",1)~ + guard_05
+ ~Global("bsFireInfo","LOCALS",0)~ + ~I know that fire causes burns. What other dangers would there be?~ DO ~SetGlobal("bsFireInfo","LOCALS",1)~ + guard_04
+ ~Global("bsFireInfo","LOCALS",1)
Global("bsFireInfo1","LOCALS",0)~ + ~The fire attracts fire elementals? What exactly do you mean?~ DO ~SetGlobal("bsFireInfo1","LOCALS",1)~ + guard_07
+ ~Global("bsFireInfo","LOCALS",1)
Global("bsFireInfo2","LOCALS",0)~ + ~What do you do if a fire elemental comes out of the beacon flame?~ DO ~SetGlobal("bsFireInfo2","LOCALS",1)~ + guard_06
++ ~No worries, I will not cause any trouble.~ + guard_03
++ ~I will go wherever I want.~ + guard_02
END

IF ~~ THEN guard_02
SAY ~Well, as long as you stay away from the beacon that's fine by me.~
IF ~~ THEN EXIT
END

IF ~~ THEN guard_03
SAY ~Glad to hear it.~
IF ~~ THEN EXIT
END

IF ~~ THEN guard_04
SAY ~If the oil gets spilled it will cause severe burns and a great fire easily. Also, large fires always attract fire elementals, and they are usually unpredictable in their movements. They tend to stay inside the flames, though. If they don't, I am here to make sure they do not come far.~
+ ~Global("bsFireInfo1","LOCALS",0)~ + ~The fire attracts fire elementals? What exactly do you mean?~ DO ~SetGlobal("bsFireInfo1","LOCALS",1)~ + guard_07
+ ~Global("bsFireInfo2","LOCALS",0)~ + ~What do you do if a fire elemental comes out of the beacon flame?~ DO ~SetGlobal("bsFireInfo2","LOCALS",1)~ + guard_06
++ ~No worries, I will not cause any trouble.~ + guard_03
++ ~I will go wherever I want.~ + guard_02
END

IF ~~ THEN guard_05
SAY ~In the storeroom? I can assert that it did not emerge from the beacon fire. You'd need to inform the captain about this, I can't leave my post. Down there you probably need to kill it. Here we could push it back into the beacon flames but I wouldn't know how to get it up here without anyone getting injured.~
IF ~~ THEN UNSOLVED_JOURNAL @904 /* ~Fire Elemental in Seatower Storeroom

The Tower Beacon Guard implied the solution to put the fire elemental into the beacon flame on top of the tower - if we manage to find a container that will hold it for the transport.~ */ EXIT
END

IF ~~ THEN guard_06
SAY ~We usualy push them back into the flame. It usually doesn't take much effort, the air is way to moist around here for them to go far.~
+ ~Global("bsFireInfo1","LOCALS",0)~ + ~The fire attracts fire elementals? What exactly do you mean?~ DO ~SetGlobal("bsFireInfo1","LOCALS",1)~ + guard_07
++ ~No worries, I will not cause any trouble.~ + guard_03
++ ~I will go wherever I want.~ + guard_02
END

IF ~~ THEN guard_07
SAY ~Well, it's like a portal for them or so I heard. They can manifest in large fires like the beacon, and they can also use it to return to their home plane.~
+ ~Global("bsFireInfo2","LOCALS",0)~ + ~What do you do if a fire elemental comes out of the beacon flame?~ DO ~SetGlobal("bsFireInfo2","LOCALS",1)~ + guard_06
++ ~No worries, I will not cause any trouble.~ + guard_03
++ ~I will go wherever I want.~ + guard_02
END

IF ~~ THEN guard_08
SAY ~I see. Be careful around the hot flames!~
IF ~~ THEN EXIT
END



/* short dialogue lines for boy and man */

BEGIN bsboybcn
 
IF ~True()~ THEN boy
SAY ~The beacon is such a great fire! I want to be a beacon guard when I grow up!~
IF ~~ THEN EXIT
END

BEGIN bsmanbcn

IF ~True()~ THEN man
SAY ~(sigh) Every time we just stand here and stare at the flames - I guess I can understand why he likes it so much, I was young once, too.~
IF ~~ THEN EXIT
END


