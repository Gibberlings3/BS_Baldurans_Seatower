// Variable suffixes:
// HFM = dialog in bs0128
// FM1 = dialog in bs0129
// FM2 = dialog in bs0130
// FM3L = dialog in bs0131
// FM4 = dialog in bs0133
// FM6H1 = dialog in bs0140
// FM5 = dialog in bs0134

BEGIN bsalgune

//---------------------------------------------------------
// Second visit to the blind room
//---------------------------------------------------------
IF ~Global("bsHFMTrap","GLOBAL",2)~THEN BEGIN sb
	SAY@2100
	IF~~THEN REPLY @2101 GOTO sb2
	IF~~THEN REPLY @2102 GOTO sb3
END

//---------------------------------------------------------
IF ~~ THEN BEGIN sb2
	SAY @2103
	IF~NumInParty(1)~THEN REPLY @2104 GOTO sb3
	IF~NumInPartyGT(1)~THEN REPLY @2105 GOTO sb3
END

//---------------------------------------------------------
IF ~~ THEN BEGIN sb3
	SAY @2106
	IF~~THEN REPLY @2107 GOTO sb4
END

//---------------------------------------------------------
IF ~~ THEN BEGIN sb4
	SAY @2108
	IF~~THEN
		DO ~SetGlobal("bsAlguineBlockedPortal","GLOBAL",1)
				IncrementGlobal("bsHFMTrap","GLOBAL",1)
				CloseDoor("DOOR0002")
				ForceSpellRES("BS00002",Protagonist)
				Wait(1)
				ActionOverride(Player1,LeaveAreaLUA("bs0128","",[405.2107],10))
				ActionOverride(Player2,LeaveAreaLUA("bs0128","",[405.2107],10))
				ActionOverride(Player3,LeaveAreaLUA("bs0128","",[405.2107],10))
				ActionOverride(Player4,LeaveAreaLUA("bs0128","",[405.2107],10))
				ActionOverride(Player5,LeaveAreaLUA("bs0128","",[405.2107],10))
				ActionOverride(Player6,LeaveAreaLUA("bs0128","",[405.2107],10))
				JumpToPoint([1783.1156])~
  	EXIT
END

//---------------------------------------------------------
// Dialog holder 1
//---------------------------------------------------------
IF ~!Dead("bstanar")
		AreaCheck("bs0128")
		Global("bsTalkToAlguineHFM","GLOBAL",3)
		!Global("bsVisitedHalls","GLOBAL",4)~ THEN BEGIN PLC1
	SAY @2109
	IF~~THEN EXIT
END

//---------------------------------------------------------
// Dialog holder 2
//---------------------------------------------------------
IF ~Global("bsTalkToAlguineHFM","GLOBAL",4)
		AreaCheck("bs0128")
		!Global("bsVisitedHalls","GLOBAL",4)~ THEN BEGIN PLC2
	SAY @2110
	IF~~THEN EXIT
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
IF ~~ THEN BEGIN 21
	SAY @2155
	IF~~THEN
		DO ~SetGlobal("bsTalkToAlguineHFM","GLOBAL",3)
	      ForceSpellPoint([566.2005],WIZARD_DIMENSION_DOOR)
	 	    ActionOverride("bsalgune",DestroySelf())
				CreateCreature("bsalgune",[1783.1156],2)~
	EXIT
END

//---------------------------------------------------------
// Tanar'ri is dead
//---------------------------------------------------------
IF ~Dead("bstanar")
		AreaCheck("bs0128")
		Global("bsTalkToAlguineHFM","GLOBAL",3)~ THEN BEGIN 30
	SAY @2156
	IF~~THEN REPLY @2157 GOTO 31
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 31
	SAY @2158
	IF ~Global("bsAboutDemon","LOCALS",0)~ THEN REPLY @2159 DO ~SetGlobal("bsAboutDemon","LOCALS",1)~ GOTO 32
	IF ~Global("bsAboutUlf","LOCALS",0)~ THEN REPLY @2335 DO ~SetGlobal("bsAboutDeman","LOCALS",1)~ + 32.1
	IF~~THEN REPLY ~Now what?~ + 32.2
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 32
	SAY @2160
	IF ~Global("bsAboutUlf","LOCALS",0)~ THEN REPLY @2335 DO ~SetGlobal("bsAboutDeman","LOCALS",1)~ + 32.1
	IF~~THEN REPLY ~Now what?~ + 32.2
END

IF ~~ THEN BEGIN 32.1
	SAY @2334
	IF ~Global("bsAboutDemon","LOCALS",0)~ THEN REPLY @2159 DO ~SetGlobal("bsAboutDemon","LOCALS",1)~ GOTO 32
	IF~~THEN REPLY ~Now what?~ + 32.2
END

IF ~~ THEN BEGIN 32.2
	SAY @2332
	IF~~THEN REPLY @2161 GOTO 33
	IF~~THEN REPLY @2333 GOTO 33
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 33
	SAY @2162
	IF~~THEN
		DO ~SetGlobal("bsTalkToAlguineHFM","GLOBAL",4)
				ForceSpellRES("BS00002",Protagonist)
				Wait(1)
				ActionOverride(Player1,LeaveAreaLUA("bs0128","",[405.2107],10))
				ActionOverride(Player2,LeaveAreaLUA("bs0128","",[405.2107],10))
				ActionOverride(Player3,LeaveAreaLUA("bs0128","",[405.2107],10))
				ActionOverride(Player4,LeaveAreaLUA("bs0128","",[405.2107],10))
				ActionOverride(Player5,LeaveAreaLUA("bs0128","",[405.2107],10))
				ActionOverride(Player6,LeaveAreaLUA("bs0128","",[405.2107],10))
				JumpToPoint([1783.1156])~
  	EXIT
END

//---------------------------------------------------------
// All available future memories explored
//---------------------------------------------------------
IF ~Global("bsVisitedHalls","GLOBAL",4)
		AreaCheck("bs0128")~ THEN BEGIN 50
	SAY @2110
	IF~~THEN REPLY@2163 GOTO 51
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 51
	SAY @2164
	IF~~THEN
		DO~GiveItemCreate("bsfmkey",Protagonist,1,0,0)
		SetGlobal("bsVisitedHalls","GLOBAL",5)~
	EXIT
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
	SAY@2200
	IF~~THEN REPLY @2201 GOTO 201
	IF~~THEN REPLY @2202 GOTO 202
	IF~NumInParty(1)~THEN REPLY @2203 GOTO 206
	IF~NumInPartyGT(1)~THEN REPLY @2204 GOTO 206
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 201
	SAY @2205
	IF~~THEN REPLY @2206 GOTO 202
	IF~NumInParty(1)~THEN REPLY @2207 GOTO 206
	IF~NumInPartyGT(1)~THEN REPLY @2208 GOTO 206
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 202
	SAY @2209
	IF~~THEN REPLY @2210 GOTO 203
	IF~NumInParty(1)~THEN REPLY @2207 GOTO 206
	IF~NumInPartyGT(1)~THEN REPLY @2208 GOTO 206
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 203
	SAY @2211
	IF~~THEN REPLY @2212 GOTO 204
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 204
	SAY @2213
	IF~~THEN REPLY @2214 GOTO 205
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 205
	SAY @2215
	IF~NumInParty(1)~THEN REPLY @2216 GOTO 206
	IF~NumInPartyGT(1)~THEN REPLY @2217 GOTO 206
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 206
	SAY @2218
	IF~Dead("bstanar")~THEN REPLY @2219 GOTO 207
	IF~Dead("bstanar")~THEN REPLY @2220 GOTO 207
	IF~!Dead("bstanar")~THEN REPLY @2221 GOTO 210
	IF~!Dead("bstanar")~THEN REPLY @2222 GOTO 208
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 207
	SAY @2223
	IF~~THEN REPLY @2224 GOTO 210
	IF~NumInParty(1)~THEN REPLY @2225 GOTO 208
	IF~NumInPartyGT(1)~THEN REPLY @2226 GOTO 208
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 208
	SAY @2227
	IF~~THEN REPLY @2228 GOTO 210
	IF~NumInParty(1)~THEN REPLY @2229 GOTO 209
	IF~NumInPartyGT(1)~THEN REPLY @2230 GOTO 209
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 209
	SAY @2231
	IF~~THEN REPLY @2232 GOTO 210
	IF~NumInParty(1)~THEN REPLY @2233 GOTO 210
	IF~NumInPartyGT(1)~THEN REPLY @2234 GOTO 210
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 210
	SAY @2235
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
	SAY @2249
	IF~~THEN REPLY @2250 GOTO 256
	IF~~THEN REPLY @2251 GOTO 2561
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 256
	SAY @2252
	IF~~THEN REPLY @2253GOTO 257
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 2561
	SAY @2252
	IF~~THEN REPLY @2254 GOTO 257
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 257
	SAY @2255
	IF~~THEN
		DO~	MoveToPointNoInterrupt([1735.362])
				EscapeArea()~
	EXIT
END

//---------------------------------------------------------
// Future Memory 6H1 - Alguine's Home
//---------------------------------------------------------
IF ~Global("bsTalkToAlguineFM6H1","GLOBAL",0)
		AreaCheck("bs0140")~ THEN BEGIN 350
	SAY@2256
	IF~~THEN REPLY @2257 GOTO 358
	IF~~THEN REPLY @2258 GOTO 351
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 351
	SAY @2259
	IF~~THEN REPLY @2257 GOTO 358
	IF~~THEN REPLY @2260 GOTO 352
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 352
	SAY @2261
	IF~~THEN REPLY @2262 GOTO 354
	IF~~THEN REPLY @2263 GOTO 353
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 353
	SAY @2264
	IF~~THEN
		DO ~SetGlobal("bsTalkToAlguineFM6H1","GLOBAL",1)
			SetGlobal("bsAlguineAnnoyed","GLOBAL",1)
//	      ForceSpell(Myself,WIZARD_DIMENSION_DOOR)
//	 	    ActionOverride("bsalgune",DestroySelf())
~
	EXIT
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 354
	SAY @2265
	IF~~THEN REPLY @2266 GOTO 355
	IF~~THEN REPLY @2267 GOTO 356
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 355
	SAY @2268
	IF~~THEN REPLY @2269 GOTO 357
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 356
	SAY @2270
	IF~~THEN REPLY @2269 GOTO 357
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 357
	SAY @2271
	IF~~THEN REPLY @2272 GOTO 359
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 358
	SAY @2273
	IF~~THEN REPLY @2274 GOTO 359
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 359
	SAY @2275
	IF~~THEN
		DO ~SetGlobal("bsTalkToAlguineFM6H1","GLOBAL",1)~
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
// After the dream sequence
//---------------------------------------------------------
IF ~Global("bsDreamDone","GLOBAL",1)~ THEN BEGIN 500
	SAY @2317
	IF~NumInParty(1)~THEN REPLY @2318 GOTO 501
	IF~NumInParty(2)
		Gender(Player2,FEMALE)~THEN REPLY @2318 GOTO 502
	IF~NumInParty(2)
		Gender(Player2,MALE)~THEN REPLY @2318 GOTO 503
	IF~NumInPartyGT(2)~THEN REPLY @2318 GOTO 504
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 501
	SAY @2319
	IF~OR(3)
!InParty("%IMOEN_DV%") !InMyArea("%IMOEN_DV%") StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~THEN REPLY @2320 GOTO 505
	IF~InParty("%IMOEN_DV%") InMyArea("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~THEN REPLY @2320 EXTERN %IMOEN_JOINED% BSDREAM
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 502
	SAY @2321
	IF~OR(3)
!InParty("%IMOEN_DV%") !InMyArea("%IMOEN_DV%") StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~THEN REPLY @2320 GOTO 505
	IF~InParty("%IMOEN_DV%") InMyArea("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~THEN REPLY @2320 EXTERN %IMOEN_JOINED% BSDREAM
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 503
	SAY @2322
	IF~OR(3)
!InParty("%IMOEN_DV%") !InMyArea("%IMOEN_DV%") StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~THEN REPLY @2320 GOTO 505
	IF~InParty("%IMOEN_DV%") InMyArea("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~THEN REPLY @2320 EXTERN %IMOEN_JOINED% BSDREAM
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 504
	SAY @2323
	IF~OR(3)
!InParty("%IMOEN_DV%") !InMyArea("%IMOEN_DV%") StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~THEN REPLY @2320 GOTO 505
	IF~InParty("%IMOEN_DV%") InMyArea("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~THEN REPLY @2320 EXTERN %IMOEN_JOINED% BSDREAM
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 505
	SAY @2324
	IF~~THEN REPLY @2325 GOTO 506
END

//---------------------------------------------------------
IF ~~ THEN BEGIN 506
	SAY @2326
	IF~~THEN REPLY @2327 + 508
END


//---------------------------------------------------------
//IF ~Global("","GLOBAL",0)~ THEN BEGIN
//	SAY ~~
//	IF~~THEN REPLY ~~ GOTO
//	IF~~THEN REPLY ~~ GOTO
//END

IF ~Global("bsTalkToAlguineFM6H1","GLOBAL",1)~ THEN BEGIN 507
  SAY @2329
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 508
	SAY @2330
	IF~~THEN + 509
END

IF ~~ THEN BEGIN 509
	SAY @2331
	IF~~THEN DO ~SetGlobal("bsDreamDone","GLOBAL",2)~ EXIT
END



CHAIN %IMOEN_JOINED% BSDREAM
	@2328
EXTERN BSALGUNE 506
