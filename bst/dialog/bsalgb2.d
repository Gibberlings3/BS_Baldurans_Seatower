BEGIN bsalgb2

/* Book Of Future Memories */
IF ~True()~ THEN open
SAY @9180 /* The book can now be opened effortlessly. */
+ ~Global("bs_TalkingBooks","GLOBAL",0)~ + @9181 /* ~Open the book.~ */ DO ~SetGlobal("bs_TalkingBooks","GLOBAL",1)~ GOTO open_book
+ ~GlobalGT("bs_TalkingBooks","GLOBAL",0)~ + @9181 /* ~Open the book.~ */ GOTO open_book
++ @9182 /* You leave the book be. */ DO ~SetGlobal("bsActivateBookDisplay","MYAREA",1) DestroySelf()~ EXIT
END

IF ~~ THEN open_book
SAY @9185 /* The page is full of pictures. A voice in your head says 'Which one is your destiny?' It is clear that you are supposed to touch the according picture on the book's page.~ */
++ @9162 /* ~You press on the picture of a city.~ */ + open_book_01
++ @9163 /* ~You press on the picture of a house.~ */ + open_book_01
++ @9164 /* ~You press on the picture of a horse.~ */ + open_book_01
++ @9165 /* ~You press on the picture of a dragon.~ */ + open_book_01
++ @9166 /* ~You press on the picture of an isle.~ */ + open_book_01
++ @9167 /* ~You press on the picture of a temple.~ */ + open_book_01
++ @9168 /* ~You press on the picture of a boat.~ */ + open_book_01
++ @9169 /* ~You press on the picture of a sword.~ */ + open_book_01
++ @9170 /* ~You press on the picture of a shield.~ */ + open_book_01
++ @9171 /* ~You press on the picture of a man.~ */ + open_book_01
++ @9172 /* ~You press on the picture of a woman.~ */ + open_book_01
+ ~Global("bsReadBook","MYAREA",0)~ + @9173 /* ~You press on the picture of a tree.~ */ + open_book_02
+ ~Global("bsReadBook","MYAREA",1)~ + @9174 /* ~Inspired by hearing the voice while reading the other book, you press on the picture of a tree.~ */ + open_book_02
++ @9175 /* ~You press on the picture of a mountain.~ */ + open_book_01
++ @9176 /* ~You press on the picture of a road.~ */ + open_book_01
++ @9177 /* ~You press on the picture of the sun.~ */ + open_book_01
++ @9178 /* ~You press on the picture of the moon.~ */ + open_book_01
++ @9179 /* ~You press on the picture of an altar.~ */ + open_book_01
END

IF ~~ THEN open_book_01
SAY @9186 /* ~Something pinches your finger so it hurts and the book quickly closes with a loud thud. From somewhere within your head, you hear a voice saying 'Not curious enough this one. Maybe <PRO_HESHE> is not ready yet.'~ */
IF ~~ THEN DO ~ApplyDamage(Player1,5,PIERCING) SetGlobal("bsActivateBookDisplay","MYAREA",1) DestroySelf()~ EXIT
END

IF ~~ THEN open_book_02
SAY @9183 /* ~Upon touching the picture, you have the feeling that the book wants to take you to a distant place.~ */
++ @9184 /* ~You embark on an unknown journey, curious to see what the book wants to show you.~ */ DO ~SetGlobal("bsActivateBookDisplay","MYAREA",1)
ClearAllActions() StartCutSceneMode() StartCutScene("bs0138t2")~ EXIT
++ @9182 /* You leave the book be. */ DO ~SetGlobal("bs_TalkingBooks","GLOBAL",2) SetGlobal("bsActivateBookDisplay","MYAREA",1) DestroySelf()~ EXIT
END

