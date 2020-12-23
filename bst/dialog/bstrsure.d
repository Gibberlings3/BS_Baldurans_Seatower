/* Treasurer */

BEGIN bstrsure
IF ~True()~ THEN treasurer
SAY @1144 /* ~Greetings. What business brings you here?~ */
++ @1145 /* ~This is the treasury?~ */ + treasurer_01
+ ~PartyHasItem("bstrnt00")~ + @1154 /* ~Please give me the 500 gold it says here.~ */ DO ~TakePartyItemNum("bstrnt00",1) DestroyItem("bstrnt00") GiveGoldForce(500)~ + payout
+ ~PartyHasItem("bstrnt03")~ + @1146 /* ~I have a treasure note about 3000 gold I would like you to pay out.~ */ DO ~TakePartyItemNum("bstrnt03",1) DestroyItem("bstrnt03") GiveGoldForce(3000)~ + payout
+ ~PartyHasItem("bstrnt05")~ + @1147 /* ~Please give me the 5000 gold it says here on this note.~ */ DO ~TakePartyItemNum("bstrnt05",1) DestroyItem("bstrnt05") GiveGoldForce(5000)~ + payout
+ ~PartyHasItem("bstrnt20")~ + @1148 /* ~I need you to pay out the 20,000 gold it says here on this treasurer note.~ */ DO ~TakePartyItemNum("bstrnt20",1) DestroyItem("bstrnt20") GiveGoldForce(20000)~ + payout
++ @1149 /* ~Nothing, actually.~ */ + goodbye
END

IF ~~ THEN else
SAY @1150 /* ~Anything else?~ */
+ ~PartyHasItem("bstrnt00")~ + @1154 /* ~Please give me the 500 gold it says here.~ */ DO ~TakePartyItemNum("bstrnt00",1) DestroyItem("bstrnt00") GiveGoldForce(500)~ + payout
+ ~PartyHasItem("bstrnt03")~ + @1146 /* ~I have a treasure note about 3000 gold I would like you to pay out.~ */ DO ~TakePartyItemNum("bstrnt03",1) DestroyItem("bstrnt03") GiveGoldForce(3000)~ + payout
+ ~PartyHasItem("bstrnt05")~ + @1147 /* ~Please give me the 5000 gold it says here on this note.~ */ DO ~TakePartyItemNum("bstrnt05",1) DestroyItem("bstrnt05") GiveGoldForce(5000)~ + payout
+ ~PartyHasItem("bstrnt20")~ + @1148 /* ~I need you to pay out the 20,000 gold it says here on this treasurer note.~ */ DO ~TakePartyItemNum("bstrnt20",1) DestroyItem("bstrnt20") GiveGoldForce(20000)~ + payout
++ @1149 /* ~Nothing, actually.~ */ + goodbye
END

IF ~~ THEN goodbye
SAY @1151 /* ~In this case I'd kindly ask you to leave the treasure room now.~ */
IF ~~ THEN EXIT
END

IF ~~ THEN treasurer_01
SAY @1152 /* ~Indeed, it is. If you have a treasure note from the Seatower Commander, I will pay out the mentioned sum in gold.~ */
IF ~~ THEN + else
END

IF ~~ THEN payout
SAY @1153 /* ~Indeed. Here you are.~ */
IF ~~ THEN EXIT
END