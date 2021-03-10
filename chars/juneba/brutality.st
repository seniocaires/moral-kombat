;------------------
[Statedef 2200]
type    = S
movetype= A
physics = S
poweradd= 0
ctrl = 0
velset = 0,0
anim = 2001
sprpriority = 2
facep2 = 1

; constant part--
[State var]
type = varset
trigger1 = time = 0 && prevstateno != [2200,2299]
v = 11
value = 0

[State var]
type = varset
trigger1 = time = 0 && prevstateno != [2200,2299]
v = 12
value = 0

[State 0, Explod]
type = assertspecial
trigger1 = 1
flag = nomusic
ignorehitpause = 1

[State sound]
type = PlaySnd
trigger1 = time = 2
value = f5, 20

[State ]
type = posset
trigger1 = time = 0
y = var(57)

[State 1610, 1]
type = PosAdd
trigger1 = time = 2 && p2bodydist x > 10
x = 15

[State 2, blood111]
type = Helper
trigger1 = movehit
ID = 27
stateno = 7223
pos = -10, -120
postype = p2
persistent = 0
ignorehitpause = 1
;--

;animation part
[State 1610, 1]
type = changeanim
trigger1 = time = 0 && var(11) = 0 
value = 2001

[State 1610, 1]
type = changeanim
trigger1 = time = 0 && var(11) = 1 
value = 2001

[State 1610, 1]
type = changeanim
trigger1 = time = 0 && var(11) = 2 
value = 2002
elem = 2

[State 1610, 1]
type = changeanim
trigger1 = time = 0 && var(11) = 3 
value = 2003
elem = 2

[State 1610, 1]
type = changeanim
trigger1 = time = 0 && var(11) = 4 
value = 240
elem = 2

[State 1610, 1]
type = changeanim
trigger1 = time = 0 && var(11) = 5 
value = 430
elem = 3

[State 1610, 1]
type = changeanim
trigger1 = time = 0 && var(11) = 6 
value = 2101

[State 1610, 1]
type = changeanim
trigger1 = time = 0 && var(11) = 7 
value = 225
elem = 3

[State 1610, 1]
type = changeanim
trigger1 = time = 0 && var(11) = 8 
value = 210
elem = 3

[State 1610, 1]
type = changeanim
trigger1 = time = 0 && var(11) = 9 
value = 2003

;-----


;command input part
[State 0, Explod]
type = varadd
triggerall = ifelse(command = "x", time > 4, 1)
trigger1 = var(12) = 0 && (command = "combo a"||command = "x")
trigger2 = var(12) = 1 && (command = "combo y"||command = "x")
trigger3 = var(12) = 2 && (command = "combo b"||command = "x")
trigger4 = var(12) = 3 && (command = "combo x"||command = "x")
trigger5 = var(12) = 4 && (command = "combo a"||command = "x")
trigger6 = var(12) = 5 && (command = "combo b"||command = "x")
trigger7 = var(12) = 6 && (command = "combo y"||command = "x")
trigger8 = var(12) = 7 && (command = "combo x"||command = "x")
trigger9 = var(12) = 8 && (command = "combo b"||command = "x")
trigger10 = var(12) = 9 && (command = "combo b"||command = "x")&& time > 4
trigger11 = var(50) = 1 && random%14 < AILevel; AI brutality
v = 12
value = 1
ignorehitpause = 1
;--

;
[State ]
type = Hitdef
trigger1 = !movecontact
pausetime = 4,3
attr = S,SA
hitflag = MAF
priority = 4, hit
sparkno = -1
hitsound = 5,0
ground.type = high
air.type = high
ground.slidetime = 10
guard.slidetime = 15
ground.hittime = 40
guard.hittime = 15
ground.velocity = -2, 0
ground.cornerpush.veloff = 0
guard.velocity = -2
p2facing = 1
envshake.time = 8
envshake.freq = 110
envshake.ampl = 6
p2stateno = 2202
numhits = 0

[State var]
type = selfstate
trigger1 = movecontact = 3
value = 2201

[Statedef 2201]; hit counter
type    = S
movetype= A
physics = S
ctrl = 0

[State 0, Explod]
type = assertspecial
trigger1 = 1
flag = nomusic
ignorehitpause = 1

[State var]
type = varadd
trigger1 = time = 0
v = 11
value = 1

[State var]
type = selfstate
trigger1 = var(12) >= var(11) && var(11) < 10
value = 2200

[State var]
type = selfstate
trigger1 = var(12) >= var(11) && var(11) = 10
value = 3300

[State end]
type = changeanim
trigger1 = animtime = -1
value = anim
elem = animelemno(0)

[State end]
type = selfstate
trigger1 = time > 60
value = 0
ctrl = 1

;---------------------
[Statedef 3300]; brutal finish
type    = S
movetype= A
physics = N
poweradd= 0
ctrl = 0
anim = 2400
sprpriority = 2
velset = 1,0

[State ]
type = Explod
triggerall = stagevar(info.name) != "thr0ner00m"
triggerall = stagevar(info.name) != "thr0ner00m_b055"
triggerall = stagevar(info.name) != "w1nd_w0rld"
trigger1 = !time
ID = 11011
anim = 888
removetime = -1
persistent = 0

[State 0, Explod]
type = assertspecial
trigger1 = 1
flag = nomusic
ignorehitpause = 1

[State var]
type = varset
trigger1 = 1
v = 4
value = 5

[State 210, 1]
type = Playsnd
trigger1 = time = 3
value = F5,10
channel = 1

[State ]
type = Helper
trigger1 = p2stateno = 2202 && enemy,time = 1
helpertype = Normal
stateno = 7223
pos = -10,-120
postype = p2
ignorehitpause = 1
ownpal = 1

[State ]
type = Hitdef
trigger1 = 1
pausetime = 4,2
attr = S,SA
hitflag = MAF
priority = 4, hit
sparkno = -1
hitsound = 5,0
ground.type = high
air.type = high
ground.slidetime = 10
guard.slidetime = 15
ground.hittime = 40
guard.hittime = 15
ground.velocity = -2, 0
ground.cornerpush.veloff = 0
guard.velocity = -2
p2facing = 1
envshake.time = 8
envshake.freq = 110
envshake.ampl = 8
p2stateno = 2202
numhits = 0

[State end]
type = selfstate
trigger1 = animelem = 51
value = 3301