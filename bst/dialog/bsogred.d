BEGIN ~BSOGRED~

IF ~~ THEN BEGIN 0 // from:
  SAY @9277 //#5230 /* ~Me no beast! Me don't want fight! Go 'way!~ */
  IF ~~ THEN EXTERN ~BSWHITKD~ 1
END

IF ~~ THEN BEGIN 1 // from:
  SAY @9278 //#5231 /* ~Shiny man attack ME! I be good but he make fight! He want kill for no reason!~ */
  IF ~~ THEN EXTERN ~BSVOICE~ 16
END

IF ~~ THEN BEGIN 2 // from:
  SAY @9279 //#5232 /* ~You no hurt me, me no hurt you! Me don't care if me born bad! Me be good if me want to! You too... remember. You born VERY bad. Maybe you be good if you want too.~ */
  IF ~~ THEN EXTERN ~BSVOICE~ 18
END
