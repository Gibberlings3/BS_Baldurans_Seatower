// Variable suffixes:
// HFM = dialog in bs0128
// FM1 = dialog in bs0129
// FM2 = dialog in bs0130
// FM3L = dialog in bs0131
// FM4 = dialog in bs0133
// FM6H1 = dialog in bs0140
// FM5 = dialog in bs0134

//---------------------------------------------------------
// Initial halls all visited: Global("bsVisitedHalls","GLOBAL",4)
//---------------------------------------------------------


BEGIN bsalgune
//---------------------------------------------------------
// Second visit to the blind room
//---------------------------------------------------------
IF ~Global("bsHFMTrap","GLOBAL",2)~THEN BEGIN sb
	SAY @2100 /* ~Well, you do seem to want to get yourself into trouble, don't you?~ */
	++ @2346 /* ~Yes, I agree it was kind of... logical that the portal still leads to this enclosed place.~ */ + sb1.1
	IF~Global("bsAlguineNoNastySurprises","GLOBAL",1)~THEN REPLY @2101 /* ~I thought you said there were no more nasty surprises around here?~ */ GOTO sb2
	IF~~THEN REPLY @2102 /* ~Just get me out of here, mage!~ */ GOTO sb3
END

IF ~~ THEN BEGIN sb1.1
	SAY @2347 /* This one, most definitely. I understand the urge to go checking, though. Sometimes, portals change their destinations.~ */
	IF~Global("bsAlguinePortalChangesTalk","GLOBAL",0)~THEN REPLY @2210 /* ~How often do the portals change?~ */ DO ~SetGlobal("bsAlguinePortalChangesTalk","GLOBAL",1)~ GOTO 203
	IF~Global("bsAlguineNoNastySurprises","GLOBAL",1)~THEN REPLY @2101 /* ~I thought you said there were no more nasty surprises around here?~ */ GOTO sb2
	IF~~THEN REPLY @2102 /* ~Just get me out of here, mage!~ */ GOTO sb3
END

//---------------------------------------------------------
IF ~~ THEN BEGIN sb2
	SAY @2103 /* ~Ah. I'd say this was more of a surprise rather than a nasty surprise, wouldn't you? There was nothing here trying to kill you this time.~ */
	IF~NumInParty(1)~THEN REPLY @2104 /* ~Just get me out of here, please.~ */ GOTO sb3
	IF~NumInPartyGT(1)~THEN REPLY @2105 /* ~Just get us out of here, please.~ */ GOTO sb3
END

//---------------------------------------------------------
IF ~~ THEN BEGIN sb3
	SAY @2106 /* ~Certainly. I've taken the precaution of closing that portal, you'll be pleased to hear.~ */
	IF~~THEN REPLY @2107 /* ~But I thought you couldn't control the portals!~ */ GOTO sb4
END

//---------------------------------------------------------
IF ~~ THEN BEGIN sb4
	SAY @2108 /* ~Tut, tut. You don't listen do you? I told you that I put the Nabassu here. Anyway, it won't happen again.~ */
	IF~~THEN
		DO ~SetInterrupt(FALSE)
			SetGlobal("bsAlguineTan","GLOBAL",7)
				IncrementGlobal("bsHFMTrap","GLOBAL",1)
				CloseDoor("DOOR0002")
				TriggerActivation("Travinternal",FALSE)
				ForceSpellRES("BS00002",Protagonist)
				Wait(1)
				ActionOverride(Player1,LeaveAreaLUA("bs0128","",[405.2107],10))
				ActionOverride(Player2,LeaveAreaLUA("bs0128","",[405.2107],10))
				ActionOverride(Player3,LeaveAreaLUA("bs0128","",[405.2107],10))
				ActionOverride(Player4,LeaveAreaLUA("bs0128","",[405.2107],10))
				ActionOverride(Player5,LeaveAreaLUA("bs0128","",[405.2107],10))
				ActionOverride(Player6,LeaveAreaLUA("bs0128","",[405.2107],10))
				JumpToPoint([1783.1156])
				SetInterrupt(TRUE)~
  	EXIT

	IF~Global("bs_AlguineMovedOn","GLOBAL",1)~THEN
		DO ~SetInterrupt(FALSE)
			SetGlobal("bsAlguineTan","GLOBAL",7)
				IncrementGlobal("bsHFMTrap","GLOBAL",1)
				CloseDoor("DOOR0002")
				TriggerActivation("Travinternal",FALSE)
				ForceSpellRES("BS00002",Protagonist)
				Wait(1)
				ActionOverride(Player1,LeaveAreaLUA("bs0128","",[405.2107],10))
				ActionOverride(Player2,LeaveAreaLUA("bs0128","",[405.2107],10))
				ActionOverride(Player3,LeaveAreaLUA("bs0128","",[405.2107],10))
				ActionOverride(Player4,LeaveAreaLUA("bs0128","",[405.2107],10))
				ActionOverride(Player5,LeaveAreaLUA("bs0128","",[405.2107],10))
				ActionOverride(Player6,LeaveAreaLUA("bs0128","",[405.2107],10))
				DestroySelf()
				SetInterrupt(TRUE)~
  	EXIT
END


//---------------------------------------------------------
// Dialog holder 1
//---------------------------------------------------------
IF ~!Dead("bstanar")
		AreaCheck("bs0128")
		Global("bsTalkToAlguineHFM","GLOBAL",3)
		!Global("bsVisitedHalls","GLOBAL",4)~ THEN BEGIN PLC1
	SAY @2109 /* ~No, no! Go away and explore! There's lots to find yet.~ */
+ ~Global("bsFreedUlf","GLOBAL",0)
Global("bsSkippedToUlf","MYAREA",0)~ + @2348 /* ~I came here to save someone a man named Klaus left behind. That's not you, is it?~ */ DO ~SetGlobal("bsNotUlf","MYAREA",1)~ + early_exit_01
+ ~GlobalGT("bsFreedUlf","GLOBAL",0)~ + @2349 /* ~No, but I freed Ulf which was the reason I came here, so I'm done.~ */ + early_exit_03
+ ~OR(2)
GlobalGT("bsFreedUlf","GLOBAL",0)
Global("bsSkippedToUlf","MYAREA",1)~ + @2350 /* ~I lost patience with all of this, Alguine.~ */ + early_exit_04
+ ~Global("bsFreedUlf","GLOBAL",0)
Global("bsSkippedToUlf","MYAREA",0)~ + @2350 /* ~I lost patience with all of this, Alguine.~ */ DO ~SetGlobal("bsNotUlf","MYAREA",1)~ + early_exit_07
++ @2351 /* ~I'll continue examining the portals.~ */ + early_exit_06
END

//---------------------------------------------------------
// Dialog holder 2
//---------------------------------------------------------
IF ~Global("bsTalkToAlguineHFM","GLOBAL",4)
		AreaCheck("bs0128")
		!Global("bsVisitedHalls","GLOBAL",4)~ THEN BEGIN PLC2
	SAY @2110 /* ~Are you quite sure you've explored *all* of the Halls?~ */
COPY_TRANS bsalgune PLC1
END



//---------------------------------------------------------
// Halls of Future Memories
//---------------------------------------------------------
//---------------------------------------------------------
// Initial meeting
//---------------------------------------------------------
IF ~Global("bsTalkToAlguineHFM","GLOBAL",0)
		AreaCheck("bs0128")~ THEN BEGIN 0
	SAY @2111
	IF~~THEN REPLY @2112 GOTO 2
	IF~~THEN REPLY @2113 GOTO 2
	IF~~THEN REPLY @2114 GOTO 1
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 1
	SAY @2115
	IF~~THEN REPLY @2116 GOTO 2
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 2
	SAY @2117
	IF~~THEN
		DO~SetGlobal("bsTalkToAlguineHFM","GLOBAL",1)
			 SetGlobal("bsAlguineSpeechSpell","GLOBAL",1)~
	EXIT
END

//---------------------------------------------------------
IF ~Global("bsTalkToAlguineHFM","GLOBAL",2)
		AreaCheck("bs0128")~ THEN BEGIN 10
	SAY @2118
	IF~~THEN REPLY @2119 GOTO 11
	IF~~THEN REPLY @2120 GOTO 11
	IF~~THEN REPLY @2121 GOTO 11
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 11
	SAY @2122
	IF~~THEN REPLY @2123 GOTO 12
	IF~~THEN REPLY @2124 GOTO 12
	IF~~THEN REPLY @2125 GOTO 12
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 12
	SAY @2126
	=@2127
	IF~~THEN REPLY @2128 GOTO 14
	IF~~THEN REPLY @2129 GOTO 13
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 13
	SAY @2130
	IF~~THEN REPLY @2131 GOTO 15
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 14
	SAY @2132
	IF~~THEN REPLY @2133 GOTO 15
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 15
	SAY @2134
	=@2135
	=@2136
	=@2137
	=@2138
	IF~~THEN REPLY @2139 GOTO 18
	IF~~THEN REPLY @2140 GOTO 16
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 16
	SAY @2141
	IF~~THEN REPLY @2142 GOTO 17
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 17
	SAY @2143
	IF~~THEN REPLY @2144 GOTO 18
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 18
	SAY @2145
	=@2146
	=@2147
	=@2148
	IF~~THEN REPLY @2149 GOTO 20
	IF~~THEN REPLY @2150 GOTO 19
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 19
	SAY @2151
	IF~~THEN REPLY @2152 GOTO 20
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 20
	SAY @2153
	IF~~THEN REPLY @2154 GOTO 21
END

//---------------------------------------------------------
//	      ForceSpellPoint([566.2005],WIZARD_DIMENSION_DOOR)
//	 	    ActionOverride("bsalgune",DestroySelf())
//			CreateCreature("bsalgune",[1783.1156],2)~
IF ~~ THEN BEGIN 21
	SAY @2155
	IF~~THEN
		DO ~SetInterrupt(FALSE)
			CreateVisualEffectObject("SPDIMNDR",Myself)
			JumpToPoint([1783.1156])
			MoveToPoint([1783.1156])
			Face(2)
			SetGlobal("bsTalkToAlguineHFM","GLOBAL",3)
			SetInterrupt(TRUE)~
	EXIT
END

//---------------------------------------------------------
// Nabassu is dead
//---------------------------------------------------------
IF ~Dead("bstanar")
		AreaCheck("bs0128")
		Global("bsTalkToAlguineHFM","GLOBAL",3)~ THEN BEGIN 30
	SAY @2156 /* ~Hmmm. I see you've killed my pet demon.~ */
	IF~~THEN REPLY @2157 /* ~Your pet demon??!!!~ */ GOTO 31
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 31
	SAY @2158 /* ~Well, not really my pet demon but I was becoming rather fond of him. He was one of my failed attempts to kill myself - I was able to summon him but after we found out that he couldn't kill me, I wasn't able to send him back to wherever he came from. Never mind. I did get the feeling that he didn't really like me.~ */
	IF ~Global("bsAboutDemon","LOCALS",0)~ THEN REPLY @2159 /* ~Didn't... really... like... you?~ */ DO ~SetGlobal("bsAboutDemon","LOCALS",1)~ GOTO 32
	COPY_TRANS_LATE bsalgune 32
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 32
	SAY @2160 /* ~That's what I said.~ */
	IF ~Global("bsAboutUlf","LOCALS",0)
Global("bsNotUlf","MYAREA",0)~ THEN REPLY @2335 /* ~Who was that trapped man here? Why didn't you help him?~ */ DO ~SetGlobal("bsAboutUlf","LOCALS",1)~ + 32.1
	IF ~Global("bsAboutUlf","LOCALS",0)
Global("bsNotUlf","MYAREA",1)~ THEN REPLY @2340 /* ~Why didn't you help trapped Ulf?~ */ DO ~SetGlobal("bsAboutUlf","LOCALS",1)~ + 32.1
	IF~Global("bsAlguineNoNastySurprises","GLOBAL",0)~THEN REPLY @2220 /* ~You don't have any more nasty surprises lurking around anywhere, do you?~ */ DO ~SetGlobal("bsAlguineNoNastySurprises","GLOBAL",1)~ GOTO 32.3
	IF~~THEN REPLY @2339 /* ~Now what?~ */ + 32.2
END

IF ~~ THEN BEGIN 32.1
	SAY @2334 /* ~*As* I just happen to say I was not able to defeat the Nabassu, Fledgling or no, and that man's friend vanished too soon to sort out a plan. Also, young visitor, if you are as old as me - or should I say young? Hmmm... Anyway, if you lived that long you'll learn that everything sorts itself out eventually. As did this, see?~ */
	IF ~Global("bsAboutDemon","LOCALS",0)~ THEN REPLY @2336 /* ~The Nabassu "didn't really like you"?~ */ DO ~SetGlobal("bsAboutDemon","LOCALS",1)~ GOTO 32
	IF~Global("bsAlguineNoNastySurprises","GLOBAL",0)~THEN REPLY @2220 /* ~You don't have any more nasty surprises lurking around anywhere, do you?~ */ DO ~SetGlobal("bsAlguineNoNastySurprises","GLOBAL",1)~ GOTO 32.3
	IF~~THEN REPLY @2339 /* ~Now what?~ */ + 32.2
END

IF ~~ THEN BEGIN 32.2
	SAY @2332 /* ~Hmm. I see you've got yourselves trapped up this corner. You really should be careful of those portals, you know. They could lead anywhere. Almost anywhere. But I know where they lead.~ */
	+ ~GlobalGT("bsTalkToAlguineFM2","GLOBAL",0)~ + @2341 /* ~No, you don't. Not if they change - your own words!~ */ + 32_extra_01
	IF~~THEN REPLY @2161 /* ~Are you going to tell *us* where they all lead?~ */ GOTO 33
	IF~~THEN REPLY @2333 /* ~So, are you going to help us out of here or are we trapped now, too?~ */ GOTO 33
END

IF ~~ THEN BEGIN 32.3
	SAY @2223 /* ~No more nasty surprises lurking anywhere. Or none that I know of anyway. I can't speak for whoever made this place though.~ */
	IF~~THEN REPLY @2224 /* ~That's good news.~ */ GOTO 32_extra
	IF~~THEN REPLY @2339 /* ~Now what?~ */ + 32.2
END

IF ~~ THEN BEGIN 32_extra
	SAY @2390 /* ~[Alguine]Indeed.~ */
	IF ~Global("bsAboutUlf","LOCALS",0)
Global("bsNotUlf","MYAREA",0)~ THEN REPLY @2335 /* ~Who was that trapped man here? Why didn't you help him?~ */ DO ~SetGlobal("bsAboutUlf","LOCALS",1)~ + 32.1
	IF ~Global("bsAboutUlf","LOCALS",0)
Global("bsNotUlf","MYAREA",1)~ THEN REPLY @2340 /* ~Why didn't you help trapped Ulf?~ */ DO ~SetGlobal("bsAboutUlf","LOCALS",1)~ + 32.1
	IF~~THEN REPLY @2339 /* ~Now what?~ */ + 32.2
END

IF ~~ THEN BEGIN 32_extra_01
	SAY @2342 /* ~I don't know when or where to they will change, but once it happened, I know where to go to to find the destination. I know where they are leading *currently*, is what I was saying.~ */
	IF~~THEN REPLY @2161 /* ~Are you going to tell *us* where they all lead?~ */ GOTO 33
	IF~~THEN REPLY @2333 /* ~So, are you going to help us out of here or are we trapped now, too?~ */ GOTO 33
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 33
	SAY @2162 /* ~That would rather spoil your fun, wouldn't it? Hold on while I sort this mess out... there, that should do it.~ */
	IF~~THEN
		DO ~SetInterrupt(FALSE)
				SetGlobal("bsTalkToAlguineHFM","GLOBAL",4)
				ForceSpellRES("BS00002",Protagonist)
				Wait(1)
				ActionOverride(Player1,LeaveAreaLUA("bs0128","",[405.2107],10))
				ActionOverride(Player2,LeaveAreaLUA("bs0128","",[405.2107],10))
				ActionOverride(Player3,LeaveAreaLUA("bs0128","",[405.2107],10))
				ActionOverride(Player4,LeaveAreaLUA("bs0128","",[405.2107],10))
				ActionOverride(Player5,LeaveAreaLUA("bs0128","",[405.2107],10))
				ActionOverride(Player6,LeaveAreaLUA("bs0128","",[405.2107],10))
				JumpToPoint([1783.1156])
				SetInterrupt(TRUE)~
  	EXIT
	IF~Global("bs_AlguineMovedOn","GLOBAL",1)~THEN
		DO ~SetInterrupt(FALSE)
				SetGlobal("bsTalkToAlguineHFM","GLOBAL",4)
				ForceSpellRES("BS00002",Protagonist)
				Wait(1)
				ActionOverride(Player1,LeaveAreaLUA("bs0128","",[405.2107],10))
				ActionOverride(Player2,LeaveAreaLUA("bs0128","",[405.2107],10))
				ActionOverride(Player3,LeaveAreaLUA("bs0128","",[405.2107],10))
				ActionOverride(Player4,LeaveAreaLUA("bs0128","",[405.2107],10))
				ActionOverride(Player5,LeaveAreaLUA("bs0128","",[405.2107],10))
				ActionOverride(Player6,LeaveAreaLUA("bs0128","",[405.2107],10))
				DestroySelf()
				SetInterrupt(TRUE)~
  	EXIT
END

//---------------------------------------------------------
// All available future memories explored
//---------------------------------------------------------
IF ~Global("bsVisitedHalls","GLOBAL",4)
		AreaCheck("bs0128")~ THEN BEGIN 50
	SAY @2110 /* ~Are you quite sure you've explored *all* of the Halls?~ */
	IF~~THEN REPLY@2163 /* ~Yes. All except one which is a bit strange. There's a locked door there instead of a portal.~ */ GOTO 51
++ @2352 /* ~I would like to leave this place, Alguine. I know I won't be able to return.~ */ + early_exit_08
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 51
	SAY @2164 /* ~Oh yes. I have the key to that door.~ */
IF ~~ THEN + early_exit_11
END

//---------------------------------------------------------
// Future Memory 1
//---------------------------------------------------------
IF ~Global("bsTalkToAlguineFM1","GLOBAL",0)
		AreaCheck("bs0129")~ THEN BEGIN 100
	SAY@2165
	IF~~THEN REPLY @2166 GOTO 101
	IF~~THEN REPLY @2167 GOTO 102
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 101
	SAY @2168
	IF~~THEN REPLY @2169 GOTO 102
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 102
	SAY @2170
	IF~~THEN REPLY @2171 GOTO 104
	IF~~THEN REPLY @2172 GOTO 103
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 103
	SAY @2173
	IF~~THEN
		DO ~SetGlobal("bsTalkToAlguineFM1","GLOBAL",1)
	      ForceSpell(Myself,WIZARD_DIMENSION_DOOR)
	 	    ActionOverride("bsalgune",DestroySelf())~
	EXIT
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 104
	SAY @2174
	IF~~THEN REPLY @2175 GOTO 105
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 105
	SAY @2176
	IF~~THEN REPLY @2177 GOTO 106
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 106
	SAY @2178
	IF~~THEN REPLY @2179 GOTO 107
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 107
	SAY @2180
	=@2181
	IF~~THEN
		DO ~SetGlobal("bsTalkToAlguineFM1","GLOBAL",1)
	      ForceSpell(Myself,WIZARD_DIMENSION_DOOR)
	 	    ActionOverride("bsalgune",DestroySelf())~
	EXIT
END

//---------------------------------------------------------
// Future Memory 3
//---------------------------------------------------------
IF ~Global("bsTalkToAlguineFM3L","GLOBAL",0)
		AreaCheck("bs0131")~ THEN BEGIN 150
	SAY@2182
	IF~~THEN REPLY @2183 GOTO 151
	IF~~THEN REPLY @2184 GOTO 154
	IF~~THEN REPLY @2185 GOTO 151
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 151
	SAY @2186
	IF~~THEN REPLY @2187 GOTO 152
	IF~~THEN REPLY @2184 GOTO 154
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 152
	SAY @2188
	IF~~THEN REPLY @2189 GOTO 155
	IF~~THEN REPLY @2190 GOTO 153
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 153
	SAY @2191
	IF~~THEN REPLY @2192 GOTO 154
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 154
	SAY @2193
	IF~~THEN REPLY @2194 GOTO 156
END

 //---------------------------------------------------------
IF ~~ THEN BEGIN 155
	SAY @2195
	IF~~THEN REPLY @2190 GOTO 153
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 156
	SAY @2196
	IF~~THEN REPLY @2197 GOTO 157
	IF~~THEN REPLY @2198 GOTO 157
 END

//---------------------------------------------------------
IF ~~ THEN BEGIN 157
	SAY @2199
	IF~~THEN
		DO ~SetGlobal("bsTalkToAlguineFM3L","GLOBAL",1)
	      ForceSpell(Myself,WIZARD_DIMENSION_DOOR)
	 	    ActionOverride("bsalgune",DestroySelf())~
	EXIT
END

//---------------------------------------------------------
// Future Memory 2
//---------------------------------------------------------
IF ~Global("bsTalkToAlguineFM2","GLOBAL",0)
		AreaCheck("bs0130")~ THEN BEGIN 200
	SAY@2200 /* ~OH! Now this is interesting! I've never seen this place before! Is that water I can hear?~ */
	IF~GlobalLT("bsVisitedHalls","GLOBAL",5)~THEN REPLY @2201 GOTO 201 /* ~Yes - there's a fountain in the other room.~ */
	IF~~THEN REPLY @2202 GOTO 202 /* ~You've never been here before?~ */
	IF~NumInParty(1)~THEN REPLY @2203 /* ~If you've never been here before, how come you were able to follow me? Spying on me, are you?~ */ GOTO 206
	IF~NumInPartyGT(1)~THEN REPLY @2204 /* ~If you've never been here before, how come you were able to follow us? Spying on us, are you?~ */GOTO 206
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 201
	SAY @2205 /* ~A fountain! How delightful! I must go and take a look.~ */
	IF~~THEN REPLY @2206 /* ~Wait a moment - you said you've never been here before?~ */ GOTO 202
	IF~NumInParty(1)~THEN REPLY @2207 /* ~Wait a moment - if you've never been here before, how come you were able to follow me?~ */ GOTO 206
	IF~NumInPartyGT(1)~THEN REPLY @2208 /* ~Wait a moment - if you've never been here before, how come you were able to follow us?~ */ GOTO 206
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 202
	SAY @2209 /* ~No, I haven't. The portals don't always lead to the same places but after two centuries, it's getting rarer to see a new place.~ */
	++ @2343 /* ~But - if you are living backwards, shouldn't you have known this portal would lead to this place now? Because it does in the future - which is your past, so to say?~ */ + 202.1
	IF~Global("bsAlguinePortalChangesTalk","GLOBAL",0)~THEN REPLY @2210 /* ~How often do the portals change?~ */ DO ~SetGlobal("bsAlguinePortalChangesTalk","GLOBAL",1)~ GOTO 203
	IF~NumInParty(1)~THEN REPLY @2207 /* ~Wait a moment - if you've never been here before, how come you were able to follow me?~ */ GOTO 206
	IF~NumInPartyGT(1)~THEN REPLY @2208 /* ~Wait a moment - if you've never been here before, how come you were able to follow us?~ */ GOTO 206
END

IF ~~ THEN BEGIN 202.1
	SAY @2344 /* You are thinking this living backwards the wrong way, young visitor. I'm not *actually* living backwards from your future to your past - it's just that *my* flow of time is reversed while going with the actual flow of time. Makes sense? Don't feel ashamed to answer "no", it took me a while to understand that, myself. So, no, this portal did not lead here in my past, but it does now.~ */	
	IF~Global("bsAlguinePortalChangesTalk","GLOBAL",0)~THEN REPLY @2210 /* ~How often do the portals change?~ */ DO ~SetGlobal("bsAlguinePortalChangesTalk","GLOBAL",1)~ GOTO 203
	IF~NumInParty(1)~THEN REPLY @2207 /* ~Wait a moment - if you've never been here before, how come you were able to follow me?~ */ GOTO 206
	IF~NumInPartyGT(1)~THEN REPLY @2208 /* ~Wait a moment - if you've never been here before, how come you were able to follow us?~ */ GOTO 206
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 203
	SAY @2211 /* ~I don't know. They always change when someone new arrives but how often they change otherwise... your guess is definitely as good as mine.~ */
	IF~~THEN REPLY @2212 /* ~But they always lead back to the main Hall?~ */ GOTO 204
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 204
	SAY @2213 /* ~Not always. Sometimes one portal will lead to another and then you have a merry old time chasing your tail. Or my tail. Or somebody's tail anyway. Eventually you get dropped back into the Hall somewhere. At least, that's what's happened so far.~*/
	IF~~THEN REPLY @2214 /* ~Eventually?~ */ GOTO 205
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 205
	SAY @2215 /* ~Eventually. Could be after one portal, could be after many portals. Not worth worrying about.~ */
	IF~!AreaCheck("bs0128")
NumInParty(1)~THEN REPLY @2216 /* ~But if you've never been here before, how come you were able to follow me?~ */ GOTO 206
	IF~!AreaCheck("bs0128")
NumInPartyGT(1)~THEN REPLY @2217 /* ~But if you've never been here before, how come you were able to follow us?~ */ GOTO 206
	IF~AreaCheck("bs0128")
Global("bsAlguineNoNastySurprises","GLOBAL",1)~THEN REPLY @2101 /* ~I thought you said there were no more nasty surprises around here?~ */ GOTO sb2
	IF~AreaCheck("bs0128")~THEN REPLY @2102 /* ~Just get me out of here, mage!~ */ GOTO sb3
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 206
	SAY @2218 /* ~Ohh, that's no secret. A mage always knows where his guests are. Politeness and courtesy, you see; just in case they get into trouble.~ */
	IF~Dead("bstanar")~THEN REPLY @2219 /* ~Like a certain pet demon we had trouble with?~ */ GOTO 206.1
	IF~~THEN REPLY @2221 /* ~That's very good of you.~ */ GOTO 210
	IF~~THEN REPLY @2222 /* ~I still think you're spying.~ */ GOTO 208
END

IF ~~ THEN BEGIN 206.1
	SAY @2345 /* ~...For example, yes.~ */
	IF~~THEN REPLY @2221 /* ~That's very good of you.~ */ GOTO 210
	IF~~THEN REPLY @2222 /* ~I still think you're spying.~ */ GOTO 208
END


//---------------------------------------------------------
IF ~~ THEN BEGIN 208
	SAY @2227 /* ~Come now - what do I gain by spying on you?~ */
	IF~~THEN REPLY @2228 /* ~Not much, I suppose.~ */ GOTO 210
	IF~NumInParty(1)~THEN REPLY @2229 /* ~A way out of this place? And how do I get out?~ */ GOTO 209
	IF~NumInPartyGT(1)~THEN REPLY @2230 /* ~A way out of this place? And how do we get out?~ */ GOTO 209
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 209
	SAY @2231 /* ~If there was a way out of this place for me I would have found it a long time ago. My guests always leave on their own but I have no idea when they are about to depart or what allows them to do so. You are in no danger from me.~ */
	IF~~THEN REPLY @2232 /* ~Good.~ */ GOTO 210
	IF~NumInParty(1)~THEN REPLY @2233 /* ~I'd better not be.~ */ GOTO 210
	IF~NumInPartyGT(1)~THEN REPLY @2234 /* ~We'd better not be.~ */ GOTO 210
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 210
	SAY @2235 /* ~That aside; you know, this place intrigues me. There has to be something in the library about it - I must go and look. Come and see me later.~ */
	IF~~THEN
		DO ~SetGlobal("bsTalkToAlguineFM2","GLOBAL",1)
	      ForceSpell(Myself,WIZARD_DIMENSION_DOOR)
	 	    ActionOverride("bsalgune",DestroySelf())~
	EXIT
END


//---------------------------------------------------------
// Future Memory 4
//---------------------------------------------------------
IF ~Global("bsTalkToAlguineFM4","GLOBAL",0)
		AreaCheck("bs0133")~ THEN BEGIN 250
	SAY@2236
	IF~~THEN REPLY @2237 GOTO 255
	IF~~THEN REPLY @2238 GOTO 251
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 251
	SAY @2239
	IF~~THEN REPLY @2240 GOTO 254
	IF~~THEN REPLY @2241 GOTO 252
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 252
	SAY @2242
	IF~~THEN REPLY @2243 GOTO 254
	IF~~THEN REPLY @2244 GOTO 253
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 253
	SAY @2245
	IF~~THEN REPLY @2246 GOTO 254
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 254
	SAY @2247
	IF~~THEN REPLY @2248 GOTO 255
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 255
	SAY @2249 /* ~I don't say it is but there's a book in the library by Volothamp Geddarm that says so. If my memory serves me correctly, it's called 'Volo's Guide to the Sword Coast'.~ */
	IF~~THEN REPLY @2250 GOTO 256 /* ~Volo!~ */
	IF~~THEN REPLY @2251 GOTO 2561 /* ~Not Volo Geddarm! Not that idiot!!~ */
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 256
	SAY @2252 /* ~You know the gentleman, do you?~ */
	IF~~THEN REPLY @2253 /* ~Yes. He used to visit Candlekeep to talk to Gorion. Whenever Volo appeared Gorion and he would vanish into the Candlekeep library for days. I never got to see Volo and I really wanted to talk to him about his travels.~ */ GOTO 2561
	IF~~THEN REPLY @2254 /* ~I know him alright. He used to come to Candlekeep when I was younger. I never did like him - puffed-up idiot.~ */ GOTO 2561
++ @2353 /* ~I only saw him a couple of times.~ */ + 257
++ @2354 /* ~Not really, no.~ */ + 257
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 2561
	SAY @2255 /* ~Oh. I see. */
	IF~~THEN GOTO 257 
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 257
	SAY @2337 /* ~Well, that's where I got the story of the tree, true or not. Still, the day here is too good to waste, so I think I'll take a look around.~ */
	IF~~THEN
		DO~	MoveToPointNoInterrupt([1735.362])
				EscapeArea()~
	EXIT
END

//---------------------------------------------------------
// Future Memory 5
//---------------------------------------------------------
IF ~Global("bsTalkToAlguineFM5","GLOBAL",0)
		AreaCheck("bs0134")~ THEN BEGIN 400
	SAY @2276
	IF~~THEN REPLY @2277 GOTO 404
	IF~~THEN REPLY @2278 GOTO 404
	IF~~THEN REPLY @2279 GOTO 401
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 401
	SAY @2280
	IF~~THEN REPLY @2281 GOTO 402
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 402
	SAY @2282
	IF~~THEN REPLY @2283 GOTO 403
	IF~~THEN REPLY @2284 GOTO 404
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 403
	SAY @2285
	IF~~THEN REPLY @2286 GOTO 404
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 404
	SAY @2287
	IF~~THEN REPLY @2288 GOTO 4050
	IF~~THEN REPLY @2289 GOTO 405
	IF~~THEN REPLY @2290 GOTO 405
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 4050
	SAY @2291
	IF~~THEN REPLY @2292 GOTO 406
	IF~~THEN REPLY @2293 GOTO 405
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 405
	SAY @2294
	IF~~THEN REPLY @2295 GOTO 406
	IF~~THEN REPLY @2296 GOTO 406
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 406
	SAY @2297
	IF~~THEN REPLY @2298 GOTO 407
	IF~~THEN REPLY @2299 GOTO 407
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 407
	SAY @2300
	IF~~THEN REPLY @2301 GOTO 408
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 408
	SAY @2302
	IF~~THEN REPLY @2303 GOTO 409
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 409
	SAY @2304
	IF~~THEN REPLY @2305 GOTO 410
	IF~~THEN REPLY @2306 GOTO 4051
	IF~~THEN REPLY @2307 GOTO 410
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 4051
	SAY @2308
	IF~~THEN REPLY @2303 GOTO 410
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 410
	SAY @2309
	IF~~THEN REPLY @2310 GOTO 412
	IF~~THEN REPLY @2311 GOTO 411
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 411
	SAY @2312
	IF~~THEN REPLY @2313 GOTO 412
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 412
	SAY @2314
	=@2315
	=@2316
	IF~~THEN
		DO ~SetGlobal("bsTalkToAlguineFM5","GLOBAL",1)
	      ForceSpell(Myself,WIZARD_DIMENSION_DOOR)
	 	    ActionOverride("bsalgune",DestroySelf())~
	EXIT
END


//---------------------------------------------------------
// Future Memory 6H1 - Alguine's Home
//---------------------------------------------------------
IF ~Global("bsTalkToAlguineFM6H1","GLOBAL",0)
		AreaCheck("bs0140")~ THEN BEGIN 350
	SAY@2256 /* ~Ah! So you've found your way here at last!~ */
	++ @2375 /* ~I did. After you gave me the key, I thought it would go a bit quicker.~ */ + 350.1
	IF~~THEN REPLY @2257 /* ~I just went through the front door of a house and ended up in a forest!~ */ GOTO 357
	IF~~THEN REPLY @2258 /* ~Where's here, old man?~ */ GOTO 351
END

IF ~~ THEN BEGIN 350.1
	SAY @2376 /* Nothing goes quicker here, young visitor.~ */
	IF~~THEN REPLY @2257 /* ~I just went through the front door of a house and ended up in a forest!~ */ GOTO 357
	IF~~THEN REPLY @2258 /* ~Where's here, old man?~ */ GOTO 351
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 351
	SAY @2259 /* ~'Here', you grumpy, ill-tempered <PRO_RACE> is where I live, when the portal lets me.~ */
	IF~~THEN REPLY @2262 /* ~Alright, alright; I apologise. That was uncalled for and I should not have said it.~ */ GOTO 354
	IF~~THEN REPLY @2260 /* ~Ha! Too often, I say.~ */ GOTO 352
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 352
	SAY @2261 /* ~You really are unpleasant, do you know that? I normally look forward to having visitors but with you, I look forward to your departure!~ */
	IF~~THEN REPLY @2262 /* ~Alright, alright; I apologise. That was uncalled for and I should not have said it.~ */ GOTO 354
	IF~~THEN REPLY @2263 /* ~So do I.~ */ GOTO 353_b
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 353_b
	SAY @2388 /* ~Young |PRO_MANWOMAN>, this is my absolutely last warning. You are a guest in my home; apologize or you'll find yourself outside again, being finished here or not.~ */
	IF~~THEN REPLY @2262 /* ~Alright, alright; I apologise. That was uncalled for and I should not have said it.~ */ GOTO 354
	IF~~THEN REPLY @2389 /* ~Be my guest, old grumpyhead. I don't see what I would learn in this place, anyway.~ */ GOTO 353
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 353
	SAY @2264 /* ~That does it. Enough is enough.~ */
	IF~Global("bsFreedUlf","GLOBAL",0)~THEN
		DO ~EraseJournalEntry(@921)
		EraseJournalEntry(@763)
		AddJournalEntry(@767,QUEST_DONE)
		SetGlobal("bsTalkToAlguineFM6H1","GLOBAL",2)
		SetGlobal("bsAlguineAnnoyed","GLOBAL",1)~
	EXIT
	IF~GlobalGT("bsFreedUlf","GLOBAL",0)~THEN
		DO ~EraseJournalEntry(@921)
		AddJournalEntry(@768,QUEST)
		SetGlobal("bsTalkToAlguineFM6H1","GLOBAL",2)
		SetGlobal("bsAlguineAnnoyed","GLOBAL",1)~
	EXIT
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 354
	SAY @2265 /* ~Hmm. Your apology is accepted. Be welcome.~ */
	IF~~THEN REPLY @2266 /*  ~And I might be a grumpy, ill-tempered <PRO_RACE>, but I do have a name. It's <CHARNAME>.~ */ GOTO 355
	IF~~THEN REPLY @2267 /* ~Thank you.~ */GOTO 356
	IF~~THEN REPLY @2257 /* ~I just went through the front door of a house and ended up in a forest!~ */ GOTO 357
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 355
	SAY @2268 /* ~Welcome, <CHARNAME>.~ */
	IF~~THEN REPLY @2269 GOTO 357
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 356
	SAY @2270 /* ~You are welcome, truly.~ */
	IF~~THEN REPLY @2269 GOTO 357
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 357
	SAY @2273 /* ~You found the hidden portal down on the dock, did you? Yes, that's one of the few stable ones. It always leads here. If you haven't found my library yet, it's through the door at the end of the corridor.~ */
	++ @2271 /* ~Yeah, well, you gave me the key so I can get here, so...~ */ + 358
	IF~~THEN REPLY @2272 /* ~Your library - why would I want to go there?~ */ GOTO 359
+ ~Global("bs_TalkingBooks","GLOBAL",1) Global("bs_AskedTalkingBooks","LOCALS",0)~ + @2385 /* ~Alguine, I was in the library - and the books in there are talking to me!~ */ DO ~SetGlobal("bs_AskedTalkingBooks","LOCALS",1)~ + talking_books
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 358
	SAY @2374 /* Don't stress my patience further, young one. I bid you welcome in my home.~ */
	IF~~THEN REPLY @2272 /* ~Your library - why would I want to go there?~ */ GOTO 359
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 359
	SAY @2275 /* ~Maybe you don't.~ */
IF ~~ THEN + 359_1
END

//---------------------------------------------------------

IF ~~ THEN BEGIN 359_1
	SAY @2383 /* I just thought the library might contain the answers to why you are here. You will let me know, won't you? Go on; the sooner you look, the sooner we'll know. I'll be along later - or is that sooner? Hmm.~ */
	IF~~THEN
		DO ~SetGlobal("bsTalkToAlguineFM6H1","GLOBAL",1)~
	EXIT
END
//---------------------------------------------------------

IF ~~ THEN talking_books
SAY @2386 /* ~Well, that is a good sign, considering you are the one the scroll invited! Imagine they *wouldn't* show you things. Right now, these halls are designed to show your future. The books in the library are part of it.~ */
IF ~Global("bsTalkToAlguineFM6H1","GLOBAL",0)~ THEN + 359_1
IF ~Global("bsTalkToAlguineFM6H1","GLOBAL",1)~ THEN EXIT
END

IF ~~ THEN talking_books_01
SAY @2384 /* Much involved, hmm? Young <PRO_MANWOMAN>, this whole place is currently "much involved". You are either ready to *see*, or you are not, but what it will show you, I cannot possibly know.~ */
IF ~~ THEN EXIT
END



//---------------------------------------------------------
/* still in bs0140, Alguine's home */

IF ~Global("bsTalkToAlguineFM6H1","GLOBAL",1)~ THEN BEGIN 507
  SAY @2329 /* ~Go on; the sooner you look, the sooner we'll know. I'll be along later - or is that sooner? Hmm.~ */
+ ~Global("bs_TalkingBooks","GLOBAL",1) Global("bs_AskedTalkingBooks","LOCALS",0)~ + @2385 /* ~Alguine, I was in the library - and the books in there are talking to me!~ */ DO ~SetGlobal("bs_AskedTalkingBooks","LOCALS",1)~ + talking_books
+ ~Global("bs_TalkingBooks","GLOBAL",2) !Global("bs_AskedTalkingBooks","LOCALS",2)~ + @2387 /* ~Do you really not know what the book on the lectern wants to show me? Letting myself being sucked in feels a little much ... involved.~ */ DO ~SetGlobal("bs_AskedTalkingBooks","LOCALS",2)~ + talking_books_01
++ @2378 /* ~Fine, I'll have a look at that library.~ */ + early_exit_06
++ @2352 /* ~I would like to leave this place, Alguine. I know I won't be able to return.~ */ + early_exit_08
END




//---------------------------------------------------------
// Early Exit States
//---------------------------------------------------------

IF ~~ THEN early_exit_01
SAY @2355 /* ~[Alguine]Klaus, hmm? I might know who he left behind. Not me, indeed.~ */
++ @2356 /* ~And where might he be? Freeing him is why I'm here.~ */ + early_exit_02
++ @2350 /* ~I lost patience with all of this, Alguine.~ */ + early_exit_07
++ @2351 /* ~I'll continue examining the portals.~ */ + early_exit_06
END

IF ~~ THEN early_exit_02
SAY @2357 /* ~[Alguine]Well, I can point you to where you need to go - but you should prepare for a nasty surprise if you enter the portal.~ */
++ @2358 /* ~Yes, please do.~ */ + early_exit_10
++ @2359 /* ~He's behind one of the portals? Alright, I guess I'll find him anyway and will just continue searching.~ */ + early_exit_06
END

IF ~~ THEN early_exit_03
SAY @2360 /* ~[Alguine]Oh, you are done, aren't you? How convenient. What if I told you you're not done, but could learn more about yourself and your future?~ */
++ @2361 /* ~I really do not feel like going through all portals, Alguine. I'm sorry.~ */ + early_exit_04
++ @2352 /* ~I would like to leave this place, Alguine. I know I won't be able to return.~ */ + early_exit_08
++ @2351 /* ~I'll continue examining the portals.~ */ + early_exit_06
END

IF ~~ THEN early_exit_04
SAY @2362 /* ~[Alguine]Oh well, entertainment is over then, I guess. Where do you want to go?~ */
+ ~Global("bsFreedUlf","GLOBAL",0)
Global("bsSkippedToUlf","MYAREA",0)~ + @2363 /* ~Point me to where Klaus' friend is trapped, please.~ */ + early_exit_02
+ ~Global("bdGavekey","MYAREA",0)~ + @2364 /* ~Just skipping the portal labyrinth, if possible. I'm sure there is more you would like to show me?~ */ DO ~SetGlobal("bdGavekey","MYAREA",1)~ + early_exit_05
++ @2352 /* ~I would like to leave this place, Alguine. I know I won't be able to return.~ */ + early_exit_08
++ @2351 /* ~I'll continue examining the portals.~ */ + early_exit_06
END

IF ~~ THEN early_exit_05
SAY @2365 /* ~[Alguine]Oh, so you're of the impatient sort, hmm? There is indeed more I want to show you. Normally I'd insist you go through all portals before opening my home to you, but oh well. There is one locked door behind you. Go through there to find me in the library.~ */
IF ~~ THEN + early_exit_11
END

IF ~~ THEN early_exit_06
SAY @2366 /* ~[Alguine]You do that.~ */
IF ~~ THEN EXIT
END

IF ~~ THEN early_exit_07
SAY @2367 /* ~[Alguine]All of it? Also freeing trapped Ulf?~ */
++ @2368 /* ~Is that Klaus' friend? Alright, tell me where I can find this Ulf.~ */ + early_exit_02
++ @2369 /* ~Indeed. I want to skip further, if you don't mind.~ */ + early_exit_04
++ @2351 /* ~I'll continue examining the portals.~ */ + early_exit_06
END

IF ~~ THEN early_exit_08
SAY @2370 /* ~[Alguine]What a pity. But I will not stand in your way. Say it and I'll teleport you out - be aware that you can't return. But someone else you give the scroll to will be.~ */
++ @2371 /* ~Get me out of here, Alguine.~ */ + early_exit_09
+ ~GlobalLT("bsVisitedHalls","GLOBAL",4)~ + @2351 /* ~I'll continue examining the portals.~ */ + early_exit_06
+ ~Global("bsVisitedHalls","GLOBAL",4)~ + @2372 /* ~On second thought, I'll continue. What was it with that door?~ */ + 51
+ ~GlobalGT("bsVisitedHalls","GLOBAL",4)~ + @2377 /* ~On second thought, I'll continue and have a look at that library.~ */ + early_exit_06
END

IF ~~ THEN early_exit_09
SAY @2373 /* ~[Alguine]Very well.~ */
	IF~Global("bsFreedUlf","GLOBAL",0)~THEN
		DO ~EraseJournalEntry(@921)
		EraseJournalEntry(@763)
		AddJournalEntry(@770,QUEST_DONE)
		SetGlobal("bsTalkToAlguineFM6H1","GLOBAL",2)
		SetGlobal("bsAlguineAnnoyed","GLOBAL",1)~
	EXIT
	IF~GlobalGT("bsFreedUlf","GLOBAL",0)~THEN
		DO ~EraseJournalEntry(@921)
		AddJournalEntry(@771,QUEST)
		SetGlobal("bsTalkToAlguineFM6H1","GLOBAL",2)
		SetGlobal("bsAlguineAnnoyed","GLOBAL",1)~
	EXIT
END

IF ~~ THEN early_exit_10
SAY @2373 /* ~[Alguine]Very well.~ */
IF ~~ THEN DO ~SetGlobal("bsSkippedToUlf","MYAREA",1) ClearAllActions() StartCutSceneMode() StartCutScene("bscut009")~ EXIT
END

IF ~~ THEN early_exit_11
SAY @2338 /* ~Normally I'd leave the door locked to keep out unwanted visitors but in this case... here you are.~ */
	IF~~THEN
		DO~GiveItemCreate("bsfmkey",Protagonist,1,0,0)
		SetGlobal("bsVisitedHalls","GLOBAL",5)~
	EXIT
END

//---------------------------------------------------------
// After the dream sequence
//---------------------------------------------------------
IF WEIGHT #-1
~Global("bsDreamDone","GLOBAL",1)~ THEN BEGIN 500
SAY @2317 /* ~Ah! You're awake then!~ */
++ @2318 /* ~Wha - what happened?~ */ GOTO 501
END

CHAIN
IF ~~ THEN BSALGUNE 501
@2379
== BSALGUNE IF~NumInParty(1)~THEN @2319 /* ~I was on my way to the library when I heard a cry and found you slumped on the floor. With the aid of a little magic I brought you back here and well - here you are.~ */
== BSALGUNE IF~NumInParty(2)
		Gender(Player2,FEMALE)~THEN @2321 /* ~Your companion here came flying into my house demanding my immediate help. I must say, she was extremely insistant. We found you slumped on the floor in the library and brought you back here.~ */
== BSALGUNE IF~NumInParty(2)
		Gender(Player2,MALE)~THEN @2322 /* ~Your companion here came flying into my house demanding my immediate help. I must say, he was extremely insistant. We found you slumped on the floor in the library and brought you back here.~ */
== BSALGUNE IF~NumInPartyGT(2)~THEN @2323 /* ~I have no idea. Your companions here say you just slumped to the floor in the library, so they brought you back here.~ */
END
++ @2320 + 505

//---------------------------------------------------------
//IF ~~ THEN BEGIN 501

//---------------------------------------------------------
//IF ~~ THEN BEGIN 502

//---------------------------------------------------------
//IF ~~ THEN BEGIN 503

//---------------------------------------------------------
//IF ~~ THEN BEGIN 504

//---------------------------------------------------------
CHAIN
IF ~~ THEN BSALGUNE 505
@2324 /* ~What things?~ */
== %IMOEN_JOINED% IF~InParty("%IMOEN_DV%") See("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @2328 /* ~Wait - *that* dream where Gorion appears in your bedroom at Candlekeep, telling about all those things you need to fetch? And you actually went places? He always told *me* that I'm not ready yet. Seems even in my dreams Gorion favored you, huh? What was it about then?~ */
END
+ ~Global("bs_KnowBhaal","GLOBAL",1)~ + @2382 + 506
	IF~~THEN REPLY @2325 /* ~Things... no, you don't want to know about it. You just don't.~ */ GOTO 506
++ @2380 + 506
++ @2381 + 506

APPEND BSALGUNE
//---------------------------------------------------------
IF ~~ THEN BEGIN 506
	SAY @2326 /* ~Very well; I won't ask further. Are you quite well now, <CHARNAME>?~ */
	IF~~THEN REPLY @2327 + 508
END

IF ~~ THEN BEGIN 508
	SAY @2330
	IF~~THEN + 509
END

IF ~~ THEN BEGIN 509
	SAY @2331
	IF~~THEN DO ~SetGlobal("bsDreamDone","GLOBAL",2)~ EXIT


	IF~Global("bsFreedUlf","GLOBAL",0)~THEN
		DO ~EraseJournalEntry(@921)
		EraseJournalEntry(@763)
		AddJournalEntry(@772,QUEST_DONE)
		SetGlobal("bsTalkToAlguineFM6H1","GLOBAL",2)
		SetGlobal("bsDreamDone","GLOBAL",2)~
	EXIT
	IF~GlobalGT("bsFreedUlf","GLOBAL",0)~THEN
		DO ~EraseJournalEntry(@921)
		AddJournalEntry(@765,QUEST)
		SetGlobal("bsTalkToAlguineFM6H1","GLOBAL",2)
		SetGlobal("bsDreamDone","GLOBAL",2)~
	EXIT
END

END //APPEND
