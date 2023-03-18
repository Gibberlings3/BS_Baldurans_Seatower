/* PC discovered sea cave / corpse of the adjutant */

/* prison guard */
APPEND bsprgrd1
IF WEIGHT #-1
~Global("bsDoppelgangerQuest","GLOBAL",2)~ THEN doppelgangers_prg2
SAY ~You should not have come here.~
IF ~~ THEN EXTERN bstrcmdr doppelgangers
END
END //APPEND

/* adjutant */
APPEND yssgt3
IF WEIGHT #-1
~Global("bsDoppelgangerQuest","GLOBAL",2)~ THEN doppelgangers_serj
SAY ~You came into the commander's office!~
IF ~~ THEN EXTERN bstrcmdr doppelgangers
END
END //APPEND

/* Doppelgangers! */

CHAIN 
IF WEIGHT #-1
~Global("bsDoppelgangerQuest","GLOBAL",2)~ THEN bstrcmdr doppelgangers
~<CHARNAME> - why are you in my office? Make it quick. My adjutant just informed me that you're threatening the tower's safety. Are you here to threaten my life?~
== yssgt3 IF ~Global("bsJumpStartDGQuest","GLOBAL",0)~ THEN ~Not the *tower's* safety, sir. I said "ours"! They found the breach in the prison walls. We are no longer ssssafe!~
== yssgt3 IF ~GlobalGT("bsJumpStartDGQuest","GLOBAL",0)~ THEN ~Not the *tower's* safety, sir. I said "ours"! Ourssss...~
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
SAY ~What is happening here?!~
IF ~~ THEN EXIT
END

IF WEIGHT #-1
~Global("bsDoppelgangerQuest","GLOBAL",4)~ THEN doppelgangers_01
SAY ~Doppelgangers! My Tower is infiltrated by doppelgangers! I thank you for your help, <CHARNAME>, and the gods that sent you here! I have to inform Captain Dungarth and Master Shizell. I hope they are fine...~
IF ~~ THEN DO ~ActionOverride("bstrcmdr",ReallyForceSpellRES("SPPR607",Myself)) //Heal 
SetGlobal("bsDoppelgangerQuest","GLOBAL",5)
ClearAllActions()
StartCutSceneMode()
StartCutScene("bscut007")~ EXIT
END

END //APPEND

CHAIN
IF WEIGHT #-1
~Global("bsDoppelgangerQuest","GLOBAL",5)~ THEN bstrcmdr doppelgangers_02
~So, Captain Dungarth and Master Shizell have been informed and are preparing to unmask the doppelgangers amongst the soldiers. The Captain is calling the soldiers into the barracks for interrogation. Master Shizell has previously developed some magic to detect mimics within the Seatower's environs and he hopes to adapt it to work against doppelgangers. I will wait until I hear of progress from either the Captain or Master Shizell, and in the meantime will inform the Watch and the Flaming Fist about this danger.~
== bstrcmdr IF ~GlobalGT("bsJumpStartDGQuest","GLOBAL",0)~ THEN ~It all started after my adjutant... after the monster impersonating my poor adjutant came back from investigating the prison after the guards found a stray Sahuagin wandering the halls. The other doppelganger you fought was one of the prison guards!~
== bstrcmdr IF ~GlobalGT("bsJumpStartDGQuest","GLOBAL",0)~ THEN ~I have a very strong suspicion that the "dead end" my "adjutant" reported to me was not as dead as that thing wanted me to believe. I fear that we have a breach in the prison wall down there!~
== bstrcmdr IF ~Global("bsJumpStartDGQuest","GLOBAL",0)~ THEN  ~Investigating the breach in the prison wall that thing mentioned is imperative. Where does it lead? Are there more doppelgangers waiting? We cannot send soldiers as long as we do not know who is real and who is a monster in disguise, but we need to make sure there are no more doppelgangers waiting to invade.~
== bstrcmdr IF ~GlobalGT("bsJumpStartDGQuest","GLOBAL",0)~ THEN ~You are the group that made a name for themselves in the Nashkel mines, are you not? I know Commander Scar was on the lookout for you. If the Flaming Fist would trust you enough to entrust you with a task, then so will we.~
== bstrcmdr ~The Seatower is in need of your services, <CHARNAME>. You are adventurers, and you have proven that you are capable of defending yourself. Please, investigate the breach in the prison wall and what awaits behind, I beg of you! I will reward you accordingly. Come back to me as quickly as you can.~
== bstrcmdr IF ~GlobalGT("bsJumpStartDGQuest","GLOBAL",0)~ THEN ~Here, take this pass, it will grant you acces to the prison if you show it to the guards.~ 

END
IF ~~ THEN DO ~SetInterrupt(FALSE)
GiveItemCreate("bsprpass",[PC],1,0,0)
SetGlobal("bsGavePrisonPass","GLOBAL",1)
ActionOverride("bstrcmdr",DestroyItem("MINHP1"))
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
SAY ~So, what did you find out?~
IF ~~ THEN DO ~SetGlobal("bsAdditionalGreetingOnce","LOCALS",1)~ + greeting_01
END

IF ~~ THEN doppelgangers_04
SAY ~My poor adjutant! At least we will be able to bury him properly. I thank you for the info, I'll have his body retrieved as soon as possible.~ 
IF ~~ THEN DO ~EraseJournalEntry(@819)
EraseJournalEntry(@820)~ SOLVED_JOURNAL @821 + greeting_01
END

IF ~~ THEN doppelgangers_05
SAY ~The Temple of... By the gods, why am I not surprised the Waterqueen's priestesses are connected to whatever is going on down there, somehow! Thank you for letting us know. The Watch and the Dukes will be interested is this as well.~
IF ~~ THEN + greeting_01
END

IF ~~ THEN doppelgangers_06
SAY ~The Traitor's Tower - yes, I was aware of the *existence* of a path there, from our... questioning of the prisoner, but we did not have time to open it yet. Thank you for revealing it. We will see that it is closed properly!~
IF ~~ THEN + greeting_01
END

IF ~~ THEN doppelgangers_07
SAY ~I was afraid there would be more of them. I thank you for taking care of this. The one my men captured died before we had the chance to talk to it - too many other things had to be dealt with before I got the time to question the sea creature.~ 
IF ~~ THEN + greeting_01
END

IF ~~ THEN doppelgangers_08
SAY ~Wonderful! You are capable of fighting these beasts and you are one of the few I currently believe to be who they say they are. Keep your eyes open! And report your findings to Captain Dungarth, he is coordinating the hunt.~
IF ~~ THEN + greeting_01
END

IF ~~ THEN doppelgangers_09
SAY ~Let me know if you find anything new. Until then, good luck with your endeavors!~
IF ~~ THEN EXIT
END

IF ~~ THEN doppelgangers_10
SAY ~Smugglers - replaced by doppelgangers? This would be a fine jest if the implications for the city were not so severe.~
IF ~~ THEN + greeting_01
END

END //APPEND

CHAIN
IF ~~ THEN bstrcmdr doppelgangers_11
~This is grave news, and of utmost importance! The Watch and the Council must be informed immediately.~
== bstrcmdr IF ~Global("DukeThanks","GLOBAL",0)~ THEN ~To imagine the city's authorities infiltrated by doppelgangers... This would be a catastrophe. At least you disturbed them while they were still at preparing, so hopefully the losses won't be too high.~
== bstrcmdr IF ~Global("DukeThanks","GLOBAL",1) Global("bsJumpStartDGQuest","GLOBAL",0)~ THEN ~After what happened at the ceremony we already knew that Sarevok infiltrated the city's nobles with doppelgangers. This seems to be a much broader problem than we acknowledged if they are also hiding among our soldiers! Additionally, I think we now know how they all entered the city... (sigh) This happened under my watch!~
== bstrcmdr IF ~Global("DukeThanks","GLOBAL",1) Global("bsJumpStartDGQuest","GLOBAL",1)~ THEN ~After what happened at the ceremony we already knew that Sarevok infiltrated the city's nobles with doppelgangers. This seems to be a much broader problem than we acknowledged if they are also hiding among our soldiers. At least we have discovered how they entered the tower so we can stop their plans!~
== bstrcmdr ~The most important information right now is that there do not seem to be more Doppelgangers waiting to enter the tower - or the city, at that. This is good news - for the moment. Here, take this as a reward for your services. If you encounter anything more down there, I would be interested in hearing of it.~
END
IF ~~ THEN DO ~GiveItemCreate("bstrnt03",[PC],0,0,0) AddExperienceParty(2500)~ + doppelgangers_13
IF ~Global("bsDoppelgangerQuest","GLOBAL",20)~ THEN DO ~GiveItemCreate("bstrnt03",[PC],0,0,0) AddExperienceParty(2500)~ + greeting_01


APPEND bstrcmdr 

IF ~~ THEN doppelgangers_12
SAY ~So we found the smuggler tunnel at last! Thank you for the report. There have long been rumors about a smuggler's path going right from the shore into the city, but it was thought to have been sealed a long time ago, or so my predecessors thought. We will take care of this as soon as the current situation is resolved.~
IF ~~ THEN + greeting_01
END

IF ~~ THEN doppelgangers_13
SAY ~Captain Dungarth will shortly have assembled the soldiers in the barracks, and Master Shizell will have joined him there with his magic to reveal the doppelgangers. We will be ready to start unmasking them and there will likely be fighting. Will you help us? We could use your combat skills, especially since we do not know how many soldiers have been replaced.~
++ ~Yes, of course. What would you have me do?~ + doppelgangers_18
++ ~Yes, but first I need to stock up and rest a bit so I can be of any use.~ + doppelgangers_17
++ ~No, I have other things to do. I am sure you can manage on your own.~ + doppelgangers_16 
END

IF WEIGHT #-1
~See(Player1)
GlobalGT("bsDoppelgangerQuest","GLOBAL",14)
GlobalLT("bsDoppelgangerQuest","GLOBAL",19)~ THEN doppelgangers_14
SAY ~<CHARNAME>! Captain Dungarth told me the doppelganger threat is over.~
IF ~~ THEN + doppelgangers_20
END

IF ~~ THEN doppelgangers_15
SAY ~I will continue communications with the Watch - and the Dukes - about the new doppelganger threat you encountered. Let me know how things fare.~
IF ~~ THEN DO ~SetGlobal("bsDoppelgangerInTower","GLOBAL",1) SetGlobal("bsDoppelgangerQuest","GLOBAL",7)
SetGlobalTimer("bsDoppelgangerQuestTimer","GLOBAL",TWO_DAYS)~ UNSOLVED_JOURNAL @861 EXIT
END

IF ~~ THEN doppelgangers_16
SAY ~Fair enough. In case you change your mind, I expect we can drag out the troop assembly at least a day before we need to put our plan into action - but I doubt we will be able to push it any longer.~
IF ~~ THEN + doppelgangers_18
END

IF ~~ THEN doppelgangers_17
SAY ~That should be possible, as long as you do not wait too long. I expect we can drag out the troop assembly at least a day before we need to put our plan into action.~
IF ~~ THEN + doppelgangers_18
END

IF ~~ THEN doppelgangers_18
SAY ~Go to the barracks and talk to Captain Dungarth when you want to join the fight, and do it as soon as possible. Now that we are aware of the situation, we cannot waste any more time than necessary to settle this.~
IF ~~ THEN + doppelgangers_15
END

IF ~~ THEN doppelgangers_19
SAY ~I see. Thank you for letting us know. We will do a sweep of the tower on our own then. I will make sure Captain Dungarth does it right away, we cannot afford do lose any more time.~
IF ~~ THEN DO ~SetGlobal("bsDGQuestAborted","GLOBAL",2) 
SetGlobal("bsDoppelgangerInTower","GLOBAL",11) 
SetGlobal("bsDoppelgangerQuest","GLOBAL",19) ClearAllActions() StartCutSceneMode() StartCutScene("bscut007")~ EXIT
END

END //APPEND


CHAIN
IF ~~ THEN bstrcmdr doppelgangers_20
~You helped me against the monster that was impersonating my adjutant and I haven't had time to properly thank you for that yet.~
== bstrcmdr IF ~GlobalGT("bsDoppelgangerQuest","GLOBAL",15)
!Global("bsDoppelgangerQuest","GLOBAL",19)~ THEN ~You also helped reveal and defeat the doppelgangers hiding among the soldiers, for which I am grateful.~
== bstrcmdr IF ~Global("bsDGTannersHelp","GLOBAL",1)~ THEN ~My Commander of the Guard seemed unhappy when he told me that in all this, the tannery's smell was actually to our advantage. I usually do not enjoy seeing my captain uneasy, but this once it provided me with some amusement.~
== bstrcmdr ~You have performed a great service to the Seatower as well as me, personally. I said you would be compensated accordingly and you will. Please accept this reward as an appreciation of your efforts.~
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
SetGlobal("bsDoppelgangerQuest","GLOBAL",20)~ SOLVED_JOURNAL @866 EXIT
IF ~OR(2)
Global("bsDoppelgangerQuest","GLOBAL",17)
Global("bsDGQuestAborted","GLOBAL",5)~ THEN DO ~GiveItemCreate("bstrnt05",[PC],0,0,0) AddexperienceParty(4000)
EraseJournalEntry(@865)
SetGlobal("bsFoundSerjeante","GLOBAL",3)
SetGlobal("bsDoppelgangerQuest","GLOBAL",20)~ SOLVED_JOURNAL @866 EXIT
IF ~Global("bsDoppelgangerQuest","GLOBAL",18)~ THEN DO ~GiveItemCreate("bstrnt05",[PC],0,0,0) AddexperienceParty(5000)
EraseJournalEntry(@865)
SetGlobal("bsFoundSerjeante","GLOBAL",3)
SetGlobal("bsDoppelgangerQuest","GLOBAL",20)~ SOLVED_JOURNAL @866 EXIT

CHAIN
/* doppelganger threat is finished prematurely, either because PC told Seatower Commander so or timer run out */
IF WEIGHT #-1
~Global("bsDoppelgangerQuest","GLOBAL",19)~ THEN bstrcmdr doppelgangers_21
~The doppelganger threat to the tower is dealt with. Fortunately for us, Master Shizell's special magic ensured that we found all the doppelgangers that were hiding among the soldiers.~
== bstrcmdr ~Unfortunately, the magic fumes he prepared lost its effectiveness quickly, and required conditions specific to the Seatower to work. If there are any more doppelgangers hiding in the city, the Watch and Flaming Fist will have to unmask them using force.~
END
IF ~~ THEN + doppelgangers_20






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
 ~Thank you for saving the commander's life! I wished I'd been there. Doppelgangers amongst my soldiers, this is not a laughing matter!~
== bsstgc IF ~Race(Player1,GNOME)~ THEN ~I didn't think a gnome would have it in them. Very impressive to see one with your prowess!~
END
IF ~~ THEN DO ~SetGlobal("bsSavedCommander","LOCALS",1)~ + doppelgangerquest_03
IF ~Global("bsDoppelgangerQuest","GLOBAL",6) !Global("bsDoppelgangerTailor","GLOBAL",1)~ THEN DO ~SetGlobal("bsSavedCommander","LOCALS",1)~ + doppelgangerquest
IF ~GlobalGT("bsDGQuestAborted","GLOBAL",0)~ THEN DO ~SetGlobal("bsSavedCommander","LOCALS",1)~ + dgquest_aborted_02
IF ~Global("bsDoppelgangerTailor","GLOBAL",0)
Global("bsDGQuestAborted","GLOBAL",1)~ THEN DO ~SetGlobal("bsSavedCommander","LOCALS",1)~ + dgquest_aborted

CHAIN
IF ~~ THEN bsstgc doppelgangerquest
~All I can do is hold the peace while Master Shizell is preparing that magic of his - I really hope it will work as intended! Eliminating the false adjutant has unsettled them, so even without magical help I am sure it won't be long before the next one gives themselves away.~
== bsstgc IF ~!Race(Player1,GNOME)~ THEN ~[PC is not gnome] Please go and investigate the breach in the prison wall. I don't know who among my soldiers to trust right now and you have proven to be trustworthy.~
== bsstgc IF ~Race(Player1,GNOME)~ THEN ~[PC is gnome] I know the Seatower Commander asked you to investigate the breach in the prison wall. I'm not sure you'll be able to do much, but I don't know who to trust right now, and you have at least proven to be trustworthy.~
END
++ ~I'll do that in a minute, but I wanted to check in with you first.~ + doppelgangerquest_01
++ ~The commander said you are preparing to unmask the doppelgangers inside the tower.~ + doppelgangerquest_00
++ ~Is there anything I can do here to help?~ + doppelgangerquest_01
+ ~!Race(Protagonist,GNOME)~ + ~I'll be on my way.~ + doppelgangerquest_02
+ ~Race(Protagonist,GNOME)~ + ~I'll be on my way.~ + doppelgangerquest_02_1

APPEND bsstgc

IF ~~ THEN doppelgangerquest_00
SAY ~I called all off-duty soldiers to the barracks. I hope there are not too many of those monsters for us to be able to deal with.~
IF ~~ THEN + doppelgangerquest_02_1
IF ~!Race(Protagonist,GNOME)~ THEN + doppelgangerquest_02
END

IF ~~ THEN doppelgangerquest_01
SAY ~Right now, investigating the breach in the prison wall would be the greatest help. Keep your eyes open, because as much as it unsettles me to admit it, we do not know who is a man and who is a monster in disguise.~
IF ~~ THEN + doppelgangerquest_00
END

IF ~~ THEN doppelgangerquest_02
SAY ~I thank you for investigating the breach. Please report to the Seatower Commander as soon as you have scouted whatever lays on the other side. It will be a great help knowing whether we have to expect more of these monsters in the near future.~
IF ~~ THEN EXIT
END

IF ~~ THEN doppelgangerquest_02_1
SAY ~I'm not sure what you'll accomplish but don't forget to report to the Seatower Commander as soon as you scouted whatever lays behind the prison breach. Just make sure you don't get into trouble down there, as we won't be able to send you help anytime soon.~
IF ~~ THEN EXIT
END

END //APPEND


/* Captain Dungarth and doppelgangers inside the barracks 
WEIGHT #-1 */
CHAIN
IF WEIGHT #-1
~Global("bsDoppelgangerQuest","GLOBAL",9) Global("bsDoppelSoldiersStart","MYAREA",0)~ THEN bsstgc doppelgangerquest_03
~The soldiers are assembled and Master Shizell has finished preparing his magic.  We are ready to start the fight.~
== bsstgc IF ~Race(Player1,GNOME)~ THEN ~You have proven to be surprisingly useful so far, so I'll ask you for your aid as I would any other adventurer.~
END
IF ~~ THEN DO ~SetGlobal("bsDoppelSoldiersStart","MYAREA",1)~ + doppelgangerquest_04


APPEND bsstgc

IF ~~ THEN doppelgangerquest_04
SAY ~Are you ready help us root out the doppelgangers amongst our soldiers?~
+ ~NumDeadGT("bsdopp07",0) Global("bsDoppelgangerQ14","LOCALS",0)~ + ~I have already found some within the tower.~ DO ~SetGlobal("bsDoppelgangerQ14","LOCALS",1)~ + doppelgangerquest_14
++ ~Yes, I am ready. Bring them on.~ + doppelgangerquest_08
+ ~Race(Player1,GNOME)~ + ~Sure, but only if you can tone down your disdain of gnomes.~ + doppelgangerquest_13
++ ~I need to prepare first.~ + doppelgangerquest_07
++ ~I will not fight alongside you. I am sure you will manage without me.~ + doppelgangerquest_05
END

IF ~~ THEN doppelgangerquest_05
SAY ~I am sure we will manage. I doubt the doppelgangers have managed to replace the majority of my men.~
IF ~~ THEN + doppelgangerquest_06
END

IF ~~ THEN doppelgangerquest_06
SAY ~Would you help scout the tower grounds for more doppelgangers?~
++ ~Yes, I could do that.~ + doppelgangerquest_09
+ ~NumDeadGT("bsdopp07",0) Global("bsDoppelgangerQ14","LOCALS",0)~ + ~Seems like I already found some within the tower.~ DO ~SetGlobal("bsDoppelgangerQ14","LOCALS",1)~ + doppelgangerquest_15
++ ~No, I am needed elsewhere. I wish you good luck with your doppelganger infestation.~ + dg_search_02
END

IF ~~ THEN doppelgangerquest_07
SAY ~Fine, but do not take too long. We need to do this soon. Let me know when you are ready.~
IF ~~ THEN DO ~SetGlobalTimer("bsDoppelgangerQuestTimer","GLOBAL",ONE_DAY)~ UNSOLVED_JOURNAL @867 EXIT
END

IF ~~ THEN doppelgangerquest_08
SAY ~So that's it then. Master Shizell - do your magic.~
IF ~~ THEN DO ~EraseJournalEntry(@867)
SetGlobal("bsDoppelgangerQuest","GLOBAL",10) ClearAllActions() StartCutSceneMode() StartCutScene("bscut004")~ EXIT
END

END //APPEND

CHAIN
IF ~~ THEN bsstgc doppelgangerquest_09
~Very well. Master Shizell will provide you with some of his magic.~
== bstrmage ~Yes, please take this. This is a bottle of my Mimic Powder. Er, it's actually a liquid now because I mixed it into the - never mind. Just walk it past a doppelganger and they will be driven to rage by the smell. Be prepared to fight them.~
== bsstgc ~I really wish there was a more efficient way to draw them out. Unfortunately, spreading the scent throughout the tower by adding it to a fire caused the ingredients and magic to be burned off faster than it could spread with the smoke.~
== bsstgc ~Well, the wind is also blowing the wrong direction, considering all I'm smelling today is that blasted tanner's stink. I can personally attest that some smells are able to increase *my* aggression level, with that example.~
END
IF ~~ THEN DO ~GiveItemCreate("bsdopdr",[PC],1,0,0) 
EraseJournalEntry(@861)
AddJournalEntry(@862,QUEST)
SetGlobalTimer("bsDoppelgangerQuestTimer","GLOBAL",TWO_DAYS)
SetGlobal("bsDoppelgangerQuest","GLOBAL",12)
SetGlobal("bsDoppelgangerInTower","GLOBAL",2)~ UNSOLVED_JOURNAL @860 EXIT

APPEND bsstgc

IF WEIGHT #-1
~Global("bsDoppelgangerQuest","GLOBAL",10)~ THEN doppelgangerquest_10
SAY ~This is not over yet. I need to speak to <CHARNAME> when the barracks are clear.~
IF ~~ THEN EXIT
END

IF WEIGHT #-1
~GlobalGT("bsDoppelgangerQuest","GLOBAL",10)
GlobalLT("bsDoppelgangerQuest","GLOBAL",15)
Global("bsDGBarracksCleared","LOCALS",0)~ THEN doppelgangerquest_11
SAY ~Ah, this feels a lot better, knowing the men I see here now are real.~
IF ~~ THEN + dg_search_00
IF ~Global("bsDoppelgangerQuest","GLOBAL",14)~ THEN + dg_search_05
IF ~Global("bsDoppelgangerQuest","GLOBAL",11)~ THEN DO ~SetGlobal("bsDGBarracksCleared","LOCALS",1)~ + doppelgangerquest_12
END

IF ~~ THEN doppelgangerquest_12
SAY ~But there are still guards on duty - and civilians inside the tower.~
IF ~~ THEN + doppelgangerquest_06
END

IF ~~ THEN doppelgangerquest_13
SAY ~Getting a bit cocky, are we? I'm not addressing you any different than I would to anyone else your talents.~
IF ~~ THEN + doppelgangerquest_08
END

IF ~~ THEN doppelgangerquest_14
SAY ~I knew it! They became careless after their leaders were taken out. We should focus on rooting the fakes out among the ranks in the barracks now.~
IF ~~ THEN + doppelgangerquest_04
END

IF ~~ THEN doppelgangerquest_15
SAY ~I knew it! They became careless after their leaders were taken out. Very good, very good!~
IF ~~ THEN + doppelgangerquest_06
END


IF WEIGHT #-1
~GlobalGT("bsDoppelgangerQuest","GLOBAL",11)
GlobalLT("bsDoppelgangerQuest","GLOBAL",14) Global("bsDoppelgangerTRCP","LOCALS",0)~ THEN dg_search_00
SAY ~Master Shizell's magic is working great so far. Doppelgangers are just revealing themselves left and right without us needing to confront each and every one of them.~
IF ~~ THEN DO ~SetGlobal("bsDoppelgangerTRCP","LOCALS",1)~ + dg_search_01
END

IF ~~ THEN dg_search_01
SAY ~How is the search going for you? Did you uncover any of those monsters?~
+ ~NumDeadGT("bsdopp07",0)~ + ~I found some doppelgangers but I need to take a break, so I will stop looking for now.~ + dg_search_04
+ ~Global("bsDoppelgangerInTower","GLOBAL",5)~ + ~I think I found all of them. I can't find anymore, at least.~ + dg_search_07
++ ~I'm on it.~ + dg_search_03
+ ~Global("bsDoppTurnTower","GLOBAL",0)~ + ~I won't help with your doppelganger problem. You'll have to solve it yourselves!~ + dg_search_02
END

IF ~~ THEN dg_search_02
SAY ~Hmph. Fine. We will deal with this problem ourselves.~ 
IF ~~ THEN DO ~SetGlobal("bsDoppelgangerInTower","GLOBAL",8) ClearAllActions() StartCutSceneMode() StartCutScene("bscut006")~ EXIT
END

IF ~~ THEN dg_search_03
SAY ~You are doing the tower a great service and will be rewarded accordingly. I am heading back to purging these monsters from the ranks of my soldiers! Report to me if you find any more of them.~
IF ~~ THEN EXIT
END

IF ~~ THEN dg_search_04
SAY ~I see. We will finish scouting the premises on our own then.~
IF ~~ THEN DO ~SetGlobal("bsDoppelgangerInTower","GLOBAL",8) ClearAllActions() StartCutSceneMode() StartCutScene("bscut006")~ EXIT
END

END //APPEND

CHAIN
IF WEIGHT #-1
~Global("bsDoppelgangerInTower","GLOBAL",8)~ THEN bsstgc dg_search_05
~Thank you again for your help, especially in saving our Seatower Commander. This whole doppelganger incident could have gone horribly wrong without you turning up at the right moment!~
== bsstgc IF ~Race(Player1,GNOME)~ THEN ~I can't stress how impressed I am to see such a fine gnome as you. I've always said there are heroes among every people!~
== bsstgc ~I have known most of my men for a long time and I did *not* notice any changes. But it might be because whenever I enter the room, they all put on their professional faces. They all go "yes, sir!" and "aye, captain" and it's uncommon for me to encounter them in a more personal situation.~
== bsstgc ~Go to the Seatower Commander and collect your reward. He wants to thank you personally for your help with this doppelganger invasion.~
== bstrmage IF ~InMyArea("bstrmage") !StateCheck("bstrmage",CD_STATE_NOTVALID)~ THEN ~I'll be back in my study, in case someone needs me.~ 
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
~That was you, wasn't it? Spreading these fumes all over the place.~
DO ~SetGlobal("dg_search_06","LOCALS",1)~
== bsstgc IF ~Race(Player1,GNOME)~ THEN ~That's just how you gnomes are, eh? Inventors through and through.~
== bsstgc ~Doppelgangers popped up everywhere, striking out at everyone around them!~
== bstrmage IF ~InMyArea("bstrmage") !StateCheck("bstrmage",CD_STATE_NOTVALID)~ THEN ~We also noticed how you did it. Smart decision, using the tanner's...~
== bsstgc ~That "smart" decision to get help from the tanner will give us weeks of smug looks from that gnome. Hrmph. But yes, that was not a bad idea to make that gnome's stink useful.~
== bsstgc IF ~GlobalGT("bsTannerSport","GLOBAL",1)~ THEN ~This definitely gives me a better lever to convince my soldiers to leave him alone in the future. There won't be one soldier here who isn't grateful for the tanner's help in unmasking these monsters.~
END
IF ~~ THEN EXIT
IF ~Global("bsDoppelgangerInTower","GLOBAL",5)~ THEN + dg_search_07

CHAIN
IF WEIGHT #-1
~Global("bsDoppelgangerInTower","GLOBAL",5)
OR(2)
Global("dg_search_06","LOCALS",1)
GlobalLT("bsDoppelgangerQuest","GLOBAL",14)~ THEN bsstgc dg_search_07
~It seems all doppelgangers are gone then! This is wonderful news.~
END
IF ~~ THEN + dg_search_05

/* Quest was aborted */

APPEND bsstgc 

/* timer run out while PC was told to investigating the hole in the prison wall */
IF WEIGHT #-1
~Global("bsDoppelgangerTailor","GLOBAL",0)
Global("bsDGQuestAborted","GLOBAL",1)
Global("bsDGQuestAbortedCP","LOCALS",0)~ THEN dgquest_aborted
SAY ~The Commander asked you to investigate the breach in the prison wall, didn't he? Well, I suggest you report to him soon so I can have my men close the hole in the wall.~
IF ~~ THEN + dgquest_aborted_02
END

IF ~~ THEN dgquest_aborted_01
SAY ~The whole doppelganger issue is settled now. The tower is clear, we made sure of that.~
IF ~~ THEN DO ~SetGlobal("bsDGQuestAbortedCP","LOCALS",1)~ EXIT
END

/* timer run out later */
IF WEIGHT #-1
~GlobalGT("bsDGQuestAborted","GLOBAL",0)
Global("bsDGQuestAbortedCP","LOCALS",0)
OR(2)
!Global("bsDoppelgangerTailor","GLOBAL",0)
!Global("bsDGQuestAborted","GLOBAL",1)~ THEN dgquest_aborted_02
SAY ~If you wanted to help with the doppelgangers inside the tower you are too late.~
IF ~~ THEN + dgquest_aborted_01
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
SAY ~Just one drop... and -~
IF ~~ THEN DO ~SetGlobal("bsDoppelgangerDevice","MYAREA",1) ClearAllActions() StartCutSceneMode() StartCutScene("bscut003")~ EXIT
END

END //APPEND

CHAIN
IF WEIGHT #-1
~Global("bsDoppelgangerQuest","GLOBAL",6) 
Global("bsDoppelgangerDevice","MYAREA",1)
Dead("bsdopp01")
Global("bsDoppel01Dead","GLOBAL",0)~ THEN bstrmage test_device_02
~Ha! It works! It works! Er... sorry about that. It was meant to be held by the restraints.~
== bstrmage IF ~Global("bsBlackPearlQuest","GLOBAL",0)~ THEN ~I am Master Shizell, the Seatower mage. Nice to meet you.~
END
++ ~What was that?! It is dangerous to just let a doppelganger loose like that.~ DO ~SetGlobal("bsDoppel01Dead","GLOBAL",1)~ + test_device_03
++ ~Was that your magical solution for the doppelgangers that the commander mentioned?~ DO ~SetGlobal("bsDoppel01Dead","GLOBAL",1)~ + test_device_04
++ ~How are we supposed to trust your magic will work as intended against the dopplegangers if you can't even control your experiments?~ DO ~SetGlobal("bsDoppel01Dead","GLOBAL",1)~ + test_device_03
++ ~Your magic seems to work against the doppelgangers. Can I have some for my own purposes?~ DO ~SetGlobal("bsDoppel01Dead","GLOBAL",1)~ + test_device_06
++ ~I don't have time to talk to you. I'll be going.~ DO ~SetGlobal("bsDoppel01Dead","GLOBAL",1)~ + dp_quest_02

APPEND bstrmage

IF ~~ THEN test_device_03
SAY ~Yes, I know. I am sorry.~
IF ~~ THEN + test_device_05
END

IF ~~ THEN test_device_04
SAY ~Indeed it was!~
IF ~~ THEN + test_device_05
END

IF ~~ THEN test_device_05
SAY ~That the doppelganger became hostile was actually a good sign, as it shows that my mimic powder is working and is potent enough.~
IF ~~ THEN + doppelgangerquest_01
END

IF ~~ THEN test_device_06
SAY ~Most certainly! Unfortunately, this drop of mimic powder was the only one I had, for now.~
IF ~~ THEN + doppelgangerquest_01
END

IF WEIGHT #-1
~Global("bsDoppelgangerQuest","GLOBAL",6) 
Global("bsDoppelgangerDevice","MYAREA",0)
Dead("bsdopp01")
Global("bsDoppel01Dead","GLOBAL",0)~ THEN doppelgangerquest
SAY ~Yes, sorry about the surprise doppelganger inside my study. I needed it to test my mimic powder.~
IF ~~ THEN DO ~SetGlobal("bsDoppel01Dead","GLOBAL",1)~ + doppelgangerquest_01
END

IF ~~ THEN doppelgangerquest_01
SAY ~I mean it was originally *meant* as a mimic powder, which we had need of to deal with another situation some time ago. Due to the obvious situation on our hands, in order to save time I've used the same base in the creation of an alchemical solution to unmask the doppelgangers currently plaguing us. And it works! The doppelganger you saw here became so irritated by my mimic powder it was driven to change into its natural form and attack.~
= ~I will prepare more using the secretions of the doppelgangers you killed in the commander's office, and as soon as Captain Dungarth is ready I will provide everyone with some of my new and improved mimic powder to help us root out this monster infestation.~
= ~I know the commander asked you to investigate the breach in the prison wall - make sure you do so, because the last thing we want is to have additional doppelganger reinforcement show up just as we have a solution to unmask the ones already here.~
IF ~~ THEN + dp_quest_02
END

IF ~~ THEN dp_quest_02
SAY ~I need to warn you. Whatever awaits behind that breach will be dangerous, and probably crawled out of the depths of the sea. The Seatower Prison is so secure and can contain the most dangerous criminals, not because the guards are so brutal, but because any attempt of fleeing leads to the prisoners being swallowed up by the sea itself. Seems like what protected the city from the inmates is the source of our problems. Good luck down there.~
IF ~~ THEN + open_shop
IF ~Global("bsBlackPearlQuest","GLOBAL",0)~ THEN + dp_quest_03
END

/* In case PC never spoke to mage before: give quest for black pearl */
IF ~~ THEN dp_quest_03
SAY ~If there is indeed a sea cave behind the prison breach then I'm hoping against hope that it contains a tide pool protected from the waves. If conditions are right then it might just be the perfect place to find a black pearl. Ah, that would be my luck as I know it - sitting on a black pearl for years without knowing it. Well, sort of. Not that I would have ever found that cave myself or knew it existed. Just in case you do find a black pearl, please allow me to buy it from you.~ 
IF ~GlobalLT("bsFoundBlackPearl","GLOBAL",3)~ THEN DO ~EraseJournalEntry(@850) AddJournalEntry(@851,QUEST) SetGlobal("bsBlackPearlQuest","GLOBAL",1) SetGlobal("bsPearlLocation","LOCALS",1)~ + open_shop
IF ~GlobalGT("bsFoundBlackPearl","GLOBAL",2)~ THEN DO ~SetGlobal("bsBlackPearlQuest","GLOBAL",1) SetGlobal("bsPearlLocation","LOCALS",1)~ + open_shop
END

IF ~~ THEN dp_quest_04
SAY ~Doppelgangers are masters in deception, but that is also their downfall. Doppelgangers become aggressive when they are discovered or their disguise starts to fail.  Since they tend to be more effective combatants in their natural form, they will almost invariably shift even though this means they can be more easily targeted and brought down. This is our most effective "weapon" we have against them - causing them to slip up in their deception and drop their disguise.~
= ~This liquid gives off odors they find irritating to the point that they'll often be driven into a rage and attack.~
= ~It works better here on the tower premises than probably elsewhere. In fact, it I suspect it won't work elsewhere at *all*. I am not sure why this is - I assume it's something to do with how an environmental factor combines with my potion.  Perhaps its the sea breeze mixing with the tannery odors, as much as individuals like the Captain don't like hearing this, but I do not know for sure. I will need to study this further - once I'll get a replenishment of the rare ingredients from Calimshan needed for the base.~
IF ~~ THEN + open_shop
END

IF ~~ THEN dp_quest_05
SAY ~Yes, please talk to the Captain, he will coordinate the fight.~
IF ~~ THEN EXIT
END

END //APPEND

/* Civilian outside the barracks, complaining about the tanner's stink */

BEGIN bsdpciv

IF ~True()~ THEN stinkcomplain
SAY ~Ugh, I'll take my leave from this 'famous Seatower'. The guard is incredibly on edge today and the tanner's *stink* is just hanging over the whole area.  It has quite ruined any sense of romantic coastal vistas - and my appetite. Good day to you.~
IF ~~ THEN DO ~EscapeAreaDestroy(5)~ UNSOLVED_JOURNAL @863 EXIT
END



/* Tailor */

BEGIN bstailor

IF ~NumTimesTalkedTo(0) Global("bsDoppelAttacked","MYAREA",0)~ THEN unsuspicious
SAY ~Ah - I am so sorry. I am Master Usher, tailor of the finest clothes, but I am afraid I cannot help you at this time.  I'm completely booked up and I can only serve customers with an appointment for the time being.~
IF ~~ THEN + farewell
END

IF ~Global("bsDoppelAttacked","MYAREA",0)~ THEN farewell
SAY ~You can have a look around, <PRO_LADYLORD>, but I beg your understanding that I will not be able to serve you. Farewell.~
IF ~~ THEN EXIT
END

IF ~Global("bsDoppelAttacked","MYAREA",1)~ THEN transformation
SAY ~So, you found out about our little secret. You will not get away with thissss!~
IF ~~ THEN DO ~ReallyForceSpellRES("bsdopsp5",Myself)~ EXIT
END

/* Tailor's assistant */

BEGIN bstail02

IF ~Global("bsFoundExitDocks","GLOBAL",0)~ THEN greetings
SAY ~Master Usher is such an artist! His clothes are magnificent.~
IF ~~ THEN EXIT
END

IF ~Global("bsFoundExitDocks","GLOBAL",1)~ THEN doppel
SAY ~SsssssSSSSssss!~
IF ~~ THEN EXIT
END

/* Mimic Fledgling */

BEGIN bsmimic1

CHAIN
IF ~Global("bsOpenMimic","MYAREA",0)~ THEN bsmimic1 first_warning
~(You realize that the chest you were trying to open is in fact a mimic fledgling. It doesn't seem too hostile, but you are sure that either bothering it again or lingering in its presence will lead to a fight.)~
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
SAY ~What? Who are you and how did you get in here?~
+ ~Global("bsSmugglerQuest","GLOBAL",1)~ + ~Actually I am here on behalf of Holger. He is wondering why you no longer talk to him.~ + surprise_01
++ ~Smugglers? Why am I not surprised.~ EXTERN bssmgl07 surprise_02
++ ~Who are you?~ EXTERN bssmgl07 surprise_02
++ ~No time for pleasantries. Draw your weapons.~ EXTERN bssmgl07 surprise_02
END

IF ~~ THEN surprise_01
SAY ~Ah, it's about time he sent reinforcements. We were...~
IF ~~ THEN EXTERN bssmgl07 surprise_02
END

CHAIN
IF ~~ THEN bssmgl07 surprise_02
~Juan, you remember the surprise we promised you for tonight? Now it happenssss.~
== bssmgl06 ~What?~
END
IF ~~ THEN DO ~SetGlobal("bsPCMetSmugglerDoppelgangers","GLOBAL",1)~ EXIT

APPEND bssmgl06

IF ~AreaCheck("BS0111") GlobalLT("bsDoppelgangerChange","BS0111",2)
Global("bsPCMetSmugglerDoppelgangers","GLOBAL",1)~ THEN fight_still
SAY ~Aaaaaah!~
IF ~~ THEN EXIT
END

IF ~AreaCheck("BS0111") Global("bsDoppelgangerChange","BS0111",2)~ THEN fight_over
SAY ~What... what was *that*?! Doppelgangrs? All my comrades... doppelgangers!~
++ ~How do I know you are not one of them?~ + fight_over_01
++ ~And you are?~ + fight_over_02
++ ~Get out of here fast, before I change my mind.~ + fight_over_04
++ ~You're a smuggler? Prepare to die!~ + fight_over_05
END

IF ~~ THEN fight_over_01
SAY ~Well, *I* know I'm not one of them!~
IF ~~ THEN + fight_over_02
END

IF ~~ THEN fight_over_02
SAY ~My name is Juan, and I am a smuggler - no need to lie now! Last man standing from the smuggler cell operating under the Seatower.~
IF ~~ THEN + fight_over_03
END

IF ~~ THEN fight_over_03
SAY ~Did you hear what Cimmon... I mean that thing said? They kept on talking about a "surprise" for tonight... I guess we know what that would have meant! You saved my life!~
+ ~Global("bsSmugglerQuest","GLOBAL",1)~ + ~Holger was wondering why the tower cell was no longer talking to him. I think we know the reason now.~ + fight_over_08
++ ~How did this happen?~ + fight_over_09
++ ~What awaits me when I go up the stairs?~ + fight_over_10
++ ~Get out of here fast, before I change my mind.~ + fight_over_07
++ ~You're a smuggler? Prepare to die!~ + fight_over_06
END

IF ~~ THEN fight_over_04
SAY ~They promised me a "surprise" for tonight... I guess we know what that would have meant! You saved my life!~
IF ~~ THEN + fight_over_07
END

IF ~~ THEN fight_over_05
SAY ~I am! And you just saved my life from these monsters.~
IF ~~ THEN + fight_over_06
END

IF ~~ THEN fight_over_06
SAY ~Sorry, I'm not sticking around long enough for you to kill me too!~
IF ~~ THEN DO ~SetGlobal("bsPCMetSmugglerDoppelgangers","GLOBAL",2)
ActionOverride("bssmgl06",EscapeAreaDestroy(5))~ EXIT
IF ~Global("bsSmugglerQuest","GLOBAL",1)~ THEN DO ~EraseJournalEntry(@832) SetGlobal("bsPCMetSmugglerDoppelgangers","GLOBAL",2)
ActionOverride("bssmgl06",EscapeAreaDestroy(5))~ UNSOLVED_JOURNAL @838 EXIT
END

IF ~~ THEN fight_over_07
SAY ~Thanks, <PRO_MANWOMAN>!~
= ~Gods! Those heavy, heavy boxes! They smuggled in doppelgangers! That's what they've been doing all along, haven't they? I'm sure they have!~
IF ~~ THEN DO ~SetGlobal("bsPCMetSmugglerDoppelgangers","GLOBAL",3)
ActionOverride("bssmgl06",EscapeAreaDestroy(5))~ EXIT
IF ~Global("bsSmugglerQuest","GLOBAL",1)~ THEN DO ~EraseJournalEntry(@832)
SetGlobal("bsPCMetSmugglerDoppelgangers","GLOBAL",3)
ActionOverride("bssmgl06",EscapeAreaDestroy(5))~ UNSOLVED_JOURNAL @838 EXIT
END

IF ~~ THEN fight_over_08
SAY ~That we do! I can't believe I didn't notice anything... Everyone was replaced by doppelgangers!~
++ ~How did this happen?~ + fight_over_09
++ ~What awaits me when I go up the stairs?~ + fight_over_10
++ ~Get out of here fast, before I change my mind.~ + fight_over_07
+ ~Global("bsSmugglerQuest","GLOBAL",1)~ + ~Best you go and tell Holger yourself.~ + fight_over_07
++ ~You're a smuggler? Prepare to die!~ + fight_over_06
END

IF ~~ THEN fight_over_09
SAY ~I didn't notice anything in particular, other that things seemed to get somehow out of hand slowly. They kept on about problems here and problems there and reinforcements missing and messages getting lost. I was getting quite nervous because they seemed to be focusing on other things and not caring about maintaining contact with the other cells!~
++ ~What awaits me when I go up the stairs?~ + fight_over_10
++ ~Get out of here fast, before I change my mind.~ + fight_over_07
+ ~Global("bsSmugglerQuest","GLOBAL",1)~ + ~Best you go and tell Holger yourself.~ + fight_over_07
++ ~You're a smuggler? Prepare to die!~ + fight_over_06
END

IF ~~ THEN fight_over_10
SAY ~It's the shop where we fence our goods - I mean it was a shop, now it's a tailor because the shop owner went away and... Gods, they probably killed him, didn't they? And the tailor might be a doppelganger, as well. I'd be very careful when going up there if I was you.~
++ ~How did this happen?~ DO ~SetGlobal("bsFoundExitDocks","GLOBAL",1)~ + fight_over_09
++ ~Get out of here fast, before I change my mind.~ DO ~SetGlobal("bsFoundExitDocks","GLOBAL",1)~ + fight_over_07
+ ~Global("bsSmugglerQuest","GLOBAL",1)~ + ~Best you go and tell Holger yourself.~ DO ~SetGlobal("bsFoundExitDocks","GLOBAL",1)~ + fight_over_07
++ ~You're a smuggler? Prepare to die!~ DO ~SetGlobal("bsFoundExitDocks","GLOBAL",1)~ + fight_over_06
END

END //APPEND



