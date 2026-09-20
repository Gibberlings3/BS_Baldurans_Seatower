BEGIN bsbiff

IF ~Global("TalkedToBiff","LOCALS",0)~ THEN meeting
SAY @0 /* Oh, uh - you triggered the hidden Easter Egg, so I'll jump in for any monsters you'd meet here. Just - pretend I'm a, a, - uh... */
++ @1 /* Pardon - what? */ + meeting_01_b
++ @2 /* Biff the Understudy! Long time no see. */ + meeting_01_a
++ @3 /* Are you kidding me? */ + meeting_01
END

IF ~~ THEN meeting_01
SAY @4 /* Wellll... no? */
IF ~~ THEN + meeting_01_b
END

IF ~~ THEN meeting_01_a
SAY @5 /* Yes, it's almost like good old times, right? */
IF ~~ THEN + meeting_01_b
END

IF ~~ THEN meeting_01_b
SAY @6 /* I kind of remained after being a provisional cast - you know, so the quest can go on without having to implement every detail. Don't worry, I've done this several times. How about we pretend that I'm a - a tana'ri! That's it. I'm a Taaana'riii... */
++ @7 /* Tana'ri is bad, there is a Nabassu Fledgling right in this dungeon. */ + meeting_02
END

IF ~~ THEN meeting_02
SAY @8 /* Oh, that's right. How about - a Glabrezuuuu... */
++ @9 /* Sorry, Biff, but there is also one of those down by the Seacave. */ + meeting_03
END

IF ~~ THEN meeting_03
SAY @10 /* Right - right. Hmm, how about... how about a dragon? */
++ @11 /* A drag - A DRAGON? */ + meeting_04
++ @12 /* This is not working, Biff. */ + meeting_05
END

IF ~~ THEN meeting_04
SAY @13 /* Wait, you are right. I was told that's not an option. */
IF ~~ THEN + meeting_05
END

IF ~~ THEN meeting_05
SAY @14 /* How about I just give you the lenses you still need? How many do you want? */
++ @15 /* ...All of them? */ + meeting_06
++ @16 /* Biff, this took long enough. Just hand over whatever you've got. */ + meeting_09
++ @17 /* I regret finding this easter egg. Any chance you could restore the monsters that were supposed to be here? */ + meeting_07
++ @18 /* Wait! Before you go. What exactly triggered your appearance? */ + meeting_08
END

IF ~~ THEN meeting_06
SAY @19 /* Good answer! */
IF ~~ THEN + meeting_09
END

IF ~~ THEN meeting_07
SAY @20 /* I'm awfully sorry, but this isn't possible - way over my paygrade! I'll just give you the lenses and we'll try to forget about this. */
IF ~~ THEN + meeting_09
END

IF ~~ THEN meeting_08
SAY @21 /* Are you saying you really don't know for sure? Alright, it's putting in the black lense, taking it out again, and having only the black but no clear lense in your back pack when going through one of the three picture portals. The devs thought that's unusual enough not to be triggered accidentally. They didn't want anyone experiencing a 4th wall break without knowing it's an easter egg. */
++ @22 /* Well, it was nice meeting you. What now? */ + meeting_10
++ @16 /* Biff, this took long enough. Just hand over whatever you've got. */ + meeting_09
++ @17 /* I regret finding this easter egg. Any chance you could restore the monsters that were supposed to be here? */ + meeting_07
END

IF ~~ THEN meeting_09
SAY @23 /* Here you are. It's possible you have too many now, by the way. You'd think they'd take the time to script this more reliably! ... I'll go now. Probably biding my time trying to be a role model somewhere. */
IF ~~ THEN DO ~GiveItemCreate("bslense1",Player1,1,0,0) 
GiveItemCreate("bslense1",Player1,1,0,0)
GiveItemCreate("bslense1",Player1,1,0,0)
SetGlobal("bsBiffEasterEgg","GLOBAL",3)
EscapeAreaDestroy(5)~ EXIT
END

IF ~~ THEN meeting_10
SAY @24 /* Now, I'll go back to being no one of importance any more... Oh, you meant for *you*. Well, I guess I'll just give you all the lenses I have. */
IF ~~ THEN + meeting_09
END
