/* Prison guards */
// Guarding jail cells
BEGIN bsprgrd1
BEGIN bsprgrd2 //Tower Guard Jai

CHAIN IF WEIGHT #1 
~Global("bsPrisonEntry","GLOBAL",0)~ THEN bsprgrd1 yssold09_1
  ~Ye're crazy, Jai, yer talkin' nonsense; I been there hundreds o' times, an' I never seen anythin' like that.~
  == bsprgrd2 ~I'm telling you, it's there. It has to be. I know every inch of this tower, and there's no way it could have gotten in otherwise.~
  == bsprgrd1 ~I been workin' here twenty-five years, boyo, don't ye think ye can tell me the lay o' the place!~
  == bsprgrd2 ~I'd wager I did more watch down here than you, but no matter. If you won't listen to me, fine, let them invade. Then we'll see the right of it.~
  == bsprgrd1 ~Pfah! Balduran's Seatower be plenty secure. Don't ye be worryin' about that.~
= ~Bloody younglings an' their bloody paranoia... a secret entrance? I think we'd of found it by now... Idjit...~
END
IF ~~ THEN EXTERN bsprgrd2 ysstalk01

APPEND bsprgrd2

  IF ~Global("bsPrisonEntry","GLOBAL",0)~ ysstalk01
    SAY ~You don't look like guards. What do you think you're doing down here? We have a dangerous monster to restrain!~
+ ~PartyHasItem("bsprpass")~ + ~Actually, I have a pass granting me entry.~ + ysstalk01_4
    ++ ~Huh. Fancy that. We were just taking a walk above and bam, suddenly we're here! Where are we, exactly?~ + ysstalk01_2
    ++ ~What in the nine hells is that thing? Some kind of... fish-man?~ + ysstalk01_3
    ++ ~We were just leaving.~ + ysstalk01_4
  END

  IF ~~ ysstalk01_2
    SAY ~Yes, how very... convenient. You are currently in the dungeons.~
    IF ~~ THEN + ysstalk01_4
  END

  IF ~~ ysstalk01_3
    SAY ~Sahuagin. Dangerous aquatic creatures, prone to violence. Barbaric and uncivilized.~
    IF ~~ THEN + ysstalk01_4
  END

  IF ~~ ysstalk01_4
    SAY ~We don't have time to waste. I need to chain this one up and report his appearance.~
    IF ~~ THEN DO ~SetGlobal("bsPrisonEntry","GLOBAL",1)
	ActionOverride(Player1,LeaveAreaLUA("bs1010","",[633.841],15))
	ActionOverride(Player2,LeaveAreaLUA("bs1010","",[679.805],15))
	ActionOverride(Player3,LeaveAreaLUA("bs1010","",[593.798],15))
	ActionOverride(Player4,LeaveAreaLUA("bs1010","",[625.767],15))
	ActionOverride(Player5,LeaveAreaLUA("bs1010","",[537.763],15))
	ActionOverride(Player6,LeaveAreaLUA("bs1010","",[568.728],15))~ EXIT
    IF ~PartyHasItem("bsprpass")~ THEN DO ~SetGlobal("bsPrisonEntry","GLOBAL",1) ClearAllActions() StartCutSceneMode() StartCutScene("bscut002")~ EXIT
  END
 

IF ~Global("bsPrisonEntry","GLOBAL",1)~ THEN checkpass
SAY ~This is a restricted area. You have no right to be here, so leave.~
IF ~!PartyHasItem("bsprpass")~ THEN DO ~
ActionOverride(Player1,LeaveAreaLUA("bs1010","",[633.841],15))
ActionOverride(Player2,LeaveAreaLUA("bs1010","",[679.805],15))
ActionOverride(Player3,LeaveAreaLUA("bs1010","",[593.798],15))
ActionOverride(Player4,LeaveAreaLUA("bs1010","",[625.767],15))
ActionOverride(Player5,LeaveAreaLUA("bs1010","",[537.763],15))
ActionOverride(Player6,LeaveAreaLUA("bs1010","",[568.728],15))~ EXIT
+ ~PartyHasItem("bsprpass")~ + ~Actually, I do. Here's a pass the Seatower Commander gave me.~ + checkpass_01
END

IF ~~ THEN checkpass_01
SAY ~Oh? Let me see the pass... Hmm, this is correct. You have permission to enter the prison and talk to the prisoners. Be warned, though! The prisoners down here are very dangerous.~
IF ~~ THEN DO ~ActionOverride("bsprgrd1",TakePartyItem("bsprpass")) SetGlobal("bsPrisonEntry","GLOBAL",2)~ EXIT
IF ~Global("bsJumpStartDGQuest","GLOBAL",0)~ THEN DO ~ActionOverride("bsprgrd1",TakePartyItem("bsprpass")) SetGlobal("bsPrisonEntry","GLOBAL",2)~ + ysstalk01_6
END

  IF ~~ ysstalk01_5
    SAY ~That would be best.~
    IF ~~ EXIT
  END

  IF ~~ ysstalk01_6
    SAY ~We will be watching you closely - for your own safety. It is dangerous down here. I suggest you leave before anything else happens. I have been trained to deal with situations such as these.~
    ++ ~So have I. What were you saying about there being a way in earlier?~ DO ~SetGlobal("bsAskedPrisonyssold09","MYAREA",1)~ EXTERN bsprgrd1 yssold09_3
    ++ ~We can look after ourselves. I'd like to talk to your prisoners.~ + ysstalk01_8
    ++ ~We'll just be leaving, then.~ + ysstalk01_5
  END

  IF ~~ ysstalk01_8
    SAY ~If you must. Be quick.~
    IF ~~ EXIT
  END

  IF ~~ ysstalk01_9
    SAY ~Let it be on your own head, then.~
    IF ~~ EXIT
  END

END //APPEND

CHAIN
  IF ~~ THEN bsprgrd1 yssold09_3
~Don't ye listen to his nonsense. He's no idea what he's talkin' about. These dungeons are perfectly safe.~
== bsprgrd2 ~If they are perfectly safe, then why did I find a Sahuagin lurking in here?~
== bsprgrd2 ~I know the sergeant already investigated the alcove. Fine, so behind the spore colony is just a small dead end, I'm not saying the sergeant made a mistake, I'm saying the dungeons are bigger than that.~
== bsprgrd1 ~Can ye be sure how long it's been down here? Could've come in from above a' night while we were doin' our rounds, it could!~
  END
    ++ ~We can look after ourselves. I'd like to talk to your prisoners.~ EXTERN bsprgrd2 ysstalk01_8
    ++ ~I've never run from a challenge before, I'm not about to start now.~ EXTERN bsprgrd2 ysstalk01_9
    ++ ~We'll just be leaving, then.~ EXTERN bsprgrd2 ysstalk01_5

APPEND bsprgrd2

IF ~Global("bsPrisonMyconiziden","GLOBAL",1)~ THEN myconides_start
SAY ~Be careful - the spore colony was obviously agitated by the sergeant investigating that corner. From the sounds we are going to have to deal with some angry myconids again. It's high time we got rid of that spore colony, but I can't do so right away. Be careful when moving around.~
  IF ~~ THEN DO ~SetGlobal("bsPrisonMyconiziden","GLOBAL",2)~ UNSOLVED_JOURNAL @753 EXIT
END

  IF ~NumTimesTalkedToGT(0)~ ysstalk01_10
    SAY ~You'd do best to leave this area. Who knows what else is down here.~
	+ ~GlobalGT("bsDoppelgangerQuest","GLOBAL",1)
Global("bsInTheLoop","LOCALS",0)~ + ~Reveal yourself, you filthy doppelganger scum!~ DO ~SetGlobal("bsInTheLoop","LOCALS",1)~ + info_00
	+ ~GlobalGT("bsDoppelgangerQuest","GLOBAL",1)
Global("bsInTheLoop","LOCALS",0)~ + ~I'm afraid there is currently a lot going on. Your comrade was replaced by a doppelganger and they attacked the commander.~ DO ~SetGlobal("bsInTheLoop","LOCALS",1)~ + info
        + ~GlobalGT("bsSeaCaveOpen","GLOBAL",0)
Global("bsDoppelgangerQuest","GLOBAL",0)
Global("bsReportedCave","MYAREA",0)~ + ~The alcove behind the spore colony wasn't just a dead end. There's a whole cave and tunnel system back there!~ DO ~SetGlobal("bsReportedCave","MYAREA",1)~ EXTERN bsprgrd1 doppelgangerquest_grd1

/* just in case ... */
        + ~GlobalGT("bsSeaCaveOpen","GLOBAL",0)
GlobalGT("bsDoppelgangerQuest","GLOBAL",1)
Global("bsReportedCave","MYAREA",0)~ + ~The alcove behind the spore colony wasn't just a dead end. There's a whole cave and tunnel system back there!~ DO ~SetGlobal("bsReportedCave","MYAREA",1)~ + doppelgangerquest_grd2_02

        + ~Global("bsFoundSerjeante","GLOBAL",1)
GlobalGT("bsDoppelgangerQuest","GLOBAL",1)
Global("bsReportedSerjeante","MYAREA",0)~ + ~I found the body of a sergeant in the cave behind the breach... it bears the insignia of the commander's adjutant!~ DO ~SetGlobal("bsReportedSerjeante","MYAREA",1) SetGlobal("bsReportedCave","MYAREA",1)~ + doppelgangerquest_grd2

        + ~GlobalGT("bsPrisonMyconiziden","GLOBAL",5) 
Global("bsRemovedColony","MYAREA",0)~ + ~I destroyed the spore colony, it shouldn't give you any more trouble.~ DO ~SetGlobal("bsRemovedColony","MYAREA",1)~ + myconides
+ ~Global("bsPrisonMyconiziden","GLOBAL",6) Global("bsSeaCaveOpen","GLOBAL",0)~ + ~There is a hole in the prison wall behind where the spore colony used to be.~ + myconides_01

        + ~Global("bsAskedPrisonyssold09","MYAREA",0) Global("bsSeaCaveOpen","GLOBAL",0)
Global("bsDoppelgangerQuest","GLOBAL",0)~ + ~What were you saying about there being a way in earlier?~ DO ~SetGlobal("bsAskedPrisonyssold09","MYAREA",1)~ EXTERN bsprgrd1 yssold09_3

	+ ~GlobalGT("bsPrisonSahuaginGone","MYAREA",0) Global("bsAskedAboutSahuagin","MYAREA",0)~ + ~What happened to the captured Sahuagin?~ DO ~SetGlobal("bsAskedAboutSahuagin","MYAREA",1)~ + sahuagin_gone

        ++ ~We'll be fine. I'll have a look around.~ + ysstalk01_9
        ++ ~We'll just be leaving, then.~ + ysstalk01_5
  END

IF ~~ THEN info
SAY ~Dopp...?!~
IF ~~ THEN + info_01
END

IF ~~ THEN info_00
SAY ~Doppelganger scum? Why would I be... Wait. There were doppelgangers inside the tower?! The commander is aware, I presume - that's the reason you are down here!~
IF ~~ THEN + info_01
END

IF ~~ THEN info_01
SAY ~It now all makes sense to me... why my partner's accent would drop sometimes and how I caught him glaring at me, eyes full of malice, before he left... (shudders)~
IF ~~ THEN + info_02
END

IF ~~ THEN info_02
SAY ~Thank you for letting me know. I'll be sure to keep my eyes open. Er, and you, too. Maybe you're a doppelganger yourself? Maybe *I*'m one? I mean, I know I'm not, but... (sigh) Take care down here, will you?~
IF ~~ THEN EXIT
END

IF ~~ THEN sahuagin_gone
SAY ~The creature went and died on us. I wasn't aware it couldn't survive out of the water for that long. Whatever the reasons, it is dead now.~
IF ~~ THEN EXIT
END


IF ~~ THEN doppelgangerquest_grd2
SAY ~What? You are telling me that you found the sergeant dead in a cave behind the prison wall? But... the last I saw him, he was walking right out of the prison door! How...~
IF ~~ THEN DO ~SetGlobal("bsReportedSerjeante","MYAREA",1)~ EXTERN bsprgrd1 doppelgangerquest_grd1
IF ~Global("bsDoppelgangerQuest","GLOBAL",1)~ THEN + doppelgangerquest_grd2_01
IF ~GlobalGT("bsDoppelgangerQuest","GLOBAL",1) Global("bsInTheLoop","LOCALS",0)~ THEN + doppelgangerquest_grd2_03
IF ~GlobalGT("bsDoppelgangerQuest","GLOBAL",1) Global("bsInTheLoop","LOCALS",1)~ THEN + doppelgangerquest_grd2_04
END

IF ~~ THEN doppelgangerquest_grd2_01
SAY ~My partner already went upstairs to report the passage in the wall. Something was odd, though... His accent slipped a couple of times and he had a strange look in his eyes... If you would go upstairs and make sure the commander is informed, I would appreciate it very much. I cannot leave my post - and it was just a gut feeling. I have no reason to distrust my partner.~
IF ~~ THEN DO ~EraseJournalEntry(@816)~ UNSOLVED_JOURNAL @817 EXIT
END

IF ~~ THEN doppelgangerquest_grd2_02
SAY ~Yes, we noticed after you left.~
IF ~Global("bsDoppelgangerQuest","GLOBAL",1)~ THEN + doppelgangerquest_grd2_01
IF ~GlobalGT("bsDoppelgangerQuest","GLOBAL",1) Global("bsInTheLoop","LOCALS",0)~ THEN + doppelgangerquest_grd2_03
IF ~GlobalGT("bsDoppelgangerQuest","GLOBAL",1) Global("bsInTheLoop","LOCALS",1)~ THEN EXIT
END

IF ~~ THEN doppelgangerquest_grd2_03
SAY ~(sigh) I hope *someone* tell's me what is going on.~
IF ~~ THEN EXIT
END

IF ~~ THEN doppelgangerquest_grd2_04
SAY ~It's doppelgangers, isn't it?~
IF ~~ THEN + doppelgangerquest_grd2_03
END


END //APPEND

CHAIN
IF ~~ THEN bsprgrd2 myconides
~Thanks! This will save us some trouble. We'll have it burned out - the last thing we need here is a myconid infestation.~
== bsprgrd2 IF ~Global("bsReportedCave","MYAREA",1)~ THEN ~And it did show us that there is *indeed* a secret entrance... I hate it when I'm right.~
END
IF ~~ THEN DO ~EraseJournalEntry(@753) AddexperienceParty(150)~ SOLVED_JOURNAL @754 + ysstalk01_10

APPEND bsprgrd2

IF ~~ THEN myconides_01
SAY ~Yes, we know. One of the sergeants investigated it already, it's just a small dead end, nothing more.~
IF ~~ THEN + ysstalk01_10
END

END //APPEND

CHAIN
IF ~~ THEN bsprgrd1 doppelgangerquest_grd1
~Indeed. Thank you for reporting this to us. We'll make sure to pass the news on. Actually, I will pass the news on. Jai, you stay here - we can't leave the prison unguarded now, can we? This is important, yesss, it is.~
== bsprgrd2 ~Indeed, this has to be reported right away... Wait, what just happened to his accent? And did you see that look in his eyes?... That's odd. I'll have to ask him about it when he gets back.  Well, since one of us has to stay, I'll remain here on duty.~
END
IF ~~ THEN DO ~SetGlobal("bsDoppelgangerQuest","GLOBAL",1) 
EraseJournalEntry(@816)
ActionOverride("bsprgrd1",EscapeAreaDestroy(3))~ UNSOLVED_JOURNAL @817 EXIT

APPEND bsprgrd1

IF ~True()~ THEN prison_open
SAY ~Ye talk to Jai, I'm not a talker.~
IF ~~ THEN EXTERN bsprgrd2 ysstalk01_10
END

END //APPEND

