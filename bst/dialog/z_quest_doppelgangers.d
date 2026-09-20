/* PC discovered Seacave / corpse of the adjutant */

/* prison guard */
APPEND bsprgrd1
IF WEIGHT #-1
~Global("bsDoppelgangerQuest","GLOBAL",2)~ THEN doppelgangers_prg2
SAY @0 /* You should not have come here. */
IF ~~ THEN EXTERN bstrcmdr doppelgangers
END
END //APPEND

/* adjutant */
APPEND yssgt3
IF WEIGHT #-1
~Global("bsDoppelgangerQuest","GLOBAL",2)~ THEN doppelgangers_serj
SAY @1 /* You came into the commander's office! */
IF ~~ THEN EXTERN bstrcmdr doppelgangers
END
END //APPEND

/* Doppelgangers! */

CHAIN 
IF WEIGHT #-1
~Global("bsDoppelgangerQuest","GLOBAL",2)~ THEN bstrcmdr doppelgangers
@2 /* <CHARNAME> - why are you in my office? Make it quick. My adjutant just informed me that you're threatening the tower's safety. Are you here to threaten my life? */
== yssgt3 IF ~Global("bsJumpStartDGQuest","GLOBAL",0)~ THEN @3 /* Not the *tower's* safety, sir. I said "ours"! They found the breach in the prison walls. We are no longer ssssafe! */
== yssgt3 IF ~GlobalGT("bsJumpStartDGQuest","GLOBAL",0)~ THEN @4 /* Not the *tower's* safety, sir. I said "ours"! Ourssss... */
END
IF ~~ THEN DO ~SetInterrupt(FALSE)
ActionOverride("bstrcmdr",GiveItemCreate("MINHP1","bstrcmdr",0,0,0))
SetGlobal("bsDoppelgangerQuest","GLOBAL",3)
ActionOverride("bstrcmdr",FillSlot(SLOT_BELT))
//ActionOverride("yssgt3",ApplySpell(Myself,"bsdopsp1"))
//ActionOverride("bsprgrd1",ApplySpell(Myself,"bsdopsp2"))
ActionOverride("yssgt3",ReallyForceSpellRES("bsdopsp1","yssgt3"))
ActionOverride("bsprgrd1",ReallyForceSpellRES("bsdopsp2","bsprgrd1"))
SetInterrupt(TRUE)~ EXIT


APPEND bstrcmdr 

/* failsave dialogue in case the player clicks on the Commander before the script run */
IF WEIGHT #-1
~Global("bsDoppelgangerQuest","GLOBAL",3)~ THEN doppelganger_notyet
SAY @5 /* What is happening here?! */
IF ~~ THEN EXIT
END

IF WEIGHT #-1
~Global("bsDoppelgangerQuest","GLOBAL",4)~ THEN doppelgangers_01
SAY @6 /* Doppelgangers! My Tower is infiltrated by doppelgangers! I thank you for your help, <CHARNAME>, and the gods that sent you here! I have to inform Captain Dungarth and Master Shizell. I hope they are fine... */
IF ~~ THEN DO ~ActionOverride("bstrcmdr",ReallyForceSpellRES("SPPR607",Myself)) //Heal 
SetGlobal("bsDoppelgangerQuest","GLOBAL",5)
ClearAllActions()
StartCutSceneMode()
StartCutScene("bscut020")~ EXIT
END

END //APPEND

CHAIN
IF WEIGHT #-1
~Global("bsDoppelgangerQuest","GLOBAL",5)~ THEN bstrcmdr doppelgangers_02
@7 /* So, Captain Dungarth and Master Shizell have been informed and are preparing to unmask the doppelgangers amongst the soldiers. The Captain is calling the soldiers into the barracks for interrogation. Master Shizell has previously developed some magic to detect mimics within the Seatower's environs and he hopes to adapt it to work against doppelgangers. I will wait until I hear of progress from either the Captain or Master Shizell, and in the meantime will inform the Watch and the Flaming Fist about this danger. */
== bstrcmdr IF ~GlobalGT("bsJumpStartDGQuest","GLOBAL",0)~ THEN @8 /* It all started after my adjutant... after the monster impersonating my poor adjutant came back from investigating the prison after the guards found a stray Sahuagin wandering the halls. The other doppelganger you fought was one of the prison guards! */
== bstrcmdr IF ~GlobalGT("bsJumpStartDGQuest","GLOBAL",0)~ THEN @9 /* I have a very strong suspicion that the "dead end" my "adjutant" reported to me was not as dead as that thing wanted me to believe. I fear that we have a breach in the prison wall down there! */
== bstrcmdr IF ~Global("bsJumpStartDGQuest","GLOBAL",0)~ THEN  @10 /* Investigating the breach in the prison wall that thing mentioned is imperative. Where does it lead? Are there more doppelgangers waiting? We cannot send soldiers as long as we do not know who is real and who is a monster in disguise, but we need to make sure there are no more doppelgangers waiting to invade. */
== bstrcmdr IF ~GlobalGT("bsJumpStartDGQuest","GLOBAL",0)~ THEN @11 /* You are a group that made a name for themselves, both in the Nashkel mines and here. It would be foolish not to entrust you with a task. */
== bstrcmdr @12 /* The Seatower is in need of your services, <CHARNAME>. You are adventurers, and you have proven that you are capable of defending yourself. Please, investigate the breach in the prison wall and what awaits behind, I beg of you! I will reward you accordingly. Come back to me as quickly as you can. */
== bstrcmdr IF ~GlobalGT("bsJumpStartDGQuest","GLOBAL",0)~ THEN @13 /* Here, take this pass, it will grant you acces to the prison if you show it to the guards. */ 

END
IF ~~ THEN DO ~SetInterrupt(FALSE)
GiveItemCreate("bsprpass",[PC],1,0,0)
SetGlobal("bsGavePrisonPass","GLOBAL",1)
ActionOverride("bstrcmdr",DestroyItem("MINHP1"))
SetGlobal("bsKnowsBreakthrough","LOCALS",1)
SetGlobal("bsDoppelgangerQuest","GLOBAL",6)
SetGlobalTimer("bsDoppelgangerQuestTimer","GLOBAL",FIVE_DAYS)
EraseJournalEntry(@816)
EraseJournalEntry(@817)
AddJournalEntry(@823,QUEST)
SetInterrupt(TRUE)~ EXIT
IF ~Global("bsJumpStartDGQuest","GLOBAL",0)~ THEN DO ~SetInterrupt(FALSE)
ActionOverride("bstrcmdr",DestroyItem("MINHP1"))
SetGlobal("bsKnowsBreakthrough","LOCALS",1)
SetGlobal("bsDoppelgangerQuest","GLOBAL",6)
SetGlobalTimer("bsDoppelgangerQuestTimer","GLOBAL",FIVE_DAYS)
EraseJournalEntry(@816)
EraseJournalEntry(@817)
AddJournalEntry(@818,QUEST)
SetInterrupt(TRUE)~ EXIT


APPEND bstrcmdr 

IF WEIGHT #-1
~Global("bsDoppelgangerQuest","GLOBAL",6)
Global("bsAdditionalGreetingOnce","LOCALS",0)~ THEN doppelgangers_03
SAY @14 /* So, what did you find out? */
IF ~~ THEN DO ~SetGlobal("bsAdditionalGreetingOnce","LOCALS",1)~ + greeting_01
END

IF ~~ THEN doppelgangers_04
SAY @15 /* My poor adjutant! At least we will be able to bury him properly. I thank you for the info, I'll have his body retrieved as soon as possible. */ 
IF ~~ THEN DO ~EraseJournalEntry(@819)
EraseJournalEntry(@820)~ SOLVED_JOURNAL @821 + greeting_01
END

IF ~~ THEN doppelgangers_05
SAY @16 /* The Temple of... By the gods, why am I not surprised the Waterqueen's priestesses are connected to whatever is going on down there, somehow! Thank you for letting us know. The Watch and the Dukes will be interested is this as well. */
IF ~~ THEN + greeting_01
END

IF ~~ THEN doppelgangers_06
SAY @17 /* The Traitor's Tower - yes, I was aware of the *existence* of a path there, from our... questioning of the prisoner, but we did not have time to open it yet. Thank you for revealing it. We will see that it is closed properly! */
IF ~~ THEN + greeting_01
END

/* Reaktion to Sahuagin: moved into bstrcmdr.d
*/

IF ~~ THEN doppelgangers_08
SAY @18 /* Wonderful! You are capable of fighting these beasts and you are one of the few I currently believe to be who they say they are. Keep your eyes open! And report your findings to Captain Dungarth, he is coordinating the hunt. */
IF ~~ THEN + greeting_01
END

IF ~~ THEN doppelgangers_09
SAY @19 /* Let me know if you find anything new. Until then, good luck with your endeavors! */
IF ~~ THEN EXIT
END

IF ~~ THEN doppelgangers_10
SAY @20 /* Smugglers - replaced by doppelgangers? This would be a fine jest if the implications for the city were not so severe. */
IF ~~ THEN + greeting_01
END

END //APPEND

CHAIN
IF ~~ THEN bstrcmdr doppelgangers_11
@21 /* This is grave news, and of utmost importance! The Watch and the Council must be informed immediately. */
== bstrcmdr IF ~Global("DukeThanks","GLOBAL",0)~ THEN @22 /* To imagine the city's authorities infiltrated by doppelgangers... This would be a catastrophe. At least you disturbed them while they were still at preparing, so hopefully the losses won't be too high. */
== bstrcmdr IF ~Global("DukeThanks","GLOBAL",1) Global("bsJumpStartDGQuest","GLOBAL",0)~ THEN @23 /* After what happened at the ceremony we already knew that Sarevok infiltrated the city's nobles with doppelgangers. This seems to be a much broader problem than we acknowledged if they are also hiding among our soldiers! Additionally, I think we now know how they all entered the city... (sigh) This happened under my watch! */
== bstrcmdr IF ~Global("DukeThanks","GLOBAL",1) Global("bsJumpStartDGQuest","GLOBAL",1)~ THEN @24 /* After what happened at the ceremony we already knew that Sarevok infiltrated the city's nobles with doppelgangers. This seems to be a much broader problem than we acknowledged if they are also hiding among our soldiers. At least we have discovered how they entered the tower so we can stop their plans! */
END
IF ~~ THEN + doppelgangers_11_b

APPEND bstrcmdr

IF ~~ THEN doppelgangers_11_b
SAY @25 /* The most important information right now is that there do not seem to be more Doppelgangers waiting to enter the tower - or the city, at that. This is good news - for the moment. Here, take this as a reward for your services. If you encounter anything more down there, I would be interested in hearing of it. */
IF ~~ THEN DO ~GiveItemCreate("bstrnt03",[PC],0,0,0) AddExperienceParty(2500)
SetGlobal("bs_CityKnowsBSTDoppel","GLOBAL",1)~ + doppelgangers_13
IF ~GlobalGT("bsDoppelgangerQuest","GLOBAL",19)~ THEN DO ~GiveItemCreate("bstrnt03",[PC],0,0,0) AddExperienceParty(2500) SetGlobal("bs_CityKnowsBSTDoppel","GLOBAL",1)~ + greeting_01
END

IF ~~ THEN doppelgangers_12
SAY @26 /* So we found the smuggler tunnel at last! Thank you for the report. There have long been rumors about a smuggler's path going right from the shore into the city, but it was thought to have been sealed a long time ago, or so my predecessors thought. We will take care of this as soon as the current situation is resolved. */
IF ~~ THEN DO ~SetGlobal("bs_ReportedSmugglerTunnel","GLOBAL",1)~ + greeting_01
END

IF ~~ THEN doppelgangers_13
SAY @27 /* Captain Dungarth will shortly have assembled the soldiers in the barracks, and Master Shizell will have joined him there with his magic to reveal the doppelgangers. We will be ready to start unmasking them and there will likely be fighting. Will you help us? We could use your combat skills, especially since we do not know how many soldiers have been replaced. */
++ @28 /* Yes, of course. What would you have me do? */ + doppelgangers_18
++ @29 /* Yes, but first I need to stock up and rest a bit so I can be of any use. */ + doppelgangers_17
++ @30 /* No, I have other things to do. I am sure you can manage on your own. */ + doppelgangers_16 
END

IF WEIGHT #-1
~Global("bsDoppelgangerMissesPC","MYAREA",0)
!See(Player1)
GlobalGT("bsDoppelgangerQuest","GLOBAL",14)
GlobalLT("bsDoppelgangerQuest","GLOBAL",19)~ THEN doppelgangers_14_no_pc
SAY @31 /* You are one of <CHARNAME>'s companions, are you not? Tell <PRO_HIMHER> that I want to see <PRO_HIMHER>. */
IF ~~ THEN DO ~SetGlobal("bsDoppelgangerMissesPC","MYAREA",1)~ EXIT
END

IF WEIGHT #-1
~See(Player1)
GlobalGT("bsDoppelgangerQuest","GLOBAL",14)
GlobalLT("bsDoppelgangerQuest","GLOBAL",19)~ THEN doppelgangers_14
SAY @32 /* <CHARNAME>! Captain Dungarth told me the doppelganger threat is over. */
IF ~~ THEN + doppelgangers_20
END

IF ~~ THEN doppelgangers_15
SAY @33 /* I will continue communications with the Watch - and the Dukes - about the new doppelganger threat you encountered. Let me know how things fare. */
IF ~~ THEN DO ~SetGlobal("bsDoppelgangerInTower","GLOBAL",1) SetGlobal("bsDoppelgangerQuest","GLOBAL",7)
SetGlobalTimer("bsDoppelgangerQuestTimer","GLOBAL",TWO_DAYS)~ UNSOLVED_JOURNAL @861 EXIT
END

IF ~~ THEN doppelgangers_16
SAY @34 /* Fair enough. In case you change your mind, I expect we can drag out the troop assembly at least a day before we need to put our plan into action - but I doubt we will be able to push it any longer. */
IF ~~ THEN + doppelgangers_18
END

IF ~~ THEN doppelgangers_17
SAY @35 /* That should be possible, as long as you do not wait too long. I expect we can drag out the troop assembly at least a day before we need to put our plan into action. */
IF ~~ THEN + doppelgangers_18
END

IF ~~ THEN doppelgangers_18
SAY @36 /* Go to the barracks and talk to Captain Dungarth when you want to join the fight, and do it as soon as possible. Now that we are aware of the situation, we cannot waste any more time than necessary to settle this. */
IF ~~ THEN + doppelgangers_15
END

IF ~~ THEN doppelgangers_19
SAY @37 /* I see. Thank you for letting us know. We will do a sweep of the tower on our own then. I will make sure Captain Dungarth does it right away, we cannot afford do lose any more time. */
IF ~~ THEN DO ~SetGlobal("bsDGQuestAborted","GLOBAL",2) 
SetGlobal("bsDoppelgangerInTower","GLOBAL",11) 
SetGlobal("bsDoppelgangerQuest","GLOBAL",19) ClearAllActions() StartCutSceneMode() StartCutScene("bscut020")~ EXIT
END

END //APPEND


CHAIN
IF ~~ THEN bstrcmdr doppelgangers_20
@38 /* You helped me against the monster that was impersonating my adjutant and I haven't had time to properly thank you for that yet. */
== bstrcmdr IF ~GlobalGT("bsDoppelgangerQuest","GLOBAL",15)
!Global("bsDoppelgangerQuest","GLOBAL",19)~ THEN @39 /* You also helped reveal and defeat the doppelgangers hiding among the soldiers, for which I am grateful. */
== bstrcmdr IF ~Global("bsDGTannersHelp","GLOBAL",1)~ THEN @40 /* My Commander of the Guard seemed unhappy when he told me that in all this, the tannery's smell was actually to our advantage. I usually do not enjoy seeing my captain uneasy, but this once it provided me with some amusement. */
== bstrcmdr @41 /* You have performed a great service to the Seatower as well as me, personally. I said you would be compensated accordingly and you will. Please accept this reward as an appreciation of your efforts. */
END
IF ~~ THEN DO ~GiveItemCreate("bstrnt03",[PC],0,0,0) AddexperienceParty(2500)
EraseJournalEntry(@865)
SetGlobal("bsFoundSerjeante","GLOBAL",3)
SetGlobal("bsDoppelgangerQuest","GLOBAL",20)~ SOLVED_JOURNAL @866 EXIT
IF ~OR(2)
Global("bsDoppelgangerQuest","GLOBAL",16)
Global("bsDGQuestAborted","GLOBAL",4)~ THEN DO ~GiveItemCreate("bstrnt03",[PC],0,0,0) AddexperienceParty(3500)
EraseJournalEntry(@865)
SetGlobal("bsFoundSerjeante","GLOBAL",3)
SetGlobal("bsDoppelgangerQuest","GLOBAL",21)~ SOLVED_JOURNAL @866 EXIT
IF ~OR(2)
Global("bsDoppelgangerQuest","GLOBAL",17)
Global("bsDGQuestAborted","GLOBAL",5)~ THEN DO ~GiveItemCreate("bstrnt05",[PC],0,0,0) AddexperienceParty(4000)
EraseJournalEntry(@865)
SetGlobal("bsFoundSerjeante","GLOBAL",3)
SetGlobal("bsDoppelgangerQuest","GLOBAL",22)~ SOLVED_JOURNAL @866 EXIT
IF ~Global("bsDoppelgangerQuest","GLOBAL",18)~ THEN DO ~GiveItemCreate("bstrnt05",[PC],0,0,0) AddexperienceParty(5000)
EraseJournalEntry(@865)
SetGlobal("bsFoundSerjeante","GLOBAL",3)
SetGlobal("bsDoppelgangerQuest","GLOBAL",23)~ SOLVED_JOURNAL @866 EXIT

CHAIN
/* doppelganger threat is finished prematurely, either because PC told Seatower Commander so or timer run out */
IF WEIGHT #-1
~Global("bsDoppelgangerQuest","GLOBAL",19)~ THEN bstrcmdr doppelgangers_21
@42 /* The doppelganger threat to the tower is dealt with. Fortunately for us, Master Shizell's special magic ensured that we found all the doppelgangers that were hiding among the soldiers. */
== bstrcmdr @43 /* Unfortunately, the magic fumes he prepared lost its effectiveness quickly, and required conditions specific to the Seatower to work. If there are any more doppelgangers hiding in the city, the Watch and Flaming Fist will have to unmask them using force. */
END
IF ~~ THEN + doppelgangers_20

APPEND bstrcmdr 

IF ~~ THEN doppelgangers_22
SAY @44 /* Corpses?! - Are they the victims of the doppelganger doings? What a tragic find. It might give us clues to who was replaced amongst the authorities and patriar families. */
IF ~Global("bs_CityKnowsBSTDoppel","GLOBAL",1)~ THEN + greeting_01
IF ~Global("bs_CityKnowsBSTDoppel","GLOBAL",0)~ THEN + doppelgangers_11_b
END

IF ~~ THEN doppelgangers_23
SAY @45 /* if you found any clues amongst the dead, I would collect them and return them to the families. It would not only help us identify the victims - and with them, the dangers - but also enable the families to mourn for their lost ones. */
IF ~~ THEN + greeting_01
END

IF ~~ THEN doppelgangers_24
SAY @46 /* Please hand over what you found. */
+ ~GlobalGT("bs_Gavebsdprmhp","GLOBAL",0)
GlobalGT("bs_Gavebsdparst","GLOBAL",0)
GlobalLT("bsPCTookHeirloomsbs0113","GLOBAL",3)~ + @47 /* I gave all I found. */ DO ~ReputationInc(1)
SetGlobal("bsPCTookHeirloomsbs0113","GLOBAL",3)~ + doppelgangers_27
+ ~PartyHasItem("bsdprmhp") Global("bs_Gavebsdprmhp","GLOBAL",0)~ + @48 /* I found this magic silver ring. */ DO ~SetGlobal("bs_Gavebsdprmhp","GLOBAL",1)~ + doppelgangers_25
+ ~PartyHasItem("bsdparst") Global("bs_Gavebsdparst","GLOBAL",0)~ + @49 /* I found this green magic ring. */ DO ~SetGlobal("bs_Gavebsdparst","GLOBAL",1)~ + doppelgangers_25
+ ~Global("bsPCTookGoldrings","GLOBAL",0)
NumItemsParty("bsdprrh1",10)~ + @50 /* I found a total of 10 gold rings. */ DO ~SetGlobal("bsPCTookGoldrings","GLOBAL",1)~ + doppelgangers_26
/* postbone decision */
++ @51 /* I'll come back for this later. */ + greeting_01
END

IF ~~ THEN doppelgangers_25
SAY @52 /* Wonderful. I'll make sure it will be returned to the heirs of the owner. I am convinced they will get into contact with you themselves. */
IF ~~ THEN + doppelgangers_24
END

IF ~~ THEN doppelgangers_26
SAY @53 /* Indeed. Hmm, plain gold rings look rather generic, but maybe we will be able to identify some of the owners nontheles. */
IF ~~ THEN + doppelgangers_24
END

IF ~~ THEN doppelgangers_27
SAY @54 /* I understand. We will take care of this from here. */
IF ~~ THEN DO ~AddexperienceParty(500)~ + greeting_01
END

END //APPEND




//---------------------------------------------------------
/* Doppelgangers in the Seatower! PC was told to investigate the hole in the prison wall.
Global("bsDoppelgangerQuest","GLOBAL",6) */

/* the first comment also fires if PC didn't come to see the Captain before investigating and reporting to the Commander */

CHAIN
IF WEIGHT #-1
~OR(3)
	Global("bsDoppelgangerQuest","GLOBAL",6)
	Global("bsDoppelgangerQuest","GLOBAL",9)
	GlobalGT("bsDGQuestAborted","GLOBAL",0)
Global("bsSavedCommander","LOCALS",0)~ THEN bsstgc dg_search
 @55 /* Thank you for saving the commander's life! I wished I'd been there. Doppelgangers amongst my soldiers, this is not a laughing matter! */
== bsstgc IF ~Race(Player1,GNOME)~ THEN @56 /* I didn't think a gnome would have it in them. Very impressive to see one with your prowess! */
END
IF ~~ THEN DO ~SetGlobal("bsSavedCommander","LOCALS",1)~ + doppelgangerquest_03
IF ~Global("bsDoppelgangerQuest","GLOBAL",6) !Global("bsDoppelgangerTailor","GLOBAL",0)~ THEN DO ~SetGlobal("bsSavedCommander","LOCALS",1)~ + doppelgangerquest
IF ~GlobalGT("bsDGQuestAborted","GLOBAL",0)~ THEN DO ~SetGlobal("bsSavedCommander","LOCALS",1)~ + dgquest_aborted

CHAIN
IF ~~ THEN bsstgc doppelgangerquest
@57 /* All I can do is hold the peace while Master Shizell is preparing that magic of his - I really hope it will work as intended! Eliminating the false adjutant has unsettled them, so even without magical help I am sure it won't be long before the next one gives themselves away. */
== bsstgc IF ~!Race(Player1,GNOME)~ THEN @58 /* [PC is not gnome] Please go and investigate the breach in the prison wall. I don't know who among my soldiers to trust right now and you have proven to be trustworthy. */
== bsstgc IF ~Race(Player1,GNOME)~ THEN @59 /* [PC is gnome] I know the Seatower Commander asked you to investigate the breach in the prison wall. I'm not sure you'll be able to do much, but I don't know who to trust right now, and you have at least proven to be trustworthy. */
END
++ @60 /* I'll do that in a minute, but I wanted to check in with you first. */ + doppelgangerquest_01
++ @61 /* The commander said you are preparing to unmask the doppelgangers inside the tower. */ + doppelgangerquest_00
++ @62 /* Is there anything I can do here to help? */ + doppelgangerquest_01
+ ~!Race(Protagonist,GNOME)~ + @63 /* I'll be on my way. */ + doppelgangerquest_02
+ ~Race(Protagonist,GNOME)~ + @63 /* I'll be on my way. */ + doppelgangerquest_02_1

APPEND bsstgc

IF ~~ THEN doppelgangerquest_00
SAY @64 /* I called all off-duty soldiers to the barracks. I hope there are not too many of those monsters for us to be able to deal with. */
IF ~~ THEN + doppelgangerquest_02_1
IF ~!Race(Protagonist,GNOME)~ THEN + doppelgangerquest_02
END

IF ~~ THEN doppelgangerquest_01
SAY @65 /* Right now, investigating the breach in the prison wall would be the greatest help. Keep your eyes open, because as much as it unsettles me to admit it, we do not know who is a man and who is a monster in disguise. */
IF ~~ THEN + doppelgangerquest_00
END

IF ~~ THEN doppelgangerquest_02
SAY @66 /* I thank you for investigating the breach. Please report to the Seatower Commander as soon as you have scouted whatever lays on the other side. It will be a great help knowing whether we have to expect more of these monsters in the near future. */
IF ~~ THEN EXIT
END

IF ~~ THEN doppelgangerquest_02_1
SAY @67 /* I'm not sure what you'll accomplish but don't forget to report to the Seatower Commander as soon as you scouted whatever lays behind the prison breach. Just make sure you don't get into trouble down there, as we won't be able to send you help anytime soon. */
IF ~~ THEN EXIT
END

END //APPEND


/* Captain Dungarth and doppelgangers inside the barracks 
WEIGHT #-1 */
CHAIN
IF WEIGHT #-1
~Global("bsDoppelgangerQuest","GLOBAL",9) Global("bsDoppelSoldiersStart","MYAREA",0)~ THEN bsstgc doppelgangerquest_03
@68 /* The soldiers are assembled and Master Shizell has finished preparing his magic.  We are ready to start the fight. */
== bsstgc IF ~Race(Player1,GNOME)~ THEN @69 /* You have proven to be surprisingly useful so far, so I'll ask you for your aid as I would any other adventurer. */
END
IF ~~ THEN DO ~SetGlobal("bsDoppelSoldiersStart","MYAREA",1)~ + doppelgangerquest_04


APPEND bsstgc

IF ~~ THEN doppelgangerquest_04
SAY @70 /* Are you ready to help us root out the doppelgangers amongst our soldiers? */
+ ~NumDeadGT("bsdopp07",0) Global("bsDoppelgangerQ14","LOCALS",0)~ + @71 /* I have already found some within the tower. */ DO ~SetGlobal("bsDoppelgangerQ14","LOCALS",1)~ + doppelgangerquest_14
++ @72 /* Yes, I am ready. Bring them on. */ + doppelgangerquest_08
+ ~Race(Player1,GNOME)~ + @73 /* Sure, but only if you can tone down your disdain of gnomes. */ + doppelgangerquest_13
++ @74 /* I need to prepare first. */ + doppelgangerquest_07
++ @75 /* I will not fight alongside you. I am sure you will manage without me. */ + doppelgangerquest_05
END

IF ~~ THEN doppelgangerquest_05
SAY @76 /* I am sure we will manage. I doubt the doppelgangers have managed to replace the majority of my men. */
IF ~~ THEN + doppelgangerquest_06
END

IF ~~ THEN doppelgangerquest_06
SAY @77 /* Would you help scout the tower grounds for more doppelgangers? */
++ @78 /* Yes, I could do that. */ + doppelgangerquest_09
+ ~NumDeadGT("bsdopp07",0) Global("bsDoppelgangerQ14","LOCALS",0)~ + @79 /* Seems like I already found some within the tower. */ DO ~SetGlobal("bsDoppelgangerQ14","LOCALS",1)~ + doppelgangerquest_15
++ @80 /* No, I am needed elsewhere. I wish you good luck with your doppelganger infestation. */ + dg_search_02
END

IF ~~ THEN doppelgangerquest_07
SAY @81 /* Fine, but do not take too long. We need to do this soon. Let me know when you are ready. */
IF ~~ THEN DO ~SetGlobalTimer("bsDoppelgangerQuestTimer","GLOBAL",ONE_DAY)~ UNSOLVED_JOURNAL @867 EXIT
END

IF ~~ THEN doppelgangerquest_08
SAY @82 /* So that's it then. Master Shizell - do your magic. */
IF ~~ THEN DO ~EraseJournalEntry(@867)
SetGlobal("bsDoppelgangerQuest","GLOBAL",10) ClearAllActions() StartCutSceneMode() StartCutScene("bscut004")~ EXIT
END

END //APPEND

CHAIN
IF ~~ THEN bsstgc doppelgangerquest_09
@83 /* Very well. Master Shizell will provide you with some of his magic. */
== bstrmage @84 /* Yes, please take this. This is a bottle of my Mimic Powder. Er, it's actually a liquid now because I mixed it into the - never mind. Just walk it past a doppelganger and they will be driven to rage by the smell. Be prepared to fight them. */
== bsstgc @85 /* I really wish there was a more efficient way to draw them out. Unfortunately, spreading the scent throughout the tower by adding it to a fire caused the ingredients and magic to be burned off faster than it could spread with the smoke. */
== bsstgc @86 /* Well, the wind is also blowing the wrong direction, considering all I'm smelling today is that blasted tanner's stink. I can personally attest that some smells are able to increase *my* aggression level, with that example. */
END
IF ~~ THEN DO ~GiveItemCreate("bsdopdr",[PC],1,0,0) 
EraseJournalEntry(@861)
AddJournalEntry(@862,QUEST)
SetGlobalTimer("bsDoppelgangerQuestTimer","GLOBAL",TWO_DAYS)
SetGlobal("bs_MageUsesMimicPowder","GLOBAL",2)
SetGlobal("bsDoppelgangerQuest","GLOBAL",12)
SetGlobal("bsDoppelgangerInTower","GLOBAL",2)~ UNSOLVED_JOURNAL @860 EXIT

APPEND bsstgc

IF WEIGHT #-1
~Global("bsDoppelgangerQuest","GLOBAL",10)~ THEN doppelgangerquest_10
SAY @87 /* This is not over yet. I need to speak to <CHARNAME> when the barracks are clear. */
IF ~~ THEN EXIT
END

IF WEIGHT #-1
~GlobalGT("bsDoppelgangerQuest","GLOBAL",10)
GlobalLT("bsDoppelgangerQuest","GLOBAL",15)
Global("bsDGBarracksCleared","LOCALS",0)~ THEN doppelgangerquest_11
SAY @88 /* Ah, this feels a lot better, knowing the men I see here now are real. */
IF ~~ THEN + dg_search_00
IF ~Global("bsDoppelgangerQuest","GLOBAL",14)~ THEN + dg_search_05
IF ~Global("bsDoppelgangerQuest","GLOBAL",11)~ THEN DO ~SetGlobal("bsDGBarracksCleared","LOCALS",1)~ + doppelgangerquest_12
END

IF ~~ THEN doppelgangerquest_12
SAY @89 /* But there are still guards on duty - and civilians inside the tower. */
IF ~~ THEN + doppelgangerquest_06
END

IF ~~ THEN doppelgangerquest_13
SAY @90 /* Getting a bit cocky, are we? I'm not addressing you any different than I would to anyone else your talents. */
IF ~~ THEN + doppelgangerquest_08
END

IF ~~ THEN doppelgangerquest_14
SAY @91 /* I knew it! They became careless after their leaders were taken out. We should focus on rooting the fakes out among the ranks in the barracks now. */
IF ~~ THEN + doppelgangerquest_04
END

IF ~~ THEN doppelgangerquest_15
SAY @92 /* I knew it! They became careless after their leaders were taken out. Very good, very good! */
IF ~~ THEN + doppelgangerquest_06
END


IF WEIGHT #-1
~GlobalGT("bsDoppelgangerQuest","GLOBAL",11)
GlobalLT("bsDoppelgangerQuest","GLOBAL",14) Global("bsDoppelgangerTRCP","LOCALS",0)~ THEN dg_search_00
SAY @93 /* Master Shizell's magic is working great so far. Doppelgangers are just revealing themselves left and right without us needing to confront each and every one of them. */
IF ~~ THEN DO ~SetGlobal("bsDoppelgangerTRCP","LOCALS",1)~ + dg_search_01
END

IF ~~ THEN dg_search_01
SAY @94 /* How is the search going for you? Did you uncover any of those monsters? */
+ ~NumDeadGT("bsdopp07",0)~ + @95 /* I found some doppelgangers but I need to take a break, so I will stop looking for now. */ + dg_search_04
+ ~Global("bsDoppelgangerInTower","GLOBAL",5)~ + @96 /* I think I found all of them. I can't find anymore, at least. */ + dg_search_07
++ @97 /* I'm on it. */ + dg_search_03
+ ~Global("bsDoppTurnTower","GLOBAL",0)~ + @98 /* I won't help with your doppelganger problem. You'll have to solve it yourselves! */ + dg_search_02
END

IF ~~ THEN dg_search_02
SAY @99 /* Hmph. Fine. We will deal with this problem ourselves. */ 
IF ~~ THEN DO ~SetGlobal("bsDoppelgangerInTower","GLOBAL",8) ClearAllActions() StartCutSceneMode() StartCutScene("bscut006")~ EXIT
END

IF ~~ THEN dg_search_03
SAY @100 /* You are doing the tower a great service and will be rewarded accordingly. I am heading back to purging these monsters from the ranks of my soldiers! Report to me if you find any more of them. */
IF ~~ THEN EXIT
END

IF ~~ THEN dg_search_04
SAY @101 /* I see. We will finish scouting the premises on our own then. */
IF ~~ THEN DO ~SetGlobal("bsDoppelgangerInTower","GLOBAL",8) ClearAllActions() StartCutSceneMode() StartCutScene("bscut006")~ EXIT
END

END //APPEND

CHAIN
IF WEIGHT #-1
~Global("bsDoppelgangerInTower","GLOBAL",8)~ THEN bsstgc dg_search_05
@102 /* Thank you again for your help, especially in saving our Seatower Commander. This whole doppelganger incident could have gone horribly wrong without you turning up at the right moment! */
== bsstgc IF ~Race(Player1,GNOME)~ THEN @103 /* I can't stress how impressed I am to see such a fine gnome as you. I've always said there are heroes among every people! */
== bsstgc @104 /* I have known most of my men for a long time and I did *not* notice any changes. But it might be because whenever I enter the room, they all put on their professional faces. They all go "yes, sir!" and "aye, captain" and it's uncommon for me to encounter them in a more personal situation. */
== bsstgc @105 /* Go to the Seatower Commander and collect your reward. He wants to thank you personally for your help with this doppelganger invasion. */
== bstrmage IF ~InMyArea("bstrmage") !StateCheck("bstrmage",CD_STATE_NOTVALID)~ THEN @106 /* I'll be back in my study, in case someone needs me. */ 
END
/* PC cleared all DG in tower */
IF ~~ THEN DO ~EraseJournalEntry(@860)
EraseJournalEntry(@861)
EraseJournalEntry(@862)
EraseJournalEntry(@863)
EraseJournalEntry(@864)
EraseJournalEntry(@867)
SetGlobal("bsDoppelgangerQuest","GLOBAL",18) SetGlobal("bsDoppelgangerInTower","GLOBAL",10)~ UNSOLVED_JOURNAL @865 EXIT
/* PC did not clear all DG in tower */
IF ~GlobalGT("bsDoppelgangerQuest","GLOBAL",11)
GlobalLT("bsDoppelgangerInTower","GLOBAL",5)~ THEN DO ~EraseJournalEntry(@860)
EraseJournalEntry(@861)
EraseJournalEntry(@862)
EraseJournalEntry(@863)
EraseJournalEntry(@864)
EraseJournalEntry(@867)
SetGlobal("bsDoppelgangerQuest","GLOBAL",17) SetGlobal("bsDoppelgangerInTower","GLOBAL",11)~ UNSOLVED_JOURNAL @865 EXIT
/* PC helped only in the barracks */
IF ~Global("bsDoppelgangerQuest","GLOBAL",11)~ THEN DO ~EraseJournalEntry(@860)
EraseJournalEntry(@861)
EraseJournalEntry(@862)
EraseJournalEntry(@863)
EraseJournalEntry(@864)
EraseJournalEntry(@867)
SetGlobal("bsDoppelgangerQuest","GLOBAL",16) SetGlobal("bsDoppelgangerInTower","GLOBAL",11)~ UNSOLVED_JOURNAL @865 EXIT
/* PC didn't help at all */
IF ~GlobalLT("bsDoppelgangerQuest","GLOBAL",10)~ THEN DO ~EraseJournalEntry(@860)
EraseJournalEntry(@861)
EraseJournalEntry(@862)
EraseJournalEntry(@863)
EraseJournalEntry(@864)
EraseJournalEntry(@867)
SetGlobal("bsDoppelgangerQuest","GLOBAL",15) SetGlobal("bsDoppelgangerInTower","GLOBAL",11)~ UNSOLVED_JOURNAL @865 EXIT

CHAIN
IF WEIGHT #-1
~Global("bsDoppelgangerQuest","GLOBAL",14)
Global("dg_search_06","LOCALS",0)~ THEN bsstgc dg_search_06
@107 /* That was you, wasn't it? Spreading these fumes all over the place. */
DO ~SetGlobal("dg_search_06","LOCALS",1)~
== bsstgc IF ~Race(Player1,GNOME)~ THEN @108 /* That's just how you gnomes are, eh? Inventors through and through. */
== bsstgc @109 /* Doppelgangers popped up everywhere, striking out at everyone around them! */
== bstrmage IF ~InMyArea("bstrmage") !StateCheck("bstrmage",CD_STATE_NOTVALID)~ THEN @110 /* We also noticed how you did it. Smart decision, using the tanner's... */
== bsstgc @111 /* That "smart" decision to get help from the tanner will give us weeks of smug looks from that gnome. Hrmph. But yes, that was not a bad idea to make that gnome's stink useful. */
== bsstgc IF ~GlobalGT("bsTannerSport","GLOBAL",1)~ THEN @112 /* This definitely gives me a better lever to convince my soldiers to leave him alone in the future. There won't be one soldier here who isn't grateful for the tanner's help in unmasking these monsters. */
END
IF ~~ THEN EXIT
IF ~Global("bsDoppelgangerInTower","GLOBAL",5)~ THEN + dg_search_07

CHAIN
IF WEIGHT #-1
~Global("bsDoppelgangerInTower","GLOBAL",5)
OR(2)
Global("dg_search_06","LOCALS",1)
GlobalLT("bsDoppelgangerQuest","GLOBAL",14)~ THEN bsstgc dg_search_07
@113 /* It seems all doppelgangers are gone then! This is wonderful news. */
END
IF ~~ THEN + dg_search_05

APPEND bsstgc 

/* told to investigating the hole in the prison wall */
//in here for legacy reasons
IF WEIGHT #-1
~Global("bsDoppelgangerTailor","GLOBAL",0)
Global("bsDGFinishWallBreach","LOCALS",0)
Global("bsDoppelgangerQuest","GLOBAL",6)
OR(2)
Global("bs_ReportedSmugglerTunnel","GLOBAL",0)
Global("bsDGSmugglerTunnel","LOCALS",1)~ THEN investigate_wallbreach
SAY @114 /* The Commander asked you to investigate the breach in the prison wall, didn't he? Well, I suggest you report to him soon so I can have my men close the hole in the wall. */
IF ~~ THEN DO ~SetGlobal("bsDGFinishWallBreach","LOCALS",1)~ EXIT
END

/* Quest was aborted */
/* timer run out */
IF WEIGHT #-1
~GlobalGT("bsDGQuestAborted","GLOBAL",0)
Global("bsDGQuestAbortedCP","LOCALS",0)~ THEN dgquest_aborted
SAY @116 /* If you wanted to help with the doppelgangers inside the tower you are too late. */
IF ~~ THEN + dgquest_aborted_01
END

IF ~~ THEN dgquest_aborted_01
SAY @115 /* The whole doppelganger issue is settled now. The tower is clear, we made sure of that. */
IF ~~ THEN DO ~SetGlobal("bsDGQuestAbortedCP","LOCALS",1)~ EXIT
END
 END //APPEND

/* tower mage */

/* Tower mage and doppelganger in his study 
WEIGHT #-1 */

BEGIN bsdopp01

IF ~True()~ THEN dopp
SAY #5166
IF ~~ THEN DO ~SetGlobal("bsDoppelgangerDevice","MYAREA",1) Polymorph(DOPPLEGANGER) Enemy()~ EXIT
END

APPEND bstrmage
IF WEIGHT #-1
~Global("bsDoppelgangerQuest","GLOBAL",6) 
Global("bsDoppelgangerDevice","MYAREA",0)
!Dead("bsdopp01")~ THEN test_device_01
SAY @117 /* Just one drop... and - */
IF ~~ THEN DO ~SetGlobal("bsDoppelgangerDevice","MYAREA",1) ClearAllActions() StartCutSceneMode() StartCutScene("bscut003")~ EXIT
END

END //APPEND

CHAIN
IF WEIGHT #-1
~Global("bsDoppelgangerQuest","GLOBAL",6) 
Global("bsDoppelgangerDevice","MYAREA",1)
Dead("bsdopp01")
Global("bs_MageUsesMimicPowder","GLOBAL",0)~ THEN bstrmage test_device_02
@118 /* Ha! It works! It works! Er... sorry about that. It was meant to be held by the restraints. */
== bstrmage IF ~Global("bsBlackPearlQuest","GLOBAL",0)~ THEN @119 /* I am Master Shizell, the Seatower Mage. Nice to meet you. */
END
++ @120 /* What was that?! It is dangerous to just let a doppelganger loose like that. */ DO ~SetGlobal("bs_MageUsesMimicPowder","GLOBAL",1)~ + test_device_03
++ @121 /* Was that your magical solution for the doppelgangers that the commander mentioned? */ DO ~SetGlobal("bs_MageUsesMimicPowder","GLOBAL",1)~ + test_device_04
++ @122 /* How are we supposed to trust your magic will work as intended against the dopplegangers if you can't even control your experiments? */ DO ~SetGlobal("bs_MageUsesMimicPowder","GLOBAL",1)~ + test_device_03
++ @123 /* Your magic seems to work against the doppelgangers. Can I have some for my own purposes? */ DO ~SetGlobal("bs_MageUsesMimicPowder","GLOBAL",1)~ + test_device_06
++ @124 /* I don't have time to talk to you. I'll be going. */ DO ~SetGlobal("bs_MageUsesMimicPowder","GLOBAL",1)~ + dp_quest_02

APPEND bstrmage

IF ~~ THEN test_device_03
SAY @125 /* Yes, I know. I am sorry. */
IF ~~ THEN + test_device_05
END

IF ~~ THEN test_device_04
SAY @126 /* Indeed it was! */
IF ~~ THEN + test_device_05
END

IF ~~ THEN test_device_05
SAY @127 /* That the doppelganger became hostile was actually a good sign, as it shows that my mimic powder is working and is potent enough. */
IF ~~ THEN + doppelgangerquest_01
END

IF ~~ THEN test_device_06
SAY @128 /* Most certainly! Unfortunately, this drop of mimic powder was the only one I had, for now. */
IF ~~ THEN + doppelgangerquest_01
END

IF WEIGHT #-1
~Global("bsDoppelgangerQuest","GLOBAL",6) 
Global("bsDoppelgangerDevice","MYAREA",0)
Dead("bsdopp01")
Global("bs_MageUsesMimicPowder","GLOBAL",0)~ THEN doppelgangerquest
SAY @129 /* Yes, sorry about the surprise doppelganger inside my study. I needed it to test my mimic powder. */
IF ~~ THEN DO ~SetGlobal("bs_MageUsesMimicPowder","GLOBAL",1)~ + doppelgangerquest_01
END

IF ~~ THEN doppelgangerquest_01
SAY @130 /* I mean it was originally *meant* as a mimic powder, which we had need of to deal with another situation some time ago. Due to the obvious situation on our hands, in order to save time I've used the same base in the creation of an alchemical solution to unmask the doppelgangers currently plaguing us. And it works! The doppelganger you saw here became so irritated by my mimic powder it was driven to change into its natural form and attack. */
= @131 /* I will prepare more using the secretions of the doppelgangers you killed in the commander's office, and as soon as Captain Dungarth is ready I will provide everyone with some of my new and improved mimic powder to help us root out this monster infestation. */
= @132 /* I know the commander asked you to investigate the breach in the prison wall - make sure you do so, because the last thing we want is to have additional doppelganger reinforcement show up just as we have a solution to unmask the ones already here. */
IF ~~ THEN + dp_quest_02
END

IF ~~ THEN dp_quest_02
SAY @133 /* I need to warn you. Whatever awaits behind that breach will be dangerous, and probably crawled out of the depths of the sea. The Seatower Prison is so secure and can contain the most dangerous criminals, not because the guards are so brutal, but because any attempt of fleeing leads to the prisoners being swallowed up by the sea itself. Seems like what protected the city from the inmates is the source of our problems. Good luck down there. */
IF ~~ THEN + open_shop
IF ~Global("bsBlackPearlQuest","GLOBAL",0)~ THEN + dp_quest_03
END

/* In case PC never spoke to mage before: give quest for black pearl */
IF ~~ THEN dp_quest_03
SAY @134 /* If there is indeed a seacave behind the prison breach then I'm hoping against hope that it contains a tide pool protected from the waves. If conditions are right then it might just be the perfect place to find a black pearl. Ah, that would be my luck as I know it - sitting on a black pearl for years without knowing it. Well, sort of. Not that I would have ever found that cave myself or knew it existed. Just in case you do find a black pearl, please allow me to buy it from you. */
IF ~GlobalLT("bsFoundBlackPearl","GLOBAL",3)~ THEN DO ~EraseJournalEntry(@850) AddJournalEntry(@851,QUEST) SetGlobal("bsBlackPearlQuest","GLOBAL",1) SetGlobal("bsPearlLocation","LOCALS",1)~ + open_shop
IF ~GlobalGT("bsFoundBlackPearl","GLOBAL",2)~ THEN DO ~SetGlobal("bsBlackPearlQuest","GLOBAL",1) SetGlobal("bsPearlLocation","LOCALS",1)~ + open_shop
END

IF ~~ THEN dp_quest_04
SAY @135 /* Doppelgangers are masters in deception, but that is also their downfall. Doppelgangers become aggressive when they are discovered or their disguise starts to fail.  Since they tend to be more effective combatants in their natural form, they will almost invariably shift even though this means they can be more easily targeted and brought down. This is our most effective "weapon" we have against them - causing them to slip up in their deception and drop their disguise. */
= @136 /* This liquid gives off odors they find irritating to the point that they'll often be driven into a rage and attack. */
= @137 /* It works better here on the tower premises than probably elsewhere. In fact, it I suspect it won't work elsewhere at *all*. I am not sure why this is - I assume it's something to do with how an environmental factor combines with my potion.  Perhaps its the sea breeze mixing with the tannery odors, as much as individuals like the Captain don't like hearing this, but I do not know for sure. I will need to study this further - once I'll get a replenishment of the rare ingredients from Calimshan needed for the base. */
IF ~~ THEN EXIT
END

IF ~~ THEN dp_quest_05
SAY @138 /* Yes, please talk to the Captain, he will coordinate the fight. */
IF ~~ THEN EXIT
END

END //APPEND

/* Civilian outside the barracks, complaining about the tanner's stink */

BEGIN bsdpciv

IF ~True()~ THEN stinkcomplain
SAY @139 /* Ugh, I'll take my leave from this 'famous Seatower'. The guard is incredibly on edge today and the tanner's *stink* is just hanging over the whole area.  It has quite ruined any sense of romantic coastal vistas - and my appetite. Good day to you. */
IF ~~ THEN DO ~EscapeAreaDestroy(5)~ UNSOLVED_JOURNAL @863 EXIT
END



/* Tailor */

BEGIN bstailor

IF ~NumTimesTalkedTo(0) Global("bsDoppelAttacked","MYAREA",0)~ THEN unsuspicious
SAY @140 /* Ah - I am so sorry. I am Master Usher, tailor of the finest clothes, but I am afraid I cannot help you at this time.  I'm completely booked up and I can only serve customers with an appointment for the time being. */
IF ~~ THEN + farewell
END

IF ~Global("bsDoppelAttacked","MYAREA",0)~ THEN farewell
SAY @141 /* You can have a look around, <PRO_LADYLORD>, but I beg your understanding that I will not be able to serve you. Farewell. */
IF ~~ THEN EXIT
END

IF ~Global("bsDoppelAttacked","MYAREA",1)~ THEN transformation
SAY @142 /* So, you found out about our little secret. You will not get away with thissss! */
IF ~~ THEN DO ~ReallyForceSpellRES("bsdopsp5",Myself)~ EXIT
END

/* Tailor's assistant */

BEGIN bstail02

IF ~Global("bsFoundExitDocks","GLOBAL",0)~ THEN greetings
SAY @143 /* Master Usher is such an artist! His clothes are magnificent. */
IF ~~ THEN EXIT
END

IF ~Global("bsFoundExitDocks","GLOBAL",1)~ THEN doppel
SAY @144 /* SsssssSSSSssss! */
IF ~~ THEN EXIT
END

/* Mimic Fledgling */

BEGIN bsmimic1

CHAIN
IF ~Global("bsOpenMimic","MYAREA",0)~ THEN bsmimic1 first_warning
@145 /* (You realize that the chest you were trying to open is in fact a mimic fledgling. It doesn't seem too hostile, but you are sure that either bothering it again or lingering in its presence will lead to a fight.) */
== ~%IMOEN_JOINED%~ IF ~InParty("%IMOEN_DV%") InMyArea("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @10100
== ~%JAHEIRA_JOINED%~ IF ~InParty("jaheira") InMyArea("jaheira") !StateCheck("jaheira",CD_STATE_NOTVALID)
InParty("%IMOEN_DV%") InMyArea("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @10101
== ~%JAHEIRA_JOINED%~ IF ~InParty("jaheira") InMyArea("jaheira") !StateCheck("jaheira",CD_STATE_NOTVALID)~ THEN @10102
== ~%IMOEN_JOINED%~ IF ~InParty("%IMOEN_DV%") InMyArea("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @10103
END
IF ~~ THEN DO ~SetGlobal("bsOpenMimic","MYAREA",1) CloseDoor("DOOR 04") SetGlobalTimer("bsTailorMimicTimer","GLOBAL",THREE_ROUNDS)~ EXIT


/* smuggler - doppelganger BS0111 */

BEGIN bssmgl07

BEGIN bssmgl06

IF ~AreaCheck("BS0111") Global("bsPCMetSmugglerDoppelgangers","GLOBAL",0)~ THEN surprise
SAY @146 /* What? Who are you and how did you get in here? */
+ ~Global("bsSmugglerQuest","GLOBAL",1)~ + @147 /* Actually I am here on behalf of Holger. He is wondering why you no longer talk to him. */ + surprise_01
++ @148 /* Smugglers? Why am I not surprised. */ EXTERN bssmgl07 surprise_02
++ @149 /* Who are you? */ EXTERN bssmgl07 surprise_02
++ @150 /* No time for pleasantries. Draw your weapons. */ EXTERN bssmgl07 surprise_02
END

IF ~~ THEN surprise_01
SAY @151 /* Ah, it's about time he sent reinforcements. We were... */
IF ~~ THEN EXTERN bssmgl07 surprise_02
END

CHAIN
IF ~~ THEN bssmgl07 surprise_02
@152 /* Juan, you remember the surprise we promised you for tonight? Now it happenssss. */
== bssmgl06 @153 /* What? */
END
IF ~~ THEN DO ~SetGlobal("bsPCMetSmugglerDoppelgangers","GLOBAL",1)~ EXIT

APPEND bssmgl06

IF ~AreaCheck("BS0111") GlobalLT("bsDoppelgangerChange","BS0111",2)
Global("bsPCMetSmugglerDoppelgangers","GLOBAL",1)~ THEN fight_still
SAY @154 /* Aaaaaah! */
IF ~~ THEN EXIT
END

IF ~AreaCheck("BS0111") Global("bsDoppelgangerChange","BS0111",2)~ THEN fight_over
SAY @155 /* What... what was *that*?! Doppelgangrs? All my comrades... doppelgangers! */
++ @156 /* How do I know you are not one of them? */ + fight_over_01
++ @157 /* And you are? */ + fight_over_02
++ @158 /* Get out of here fast, before I change my mind. */ + fight_over_04
++ @159 /* You're a smuggler? Prepare to die! */ + fight_over_05
END

IF ~~ THEN fight_over_01
SAY @160 /* Well, *I* know I'm not one of them! */
IF ~~ THEN + fight_over_02
END

IF ~~ THEN fight_over_02
SAY @161 /* My name is Juan, and I am a smuggler - no need to lie now! Last man standing from the smuggler cell operating under the Seatower. */
IF ~~ THEN + fight_over_03
END

IF ~~ THEN fight_over_03
SAY @162 /* Did you hear what Cimmon... I mean that thing said? They kept on talking about a "surprise" for tonight... I guess we know what that would have meant! You saved my life! */
+ ~Global("bsSmugglerQuest","GLOBAL",1)~ + @163 /* Holger was wondering why the tower cell was no longer talking to him. I think we know the reason now. */ + fight_over_08
++ @164 /* How did this happen? */ + fight_over_09
++ @165 /* What awaits me when I go up the stairs? */ + fight_over_10
++ @158 /* Get out of here fast, before I change my mind. */ + fight_over_07
++ @159 /* You're a smuggler? Prepare to die! */ + fight_over_06
END

IF ~~ THEN fight_over_04
SAY @166 /* They promised me a "surprise" for tonight... I guess we know what that would have meant! You saved my life! */
IF ~~ THEN + fight_over_07
END

IF ~~ THEN fight_over_05
SAY @167 /* I am! And you just saved my life from these monsters. */
IF ~~ THEN + fight_over_06
END

IF ~~ THEN fight_over_06
SAY @168 /* Sorry, I'm not sticking around long enough for you to kill me too! */
IF ~~ THEN DO ~SetGlobal("bsPCMetSmugglerDoppelgangers","GLOBAL",2)
ActionOverride("bssmgl06",EscapeAreaDestroy(5))~ EXIT
IF ~Global("bsSmugglerQuest","GLOBAL",1)~ THEN DO ~EraseJournalEntry(@832) SetGlobal("bsPCMetSmugglerDoppelgangers","GLOBAL",2)
ActionOverride("bssmgl06",EscapeAreaDestroy(5))~ UNSOLVED_JOURNAL @838 EXIT
END

IF ~~ THEN fight_over_07
SAY @169 /* Thanks, <PRO_MANWOMAN>! */
= @170 /* Gods! Those heavy, heavy boxes! They smuggled in doppelgangers! That's what they've been doing all along, haven't they? I'm sure they have! */
IF ~~ THEN DO ~SetGlobal("bsPCMetSmugglerDoppelgangers","GLOBAL",3)
ActionOverride("bssmgl06",EscapeAreaDestroy(5))~ EXIT
IF ~Global("bsSmugglerQuest","GLOBAL",1)~ THEN DO ~EraseJournalEntry(@832)
SetGlobal("bsPCMetSmugglerDoppelgangers","GLOBAL",3)
ActionOverride("bssmgl06",EscapeAreaDestroy(5))~ UNSOLVED_JOURNAL @838 EXIT
END

IF ~~ THEN fight_over_08
SAY @171 /* That we do! I can't believe I didn't notice anything... Everyone was replaced by doppelgangers! */
++ @164 /* How did this happen? */ + fight_over_09
++ @165 /* What awaits me when I go up the stairs? */ + fight_over_10
++ @158 /* Get out of here fast, before I change my mind. */ + fight_over_07
+ ~Global("bsSmugglerQuest","GLOBAL",1)~ + @172 /* Best you go and tell Holger yourself. */ + fight_over_07
++ @159 /* You're a smuggler? Prepare to die! */ + fight_over_06
END

IF ~~ THEN fight_over_09
SAY @173 /* I didn't notice anything in particular other than things seemed to slowly get out of hand somehow. They kept going on about problems here and there. Reinforcements gone missing and messages getting lost. I was getting quite nervous because they seemed to be focusing on other things and not caring about maintaining contact with the other cells! */
++ @165 /* What awaits me when I go up the stairs? */ + fight_over_10
++ @158 /* Get out of here fast, before I change my mind. */ + fight_over_07
+ ~Global("bsSmugglerQuest","GLOBAL",1)~ + @172 /* Best you go and tell Holger yourself. */ + fight_over_07
++ @159 /* You're a smuggler? Prepare to die! */ + fight_over_06
END

IF ~~ THEN fight_over_10
SAY @174 /* It's the shop where we fence our goods - I mean it was a shop, now it's a tailor because the shop owner went away and... Gods, they probably killed him, didn't they? And the tailor might be a doppelganger, as well. I'd be very careful when going up there if I was you. */
++ @164 /* How did this happen? */ DO ~SetGlobal("bsFoundExitDocks","GLOBAL",1)~ + fight_over_09
++ @158 /* Get out of here fast, before I change my mind. */ DO ~SetGlobal("bsFoundExitDocks","GLOBAL",1)~ + fight_over_07
+ ~Global("bsSmugglerQuest","GLOBAL",1)~ + @172 /* Best you go and tell Holger yourself. */ DO ~SetGlobal("bsFoundExitDocks","GLOBAL",1)~ + fight_over_07
++ @159 /* You're a smuggler? Prepare to die! */ DO ~SetGlobal("bsFoundExitDocks","GLOBAL",1)~ + fight_over_06
END

END //APPEND


/* Scar reacts to the eliminated Doppelganger threat */
/* after DG smugglers are defeated and reported to the Seatower Commander */

/* Global("CheckedSevenSuns","GLOBAL",2)
GlobalGT("AldethDopple","GLOBAL",15)
Global("DukeThanks","GLOBAL",0) */

CHAIN  
IF WEIGHT #-1
~Global("bs_CityKnowsBSTDoppel","GLOBAL",1)
!AreaCheck("%WyrmsCrossing%")
~ THEN SCAR scar_thanks
@175 /* Seatower Commander Airard has informed me that you have tracked down a smuggling route through which city authorities have been infiltrated with doppelgangers. You have done the city a great service, indeed. */
= @176 /* Let us hope that whoever tried to infest the city with such evil was stopped in time before it could spread too far - we will keep our eyes open and will be prepared. Take this as our token of gratitude. */
END
IF ~~ THEN DO ~GiveGoldForce(1000) SetGlobal("bs_CityKnowsBSTDoppel","GLOBAL",2)~ EXIT

/* heirloom reward messenger */
/* names from https://forgottenrealms.fandom.com/wiki/Nobility_of_Baldur%27s_Gate */


/*
bsdprmhp.itm - Ring of Life Force -> bsdprtco.itm Ring of Weapon Skill
bsdparst.itm  - Ring of Acid Immunity -> bsring42 Ring of Improved Invisibility

*/

BEGIN bsgenmes
CHAIN
IF ~Global("bs_SpawnRewardHeirloom","GLOBAL",2)~ THEN bsgenmes good_reward
@177 /* ~Greetings, <CHARNAME>! I am here on behalf of Patriar Families of Baldur's Gate to show their gratitude for your services regarding freeing the city of the doppelganger threat and handing in personal belongings of their victims.~ */
== bsgenmes IF ~GlobalGT("bs_Gavebsdprmhp","GLOBAL",0)~ THEN @178 /* Family Portyr sends their tranks and wants you to have this magic ring in exchange for the one you found, which belonged to Sir Dillard Portyr I. and was in the family's possessions for generations. */
== bsgenmes IF ~GlobalGT("bs_Gavebsdparst","GLOBAL",0)~ THEN @179 /* Family Tillerturn offers you this ring as a reward for handing in their magic family heirloom and thanks you for treating the matter discreetly. */
== bsgenmes @180 /* Fare thee well. */
END
IF ~GlobalGT("bs_Gavebsdprmhp","GLOBAL",0)
Global("bs_Gavebsdparst","GLOBAL",0)~ THEN DO ~GiveItemCreate("bsdprtco",Player1,0,0,0)
SetGlobal("bs_SpawnRewardHeirloom","GLOBAL",3)
ActionOverride("bsgenmes",EscapeAreaDestroy(5))~ EXIT
IF ~Global("bs_Gavebsdprmhp","GLOBAL",0)
GlobalGT("bs_Gavebsdparst","GLOBAL",0)~ THEN DO ~GiveItemCreate("bsring42",Player1,0,0,0)
SetGlobal("bs_SpawnRewardHeirloom","GLOBAL",3)
ActionOverride("bsgenmes",EscapeAreaDestroy(5))~ EXIT
IF ~GlobalGT("bs_Gavebsdprmhp","GLOBAL",0)
GlobalGT("bs_Gavebsdparst","GLOBAL",0)~ THEN DO ~GiveItemCreate("bsdprtco",Player1,0,0,0)
GiveItemCreate("bsring42",Player1,0,0,0)
SetGlobal("bs_SpawnRewardHeirloom","GLOBAL",3)
ActionOverride("bsgenmes",EscapeAreaDestroy(5))~ EXIT


/* content only for BGII part of BGT and EET */
/* another EasterEgg */
%EET_BGT_only_slash%%EET_BGT_only_asteriks%

/*
ring10.itm - plain gold ring: 15. Bring all for the Easter Egg in BGT/EET.

Global("bsPCTookGoldrings","GLOBAL",3)
GlobalGT("MakeStatue","GLOBAL",0)
bsdprrhi.itm - CHARNAME's Ring of Gratitude (CHA -> 18)
bsdprrh2.itm - CHARNAME's Ring of Gratitude (CHA +1 bonus) - if PC has CHA > 17.
*/

APPEND bsgenmes
IF ~Global("bsPCTookGoldrings","GLOBAL",5)~ THEN late_rings_reward
SAY @177 /* ~Greetings, <CHARNAME>! I am here on behalf of Patriar Families of Baldur's Gate to show their gratitude for your services regarding freeing the city of the doppelganger threat and handing in personal belongings of their victims.~ */
= @182 /* The families Vanthampur and Rillyn send you this magic ring as a token of their gratitude to return the wedding rings of their spouses. They want me to explicitely apologize for the long time it took them to decide to reward you at all. After your ... unfortunate disappearance from the city, the news about Trademeet's hero not only led to the knowledge of your whereabouts, but also to the realization that you are apparently still an advocate of law and order. Know that you still have supporters in Baldur's Gate, my <PRO_LADYLORD>. Fare thee well. */
IF ~~ THEN DO ~GiveItemCreate("bsdprrhi",Player1,0,0,0) SetGlobal("bsPCTookGoldrings","GLOBAL",6)
ReputationInc(1)
ActionOverride("bsgenmes",EscapeAreaDestroy(5))~ EXIT
IF ~CheckStatGT(Player1,17,CHR)
!HasItemEquiped("ring30",Player1)~ THEN DO ~GiveItemCreate("bsdprrh2",Player1,0,0,0) SetGlobal("bsPCTookGoldrings","GLOBAL",6)
ReputationInc(1)
ActionOverride("bsgenmes",EscapeAreaDestroy(5))~ EXIT
END

END //APPEND

%EET_BGT_only_asteriks%%EET_BGT_only_slash%



