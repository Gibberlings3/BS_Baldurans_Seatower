/* 
man: Attendant, bstq002.cre, bs1010.are, [1102.349],0
Boy: Lars, bstq003.cre, bs1010.are, [1154.389],5
Woman: Lady Springfall, bstq001.cre, bs1011.are, [1032.731],2;

*/


BEGIN bstq002

IF ~NumTimesTalkedTo(0)~ THEN attendant
SAY @10004 /* ~Yes, I know this is not the right pace for a young child like this boy. I can't help it that the old crone doesn't want to see him. Lars! Stop making a mess and drink your juice properly. Man, I wished someone would go upstairs and tell this woman that I am not getting paid for waiting up until she made up her mind about this child!~ */
IF ~~ THEN DO ~SetGlobal("bsOrphanQuest","GLOBAL",1)~ UNSOLVED_JOURNAL @777 /* ~An Orphan in the Seatower

Inside the Balduren's Seatower Inn I met a man who is travelling with a boy. The boy should appearently be picked up by a lady who resides on the first floor but so far did not make up her mind to really take over the boy. I could ask her what this is all about.~ */ EXIT
END

IF ~Global("bsOrphanQuest","GLOBAL",3)~ THEN attendant_01
SAY @10005 /* ~Great, just great. The old crone left without talking to me. At least she sent some gold my way. Come on, Lars, let's find you a new home.~ */
IF ~~ THEN DO ~SetGlobal("bsOrphanQuest","GLOBAL",5)~ EXIT
END


IF ~NumTimesTalkedToGT(0)~ THEN attendant_02
SAY @10006 /* ~Lars, just be quiet for a moment, yes? (sigh)~ */
IF ~GlobalLT("bsOrphanQuest","GLOBAL",2)~ THEN EXIT
END


BEGIN bstq003

IF ~GlobalLT("bsOrphanQuest","GLOBAL",4)~ THEN boy
SAY @10007 /* ~Hello! Mister bought me three juices already! Mister is really nice!~ */
IF ~~ THEN EXIT
END

IF ~Global("bsOrphanQuest","GLOBAL",4)~ THEN boy_01
SAY @10008 /* ~This is my grandma! My grandma! She looks a bit scary but I think I like her.~ */
IF ~~ THEN EXIT
END



BEGIN bstq001

IF ~GlobalLT("bsOrphanQuest","GLOBAL",3)~ THEN grandma
SAY @10009 /* ~Good day to you, young <PRO_MANWOMAN>. I apologize, but I need to think a matter over, so I wish you a good day.~ */
+ ~Global("bsOrphanQuest","GLOBAL",1)~ + @10010 /* ~Yes, the man downstairs said you are supposed to pick up the boy he is travelling with.~ */ + grandma_01
+ ~Global("bsOrphanQuest","GLOBAL",1)~ + @10011 /* ~If I am assuming correctly, you are the woman who is suposed to adopt young Lars who is waiting with his attendant downstairs?~ */ + grandma_01
+ ~Global("bsOrphanQuest","GLOBAL",2)~ + @10012 /* ~So, sure I can't help you with that boy downstairs?~ */ + grandma_02 
+ ~OR(2) Global("bsOrphanQuest","GLOBAL",1) Global("bsOrphanQuest","GLOBAL",2)~ + @10013 /* ~Good day to you, too.~ */ EXIT
IF ~Global("bsOrphanQuest","GLOBAL",0)~ THEN EXIT
END

IF ~~ THEN grandma_01
SAY @10014 /* ~Ah, does he tell the whole inn now... wonderful. I apologize, this was by no means addressed at you, specifically. That man is not the best choice for this obligation, but there is not much I can do, I did no enlist him with the task. (sigh) Noone did, actually, not from our family, that is. See, the child is my deceised daughter's son - my grandson.~ */
= @10015 /* ~Yes, yes, I know - "why does she not fly down the stairs and take that poor child into her arms?" Well, it's not that easy. It never is. But this is no business to bother you with, my good <PRO_LADYLORD>. You do not need to burden yourself with such matters.~ */
++ @10016 /* ~On the contrary, I'd be delighted to help in any way.~ */ + grandma_02
++ @10017 /* ~It does sound like an intriguing story, to be honest.~ */ + grandma_03
++ @10018 /* ~Indeed. Farwell.~ */ DO ~SetGlobal("bsOrphanQuest","GLOBAL",2)~ EXIT
END

IF ~~ THEN grandma_02
SAY @10019 /* ~That is very kind of you, but I wouldn't know how... Other than listening to my woes and tell me whether I am a silly old hag who should come to her senses!~ */ 
IF ~~ THEN DO ~SetGlobal("bsOldHag","LOCALS",1)~ + grandma_04
END

IF ~~ THEN grandma_03
SAY @10020 /* ~A story... yes, it indeed is one.~ */
IF ~~ THEN + grandma_04
END

IF ~~ THEN grandma_04
SAY @10021 /* ~See - my daughter, my one child, fell in love with a man who... who treated her badly. He made her obedient and made her rejecting me, I knew she suffered but there was not much I could do. Now my daughter died, that man is nowhere to be found, and I... I am scared.~ */
= @10022 /* ~I am scared that boy looks like him. That I look into his face and see the man who maltreated my Silvia, who is responsible for her withering away. I... I couldn't stand it. I would make him suffer for what he did, although I know that child is innocent. I just... I can't.~ */
++ @10023 /* ~You mean you didn't really see him until now?~ */ + grandma_07
++ @10024 /* ~He's right downstairs. Why not go down and have a look? Maybe he looks completely different!~ */ + grandma_07
+ ~Global("bsOldHag","LOCALS",1)~ + @10025 /* ~You are a silly old hag who should come to her senses!~ */ + grandma_05
++ @10026 /* ~You should feel responsible for your grandson, no matter the looks.~ */ + grandma_08
++ @10027 /* ~Ah well, I wouldn't care about one brat, either. Good day to you.~ */ EXIT 
END

IF ~~ THEN grandma_05
SAY @10028 /* ~...I beg your pardon?~ */
++ @10029 /* ~That's what you said I should call you, remember?~ */ + grandma_06
++ @10030 /* ~It's not necessarily my opinion, I just wanted to say that to a complete stranger once!~ */ + grandma_10
END

IF ~~ THEN grandma_06
SAY @10031 /* ~So you think I should go downstairs and act like a responsible grandmother?~ */
++ @10032 /* ~Absolutely!~ */ + grandma_07
++ @10033 /* ~Do you have to take him in if you don't like him? There are foster homes, as well.~ */ + grandma_08
++ @10034 /* ~Whatever. Good day to you.~ */ EXIT
END

IF ~~ THEN grandma_07
SAY @10035 /* ~I... I didn't dare.~ */
IF ~~ THEN + grandma_09
END

IF ~~ THEN grandma_08
SAY @10036 /* ~I know I should feel responsible for my own grandchild.~ */
IF ~~ THEN + grandma_07
END

IF ~~ THEN grandma_09
SAY @10037 /* ~But you... you already saw him, yes? Tell me... does he have black hair?~ */
++ @10038 /* ~No, his hair is more dark brown-ish, actually.~ */ + grandma_11
++ @10039 /* ~(lie) Yes, black as night with bats and crows in it!~ */ DO ~IncrementGlobal("bsOrphanLies","LOCALS",1)~ + grandma_11
++ @10040 /* ~I don't remember.~ */ + grandma_11
END

IF ~~ THEN grandma_10
SAY @10041 /* ~I know it's a bit much, being drawn into a stranger's problems so. But...~ */
IF ~~ THEN + grandma_09
END

IF ~~ THEN grandma_11
SAY @10042 /* ~Oh... And his eyes, are they more blue... or grey?~ */
++ @10043 /* ~Hm... more grey, I think.~ */ + grandma_16
++ @10044 /* ~(lie) Blue, definitely.~ */ DO ~IncrementGlobal("bsOrphanLies","LOCALS",1)~ + grandma_12
++ @10045 /* ~I really don't remember.~ */ + grandma_14
END

IF ~~ THEN grandma_12
SAY @10046 /* ~Blue eyes...~ */
IF ~~ THEN + grandma_13
END

IF ~~ THEN grandma_13
SAY @10047 /* ~So it... it could very well be that my worst nightmares...~ */
IF ~Global("bsOrphanLies","LOCALS",1)~ THEN + grandma_14
IF ~Global("bsOrphanLies","LOCALS",1)~ THEN + grandma_15
END 

IF ~~ THEN grandma_14
SAY @10048 /* ~Hm. I need to have a look into that boys eyes.~ */
IF ~~ THEN + grandma_17
END

IF ~~ THEN grandma_15
SAY @10049 /* ~Black hair and blue eyes... that is *him*, that is him... No, I can't stand it, I will not face this child... I thank you, stranger, for your help. I will take care of that boy, but not in my house. I need to leave.~ */
IF ~~ THEN DO ~SetGlobal("bsOrphanQuest","GLOBAL",3) EraseJournalEntry(@777)~ 
SOLVED_JOURNAL @778 /* ~An Orphan in the Seatower

Oh, how "unfortunate"... The grandmother declined to even see her grandson and left without taking him on, after my description of his looks which was not exactly... accurate. Well, that happens if you trust a stranger's testimony more than checking yourself. I don't think I need to feel guilty here, if people are so silly!~ */ EXIT
END

IF ~~ THEN grandma_16
SAY @10050 /* ~Could it be...~ */
IF ~~ THEN + grandma_17
END

IF ~~ THEN grandma_17
SAY @10051 /* ~I thank you, kind <PRO_SIRMAAM>. I will go downstairs. I finally found the courage!~ */
IF ~~ THEN DO ~SetGlobal("bsOrphanQuest","GLOBAL",4)~ EXIT
END

IF ~Global("bsOrphanQuest","GLOBAL",4)~ THEN downstairs
SAY @10052 /* ~There you are! You wonderful, kind <PRO_LADYLORD>! Can you imagine? My grandson! He looks just like my son!~ */
++ @10053 /* ~Your son? You wanted to say he looks alike your daughter, I guess?~ */ + downstairs_01
++ @10054 /* ~What do you mean?~ */ + downstairs_06
++ @10055 /* ~So, all is well, then?~ */ + downstairs_03
++ @10056 /* ~Whatever, I'm not interested in your problems.~ */ + downstairs_02
END

IF ~~ THEN downstairs_01
SAY @10057 /* ~No, no, my *son*.~ */
IF ~~ THEN + downstairs_04
END

IF ~~ THEN downstairs_02
SAY @10058 /* ~I see. Well, I wanted to let you know nontheless. You are a kind person, even if you don't let it show at all times.~ */
IF ~~ THEN + downstairs_05
END

IF ~~ THEN downstairs_03
SAY @10059 /* ~Oh yes. Everything!~ */
IF ~~ THEN + downstairs_04
END

CHAIN
IF ~~ THEN bstq001 downstairs_04
@10060 /* ~My dear, little Joeffrey, who died from the measles when he was 10... I... Look at this boy! The same big, grey eyes, the same brownish hair... He...~ */
= @10061 /* ~This... This boy is of my flesh and blood. He is my grand-son!... I... I thank you for bringing me to him, <PRO_LADYLORD>. I *thank* you.~ */
== bstq003 @10062 /* ~Grandma? I draw a picture for you.~ */
== bstq001 @10063 /* ~Oh, how nice.... But oh, I didn't bring anything for you! Can you imagine? How about.. how about we go to the carnival and have a huge bag of sugared almonds, hm?~ */
== bstq003 @10064 /* ~Oh, I love almonds!~ */
= @10065 /* ~And this drawing is for you! You are a fearless adventurer, are you not?~ */ DO ~GiveItemCreate("bstq001",[PC],0,0,0)~
END
IF ~~ THEN EXTERN bstq001 downstairs_05

CHAIN
IF ~~ THEN bstq001 downstairs_05
@10066 /* ~Well then, Lars! Let's go to the carnival!~ */
== bstq003 @10067 /* ~Wohoo!~ */
END
IF ~~ THEN DO ~SetGlobal("bsOrphanQuest","GLOBAL",6) EraseJournalEntry(@777)~  SOLVED_JOURNAL @779 /* ~An Orphan in the Seatower

This was heartwarming. The grandmother took on her grandson, and I think they will do fine.~ */ EXIT


APPEND bstq001 

IF ~~ THEN downstairs_06
SAY @10068 /* ~I am talking about my *son*.~ */
IF ~~ THEN + downstairs_04
END

END //APPEND




