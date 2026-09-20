

/* adjutant */
BEGIN yssgt3
IF ~True()~ THEN greeting
SAY @0 /* Good day to you, please leave the commander to his work if there is no urgent business. */
IF ~~ THEN EXIT
END



/* Seatower Commander Airard */
BEGIN bstrcmdr

/* very first greeting */
CHAIN
IF ~NumTimesTalkedTo(0)~ THEN bstrcmdr greeting
@1 /* Welcome to the Seatower. I am Seatower Commander Airard, Captain of the Seatower. If you have any official business concerning Balduran's Seatower, I am the person to talk to. If you are looking for your lost children, the Garrison Commander, Captain Dungarth, is the one you want - you can find him in the barracks. */ DO ~SetGlobal("bsIntroduction","LOCALS",1)~
== bstrcmdr IF ~InMyArea("yssgt3")~ THEN @2 /* Sergeant - one of the lamps is out again. Would you please let the chamber servant know that the oil needs refilling! */
== yssgt3 IF ~InMyArea("yssgt3")~ THEN @3 /* Aye, sir! */
END
IF ~~ THEN EXIT
IF ~OR(3)
Global("bsMissingMonk","GLOBAL",4)
Global("bsMissingMonk","GLOBAL",5)
Global("bsMissingMonk","GLOBAL",10) Global("bsGavePrisonPass","GLOBAL",0)~ THEN + prisonpass 
IF ~Dead("bsslav01")~ THEN + slaver_dead


/* reaction after PC was searched for murder in chapter 7 */
/* Global("bs_TowerArrestCh7","GLOBAL",0): commander did not talk to PC
GlobalGT("bs_CityKnowsBSTDoppel","GLOBAL",0): PC helped defeating DG in tower
Global("bs_CityKnowsBSTDoppel","GLOBAL",0): PC did not help.
   Global("bs_TowerArrestCh7","GLOBAL",2): commander let PC go
   Global("bs_TowerArrestCh7","GLOBAL",3): commander handed PC over to the FF
*/
CHAIN
IF ~GlobalGT("DukeThanks","GLOBAL",0)
Global("bs_TowerArrestCh7Followup","MYAREA",0)~ THEN bstrcmdr after_coronation
@4 /* <CHARNAME>! I was informed about what happened by Sarevok's planned coronation. This scoundrel has deceived everyone! You, on the other hand, are not only free to enter the tower again, but also a help for the city in great need. Let me know if I can support you in your pursuit of Sarevok in any way. */
DO ~SetGlobal("bs_TowerArrestCh7Followup","MYAREA",1)~
== bstrcmdr IF ~Global("bs_TowerArrestCh7","GLOBAL",3)~ THEN @5 /* I am especially glad you came out of the prison in one piece. I had mentally prepared myself to have you in my dungeon. */
== bstrcmdr IF ~GlobalGT("bs_TowerArrestCh7","GLOBAL",0)~ THEN @6 /* I'm sorry I didn't take more of your side. Times have been tough - I've had my hands full trying to keep the corruption of the Flaming Fist away from my tower. I am truly glad to see you well - and that the accusations have been cleared up. */
EXIT

APPEND bstrcmdr

/* successful finish of "Confront the Slave Traders in Baldur's Gate" quest */
IF ~Global("bsConfrontSlaveTraders","GLOBAL",6)~ THEN slaverquest_finished
SAY @7 /* There you are! The mission against the slavers was a success - while we may not have caught the big fish yet, we now have prisoners and witnesses who should help us move our investigation forward. */
IF ~~ THEN + slaversquest_13
END

END //APPEND

/* PC killed the slave trader contact */
CHAIN
IF ~Dead("bsslav01") Global("bsNoticedSlaversDead","LOCALS",0)~ THEN bstrcmdr slaver_dead
@8 /* You killed the slave trader agent on the third floor. */
== bstrcmdr IF ~GlobalLT("bsConfrontSlaveTraders","GLOBAL",2)
GlobalLT("bsDoppelgangerQuest","GLOBAL",4)~ THEN @9 /* You are fortunate that we will let it pass as an early death sentence for the scum, or you would be prosecuted for your part in the violent exchange on tower grounds. */
== bstrcmdr IF ~OR(2)
GlobalGT("bsConfrontSlaveTraders","GLOBAL",1)
GlobalGT("bsDoppelgangerQuest","GLOBAL",3)~ THEN @10 /* In exchange for your assistance with the case, we're willing to overlook your killing of that scum, but normally you would be prosecuted for your part in the violent exchange on tower grounds. */
END
IF ~GlobalGT("bsConfrontSlaveTraders","GLOBAL",1)~ THEN DO ~SetGlobal("bsNoticedSlaversDead","LOCALS",1)~ + slaver_dead_01

+ ~Global("bsConfrontSlaveTraders","GLOBAL",0)~ + @11 /* What? Leonhard 'the Fiiiierrrrce' was a slave trader and you *knew*?! */ DO ~SetGlobal("bsNoticedSlaversDead","LOCALS",1)~ + slaver_dead_00

+ ~Global("bsConfrontSlaveTraders","GLOBAL",1)~ + @12 /* You knew there were slavers carrying out their business inside the tower? */ DO ~SetGlobal("bsNoticedSlaversDead","LOCALS",1)~ + slaver_dead_00
+  ~GlobalLT("bsConfrontSlaveTraders","GLOBAL",2)~ + @13 /* I killed a few slave traders. I'm pretty sure the Watch would not object. */ DO ~SetGlobal("bsNoticedSlaversDead","LOCALS",1)~ + slaver_dead_02

APPEND bstrcmdr

IF ~~ THEN slaver_dead_00
SAY @14 /* Yes, we knew. */ 
IF ~~ THEN + slaver_dead_03
END

END //APPEND

CHAIN
IF ~~ THEN bstrcmdr slaver_dead_01
@15 /* It's a shame, now we'll have to track down wherever they move their operations to next. Let us just hope it will still be inside the city, or they might be out of reach of the Watch completely. */
== bstrcmdr IF ~GlobalLT("bsConfrontSlaveTraders","GLOBAL",6)~ THEN @16 /* If you found any evidence that would help us convict them for their evil actions, then please let me know.  However, I doubt you found anything useful, they are smarter than that. */
== bstrcmdr IF ~GlobalGT("bsConfrontSlaveTraders","GLOBAL",5)~ THEN @17 /* Not that we would have tolerated their presence for much longer. But I was hoping we would be able to gather enough evidence to build a case that would allow us to give them a proper trial - if only to signal that the rule of law prevails and that we can and will defend the laws and values of this city. */
END
IF ~~ THEN EXIT
IF ~OR(3)
Global("bsMissingMonk","GLOBAL",4)
Global("bsMissingMonk","GLOBAL",5)
Global("bsMissingMonk","GLOBAL",10) Global("bsGavePrisonPass","GLOBAL",0)~ THEN + prisonpass 


APPEND bstrcmdr

IF ~~ THEN slaver_dead_02
SAY @18 /* The Watch is tasked with enforcing the law. Going around killing the minions of criminal organizations will only lead to cutting of the snake's tail while the head retreats to the shadows. I'm afraid you did not help us. */
IF ~~ THEN + slaver_dead_03
END

IF ~~ THEN slaver_dead_03
SAY @19 /* We weren't happy about their presence, but we had no *evidence* of that man's connections to slave traders. Every time the Watch or the Flaming Fist thinks they can make a move and eliminate the slavers, they somehow come out smooth as baby's bottom.  A few minor agents get arrested, but the power brokers remain immune and new minions take the place of the old ones. */
IF ~~ THEN + slaver_dead_01
IF ~GlobalGT("bsShucksBrother","GLOBAL",5) GlobalLT("bsShucksBrother","GLOBAL",30) !Dead("bsshckbr")~ THEN DO ~SetGlobal("bsConfrontSlaveTraders","GLOBAL",2)~ + slaversquest_03
END

END //APPEND

/* slaver quest: Commander interrogated witness. */
CHAIN
IF ~Global("bsSlaveWitnessInterrogated","GLOBAL",2)~ THEN bstrcmdr witness
@20 /* The talk with the witness was very promising. He could name a few places and names. One location seems to warrant our particular interest as it seems to be a place frequently used for transfers of slaves. */
== bstrcmdr IF ~Global("bsSQCommanderKnowsTimes","LOCALS",0)~ THEN @21 /* Now if we only knew for sure when the next transfer would take place. We can't put more forces there than would normally be on patrol - they would notice and move their operation elsewhere. */
== bstrcmdr IF ~Global("bsSQCommanderKnowsPlace","LOCALS",1) GlobalGT("bsSQCommanderKnowsTimes","LOCALS",0)~ THEN @22 /* It's the location we already know about and the witness was able to fill in some more details as to how it will go down. Together with the other evidence we've managed to gather, this will help us greatly in our case against the slave traders. */
== bstrcmdr @23 /* Thank you for arranging this, <CHARNAME>. Take this as a reward for your services for the city. */
DO ~GiveItemCreate("bstrnt03",[PC],0,0,0) AddexperienceParty(3500) 
EraseJournalEntry(@881)~
END

/* commander doesn't know about time: dialogue ends */
IF ~~ THEN DO ~SetGlobal("bsSlaveWitnessInterrogated","GLOBAL",3) SetGlobal("bsSQCommanderKnowsPlace","LOCALS",1)~ EXIT

/* commander already knows about time: dialogue continues to next quest state */
IF ~GlobalGT("bsSQCommanderKnowsTimes","LOCALS",0) Global("bsSQCommanderKnowsPlace","LOCALS",0)~ THEN DO ~SetGlobal("bsSlaveWitnessInterrogated","GLOBAL",3) SetGlobal("bsSQCommanderKnowsPlace","LOCALS",1)~ + slaversquest_05


APPEND bstrcmdr

/* general dialogue with all quest relevant reply options */

IF ~NumTimesTalkedToGT(0)~ THEN greeting_01
SAY @24 /* Is there anything else I need to know? */

/* Doppelganger quest and all related stuff to the Seacave. Most dialogue states linked to are in z_quest_doppelgangers.d! */

/* PC came late to the tower */
+ ~Global("bsIntroduction","LOCALS",0)~ + @25 /* Who are you? */ DO ~SetGlobal("bsIntroduction","LOCALS",1)~ + introduction

+ ~GlobalGT("bsSeaCaveOpen","GLOBAL",0)
Global("bsKnowsBreakthrough","LOCALS",0)~ + @26 /* There is indeed a hole in the prison wall... someone has been busy. */ DO ~SetGlobal("bsKnowsBreakthrough","LOCALS",1)~ + breakthrough

/* general quest replies */

/* replies to close the quest "The Breach in the Seatower Prison" */
+ ~Global("bsFoundSerjeante","GLOBAL",1)
Global("bsKnowsBreakthrough","LOCALS",1)~ + @27 /* The hole leads into a seacave with several exits. We found the dead adjutant there, dead and hastily buried. */ DO ~SetGlobal("bsFoundSerjeante","GLOBAL",2)~ + doppelgangers_04
+ ~GlobalGT("bsSeaCaveOpen","GLOBAL",3) Global("bsSeaCaveOpenLOC","MYAREA",0)
Global("bsKnowsBreakthrough","LOCALS",1)~ + @28 /* We found an exit under the rope lift in Traitor's Tower directly into the cave.  It had been blocked by a huge stone. */ DO ~SetGlobal("bsSeaCaveOpenLOC","MYAREA",1)~ + doppelgangers_06
+ ~Global("bsFoundExitUmberlee","GLOBAL",1) Global("bsFoundExitUmberleeLOC","MYAREA",0)
Global("bsKnowsBreakthrough","LOCALS",1)~ + @29 /* There is an exit right into the Temple of Umberlee. */ DO ~SetGlobal("bsFoundExitUmberleeLOC","MYAREA",1)~ + doppelgangers_05
+ ~Global("bsFoundExitDocks","GLOBAL",1) Global("bsFoundExitDocksLOC","MYAREA",0)
Global("bsKnowsBreakthrough","LOCALS",1)~ + @30 /* There is an exit right into the Docks, through a smuggler tunnel. */ DO ~SetGlobal("bsFoundExitDocksLOC","MYAREA",1)~ + doppelgangers_12
+ ~GlobalGT("bsPCMetSmugglerDoppelgangers","GLOBAL",0) Global("bsPCMetSmugglerLOC","MYAREA",0)
Global("bsKnowsBreakthrough","LOCALS",1)~ + @31 /* There was a local smuggler cell that had been completely taken over by doppelgangers... */ DO ~SetGlobal("bsPCMetSmugglerLOC","MYAREA",1)~ + doppelgangers_10
+ ~Global("bsDoppelgangerTailor","GLOBAL",1) Global("bsTailorLOC","MYAREA",0)
Global("bsKnowsBreakthrough","LOCALS",1)~ + @32 /* The tailor at "Master Usher's Finest Clothes" was a doppelganger! I am afraid the shop was used to target nobles of the town and replace them with doppelgangers. */ DO ~SetGlobal("bsTailorLOC","MYAREA",1)~ + doppelgangers_11
+ ~Global("bsToldCorpseDump","MYAREA",0)
GlobalGT("bsPCFoundHighLevEnc","GLOBAL",0)
Global("bsTailorLOC","MYAREA",1) //after telling about the doppelganger taylor
Global("bsKnowsBreakthrough","LOCALS",1)~ + @33 /* There is a dungeon with piled corpses under the cellar of the tailor shop. */ DO ~SetGlobal("bsToldCorpseDump","MYAREA",1)~ + doppelgangers_22
/* report Sahuagins in Sea Cave - only important enough after PC knows about portal (i.e. talked to pristess of Umberlee) */
/* Old Temple Island quest denied - Sahuagin portal still open */
+ ~Global("bs_ReportedSahuagin","MYAREA",0)
Global("bsKnowsBreakthrough","LOCALS",1)
Dead("bssahu01") Dead("bssahu02") Dead("bssahu03") Dead("bssahu04")
Global("bs_TempleIslandQuest","GLOBAL",-1)~ + @41 /* There were more Sahuagin in the Sea Cave. They came in through a portal. I fear it is still open. */ DO ~SetGlobal("bs_ReportedSahuagin","MYAREA",1)
SetGlobal("bs_TempleIslandQuest","GLOBAL",-2)~ + sahuagin
/* quest aquired or already done - Sahuagin portal is closed */
+ ~Global("bs_ReportedSahuagin","MYAREA",0)
Global("bsKnowsBreakthrough","LOCALS",1)
Dead("bssahu01") Dead("bssahu02") Dead("bssahu03") Dead("bssahu04")
GlobalGT("bs_TempleIslandQuest","GLOBAL",0)~ + @42 /* There were more Sahuagin in the Sea Cave. They came in through a portal, but this portal has been closed. */ DO ~SetGlobal("bs_ReportedSahuagin","MYAREA",1)~ + sahuagin

/* Follow-ups: doppelganger victims */
+ ~Global("bsToldCorpseDump","MYAREA",1)
Global("bsPCTookHeirloomsbs0113","GLOBAL",1)~ + @34 /* I came for handing in heirlooms I found with the corpses under the tailor shop. */ + doppelgangers_24
+ ~Global("bsToldCorpseDump","MYAREA",1)
Global("bsPCTookHeirloomsbs0113","GLOBAL",1)~ + @35 /* (lie) About the heirlooms with the corpses under the tailor shop. I didn't find anything worth handing in for this purpose. */ DO ~SetGlobal("bsPCTookHeirloomsbs0113","GLOBAL",2)~ + doppelgangers_27
+ ~Global("bsToldCorpseDump","MYAREA",1)
Global("bsPCTookHeirloomsbs0113","GLOBAL",0)~ + @36 /* About the heirlooms with the corpses under the tailor shop. I didn't touch the victims' possessions. */ DO ~SetGlobal("bsPCTookHeirloomsbs0113","GLOBAL",4)~ + doppelgangers_27
+ ~NumDeadGT("bsdopp07",0) GlobalGT("bsDoppelgangerQuest","GLOBAL",6)
GlobalLT("bsDoppelgangerQuest","GLOBAL",15)~ + @37 /* I killed doppelgangers on the tower grounds. */ + doppelgangers_08
+ ~GlobalGT("bsDoppelgangerQuest","GLOBAL",1)
GlobalLT("bsDoppelgangerQuest","GLOBAL",7)~ + @38 /* I'll investigate the breach in the prison right away. */ + doppelgangers_09
+ ~GlobalGT("bsDoppelgangerQuest","GLOBAL",6)
GlobalLT("bsDoppelgangerQuest","GLOBAL",10)~ + @39 /* There is no use in waiting for me to fight doppelgangers. I will not join the fight. */ + doppelgangers_19
+ ~GlobalGT("bsDoppelgangerQuest","GLOBAL",6)
GlobalLT("bsDoppelgangerQuest","GLOBAL",15)~ + @40 /* Nothing new with regard to the doppelgangers. */ + doppelgangers_09

/* Follow-up sahuagin portal: PC saw great portal at island but did not interfere */
+ ~Global("bs_ReportedSahuagin","MYAREA",1)
Global("bs_SawPortalRoom","GLOBAL",2)
Global("bs_SahuaginPortalRoom","GLOBAL",0)~ + @43 /* Sahuagin connected to the ones that came here are working on a big portal, presumably for raids to the coast. */ DO ~SetGlobal("bs_ReportedSahuagin","MYAREA",2)~ + sahuagin_followup
/* Follow-up: PC saw great portal at island and killed the architect */
+ ~Global("bs_ReportedSahuagin","MYAREA",1)
Global("bs_SawPortalRoom","GLOBAL",2)
Global("bs_SahuaginPortalRoom","GLOBAL",1)~ + @44 /* Sahuagin connected to the ones that came here were working on a big portal, presumably for raids to the coast. I made their plans a little more difficult. */ DO ~SetGlobal("bs_ReportedSahuagin","MYAREA",2)~ + sahuagin_followup_01
/* Follow-up: PC saw great portal at island and destroyed it */
+ ~Global("bs_ReportedSahuagin","MYAREA",1)
Global("bs_SawPortalRoom","GLOBAL",2)
Global("bs_SahuaginPortalRoom","GLOBAL",2)~ + @45 /* Sahuagin were working on a big portal, presumably for raids to the coast. I destroyed this portal and made their plans more difficult. */ DO ~SetGlobal("bs_ReportedSahuagin","MYAREA",2)~ + sahuagin_followup_01
/* hand in sacred tooth */
/* PC offers sacred tooth before handing in evidence for intrigue */
+ ~PartyHasItem("bsitooth")
Global("bs_ReportedToothQuest","MYAREA",0)
Global("bs_HandedInEvidence","LOCALS",0)~ + @46 /* I have a relic of the Temple of Umberlee here and would like to ask you to return it. I retrieved it for them, but there was a... misunderstanding when I tried to hand it in. */ DO ~
EraseJournalEntry(@100059)
EraseJournalEntry(@100088)
EraseJournalEntry(@100089)
AddexperienceParty(100)
SetGlobal("bs_ReportedToothQuest","MYAREA",2)
TakePartyItem("bsitooth") DestroyItem("bsitooth")~ + relic
/* PC offers sacred tooth after handing in evidence for intrigue */
/* with the notion that it gets handed back to the temple */
+ ~PartyHasItem("bsitooth")
Global("bs_ReportedToothQuest","MYAREA",0)
Global("bs_HandedInEvidence","LOCALS",1)~ + @46 /* I have a relic of the Temple of Umberlee here and would like to ask you to return it. I retrieved it for them, but there was a... misunderstanding when I tried to hand it in. */ DO ~EraseJournalEntry(@100059)
EraseJournalEntry(@100088)
EraseJournalEntry(@100089)
AddexperienceParty(100)
SetGlobal("bs_TempleIslandQuest","GLOBAL",20)
TakePartyItem("bsitooth") DestroyItem("bsitooth")~ SOLVED_JOURNAL @100063 + hand_in_tooth_evidence_02
/* with the notion that the city authorities have a leverage against the temple */
+ ~PartyHasItem("bsitooth")
Global("bs_ReportedToothQuest","MYAREA",0)
Global("bs_HandedInEvidence","LOCALS",1)~ + @47 /* I decided to hand the relic that was given from the Temple of Umberlee to the Sahuagin into the city's authority. You decide how to proceed with it. */ DO ~EraseJournalEntry(@100059)
EraseJournalEntry(@100088)
EraseJournalEntry(@100089)
AddexperienceParty(100)
SetGlobal("bs_TempleIslandQuest","GLOBAL",20)
TakePartyItem("bsitooth") DestroyItem("bsitooth")~ SOLVED_JOURNAL @959 + hand_in_tooth_evidence_01
/* report intrigue of Umberlee Temple */
/* offer only evidence */
+ ~PartyHasItem("bsipuml2")
Global("bs_HandedInEvidence","LOCALS",0)~ + @48 /* I have a compromising letter here that gives evidence to an intrigue the Temple of Umberlee had a main part in. */ DO ~EraseJournalEntry(@100090)
AddexperienceParty(250)
SetGlobal("bs_TempleIslandQuest","GLOBAL",20)
SetGlobal("bs_HandedInEvidence","LOCALS",1)
TakePartyItem("bsipuml2") DestroyItem("bsipuml2")~ + intrigue
/* offer both evidence and tooth */
+ ~PartyHasItem("bsipuml2")
PartyHasItem("bsitooth")
Global("bs_HandedInEvidence","LOCALS",0)~ + @49 /* I have a compromising letter here that gives evidence to an intrigue of the Temple of Umberlee including Sahuagin. I'll also give you the relic that was given from the Temple of Umberlee to the Sahuagin for this purpose. */ DO ~EraseJournalEntry(@100062)
EraseJournalEntry(@100088)
EraseJournalEntry(@100089)
EraseJournalEntry(@100090)
AddexperienceParty(250)
AddexperienceParty(100)
SetGlobal("bs_TempleIslandQuest","GLOBAL",20)
SetGlobal("bs_HandedInEvidence","LOCALS",1) SetGlobal("bs_ReportedToothQuest","MYAREA",1)
TakePartyItem("bsitooth") DestroyItem("bsitooth")
TakePartyItem("bsipuml2") DestroyItem("bsipuml2")~ + intrigue

/* report in smugglers */
+ ~Global("bsWorkingWithSmugglers","GLOBAL",1)
GlobalGT("bsSmugglerQuest","GLOBAL",0)
GlobalLT("bsSmugglerQuest","GLOBAL",40)
Global("bs_ReportSmugglersToSeatower","GLOBAL",0)~ + @50 /* (true) I would like to report a smuggler organization operating in Baldur's Gate. */ + report_smuggler

/* slaver quest */
/* first reply option: making commander aware */
+ ~Global("bsConfrontSlaveTraders","GLOBAL",1)
!Dead("bsslav01")~ + @51 /* Are you aware that there are slave traders doing their business *right here* inside the tower? */ + slaversquest

/* reply options about Shuck's brother: PC needs the gold to buy him free */
+ ~Global("bsShucksBrother","GLOBAL",3)
!GlobalTimerExpired("bsSlaveTimer1","GLOBAL")
GlobalGT("bsConfrontSlaveTraders","GLOBAL",1)
Global("bsSQCommanderPayed","GLOBAL",0)~ + @52 /* I might have a witness for the slave traders, but I need 20,000 gold to buy his freedom. */ + slaversquest_01
/* reply options about Shuck's brother: PC spent gold to buy him free and wants it refunded later */
+ ~GlobalGT("bsShucksBrother","GLOBAL",3) GlobalLT("bsShucksBrother","GLOBAL",30) !Dead("bsshckbr") 
GlobalGT("bsConfrontSlaveTraders","GLOBAL",1)
Global("bsSQCommanderPayed","GLOBAL",0)~ + @53 /* I spent 20,000 gold to free a witness against the slave traders, and I want the sum to be repaid. */ + slaversquest_01
/* reply options about Shuck's brother: is in monastery now */
+ ~GlobalGT("bsShucksBrother","GLOBAL",5) GlobalLT("bsShucksBrother","GLOBAL",30) !Dead("bsshckbr") 
GlobalGT("bsConfrontSlaveTraders","GLOBAL",1)
Global("bsSlaveWitnessInterrogated","GLOBAL",0)~ + @54 /* The witness to the slavers' actions is now recovering in the Ilmater monastery. */ + slaversquest_02

/* PC killed slaver contact and retrieved the booklet with times: collaboration with slavers no longer possible */
+ ~PartyHasItem("bssmq003") Global("bsSQCommanderKnowsTimes","LOCALS",0)~ + @55 /* I found this with Leonhard 'the Fierce'. Does this help you in any way? */ + slaversquest_04

/* PC collaborates with slavers and got info about time and place. Finding the booklet is no longer possible */
+ ~Global("bsSlaverQuest","GLOBAL",4) GlobalGT("bsConfrontSlaveTraders","GLOBAL",1)~ + @56 /* I know the time and place of one of the slavers' shipments: when night has fallen, south of Wyrm's Crossing. */ + slaversquest_11

/* High Level Encounter (Glabrezu) */
+ ~Global("bsPCFoundHighLevEnc","GLOBAL",2)
!Dead("BSGLABRE")
Global("bsToldHighLevEnc","LOCALS",0)~ + @57 /* We found some kind of ritual chamber down in the caves. Do you know anything about it? */ DO ~SetGlobal("bsToldHighLevEnc","LOCALS",1)~ + high_level
+ ~Dead("BSGLABRE")
Global("bsToldHighLevEnc","LOCALS",0)~ + @58 /* We cleared some kind of ritual chamber. It was a prison of a Glabrezu. */ DO ~SetGlobal("bsToldHighLevEnc","LOCALS",2)~ + high_level
+ ~Dead("BSGLABRE")
Global("bsToldHighLevEnc","LOCALS",1)~ + @59 /* We cleared the ritual chamber. It was a prison of a Glabrezu. */ DO ~SetGlobal("bsToldHighLevEnc","LOCALS",2)~ + high_level_01

/* innocent prisoner quest */
+ ~PartyHasItem("bspris6b")
GlobalGT("bs_KnowsPrisonerIntrigue","GLOBAL",0)
GlobalLT("bs_KnowsPrisonerIntrigue","GLOBAL",8)~ + @60 /* I have evidence here to prove that Duke Eltan's cousin Malastair is innocent of the attempt on Duke Eltan's life for which he was convicted. It was Sarevok all along! */ DO ~SetGlobal("bs_KnowsPrisonerIntrigue","GLOBAL",11)
EraseJournalEntry(@100094)
EraseJournalEntry(@100097)
AddexperienceParty(250)
ReputationInc(1)
TakePartyItem("bspris6b") DestroyItem("bspris6b")~ SOLVED_JOURNAL @100099  + give_evidence

/* general questions */
+ ~OR(3) PartyHasItem("bstrnt03") PartyHasItem("bstrnt05") PartyHasItem("bstrnt20")~ + @61 /* What exactly am I supposed to do with the treasury note? */ + treasurenote
+ ~Global("bsTowerPurpose","LOCALS",0)~ + @62 /* What is the purpose of Balduran's Seatower? */ DO ~SetGlobal("bsTowerPurpose","LOCALS",1)~ + tower_purpose

/* general farewell dialogue */
++ @63 /* Good day to you. */ EXIT
END

IF ~~ THEN report_smuggler
SAY @64 /* If you know of any smuggler activities inside the Seatower, please report directly to Captain Dungarth in the Seatower Barracks. If illegal actions are not specifically here inside the tower, please report to the Flaming Fist directly. I am sure they'll hear you out at their headquarters. */
IF ~~ THEN DO ~IncrementGlobal("bs_Smugglerfriend","GLOBAL",-1)
SetGlobal("bs_ReportSmugglersToSeatower","GLOBAL",1)~ UNSOLVED_JOURNAL @100134 EXIT
END

IF ~~ THEN give_evidence
SAY @65 /* An innocent in my dungeon! Thank you for bringing this to me. I will see to this matter being resolved. */
IF ~~ THEN EXIT
END

IF ~~ THEN sahuagin
SAY @66 /* A portal? I was afraid there would be more of the creatures. If they used a portal, they seem to have come from further away - and they were preparing to come in greater masses. Thank you for the heads up. I'll let Master Shizell know about it. */
= @67 /* I thank you for taking care of the current Sahuagin threat. The one my men captured died before we had the chance to talk to it - too many other things had to be dealt with before I got the time to question the sea creature. */
IF ~~ THEN + greeting_01
END

IF ~~ THEN sahuagin_followup
SAY @68 /* Interesting. I fear there is little we can do, other than being prepared. They came once, they will be able to come again, and we should not underestimate the threat. */
IF ~~ THEN + greeting_01
END

IF ~~ THEN sahuagin_followup_01
SAY @69 /* Interesting. It's good to hear you managed to sabotage their plans. I fear their will to prepare for coastal raids might not be broken. There is little we can do, other than being prepared. They came once, they will be able to come again, and we should not underestimate the threat. */
IF ~~ THEN + greeting_01
END

IF ~~ THEN relic
SAY @70 /* Misunderstanding, hmm? Alright, I understand that this can happen easily with priestesses of the Water Queen. Give the relic to me, I'll see it returned to the temple. */
IF ~~ THEN SOLVED_JOURNAL @959 EXIT
END
END //APPEND

CHAIN
IF ~~ THEN bstrcmdr intrigue
@71 /* A plot to destabilize the city's authorities! I see the Temple of Umberlee never tires of plotting intrigues. Hmm, the letter is unsigned, but the names mentioned are explicit and the scroll used is similar to the ones of letters we received from the Temple of Umberlee before. However, I fear that this is not enough to be considered convincing evidence to justify official intervention. However, it is still more than enough to clearly rebuke the temple on a diplomatic level to mind its own business. */
DO ~EraseJournalEntry(@1008)
EraseJournalEntry(@1010)
AddJournalEntry(@100061,QUEST_DONE)~
= @72 /* However, I have no illusions that anyone in the temple will take responsibility for this. Experience has shown that the schemers are portrayed as individual perpetrators acting independently. But it's a good reminder that in politics, every faction is out for its own gain and mistrust is always appropriate. At least they themselves seem to have realized that there are times when such a plan is more than inappropriate, even if in this case it is only the lack of effect for their own benefit. */
== ~%IMOEN_JOINED%~ IF ~InParty("%IMOEN_DV%") InMyArea("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @73 /* Well, the fact that the plan exploded into their faces because the relic was taken to a temple that their deity despises may also have contributed to this realization, I'd figure. */
END
IF ~!Global("bs_ReportedToothQuest","MYAREA",1)
!Global("bs_ReportedToothQuest","MYAREA",2)~ THEN EXIT
IF ~Global("bs_ReportedToothQuest","MYAREA",1)~ THEN SOLVED_JOURNAL @959 + hand_in_tooth_evidence_01
IF ~Global("bs_ReportedToothQuest","MYAREA",2)~ THEN DO ~EraseJournalEntry(@959)~ SOLVED_JOURNAL @100063 + hand_in_tooth_evidence

APPEND bstrcmdr
IF ~~ THEN hand_in_tooth_evidence
SAY @74 /* Wait - this is related to the relic you handed in earlier, isn't it? I am glad I didn't find the time to have it delivered to the temple just yet. */
IF ~~ THEN + hand_in_tooth_evidence_01
END

IF ~~ THEN hand_in_tooth_evidence_01
SAY @75 /* It was the right choice, giving this artefact to the city authorities. Our namesake and valued founder gifted it to the temple to ensure Umberlee's favor for his hometown, and the church used it for a pact with Sea Devils to destabilize the city! We will discuss how to proceed with this. We do not want to anger a city's church, but I am sure the Temple of Umberlee will have to do more than just apologize to see this relic again. */
IF ~~ THEN DO ~SetGlobal("bs_ReportedToothQuest","MYAREA",3)~ EXIT
END

IF ~~ THEN hand_in_tooth_evidence_02
SAY @76 /* Wait - this is related to the temple's intrigue you discovered, isn't it? */
IF ~~ THEN + hand_in_tooth_evidence_01
END
END //APPEND

CHAIN
IF ~~ THEN bstrcmdr high_level
@77 /* A ritual chamber? */
== bstrcmdr IF ~!Dead("BSGLABRE")~ THEN @78 /* No, I wouldn't know anything about it. Best you talk to Master Shizell, our tower mage. You'll find his lab on this floor. */
END
IF ~~ THEN + greeting_01
IF ~Dead("BSGLABRE")~ THEN + high_level_01

APPEND bstrcmdr
IF ~~ THEN high_level_01
SAY @79 /* It held a Glabrezu, no less! You can call yourself lucky you survived tinkering with old summoning magic. But I appreciate the fact that you removed the danger that lurked there. It saves us having to worry about less successful overconfident adventurers, who always seem to be attracted to dungeons like these. Take this as a small token of appreciation. */
IF ~~ THEN DO ~GiveItemCreate("bstrnt00",[PC],0,0,0)~ + greeting_01
END

IF ~~ THEN tower_purpose
SAY @80 /* In a nutschell, we hold the defence against any dangers from the sea, watch over the safety of the habor - and also contain the most dangerous criminals in our Seatower Prison. */
IF ~~ THEN + greeting_01
END

IF ~~ THEN introduction
SAY @81 /* Right, I haven't introduced myself yet. */
= @82 /* Welcome to the Seatower. I am Seatower Commander Airard, Captain of the Seatower. If you have any official business concerning Balduran's Seatower, I am the person to talk to. If you are looking for your lost children, the Garrison Commander, Captain Dungarth, is the one you want;  you can find him in the barracks. */ 
IF ~~ THEN + greeting_01
END

IF ~~ THEN breakthrough
SAY @83 /* I *knew* it! Investigating this breach in the prison wall is imperative - where does it lead, are there more doppelgangers waiting on the other side. We cannot send our forces as long as we do not know who is still real and who is a monster in disguise, but we need to make sure there are no more doppelgangers waiting to invade. I am counting on you, <CHARNAME>. We will reward you for your assistance. */
IF ~~ THEN DO ~EraseJournalEntry(@823)
AddJournalEntry(@818,QUEST)~ EXIT
END

IF ~~ THEN slaversquest
SAY @84 /* Yes, I am. */
= @85 /* (sigh) Let me set something straight. I am - so to say - "aware" of what is going on in that room, as is the Watch. The problem is that so far, we had no *evidence* of that man's connections to slave traders. Every time the Flaming Fist thinks they can grab them, they come out clear as baby's skin.  A few minor agents get arrested, but the power brokers remain immune and new minions take the place of the old ones. */
= @86 /* As much as their audacity irks me, I am, to some extent, happy to have them so nearby - in the hopes that they will become sloppy and it will make convicting them one day easier than if we had to storm a shady tavern in the dock district. */ 
IF ~~ THEN DO ~SetGlobal("bsConfrontSlaveTraders","GLOBAL",2)~ + slaversquest_03
END

END //APPEND

CHAIN
IF ~~ THEN bstrcmdr slaversquest_01
@87 /* Hm, 20,000 is quite a sum, but if it means we have an eye witness, it might be worth the gold. He won't be able to testify against the head members, of course, but maybe he knows a few names and places. Yes, I think this is worth a try. It is difficult infiltrating the slavers as they are very suspicious, so I will not let this opportunity pass. */
== bstrcmdr IF ~Global("bsShucksBrother","GLOBAL",3)~ THEN @88 /* Make sure he's stays on the tower grounds after his release. I'll have questions for him. */
== bstrcmdr IF ~!Global("bsShucksBrother","GLOBAL",3)~ THEN @89 /* I understand that you want the expenses to be compensated. Make sure he stays on the tower grounds for now. I'll have questions for him. */
== bstrcmdr @90 /* Take this treasury note to my treasurer to receive the 20,000 gold. It was good you came to us with this; your assistance will also keep charges from being leveled against you in case your dealings with the slavers becomes known. */
END
IF ~~ THEN DO ~GiveItemCreate("bstrnt20",[PC],0,0,0) SetGlobal("bsSQCommanderPayed","GLOBAL",1)~ EXIT

APPEND bstrcmdr

IF ~~ THEN slaversquest_02
SAY @91 /* Is it the brother of the imprisoned soldier? My interrogator informed me on the situation. So you managed to arrange a trade for him? I'm not sure whether to be concerned or impressed. Thank you for providing this opportunity. I will send my interrogator to him immediately. Next time you visit we will know more about the slave traders' actions - I hope. */
IF ~~ THEN DO ~EraseJournalEntry(@880)
SetGlobal("bsSlaveWitnessInterrogated","GLOBAL",1)~ UNSOLVED_JOURNAL @881 EXIT
END

IF ~~ THEN slaversquest_03
SAY @92 /* Give me real evidence - one of their victims, one of their customers, or one of their allies ready to talk, and there will be a real chance to eliminate them at last. */
IF ~~ THEN UNSOLVED_JOURNAL @880 EXIT
IF ~Dead("bsslav01")~ THEN UNSOLVED_JOURNAL @880 + slaver_dead_01
END

END //APPEND

/* PC received the booklet with dates bssmq003.itm */
CHAIN
IF ~~ THEN bstrcmdr slaversquest_04
@93 /* Let me see. Hmm, this seems to be a list of their planned moves. "Special creatures", eh? Yes, we know about that code name. They are planning something that night to be sure. */
DO ~SetGlobal("bsSQCommanderKnowsTimes","LOCALS",1)~

/* commander doesn't know place: general comment */
== bstrcmdr IF ~Global("bsSQCommanderKnowsPlace","LOCALS",0)
!GlobalGT("bsShucksBrother","GLOBAL",29) !Dead("bsshckbr")~ THEN @94 /* We'd need information about the place this is going to happen. Without that, this booklet is worthless, I am afraid. It won't even suffice as evidence against the slavers. */
== bstrcmdr IF ~Global("bsSlaveWitnessInterrogated","GLOBAL",1)
!Dead("bsshckbr")~ THEN @95 /* Let's hope the witness can shed a bit of light on that - that would be perfect. We will see how the interrogation goes. */
== bstrcmdr IF ~OR(2) GlobalGT("bsShucksBrother","GLOBAL",29) Dead("bsshckbr")~ THEN @96 /* Thank you for bringing this to me; I believe you meant well by confronting the slave trader agent, but without more solid evidence there is not much we can do. Nevertheless, I will forward this booklet to the Flaming Fist. The information will definitely help them to keep their eyes open. */
END

/* commander doesn't know place yet but PC can still find information: quest continues */
IF ~~ THEN DO ~AddJournalEntry(@885,QUEST)~ EXIT

/* there will be no information about the place because witness isn't freed or dead: quest end. */
IF ~OR(2) GlobalGT("bsShucksBrother","GLOBAL",29) Dead("bsshckbr")~ THEN DO ~
EraseJournalEntry(@880)
EraseJournalEntry(@881)
EraseJournalEntry(@100164)
AddJournalEntry(@886,QUEST_DONE)
SetGlobal("bsConfrontSlaveTraders","GLOBAL",11)~ EXIT

/* commander already knows about place: dialogue continues to next quest state */
IF ~Global("bsSQCommanderKnowsPlace","LOCALS",1)~ THEN + slaversquest_05

APPEND bstrcmdr

IF ~~ THEN slaversquest_05
SAY @97 /* There is no guarantee the trade mentioned in the booklet will happen at the place our witness remembered, but this is the closest we have ever come to knowing their next move and we will not let this opportunity pass without trying to catch them in the act. I will forward this booklet to the Watch as evidence, and we will prepare to catch them at the specified time and place. */
IF ~~ THEN + slaversquest_06
/* PC confronted slavers for Holger - no more involvement */
IF ~OR(2)
Global("bsConfrontSlaveTraders","GLOBAL",7)
Global("bsConfrontSlaveTraders","GLOBAL",8)~ THEN + slaversquest_12
END

IF ~~ THEN slaversquest_06
SAY @98 /* Did you plan on helping us in this endeavor? You've come this far. We could use the additional manpower, and you would be compensated for your assistance. */
+ ~Global("bsSlaverQuest","GLOBAL",4)
OR(2)
!Class(Player1,PALADIN)
%PLAYER1_BLACKGUARD%~ + @99 /* I have to if we want to prevent suspicion. They are expecting me for protection of the "wares". */ + slaversquest_07
+ ~Global("bsSlaverQuest","GLOBAL",4) Class(Player1,PALADIN) %PLAYER1_NO_BLACKGUARD%~ + @99 /* I have to if we want to prevent suspicion. They are expecting me for protection of the "wares". */ + slaversquest_07_1
++ @100 /* Yes, I will come and help overthrow them. */ + slaversquest_08
+ ~!Global("bsSlaverQuest","GLOBAL",4)~ + @101 /* I'd rather stay out of this, to be honest. */ + slaversquest_10
END

IF ~~ THEN slaversquest_07
SAY @102 /* I see. Then I hope I'm not making a mistake by letting you go free. I'll count on your support in this, <CHARNAME>. */
IF ~~ THEN + slaversquest_09
END

IF ~~ THEN slaversquest_07_1
SAY @103 /* You?! */
IF ~~ THEN + slaversquest_09
END

IF ~~ THEN slaversquest_08
SAY @104 /* Very good. */
IF ~~ THEN + slaversquest_09
END

IF ~~ THEN slaversquest_09
SAY @105 /* Be at the specified place shortly after nightfall so we can set the ambush. */
IF ~~ THEN DO ~SetGlobal("bsConfrontSlaveTraders","GLOBAL",3)~ UNSOLVED_JOURNAL @883 EXIT
END

IF ~~ THEN slaversquest_10
SAY @106 /* I see. We will take over from here, then. */
IF ~~ THEN DO ~SetGlobal("bsConfrontSlaveTraders","GLOBAL",10)~ SOLVED_JOURNAL @884 EXIT
END

IF ~~ THEN slaversquest_11
SAY @107 /* Is that so! I trust you and won't ask how you received this information. Thank you for telling me this. This is the closest we have ever come to knowing their next move and we will not let this opportunity pass without trying to catch them in the act. I will forward this information to the Watch, and we will prepare to catch them at the specified time and place. */
IF ~~ THEN DO ~EraseJournalEntry(@882)
SetGlobal("bsSQCommanderKnowsTimes","LOCALS",3) SetGlobal("bsSQCommanderKnowsPlace","LOCALS",1)~ + slaversquest_06
END

IF ~~ THEN slaversquest_12
SAY @108 /* We will take over from here. Thank you for your efforts - this is a big step against these devils. While we may not be able to catch the big fish, we now have everything to move our investigation forward. */
IF ~~ THEN + slaversquest_13
END

IF ~~ THEN slaversquest_13
SAY @109 /* It was your help that made this possible. Take this as a reward for your services. The city thanks you. */
IF ~~ THEN DO ~GiveItemCreate("bstrnt05",[PC],0,0,0)
EraseJournalEntry(@888)
SetGlobal("bsConfrontSlaveTraders","GLOBAL",9)~ SOLVED_JOURNAL @889 EXIT
IF ~OR(2)
Global("bsConfrontSlaveTraders","GLOBAL",7)
Global("bsConfrontSlaveTraders","GLOBAL",8)~ THEN DO ~GiveItemCreate("bstrnt05",[PC],0,0,0)
EraseJournalEntry(@882)
EraseJournalEntry(@886)
EraseJournalEntry(@888)
EraseJournalEntry(@100164)
SetGlobal("bsConfrontSlaveTraders","GLOBAL",9)~ SOLVED_JOURNAL @100101 EXIT
END

IF ~~ THEN treasurenote
SAY @110 /* My treasurer will pay out the gold amount specified on it. Just go into the treasury at the main gates and hand it to him. */
IF ~~ THEN + greeting_01
END


END //APPEND


/* start smuggler in Nashkel quest: access to prison */

CHAIN
IF WEIGHT #-1
~NumTimesTalkedToGT(0)
Global("bsJumpStartDGQuest","GLOBAL",0)
OR(3)
Global("bsMissingMonk","GLOBAL",4)
Global("bsMissingMonk","GLOBAL",5)
Global("bsMissingMonk","GLOBAL",10) Global("bsGavePrisonPass","GLOBAL",0)~ THEN bstrcmdr prisonpass 
@111 /* You are the group that made a name for themselves in the Nashkel Mines, are you not? */
== bstrcmdr IF ~Global("TalkedToScar","GLOBAL",0)~ THEN @112 /* Your identity has been secured by now, no matter what you told Commander Scar at the Bridge. */
== bstrcmdr @113 /* I know Commander Scar was looking for you. If the Flaming Fist would consider entrusting you with a task, then so shall we. */
END
IF ~~ THEN + reward_martina
IF ~Global("bsMissingMonk","GLOBAL",10)~ THEN + reward_martina_01

APPEND bstrcmdr
IF WEIGHT #-1
~NumTimesTalkedToGT(0)
GlobalGT("bsJumpStartDGQuest","GLOBAL",0)
OR(2)
Global("bsMissingMonk","GLOBAL",4)
Global("bsMissingMonk","GLOBAL",5) Global("bsGaveRewardMartina","LOCALS",0)~ THEN reward_martina
SAY @114 /* You are the ones who found the poor murdered monk. We appreciate the effort, and would like to give you this small sum as compensation. Keeping the peace and order inside the tower is a priority, and I am thankful this tragic event could be resolved so quickly with your help. The abbot would also like to thank you, in case you haven't talked to him yet. The soldier responsible has been imprisoned for the time being. */
IF ~~ THEN DO ~GiveItemCreate("bstrnt00",[PC],0,0,0) SetGlobal("bsGaveRewardMartina","LOCALS",1)~ + reward_martina_02
END

IF WEIGHT #-1
~NumTimesTalkedToGT(0)
GlobalGT("bsJumpStartDGQuest","GLOBAL",0)
Global("bsMissingMonk","GLOBAL",10)~ THEN reward_martina_01
SAY @115 /* We had to imprison one of our own, a soldier, because he stole a large donation by the Ilmater Monastery meant for the poor of the city. */
IF ~~ THEN + reward_martina_02
END
END //APPEND

CHAIN
IF ~~ THEN bstrcmdr reward_martina_02
@116 /* He does not exactly deny his crime, but still he is not being completely forthcoming as to why he would do such a deed. On top of it all, he had the unusual request that you, and you specifically, would listen to what he has to say. */
= @117 /* Normally I'd just set the interrogator on him, but in this case I'll make an exception out of respect of him being one of our soldiers. */
== bstrcmdr IF ~Global("bsJumpStartDGQuest","GLOBAL",0)~ THEN @118 /* I will give you time to speak to him before I will start questioning him. */
== bstrcmdr IF ~GlobalGT("bsJumpStartDGQuest","GLOBAL",0)~ THEN @119 /* So, in case you haven't spoken to him already, I'd like to ask that you speak with him and see what you can discover. */
END
/* PC came to tower first time after Sarevok was defeated: already got prison pass from first dialogue with commander */
IF ~GlobalGT("bsJumpStartDGQuest","GLOBAL",0)~ THEN UNSOLVED_JOURNAL @802  EXIT

+ ~Global("bsJumpStartDGQuest","GLOBAL",0)~ + @120 /* Fine, I'll talk to him. */ + prisonpass_03
+ ~Global("bsJumpStartDGQuest","GLOBAL",0)~ + @121 /* You are presuming I'm willing to talk to your man. */ + prisonpass_02
+ ~Global("bsJumpStartDGQuest","GLOBAL",0)~ + @122 /* And you think I'd tell you what he tells me? */ + prisonpass_01


APPEND bstrcmdr

IF ~~ THEN prisonpass_01
SAY @123 /* I would expect you to report anything of importance to the tower's safety to me, yes, but nothing else. Rest assured that I have effective ways to get him to tell me what he told you. */
IF ~~ THEN + prisonpass_04
END

IF ~~ THEN prisonpass_02
SAY @124 /* It is his specific wish. I know your type, and I have yet to meet one who wouldn't go just for curiosity's sake. This pass will grant you access to the prison. */
IF ~~ THEN + prisonpass_04
END

IF ~~ THEN prisonpass_03
SAY @125 /* Splendid. */
IF ~~ THEN + prisonpass_04
END

IF ~~ THEN prisonpass_04
SAY @126 /* I wouldn't normally grant this to just anyone, but as I said you have already made a name for yourself and we might have a need for your services later. Report anything of interest to the tower's or city's safety to me. Here, take this pass, it will grant you access to the prison if you show it to the guards. The man's name is Shuck, he should be in one of the front cells. */
IF ~~ THEN DO ~GiveItemCreate("bsprpass",[PC],1,0,0)
EraseJournalEntry(@799)
SetGlobal("bsGavePrisonPass","GLOBAL",1)~ UNSOLVED_JOURNAL @800 EXIT
END

END //APPEND

