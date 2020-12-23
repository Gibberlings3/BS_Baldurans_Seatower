

/* adjutant */
BEGIN yssgt3
IF ~True()~ THEN greeting
SAY ~Good day to you, please leave the commander to his work if there is no urgent business.~
IF ~~ THEN EXIT
END



/* Seatower Commander Airard */
BEGIN bstrcmdr

/* very first greeting */
CHAIN
IF ~NumTimesTalkedTo(0)~ THEN bstrcmdr greeting
~Welcome to the Seatower. I am Tower Commander Airard. If you have any official business concerning Balduran's Seatower, I am the person to talk to. If you are looking for your lost children - Captain of the Guard, Dungarth is the one you want;  you can find him in the barracks.~ DO ~SetGlobal("bsIntroduction","LOCALS",1)~
== bstrcmdr IF ~InMyArea("yssgt3")~ THEN ~Sergeant - one of the lamps is out again. Would you please let the chamber servant know that the oil needs refilling!~
== yssgt3 IF ~InMyArea("yssgt3")~ THEN ~Aye, sir!~
END
IF ~~ THEN EXIT
IF ~OR(3)
Global("bsMissingMonk","GLOBAL",4)
Global("bsMissingMonk","GLOBAL",5)
Global("bsMissingMonk","GLOBAL",10) Global("bsGavePrisonPass","GLOBAL",0)~ THEN + prisonpass 
IF ~Dead("bsslav01")~ THEN + slaver_dead


APPEND bstrcmdr

/* successful finish of "Confront the Slave Traders in Baldur's Gate" quest */
IF ~Global("bsConfrontSlaveTraders","GLOBAL",6)~ THEN slaverquest_finished
SAY ~There you are! The mission against the slavers was a success - while we may not have caught the big fish yet, we now have prisoners and witnesses who should help us move our investigation forward.~
= ~It was your help that made this possible. Take this as a reward for your services. The city thanks you.~
IF ~~ THEN DO ~GiveItemCreate("bstrnt05",[PC],0,0,0) 
EraseJournalEntry(@888)
SetGlobal("bsConfrontSlaveTraders","GLOBAL",7)~ SOLVED_JOURNAL @889 EXIT
END

END //APPEND

/* PC killed the slave trader contact */
CHAIN
IF ~Dead("bsslav01") Global("bsNoticedSlaversDead","LOCALS",0)~ THEN bstrcmdr slaver_dead
~You killed the slave trader agent on the third floor.~
== bstrcmdr IF ~GlobalLT("bsConfrontSlaveTraders","GLOBAL",2)
GlobalLT("bsDoppelgangerQuest","GLOBAL",4)~ THEN ~You are fortunate that we will let it pass as an early death sentence for the scum, or you would be prosecuted for your part in the violent exchange on tower grounds.~
== bstrcmdr IF ~OR(2)
GlobalGT("bsConfrontSlaveTraders","GLOBAL",1)
GlobalGT("bsDoppelgangerQuest","GLOBAL",3)~ THEN ~In exchange for your assistance with the case, we're willing to overlook your killing of that scum, but normally you would be prosecuted for your part in the violent exchange on tower grounds.~
END
IF ~GlobalGT("bsConfrontSlaveTraders","GLOBAL",1)~ THEN DO ~SetGlobal("bsNoticedSlaversDead","LOCALS",1)~ + slaver_dead_01

+ ~Global("bsConfrontSlaveTraders","GLOBAL",0)~ + ~What? Leonhard 'the Fiiiierrrrce' was a slave trader and you *knew*?!~ DO ~SetGlobal("bsNoticedSlaversDead","LOCALS",1)~ + slaver_dead_00

+ ~Global("bsConfrontSlaveTraders","GLOBAL",1)~ + ~You knew there were slavers carrying out their business inside the tower?~ DO ~SetGlobal("bsNoticedSlaversDead","LOCALS",1)~ + slaver_dead_00
+  ~GlobalLT("bsConfrontSlaveTraders","GLOBAL",2)~ + ~I killed a few slave traders. I'm pretty sure the Watch would not object.~ DO ~SetGlobal("bsNoticedSlaversDead","LOCALS",1)~ + slaver_dead_02

APPEND bstrcmdr

IF ~~ THEN slaver_dead_00
SAY ~Yes, we knew.~ 
IF ~~ THEN + slaver_dead_03
END

END //APPEND

CHAIN
IF ~~ THEN bstrcmdr slaver_dead_01
~It's a shame, now we'll have to track down wherever they move their operations to next. Let us just hope it will still be inside the city, or they might be out of reach of the Watch completely.~
== bstrcmdr IF ~GlobalLT("bsConfrontSlaveTraders","GLOBAL",6)~ THEN ~If you found any evidence that would help us convict them for their evil actions, then please let me know.  However, I doubt you found anything useful, they are smarter than that.~
== bstrcmdr IF ~GlobalGT("bsConfrontSlaveTraders","GLOBAL",5)~ THEN ~Not that we would have tolerated their presence for much longer. But I was hoping we would be able to gather enough evidence to build a case that would allow us to give them a proper trial - if only to signal that the rule of law prevails and that we can and will defend the laws and values of this city.~
END
IF ~~ THEN EXIT
IF ~OR(3)
Global("bsMissingMonk","GLOBAL",4)
Global("bsMissingMonk","GLOBAL",5)
Global("bsMissingMonk","GLOBAL",10) Global("bsGavePrisonPass","GLOBAL",0)~ THEN + prisonpass 


APPEND bstrcmdr

IF ~~ THEN slaver_dead_02
SAY ~The Watch is tasked with enforcing the law. Going around killing the minions of criminal organizations will only lead to cutting of the snake's tail while the head retreats to the shadows. I'm afraid you did not help us.~
IF ~~ THEN + slaver_dead_03
END

IF ~~ THEN slaver_dead_03
SAY ~We weren't happy about their presence, but we had no *evidence* of that man's connections to slave traders. Every time the Watch or the Flaming Fist thinks they can make a move and eliminate the slavers, they somehow come out smooth as baby's bottom.  A few minor agents get arrested, but the power brokers remain immune and new minions take the place of the old ones.~
IF ~~ THEN + slaver_dead_01
IF ~GlobalGT("bsShucksBrother","GLOBAL",5) GlobalLT("bsShucksBrother","GLOBAL",30) !Dead("bsshckbr")~ THEN DO ~SetGlobal("bsConfrontSlaveTraders","GLOBAL",2)~ + slaversquest_03
END

END //APPEND

/* slaver quest: Commander interrogated witness. */
CHAIN
IF ~Global("bsSlaveWitnessInterrogated","GLOBAL",2)~ THEN bstrcmdr witness
~The talk with the witness was very promising. He could name a few places and names. One location seems to warrant our particular interest as it seems to be a place frequently used for transfers of slaves.~
== bstrcmdr IF ~Global("bsSQCommanderKnowsTimes","LOCALS",0)~ THEN ~Now if we only knew for sure when the next transfer would take place. We can't put more forces there than would normally be on patrol - they would notice and move their operation elsewhere.~
== bstrcmdr IF ~Global("bsSQCommanderKnowsPlace","LOCALS",1) Global("bsSQCommanderKnowsTimes","LOCALS",1)~ THEN ~It's the location we already know about and the witness was able to fill in some more details as to how it will go down. Together with the other evidence we've managed to gather, this will help us greatly in our case against the slave traders.~
== bstrcmdr ~Thank you for arranging this, <CHARNAME>. Take this as a reward for your services for the city.~
DO ~GiveItemCreate("bstrnt03",[PC],0,0,0) AddexperienceParty(3500) 
EraseJournalEntry(@881)~
END

/* commander doesn't know about time: dialogue ends */
IF ~~ THEN DO ~SetGlobal("bsSlaveWitnessInterrogated","GLOBAL",3) SetGlobal("bsSQCommanderKnowsPlace","LOCALS",1)~ EXIT

/* commander already knows about time: dialogue continues to next quest state */
IF ~Global("bsSQCommanderKnowsTimes","LOCALS",1) Global("bsSQCommanderKnowsPlace","LOCALS",0)~ THEN DO ~SetGlobal("bsSlaveWitnessInterrogated","GLOBAL",3) SetGlobal("bsSQCommanderKnowsPlace","LOCALS",1)~ + slaversquest_05


APPEND bstrcmdr

/* general dialogue with all quest relevant reply options */

IF ~NumTimesTalkedToGT(0)~ THEN greeting_01
SAY ~Is there anything else I need to know?~

/* Doppelganger quest and all related stuff to the Seacave. Most dialogue states linked to are in z_quest_doppelgangers.d! */

/* PC came late to the tower */
+ ~Global("bsIntroduction","LOCALS",0)~ + ~Who are you?~ DO ~SetGlobal("bsIntroduction","LOCALS",1)~ + introduction

+ ~GlobalGT("bsSeaCaveOpen","GLOBAL",0)
Global("bsKnowsBreakthrough","LOCALS",0)~ + ~There is indeed a hole in the prison wall... someone has been busy.~ DO ~SetGlobal("bsKnowsBreakthrough","LOCALS",1)~ + breakthrough

/* general quest replies */
+ ~Global("bsFoundSerjeante","GLOBAL",1)
Global("bsKnowsBreakthrough","LOCALS",1)~ + ~The hole leads into a seacave with several exits. We found the dead adjutant there, dead and hastily buried.~ DO ~SetGlobal("bsFoundSerjeante","GLOBAL",2)~ + doppelgangers_04
+ ~GlobalGT("bsSeaCaveOpen","GLOBAL",3) Global("bsSeaCaveOpenLOC","LOCALS",0)
Global("bsKnowsBreakthrough","LOCALS",1)~ + ~We found an exit under the rope lift in Traitor's Tower directly into the cave.  It had been blocked by a huge stone.~ DO ~SetGlobal("bsSeaCaveOpenLOC","LOCALS",1)~ + doppelgangers_06
+ ~Global("bsFoundExitUmberlee","GLOBAL",1) Global("bsFoundExitUmberleeLOC","LOCALS",0)
Global("bsKnowsBreakthrough","LOCALS",1)~ + ~There is an exit right into the Temple of Umberlee.~ DO ~SetGlobal("bsFoundExitUmberleeLOC","LOCALS",1)~ + doppelgangers_05
+ ~Global("bsFoundExitDocks","GLOBAL",1) Global("bsFoundExitDocksLOC","LOCALS",0)
Global("bsKnowsBreakthrough","LOCALS",1)~ + ~There is an exit right into the Docks, through a smuggler tunnel.~ DO ~SetGlobal("bsFoundExitDocksLOC","LOCALS",1)~ + doppelgangers_12
//+ ~## Global("bsFoundSahuaginLOC","LOCALS",0) Global("bsKnowsBreakthrough","LOCALS",1)~ + ~We found more Sahuagins down there. They shouldn't be a problem anymore, though.~ DO ~SetGlobal("bsFoundSahuaginLOC","LOCALS",1)~ + doppelgangers_07
 + ~GlobalGT("bsPCMetSmugglerDoppelgangers","GLOBAL",0) Global("bsPCMetSmugglerLOC","LOCALS",0)
Global("bsKnowsBreakthrough","LOCALS",1)~ + ~There was a local smuggler cell that had been completely taken over by doppelgangers...~ DO ~SetGlobal("bsPCMetSmugglerLOC","LOCALS",1)~ + doppelgangers_10
+ ~Global("bsDoppelgangerTailor","GLOBAL",1) Global("bsTailorLOC","LOCALS",0)
Global("bsKnowsBreakthrough","LOCALS",1)~ + ~The tailor at "Master Usher's Finest Clothes" was a doppelganger! I am afraid the shop was used to target nobles of the town and replace them with doppelgangers.~ DO ~SetGlobal("bsTailorLOC","LOCALS",1)~ + doppelgangers_11
+ ~NumDeadGT("bsdopp07",0) GlobalGT("bsDoppelgangerQuest","GLOBAL",6)
GlobalLT("bsDoppelgangerQuest","GLOBAL",15)~ + ~I killed doppelgangers on the tower grounds.~ + doppelgangers_08
+ ~GlobalGT("bsDoppelgangerQuest","GLOBAL",1)
GlobalLT("bsDoppelgangerQuest","GLOBAL",7)~ + ~I'll investigate the breach in the prison right away.~ + doppelgangers_09
+ ~GlobalGT("bsDoppelgangerQuest","GLOBAL",6)
GlobalLT("bsDoppelgangerQuest","GLOBAL",10)~ + ~There is no use in waiting for me to fight doppelgangers. I will not join the fight.~ + doppelgangers_19
+ ~GlobalGT("bsDoppelgangerQuest","GLOBAL",6)
GlobalLT("bsDoppelgangerQuest","GLOBAL",15)~ + ~Nothing new.~ + doppelgangers_09

/* slaver quest */
/* first reply option: making commander aware */
+ ~Global("bsConfrontSlaveTraders","GLOBAL",1)
!Dead("bsslav01")~ + ~Are you aware that there are slave traders doing their business *right here* inside the tower?~ + slaversquest

/* reply options about Shuck's brother: PC needs the gold to buy him free */
+ ~Global("bsShucksBrother","GLOBAL",3)
!GlobalTimerExpired("bsSlaveTimer1","GLOBAL")
GlobalGT("bsConfrontSlaveTraders","GLOBAL",1)
Global("bsSQCommanderPayed","GLOBAL",0)~ + ~I might have a witness for the slave traders, but I need 20,000 gold to buy his freedom.~ + slaversquest_01
/* reply options about Shuck's brother: PC spent gold to buy him free and wants it refunded later */
+ ~GlobalGT("bsShucksBrother","GLOBAL",3) GlobalLT("bsShucksBrother","GLOBAL",30) !Dead("bsshckbr") 
GlobalGT("bsConfrontSlaveTraders","GLOBAL",1)
Global("bsSQCommanderPayed","GLOBAL",0)~ + ~I spent 20,000 gold to free a witness against the slave traders, and I want the sum to be repaid.~ + slaversquest_01
/* reply options about Shuck's brother: is in monastery now */
+ ~GlobalGT("bsShucksBrother","GLOBAL",5) GlobalLT("bsShucksBrother","GLOBAL",30) !Dead("bsshckbr") 
GlobalGT("bsConfrontSlaveTraders","GLOBAL",1)
Global("bsSlaveWitnessInterrogated","GLOBAL",0)~ + ~The witness to the slavers' actions is now recovering in the Ilmater monastery.~ + slaversquest_02

/* PC killed slaver contact and retrieved the booklet with times: collaboration with slavers no longer possible */
+ ~PartyHasItem("bssmq003")~ + ~I found this with Leonhard 'the Fierce'. Does this help you in any way?~ + slaversquest_04

/* PC collaborates with slavers and got info about time and place. Finding the booklet is no longer possible */
+ ~Global("bsSlaverQuest","GLOBAL",4) GlobalGT("bsConfrontSlaveTraders","GLOBAL",1)~ + ~I know the time and place of one of the slavers' shipments: when night has fallen, south of Wyrm's Crossing.~ + slaversquest_11

/* treasury note: general question */
+ ~OR(3) PartyHasItem("bstrnt03") PartyHasItem("bstrnt05") PartyHasItem("bstrnt20")~ + ~What exactly am I supposed to do with the treasury note?~ + treasurenote

/* general farewell dialogue */
++ ~Good day to you.~ EXIT
END

IF ~~ THEN introduction
SAY ~Right, I haven't introduced myself yet.~
= ~Welcome to the Seatower. I am Tower Commander Airard. If you have any official business concerning Balduran's Seatower, I am the person to talk to. If you are looking for your lost children - Captain of the Guard, Dungarth is the one you want;  you can find him in the barracks.~ 
IF ~~ THEN + greeting_01
END

IF ~~ THEN breakthrough
SAY ~I *knew* it! Investigating this breach in the prison wall is imperative - where does it lead, are there more doppelgangers waiting on the other side. We cannot send our forces as long as we do not know who is still real and who is a monster in disguise, but we need to make sure there are no more doppelgangers waiting to invade. I am counting on you, <CHARNAME>. We will reward you for your assistance.~
IF ~~ THEN DO ~EraseJournalEntry(@823)
AddJournalEntry(@818,QUEST)~ EXIT
END

IF ~~ THEN slaversquest
SAY ~Yes, I am.~
= ~(sigh) Let me set something straight. I am - so to say - "aware" of what is going on in that room, as is the Watch. The problem is that so far, we had no *evidence* of that man's connections to slave traders. Every time the Flaming Fist thinks they can grab them, they come out clear as baby's skin.  A few minor agents get arrested, but the power brokers remain immune and new minions take the place of the old ones.~
= ~As much as their audacity irks me, I am, to some extent, happy to have them so nearby - in the hopes that they will become sloppy and it will make convicting them one day easier than if we had to storm a shady tavern in the dock district.~ 
IF ~~ THEN DO ~SetGlobal("bsConfrontSlaveTraders","GLOBAL",2)~ + slaversquest_03
END

END //APPEND

CHAIN
IF ~~ THEN bstrcmdr slaversquest_01
~Hm, 20,000 is quite a sum, but if it means we have an eye witness, it might be worth the gold. He won't be able to testify against the head members, of course, but maybe he knows a few names and places. Yes, I think this is worth a try. It is difficult infiltrating the slavers as they are very suspicious, so I will not let this opportunity pass.~
== bstrcmdr IF ~Global("bsShucksBrother","GLOBAL",3)~ THEN ~Make sure he's stays on the tower grounds after his release. I'll have questions for him.~
== bstrcmdr IF ~!Global("bsShucksBrother","GLOBAL",3)~ THEN ~I understand that you want the expenses to be compensated. Make sure he stays on the tower grounds for now. I'll have questions for him.~
== bstrcmdr ~Take this treasury note to my treasurer to receive the 20,000 gold. It was good you came to us with this; your assistance will also keep charges from being leveled against you in case your dealings with the slavers becomes known.~
END
IF ~~ THEN DO ~GiveItemCreate("bstrnt20",[PC],0,0,0) SetGlobal("bsSQCommanderPayed","GLOBAL",1)~ EXIT

APPEND bstrcmdr

IF ~~ THEN slaversquest_02
SAY ~Is it the brother of the imprisoned soldier? My interrogator told me. So you managed to arrange a trade for him? I'm not sure whether to be concerned or impressed. Thank you for providing this opportunity. I will send my interrogator to him immediately. Next time you visit we will know more about the slave traders' actions - I hope.~
IF ~~ THEN DO ~EraseJournalEntry(@880)
SetGlobal("bsSlaveWitnessInterrogated","GLOBAL",1)~ UNSOLVED_JOURNAL @881 EXIT
END

IF ~~ THEN slaversquest_03
SAY ~Give me real evidence - one of their victims, one of their customers, or one of their allies ready to talk, and there will be a real chance to eliminate them at last.~
IF ~~ THEN UNSOLVED_JOURNAL @880 EXIT
IF ~Dead("bsslav01")~ THEN UNSOLVED_JOURNAL @880 + slaver_dead_01
END

END //APPEND

/* PC received the booklet with dates bssmq003.itm */
CHAIN
IF ~~ THEN bstrcmdr slaversquest_04
~Let me see. Hmm, this seems a to be a list of their planned moves. "Special creatures", eh? Yes, we know about that code name. They are planning something that night to be sure.~
DO ~TakePartyItem("bssmq003") DestroyItem("bssmq003") SetGlobal("bsSQCommanderKnowsTimes","LOCALS",1)~

/* commander doesn't know place: general comment */
== bstrcmdr IF ~Global("bsSQCommanderKnowsPlace","LOCALS",0)~ THEN ~We'd need information about the place this is going to happen. Without that, this booklet is worthless, I am afraid. It won't even suffice as evidence against the slavers.~
== bstrcmdr IF ~Global("bsSlaveWitnessInterrogated","GLOBAL",1)~ THEN ~Let's hope the witness can shed a bit of light on that - that would be perfect. We will see how the interrogation goes.~
= ~Thank you for bringing this to me; I believe you meant well by confronting the slave trader agent, but without more solid evidence there is not much we can do. Nevertheless, I will forward this booklet to the Flaming Fist. The information will definitely help them to keep their eyes open.~ 
END

/* commander doesn't know place yet but PC can still find information: quest continues */
IF ~~ THEN DO ~AddJournalEntry(@885,QUEST)~ EXIT

/* there will be no information about the place because PC doesn't work with smugglers and witness isn't freed or dead: quest end. */
IF ~OR(2) GlobalGT("bsShucksBrother","GLOBAL",29) Dead("bsshckbr")
Global("bsWorkingWithSmugglers","GLOBAL",0)~ THEN DO ~ 
EraseJournalEntry(@880)
EraseJournalEntry(@881) AddJournalEntry(@886,QUEST_DONE) 
SetGlobal("bsConfrontSlaveTraders","GLOBAL",11)~ EXIT

/* commander already knows about place: dialogue continues to next quest state */
IF ~Global("bsSQCommanderKnowsPlace","LOCALS",1)~ THEN + slaversquest_05

APPEND bstrcmdr

IF ~~ THEN slaversquest_05
SAY ~There is no guarantee the trade mentioned in the booklet will happen at the place our witness remembered, but this is the closest we have ever come to knowing their next move and we will not let this opportunity pass without trying to catch them in the act. I will forward this booklet to the Watch as evidence, and we will prepare to catch them at the specified time and place.~
IF ~~ THEN + slaversquest_06
END

IF ~~ THEN slaversquest_06
SAY ~Did you plan on helping us in this endeavor? You've come this far. We could use the additional manpower, and you would be compensated for your assistance.~
+ ~Global("bsSlaverQuest","GLOBAL",4)
OR(2)
!Class(Player1,PALADIN)
%PLAYER1_BLACKGUARD%~ + ~I have to if we want to prevent suspicion. They are expecting me for protection of the "wares".~ + slaversquest_07
+ ~Global("bsSlaverQuest","GLOBAL",4) Class(Player1,PALADIN) %PLAYER1_NO_BLACKGUARD%~ + ~I have to if we want to prevent suspicion. They are expecting me for protection of the "wares".~ + slaversquest_07_1
++ ~Yes, I will come and help overthrow them.~ + slaversquest_08
+ ~!Global("bsSlaverQuest","GLOBAL",4)~ + ~I'd rather stay out of this, to be honest.~ + slaversquest_10
END

IF ~~ THEN slaversquest_07
SAY ~I see. Then I hope I'm not making a mistake by letting you go free. I'll count on your support in this, <CHARNAME>.~
IF ~~ THEN + slaversquest_09
END

IF ~~ THEN slaversquest_07_1
SAY ~You?!~
IF ~~ THEN + slaversquest_09
END

IF ~~ THEN slaversquest_08
SAY ~Very good.~
IF ~~ THEN + slaversquest_09
END

IF ~~ THEN slaversquest_09
SAY ~Be at the specified place shortly after nightfall so we can set the ambush.~
IF ~~ THEN DO ~SetGlobal("bsConfrontSlaveTraders","GLOBAL",3)~ UNSOLVED_JOURNAL @883 EXIT
END

IF ~~ THEN slaversquest_10
SAY ~I see. We will take over from here, then.~
IF ~~ THEN DO ~SetGlobal("bsConfrontSlaveTraders","GLOBAL",10)~ SOLVED_JOURNAL @884 EXIT
END

IF ~~ THEN slaversquest_11
SAY ~Is that so! I trust you and won't ask how you received this information. Thank you for telling me this. This is the closest we have ever come to knowing their next move and we will not let this opportunity pass without trying to catch them in the act. I will forward this information to the Watch, and we will prepare to catch them at the specified time and place.~
IF ~~ THEN DO ~EraseJournalEntry(@882)
SetGlobal("bsSQCommanderKnowsTimes","LOCALS",1) SetGlobal("bsSQCommanderKnowsPlace","LOCALS",1)~ + slaversquest_06
END

IF ~~ THEN treasurenote
SAY ~My treasurer will pay out the gold amount specified on it. Just go into the treasury at the main gates and hand it to him.~
IF ~~ THEN + greeting_01
END


END //APPEND


/* start smuggler in Nashkel quest */


CHAIN
IF WEIGHT #-1
~NumTimesTalkedToGT(0)
Global("bsJumpStartDGQuest","GLOBAL",0)
OR(3)
Global("bsMissingMonk","GLOBAL",4)
Global("bsMissingMonk","GLOBAL",5)
Global("bsMissingMonk","GLOBAL",10) Global("bsGavePrisonPass","GLOBAL",0)~ THEN bstrcmdr prisonpass 
~You are the group that made a name for themselves in the Nashkel Mines, are you not? I know Commander Scar was looking for you. If the Flaming Fist would trust you enough to entrust you with a task, then so shall we.~
END
IF ~~ THEN + reward_martina

CHAIN
IF WEIGHT #-1
~NumTimesTalkedToGT(0)
GlobalGT("bsJumpStartDGQuest","GLOBAL",0)
OR(2)
Global("bsMissingMonk","GLOBAL",4)
Global("bsMissingMonk","GLOBAL",5) Global("bsGaveRewardMartina","LOCALS",0)~ THEN bstrcmdr reward_martina
~You are the ones who found the poor murdered monk. We appreciate the effort, and would like to give you this small sum as compensation. Keeping the peace and order inside the tower is a priority, and I am thankful this tragic event could be resolved so quickly with your help. The abbot would also like to thank you, in case you haven't talked to him yet. The soldier responsible has been imprisoned for the time being.~ DO ~GiveItemCreate("bstrnt00",[PC],0,0,0) SetGlobal("bsGaveRewardMartina","LOCALS",1)~ 
== bstrcmdr IF ~Global("bsMissingMonk","GLOBAL",10)~ THEN ~We had to imprison one of our own, a soldier, because he stole a large donation by the Ilmater Monastery meant for the poor of the city.~
== bstrcmdr ~He does not exactly deny his crime, but still he is not being completely forthcoming as to why he would do such a deed. On top of it all, he had the unusual request that you, and you specifically, would listen to what he has to say.~
= ~Normally I'd just set the interrogator on him, but in this case I'll make an exception out of respect of him being one of our soldiers.~
== bstrcmdr IF ~Global("bsJumpStartDGQuest","GLOBAL",0)~ THEN ~I will give you time to speak to him before I will start questioning him.~
== bstrcmdr IF ~GlobalGT("bsJumpStartDGQuest","GLOBAL",0)~ THEN ~So, in case you haven't spoken to him already, I'd like to ask that you speak with him and see what you can discover.~
END
/* PC came to tower first time after Sarevok was defeated: already got prison pass from first dialogue with commander */
IF ~GlobalGT("bsJumpStartDGQuest","GLOBAL",0)~ THEN UNSOLVED_JOURNAL @802  EXIT

+ ~Global("bsJumpStartDGQuest","GLOBAL",0)~ + ~Fine, I'll talk to him.~ + prisonpass_03
+ ~Global("bsJumpStartDGQuest","GLOBAL",0)~ + ~You are presuming I'm willing to talk to your man.~ + prisonpass_02
+ ~Global("bsJumpStartDGQuest","GLOBAL",0)~ + ~And you think I'd tell you what he tells me?~ + prisonpass_01


APPEND bstrcmdr

IF ~~ THEN prisonpass_01
SAY ~I would expect you to report anything of importance to the tower's safety to me, yes, but nothing else. Rest assured that I have effective ways learn to get him to tell me what he told you.~
IF ~~ THEN + prisonpass_04
END

IF ~~ THEN prisonpass_02
SAY ~It is his specific wish. I know your type, and I have yet to meet one who wouldn't go just for curiosity's sake. This pass will grant you access to the prison.~
IF ~~ THEN + prisonpass_04
END

IF ~~ THEN prisonpass_03
SAY ~Splendid.~
IF ~~ THEN + prisonpass_04
END

IF ~~ THEN prisonpass_04
SAY ~I wouldn't normally grant this to just anyone, but as I said you have already made a name for yourself and we might have a need for your services later. Report anything of interest to the tower's or city's safety to me. Here, take this pass, it will grant you access to the prison if you show it to the guards. The man's name is Shuck, he should be in one of the front cells.~
IF ~~ THEN DO ~GiveItemCreate("bsprpass",[PC],1,0,0)
EraseJournalEntry(@799)
SetGlobal("bsGavePrisonPass","GLOBAL",1)~ UNSOLVED_JOURNAL @800 EXIT
END

END //APPEND

