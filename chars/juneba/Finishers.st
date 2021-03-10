;------------------------
; fatal - we have explosive
;------------------------
[Statedef 3000]
type    = S
movetype= A
physics = S
juggle  = 2
ctrl = 0
velset = 0,0
sprpriority = 2

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

[State 9130, SetFatal]
type = Varset
trigger1 = time = 1
V = 4
value = 1

[State 430, 31]
type = changeanim
trigger1 = Time < 30
value = anim
elem = animelemno(0)

[State 1200, chg]
type = changeanim
trigger1 = time = 30
value = 3000

[State 210, 1]
type = Playsnd
trigger1 = anim = 3000 && animelem = 4
value = 31,0
channel = 3

[State 1200, BoltFat]
type = Hitdef
trigger1 = !movecontact
attr = S, HA
hitflag = MAFD
pausetime = 0,0
sparkno = -1
p2stateno = 3010
hitsound   = -1
numhits = 0

[State 200, 7]
type = targetbind
trigger1 = anim = 3000 && animelem = 5
pos = 46,0
time = 1
ignorehitpause = 1
persistent = 0

[State 200, 7]
type = changestate
trigger1 = time = 130
value = 3001

[Statedef 3001]; jump away
type    = A
movetype= A
physics = N
juggle  = 2
ctrl = 0
velset = 0,0

[State 200, 7]
type = playerpush
trigger1 = 1
value = 0

[State 200, 7]
type = playsnd
trigger1 = time = 7
value = 31,1
channel = 3

[State 9251, dynamite]
type = Helper
trigger1 = time = 0
postype = p2
pos = 0,-87
stateno = 3003
facing = -1

[State 1200, chg]
type = turn
trigger1 = time = 1 && backedgedist > 80

[State 200, 7]
type = posadd
trigger1 = time = 1
x = p2dist x

[State 1200, chg]
type = changeanim
trigger1 = time = 1
value = 42

[State 9130, SetFatal]
type = Veladd
trigger1 = time = 1
x = 6
y = -9.5

[State 1200, chg]
type = veladd
trigger1 = anim = 42
y = 0.5

[State 200, 7]
type = changestate
trigger1 = vel y > 0 && pos y > var(57)
value = 3002

[Statedef 3002]; jump landed
type    = S
movetype= A
physics = S
juggle  = 2
anim = 3001
ctrl = 0
velset = 0,0
facep2 = 1

[State 200, 7]
type = posset
trigger1 = time = 0
y = var(57)

[State 200, 7]
type = playsnd
trigger1 = time = 0
value = f20,0

[State 200, 7]
type = changeanim
trigger1 = time = 180
value = 3002

[State 200, 7]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1

[Statedef 3003]; fire wire
type    = S
movetype= A
physics = N
juggle  = 2
anim = 3004
ctrl = 0
velset = 0,0
sprpriority = 0

[State 0, Explod]
type = explod
trigger1 = time = 0
anim = 3003
ID = 3001
sprpriority = 1
scale = const(size.xscale),const(size.yscale)
bindtime = -1
ownpal = 1
shadow = -1,-1,-1

[State 0, Explod]
type = explod
trigger1 = time = 0
anim = 3005
ID = 3002
sprpriority = 3
scale = 0.6,0.6
bindtime = 1
removetime = -1
ownpal = 1

[State 0, Explod]
type = modifyexplod
trigger1 = animelemno(0) = 1
ID = 3002
pos = -40,84
postype = p1

[State 0, Explod]
type = modifyexplod
trigger1 = animelemno(0) = 2
ID = 3002
pos = -37,74
postype = p1

[State 0, Explod]
type = modifyexplod
trigger1 = animelemno(0) = 3
ID = 3002
pos = -29,67
postype = p1

[State 0, Explod]
type = modifyexplod
trigger1 = animelemno(0) = 4
ID = 3002
pos = -30,55
postype = p1

[State 0, Explod]
type = modifyexplod
trigger1 = animelemno(0) = 5
ID = 3002
pos = -34,43
postype = p1

[State 0, Explod]
type = modifyexplod
trigger1 = animelemno(0) = 6
ID = 3002
pos = -30,37
postype = p1

[State 0, Explod]
type = modifyexplod
trigger1 = animelemno(0) = 7
ID = 3002
pos = -26,27
postype = p1

[State 0, Explod]
type = modifyexplod
trigger1 = animelemno(0) = 8
ID = 3002
pos = -31,20
postype = p1

[State 0, Explod]
type = modifyexplod
trigger1 = animelemno(0) = 9
ID = 3002
pos = -30,16
postype = p1

[State 0, Explod]
type = removeexplod
trigger1 = animelem = 10
ID = 3002

[State 0, Explod]
type = removeexplod
trigger1 = movecontact
ID = 3001

[State 200, 7]
type = changeanim
trigger1 = animtime = 0
value = 9000

[State 200, 7]
type = playsnd
trigger1 = anim = 3004 && time%7 = 0
value = 30,0
volumescale = 200

[State 200, 7]
type = playsnd
trigger1 = movecontact = 2
value = 30,1
volumescale = 200

[State 1200, BoltFat]
type = Hitdef
trigger1 = !movecontact
attr = S, HA
hitflag = MAFD
pausetime = 0,0
sparkno = -1
p2stateno = 3011
hitsound   = s30,1
numhits = 0

[State 9251, blood]
type = Helper
trigger1 = movecontact = [2,18]
postype = p2
pos = 0,-80
stateno = 6907

[State 9251, blood]
type = Helper
trigger1 = movecontact
postype = p2
pos = 0,-60
stateno = 7471
persistent = 0

[State 9251, blood]
type = Helper
trigger1 = movecontact = 2
trigger2 = movecontact = 4
postype = p2
pos = 0,-80
stateno = 7473

[State 9251, blood]
type = Helper
trigger1 = movecontact = [2,24]
trigger1 = time%3 = 0
postype = p2
pos = 0,-70
stateno = 7475

[State 9251, blood]
type = Helper
trigger1 = movecontact = [2,24]
trigger1 = time%3 = 1
postype = p2
pos = 0,-70
stateno = 7478

[State 9251, blood]
type = Helper
trigger1 = movecontact = [2,24]
trigger1 = time%3 = 2
postype = p2
pos = 0,-70
stateno = 7483

[State 9251, blood]
type = Helper
trigger1 = movecontact = [2,24]
trigger1 = time%4 = 0
postype = p2
pos = 0,-70
stateno = 7477

[State 9251, blood]
type = Helper
trigger1 = movecontact = [2,24]
trigger1 = time%4 = 2
postype = p2
pos = 0,-50
stateno = 7480

[State 9251, blood]
type = Helper
trigger1 = movecontact
postype = p2
pos = 0,-60
stateno = 7482
persistent = 0

[State 9251, blood]
type = Helper
trigger1 = movecontact = 3
trigger2 = movecontact = 4
postype = p2
pos = 0,-90
stateno = 7481
facing = 1-2*(movecontact = 4)


[State 0, Explod]
type = explod
trigger1 = movecontact = 4
anim = 3006
sprpriority = 4
;scale = 0.6,0.6
bindtime = 1
ownpal = 1

[State 0, Explod]
type = explod
trigger1 = time%2 = 0
trigger1 = movecontact = [2,24]
anim = 1010
sprpriority = 3
scale = 0.6,0.6
bindtime = 1
facing = 1-2*(random%2)
vfacing = 1-2*(random%2)
ownpal = 1
random = 80,90

[State 0, Explod]
type = explod
trigger1 = movecontact > 4
anim = 3007
sprpriority = 0
pos = 0,87
scale = 1,0.6
bindtime = 1
vel = 0.3*(random%7-random%7),-7
accel = 0,0.02
facing = 1-2*(random%2)
vfacing = 1-2*(random%2)
ownpal = 1
random = 12,6


;-------------------------------

[Statedef 3010]; p2 shakes
type    = S
movetype= H
physics = S
sprpriority = 0
ctrl = 0

[State 0, Explod]
type = changeanim
trigger1 = time > 30
value = 5300
elem = 3

[Statedef 3011]; p2 dies
type    = S
movetype= H
physics = S
sprpriority = 0
anim = 888
ctrl = 0

[State 200, 7]
type = envshake
trigger1 = time = 0
ampl = 8
freq = 70
time = 60

[State 200, 7]
type = envcolor
trigger1 = time = 0 || time = 6
value = 255,255,255
time = 4

[State 200, 7]
type = varset
trigger1 = time = 0
v = 26
value = 1

[State 200, 7]
type = lifeadd
trigger1 = time = 8
value = -9999

[State 200, 7]
type = selfstate
trigger1 = time = 9
value = 5150
;---------------------------




;=============================================

;------------------------
; fatal - aren't we clear
;------------------------
[Statedef 3100]
type    = S
movetype= A
physics = S
juggle  = 2
ctrl = 0
velset = 0,0

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

[State 9130, SetFatal]
type = Varset
trigger1 = time = 1
V = 4
value = 1

[State 430, 31]
type = changeanim
trigger1 = Time < 30
value = anim
elem = animelemno(0)

[State 1200, chg]
type = changeanim
trigger1 = time = 30
value = 3100

[State 1200, chg]
type = playsnd
trigger1 = time = 60
value = 31,2
channel = 3

[State 1200, chg]
type = changestate
trigger1 = time = 180
value = 3101


[Statedef 3101]
type    = S
movetype= A
physics = S
juggle  = 2
ctrl = 0
velset = 0,0
sprpriority = 2
anim = 3101

[State 1200, chg]
type = playsnd
trigger1 = time = 0
value = 30,2
volumescale = 200

[State 0, Explod]
type = explod
trigger1 = time = 0
anim = 3103
sprpriority = 1
scale = const(size.xscale),const(size.yscale)
bindtime = -1
ownpal = 0

[State 0, Explod]
type = explod
trigger1 = time = 0
anim = 3104
sprpriority = 0
scale = const(size.xscale),const(size.yscale)
bindtime = -1
ownpal = 1

[State 1200, BoltFat]
type = Hitdef
trigger1 = !movecontact
attr = S, HA
hitflag = MAFD
sparkno = -1
p2facing = 1
p2stateno = 3103
hitsound   = s20,9
numhits = 0
ground.cornerpush.veloff = -35
envshake.time = 180
envshake.freq = 60
envshake.ampl = 6

[State 1200, chg]
type = playsnd
trigger1 = movecontact%14 = 2
value = 30,3
volumescale = 200

[State 200, 7]
type = targetbind
trigger1 = movecontact
pos = 250,-2*(animelemno(0) = 4)
time = 1

[State 0, Explod]
type = explod
trigger1 = movecontact
anim = 3007
sprpriority = 3-5*(random%2)
pos = -6,-90
postype = p2
scale = 0.6,1
bindtime = 1
vel = 0,-4-0.5*(random%7)
accel = 0,0.02
facing = 1-2*(random%2)
vfacing = 1-2*(random%2)
ownpal = 1
random = 20,60

[State 200, 7]
type = changestate
trigger1 = time = 180
value = 3102

[Statedef 3102]
type    = S
movetype= A
physics = N
juggle  = 2
ctrl = 0
velset = 0,0
sprpriority = 2
anim = 3102


[State 200, 7]
type = targetstate
trigger1 = time = 0
value = 3104

[State 200, 7]
type = helper
trigger1 = time = 0
pos = 0,0
postype = p2
stateno = 3105

[State 200, 7]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1

[Statedef 3103];p2
type    = S
movetype= H
physics = N
juggle  = 1
velset = 0,0
anim = 5030
sprpriority = 0
ctrl = 0
facep2 = 1

[State 430, 31]
type = playsnd
trigger1 = time = 2
value = 4, 1
channel = 3

[State 430, 31]
type = changeanim
trigger1 = time = 1 && selfanimexist(5720)
value = 5720

[State 200, 7]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0,0

[State 867033, 3]
type = palfx
trigger1 = time = 1 && !selfanimexist(5721)
add = 60,60,120
sinadd = 255,255,255,12
color = 0
time = 9999

[State 867033, 3]
type = palfx
trigger1 = time = 1 && selfanimexist(5721)
add = -200,-200,-200
color = 0
time = 9999

[State 0, Explod]
type = Explod
trigger1 = time = 1 && selfanimexist(5721)
anim = 5721
ID = 323
scale = const(size.xscale), const(size.yscale)
bindtime = -1
removetime = -1
sprpriority = 1
ownpal = 1
removeongethit = 1

[Statedef 3104];p2 falls
type    = A
movetype= H
physics = N
juggle  = 1
velset = 0,0
anim = 5030
sprpriority = 0
ctrl = 0

[State 0, Explod]
type = removeExplod
trigger1 = time = 0
ID = 323

[State 867033, 3]
type = palfx
trigger1 = time = 0
add = -60,-60,-60
color = 0
time = 9999

[State 867033, 3]
type = lifeadd
trigger1 = time = 0
value = -9999

[State 867033, 3]
type = veladd
trigger1 = time = 1
y = -2

[State 867033, 3]
type = selfState
trigger1 = time = 1
value = 5050

[Statedef 3105]; smoke
type    = A
movetype= I
physics = N
juggle  = 1
anim = 888
ctrl = 0

[State 0, Explod]
type = explod
trigger1 = time < 30
anim = 3007
sprpriority = 2-4*(random%2)
pos = -10,-70
scale = 0.6,1
bindtime = 1
vel = 0,-4-0.5*(random%7)
accel = 0,0.02
facing = 1-2*(random%2)
vfacing = 1-2*(random%2)
ownpal = 1
random = 40,60

[State 0, Explod]
type = explod
trigger1 = time > 30
anim = 3007
sprpriority = 6-4*(random%2)
pos = -20,-6
scale = 1,0.6
bindtime = 1
vel = 0,-2-0.5*(random%7)
accel = 0,0.02
facing = 1-2*(random%2)
vfacing = 1-2*(random%2)
ownpal = 1
random = 90,20



;------------------------
; fatal - fire at will
;------------------------
[Statedef 3200]
type    = S
movetype= A
physics = S
juggle  = 2
ctrl = 0
velset = 0,0

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

[State 430, 31]
type = changeanim
trigger1 = Time < 30
value = anim
elem = animelemno(0)

[State 9130, SetFatal]
type = Varset
trigger1 = time = 1
V = 4
value = 1

[State 1200, chg]
type = changeanim
trigger1 = time = 30
value = 3200

[State 1200, chg]
type = playsnd
trigger1 = anim = 3200 && animelem = 5
value = f5,15

[State 1200, BoltFat]
type = Hitdef
trigger1 = !movecontact
attr = S, HA
hitflag = MAFD
animtype = back
air.animtype = back
fall = 1
sparkno = -1
p1stateno = 3201
ground.velocity = -2,-12
yaccel = 0.5225
hitsound   = 5,0
p2facing = 1

[Statedef 3201]
type    = S
movetype= A
physics = S
juggle  = 2
ctrl = 0
velset = 0,0
sprpriority = 2


[State 210, 1]
type = Playsnd
trigger1 = animelem = 13
value = 30,7
volumescale = 200

[State 0, Explod]
type = explod
trigger1 = animelem = 16
anim = 3202
ID = 3003
sprpriority = 3
scale = const(size.xscale),const(size.yscale)
bindtime = -1
removetime = -1
ownpal = 1
persistent = 0

[State 0, Explod]
type = playsnd
trigger1 = animelem = 16
value = 30,4
channel = 0
loop = 1
volumescale = 200
persistent = 0

[State 1200, chg]
type = targetstate
trigger1 = animelem = 17
value = 3203

[State 200, 7]
type = helper
trigger1 = animelem = 17 && random%3 > 0
pos = -10, -75
postype = p2
stateno = 7150+52*(random%2)
facing = -1

[State 200, 7]
type = helper
trigger1 = animelem = 17; && random%2 = 1
stateno = 30

[State 0, Explod]
type = explod
trigger1 = animelem = 17
anim = 3203
sprpriority = 4
pos = p2dist x + 10,-106
;postype = p2
;facing = -1
vfacing = 1-2*(random%2)
scale = 0.7,0.5
;bindtime = 12
ownpal = 1

[State 200, 7]
type = playsnd
trigger1 = animelem = 17
value = 30,5 + (random%4 = 0)



[State 200, 7]
type = changestate
trigger1 = time = 240
value = 3202


[Statedef 3202]
type    = S
movetype= A
physics = S
juggle  = 2
anim = 888
ctrl = 0
velset = 0,0
sprpriority = 1

[State 0, Explod]
type = explod
trigger1 = time < 60
anim = 3007
sprpriority = 2-2*(random%2)
scale = 0.1,1
facing = 1-2*(random%2)
vfacing = 1-2*(random%2)
bindtime = 3
vel = 0.1*(random%7-random%5),-3
accel = 0,0.02
pos = 82,-118
ownpal = 1
trans = addalpha
alpha = 60,240


[State 1200, chg]
type = varset
trigger1 = time = 0
v = 26
value = 1

[State 1200, chg]
type = targetstate
trigger1 = time = 0
value = 3211


[State 0, Explod]
type = removeexplod
trigger1 = time = 0
ID = 3003


[State 0, Explod]
type = stopsnd
trigger1 = time = 0
channel = 0

[State 0, Explod]
type = explod
trigger1 = time = 0
anim = 3201
sprpriority = 1
scale = const(size.xscale),const(size.yscale)
bindtime = -1
shadow = -1,-1,-1

[State 210, 1]
type = Playsnd
trigger1 = time = 60
value = 30,7
volumescale = 200

[State 200, 7]
type = changestate
trigger1 = time = 60
value = 0
ctrl = 1

;-------------------------------

[Statedef 3203]; p2 shot
type    = S
movetype= H
physics = S
sprpriority = 0
velset = -10,0.125
ctrl = 0

[State -1, fatal]
type = envshake
trigger1 = time = 0
time = 8
ampl = 2
freq = 110


[State -1, fatal]
type = Changeanim
trigger1 = time = 0
value = ifelse(anim = 21238, 5030, 21238)

[State 210, 1]
type = Playsnd
trigger1 = time = 2 && prevstateno != 3203
value = 4,1
channel = 3

[State 200, 7]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0,0

[Statedef 3211]; p2 dies
type    = S
movetype= H
physics = S
anim = 888
velset = 0,0
ctrl = 0

[State 200, 7]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0,0

[State 200, 7]
type = posset
trigger1 = time = 0
y = var(57)

[State 200, 7]
type = varset
trigger1 = time = 0
v = 26
value = 1

[State 200, 7]
type = lifeadd
trigger1 = time = 25
value = -9999

[State 200, 7]
type = posadd
trigger1 = time = 24
x = p2dist x - 60

[State 200, 7]
type = selfstate
trigger1 = time = 26
value = 5150

;------------------------
;       Fatality 4
;------------------------

[Statedef 3400]
type    = S
movetype= A
physics = S
velset = 0,0
ctrl = 0

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

[State ]
type = changeanim
trigger1 = Time < 60
value = anim
elem = animelemno(0)

[State ]
type = Varset
trigger1 = time = 1
V = 4
value = 1

[State ]
type = PlaySnd
trigger1 = time = 45
value = 20,21
volumescale = 200

[State ]
type = changeanim
trigger1 = time = 60
value = 3400

[State ]
type = Explod
trigger1 = anim = 3400 && animelem = 6
anim = 1601
pos = 0,0
scale = const(size.xscale),const(size.yscale)
sprpriority = 4
removetime = 90
bindtime = -1
ownpal = 1
removeongethit = 1

[State ]
type = PlaySnd
trigger1 = anim = 3400 && animelem = 6 ; глючит у компа в начале фаталки
value = 20,20
volumescale = 255

[State ]
type = Hitdef
trigger1 = !movecontact
attr = S,HA
hitflag = MAFD
animtype = back
sparkno = -1
p1stateno = 3401
p2stateno = 3404
yaccel = 0.5
hitsound = 5,141
palfx.time = 120
palfx.add = 20+140*(var(46)>0)+90*(var(46)=1),100,160
palfx.sinadd = -120,-120,-120,8
palfx.color = 0
p2facing = 1

[Statedef 3401]
type    = S
movetype= I
physics = S
velset = 0,0
ctrl = 0
anim = 3401
sprpriority = 2

[State ]
type = playsnd
trigger1 = time = 0
value = 20,16
channel = 0
volumescale = 255

[State ]
type = Explod
trigger1 = time%16 = 3 && time < 100
anim = 1603
pos = -10,-90
postype = p2
facing = 1-2*(random%2)
vfacing = 1-2*(random%2)
bindtime = -1
random = 12,50
sprpriority = 3
ownpal = 1

[State ]
type = Explod
trigger1 = time%3 = 0 && time < 100
anim = 1604
pos = -10,-80
postype = p2
facing = 1-2*(random%2)
vfacing = 1-2*(random%2)
bindtime = 3
vel = 0,-1-0.3*(random%7)
accel = 0,0.02
random = 40,60
scale = 0.67,1
sprpriority = 1-2*(random%2)
ownpal = 1

[State ]
type = stopsnd
trigger1 = time = 120
channel = 0

[State ]
type = PlaySnd
trigger1 = time = 121
value = 20,22
volumescale = 200

[State ]
type = PlaySnd
trigger1 = time = 128
value = 20,13
volumescale = 200

[State ]
type = envshake
trigger1 = time = 0
ampl = 2
freq = 60
time = 120

[State ]
type = playsnd
trigger1 = Time = 144
value = 20,12
volumescale = 160
channel = 0

[State ]
type = envshake
trigger1 = time = 144
time = 14
freq = 70
ampl = 1

[State ]
type = Helper
trigger1 = time = 144
helpertype = normal
stateno = 3402
pos = 0*const(size.xscale),0*const(size.yscale)
ownpal = 1

[State ]
type = StopSnd
trigger1 = time = 169
channel = 0

[State ]
type = helper
trigger1 = target,stateno = 3405 && time = 155
stateno = 31
id = 31
pos = -50,0
postype = p2
facing = 1

[State ]
type = helper
trigger1 = time = 155
stateno = 7450
pos = 0,-115
postype = p2
facing = -1

[State ]
type = helper
trigger1 = target,stateno = 3405 && time = 155
stateno = 7440
pos = 0,-92
postype = p2
facing = 1

[State ]
type = helper
trigger1 = target,stateno = 3405 && time > 155 && time < 175
stateno = 6907
pos = 0,-90
postype = p2
facing = -1

[State ]
type = helper
trigger1 = target,stateno = 3405 && time > 155 && time < 157
stateno = 6908
pos = 0,-90
postype = p2
facing = -1

[State ]
type = helper
trigger1 = target,stateno = 3405 && time > 155 && time < 157
stateno = 6909
pos = 0,-90
postype = p2
facing = -1

[State ]
type = helper
trigger1 = target,stateno = 3405 && time = 155
stateno = 7481
pos = 0,-90
postype = p2
facing = -1

[State ]
type = helper
trigger1 = target,stateno = 3405 && time > 156 && time < 160
stateno = 7475
pos = 0,-90
postype = p2
facing = -1

[State ]
type = helper
trigger1 = target,stateno = 3405 && time > 156 && time < 160
stateno = 7476
pos = 0,-90
postype = p2
facing = -1

[State ]
type = helper
trigger1 = target,stateno = 3405 && time > 156 && time < 160
stateno = 7477
pos = 0,-90
postype = p2
facing = -1

[State ]
type = helper
trigger1 = target,stateno = 3405 && time > 156 && time < 160
stateno = 7478
pos = 0,-90
postype = p2
facing = -1

[State ]
type = changestate
trigger1 = time = 300
value = 0
ctrl = 1

[Statedef 3402]
type    = S
movetype= A
physics = N
velset = 0,0
anim = 1401
ctrl = 0

[State ]
type = velset
trigger1 = animelem = 5 && time > 1
x = 8

[State ]
type = hitdef
trigger1 = !movecontact
attr = S,NP
damage = 240,0
animtype = Light
hitflag = M
sparkno = -1
hitsound = S20,8
yaccel = 0.5
p2stateno = 3405

[State ]
type = envshake
trigger1 = movehit
ampl = 3
freq = 60
time = 30

[State ]
type = envcolor
trigger1 = movehit
time = 3
value = 255,255,255
persistent = 0

[State ]
type = selfState
trigger1 = movehit
value = 3403
ignorehitpause = 1

[Statedef 3403]
type    = S
movetype= A
physics = N
velset = 0,0
anim = 1402
ctrl = 0
sprpriority = 4

[State ]
type = posset
trigger1 = time < 12 && target,movetype = H
x = target,pos x

[State ]
type = destroyself
trigger1 = animtime = 0

[Statedef 3404]
type = S
movetype = H
physics = N
velset = 0,0
anim = 21238
ctrl = 0
sprpriority = 2

[State ]
type = PlaySnd
trigger1 = time = 0
value = 4,1
channel = 3

[State ]
type = veladd
trigger1 = time = 120
x = -5

[Statedef 3405]
type = S
movetype = H
physics = N
velset = 0,0
anim = 5000
ctrl = 0
sprpriority = 2

[State ]
type = varset
trigger1 = time = 0
v = 26
value = 1

[State ]
type = PlaySnd
trigger1 = time = 0
value = 3,2
volumescale = 255
channel = 3

[State ]
type = Explod
trigger1 = time = 0
anim = 5812
scale = const(size.xscale),const(size.yscale)
sprpriority = 2
ownpal = 1
ignorehitpause = 1
shadow = -1,-1,-1

[State ]
type = lifeadd
trigger1 = time = 29
value = -9999

[State ]
type = selfstate
trigger1 = time = 30
value = 5150

;-------------------------------------
; Hara-kiri
;-------------------------------------

[Statedef 3500]
type    = S
movetype= A
physics = S
juggle  = 2
ctrl = 0
velset = 0,0
sprpriority = 2

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

[State 430, 31]
type = changeanim
trigger1 = Time = 0
value = 3500
elem = animelemno(0)

[State 430, 31]
type = changeanim
trigger1 = Time = 60
value = 3501

[State 430, 31]
type = turn
trigger1 = Time = 60 && p2dist x < 0

[State 430, 31]
type = playsnd
trigger1 = anim = 3501 && animelem = 6
value = 20,2

[State 430, 31]
type = playsnd
trigger1 = time = 120
value = 33,0
volumescale = 200

[State 430, 31]
type = envshake
trigger1 = time = 120
time = 32
freq = 90
ampl = 6

[State 0, Explod]
type = Explod
trigger1 = time = 120
anim = 3503
bindtime = 24
pos = 2,-129
facing = -1
scale = 1,0.8
sprpriority = 5
ownpal = 1
ignorehitpause = 1


[State 0, Explod]
type = Explod
trigger1 = time = 150
anim = 3502
bindtime = 1
sprpriority = -1
ownpal = 1
ignorehitpause = 1
shadow = -1,-1,-1

[State 430, 31]
type = varset
trigger1 = time = 149
v = 26
value = 1


[State 3010, 1]
type = HitDef
trigger1 = !movecontact
attr = S, HA
hitflag = MAF
priority = 7
sparkno = -1
hitsound = -1
p2stateno = 3599


[State 3010, 1]
type = varset
trigger1 = 1
v = 4
value = 6


[State 200, 7]
type = posadd
trigger1 = time = 186
x = 120

[State 200, 7]
type = lifeadd
trigger1 = time = 187
value = -9999

[State 200, 7]
type = selfstate
trigger1 = time = 188
value = 5110


[Statedef 3599]
type    = S
movetype= I
physics = S
juggle  = 2
ctrl = 0
velset = 0,0
facep2 = 1

[State -3, hara]
type = changeanim
trigger1 = time = 1 && anim != [180,189]
value = 0

[State 200, 7]
type = varset
trigger1 = time = 0
v = 4
value = 6

[State 200, 7]
type = posset
trigger1 = anim = 0
y = var(57)

[State 2, Upperblood]
type = Helper
trigger1 = enemy,time = 120
stateno = 7410
pos = 2, -129
facing = -1
postype = p2
ignorehitpause = 1

[State 2, Upperblood]
type = Helper
trigger1 = enemy,time = 120
stateno = 7150
pos = 2, -129
facing = -1
postype = p2
ignorehitpause = 1

[State 2, Upperblood]
type = Helper
trigger1 = enemy,time = 186
stateno = 7444
pos = 178, 2
postype = p2
ignorehitpause = 1

[State 200, 7]
type = assertspecial
trigger1 = 1
flag = nomusic

[State 200, 7]
type = selfstate
trigger1 = time = 230
value = 180
ctrl = 1



;-------------------------------------
;Friendship... Friendship? Again?
;-------------------------------------

[Statedef 3700]
type    = S
movetype= A
physics = S
juggle  = 2
ctrl = 0
velset = 0,0
sprpriority = 0

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

[State 430, 31]
type = changeanim
trigger1 = Time < 60
value = anim
elem = animelemno(0)

[State 430, 31]
type = changeanim
trigger1 = Time = 60
value = 3700

[State 9130, SetFatal]
type = Varset
trigger1 = time = 0
V = 4
value = 3

[State 430, 31]
type = playsnd
trigger1 = anim = 3700 && animelem = 2
value = 32, 0
volumescale = 200

[State 430, 31]
type = envshake
trigger1 = anim = 3700 && animelem = 10
time = 180
freq = 90
ampl = 1

[State 430, 31]
type = stopsnd
trigger1 = anim = 3700 && animelem = 6
channel = -1

[State 430, 31]
type = playsnd
trigger1 = anim = 3700 && animelem = 6
value = f5, 50
volumescale = 200

[State 430, 31]
type = playsnd
trigger1 = anim = 3700 && animelem = 7
value = 31, 3
volumescale = 90

[State 0, Explod]
type = Explod
trigger1 = anim = 3700 && animelem = 10
anim = 3701
bindtime = 1
scale = const(size.xscale),const(size.yscale)
sprpriority = 0
ownpal = 0
ignorehitpause = 1
removetime = -1
shadow = -1,-1,-1

[State 0, Explod]
type = Explod
trigger1 = anim = 3700 && animelem = 7
anim = 3702 + (facing = -1)
bindtime = 1
scale = const(size.xscale),const(size.yscale)
sprpriority = 1
ownpal = 1
ignorehitpause = 1
removetime = -1
shadow = -1,-1,-1


[State 9130, SetFatal]
type = Varset
trigger1 = anim = 3700 && animelem = 10
V = 26
value = 1

[State 3010, 1]
type = HitDef
trigger1 = !movecontact
attr = S, HA
hitflag = MAF
priority = 7
sparkno = -1
hitsound = -1
p2stateno = 3701

[State 2, Upperblood]
type = Helper
trigger1 = time > 60 && var(26) = 0 && numhelper(3033) < 19
stateno = 3702
ID = 3033
pos = -backedgedist -160 -20*numhelper(3033), 0
ownpal = 1

[State 200, 7]
type = selfstate
trigger1 = time = 300
value = 0
ctrl = 1


[Statedef 3701]
type    = S
movetype= H
physics = S
juggle  = 2
ctrl = 0
velset = 0,0

[State 430, 31]
type = stopsnd
trigger1 = time < 30
channel = 3


[State 430, 31]
type = turn
trigger1 = facing != enemy,facing && time = 121

[State 0, Explod]
type = Explod
trigger1 = time = 121
anim = 100
bindtime = 1
vel = 8,0
scale = const(size.xscale),const(size.yscale)
sprpriority = 0
ownpal = 0
ignorehitpause = 1
removetime = -1
shadow = -1,-1,-1

[State 9130, SetFatal]
type = Varset
trigger1 = time = 120
V = 26
value = 1

[State 3010, 1]
type = lifeadd
trigger1 = time = 121
value = -9999

[State 200, 7]
type = selfstate
trigger1 = time = 122
value = 5150

[Statedef 3702]; random char running
type    = S
movetype= I
physics = N
anim = 3710+gametime%19
ctrl = 0
velset = 0,0
sprpriority = 2

[State 430, 31]
type = veladd
trigger1 = root,anim = 3700 && root,animelem = 10
x = 7+0.25*(random%9)

[State 430, 31]
type = posadd
trigger1 = time = 0
x = 32*(random%4-random%12)

[State 430, 31]
type = angledraw
trigger1 = anim = 3726 || anim = 3727|| anim = 3729|| anim = 3733
scale = 0.98,0.98

[State -2, 34]
type = Playsnd
triggerall = frontedgedist > -120 && backedgedist > -30
trigger1 = animelem = 4 || animelem = 10
value = f5,320 + random%2
volumescale = 200

[State 430, 31]
type = changeanim
triggerall = time = 1;vel x > 0
trigger1  = anim = 3710 && p2name = "nightwolf"
trigger2  = anim = 3711 && p2name = "kabal"
trigger3  = anim = 3712 && p2name = "sheeva"
trigger4  = anim = 3713 && p2name = "sindel"
trigger5  = anim = 3714 && p2name = "sub-zero"
trigger6  = anim = 3715 && (p2name = "kung_lao"||p2name = "kung lao"||p2name = "kunglao")
trigger7  = anim = 3716 && (p2name = "shang_tsung"||p2name = "shang tsung"||p2name = "shangtsung")
trigger8  = anim = 3717 && (p2name = "liu_kang"||p2name = "liu kang"||p2name = "liukang")
trigger9  = anim = 3718 && p2name = "jax"
trigger10 = anim = 3719 && p2name = "kano"
trigger11 = anim = 3720 && p2name = "sonya"
trigger12 = anim = 3721 && p2name = "sektor"
trigger13 = anim = 3722 && p2name = "cyrax"
trigger14 = anim = 3723 && p2name = "smoke"
trigger15 = anim = 3724 && p2name = "kitana"
trigger16 = anim = 3725 && p2name = "cage"
trigger17 = anim = 3726 && p2name = "baraka"
trigger18 = anim = 3727 && (p2name = "raiden"||p2name = "rayden")
trigger19 = anim = 3728 && p2name = "scorpion"
value = 3729+random%5

;-----------------------------------
; AI Uppercut after Finish Him/Her
;-----------------------------------

[Statedef 3796]
type    = S
movetype= A
physics = S
velset = 0,0
anim = 0
ctrl = 0

[State ]
type = ChangeState
trigger1 = !time
value = 3798
ctrl = 0

[Statedef 3797]
type    = S
movetype= A
physics = S
velset = 0,0
anim = 20
ctrl = 0

[State ]
type = VelSet
trigger1 = time > 0
x = 3

[State ]
type = ChangeState
trigger1 = p2bodydist X < 2
value = 3798;-1797*(random%2)
ctrl = 0

[Statedef 3798]
type    = S
movetype= A
physics = S
velset = 0,0
anim = 0
ctrl = 0

[State ]
type = ChangeState
triggerall = numhelper(6969) > 0
trigger1 = time = 1
value = 4000-201*(random%2)
ctrl = 0

[State ]
type = ChangeState
trigger1 = time > 1
value = 3799-1698*(random%2)
ctrl = 0

[Statedef 3799]
type    = S
movetype= A
physics = S
velset = 0,0
ctrl = 0

[State ]
type = ChangeState
trigger1 = time > 17
value = 430
ctrl = 0

;-------------------------------------
; Animality
;-------------------------------------

[Statedef 3800]
type    = S
movetype= A
physics = S
juggle  = 2
ctrl = 0
velset = 0,0
sprpriority = 0

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

[State 430, 31]
type = changeanim
trigger1 = Time < 60
value = anim
elem = animelemno(0)

[State 430, 31]
type = changeanim
trigger1 = Time = 60
value = 3800

[State 430, 31]
type = playsnd
trigger1 = Time = 50
value = f5,51

[State 9130, SetFatal]
type = Varset
trigger1 = time = 0
V = 4
value = 4

[State 0, Explod]
type = playsnd
trigger1 = time = 70
value = 30,10
volumescale = 80
channel = 3

[State 9130, SetFatal]
type = changestate
trigger1 = time = 180
value = 3801

[Statedef 3801]
type    = S
movetype= A
physics = N
juggle  = 2
ctrl = 0
velset = 0,0
anim = 3801
sprpriority = 6

[State 430, 31]
type = playsnd
trigger1 = Time = 0
value = f5,52
channel = 1
volumescale = 200
loop = 1

[State 430, 31]
type = playsnd
trigger1 = time = 3
value = 30,11

[State 3010, 1]
type = HitDef
trigger1 = !movecontact
attr = S,HA
hitflag = MAF
priority = 7
sparkno = -1
hitsound = 5,106
p2stateno = 3803
p2facing = 1
sprpriority = 6

[State ]
type = playsnd
trigger1 = movehit
value = 30,12
volumescale = 200
ignorehitpause = 1
persistent = 0

[State ]
type = playsnd
trigger1 = movehit = [2,4]
value = 30,8
volumescale = 200

[State 0, TargetBind]
type = TargetBind
trigger1 = movehit
time = 6
pos = 80,0
persistent = 0

[State ]
type = Helper
trigger1 = movehit = 2 || movehit = 9 || movehit = 16 || movehit = 23
stateno = 7460
pos = 80, -80
postype = p1
ignorehitpause = 1
ownpal = 1

[State ]
type = Helper
trigger1 = movehit = 2 && target,selfanimexist(5812) = 1
stateno = 7440
pos = 0, -70
postype = p2
ignorehitpause = 1
persistent = 0
ownpal = 1

[State ]
type = Helper
trigger1 = movehit = 2 && target,selfanimexist(5812) = 1
stateno = 7450
pos = 0, -80
postype = p2
ignorehitpause = 1
persistent = 0
ownpal = 1

[State ]
type = Helper
trigger1 = movehit = 2 && target,selfanimexist(5812) = 0
stateno = 7442
pos = 0, -50
postype = p2
ignorehitpause = 1
persistent = 0
ownpal = 1

[State ]
type = Helper
trigger1 = movehit = 2 && target,selfanimexist(5812) = 0
stateno = 6900
pos = 0, -90
postype = p2
ignorehitpause = 1
persistent = 0
ownpal = 1

[State 200, 7]
type = selfstate
trigger1 = time = 180
value = 3802

[Statedef 3802]
type    = S
movetype= A
physics = N
juggle  = 2
ctrl = 0
velset = 0,0
anim = 3802
sprpriority = 4

[State 430, 31]
type = changeanim
trigger1 = time = 36
value = 0

[State 430, 31]
type = playsnd
trigger1 = Time = 26
value = f5,51

[State 200, 7]
type = selfstate
trigger1 = time = 40
value = 0
ctrl = 1

[Statedef 3803]
type    = S
movetype= H
physics = S
juggle  = 2
ctrl = 0
velset = 0,0
anim = 888

[State 0, Explod]
type = Explod
trigger1 = time = 0
anim = 5812+(selfanimexist(5813))
bindtime = 1
scale = const(size.xscale),const(size.yscale)
sprpriority = 4
ownpal = 0
ignorehitpause = 1
removetime = -1
shadow = -1,-1,-1

[State 0, Explod]
type = playsnd
trigger1 = time = 0
value = 3,2
channel = 3

[State 430, 31]
type = envshake
trigger1 = time = 0
freq = 70
time = 50
ampl = 8

[State 3010, 1]
type = varset
trigger1 = time = 1
v = 26
value = 1

[State Тряска экрана]
type = EnvShake
trigger1 = time = 89
freq = 48
time = 10
ampl = 4

[State Звук падающего тела]
type = PlaySnd
trigger1 = time = 90
value = f7,3

[State 3010, 1]
type = lifeadd
trigger1 = time = 90
value = -9999

[State 200, 7]
type = selfstate
trigger1 = time = 91
value = 5150