/* Slave Trader Contact */


BEGIN bsslav01

/* first meeting */
IF ~NumTimesTalkedTo(0)
AreaCheck("YS0113")~ THEN welcome
SAY ~Welcome, welcome dear guests - Leonhard my name, Leonhard 'the Fierce', as they like to call me. I organize excursions into the *wild*... Nothing dangerous for our customers, of course. Unfortunately, I am totally full - booked out. So, unless you have a voucher, I am very sorry to say that you'll have to wait until next round, when the new tours are being planned.~
/* no conditions are met */
IF ~!PartyHasItem("bssmq001") !Global("bsSlaverQuest","GLOBAL",3)~ THEN EXIT

/* quest to free Shuck's brother */
+ ~PartyHasItem("bssmq001")~ + ~I do have a voucher - I think. I am interested in the "special creatures".~ + slavetrader_03
+ ~PartyHasItem("bssmq001")~ + ~Cut the crap. I know you are the contact of the slave traders.~ + slavetrader_01

/* Just in case the PC never talked to Leonhard before getting Holger's message */
+ ~Global("bsSlaverQuest","GLOBAL",3)~ + ~Greetings from Holger. I was told to speak to you about an assignment.~ DO ~SetGlobal("bsAskedForWork","LOCALS",2)~ + slaverquest

/* good bye line */
+ ~OR(2)
PartyHasItem("bssmq001")
Global("bsSlaverQuest","GLOBAL",3)~ + ~Good day to you.~ + slavetrader_17
END

/* slaver quest finished - Flaming Fist was there */
IF ~Global("bsSlaverQuest","GLOBAL",6)~ THEN confrontation
SAY ~You! You have guts to show your face here, after what you did to my men. Well, after what you *supposedly* did to my men, as I do not have any proof that it was you who betrayed us to the Flaming Fist. I do not have much information because none of mine came out alive, but that *they* appeared I know.~
IF ~~ THEN DO ~SetGlobal("bsSlaverQuest","GLOBAL",11)~ + confrontation_01
END

/* general greetings line */
IF ~AreaCheck("YS0113")~ THEN welcome_again
SAY ~There you are again! What can I do for you?~

/* slavers quest finished - no Flaming Fist */
+ ~Global("bsSlaverQuest","GLOBAL",5)~ + ~Your men tried to enslave me. How about we "talk" about this a little, hm?~ + confrontation_00

/* quest to free Shuck's brother */
+ ~PartyHasItem("bssmq001")~ + ~I do have a voucher - I think. I am interested in the "special creatures".~ + slavetrader_03
+ ~PartyHasItem("bssmq001")~ + ~Cut the crap. I know you are the contact of the slave traders.~ + slavetrader_01

+ ~Global("bsShucksBrother","GLOBAL",3) PartyGoldGT(19999)
!GlobalTimerExpired("bsSlaveTimer1","GLOBAL")~ + ~I have the sum you requested. Let's make the deal for Shuck's brother.~ + slavetrader_10
+ ~Global("bsShucksBrother","GLOBAL",3) PartyGoldGT(19999)
GlobalTimerExpired("bsSlaveTimer1","GLOBAL")~ + ~I have the sum you requested. Let's make the deal for Shuck's brother.~ + slavetrader_10_1
+ ~Global("bsShucksBrother","GLOBAL",3) Global("bsAskedForWork","LOCALS",0)~ + ~I decided I don't care about Shuck's brother any more. But I want to work for you.~ DO ~EraseJournalEntry(@809) SetGlobal("bsShucksBrother","GLOBAL",31) SetGlobal("bsAskedForWork","LOCALS",1)~ SOLVED_JOURNAL @807 + slavetrader_01_2

/* PC got Holger's message */
+ ~Global("bsSlaverQuest","GLOBAL",3)~ + ~Greetings from Holger. I was told to speak to you about an assignment.~ DO ~SetGlobal("bsAskedForWork","LOCALS",2)~ + slaverquest

/* general questions */
+ ~GlobalGT("bsConfrontSlaveTraders","GLOBAL",0) Global("bsAskedCommander","LOCALS",0)~ + ~You have your residence wall to wall with the Seatower Commander? Isn't that a bit... bold?~ DO ~SetGlobal("bsAskedCommander","LOCALS",1)~ + slavetrader_12
+ ~GlobalGT("bsConfrontSlaveTraders","GLOBAL",0) GlobalLT("bsSlaverQuest","GLOBAL",2) Global("bsAskedForWork","LOCALS",0)~ + ~I'd like to work for you.~ DO ~SetGlobal("bsAskedForWork","LOCALS",1)~ + slavetrader_15

/* farewell line */
++ ~Nothing, Farewell.~ + slavetrader_17

/* general confront slave traders line */
+ ~GlobalGT("bsConfrontSlaveTraders","GLOBAL",0)~ + ~I am here to learn more about your operations. You better participate in telling me as much as you know!~ + attack
+ ~GlobalGT("bsConfrontSlaveTraders","GLOBAL",0)~ + ~No more talking around! I will end your false being here and now!~ + attack
END

/* after slavers quest is finished - PC confronts Leonhard */
IF ~~ THEN confrontation_00
SAY ~Ah, I understand what happened. And here I was, thinking you betrayed us. There was a gap in communication between me and my men, you see - the dead do seldom tell tales. Hm, seems they understood me wrong when I said that we should keep an eye on you because of your talents. I do apologize for the inconveniences, <CHARNAME>. I'd have preferred this would have turned out differently - especially because then quite a lot of my best men wouldn't be dead now.~
IF ~~ THEN + confrontation_01
END

IF ~~ THEN confrontation_01
SAY ~So, what it's going to be? Did you come to "end" the whole affair, or can we go separate ways like civilized people?~
++ ~Best you go and do not return, before I change my mind.~ + confrontation_02
+ ~Global("bsSlaverQuest","GLOBAL",5)~ + ~Hey - I do not judge your men. I would have done the same. You should scold them for taking on the wrong prey, though - if they wouldn't be dead already, that is.~ + confrontation_03
++ ~Indeed, I came to end your presence in this tower and the city once and for all!~ + attack
END

IF ~~ THEN confrontation_02
SAY ~I will take my leave, then. No more adventures into the 'wild' by Leonhard the Fierce - at least not from here.~
IF ~~ THEN DO ~ActionOverride("bsslav01",EscapeArea())~ EXIT
IF ~Global("bsSlaverQuest","GLOBAL",5)~ THEN DO ~EraseJournalEntry(@847) SetGlobal("bsSlaverQuest","GLOBAL",12) ActionOverride("bsslav01",EscapeArea())~ SOLVED_JOURNAL @846 EXIT
END

IF ~~ THEN confrontation_03
SAY ~Oh, you would have been a preferable business partner, I sense as much. If you ever come to Athkatla, make sure to make yourself seen by our bosses - we have always use for a <PRO_MANWOMAN> like you.~
IF ~~ THEN + confrontation_02
END

IF ~~ THEN slavetrader_01
SAY ~Oh, how blunt! And rather confronting. Let us do this with style... yes? You are interested in the "special creatures", I take it.~
++ ~Fine. You have a "special creature" I have a high interest in. I would like to have him back.~ + slavetrader_03
++ ~Hearing you talk like this sickens me, but I came here to free a person, so let's talk business.~ + slavetrader_03
++ ~I will put my weapon through your scull very "elegantly" if you do not tell me where Shuck's brother is this instant!~ + slavetrader_02
++ ~No more talking around! I will end your false being here and now!~ + attack
++ ~I couldn't care less about freeing a slave. I only came here because I want to work with you, nothing else.~ DO ~EraseJournalEntry(@809) SetGlobal("bsShucksBrother","GLOBAL",31) SetGlobal("bsAskedForWork","LOCALS",1)~ SOLVED_JOURNAL @807 + slavetrader_01_1
END

IF ~~ THEN slavetrader_01_1
SAY ~Is that so? Interesting.~
= ~And you do have a voucher, indeed! Let me take this, then - before it raises false hopes in other potential customers.~
IF ~~ THEN DO ~TakePartyItem("bssmq001") DestroyItem("bssmq001") SetGlobal("bsConfrontSlaveTraders","GLOBAL",1)~ + slavetrader_15
END

IF ~~ THEN slavetrader_01_2
SAY ~Is that so? Well, then I guess I do not have to delay his shipping any longer. Noted.~
IF ~~ THEN + slavetrader_15
END

IF ~~ THEN slavetrader_02
SAY ~Now then, I see you are on a quest to save a ... youngman in distress.~
IF ~~ THEN + slavetrader_03
END

IF ~~ THEN slavetrader_03
SAY ~And you do have a voucher, indeed! Let me take this, then - before it raises false hopes in other potential customers.~
IF ~~ THEN DO ~TakePartyItem("bssmq001") DestroyItem("bssmq001") SetGlobal("bsConfrontSlaveTraders","GLOBAL",1)~ + slavetrader_04
END

IF ~~ THEN slavetrader_04
SAY ~So, the person you are talking about came to us from Nashkel, hm? Ah, yes, I remember. Rather skinny and not very strong, that one. Are you sure you insist on one so sickly - I have much finer specimen available, if you are willing to pay the price.~
++ ~I'm insisting on that one, yes.~ + slavetrader_05
++ ~Tell me how I can get him back now!~ + slavetrader_05
++ ~Tempting... but I guess my gold won't suffice for a "better specimen".~ + slavetrader_05
++ ~No more talking around! I will end your false being here and now!~ + attack
END

IF ~~ THEN slavetrader_05
SAY ~Well then. For the advantageous meek sum of only 20,000 gold he will be back with you by the morn'. What do you say?~
++ ~20,000 gold? Are you serious?~ + slavetrader_07
+ ~PartyGoldGT(19999)~ + ~Fine, here is the gold.~ + slavetrader_10
++ ~That is a large sum, but I will be back with the gold.~ + slavetrader_09
++ ~That's too much.~ + slavetrader_06
++ ~Forget it, I'm out of here.~ + slavetrader_08
++ ~No more talking around! I will end your false being here and now!~ + attack
END

IF ~~ THEN slavetrader_06
SAY ~I'm sorry, but that is the minimum of what I can offer - I already gave you a great discount. Look, we have to retrieve him out of the normal delivery routine, and doing so with such short notice is costly.~
++ ~20,000 gold? Are you serious?~ + slavetrader_07
+ ~PartyGoldGT(19999)~ + ~Fine, here is the gold.~ + slavetrader_10
++ ~That is a large sum, but I will be back with the gold.~ + slavetrader_09
++ ~Forget it, I'm out of here.~ + slavetrader_08
++ ~No more talking around! I will end your false being here and now!~ + attack
END

IF ~~ THEN slavetrader_07
SAY ~I know, it is a surprisingly low sum, but it's a special offer for you.~
+ ~PartyGoldGT(19999)~ + ~Fine, here is the gold.~ + slavetrader_10
++ ~That is a large sum, but I will be back with the gold.~ + slavetrader_09
++ ~That's too much.~ + slavetrader_06
++ ~Forget it, I'm out of here.~ + slavetrader_08
++ ~No more talking around! I will end your false being here and now!~ + attack
END

IF ~~ THEN slavetrader_08
SAY ~Hm, that would be a pity. Do return if you change your mind.~
IF ~~ THEN + slavetrader_09_1
END

IF ~~ THEN slavetrader_09
SAY ~Splendid! I will make preparations for the delivery while you are raising the gold.~
IF ~~ THEN + slavetrader_09_1
END

IF ~~ THEN slavetrader_09_1
SAY ~Be quick about it, as your man is being transported elsewhere soon.~
IF ~~ THEN DO ~
EraseJournalEntry(@809)
AddJournalEntry(@812,QUEST)
SetGlobal("bsShucksBrother","GLOBAL",3)
SetGlobalTimer("bsSlaveTimer1","GLOBAL",FIVE_DAYS)~ + slavetrader_11
END

IF ~~ THEN slavetrader_10
SAY ~Wonderful! Let me stow this away carefully. I will make preparations for the delivery. Your man will be brought to the Ilmater Monastery the coming day.~
IF ~~ THEN DO ~TakePartyGold(20000)
EraseJournalEntry(@809)
EraseJournalEntry(@812)
AddJournalEntry(@813,QUEST)
SetGlobal("bsShucksBrother","GLOBAL",4)
SetGlobalTimer("bsSlaveTimer2","GLOBAL",ONE_DAY)~ + slavetrader_11
END

IF ~~ THEN slavetrader_10_1
SAY ~Oh, I am so sorry, but you are too late. The transport already took place and he is on the sea on his trip to elsewhere. Do let me know if I can do anything else for you, though.~
IF ~~ THEN DO ~
EraseJournalEntry(@809)
EraseJournalEntry(@812)
AddJournalEntry(@811,QUEST_DONE)
SetGlobal("bsShucksBrother","GLOBAL",35)~ EXIT
END

IF ~~ THEN slavetrader_11
SAY ~Is there any more questions? If not, I would ask you to leave.~

/* general questions */
+ ~Global("bsAskedCommander","LOCALS",0)~ + ~You have your residence wall to wall with the Seatower Commander? Isn't that a bit... bold?~ DO ~SetGlobal("bsAskedCommander","LOCALS",1)~ + slavetrader_12
+ ~GlobalLT("bsSlaverQuest","GLOBAL",2) Global("bsAskedForWork","LOCALS",0)~ + ~I'd like to work for you.~ DO ~SetGlobal("bsAskedForWork","LOCALS",1)~ + slavetrader_15

/* PC got Holger's message */
+ ~Global("bsSlaverQuest","GLOBAL",3)~ + ~Greetings from Holger. I was told to speak to you about an assignment.~ DO ~SetGlobal("bsAskedForWork","LOCALS",2)~ + slaverquest

/* farewell line */
++ ~Nothing, Farewell.~ + slavetrader_17

/* confront the slavers */
+ ~GlobalGT("bsConfrontSlaveTraders","GLOBAL",0)~ + ~No more talking around! I will end your false being here and now!~ + attack
END

IF ~~ THEN slavetrader_12
SAY ~(smiles) Well, the commander surely has his suspicions, but there is nothing he can *prove*, so I guess he thinks he's smart by letting us operate from right under his nose. He is not our customer and probably never will be, such a pity this is. The man doesn't know what he is missing.~
++ ~You mean the Commander cannot be bribed?~ + slavetrader_13
++ ~There are people who do not get corrupted by power? I am surprised to hear that.~ + slavetrader_14 
++ ~Farewell.~ + slavetrader_17
END

IF ~~ THEN slavetrader_13
SAY ~No, he cannot be bribed. Every time we tried - not *me*, of course - he used it to try to get a hold of us, sneaky little commander.~
IF ~~ THEN + slavetrader_14
END

IF ~~ THEN slavetrader_14
SAY ~Yes, there are wealthy men who do not fall to their pride - the city is irritatingly lucky with both the Flaming Fist *and* the Seatower Forces being under such men. Or maybe it will be to their disadvantage, as such men need to be killed to get past them, since turning them is not possible.~
= ~But - noone here is planning on assassinating the commander now, is there? We, at least, have no such plans. It is so nice and comfy here in this little Balduran's Tower of his, so I would be a fool to go against him. Also, there ar *so* many customers amongst the noble and wealthy who like to come to the tower, it is a pleasure to do business here.~
IF ~~ THEN EXIT
END


IF ~~ THEN slavetrader_15
SAY ~Work for me? Now, now, what could you do for me. How about getting me a cup of nice, hot tea, hm?~
++ ~You know what I mean.~ + slavetrader_16
++ ~Fine, suit yourself.~ EXIT
END

CHAIN
IF ~~ THEN bsslav01 slavetrader_16
~Do I, now?~
== bsslav01 IF ~Class(Player1,PALADIN) %PLAYER1_NO_BLACKGUARD%~ THEN ~I see you before me, a paladin in shining armor, asking the slave trader for work. I am sorry if I do seem hesitant.~
== bsslav01 IF ~!Class(Player1,PALADIN) 
OR(5)
Class(Player2,PALADIN)
Class(Player3,PALADIN)
Class(Player4,PALADIN)
Class(Player5,PALADIN)
Class(Player6,PALADIN)
%PLAYER2_NO_BLACKGUARD%
%PLAYER3_NO_BLACKGUARD%
%PLAYER4_NO_BLACKGUARD%
%PLAYER5_NO_BLACKGUARD%
%PLAYER6_NO_BLACKGUARD%~ THEN ~I see you before me, a person who does work together with a paladin in shining armor, asking the slave trader for work. I am sorry if I do seem hesitant.~
== bsslav01 ~See, the problem is this. I do not know you, so I don't know whether I can trust you. But to get to know you, you would have to work for me - which I could only do if I'd know I could trust you - you see the problem? So, the situation normally goes like this: you work for one of our partners. And if they trust you, then there might be a chance they will recommend you to us.~
== bsslav01 IF ~Global("bsWorkingWithSmugglers","GLOBAL",1)~ THEN ~You are working for the smugglers in Nashkel, or so I've heard. That's a good start! Do their tasks to their satisfaction, and we will hear from each other again. Until then - this will be a mere customer-seller relation.~
== bsslav01 IF ~Global("bsWorkingWithSmugglers","GLOBAL",0)~ THEN ~I wouldn't know of any such a constellation, so I am sorry, but this is a customer-seller relation only.~
END
IF ~~ THEN EXIT

APPEND bsslav01

IF ~~ THEN slavetrader_17
SAY ~Good day to you, dear guest!~
IF ~~ THEN EXIT
END


/* slavers quest */
IF ~~ THEN slaverquest
SAY ~Ah! So he sends you, the newly aquinted partner, hmm? Fine. We trust Holger so if he thinks you are trustworthy, so do we. We offer you a job to protect our wares while we ready one of our shipments. Are you interested?~
++ ~Your "wares"? Do I get any more information than that?~ + slaverquest_01
++ ~Just tell me what I need to know.~ + slaverquest_04
++ ~I don't think I can help you with this.~ + slaverquest_02
+ ~!Global("bsAskedForWork","LOCALS",1)~ + ~I have a suspicion about what your wares are, and I do not want to have any part in slave trading! Smuggling wares is fine, but not this.~ + slaverquest_02
+ ~Global("bsAskedForWork","LOCALS",1)~ + ~I have a suspicion about what your wares are, and I do not want to have any part in slave trading! Smuggling wares is fine, but not this.~ + slaverquest_03
END

END //APPEND

CHAIN
IF ~~ THEN bsslav01 slaverquest_01
~Why? You already know the drill from Holger. The less you know, the better - for you.~
== bsslav01 IF ~GlobalGT("bsConfrontSlaveTraders","GLOBAL",0)~ THEN ~You know what I stand for, so I am sure you can draw your own conclusions.~
== bsslav01 IF ~Global("bsAskedForWork","LOCALS",1)~ THEN ~But since you already asked about working for us, I am sure there will be no problems, hmm?~
== bsslav01 IF ~Global("bsConfrontSlaveTraders","GLOBAL",0)~ THEN ~Let's just say that we, hmm, specialised in life wares. Special creatures... very special creatures, which are well wanted in other parts of this world, were they can be aquired legally. We are only suppplying the demand that is already there.~ 
== bsslav01 IF ~!Global("bsAskedForWork","LOCALS",1)~ THEN ~But don't overstrain your brain. The less you think about it, the smoother the operation wil go.~
== bsslav01 ~We need you to be ready to protect the transfer against any unexpected visitors... like the Flaming Fist, for example. Are you in?~
END
++ ~Just tell me what I need to know.~ + slaverquest_04
++ ~I don't think I can help you with this.~ + slaverquest_02
+ ~!Global("bsAskedForWork","LOCALS",1)~ + ~I have a suspicion about what your wares are, and I do not want to have any part in slave trading! Smuggling wares is fine, but not this.~ + slaverquest_02
+ ~Global("bsAskedForWork","LOCALS",1)~ + ~I have a suspicion about what your wares are, and I do not want to have any part in slave trading! Smuggling wares is fine, but not this.~ + slaverquest_03

APPEND bsslav01

IF ~~ THEN slaverquest_02
SAY ~Do you now. Hmm. A pity, you really would be strong mercenaries. Ah well. I will let you live, for Holger's sake.~
IF ~~ THEN DO ~EraseJournalEntry(@840) SetGlobal("bsSlaverQuest","GLOBAL",10)~ SOLVED_JOURNAL @841 EXIT
END

IF ~~ THEN slaverquest_03
SAY ~Oh? But you basically *begged* for it not too long ago! Well, life is full of surprises.~ 
IF ~~THEN + slaverquest_02
END

IF ~~ THEN slaverquest_04
SAY ~Very good! Come to the western shore of the Chionthar, south of Wyrm's Crossing when night has fallen. We will await you and tell you the details then. Bring your weapons, don't draw any attention, and be ready to fight any unexpected "guests" - just in case we get detected. It happens rarely, but sometimes the Flaming Fist has a lucky day.~
IF ~~ THEN DO ~DestroyItem("bssmq003") EraseJournalEntry(@840)
SetGlobal("bsSlaverQuest","GLOBAL",4) SetGlobal("bsConfrontSlaveTraders","GLOBAL",1)~ UNSOLVED_JOURNAL @843 EXIT
IF ~Global("bsConfrontSlaveTraders","GLOBAL",2)~ THEN DO ~DestroyItem("bssmq003")
EraseJournalEntry(@840)
EraseJournalEntry(@880)
AddJournalEntry(@882,QUEST)
SetGlobal("bsSlaverQuest","GLOBAL",4)~ UNSOLVED_JOURNAL @843 EXIT
END

IF ~~ THEN attack
SAY ~Then this is where our business comes to a quick end. Everyone - kill this fool!~
IF ~~ THEN DO ~SetGlobal("bsSlaversAttack","MYAREA",1) 
SetGlobal("bsWorkingWithSmugglers","GLOBAL",0)
ActionOverride("bsslav01",Enemy())~ EXIT
IF ~Global("bsSlaverQuest","GLOBAL",3)~ THEN DO ~EraseJournalEntry(@840)
AddJournalEntry(@841,QUEST_DONE)
SetGlobal("bsSlaverQuest","GLOBAL",10) SetGlobal("bsSlaversAttack","MYAREA",1) 
SetGlobal("bsWorkingWithSmugglers","GLOBAL",0)
ActionOverride("bsslav01",Enemy())~ EXIT
IF ~GlobalLT("bsShucksBrother","GLOBAL",5)~ THEN DO ~
EraseJournalEntry(@807)
EraseJournalEntry(@809)
EraseJournalEntry(@813)
AddJournalEntry(@810,QUEST_DONE)
SetGlobal("bsShucksBrother","GLOBAL",40) SetGlobal("bsSlaversAttack","MYAREA",1) SetGlobal("bsWorkingWithSmugglers","GLOBAL",0)
ActionOverride("bsslav01",Enemy())~ EXIT
IF ~Global("bsSlaverQuest","GLOBAL",5)~ THEN DO ~
EraseJournalEntry(@847)
SetGlobal("bsSlaversAttack","MYAREA",1) 
SetGlobal("bsSlaverQuest","GLOBAL",12)
SetGlobal("bsWorkingWithSmugglers","GLOBAL",0)
ActionOverride("bsslav01",Enemy())~ SOLVED_JOURNAL @848 EXIT
END

END //APPEND


///////////////////////
/* Messenger if PC works with smugglers */

BEGIN bsslvmsg

IF ~True()~ THEN message
SAY ~Hey, I have a message for <CHARNAME>. Greetings from Holger - our partners requested backup now. Go into the Seatower and talk to Leonhard 'the Fierce' on the third floor. Tell him Holger sent you.~
IF ~~ THEN DO ~EraseJOurnalEntry(@839)
SetGlobal("bsSlaverQuest","GLOBAL",3) ActionOverride("bsslvmsg",EscapeArea())~ UNSOLVED_JOURNAL @840 EXIT
END


/////////////////////////
/* Flaming Fist at slavers' meeting point */
BEGIN bsslavff
IF ~Global("bsConfrontSlaveTraders","GLOBAL",3)~ THEN info
SAY ~Good that you are here. The plan is the following: we Flaming Fist will approach the slavers from the south, trying to intercept the transfer of the slaves. Your part is to approach them from the north, to help us distract the slavers and prevent them from fleeing in this direction. Take down any of their mercenaries you see. Good luck.~
IF ~~ THEN DO ~EraseJournalEntry(@883) 
SetGlobal("bsConfrontSlaveTraders","GLOBAL",4)
ActionOverride("bsslavff",MoveToPointNoInterrupt([372.2475])) ActionOverride("bsslavff",DestroySelf())~ UNSOLVED_JOURNAL @887 EXIT
END

IF ~Global("bsConfrontSlaveTraders","GLOBAL",5)~ THEN after_fight
SAY ~Good job on stopping the slaver mercenaries! We could free the slaves in the meantime and conviscate one of their ships. This was a very successful mission. Go to the Seatower Commander tomorrow, I am sure he wants to tell you personally.~
IF ~~ THEN DO ~EraseJournalEntry(@887) 
SetGlobal("bsConfrontSlaveTraders","GLOBAL",6)
ActionOverride("bsslavff",EscapeArea())~ UNSOLVED_JOURNAL @888 EXIT
END


//////////////////////////
/* slave trader bouncers at slavers' meeting point */

BEGIN bsslav04

IF ~NumTimesTalkedTo(0)~ THEN greeting
SAY ~Er, boss?~
IF ~~ THEN EXTERN bsslav07 meeting
IF ~Global("bsSlaverQuest","GLOBAL",4)
Global("bsConfrontSlaveTraders","GLOBAL",4)~ THEN EXTERN bsslav07 meeting_01
IF ~GlobalLT("bsSlaverQuest","GLOBAL",4)
Global("bsConfrontSlaveTraders","GLOBAL",4)~ THEN EXTERN bsslav07 ffattack
END

BEGIN bsslav07

/* 1. PC works with slavers and didn't tell Seatower commander about the shipment 
Global("bsSlaverQuest","GLOBAL",4)
GlobalLT("bsConfrontSlaveTraders","GLOBAL",4)
*/IF ~Global("bsSlaverQuest","GLOBAL",4) GlobalLT("bsConfrontSlaveTraders","GLOBAL",4)~ THEN meeting
SAY ~Ah, there is our backup. We were quite excited when Leonhard told us about heavily armed mercenaries instead of the normal smuggler rogues. Plus, knowing that you are a rather new acquaintance, we decided we have a better use for you - in the Copper Coronet's gladiator rings. Everyone, grab them!~
IF ~~ THEN DO ~EraseJournalEntry(@843)
SetGlobal("bsSlaversHostile","MYAREA",1) SetGlobal("bsSlaverQuest","GLOBAL",5) ActionOverride("bsslav07",Enemy())~ UNSOLVED_JOURNAL @847 EXIT
IF ~Dead("bsslav01")~ THEN DO ~EraseJournalEntry(@843)
SetGlobal("bsSlaversHostile","MYAREA",1) SetGlobal("bsSlaverQuest","GLOBAL",5) ActionOverride("bsslav07",Enemy())~ SOLVED_JOURNAL @844 EXIT
END

/* 2. PC works with slavers but did tell the Seatower Commander about it 
Global("bsSlaverQuest","GLOBAL",4)
Global("bsConfrontSlaveTraders","GLOBAL",4)
-> slavers attack
*/
IF ~Global("bsSlaverQuest","GLOBAL",4)
Global("bsConfrontSlaveTraders","GLOBAL",4)~ THEN meeting_01
SAY ~Ah, there is our backup. We were quite excited when Leonhard told us about heavily armed mercenaries instead of the normal smuggler rogues... What is the uproar at the ships? Flaming Fist! We've been found out! You - it must have been you! You betrayed us! Everyone, fight!~
IF ~~ THEN DO ~EraseJournalEntry(@847)
AddJournalEntry(@845,QUEST_DONE)
SetGlobal("bsSlaversHostile","MYAREA",1) SetGlobal("bsSlaverQuest","GLOBAL",6) ActionOverride("bsslav07",Enemy())~ UNSOLVED_JOURNAL @888 EXIT
END

/* 3. PC crashes the party (i.e. doesn't work with the slavers 
GlobalLT("bsSlaverQuest","GLOBAL",4)
Global("bsConfrontSlaveTraders","GLOBAL",4)
-> slavers attack
*/
IF ~GlobalLT("bsSlaverQuest","GLOBAL",4)
Global("bsConfrontSlaveTraders","GLOBAL",4)~ THEN ffattack
SAY ~Who are you? And what is the uproar at the ships? I see Flaming Fist! We've been found out! Everyone, fight!~
IF ~~ THEN DO ~SetGlobal("bsSlaversHostile","MYAREA",1) ActionOverride("bsslav07",Enemy())~ EXIT
END



