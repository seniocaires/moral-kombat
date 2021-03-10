;elbow
[Statedef 2001]
type    = S
movetype= A
physics = S
ctrl = 0
velset = 0,0
anim = 2001
sprpriority = 2
facep2 = 1

[State var]
type = varset
trigger1 = !animtime
trigger2 = !time
v = 11
value = 0


[State var]
type = selfstate
trigger1 = p2stateno = 9010
value = 2200

[State woosh]
type = PlaySnd
trigger1 = time = 4
value = S5, 20

[State ]
type = Hitdef
trigger1 = !movecontact
damage = 40,20
getpower = 0,0
givepower = 0,0
pausetime = 2,2
attr = S,NA
hitflag = HA
guardflag = M
animtype = light
air.animtype = back
priority = 4, hit
sparkno = 1
guard.sparkno = 40
sparkxy = -20, -85
hitsound = S1338,1
guardsound = S5,14
ground.type = high
air.type = high
ground.slidetime = 12
guard.slidetime = 12
ground.hittime = 16
guard.hittime = 12
ground.velocity = -1, 0
air.velocity = -3.5, -6
guard.velocity = -9.5
air.cornerpush.veloff = -5
ground.cornerpush.veloff = 0
yaccel = .5
air.fall = 1
fall.recover = 0
fall.xvelocity = 0
fall.yvelocity = 0
guard.cornerpush.veloff = -10
p2facing = 1
forcestand = 1


[State var]
type = targetvelset
trigger1 = movehit = [1,12]
trigger1 = target,stateno = [5000,5012]
x = -1

[State var]
type = targetvelset
trigger1 = moveguarded && target,hitover = 0
x = -4

[State var]
type = targetvelset
trigger1 = !movecontact && target,statetype != A
x = 0

[State shake]
type = envshake
trigger1 = movecontact
time = 16
freq = 70
ampl = 3
persistent = 0

[State ]
type = posset
trigger1 = time = 0 || prevstateno = 601 || prevstateno = 611
y = var(57)

;sigue ke te sigue
[State 1610, 1]
type = PosAdd
trigger1 = time = 0 && (prevstateno = 601 || prevstateno = 611)
x = p2bodydist x



[State var]
type = varset
trigger1 = time > 3 && command = "combo x"
trigger1 = var(50) = 0
trigger1 = movecontact
v = 11
value = 1
ignorehitpause = 1

[State var]
type = selfstate
trigger1 = moveguarded = 2
trigger1 = p2bodydist x > 9 && enemy,backedgebodydist < 8
value = 269

[State var]
type = selfstate
triggerall = (movecontact = [2,7])
trigger1 = var(11) = 1
trigger2 = var(50) = 1 && random%8 < AILevel&& AILevel > 1+random%2
value = 2002

[State var]
type = varset
trigger1 = time > 3 && command = "combo a"
trigger1 = var(50) = 0
trigger1 = movecontact
v = 11
value = 2
ignorehitpause = 1

[State var]
type = selfstate
triggerall = (movecontact = [2,7])
trigger1 = var(11) = 2
trigger2 = var(50) = 1 && random%8 < AILevel&& AILevel > 1+random%2
value = 2003

[State var]
type = targetlifeadd
trigger1 = movecontact > 2
trigger1 = var(11) = 0 && target,life < 2
trigger1 = var(9) = 0 || var(19) = 1
value = -1
kill = 1

[State end]
type = changeanim
triggerall = animelem = 4
trigger1 = !movecontact
trigger1 = p2statetype = C || p2statetype = L
value = anim
elem = 5

[State end]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1

;knee
[Statedef 2101]
type    = S
movetype= A
physics = S
poweradd= 0
ctrl = 0
velset = 0,0
anim = 2101
sprpriority = 2
facep2 = 1

[State var]
type = varset
trigger1 = !animtime
trigger2 = !time
v = 11
value = 0

[State sound]
type = PlaySnd
trigger1 = time = 4
value = S5, 20

[State ]
type = Hitdef
trigger1 = !movecontact
damage = 40,20
getpower = 0,0
givepower = 0,0
pausetime = 2,2
attr = S,NA
hitflag = MAD
guardflag = M
animtype = light
air.animtype = back
priority = 4, hit
sparkno = 1
guard.sparkno = 40
sparkxy = -20, -60
hitsound = S1338,1
guardsound = S5,14
ground.type = high
air.type = high
ground.slidetime = 12
guard.slidetime = 12
ground.hittime = 16
guard.hittime = 12
ground.velocity = -1, 0
air.velocity = -3.5, -6
guard.velocity = -9.5
air.cornerpush.veloff = -5
ground.cornerpush.veloff = 0
yaccel = .5
air.fall = (p2statetype != L)
fall.recover = 0
fall.xvelocity = 0
fall.yvelocity = 0
guard.cornerpush.veloff = -10
forcestand = 1
p2facing = 1


[State var]
type = targetstate
trigger1 = movecontact && target,stateno = 5080
value = 5005
ignorehitpause = 1

[State var]
type = targetvelset
trigger1 = movehit = [1,12]
trigger1 = target,stateno = [5000,5012]
x = -1

[State var]
type = targetvelset
trigger1 = moveguarded && target,hitover = 0
x = -4

[State var]
type = targetvelset
trigger1 = !movecontact && target,statetype != A
x = 0

[State shake]
type = envshake
trigger1 = movecontact
time = 16
freq = 70
ampl = 3
persistent = 0

[State ]
type = posset
trigger1 = time = 0 || prevstateno = 601 || prevstateno = 611
y = var(57)

;sigue ke te sigue
[State 1610, 1]
type = PosAdd
trigger1 = time = 0 && (prevstateno = 601 || prevstateno = 611)
x = p2bodydist x

[State var]
type = varset
triggerall = var(11) = 0
trigger1 = time > 3 && command = "combo b"
trigger1 = var(50) = 0
trigger1 = movecontact
v = 11
value = 1
ignorehitpause = 1

[State var]
type = varset
triggerall = var(11) = 0
trigger1 = time > 3 && command = "combo x"
trigger1 = var(50) = 0
v = 11
value = 2
ignorehitpause = 1

[State var]
type = varset
triggerall = var(11) = 0
trigger1 = time > 3 && command = "combo y"
trigger1 = var(50) = 0
trigger1 = movecontact
v = 11
value = 3
ignorehitpause = 1

[State var]
type = selfstate
trigger1 = moveguarded = 2
trigger1 = p2bodydist x > 9 && enemy,backedgebodydist < 8
value = 269

[State var]
type = selfstate
triggerall = (movecontact = [2,7])
trigger1 = var(11) = 1
trigger2 = var(50) = 1 && random%8 < AILevel&& AILevel > 1+random%2
value = 2102

[State var]
type = selfstate
triggerall = (movecontact = [2,7])
trigger1 = var(11) = 2
trigger2 = var(50) = 1 && random%12 < AILevel&& AILevel > 1+random%2
value = 2002

[State var]
type = selfstate
triggerall = (movecontact = [2,7])
trigger1 = var(11) = 3
trigger2 = var(50) = 1 && random%12 < AILevel&& AILevel > 1+random%2
value = 2103

[State var]
type = targetlifeadd
trigger1 = movecontact > 2
trigger1 = var(11) = 0 && target,life < 2
trigger1 = var(9) = 0 || var(19) = 1
value = -1
kill = 1

[State end]
type = changeanim
triggerall = animelem = 4
trigger1 = !movecontact
trigger1 = p2statetype = L
value = anim
elem = 5

[State end]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1



;Dial-a-combo set 1
[Statedef 2002]
type    = S
movetype= A
physics = S
ctrl = 0
velset = 0,0
sprpriority = 2


[State var]
type = varset
trigger1 = animelemno(0) = 1
trigger2 = !animtime
trigger3 = !time
v = 11
value = 0

[State 620, 145]
type = varset
trigger1 = 1
v = 47
value = 0
ignorehitpause = 1

[State ]
type = movehitreset
trigger1 = animelemtime(1) >= 0
trigger1 = animelemtime(2) < 0


[State sound]
type = PlaySnd
trigger1 = anim = 2003 && animelem = 5
value = f5, 153

[State ]
type = Hitdef
trigger1 = anim = 2002
triggerall = !movecontact
damage = 30,10
getpower = 0,0
givepower = 0,0
pausetime = 0,2
attr = S,SA
guardflag = M
animtype = light
air.animtype = back
priority = 4, hit
sparkno = -1
guard.sparkno = -1
sparkxy = 0, 0
hitsound = S1338,2
guardsound = S5,14
ground.type = high
air.type = high
ground.slidetime = 12
ground.hittime = 20
guard.hittime = 12
ground.velocity = 0, 0
guard.velocity = -4
air.velocity = -5, -3
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
yaccel = .5
air.fall = 1
fall.recover = 0
fall.xvelocity = 0
fall.yvelocity = 0
envshake.time = 16
envshake.freq = 60
envshake.ampl = 7
forcestand = 1

[State ]
type = Hitdef
trigger1 = anim = 2004
triggerall = !movecontact
damage = 30,10
getpower = 0,0
givepower = 0,0
pausetime = 2,2
attr = S,SA
guardflag = M
animtype = light
air.animtype = back
priority = 4, hit
sparkno = -1
guard.sparkno = -1
sparkxy = 0, 0
hitsound = S1338,2
guardsound = S5,14
ground.type = high
air.type = high
ground.slidetime = 12
ground.hittime = 20
guard.hittime = 12
ground.velocity = 0, 0
guard.velocity = -4
air.velocity = -5, -3
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
yaccel = .5
air.fall = 1
fall.recover = 0
fall.xvelocity = 0
fall.yvelocity = 0
forcestand = 1



[State var]
type = targetvelset
trigger1 = movehit = [1,12]
trigger1 = target,stateno = [5000,5012]
triggerall = anim != 2003
x = -2
ignorehitpause = 1

[State var]
type = targetvelset
trigger1 = moveguarded && target,hitover = 0
x = -4-(anim = 2003)
ignorehitpause = 1

[State var]
type = targetvelset
trigger1 = !movecontact && target,statetype != A
trigger1 = var(11) > 0 && animelemno(0) != 1
x = 0



[State 430, 2]
type = HitDef
trigger1 = !MoveContact && anim = 2003
attr = S, NA
damage    = 40, 10
animtype  = Back
hitflag = MAF ;HAF
guardflag = HL
pausetime = 1,2
sparkno = 1
sparkxy = -20,-90
guard.sparkno = 40
hitsound   = S1338,2
p2facing = 1
guardsound = S5,14
ground.cornerpush.veloff = 0;-25
ground.type = High
guard.ctrltime = 24
guard.slidetime = 24
ground.slidetime = 24
ground.hittime  = 24
ground.velocity = -2,-12
air.velocity = -2,-12
yaccel = 0.375
envshake.time = 16
envshake.freq = 60
envshake.ampl = 7
fall.recover = 0
fall = 1
priority = 1, Miss

[State ]
type = changestate
trigger1 = movehit = [2,12]
trigger1 = anim = 2003
triggerall = enemy,backedgebodydist < 40
trigger1 = roundstate = 2
value = 259
ignorehitpause = 1
persistent = 0

[State ]
type = changeanim
triggerall = roundstate = 2
trigger1 = anim = 2001
triggerall = abs(p2dist y) < 20
triggerall = time = 1
value = 2002

[State ]
type = changeanim
triggerall = roundstate = 2
trigger1 = anim = 2101
triggerall = abs(p2dist y) < 20
triggerall = time = 1
value = 2004

[State var]
type = varset
triggerall = animelemtime(2) > 0 && var(11) = 0 && abs(p2dist y) < 20
trigger1 = anim = 2002 && command = "combo a"
trigger2 = anim = 2004 && command = "combo x"
trigger3 = movecontact && var(50) = 1 && random%8 < AILevel
trigger3 = anim = 2002 || anim = 2004
v = 11
value = 1
ignorehitpause = 1



[State shake]
type = envshake
trigger1 = anim = 2003
trigger1 = moveguarded
time = 16
freq = 70
ampl = 3
persistent = 0

[State ]
type = changeanim
triggerall = roundstate = 2
triggerall = (movecontact = [1,7]) && animelemtime(2) > 0
trigger1 = var(11) = 1 && anim = 2002
value = 2003

[State ]
type = changeanim
triggerall = roundstate = 2
triggerall = (movecontact = [1,7]) && animelemtime(2) > 0
trigger1 = var(11) = 1 && anim = 2004
value = 2002

[State var]
type = targetlifeadd
trigger1 = movecontact > 2
trigger1 = var(11) = 0 && target,life < 2
trigger1 = var(9) = 0 || var(19) = 1
value = -1
kill = 1

[State end]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1

;---------------------------------------------------------

;Dial-a-combo set 2
[Statedef 2003]
type    = S
movetype= A
physics = S
ctrl = 0
velset = 0,0
sprpriority = 2

[State var]
type = varset
trigger1 = animelemno(0) = 1
trigger2 = !animtime
trigger3 = !time
v = 11
value = 0

[State 620, 145]
type = varset
trigger1 = 1
v = 47
value = 0
ignorehitpause = 1

[State ]
type = movehitreset
trigger1 = animelemtime(1) >= 0
trigger1 = animelemtime(2) < 0


[State ]
type = changeanim
triggerall = roundstate = 2
trigger1 = anim = 2001
triggerall = abs(p2dist y) < 20
triggerall = time = 1
value = 2007

[State sound]
type = PlaySnd
trigger1 = anim = 2008 && animelem = 3
value = S5,153

[State ]
type = Hitdef
trigger1 = anim = 2007
triggerall = !movecontact
damage = 30,10
getpower = 0,0
givepower = 0,0
pausetime = 2,2
attr = S,SA
guardflag = M
animtype = light
air.animtype = back
priority = 4, hit
sparkno = -1
guard.sparkno = -1
sparkxy = 0, 0
hitsound = S1338,2
guardsound = S5,14
ground.type = high
air.type = high
ground.slidetime = 12
ground.hittime = 20
guard.hittime = 12
ground.velocity = 0, 0
guard.velocity = -4
air.velocity = -5, -3
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
yaccel = .5
air.fall = 1
fall.recover = 0
fall.xvelocity = 0
fall.yvelocity = 0
forcestand = 1

[State ]
type = Hitdef
trigger1 = anim = 2008
triggerall = !movecontact
damage = 30,10
getpower = 0,0
givepower = 0,0
pausetime = 2,2
attr = S,SA
guardflag = M
animtype = light
air.animtype = back
priority = 4, hit
sparkno = -1
guard.sparkno = -1
sparkxy = 0,0
hitsound = S1338,2
guardsound = S5,14
ground.type = high
air.type = high
ground.slidetime = 12
ground.hittime = 20
guard.hittime = 12
ground.velocity = 0, 0
guard.velocity = -4
air.velocity = -5, -3
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
yaccel = .5
air.fall = 1
fall.recover = 0
fall.xvelocity = 0
fall.yvelocity = 0
envshake.time = 16
envshake.freq = 70
envshake.ampl = 3
forcestand = 1

[State ]
type = Hitdef
trigger1 = anim = 2104
triggerall = !movecontact
damage = 30,10
getpower = 0,0
givepower = 0,0
pausetime = 2,2
attr = S,NA
hitflag = MAD
guardflag = M
animtype = light
air.animtype = back
priority = 4, hit
sparkno = -1
guard.sparkno = -1
sparkxy = 0, 0
hitsound = S1338,2
guardsound = S5,14
ground.type = high
air.type = high
ground.slidetime = 12
guard.slidetime = 12
ground.hittime = 16
guard.hittime = 12
ground.velocity = -1, 0
air.velocity = -3.5, -6
guard.velocity = -9.5
air.cornerpush.veloff = -5
ground.cornerpush.veloff = 0
yaccel = .5
air.fall = (p2statetype != L)
fall.recover = 0
fall.xvelocity = 0
fall.yvelocity = 0
guard.cornerpush.veloff = -10
forcestand = 1
p2facing = 1

[State ]
type = Hitdef
triggerall = anim = 2105
trigger1 = !movecontact
damage = 30,10
getpower = 0,0
givepower = 0,0
pausetime = 2,2
attr = S,SA
guardflag = M
animtype = light
air.animtype = back
priority = 4, hit
sparkno = -1
guard.sparkno = -1
sparkxy = 0, 0
hitsound = S1338,2
guardsound = S5,14
ground.type = high
air.type = high
ground.slidetime = 12
ground.hittime = 20
guard.hittime = 12
ground.velocity = 0, 0
guard.velocity = -3
air.velocity = -5, -3
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
yaccel = .5
air.fall = 1
fall.recover = 0
fall.xvelocity = 0
fall.yvelocity = 0
envshake.time = 16
envshake.freq = 60
envshake.ampl = 7
forcestand = 1

[State 240, 2]
type = HitDef
trigger1 = !movecontact && anim = 2106
attr = S,NA
animtype  = Back
damage = 40,10
guardflag = HL
hitflag = MAF
pausetime = 2,2
sparkno = 1
sparkxy = -25,-85
guard.sparkno = 40
hitsound = S1338,2
guardsound = S5,14
ground.type = High
ground.slidetime = 24
p2facing = 1
guard.ctrltime = 24
guard.slidetime = 24
ground.hittime  = 24
ground.velocity = -10,-8            
air.velocity = -10,-8
air.hittime = 24  
ground.cornerpush.veloff = -25
fall.recover = 0
envshake.time = 16
envshake.freq = 60
envshake.ampl = 7
yaccel = 0.5
priority = 1, Miss


[State shake]
type = envshake
trigger1 = anim = 2106
trigger1 = moveguarded
time = 16
freq = 70
ampl = 7
persistent = 0

[State var]
type = targetvelset
trigger1 = movehit = [1,12]
trigger1 = target,stateno = [5000,5012]
triggerall = anim != 2106
x = -2
ignorehitpause = 1

[State var]
type = targetvelset
trigger1 = moveguarded && target,hitover = 0
x = -4-(anim = 2106)
ignorehitpause = 1

[State var]
type = targetvelset
trigger1 = !movecontact && target,statetype != A
trigger1 = var(11) > 0 && animelemno(0) != 1
x = 0

[State var]
type = varset
triggerall = animelemtime(2) > 0 && var(11) = 0 && abs(p2dist y) < 20
trigger1 = anim = 2007 && command = "combo x"
trigger2 = anim = 2008 && command = "combo b"
trigger3 = anim = 2104 && command = "combo y"
trigger4 = anim = 2105 && command = "combo y" && command = "holdfwd"
trigger5 = movecontact && var(50) = 1 && random%8 < AILevel
trigger5 = anim = 2007 || anim = 2008 || anim = 2104 || anim = 2105
v = 11
value = 1
ignorehitpause = 1

[State ]
type = changeanim
triggerall = roundstate = 2
triggerall = (movecontact = [1,7]) && animelemtime(2) > 0
trigger1 = var(11) = 1 && anim = 2007
value = 2008

[State ]
type = changeanim
triggerall = roundstate = 2
triggerall = (movecontact = [1,7]) && animelemtime(2) > 0
trigger1 = var(11) = 1 && anim = 2008
value = 2104

[State ]
type = changeanim
triggerall = roundstate = 2
triggerall = (movecontact = [1,7]) && animelemtime(2) > 0
trigger1 = var(11) = 1 && anim = 2104
value = 2105

[State ]
type = changeanim
triggerall = roundstate = 2
triggerall = (movecontact = [1,7]) && animelemtime(2) > 0
trigger1 = var(11) = 1 && anim = 2105
value = 2106

[State var]
type = targetlifeadd
trigger1 = movecontact > 2
trigger1 = var(11) = 0 && target,life < 2
trigger1 = var(9) = 0 || var(19) = 1
value = -1
kill = 1

[State end]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1

;------------------------------------------------------------

;Dial-a-combo set 3
[Statedef 2102]
type    = S
movetype= A
physics = S
ctrl = 0
velset = 0,0
sprpriority = 2


[State var]
type = varset
trigger1 = animelemno(0) = 1
trigger2 = !animtime
trigger3 = !time
v = 11
value = 0

[State 620, 145]
type = varset
trigger1 = 1
v = 47
value = 0
ignorehitpause = 1

[State ]
type = movehitreset
trigger1 = animelemtime(1) >= 0
trigger1 = animelemtime(2) < 0

[State ]
type = posadd
trigger1 = animelem = 2 && anim != 2006
x = 10

[State ]
type = sprpriority
trigger1 = anim = 2006 && animelemno(0) = [4,7]
value = -3
ignorehitpause = 1

[State ]
type = Hitdef
triggerall = anim = 2102
trigger1 = !movecontact
damage = 30,10
getpower = 0,0
givepower = 0,0
pausetime = 2,2
attr = S,SA
guardflag = M
animtype = light
air.animtype = back
priority = 4, hit
sparkno = -1
guard.sparkno = -1
sparkxy = 0, 0
hitsound = S1338,2
guardsound = S5,14
ground.type = high
air.type = high
ground.slidetime = 12
ground.hittime = 20
guard.hittime = 12
ground.velocity = 0, 0
guard.velocity = -3
air.velocity = -5, -3
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
yaccel = .5
air.fall = 1
fall.recover = 0
fall.xvelocity = 0
fall.yvelocity = 0
envshake.time = 16
envshake.freq = 60
envshake.ampl = 7
forcestand = 1


[State ]
type = Hitdef
triggerall = anim = 2005
trigger1 = !movecontact
damage = 30,10
getpower = 0,0
givepower = 0,0
pausetime = 1,2
attr = S,SA
guardflag = M
animtype = light
air.animtype = back
priority = 4, hit
sparkno = -1
guard.sparkno = -1
sparkxy = 0, 0
hitsound = S1338,2
guardsound = S5,14
ground.type = high
air.type = high
ground.slidetime = 12
ground.hittime = 20
guard.hittime = 12
ground.velocity = 0, 0
guard.velocity = -4
air.velocity = -5, -3
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
yaccel = .5
air.fall = 1
fall.recover = 0
fall.xvelocity = 0
fall.yvelocity = 0
envshake.time = 16
envshake.freq = 60
envshake.ampl = 7
forcestand = 1


[State 240, 2]
type = HitDef
trigger1 = !movecontact
trigger1 = anim = 2103 || anim = 2006
attr = S, NA
animtype  = Back
damage    = 30, 10
guardflag = M
hitflag = MAF
pausetime = 1,2
sparkno = 1
sparkxy = -25,-90
guard.sparkno = 40
hitsound = S1338,2
guardsound = S5,14
ground.type = High
ground.slidetime = 24
p2facing = 1
guard.ctrltime = 24
guard.slidetime = 24
ground.hittime  = 24
ground.velocity = -4,-8            
air.velocity = -4,-8
air.hittime = 17  
ground.cornerpush.veloff = 0
fall.recover = 0
fall = 1
envshake.time = 16
envshake.freq = 60
envshake.ampl = 7
yaccel = 0.5
priority = 1, Miss


[State var]
type = targetvelset
trigger1 = movehit = [1,12]
trigger1 = target,stateno = [5000,5012]
triggerall = anim != 2103 && anim != 2006
x = -2
ignorehitpause = 1

[State var]
type = targetvelset
trigger1 = moveguarded && target,hitover = 0
x = -4
ignorehitpause = 1

[State var]
type = targetvelset
trigger1 = !movecontact && target,statetype != A
trigger1 = var(11) > 0 && animelemno(0) != 1
x = 0

[State 430, 1]
type = PlaySnd
trigger1 = anim = 2103 && animelem = 5
trigger2 = anim = 2006 && animelem = 5
value = S5, 151


[State shake]
type = envshake
trigger1 = anim != 2103 && anim != 2006
trigger1 = moveguarded
time = 16
freq = 70
ampl = 3
persistent = 0

[State ]
type = changeanim
triggerall = roundstate = 2
trigger1 = anim = 2101
trigger1 = abs(p2dist y) < 20
triggerall = time = 1
value = 2102

[State var]
type = varset
triggerall = animelemtime(2) > 0 && var(11) = 0 && anim = 2102 && abs(p2dist y) < 20
trigger1 = var(50) = 0 && command = "combo a" && command = "holdback"
trigger2 = movecontact && var(50) = 1 && random%12 < AILevel
v = 11
value = 2

[State var]
type = varset
triggerall = animelemtime(2) > 0 && var(11) = 0 && abs(p2dist y) < 20
trigger1 = var(50) = 0 && anim = 2102 && command = "combo y" && command = "holdback"
trigger2 = var(50) = 0 && anim = 2005 && command = "combo y" && command = "holdback"
trigger3 = movecontact && var(50) = 1 && random%8 < AILevel
trigger3 = anim = 2102 || anim = 2005
v = 11
value = 1

[State ]
type = changeanim
triggerall = roundstate = 2
triggerall = (movecontact = [1,7]) && animelemtime(2) > 0
trigger1 =  var(11) = 1 && anim = 2102
value = 2103

[State ]
type = changeanim
triggerall = roundstate = 2
triggerall = (movecontact = [1,7]) && animelemtime(2) > 0
trigger1 =  var(11) = 2 && anim = 2102
value = 2005

[State ]
type = changeanim
triggerall = roundstate = 2
triggerall = (movecontact = [1,7]) && animelemtime(2) > 0
trigger1 =  var(11) = 1 && anim = 2005
value = 2006

[State var]
type = targetlifeadd
trigger1 = movecontact > 2
trigger1 = var(11) = 0 && target,life < 2
trigger1 = var(9) = 0 || var(19) = 1
value = -1
kill = 1

[State end]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1

;------------------------------------------------------------

;Dial-a-combo set 4
[Statedef 2103]
type    = S
movetype= A
physics = S
ctrl = 0
velset = 0,0
sprpriority = 2

[State var]
type = varset
trigger1 = animelemno(0) = 1
trigger2 = !animtime
trigger3 = !time
v = 11
value = 0

[State 620, 145]
type = varset
trigger1 = 1
v = 47
value = 0
ignorehitpause = 1

[State ]
type = movehitreset
trigger1 = animelemtime(1) >= 0
trigger1 = animelemtime(2) < 0


[State ]
type = changeanim
triggerall = roundstate = 2
trigger1 = anim = 2101
trigger1 = abs(p2dist y) < 20
triggerall = time = 1
value = 2105

[State sound]
type = PlaySnd
trigger1 = anim = 2110 && animelem = 4
value = S5,153

[State ]
type = Hitdef
triggerall = anim = 2105 || anim = 2108 || anim = 2109
trigger1 = !movecontact
damage = 30,10
getpower = 0,0
givepower = 0,0
pausetime = 2,2
attr = S,SA
guardflag = M
animtype = light
air.animtype = back
priority = 4, hit
sparkno = -1
guard.sparkno = -1
sparkxy = 0, 0
hitsound = S1338,2
guardsound = S5,14
ground.type = high
air.type = high
ground.slidetime = 12
ground.hittime = 20
guard.hittime = 12
ground.velocity = 0, 0
guard.velocity = -3
air.velocity = -5, -3
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
yaccel = .5
air.fall = 1
fall.recover = 0
fall.xvelocity = 0
fall.yvelocity = 0
envshake.time = 16
envshake.freq = 60
envshake.ampl = 7
forcestand = 1

[State 240, 2]
type = HitDef
trigger1 = !movecontact && anim = 2110
attr = S,NA
animtype  = Back
damage = 40,10
guardflag = HL
hitflag = MAF
pausetime = 2,2
sparkno = 1
sparkxy = -30,-85
guard.sparkno = 40
hitsound = S1338,2
guardsound = S5,14
ground.type = High
ground.slidetime = 24
p2facing = 1
guard.ctrltime = 24
guard.slidetime = 24
ground.hittime  = 24
ground.velocity = -10,-8
air.velocity = -10,-8
air.hittime = 17  
ground.cornerpush.veloff = -30
fall.recover = 0
fall = 1
envshake.time = 16
envshake.freq = 60
envshake.ampl = 7
yaccel = 0.5
priority = 1, Miss

[State 600, 1.5]
type = targetvelset
trigger1 = p2stateno = 21239
x = -6
ignorehitpause = 1


[State shake]
type = envshake
trigger1 = anim = 2110
trigger1 = moveguarded
time = 16
freq = 70
ampl = 7
persistent = 0

[State var]
type = targetvelset
trigger1 = movehit = [1,12]
trigger1 = target,stateno = [5000,5012]
triggerall = anim != 2110
x = -2
ignorehitpause = 1

[State var]
type = targetvelset
trigger1 = moveguarded && target,hitover = 0
x = -5-(anim = 2110)
ignorehitpause = 1

[State var]
type = targetvelset
trigger1 = !movecontact && target,statetype != A
trigger1 = var(11) > 0 && animelemno(0) != 1
x = 0

[State var]
type = varset
triggerall = animelemtime(2) > 0 && var(11) = 0 && abs(p2dist y) < 20
trigger1 = var(50) = 0 && anim = 2105 && command = "combo b"
trigger2 = var(50) = 0 && anim = 2108 && command = "combo y"
trigger3 = var(50) = 0 && anim = 2109 && command = "combo x" && command = "holdfwd"
trigger4 = movecontact && var(50) = 1 && random%8 < AILevel
trigger4 = anim = 2105 || anim = 2108 || anim = 2109
v = 11
value = 1

[State ]
type = changeanim
triggerall = roundstate = 2
triggerall = (movecontact = [1,7]) && animelemtime(2) > 0
trigger1 =  var(11) = 1 && anim = 2105
value = 2108

[State ]
type = changeanim
triggerall = roundstate = 2
triggerall = (movecontact = [1,7]) && animelemtime(2) > 0
trigger1 =  var(11) = 1 && anim = 2108
value = 2109

[State ]
type = changeanim
triggerall = roundstate = 2
triggerall = (movecontact = [1,7]) && animelemtime(2) > 0
trigger1 =  var(11) = 1 && anim = 2109
value = 2110

[State var]
type = targetlifeadd
trigger1 = movecontact > 2
trigger1 = var(11) = 0 && target,life < 2
trigger1 = var(9) = 0 || var(19) = 1
value = -1
kill = 1

[State end]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1