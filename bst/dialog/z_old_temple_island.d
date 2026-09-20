/* Old Temple Island */

/* Galactygon http://www.shsforums.net/topic/47561-random-quest-ideas-kua-toa-plot-ideas/?p=518770
Could be summarized after it's done by the Seatower Commander:
"When planning the sewer network generations ago, the inhabitants of Baldur's Gate made a mistake of having it drain to an underground stream, which they thought is impassible to a ground-based invading force (but not to aquatic creatures - it all fits!). This underground stream runs beneath the city walls, so it's a major breach in the city's defenses the Baldurians (except a certain temple in the docks) were unaware of! The temple could be involved in some sort of power struggle with the authorities, and seeks some sort of diversion, which they offer the authorities to correct. In reality, they are manipulating both sides in order to further their influence in Baldur's Gate." 
"The temple could be involved in some sort of power struggle with the authorities, and seeks some sort of diversion, which they offer the authorities to correct. In reality, they are manipulating both sides in order to further their influence in Baldur's Gate."
"Note that the temple of Umberlee is not seeking an all-out invasion of Kuo-toa in Baldur's Gate, as the Kuo-Toa will turn on them for human sacrifice and pillage the city. A trickle of monsters to keep the authorities busy is perfect."
"The plot culminates, where they [The Umberlee Temple] decide to get rid of you by sending you on a fake quest to find the exact place of where they invade, and to seal the passageway. They intend to set up an ambush of Kuo-Toa in the sewers, come after the battle is over (with you dead), claim to have fought on your side, and then seal the sewer branch so they can claim all the credit."


Miloch: (summarized here http://www.shsforums.net/topic/47561-random-quest-ideas-kua-toa-plot-ideas/?p=508934 )
http://www.shsforums.net/topic/24573-free-space-inside-the-baldurs-gate/?p=283274
A colony of kuo-toa has taken root here and is attempting to tunnel into the sewers 

http://www.shsforums.net/topic/24573-free-space-inside-the-baldurs-gate/?p=306216
sometimes kuo-toa venture to the upper world to kidnap humans for slaves and sacrifices. They once inhabited the shores and islands of the surface but were driven underground by humans.


Yovaneth: 
http://www.shsforums.net/topic/60569-old-temple-island/?p=597551
"'Temple Island' gets moved to the Korinn Archipelago north of the Moonshaes."

http://www.shsforums.net/topic/60569-old-temple-island/?p=597641
"Looks like the Korinn Archipelago was a good choice, although by accident. Elminster's Notes on p.53 square nicely with the bunch of shipwrecked pirates that I dropped on the island. I suggest we change the name to the Old Temple Island. This gives us a choice of having other inhabitants or not, as the case may be."

*/


/* Pristess of Umberlee in the Sea Cave */
BEGIN bsiprum1

IF ~Global("bs_TempleIslandQuest","GLOBAL",1)~ THEN pr_umberlee
SAY @0 /* Sahuagin attacked this city. They took a sacred artefact from our Queen's Temple! You defeated the rearguard of the defiling creatures. You are chosen to pursue them and regain the stolen relic! */
++ @1 /* Excuse me? */ + pr_umberlee_02
++ @2 /* I'm listening. */ + pr_umberlee_02
++ @3 /* I don't think you have the authority to "choose" me for anything. */ + pr_umberlee_01
++ @4 /* Nice that you decided to join *now*! */ + pr_umberlee_01
END

IF ~~ THEN pr_umberlee_01
SAY @5 /* Silence! You will listen. */
IF ~~ THEN + pr_umberlee_02
END

IF ~~ THEN pr_umberlee_02
SAY @6 /* The Sahuagin came through a portal in the underground pond. This was not a Wild Hunt, but a targeted attack. They were aiming for the temple of our queen, temple of this city - it was an attack on Baldur's Gate! */
++ @7 /* I'm still not sure what I have to do with this. */ + pr_umberlee_04
++ @8 /* Go on. */ + pr_umberlee_05
++ @9 /* A Sahuagin attack on the city would be bad. Why tell me all this, though? You should talk to the authorities. */ + pr_umberlee_03
+ ~OR(2)
    Dead("jalantha")
    Dead("tenya2")
Global("bs_MentionedConflict","LOCALS",0)~ + @10 /* Lady, maybe you should evaluate your recruiting standards. I had a hostile confrontation in your temple, now you want me as a mercenary? */ DO ~SetGlobal("bs_MentionedConflict","LOCALS",1)~ + pr_umberlee_04
+ ~Global("bs_MentionedConflict","LOCALS",0)~ + @11 /* Why do you ask me of all people? */ DO ~SetGlobal("bs_MentionedConflict","LOCALS",1)~ + pr_umberlee_04
++ @12 /* Do I look like I care? */ + pr_umberlee_04
END

IF ~~ THEN pr_umberlee_03
SAY @13 /* Pfeh, "authorities". The temple of our Queen is all authority I answer to! */
IF ~~ THEN + pr_umberlee_04
END

IF ~~ THEN pr_umberlee_04
SAY @14 /* Here, you were at the right time at the right place. You defeated the trespassing creatures. You are as well suited as any. */
IF ~~ THEN + pr_umberlee_05
END

IF ~~ THEN pr_umberlee_05
SAY @15 /* The Sahuagin defiled our holy relic, Iakhovas' Tooth. This is an extremely sacred artifact that has been with us longer than the city has borne its current name. It found its way to us through the city's founder, Balduran, who gave it to us as a token to gain the Queen's favor for his sea voyages. With the tooth gone, what do you think Umberlee's favor for the city will look like? */
++ @16 /* Not good, I wager. Fine, you have my interest. What now? */ + pr_umberlee_08
++ @17 /* You are seriously putting the whole city's fate's blame onto me, aren't you? */ + pr_umberlee_08
++ @18 /* A tooth? Surely this is a jest? */ + pr_umberlee_06
++ @19 /* Maybe it will look like the fate that will meet you now, for pestering me with details. I really have no interest in pursuing your 'holy tooth'. How about we have a look whether your teeth all sit tight, huh? */ + attack
END

IF ~~ THEN pr_umberlee_06
SAY @20 /* Do not ridicule what is sacred! The Tooth stands for Umberlee's Power and Wrath for those who disappoint and hurt our Queen. It is a sign of what will happen to who defiles our Lady's name! */
++ @21 /* Fine, you have my interest. What now? */ + pr_umberlee_08
++ @17 /* You are seriously putting the whole city's fate's blame onto me, aren't you? */ + pr_umberlee_08
++ @22 /* And that got stolen. Hahaha, now it is a sign for your 'power' even more - you are, literally, *toothless* and want to rely on the first armed person walking by to retreave it. */ + pr_umberlee_07
++ @19 /* Maybe it will look like the fate that will meet you now, for pestering me with details. I really have no interest in pursuing your 'holy tooth'. How about we have a look whether your teeth all sit tight, huh? */ + attack
END

IF ~~ THEN pr_umberlee_07
SAY @23 /* Do not question your usefulness for Umberlee's intent! But I *will* shut your mouth if you continue to be so disrespectful. */
++ @21 /* Fine, you have my interest. What now? */ + pr_umberlee_08
++ @17 /* You are seriously putting the whole city's fate's blame onto me, aren't you? */ + pr_umberlee_08
++ @24 /* Lady, you want me help, so watch your tone! */ + pr_umberlee_08
++ @19 /* Maybe it will look like the fate that will meet you now, for pestering me with details. I really have no interest in pursuing your 'holy tooth'. How about we have a look whether your teeth all sit tight, huh? */ + attack
END

IF ~~ THEN pr_umberlee_08
SAY @25 /* You will follow the portal and retrieve the Sacred Tooth! */
++ @26 /* Fine, I'll do it. */ + pr_umberlee_09
++ @27 /* I might, but not right now! */ + pr_umberlee_09
++ @28 /* What will be my reward? */ + pr_umberlee_10
++ @29 /* No, I won't. Try to stop me from not doing it! */ + attack
END

IF ~~ THEN pr_umberlee_09
SAY @30 /* I will close the original portal and open one that leads nearby to where the creatures took our sacred relic. */
IF ~~ THEN DO ~SetGlobal("bs_TempleIslandQuest","GLOBAL",2) ClearAllActions() StartCutSceneMode() StartCutScene("bscut002")~ EXIT
END

IF ~~ THEN pr_umberlee_10
SAY @31 /* Your reward will be all treasures you'll find amongst the Sahuagin! Keep anything you want, but bring the tooth to us! */
++ @32 /* With other words, you don't have a reward you'll give me. (sigh) Fine, I'll do it. */ + pr_umberlee_09
++ @27 /* I might, but not right now! */ + pr_umberlee_09
++ @29 /* No, I won't. Try to stop me from not doing it! */ + attack
END

IF ~Global("bs_TempleIslandQuest","GLOBAL",2)~ THEN pr_umberlee_11
SAY @33 /* It is done. You are free to enter. Retrieve the tooth, and the portal will lead you back here. Don't delay your departure too long - our Queen is impatient, and it can only make your task more difficult. And - do not seak support for this task in the temple, nor speak to anyone about this, or the wrath of my goddess will smash you! */
IF ~~ THEN DO ~SetGlobal("bs_TempleIslandQuest","GLOBAL",3)
ActionOverride("bsiprum1",MoveToPointNoInterrupt([1675.301]))
ActionOverride("bsiprum1",Face(0))~ UNSOLVED_JOURNAL @958  EXIT
END

IF ~Global("bs_TempleIslandQuest","GLOBAL",3)~ THEN pr_umberlee_pending
SAY @34 /* What are you waiting for? Follow the portal and do what our Queen expects of you! */
+ ~Global("bs_07","LOCALS",0)~ + @35 /* Tell me where the portal will bring me, first! */ DO ~SetGlobal("bs_07","LOCALS",1)~ + pr_umberlee_pending_07
+ ~Global("bs_02","LOCALS",0)~ + @36 /* Why aren't you going yourself? Surely the temple has the necessary resources to fight some Sahuagin. */ DO ~SetGlobal("bs_02","LOCALS",1)~ + pr_umberlee_pending_02
+ ~Global("bs_01","LOCALS",0)~ + @37 /* Your queen, not mine. */ DO ~SetGlobal("bs_01","LOCALS",1)~ + pr_umberlee_pending_01
+ ~OR(2)
    Dead("jalantha")
    Dead("tenya2")
GlobalLT("bs_MentionedConflict","LOCALS",2)~ + @38 /* You *are* aware that I killed priestesses in your temple, yes? But you are recruiting me anyhow for such a sensible mission? */ DO ~SetGlobal("bs_MentionedConflict","LOCALS",2)~ + pr_umberlee_pending_08
++ @39 /* Er, portal - where exactly? */ + portal_where
++ @40 /* I changed my mind. I couldn't care less about your tooth. I will not get it back. */ + attack_with_active_quest
++ @41 /* Farewell. */ EXIT
END

IF ~~ THEN portal_where
SAY @42 /* What did you not understand when I said "portal in the underground pond"? It's here, right before your eyes. You'll have to dive to get to it. */
IF ~~ THEN EXIT
END

IF ~~ THEN pr_umberlee_pending_01
SAY @43 /* You will be at her mercy, so you better show respect! */
IF ~~ THEN EXIT
END

IF ~~ THEN pr_umberlee_pending_02
SAY @44 /* I do not have to reveal my reasons to you! */
++ @45 /* You want me to go through an unknown portal and fight see creatures for you. Why can't you go yourself? Is there some kind of conflict of interest with regard to Umberlee's children? */ + pr_umberlee_pending_03
++ @46 /* Are you afraid to go yourself? */ + pr_umberlee_pending_05
++ @40 /* I changed my mind. I couldn't care less about your tooth. I will not get it back. */ + attack_with_active_quest
++ @47 /* Whatever. Farewell. */ EXIT
END

IF ~~ THEN pr_umberlee_pending_03
SAY @48 /* The Sahuagin started the confrontation by taking our Sacret Tooth! */
++ @49 /* So there *is* some kind of restriction for you to go after them. - Why would it be safe for me, then? I don't want to attract Umberlee's wrath any less than you! */ + pr_umberlee_pending_04
++ @46 /* Are you afraid to go yourself? */ + pr_umberlee_pending_05
++ @47 /* Whatever. Farewell. */ EXIT
END

IF ~~ THEN pr_umberlee_pending_04
SAY @50 /* Do you think my Queen is so petty not to see who is sending you? */
IF ~~ THEN + pr_umberlee_pending_06
END

IF ~~ THEN pr_umberlee_pending_05
SAY @51 /* I am not afraid! You are mercenaries, hired to do the Queen's bidding. Do not annoy me any more! */
IF ~~ THEN + pr_umberlee_pending_06
END

IF ~~ THEN pr_umberlee_pending_06
SAY @52 /* Bring back the Tooth, and Umberlee will not be displeased with your services. */
IF ~~ THEN EXIT
END

CHAIN
IF ~~ THEN bsiprum1 pr_umberlee_pending_07
@53 /* What does it help you to know which secluded island it is? Fine, if you *must* know - it's a small island in the Moonshae Seas. */
//[## NPC remarks, e.g. Jaheira here]
END
+ ~Global("bs_02","LOCALS",0)~ + @36 /* Why aren't you going yourself? Surely the temple has the necessary resources to fight some Sahuagin. */ DO ~SetGlobal("bs_02","LOCALS",1)~ + pr_umberlee_pending_02
+ ~Dead("jalantha") GlobalLT("bs_MentionedConflict","LOCALS",2)~ + @54 /* You *are* aware that I killed the High Priestess in your temple, yes? But you are recruiting me anyhow for such a sensible mission? */ DO ~SetGlobal("bs_MentionedConflict","LOCALS",2)~ + pr_umberlee_pending_08
++ @40 /* I changed my mind. I couldn't care less about your tooth. I will not get it back. */ + attack_with_active_quest
++ @41 /* Farewell. */ EXIT

APPEND bsiprum1
IF ~~ THEN pr_umberlee_pending_08
SAY @55 /* The Queen is granting you a chance to redeem yourself. Retrieving the Tooth is of utmost importance. */
IF ~~ THEN + pr_umberlee_pending_06
END

IF ~~ THEN attack
SAY @56 /* You imbeciles! Feel the wrath of the Bitch Queen! */
IF ~~ THEN DO ~ActionOverride("bsiprum1",Enemy())~ UNSOLVED_JOURNAL @960 EXIT
END

IF ~~ THEN attack_with_active_quest
SAY @57 /* We were too patient with you! Feel the wrath of the Bitch Queen! */
IF ~~ THEN DO ~ActionOverride("bsiprum1",Enemy())~ UNSOLVED_JOURNAL @960 EXIT
END

/* upon return */
IF ~Global("bs_TempleIslandQuest","GLOBAL",10)~ THEN pr_umberlee_return
SAY @58 /* Here they are! */
IF ~~ THEN EXTERN bsiprum2 h_priestess
END
END //APPEND

BEGIN bsiprum2

IF ~Global("bs_TempleIslandQuest","GLOBAL",10)
Dead("bsiprum1")~ THEN h_priestess_alone
SAY @59 /* You killed our sister, so you forfeit your right to live. I will take the sacred tooth after killing you. */
IF ~~ THEN + attack
END

IF ~Global("bs_TempleIslandQuest","GLOBAL",10)~ THEN h_priestess
SAY @60 /* You return victorious! Hand over the relic and fulfill our Queen's intent! */
+ ~PartyHasItem("bsitooth")~ + @61 /* Well, retrieving the tooth is why I went, so here you have it. */ DO ~ActionOverride("bsiprum1",TakePartyItem("bsitooth"))
SetGlobal("bs_TempleIslandQuest","GLOBAL",11)~ + h_priestess_01
+ ~Global("bs_ti_UmberBetrayal_2","GLOBAL",1)~ + @62 /* You lied to me! The tooth was *given* to the Sahuagin as a token of joined forces and a mutual agreement to have the Sahuagin attack Baldur's Gate! */ DO ~SetGlobal("bs_ti_UmberBetrayal_2","GLOBAL",2)~ + betrayal
+ ~Global("bs_ti_UmberBetrayal_1","GLOBAL",1)~ + @63 /* You sent other adventurers after the tooth before! The Sahuagin in the Sea Cave weren't part of the group that actually took the tooth! */ DO ~SetGlobal("bs_ti_UmberBetrayal_1","GLOBAL",2)~ + betrayal_01
+ ~Global("bs_i_CursedTemple","GLOBAL",1)~ + @64 /* What place did you sent me there? Umberlee's wrath hit people venturing into that temple! */ DO ~SetGlobal("bs_i_CursedTemple","GLOBAL",2)~ + betrayal_02
+ ~!PartyHasItem("bsitooth")
Global("bs_NoRelic","LOCALS",0)~ + @65 /* Woops, seems I misplaced it. */ DO ~SetGlobal("bs_NoRelic","LOCALS",1)~ + h_priestess_02
++ @66 /* No need for more words. I decided not to give you the tooth, so I guess this means we fight. */ + attack
END

IF ~~ THEN h_priestess_01
SAY @67 /* You made a wise choice. */
++ @68 /* Yes, and I do not want any trouble with the Water Queen, so fare well. */ + gave_tooth
+ ~Global("bs_ti_UmberBetrayal_2","GLOBAL",2)~ + @69 /* I have no proof for your betrayal other than my statement, so you'll come with me and confess to the city authorities. */ + betrayal_05
+ ~Global("bs_ti_UmberBetrayal_2","GLOBAL",1)~ + @62 /* You lied to me! The tooth was *given* to the Sahuagin as a token of joined forces and a mutual agreement to have the Sahuagin attack Baldur's Gate! */ DO ~SetGlobal("bs_ti_UmberBetrayal_2","GLOBAL",2)~ + betrayal
+ ~Global("bs_ti_UmberBetrayal_1","GLOBAL",1)~ + @70 /* Not so fast. You sent other adventurers after the tooth before! The Sahuagin in the Sea Cave weren't part of the group that actually took the tooth! */ DO ~SetGlobal("bs_ti_UmberBetrayal_1","GLOBAL",2)~ + betrayal_01
+ ~Global("bs_i_CursedTemple","GLOBAL",1)~ + @64 /* What place did you sent me there? Umberlee's wrath hit people venturing into that temple! */ DO ~SetGlobal("bs_i_CursedTemple","GLOBAL",2)~ + betrayal_02
END

IF ~~ THEN h_priestess_02
SAY @71 /* How can you be so foolish to approach us without the sacred relic? */
+ ~!PartyHasItem("bsitooth")
Global("bs_ti_UmberBetrayal_2","GLOBAL",2)~ + @69 /* I have no proof for your betrayal other than my statement, so you'll come with me and confess to the city authorities. */ + betrayal_05
+ ~Global("bs_ti_UmberBetrayal_2","GLOBAL",1)~ + @62 /* You lied to me! The tooth was *given* to the Sahuagin as a token of joined forces and a mutual agreement to have the Sahuagin attack Baldur's Gate! */ DO ~SetGlobal("bs_ti_UmberBetrayal_2","GLOBAL",2)~ + betrayal
+ ~Global("bs_ti_UmberBetrayal_1","GLOBAL",1)~ + @63 /* You sent other adventurers after the tooth before! The Sahuagin in the Sea Cave weren't part of the group that actually took the tooth! */ DO ~SetGlobal("bs_ti_UmberBetrayal_1","GLOBAL",2)~ + betrayal_01
+ ~Global("bs_i_CursedTemple","GLOBAL",1)~ + @64 /* What place did you sent me there? Umberlee's wrath hit people venturing into that temple! */ DO ~SetGlobal("bs_i_CursedTemple","GLOBAL",2)~ + betrayal_02
++ @72 /* I'll go and get it. */ + betrayal_03
++ @66 /* No need for more words. I decided not to give you the tooth, so I guess this means we fight. */ + attack
END

IF ~~ THEN betrayal
SAY @73 /* (tch) And can you prove that bold claim? */
+ ~PartyHasItem("bsitooth")~ + @74 /* I have no proof for your betrayal yet, but while I'm holding onto the tooth, you can go and confess to the city authorities. */ + betrayal_04
+ ~!PartyHasItem("bsitooth")~ + @69 /* I have no proof for your betrayal other than my statement, so you'll come with me and confess to the city authorities. */ + betrayal_05
+ ~Global("bs_ti_UmberBetrayal_1","GLOBAL",1)~ + @63 /* You sent other adventurers after the tooth before! The Sahuagin in the Sea Cave weren't part of the group that actually took the tooth! */ DO ~SetGlobal("bs_ti_UmberBetrayal_1","GLOBAL",2)~ + betrayal_01
+ ~Global("bs_i_CursedTemple","GLOBAL",1)~ + @64 /* What place did you sent me there? Umberlee's wrath hit people venturing into that temple! */ DO ~SetGlobal("bs_i_CursedTemple","GLOBAL",2)~ + betrayal_02
+ ~!PartyHasItem("bsitooth")
Global("bs_TempleIslandQuest","GLOBAL",10)
Global("bs_NoRelic","LOCALS",0)~ + @75 /* I don't have the tooth with me. */ DO ~SetGlobal("bs_NoRelic","LOCALS",1)~ + h_priestess_02
+ ~PartyHasItem("bsitooth")~ + @61 /* Well, retrieving the tooth is why I went, so here you have it. */ DO ~ActionOverride("bsiprum1",TakePartyItem("bsitooth"))
SetGlobal("bs_TempleIslandQuest","GLOBAL",11)~ + h_priestess_01
+ ~Global("bs_TempleIslandQuest","GLOBAL",10)~ + @66 /* No need for more words. I decided not to give you the tooth, so I guess this means we fight. */ + attack
END

IF ~~ THEN betrayal_01
SAY @76 /* Of course we did not only sent one group of adventurers. Do you believe us fools? */
+ ~PartyHasItem("bsitooth")
Global("bs_ti_UmberBetrayal_2","GLOBAL",2)~ + @74 /* I have no proof for your betrayal yet, but while I'm holding onto the tooth, you can go and confess to the city authorities. */ + betrayal_04
+ ~!PartyHasItem("bsitooth")
Global("bs_ti_UmberBetrayal_2","GLOBAL",2)~ + @69 /* I have no proof for your betrayal other than my statement, so you'll come with me and confess to the city authorities. */ + betrayal_05
+ ~Global("bs_ti_UmberBetrayal_2","GLOBAL",1)~ + @62 /* You lied to me! The tooth was *given* to the Sahuagin as a token of joined forces and a mutual agreement to have the Sahuagin attack Baldur's Gate! */ DO ~SetGlobal("bs_ti_UmberBetrayal_2","GLOBAL",2)~ + betrayal
+ ~Global("bs_i_CursedTemple","GLOBAL",1)~ + @64 /* What place did you sent me there? Umberlee's wrath hit people venturing into that temple! */ DO ~SetGlobal("bs_i_CursedTemple","GLOBAL",2)~ + betrayal_02
+ ~!PartyHasItem("bsitooth")
Global("bs_TempleIslandQuest","GLOBAL",10)
Global("bs_NoRelic","LOCALS",0)~ + @75 /* I don't have the tooth with me. */ DO ~SetGlobal("bs_NoRelic","LOCALS",1)~ + h_priestess_02
+ ~PartyHasItem("bsitooth")~ + @61 /* Well, retrieving the tooth is why I went, so here you have it. */ DO ~ActionOverride("bsiprum1",TakePartyItem("bsitooth"))
SetGlobal("bs_TempleIslandQuest","GLOBAL",11)~ + h_priestess_01
+ ~Global("bs_TempleIslandQuest","GLOBAL",10)~ + @66 /* No need for more words. I decided not to give you the tooth, so I guess this means we fight. */ + attack
END

IF ~~ THEN betrayal_02
SAY @77 /* Were you scared? And yet here you are, back in one piece, so until now, you seem to have done everything right. */
+ ~PartyHasItem("bsitooth")
Global("bs_ti_UmberBetrayal_2","GLOBAL",2)~ + @74 /* I have no proof for your betrayal yet, but while I'm holding onto the tooth, you can go and confess to the city authorities. */ + betrayal_04
+ ~!PartyHasItem("bsitooth")
Global("bs_ti_UmberBetrayal_2","GLOBAL",2)~ + @69 /* I have no proof for your betrayal other than my statement, so you'll come with me and confess to the city authorities. */ + betrayal_05
+ ~Global("bs_ti_UmberBetrayal_2","GLOBAL",1)~ + @62 /* You lied to me! The tooth was *given* to the Sahuagin as a token of joined forces and a mutual agreement to have the Sahuagin attack Baldur's Gate! */ DO ~SetGlobal("bs_ti_UmberBetrayal_2","GLOBAL",2)~ + betrayal
+ ~Global("bs_ti_UmberBetrayal_1","GLOBAL",1)~ + @63 /* You sent other adventurers after the tooth before! The Sahuagin in the Sea Cave weren't part of the group that actually took the tooth! */ DO ~SetGlobal("bs_ti_UmberBetrayal_1","GLOBAL",2)~ + betrayal_01
+ ~!PartyHasItem("bsitooth")
Global("bs_TempleIslandQuest","GLOBAL",10)
Global("bs_NoRelic","LOCALS",0)~ + @75 /* I don't have the tooth with me. */ DO ~SetGlobal("bs_NoRelic","LOCALS",1)~ + h_priestess_02
+ ~PartyHasItem("bsitooth")~ + @61 /* Well, retrieving the tooth is why I went, so here you have it. */ DO ~ActionOverride("bsiprum1",TakePartyItem("bsitooth"))
SetGlobal("bs_TempleIslandQuest","GLOBAL",11)~ + h_priestess_01
+ ~Global("bs_TempleIslandQuest","GLOBAL",10)~ + @66 /* No need for more words. I decided not to give you the tooth, so I guess this means we fight. */ + attack
END

IF ~~ THEN betrayal_03
SAY @78 /* My patience is running out. You brought back The Tooth of Iakhovas - we will retrieve it! */
IF ~~ THEN + attack
END

IF ~~ THEN betrayal_04
SAY @79 /* We will do no such thing! */
IF ~~ THEN + betrayal_03
END

IF ~~ THEN betrayal_05
SAY @80 /* A-hahaha! You really thought that would've worked? */
IF ~~ THEN + betrayal_03
IF ~Global("bs_TempleIslandQuest","GLOBAL",11)~ THEN + betrayal_06
END

IF ~~ THEN betrayal_06
SAY @81 /* Sisters, our work here is done. This vermin is not worth our efforts. */
IF ~~ THEN + gave_tooth
END

IF ~~ THEN gave_tooth
SAY @82 /* The Sacred Tooth is ours again! You were an obedient servant, so I will spare your life. */
IF ~~ THEN DO ~AddexperienceParty(2000)
EraseJournalEntry(@958)
EraseJournalEntry(@960)
SetGlobal("bs_TempleIslandQuest","GLOBAL",19)~ SOLVED_JOURNAL @962 EXIT
END

IF ~~ THEN attack
SAY @83 /* You have brought the revenge of the Water Queen upon yourself! */
IF ~~ THEN DO ~EraseJournalEntry(@958)
EraseJournalEntry(@960)
SetGlobal("bs_TempleIslandQuest","GLOBAL",15)~ SOLVED_JOURNAL @100060 EXIT
END

/* at Old Temple Island */

/* first group: Sahuagin rebels */

BEGIN bsisagr1 //rebel leader Baron Frohxlto
IF ~Global("bs_SahuaginPortalRoom","GLOBAL",2)
GlobalLT("bs_ti_SahuaginMeeting","GLOBAL",2)~ THEN hostile_portalroom
SAY @84 /* (The creature says something heated in the Sahuagin tongue of whistles, clicks and snarls. It is obvious that it is hostile.) */
IF ~~ THEN DO ~SetGlobal("bs_RebelDeal","GLOBAL",-1)~ EXIT
END

IF ~Global("bs_SahuaginPortalRoom","GLOBAL",2)
GlobalGT("bs_ti_SahuaginMeeting","GLOBAL",1)~ THEN hostile_portalroom_01
SAY @85 /* You desecrated the portal rooms! */
IF ~~ THEN DO ~SetGlobal("bs_RebelDeal","GLOBAL",-1)~ EXIT
END

BEGIN bsisagp1 //Sahuagin Priestess Ilxigantl
/* Group destroyd the portal */
IF ~Global("bs_SahuaginPortalRoom","GLOBAL",2)
GlobalLT("bs_PCVisitedPortalRoom","LOCALS",2)~ THEN hostile_portalroom
SAY @86 /* You destroyed the portals. You think it saved you soft land dwellers from what we planned? You fool, all you gained is more time. We will come with many - and your city will be the first to fall! */
IF ~~ THEN DO ~SetGlobal("bs_PCVisitedPortalRoom","LOCALS",2)~ EXIT
END

/* group only visited the portal room (did not destroy the portal) */
CHAIN
IF ~Global("bs_SahuaginPortalRoom","GLOBAL",1)
Global("bs_PCVisitedPortalRoom","LOCALS",0)
GlobalLT("bs_MoveToPortalroom","MYAREA",2)~ THEN bsisagp1 reaction_portalroom
@87 /* You saw something you were not supposed to see. You gained your land dwellers more time by killing our architect. We respect your strength, so you will walk alive. Do not touch anything else, or we will smash you like the vermin you are. */
DO ~SetGlobal("bs_PCVisitedPortalRoom","LOCALS",1)~
== bsisagp1 IF ~OR(2) GlobalGT("bs_RebelDeal","GLOBAL",2) Global("bs_BaronDeal","GLOBAL",2)~ THEN @88 /* You have what you came for. There is no need for you to tarry on this island. */
== bsisagp1 IF ~!GlobalGT("bs_RebelDeal","GLOBAL",2) !Global("bs_BaronDeal","GLOBAL",2)~ THEN @89 /* Decide which faction you want to suport, and do it quickly! My patience is running out. */
END
IF ~~ THEN EXIT
IF ~AreaCheck("bs0101") !Dead("bsisagb1") !Allegiance("bsisagb1",[ENEMY])~ THEN + priestess_12

/* first meeting: in bs0101, together with rebels */
APPEND bsisagp1
IF ~Global("bs_ti_SahuaginMeeting","GLOBAL",0)~ THEN first_scene_failsafe
SAY @90 /* (The creature is obviously arguing with another Sahuagin. It says something in the Sahuagin language, not addressed at you.) */
IF ~~ THEN EXTERN bsisagr1 first_scene
END

IF ~OR(2) GlobalGT("bs_RebelDeal","GLOBAL",2) Global("bs_BaronDeal","GLOBAL",2)~ THEN idle_done
SAY @91 /* You are done here. Leave. */
++ @92 /* Any chance we could still get temple services? */ DO ~StartStore("bsisagp1",LastTalkedToBy())~ EXIT
++ @93 /* I'll be gone soon. */ EXIT
END

END //APPEND

CHAIN
IF ~Global("bs_ti_SahuaginMeeting","GLOBAL",0)~ THEN bsisagr1 first_scene
@94 /* (The creature says something heated in the Sahuagin tongue of whistles, clicks and snarls to the Sahuagin priestess.) */
== bsisagp1 @95 /* (The creature replays shortly to the first Sahuagin, then turning its attention to you.) */
END
IF ~~ THEN DO ~SetGlobal("bs_ti_SahuaginMeeting","GLOBAL",1) ClearAllActions() StartCutSceneMode() StartCutScene("bscut013")
~ EXIT

CHAIN
IF ~Global("bs_ti_SahuaginMeeting","GLOBAL",1)~ THEN bsisagp1 priestess_first_meeting
@96 /* I have called on Sekolah to give these beings the ability to understand our language. They are intelligent land creatures of the kinds we already know, but these look different from those hiding in the corridors. They seem to be well-armed and an opponent worth considering. */
== bsisagr1 @97 /* Then they will understand if I tell them that I will gain honor by slaying them in Sekolah's name! */
== bsisagp1 @98 /* Don't make a fool of yourself, Frohxlto. Our dispute must have made it obvious to you that you'll need allies for what you have in mind. Attacking a baron who is carrying out King Ixilthetocal's sacred orders will bring you nothing but your own death, so weigh wisely the opportunities presented by the appearance of these beings. */
== bsisagp1 @99 /* You - come talk to me when Baron Frohxlto is done with you. If neither of you is so primitive to start a fight on this first meeting, of course. */
END
IF ~~ THEN DO ~SetGlobal("bs_ti_SahuaginMeeting","GLOBAL",2)~ UNSOLVED_JOURNAL @963 EXIT

APPEND bsisagr1
IF ~Global("bs_ti_SahuaginMeeting","GLOBAL",2)~ THEN rebel_baron_01
SAY @100 /* You, land creature. Priestess Ilxigantl said you could be of use to me. Why are you here? */
++ @101 /* I am here to retrieve a relic, a tooth of sorts. Your people took it from a Temple of Umberlee. */ DO ~SetGlobal("bs_ti_SahuaginMeeting","GLOBAL",3)~ + rebel_baron_02
++ @270 /* What does it matter to you? Your priestess said you'd have use of me. What do you want?~ */ + rebel_baron_01_a
++ @102 /* No need for much talk. I guess I rather just kill you. */ DO ~SetGlobal("bs_ti_SahuaginMeeting","GLOBAL",3)~ + rebel_baron_03
END

IF ~~ THEN rebel_baron_01_a
SAY @271 /* It matters to decide whether I should crush you or make use of you. You came here for a reason. State it and it might be your reward if you work for me. */
++ @101 /* I am here to retrieve a relic, a tooth of sorts. Your people took it from a Temple of Umberlee. */ DO ~SetGlobal("bs_ti_SahuaginMeeting","GLOBAL",3)~ + rebel_baron_02
++ @102 /* No need for much talk. I guess I rather just kill you. */ DO ~SetGlobal("bs_ti_SahuaginMeeting","GLOBAL",3)~ + rebel_baron_03
END

IF ~~ THEN rebel_baron_02
SAY @103 /* The Taker's Tooth it is you are after? Ghrumshrtl has it. His followers call it the tooth of the One Who Swims With Sekolah and believe it to hold power and the favor or Umberlee. Ever since he came back with it, he and his followers behave like they are Sekolah's Chosen. */
= @104 /* It seems we have the same goal, land creature. Baron Ghrumshrtl lost the way, I need him dead so I can take his place. Priestess Ilxigantl is right that I can't kill him myself without annoying the king. Kill Ghrumshrtl for me and you can leave this place with the tooth. */
++ @105 /* I'll take the deal. I'll kill the other baron for you. */ + rebel_baron_05
++ @106 /* Wait, so basically, I need to confront the other baron for the tooth anyhow because he probably won't give it to me voluntarily, and you will not attack and let me leave with the tooth if I kill the baron? - You have a deal! */ + rebel_baron_05
++ @107 /* What if I decline? */ DO ~SetGlobal("bs_RebelDeal","GLOBAL",1)~ + rebel_baron_03
++ @102 /* No need for much talk. I guess I rather just kill you. */ DO ~SetGlobal("bs_RebelDeal","GLOBAL",1)~ + rebel_baron_03
END

IF ~~ THEN rebel_baron_03
SAY @108 /* Then your own value will be that of a hunt trophy by which I can impress Ghrumshrtl's followers and show that I am the better leader. */
IF ~~ THEN + rebel_baron_04
END

IF ~~ THEN rebel_baron_04
SAY @109 /* Shall we fight? */
IF ~Global("bs_RebelDeal","GLOBAL",0)~ THEN DO ~SetGlobal("bs_RebelDeal","GLOBAL",-1)~ EXIT
+ ~Global("bs_RebelDeal","GLOBAL",1)~ + @110 /* I'll take the deal. I'll kill the other Baron for you. */ + rebel_baron_05
+ ~Global("bs_KnowsAboutSahuaginVictim","GLOBAL",1)~ + @111 /* You were hunting the castaways, even took a child! I will kill you were you stand! */ + attack_rebels
+ ~Global("bs_RebelDeal","GLOBAL",1)~ + @112 /* Stop talking and draw your weapons! */ + attack_rebels
END

IF ~~ THEN rebel_baron_05
SAY @113 /* I'll watch your steps, landling. Do not try to play me for a fool. */
IF ~~ THEN DO ~SetGlobal("bs_RebelDeal","GLOBAL",2)~ UNSOLVED_JOURNAL @965 EXIT
END

IF ~Dead("bsisagb1")
Global("bs_RebelDeal","GLOBAL",2)~ THEN rebel_baron_deel_done
SAY @114 /* You did it. Our deal stands. */
IF ~~ THEN + rebel_baron_deel_done_01
END

IF ~Global("bs_RebelDeal","GLOBAL",4)~ THEN rebel_baron_deel_done_01
SAY @115 /* Leave this place from where you came, I will not tarry time with you further. */
IF ~~ THEN DO ~EraseJournalEntry(@965)~ EXIT
IF ~AreaCheck("bs0101")~ THEN DO ~EraseJournalEntry(@965) SetGlobal("bs_RebelDeal","GLOBAL",3)~ UNSOLVED_JOURNAL @967 EXIT
END

IF ~GlobalGT("bs_BaronDeal","GLOBAL",0)
!Dead("bsisagb1")
Global("bs_NoticedBaronTalk","LOCALS",0)~ THEN rebel_baron_waiting_00
SAY @116 /* I know you met with Ghrumshrtl. Why is he still alive? */
IF ~~ THEN DO ~SetGlobal("bs_NoticedBaronTalk","LOCALS",1)~ + rebel_baron_waiting
END

IF ~Global("bs_RebelDeal","GLOBAL",2)~ THEN rebel_baron_waiting
SAY @117 /* I am waiting for you to fulfil your deal! Do not tarry too long, I need to take over reign before the king loses patience with our tarry. */
+ ~Global("bs_KnowsAboutSahuaginVictim","GLOBAL",1)~ + @111 /* You were hunting the castaways, even took a child! I will kill you were you stand! */ + attack_rebels
++ @118 /* Not so impatient. I'm working on it. */ + rebel_baron_waiting_01
+ ~GlobalGT("bs_BaronDeal","GLOBAL",0)~ + @119 /* The deal is off. The other baron had a better one. Draw your weapons! */ + attack_rebels
+ ~!GlobalGT("bs_BaronDeal","GLOBAL",0)~ + @120 /* I decided I'll kill you anyhow. */ + attack_rebels
END

IF ~~ THEN rebel_baron_waiting_01
SAY @121 /* (snarls) */
IF ~~ THEN EXIT
END

IF ~~ THEN attack_rebels
SAY @122 /* I don't need weapons to kill you, soft landling. */
IF ~~ THEN DO ~EraseJournalEntry(@965)
EraseJournalEntry(@969)
SetGlobal("bs_RebelDeal","GLOBAL",-1)~ UNSOLVED_JOURNAL @964  EXIT
IF ~GlobalGT("bs_BaronDeal","GLOBAL",0)~ THEN DO ~EraseJournalEntry(@964)
EraseJournalEntry(@965)
EraseJournalEntry(@969)
SetGlobal("bs_RebelDeal","GLOBAL",-1)~ UNSOLVED_JOURNAL @966  EXIT
END

END //APPEND

/* in case both barons are dead, she will turn hostile (via script) */
/* Sahuagin Priestess Ilxigantl. Wants to restore the peace, is in bs0101 */
APPEND bsisagp1

IF ~Global("bs_ti_SahuaginMeeting","GLOBAL",3) !Dead("bsisagb1")~ THEN priestess
SAY @123 /* Here you are. Let us talk. */
IF ~Dead("bsisagr1")~ THEN + priestess_02
IF ~Global("bs_RebelDeal","GLOBAL",2)~ THEN + priestess_03
IF ~!Dead("bsisagr1") !Global("bs_RebelDeal","GLOBAL",2)~ THEN + priestess_01
IF ~Dead("bsisagb1")~ THEN + priestess_baron_dead
END

IF ~~ THEN priestess_01
SAY @124 /* You still have unfinished business with Baron Frohxlto. Do you think you can outrun him and confront Ghrumshrtl? */
++ @125 /* We'll see. Why did you want to talk to me? */ + priestess_04
++ @126 /* I definitely think I can deal with him and take you out, too. Fight! */ + priestess_attack
END

IF ~~ THEN priestess_02
SAY @127 /* You killed Baron Frohxlto. */
IF ~~ THEN + priestess_04
END

IF ~~ THEN priestess_03
SAY @128 /* Baron Frohxlto was wise enough to hire you to confront Baron Ghrumshrtl for him. */
IF ~~ THEN + priestess_04
END

IF ~~ THEN priestess_04
SAY @129 /* It might seem contradictory to you, but my main goal is peace amongst the workers here. We have a greater goal to accomplish. I do not care under who's surveillance it will be finished, but this ridiculous quarrel between the two barons needs to stop - one way or the other. */
IF ~~ THEN + priestess_06
IF ~Global("bs_RebelDeal","GLOBAL",2)~ THEN + priestess_05
END

/* PC took the rebel deal */
IF ~~ THEN priestess_05
SAY @130 /* If Baron Frohxlto were to attack and kill Baron Ghrumshrtl with his own claws, he will be punished himself, and I will have to take responsibility for both of them stepping out of line. The same applies to Baron Ghrumshrtl, of course, and so the two barons are currently locked in a standoff, trying to impress the other's supporters and lure them to them in order to gain the upper hand. */
= @131 /* Baron Ghrumshrtl on the other hand got distracted from why we are here, too - he started a silly Wild Hunt operation upon your land creature's abode to please his followers - I assume this is the reason you are here. I *told* him it would lead to complications, but he wouldn't stop, arguing that he conspired with land creatures themselves, increasing the gained treasures and food that will be to our advantage. The presence of you land creatures gives credence to my doubts that such an organized Wild Hunt would not have its own repercussions. */
= @132 /* Of course I'd wish they would all end their foolish behavior and work on our task with full capacity, but I lost hope they'll come to their senses. If bringing peace to this site means one party has to be eliminated, so be it. You would be the tool to make it possible without bringing the king's wrath upon all of us. */
= @133 /* Or is eliminating us all your goal? */
++ @134 /* I took a deal with the rebel Baron since it seems I have to kill the other Baron anyhow to get what I came for. */ + priestess_09
COPY_TRANS_LATE bsisagp1 priestess_09
END

IF ~~ THEN priestess_06
SAY @135 /* Baron Ghrumshrtl started using the portals for raids at the coast. While a certain number of treasure hunts are acceptable, he has now exaggerated the scope and scale to such an extent that our actual work is suffering as a result. */
IF ~~ THEN + priestess_06_a
IF ~Global("bs_ti_UmberBetrayal_2","GLOBAL",0)~ THEN DO ~SetGlobal("bs_ti_UmberBetrayal_2","GLOBAL",1)~ UNSOLVED_JOURNAL @1008 + priestess_06_a
END

IF ~~ THEN priestess_06_a
SAY @136 /* As to the conspiracy he mentiond, this is a question you best pose Baron Ghrumshrtl himself. */
+ ~Global("bs_moreadventurers","LOCALS",0)
Global("bs_toldtooth","LOCALS",1)~ + @137 /* What do you mean, it attracts land dwellers? Were there more who came for the tooth? */ DO ~SetGlobal("bs_moreadventurers","LOCALS",1)~ + priestess_06_b
+ ~Global("bs_toldtooth","LOCALS",0)~ + @101 /* I am here to retrieve a relic, a tooth of sorts. Your people took it from a Temple of Umberlee. */ DO ~SetGlobal("bs_toldtooth","LOCALS",1)~ + priestess_08
+ ~Global("bs_askgoal","LOCALS",0)~ + @138 /* What are you Sahuagins doing here? */ DO ~SetGlobal("bs_askgoal","LOCALS",1)~ + priestess_07
+ ~Global("bs_toldtooth","LOCALS",1)
Global("bs_RebelDeal","GLOBAL",2)~ + @139 /* I have no more questions for now. What now? */ + priestess_10
+ ~Global("bs_toldtooth","LOCALS",1)
GlobalLT("bs_RebelDeal","GLOBAL",2)~ + @139 /* I have no more questions for now. What now? */ + priestess_11
+ ~OR(3) Global("bs_toldtooth","LOCALS",0) Global("bs_askgoal","LOCALS",0) Global("bs_askwildhunt","LOCALS",0)~ + @140 /* I decided I'll kill you. Fight! */ + priestess_attack
END

IF ~~ THEN priestess_06_b
SAY @141 /* You are not the first, but you seem to be the most powerful. */
IF ~~ THEN + priestess_06_c
IF ~Global("bs_ti_UmberBetrayal","GLOBAL",0)~ THEN DO ~SetGlobal("bs_ti_UmberBetrayal","GLOBAL",1)~ UNSOLVED_JOURNAL @1010 + priestess_06_c
END

IF ~~ THEN priestess_06_c
SAY @142 /* Nothing we can't handle, but it is getting tedious. At this rate, it will attract the king's attention. */
+ ~Global("bs_askwildhunt","LOCALS",0)~ + @143 /* Wild Hunt, but in cooperation with people from Baldur's Gate? What do you mean? */ DO ~SetGlobal("bs_askwildhunt","LOCALS",1)~ + priestess_06
+ ~Global("bs_askgoal","LOCALS",0)~ + @138 /* What are you Sahuagins doing here? */ DO ~SetGlobal("bs_askgoal","LOCALS",1)~ + priestess_07
+ ~Global("bs_toldtooth","LOCALS",1)
Global("bs_RebelDeal","GLOBAL",2)~ + @139 /* I have no more questions for now. What now? */ + priestess_10
+ ~Global("bs_toldtooth","LOCALS",1)
GlobalLT("bs_RebelDeal","GLOBAL",2)~ + @139 /* I have no more questions for now. What now? */ + priestess_11
+ ~OR(3) Global("bs_toldtooth","LOCALS",0) Global("bs_askgoal","LOCALS",0) Global("bs_askwildhunt","LOCALS",0)~ + @140 /* I decided I'll kill you. Fight! */ + priestess_attack
END

IF ~~ THEN priestess_07
SAY @144 /* We are making this abandoned place a holy temple, a sacred enclave. Sekolah will smile upon us favorably. It is of no concern to you, land creature. */
+ ~Global("bs_moreadventurers","LOCALS",0)
Global("bs_toldtooth","LOCALS",1)~ + @137 /* What do you mean, it attracts land dwellers? Were there more who came for the tooth? */ DO ~SetGlobal("bs_moreadventurers","LOCALS",1)~ + priestess_06_b
+ ~Global("bs_toldtooth","LOCALS",0)~ + @101 /* I am here to retrieve a relic, a tooth of sorts. Your people took it from a Temple of Umberlee. */ DO ~SetGlobal("bs_toldtooth","LOCALS",1)~ + priestess_08
+ ~Global("bs_askwildhunt","LOCALS",0)~ + @143 /* Wild Hunt, but in cooperation with people from Baldur's Gate? What do you mean? */ DO ~SetGlobal("bs_askwildhunt","LOCALS",1)~ + priestess_06
+ ~Global("bs_toldtooth","LOCALS",1)
Global("bs_RebelDeal","GLOBAL",2)~ + @139 /* I have no more questions for now. What now? */ + priestess_10
+ ~Global("bs_toldtooth","LOCALS",1)
GlobalLT("bs_RebelDeal","GLOBAL",2)~ + @139 /* I have no more questions for now. What now? */ + priestess_11
+ ~OR(3) Global("bs_toldtooth","LOCALS",0) Global("bs_askgoal","LOCALS",0) Global("bs_askwildhunt","LOCALS",0)~ + @140 /* I decided I'll kill you. Fight! */ + priestess_attack
END

IF ~~ THEN priestess_08
SAY @145 /* So you are one of those who came to retrieve the Tooth of Iakhovas. I see. Baron Ghrumshrtl and his followers see it as an endorsement for our goal in this place, while Baron Frohxlto despises the idea simply because Ghrumshrtl values it. I myself am willing to part with it. It attracts too many land dwellers, and if it return ensures restored peace between us, even better. */
+ ~Global("bs_askgoal","LOCALS",0)~ + @138 /* What are you Sahuagins doing here? */ DO ~SetGlobal("bs_askgoal","LOCALS",1)~ + priestess_07
+ ~Global("bs_moreadventurers","LOCALS",0)~ + @137 /* What do you mean, it attracts land dwellers? Were there more who came for the tooth? */ DO ~SetGlobal("bs_moreadventurers","LOCALS",1)~ + priestess_06_b
+ ~Global("bs_askwildhunt","LOCALS",0)~ + @143 /* Wild Hunt, but in cooperation with people from Baldur's Gate? What do you mean? */ DO ~SetGlobal("bs_askwildhunt","LOCALS",1)~ + priestess_06
+ ~Global("bs_toldtooth","LOCALS",1)
Global("bs_RebelDeal","GLOBAL",2)~ + @139 /* I have no more questions for now. What now? */ + priestess_10
+ ~Global("bs_toldtooth","LOCALS",1)
GlobalLT("bs_RebelDeal","GLOBAL",2)~ + @139 /* I have no more questions for now. What now? */ + priestess_11
+ ~OR(3) Global("bs_toldtooth","LOCALS",0) Global("bs_askgoal","LOCALS",0) Global("bs_askwildhunt","LOCALS",0)~ + @140 /* I decided I'll kill you. Fight! */ + priestess_attack
END

IF ~~ THEN priestess_09
SAY @146 /* What did you come here for? */
++ @101 /* I am here to retrieve a relic, a tooth of sorts. Your people took it from a Temple of Umberlee. */ DO ~SetGlobal("bs_toldtooth","LOCALS",1)~ + priestess_08
++ @138 /* What are you Sahuagins doing here? */ DO ~SetGlobal("bs_askgoal","LOCALS",1)~ + priestess_07
++ @143 /* Wild Hunt, but in cooperation with people from Baldur's Gate? What do you mean? */ DO ~SetGlobal("bs_askwildhunt","LOCALS",1)~ + priestess_06
++ @140 /* I decided I'll kill you. Fight! */ + priestess_attack
END

IF ~~ THEN priestess_10
SAY @147 /* So you agreed to kill Baron Ghrumshrtl, and Baron Frohxlto will leave you the tooth for it. I see. Yes, it is surely one way this could go. I have another suggestion. */
IF ~~ THEN + priestess_12
END

/* PC killed rebels */
IF ~~ THEN priestess_11
SAY @148 /* I have a suggestion. */
IF ~~ THEN + priestess_12
END
END //APPEND

/* priestess makes own proposition */
CHAIN
IF ~~ THEN bsisagp1 priestess_12
@149 /* I will go and convince Baron Ghrumshrtl that he needs to stop his Wild Hunts before it provokes our king's anger. I will make him clear that otherwise, appearances of land dwellers will only increase, which *will* endanger our mission. I will make him give you the tooth as a sign that he really came to his senses. */
== bsisagp1 IF ~!Dead("bsisagr1")~ THEN @150 /* I do not expect Baron Ghrumshrtl to give in without any compensation. He will most likely expect you to kill Baron Frohxlto for him in return. */
== bsisagp1 IF ~Dead("bsisagr1")~ THEN @151 /* You already killed the rebels for him - this will be your leverage for these negotiations. There doesn't need to be more bloodshead. */
END
++ @152 /* Why would you do that? */ + priestess_14
++ @153 /* Fine, I'll talk to your baron. */ + priestess_13
++ @140 /* I decided I'll kill you. Fight! */ + priestess_attack

/* priestess will leave and be in bs0102 */

APPEND bsisagp1
IF ~~ THEN priestess_baron_dead
SAY @154 /* I see you decided to kill Baron Ghrumshrtl. Very well, so be it. It might seem contradictory to you, but my main goal is peace amongst the workers here. We have a greater goal to accomplish. Baron Frohxlto is our baron now. I will go down into the quarters. Collect whatever reward you were promised and leave this place. */
IF ~~ THEN DO ~SetGlobal("bs_ti_SahuaginMeeting","GLOBAL",4)~ EXIT
END
END //APPEND

CHAIN
IF ~~ THEN bsisagp1 priestess_13
@155 /* So be it. Baron Ghrumshrtl is on the level below. I will be in one of the quarters downstairs, in case you are in need of the Shark Lord's services. As long as you are working for one of the barons, I would be willing to ensure that your physical condition allows it. */
== bsisagp1 IF ~!Dead("bsisagr1") !Dead("bsisagb1")~ THEN @156 /* Make a choice. */
END
IF ~~ THEN DO ~SetGlobal("bs_ti_SahuaginMeeting","GLOBAL",4)
EraseJournalEntry(@963)~ UNSOLVED_JOURNAL @100007 EXIT

CHAIN
IF ~~ THEN bsisagp1 priestess_14
@157 /* Like I said, I want the workers return to their obligations, and as fast as possible. */
== bsisagp1 IF ~Global("bs_RebelDeal","GLOBAL",2)~ THEN @158 /* Keeping the current leader will stir as little commotion as possible, so it is to be preferred. */
== bsisagp1 @159 /* But Baron Ghrumshrtl needs to let go of his silly side endeavors. You will be the tool who's mere presence will help me to bring him back under control. */
END
++ @153 /* Fine, I'll talk to your baron. */ + priestess_13
++ @140 /* I decided I'll kill you. Fight! */ + priestess_attack

APPEND bsisagp1
IF ~~ THEN priestess_attack
SAY  @160 /* Your choice is unwise, land creature, but so be it. */
IF ~~ THEN DO ~SetGlobal("bs_ti_SahuaginMeeting","GLOBAL",-1) Shout(151) Enemy()~ EXIT
END

IF ~GlobalGT("bs_ti_SahuaginMeeting","GLOBAL",4)~ THEN idle
SAY @161 /* Do you need the Shark Father's services? */
++ @162 /* Yes, show me what you've got. */ DO ~StartStore("bsisagp1",LastTalkedToBy())~ EXIT
++ @163 /* Not now. */ EXIT
END

END //APPEND

/* Baron Ghrumshrtl. Is in bs0102.are */

BEGIN bsisagb1 //Baron Ghrumshrtl

IF ~Global("bs_ti_SahuaginMeeting","GLOBAL",5)~ THEN priestess_is_with_baron
SAY @164 /* You must be the land creatures Priestess Ilxigantl talked about. The priestess granted you Sekolah's blessing to understand our tongue, so I will listen. Repeat to me why you are here. */
++ @165 /* I came here for the tooth from the Temple of Umberlee. */ DO ~EraseJournalEntry(@100007)
SetGlobal("bs_ti_SahuaginMeeting","GLOBAL",6)~ + baron_talks_01
+ ~Global("bs_ti_UmberBetrayal_2","GLOBAL",1)~ + @166 /* A question first. Is it true that you were given the tooth relic? I was sent here to retrieve it on the assumption that it had been stolen. */ DO ~EraseJournalEntry(@100007)
SetGlobal("bs_ti_SahuaginMeeting","GLOBAL",6)~ + baron_talks_01
++ @167 /* How about we just fight? */ DO ~EraseJournalEntry(@100007)
SetGlobal("bs_ti_SahuaginMeeting","GLOBAL",6)~ + baron_talks_00
+ ~Global("bs_KnowsAboutSahuaginVictim","GLOBAL",1)~ + @168 /* I won't make deals with creatures that see us as food! */ DO ~EraseJournalEntry(@100007)
SetGlobal("bs_ti_SahuaginMeeting","GLOBAL",6)~ + baron_talks_00
+ ~Global("bs_RebelDeal","GLOBAL",2)~ + @169 /* I agreed to kill you for the other baron, no need to talk any more. */ DO ~EraseJournalEntry(@100007)
SetGlobal("bs_ti_SahuaginMeeting","GLOBAL",6)~ + baron_attack
END

IF ~~ THEN baron_talks_00
SAY @170 /* I would love to fight you, intruders to our realm. But our priestess took great effort that we talk. So - talk! */
++ @171 /* I came here for the tooth you took from the Temple of Umberlee. */ + baron_talks_01
+ ~Global("bs_RebelDeal","GLOBAL",2)~ + @169 /* I agreed to kill you for the other baron, no need to talk any more. */ + baron_attack
+ ~Global("bs_KnowsAboutSahuaginVictim","GLOBAL",1)~ + @111 /* You were hunting the castaways, even took a child! I will kill you were you stand! */ + baron_attack
++ @172 /* No, we fight. */ + baron_attack
END

IF ~~ THEN baron_talks_01
SAY @173 /* Insidious land creatures! So Priestess Ilxigantl told the truth that you are here to take it back. Who sent you? */
++ @174 /* Why are you calling me insidious? I was told you stole the tooth from the temple. */ + baron_talks_02
++ @175 /* The Temple of Umberlee. */ + baron_talks_03
++ @176 /* A priestess of Umberlee. */ + baron_talks_04
+ ~Global("bs_ti_UmberBetrayal_2","GLOBAL",1)~ + @177 /* What does it matter? You stole it, I will return it. */ + baron_talks_02
+ ~Global("bs_ti_UmberBetrayal_2","GLOBAL",0)~ + @178 /* What does it matter? */ + baron_talks_05
END

IF ~~ THEN baron_talks_02
SAY @179 /* I am no thief! You mean because I take from you land creatures my treasures and trophies? The tooth is not one of those. */
IF ~~ THEN + baron_talks_05
END

IF ~~ THEN baron_talks_03
SAY @180 /* The temple, you say. So, first they talk about agreements, then they send mercenaries? */
IF ~~ THEN + baron_talks_05
END

IF ~~ THEN baron_talks_04
SAY @181 /* One priestess, you say. Does she not talk for her temple? First they talk about agreements, then they send mercenaries! */
IF ~~ THEN + baron_talks_05
END

IF ~~ THEN baron_talks_05
SAY @182 /* The Tooth of The One Who Swims With Sekolah is a pledge to our agreement. We hunt in the city of underground rivers, and the temple does not interfere! It is you who is trespassing for wanting it back! */
++ @183 /* Wait - are you implying that the Temple of Underlee made an arrangement with you to go on rides inside Baldur's Gate? */ + baron_talks_06
++ @184 /* I don't believe you. You are trying to manipulate me into abandoning my mission! */ + baron_talks_06
END

IF ~~ THEN baron_talks_06
SAY @185 /* It is of no importance any more. Priestess Ilxigantl showed wisdom with her warnings that land creatures will come and endanger our mission. I wanted to give my people possibilities for enjoyment and gaining more valuables and food to boost our work here, but your interference opened my eyes. I do not need neither the Tooth of The One Who Swims With Sekolah nor an agreement with Umberlee's priestesses to achieve that. */
IF ~~ THEN + baron_talks_06_a
IF ~Global("bs_ti_UmberBetrayal_2","GLOBAL",0)~ DO ~SetGlobal("bs_ti_UmberBetrayal_2","GLOBAL",1)~ UNSOLVED_JOURNAL @1008 + baron_talks_06_a
END

IF ~~ THEN baron_talks_06_a
SAY @186 /* I could kill you and be done with it, but Priestess Ilxigantl convinced me that you can be to my advantage, and I agree that the benefit overweighs the loss of the Sacred Tooth. Kill the rebel baron for me, and I will let you leave from this island with the tooth. */
++ @187 /* Fine, I will do that for you. */ + baron_talks_08
+ ~Dead("bsisagr1")~ + @188 /* Well, he is already dead - so. */ + deal_done
+ ~Global("bs_RebelDeal","GLOBAL",2)~ + @189 /* No. I agreed to kill you for the other baron, and I chose to honor this agreement. */ + baron_attack
+ ~!Dead("bsisagr1")~ + @190 /* Let me think about it. */ + baron_talks_07
+ ~Global("bs_KnowsAboutSahuaginVictim","GLOBAL",1)~ + @111 /* You were hunting the castaways, even took a child! I will kill you were you stand! */ + baron_attack
++ @191 /* You know what - we talked. Now let us fight. */ + baron_attack
END

IF ~~ THEN baron_talks_07
SAY @192 /* No, no "thinking about it". We either fight now, or you take my deal! */
++ @187 /* Fine, I will do that for you. */ + baron_talks_08
+ ~Global("bs_RebelDeal","GLOBAL",2)~ + @189 /* No. I agreed to kill you for the other baron, and I chose to honor this agreement. */ + baron_attack
++ @191 /* You know what - we talked. Now let us fight. */ + baron_attack
END

IF ~~ THEN baron_talks_08
SAY @193 /* Good choice. */
IF ~~ THEN + baron_talks_09
IF ~Dead("bsisagr1")~ THEN + deal_done
END

IF ~~ THEN baron_talks_09
SAY @194 /* Bring me the baron's head! */
IF ~~ THEN DO ~SetGlobal("bs_BaronDeal","GLOBAL",1)~ EXIT
END

IF ~~ THEN baron_attack
SAY @195 /* So this is how it will go. We will fight! */
IF ~~ THEN DO ~SetGlobal("bs_BaronDeal","GLOBAL",-1)~ EXIT
END

IF ~Dead("bsisagr1")
Global("bs_BaronDeal","GLOBAL",1)~ THEN deal_done
SAY @196 /* I heard you killed the rebels. I will honor our deal. */
IF ~~THEN DO ~EraseJournalEntry(@964)~ + deal_done_01
IF ~!HasItem("bsitooth",Myself)~ THEN DO ~EraseJournalEntry(@964)~ + tooth_gone
END

IF ~~ THEN deal_done_01
SAY @197 /* Here is the tooth. */
IF ~~ THEN DO ~GiveItem("bsitooth",LastTalkedToBy(Myself))~ + deal_done_02
END

IF ~~ THEN deal_done_02
SAY @198 /* Give it to the Bitch Queen's priestesses and tell them that our deal is over - and we will not forget the treason. Next time we come into your city of stones, we will come with many, and we will spare no one. */
IF ~~THEN DO ~SetGlobal("bs_BaronDeal","GLOBAL",2)~ + leave_now
END

IF ~Global("bs_BaronDeal","GLOBAL",2)~ THEN leave_now
SAY @199 /* Leave. */
IF ~~ THEN EXIT
END

IF ~~ THEN tooth_gone
SAY @200 /* But the tooth is gone - you stole it! - No matter, you did what we agreed to and have your reward. */
IF ~~THEN + deal_done_02
END

/* Sahuagin guards before entrance to portal room */
BEGIN bsisagg1
IF ~AreaCheck("bs0102") Global("bs_IsNearDoor","MYAREA",0)
GlobalLT("bs_SahuaginPortalRoom","GLOBAL",2)~ THEN warning
SAY @201 /* Halt! You have no clearance to enter here. Do not walk any further, or we will stop you with force. */
IF ~~ THEN DO ~SetGlobal("bs_IsNearDoor","MYAREA",1)~ EXIT
IF ~Global("bs_SawPortalRoom","GLOBAL",0)~ THEN DO ~SetGlobal("bs_SawPortalRoom","GLOBAL",1) SetGlobal("bs_IsNearDoor","MYAREA",1)~ UNSOLVED_JOURNAL @100006 EXIT
END

IF ~True()~ THEN oneliner
SAY @202 /* Get away from the doors. */
IF ~~ THEN EXIT
END


BEGIN bsisagg2
IF ~True()~ THEN oneliner
SAY @203 /* Talk to Baron Ghrumshrtl, not us. */
IF ~~ THEN EXIT
END

/* Sahuagin worker in bs0102 */

BEGIN bsisagw3
IF ~True()~ THEN oneliner
SAY @204 /* Talk to the priestess, not me. */
IF ~~ THEN EXIT
END

/* Sahuagin worker in bs0104 */

BEGIN bsisagw1
IF ~True()~ THEN oneliner
SAY @205 /* Intruder! */
IF ~~ THEN EXIT
END

/* Sahuagin rebels */
/* Baronial Guard */
BEGIN bsisagr2
IF ~True()~ THEN oneliner
SAY @206 /* I am watching you. */
IF ~~ THEN EXIT
END
/* normal Sahuagin */
BEGIN bsisagr3
IF ~True()~ THEN oneliner
SAY @207 /* Talk to Baron Frohxlto, not me. */
IF ~~ THEN EXIT
END


/* Sahuagin baron followers */
/* Baronial Guard */
BEGIN bsisagb2
IF ~True()~ THEN oneliner
SAY @208 /* Behave yourself. */
IF ~~ THEN EXIT
END
/* normal Sahuagin */
BEGIN bsisagb3
IF ~True()~ THEN oneliner
SAY @209 /* Talk to Baron Ghrumshrtl, not me. */
IF ~~ THEN EXIT
END



/* Give evidence and tooth to Seatower Commander - in bstrcmdr.d */

/* Give tooth to priest of Helm */

EXTEND_BOTTOM PRIHEL 0
+ ~PartyHasItem("bsitooth")
Global("bs_GiveToothHelm","MYAREA",0)~ + @210 /* I have a relic of the Temple of Umberlee here and would like to ask you to return it. I retrieved it for them, but there was a... misunderstanding when I tried to hand it in. */ DO ~EraseJournalEntry(@100059)
EraseJournalEntry(@100065)
AddexperienceParty(100)
SetGlobal("bs_TempleIslandQuest","GLOBAL",20)
SetGlobal("bs_GiveToothHelm","MYAREA",3)
TakePartyItem("bsitooth") DestroyItem("bsitooth")~ SOLVED_JOURNAL @100064 + hand_in_tooth
END

APPEND PRIHEL
IF ~~ THEN hand_in_tooth
SAY @211 /* I see. Thank you, my child. Even if churches do not always agree, it is courtesy to respect holy relics. We will see to its safe return. */
IF ~~ THEN DO ~ReputationInc(1)~ EXIT
END

END //APPEND

/* Priestess of Talos, will approach the group */
BEGIN bsitalos

IF ~GlobalGT("bs_TempleIslandQuest","GLOBAL",18)~ THEN talos_priest_gone
SAY @212 /* [female Talos priestess]I hear you decided against selling the Tooth of Iakhovas to us. You wasted a good opportunity to please the Storm Lord. It is of no use to kill you now. My god will have a better plan for you. */
IF ~~ THEN DO ~EraseJournalEntry(@100065)
SetGlobal("bs_i_SpawnTalosPriest","GLOBAL",11)~ EXIT
END

IF ~GlobalLT("bs_i_SpawnTalosPriest","GLOBAL",3)~ THEN talos_priest
SAY @213 /* [female Talos priestess]Greetings, <CHARNAME>. Yes, I know who you are. Let's not dwell on things that might have happened in the recent past. I am Priestess of Talos and I am approaching you because we sensed a relic on you, sacred to the cursed Temple of the Bitch Queen. We have a huge interest in aquiring this item and are offering you a big sum of gold, would you part with it for us. */
++ @214 /* You want Iakhovas' Tooth? */ + talos_priest_01
COPY_TRANS_LATE bsitalos talos_priest_01
END

IF ~~ THEN talos_priest_01
SAY @215 /* [female Talos priestess]Indeed, that is the relic we would like to obtain. */
++ @216 /* I am listening. */ + talos_priest_02
++ @217 /* And why would I give this to you? */ + talos_priest_08
++ @218 /* Hand the thing over to the church of the god with whom Umberlee is at odds? Do you think I'm crazy? */ + talos_priest_10
++ @219 /* How about I just kill you, instead. */ + talos_priest_06
END

IF ~~ THEN talos_priest_02
SAY @220 /* [female Talos priestess]We would pay you 4000 gold in addition to this scroll of Ice Storm for it. */
++ @221 /* What if I say no? */ + talos_priest_04
++ @222 /* Can I think about this? */ + talos_priest_09
++ @223 /* No thanks. I'd prefer not to anger Umberlee any more than I already did. */ + talos_priest_03
+ ~!PartyHasItem("bsitooth")~ + @224 /* I'd like to sell you the tooth relic, but I don't have it with me currently. */ + talos_priest_09
+ ~PartyHasItem("bsitooth")~ + @225 /* Yes, I want to please the Storm Lord. Here it is. */ + sold_tooth
+ ~PartyHasItem("bsitooth")~ + @226 /* 4000 gold is increadible indeed. Make it at least 5000, and the relic is yours. */ DO ~SetGlobal("bs_5000","LOCALS",1)~ + talos_priest_07
END

IF ~~ THEN talos_priest_03
SAY @227 /* [female Talos priestess]You might anger Umberlee, but what would it matter if it secures the Storm Lord's favor? */
IF ~~ THEN + talos_priest_05
END

IF ~~ THEN talos_priest_04
SAY @228 /* [female Talos priestess]Then I would try to reason with you one more time. Be aware that I will not let go of this opportunity easily. */
IF ~~ THEN + talos_priest_05
END

IF ~~ THEN talos_priest_05
SAY @229 /* [female Talos priestess]What is your decision? */
++ @230 /* I said no. */ + talos_priest_06
++ @222 /* Can I think about this? */ + talos_priest_09
+ ~!PartyHasItem("bsitooth")~ + @224 /* I'd like to sell you the tooth relic, but I don't have it with me currently. */ + talos_priest_09
+ ~PartyHasItem("bsitooth")~ + @225 /* Yes, I want to please the Storm Lord. Here it is. */ + sold_tooth
+ ~PartyHasItem("bsitooth")~ + @226 /* 4000 gold is increadible indeed. Make it at least 5000, and the relic is yours. */ DO ~SetGlobal("bs_5000","LOCALS",1)~ + talos_priest_07
END

IF ~~ THEN talos_priest_06
SAY @231 /* [female Talos priestess]I suspected asking you nicely would be a mistake. Seems I'll have to take the relic out of your dead hands. */
IF ~~ THEN DO ~SetGlobal("bs_i_SpawnTalosPriest","GLOBAL",3) ActionOverride("bsitalos",Enemy())~ EXIT
END

IF ~~ THEN talos_priest_07
SAY @232 /* [female Talos priestess]5000 it is. */
IF ~~ THEN + sold_tooth
END

IF ~~ THEN talos_priest_08
SAY @233 /* [female Talos priestess]I would believe you know when to play your cards to ensure the favor of the most important and potent god in these realms. */
IF ~~ THEN + talos_priest_02
END

IF ~~ THEN talos_priest_09
SAY @234 /* [female Talos priestess]Come and find me in the Elfsong Tavern if you are willing to sell the tooth relic to me. */
IF ~~ THEN DO ~SetGlobal("bs_i_SpawnTalosPriest","GLOBAL",4)
ActionOverride("bsitalos",EscapeAreaDestroy(5))~ UNSOLVED_JOURNAL @100065 EXIT
END

IF ~~ THEN talos_priest_10
SAY @235 /* [female Talos priestess]Absolutely not - I would believe you know when to play your cards to ensure the favor of the most important and potent god in these realms. */
IF ~~ THEN + talos_priest_02
END

IF ~GlobalGT("bs_i_SpawnTalosPriest","GLOBAL",4)~ THEN waiting_01
SAY @236 /* [female Talos priestess]Greetings, <CHARNAME>. What is your decision? */
+ ~!PartyHasItem("bsitooth")~ + @224 /* I'd like to sell you the tooth relic, but I don't have it with me currently. */ + waiting_02
+ ~PartyHasItem("bsitooth")~ + @225 /* Yes, I want to please the Storm Lord. Here it is. */ + sold_tooth
+ ~PartyHasItem("bsitooth")~ + @226 /* 4000 gold is increadible indeed. Make it at least 5000, and the relic is yours. */ DO ~SetGlobal("bs_5000","LOCALS",1)~ + talos_priest_07
++ @237 /* I haven't decided yet. */ + waiting_02
END

IF ~~ THEN waiting_02
SAY @238 /* [female Talos priestess]Don't wait too long. */
IF ~~ THEN EXIT
END

IF ~~ THEN sold_tooth
SAY @239 /* [female Talos priestess]You seized a good opportunity to honor the Storm Lord. Farewell. */
IF ~~ THEN DO ~ActionOverride("bsitalos",TakePartyItem("bsitooth"))
ActionOverride("bsitalos",DestroyItem("bsitooth"))
GiveItemCreate("scrl1x",Player1,1,0,0)
GiveGoldForce(4000)
ReputationInc(-1)
EraseJournalEntry(@100059)
EraseJournalEntry(@100065)
AddexperienceParty(100)
SetGlobal("bs_i_SpawnTalosPriest","GLOBAL",10)~ SOLVED_JOURNAL @972 EXIT
IF ~Global("bs_5000","LOCALS",1)~ THEN DO ~ActionOverride("bsitalos",TakePartyItem("bsitooth"))
ActionOverride("bsitalos",DestroyItem("bsitooth"))
GiveItemCreate("scrl1x",Player1,1,0,0)
GiveGoldForce(5000)
ReputationInc(-1)
EraseJournalEntry(@100059)
EraseJournalEntry(@100065)
AddexperienceParty(100)
SetGlobal("bs_i_SpawnTalosPriest","GLOBAL",10)~ SOLVED_JOURNAL @972 EXIT
END


/* communication with the Temple of Umberlee: */

/* Jalantha */
EXTEND_BOTTOM jalant 0
+ ~Global("bs_TempleIslandQuest","GLOBAL",3)
Global("bs_ReportedTooth","MYAREA",0)~ + @240 /* I hear Sahuagin stole a relic from your temple? The Priestess of Umberlee who requested I get it back was rather specific about not telling you this, are you even aware? */ DO ~SetGlobal("bs_ReportedTooth","MYAREA",1)~ + tooth_gone
/* after returning */
/* PC only offers the tooth */
+ ~Global("bs_BringsTooth","MYAREA",0)
Dead("bsiprum2")
PartyHasItem("bsitooth")~ + @241 /* I have here the Tooth of Iakhovas, holy relic of your temple. */ DO ~SetGlobal("bs_BringsTooth","MYAREA",1)~ + only_tooth
/* PC offers the evidence */
+ ~Global("bs_BringsEvidence","MYAREA",0)
PartyHasItem("bsipuml2")~ + @242 /* I have evidence that some of your priestesses were part of an intrigue against the city. */ DO ~SetGlobal("bs_BringsEvidence","MYAREA",1)~ + evidence
END

APPEND jalant

IF ~~ THEN only_tooth
SAY @243 /* You hold our holy tooth - and you killed our sisters for it! */
IF ~~ THEN UNSOLVED_JOURNAL @100088 + 11
END

IF ~~ THEN evidence
SAY @244 /* Hmph. Hand it over at *once* or feel the wrath of the Water Queen! */
++ @245 /* Yes, that's why I'm here. Take it, I enjoy a little intrigue here and there, no need to get unfriendly. */ + evidence_01
++ @246 /* Nah, not so fast. I do believe it should be worth something to you if I give you this, don't you think? I'm sure the city authorities would be very interested in this, too. */ + attack
++ @247 /* What, you thought I'd hand this over to you? I just wanted to let you know that I hold something against you, so you better remember. */ + attack
END

IF ~~ THEN evidence_01
SAY @248 /* Iakhovas Tooth?! - If you have received this proof, you must also have acquired our holy relic. Hand it over at once! */
+ ~PartyHasItem("bsitooth")~ + @249 /* It's only logical I'll give you your relic, too. Here it is. */ + tooth_back
+ ~!PartyHasItem("bsitooth")~ + @250 /* I don't have it. */ + attack_01
++ @251 /* How about a reward? At least the relic should be worth something to you, don't you think? */ UNSOLVED_JOURNAL @100089 + attack
END

IF ~~ THEN tooth_gone
SAY @252 /* The Holy Tooth - Iakhovas' Tooth - should be with my sisters - if they told you to get it back, what are you waiting for? Retrieve it at once! */
++ @253 /* In other words, you had no idea. */ + tooth_gone_01
++ @254 /* Yes, I will. */ + 16
END

IF ~~ THEN tooth_gone_01
SAY @255 /* Watch your words. The Bitch Queen brooks no insolence. */
IF ~~ THEN + 16
END

IF ~~ THEN attack
SAY @256 /* You *dare* speak such words in these halls? */
IF ~~ THEN UNSOLVED_JOURNAL @100090 + 11
END

IF ~~ THEN attack_01
SAY @257 /* You *dare* come in here empty handed? */
IF ~~ THEN UNSOLVED_JOURNAL @100090 + 11
END

IF ~~ THEN tooth_back
SAY @258 /* You made a wise choice today. The Bitch Queen will forgive you your sins - this time. Go now and don't bother me. */
IF ~~ THEN DO ~ActionOverride("jalantha",TakePartyItem("bsitooth"))
ActionOverride("jalantha",DestroyItem("bsitooth"))
ActionOverride("jalantha",TakePartyItem("bsipuml2"))
ActionOverride("jalantha",DestroyItem("bsipuml2"))
EraseJournalEntry(@100059)
EraseJournalEntry(@100062)
EraseJournalEntry(@100065)
AddJournalEntry(@100092,QUEST_DONE)
AddexperienceParty(250)
AddexperienceParty(100)
SetGlobal("bs_TempleIslandQuest","GLOBAL",22)~ SOLVED_JOURNAL @100091 EXIT
END

END //APPEND

/* Tenya (tenya2.dlg) */
EXTEND_BOTTOM tenya2 0
+ ~Global("bs_TempleIslandQuest","GLOBAL",3)
Global("bs_ReportedTooth","MYAREA",0)~ + @240 /* I hear Sahuagin stole a relic from your temple? The Priestess of Umberlee who requested I get it back was rather specific about not telling you this, are you even aware? */ DO ~SetGlobal("bs_ReportedTooth","MYAREA",1)~ + tooth_gone
/* after returning */
/* PC only offers the tooth */
+ ~Global("bs_BringsTooth","MYAREA",0)
Dead("bsiprum2")
PartyHasItem("bsitooth")~ + @241 /* I have here the Tooth of Iakhovas, holy relic of your temple. */ DO ~SetGlobal("bs_BringsTooth","MYAREA",1)~ + only_tooth
/* PC offers the evidence (doesn't have the tooth) */
+ ~Global("bs_BringsEvidence","MYAREA",0)
PartyHasItem("bsipuml2")~ + @242 /* I have evidence that some of your priestesses were part of an intrigue against the city. */ DO ~SetGlobal("bs_BringsEvidence","MYAREA",1)~ + evidence
END

EXTEND_BOTTOM tenya2 6
+ ~Global("bs_TempleIslandQuest","GLOBAL",3)
Global("bs_ReportedTooth","MYAREA",0)~ + @240 /* I hear Sahuagin stole a relic from your temple? The Priestess of Umberlee who requested I get it back was rather specific about not telling you this, are you even aware? */ DO ~SetGlobal("bs_ReportedTooth","MYAREA",1)~ + tooth_gone
/* after returning */
/* PC only offers the tooth */
+ ~Global("bs_BringsTooth","MYAREA",0)
Dead("bsiprum2")
PartyHasItem("bsitooth")~ + @241 /* I have here the Tooth of Iakhovas, holy relic of your temple. */ DO ~SetGlobal("bs_BringsTooth","MYAREA",1)~ + only_tooth
/* PC offers the evidence (doesn't have the tooth) */
+ ~Global("bs_BringsEvidence","MYAREA",0)
PartyHasItem("bsipuml2")~ + @242 /* I have evidence that some of your priestesses were part of an intrigue against the city. */ DO ~SetGlobal("bs_BringsEvidence","MYAREA",1)~ + evidence
END

APPEND tenya2



IF ~~ THEN only_tooth
SAY @259 /* Our sisters were killed - and it is you who holds the tooth! */
+ ~PartyHasItem("bsipuml2")~ + @260 /* Well, your sisters were part of an intrigue ... against your own, as it seems. */ + evidence
++ @261 /* Yes, and if you want it, you should take it quickly, lest I decide otherwise. */ UNSOLVED_JOURNAL @100089 + 10
++ @262 /* They weren't exactly cooperative. Be glad I'm not taking it out on you. */ UNSOLVED_JOURNAL @100089 + 10
END

IF ~~ THEN evidence
SAY @263 /* Bold statement. Show me the evidence to back your claim! */
+ ~Global("bs_BringsTooth","MYAREA",0)~ + @245 /* Yes, that's why I'm here. Take it, I enjoy a little intrigue here and there, no need to get unfriendly. */ + evidence_01
+ ~Global("bs_BringsTooth","MYAREA",1)~ + @245 /* Yes, that's why I'm here. Take it, I enjoy a little intrigue here and there, no need to get unfriendly. */ + tooth_back
++ @246 /* Nah, not so fast. I do believe it should be worth something to you if I give you this, don't you think? I'm sure the city authorities would be very interested in this, too. */ UNSOLVED_JOURNAL @100090 + 10
++ @247 /* What, you thought I'd hand this over to you? I just wanted to let you know that I hold something against you, so you better remember. */ UNSOLVED_JOURNAL @100090 + 10
END

IF ~~ THEN evidence_01
SAY @264 /* This mentions Iakhovas Tooth. If it belongs together, you must have also acquired our holy relic. Give it to me immediately! */
+ ~PartyHasItem("bsitooth")~ + @249 /* It's only logical I'll give you your relic, too. Here it is. */ + tooth_back
+ ~!PartyHasItem("bsitooth")~ + @250 /* I don't have it. */ + attack
++ @251 /* How about a reward? At least the relic should be worth something to you, don't you think? */ DO ~AddJournalEntry(@100090,QUEST)~ UNSOLVED_JOURNAL @100089 + 10
END

IF ~~ THEN tooth_gone
SAY @265 /* Whatever you heard or saw, Umberlee will see and hear, too! Her wrath will be boundless aginst anyone who wronged her. If my sisters requested you bring back our holy relic, what are you waiting for? */
++ @253 /* In other words, you had no idea. */ + bye
++ @266 /* I'm on it. */ + bye
END

IF ~~ THEN attack
SAY @267 /* You *lost* our holy relic, yet you come in here, thinking you would get out alive? */
IF ~~ THEN UNSOLVED_JOURNAL @100090 + 10
END

IF ~~ THEN tooth_back
SAY @268 /* It is wise to be obidient to the Water Queen. Go now. */
IF ~~ THEN DO ~ActionOverride("tenya2",TakePartyItem("bsitooth"))
ActionOverride("tenya2",DestroyItem("bsitooth"))
ActionOverride("tenya2",TakePartyItem("bsipuml2"))
ActionOverride("tenya2",DestroyItem("bsipuml2"))
EraseJournalEntry(@100059)
EraseJournalEntry(@100062)
EraseJournalEntry(@100065)
AddJournalEntry(@100092,QUEST_DONE)
AddexperienceParty(250)
AddexperienceParty(100)
SetGlobal("bs_TempleIslandQuest","GLOBAL",21)~ SOLVED_JOURNAL @100091 EXIT
END

IF ~~ THEN bye
SAY @269 /* Leave, now. */
IF ~~ THEN EXIT
END

END //APPEND
