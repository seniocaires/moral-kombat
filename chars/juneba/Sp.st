;============================================================
;-----------------------------------;
;	   Low Grenade    	    ;
;-----------------------------------;
[Statedef 1000]
type    = S
movetype= A
physics = S
juggle  = 2
ctrl = 0
velset = 0,0
anim = 1000
sprpriority = 0

[State 1200, Sonido]
type = PlaySnd
trigger1 = animelem = 3
value = 20, 2
volumescale = 60

[State 2, helperbola]
type = Helper
trigger1 = animelem = 4
ID = 1001
stateno = 1001
pos = 19*const(size.xscale), -113*const(size.xscale)
ownpal = 1
persistent = 0
ignorehitpause = 1

[State 1200, 10]
type = ChangeState
trigger1 = AnimTime = 0
ctrl = 1
value = 0
;grenade
[Statedef 1001]
type    = S
movetype= A
physics = N
juggle  = 11
anim = 1001
sprpriority = 2

[State 1200, Sonido]
type = PlaySnd
trigger1 = time = 0
value = S20, 3
volumescale = 80

[State 1000, 0.12]
type = VelSet
trigger1 = time = 0
X = 8
Y = -3-3*(root,stateno = 1010)

[State 1000, 0.12]
type = Veladd
trigger1 = time > 0
Y = 0.375

[State 0, Explod]
type = angledraw
trigger1 = 1
value = 6*time
scale = 0.6,0.6


[State 1200, BoltFat]
type = hitdef
trigger1 = !movecontact
attr = S, NP
damage    = 80, 20
air.animtype = Back
hitflag = MAFD
guardflag = M
pausetime = 0,2
sparkno = -1
sparkxy = 0,0;20,-30
guard.sparkno = -1
hitsound   = S20,4
guardsound = S5,14
ground.velocity = -4,0
air.fall=1
air.velocity = -4,-5
air.juggle = 3
ground.hittime = 12
air.hittime = 12
guard.slidetime = 12
guard.dist = 100
yaccel = 0.5
p2facing = 1
hitonce = 1

[State 10000, rakieta]
type = Posadd
trigger1 = movecontact
x = 20
persistent = 0

[State 10000, rakieta]
type = changestate
trigger1 = movecontact
trigger2 = pos y > root,var(57)
value = 1002

; grenade hits
[Statedef 1002]
type    = S
movetype= A
physics = N
juggle  = 2
velset = 0,0
anim = 888

[State 10000, rakieta]
type = PlaySnd
trigger1 = time = 1
value = S4, 18
volumescale = 200

[State 9327, explod] 
type = Explod
trigger1 = time = 0
anim = 1010
scale = 0.8,0.8
sprpriority = 4
facing = 1-2*(random%2)
vfacing = 1-2*(random%2)
ownpal = 1

[State 9327, explod] 
type = Envshake
trigger1 = time = 0
freq = 60
ampl = 6
time = 16

[State var]
type = targetvelset
trigger1 = target,stateno = 21239
x = -4*ifelse(target,vel x < 0, 1, -1)

[State var]
type = targetvelset
trigger1 = target,stateno = [150,159]
x = -2

[State 10000, rakieta]
type = destroyself
trigger1 = time = 12
; grenade flies back
[Statedef 1003]
type    = S
movetype= A
physics = N
juggle  = 11
anim = 1001
sprpriority = 2

[State 1000, 0.12]
type = Velmul
trigger1 = time = 0
X = -1
Y = -0.67

[State 1000, 0.12]
type = Veladd
trigger1 = time > 0
Y = 0.375

[State 10000, rakieta]
type = posadd
trigger1 = time = 0
x = -10
y = 10
persistent = 0

[State 10000, rakieta]
type = turn
trigger1 = time = 0
persistent = 0

[State 0, Explod]
type = angledraw
trigger1 = 1
value = -12*time
scale = -0.6,0.6


[State 1200, BoltFat]
type = hitdef
trigger1 = !movecontact && time > 3
attr = S, HP
damage    = 210, 40
affectteam = F
air.animtype = Back
guardflag = HL
pausetime = 0,2
sparkno = -1
sparkxy = 0,0;20,-30
guard.sparkno = -1
hitsound   = S20,4
guardsound = 5,14
ground.velocity = -4,0
air.fall=1
air.velocity = -4,-5
air.juggle = 3
ground.hittime = 12
air.hittime = 12
guard.slidetime = 12
guard.dist = 90
yaccel = 0.5
p2facing = 1
p2stateno = 21238
kill       = (enemy,Var(9) = 0)
fall.kill  = (enemy,Var(9) = 0)
guard.kill = (enemy,Var(9) = 0)
hitonce = 1

[State 10000, rakieta]
type = Posadd
trigger1 = movecontact
x = 20
persistent = 0

[State 10000, rakieta]
type = changestate
trigger1 = movecontact
trigger2 = pos y > root,var(57)
value = 1002

;-----------------------------------;
;	   high Grenade    	    ;
;-----------------------------------;
[Statedef 1010]
type    = S
movetype= A
physics = S
juggle  = 2
ctrl = 0
velset = 0,0
anim = 1000
sprpriority = 0

[State 1200, Sonido]
type = PlaySnd
trigger1 = animelem = 2
value = S20, 2
volumescale = 60

[State 2, helperbola]
type = Helper
trigger1 = animelem = 3
ID = 1001
stateno = 1001
pos = 19*const(size.xscale), -108*const(size.xscale)
ownpal = 1
persistent = 0
ignorehitpause = 1

[State 1200, 10]
type = ChangeState
trigger1 = AnimTime = 0
ctrl = 1
value = 0


;---------------------------------------;

;gunfire!
[StateDef 1100]
type    = S
movetype= A
physics = S
juggle  = 4
velset = 0,0
ctrl = 0
anim = 1100
sprpriority = 0

[State 1200, ZappySound]
type = PlaySnd
trigger1 = AnimElem = 3
value = S20, 5
volumescale = 200
channel = 0

[State a1200, brightness]
type = Explod
trigger1 = animelem = 3
anim = 1102
ID = 1001
scale = const(size.xscale),const(size.yscale)
sprpriority  = 1
bindtime = -1
removetime = 30
ownpal = 1
removeongethit = 1

[State a1200, gun blasts]
type = Explod
trigger1 = animelem = 3
anim = 1101
ID = 1001
scale = 0.67*const(size.xscale),0.67*const(size.yscale)
pos = 23,-29
sprpriority  = 2
bindtime = -1
ownpal = 1
removeongethit = 1

[State 13130, BoltFat]
type = HitDef
trigger1 = !movecontact
attr = S, NP
damage    = 80, 30
animtype  = Back
hitflag = MAF
guardflag = M
pausetime = 0,12
sparkno = -1
sparkxy = -18,-100
guard.sparkno = -1
hitsound   = s20,9
p2facing = 1
guardsound = s5,14
ground.type = High
guard.ctrltime = 20
guard.slidetime = 20
guard.dist = 260
ground.slidetime = 20
ground.hittime  = 20
ground.velocity = -2,0
;ground.cornerpush.veloff = -25
air.velocity = -3.5,-6
yaccel = 0.5
fall.recover = 0
p2stateno = 1110
priority = 1,miss
hitonce = 1

[State 1200, ZappySound]
type = PlaySnd
trigger1 = moveguarded
value = S20, 6
volumescale = 200
persistent = 0

[State 1200, 10]
type = selfState
trigger1 = movehit
value = 1101


[State 1200, 10]
type = targetvelset
trigger1 = moveguarded = [2,12]
x = -2

[State a1200, 2at]
type = Explod
trigger1 = moveguarded
anim = 1110
pos = 0,-84
postype = p2
scale = 0.5,0.5
facing = -1
vfacing = 1-2*(random%2)
sprpriority  = 4
bindtime = -1
ownpal = 1
persistent = 0
removeongethit = 1

[State 1200, 10]
type = ChangeState
trigger1 = AnimTime = 0
ctrl = 1
value = 0

[StateDef 1101]
type    = S
movetype= A
physics = S
juggle  = 4
velset = 0,0
ctrl = 0
sprpriority = 0

[State 9327, explod] 
type = Envshake
trigger1 = time = 0
freq = 70
ampl = 4
time = 30

[State 1200, ZappySound]
type = PlaySnd
trigger1 = time = 0
value = S20, 5
volumescale = 200

[State 1200, ZappySound]
type = changeanim
trigger1 = time = 0
value = 1100
elem = 3+5*(target,statetype = A)

[State a1200, 2at]
type = removeExplod
trigger1 = time = 0
ID = 1001

[State a1200, 2at]
type = Explod
trigger1 = time = 0
anim = 1101
scale = 0.67*const(size.xscale),0.67*const(size.yscale)
pos = 23,-29
sprpriority  = 2
removetime = 30-15*(target,statetype = A)
bindtime = -1
ownpal = 1
removeongethit = 1

[State a1200, 2at]
type = Explod
trigger1 = time = 0
anim = 1102
scale = const(size.xscale),const(size.yscale)
sprpriority  = 1
bindtime = -1
removetime = 30-15*(target,statetype = A)
ownpal = 1
removeongethit = 1


[State 1200, ZappySound]
type = PlaySnd
trigger1 = time < 49 && time%6 = 0
value = S20, 7
;volumescale = 60

[State 1200, ZappySound]
type = PlaySnd
trigger1 = time < 49 && time%6 = 3
value = S20, 8
;volumescale = 60


[State 1200, 10]
type = ChangeState
trigger1 = AnimTime = 0
ctrl = 1
value = 0

[StateDef 1102]
type    = S
movetype= H
physics = S
juggle  = 4
velset = 0,0
ctrl = 0
sprpriority = 0


[State 1200, ZappySound]
type = PlaySnd
trigger1 = time = 0
value = S20, 6
volumescale = 200

[State 1200, ZappySound]
type = PlaySnd
trigger1 = time%12 = 0
value = S20, 7
;volumescale = 60

[State 1200, ZappySound]
type = PlaySnd
trigger1 = time > 12 && time%12 = 6
value = S20, 8
;volumescale = 60

[State 1200, ZappySound]
type = changeanim
trigger1 = time = 0
value = 1100
elem = 3

[State a1200, 2at]
type = removeExplod
trigger1 = time = 0
ID = 1001

[State a1200, 2at]
type = Explod
trigger1 = time = 0
anim = 1101
scale = 0.67*const(size.xscale),0.67*const(size.yscale)
pos = 23,-29
sprpriority  = 2
bindtime = 12
ownpal = 1
removetime = 12

[State a1200, 2at]
type = Explod
trigger1 = time = 0
anim = 1102
ID = 1001
scale = const(size.xscale),const(size.yscale)
sprpriority  = 1
bindtime = -1
removetime = 12
ownpal = 1
removeongethit = 1


[State a1200, 2at]
type = Explod
trigger1 = time = 0
anim = 1110
pos = 10,-84
postype = p2
scale = 1,0.5
facing = -1
vfacing = 1-2*(random%2)
sprpriority  = 4
bindtime = -1
ownpal = 1
persistent = 0
removeongethit = 1

[State 1200, ZappySound]
type = PlaySnd
trigger1 = time = 12
value = 3, 0 + random%3
channel = 3

[State 7100, lluvia de sangre]
type = lifeadd
trigger1 = time = 12
value = -200
kill = 1



[State ]
type = selfstate
trigger1 = animtime = 0
trigger1 = alive = 1 && life = 1 && enemy,var(59) = 1
value = 9001


[State 7100, lluvia de sangre]
type = Explod
trigger1 = time > 12 && time%6 = 1
anim = 888
ID = 17405
removetime = 1

[State 1200, 10]
type = Changeanim
trigger1 = Time = 12
value = 21238

[State 1200, 10]
type = velset
trigger1 = Anim = 21238
x = -3

[State 1200, 10]
type = ChangeState
trigger1 = Time = 60
ctrl = 1
value = 0
;p2
[Statedef 1110]
type    = U
movetype= H
physics = N
juggle  = 2
velset = 0,0
anim = 5000

[State 1200, ZappySound]
type = Posadd
trigger1 = time = 0 && pos y < var(57)
y = 20

[State 820, 4351]
type = varadd
Trigger1 = time = 0
v = 20
value = floor((100*gethitvar(damage))/lifemax)

[State 820, 4351]
type = varadd
Trigger1 = time = 0
v = 21
value = 1


[state 0, throw up protection]
type = defencemulset
trigger1 = 1
value = 0.5


[State 88500, inv off]
type = stopsnd
trigger1 = time = 40 
channel = 3

[State 88500, inv off]
type = velset
trigger1 = time > 0
x = -3
persistent = 0

[State 88500, inv off]
type = posset
trigger1 = pos y > var(57)
y = var(57)

[State 88500, inv off]
type = VarSet
trigger1 = time = 0 
v = 17
value = 0

[State 88500, Fall]
type = changeanim
trigger1 = time = 48
value = 5035

[State 88500, Fall]
type = changeanim
trigger1 = anim = 5035 && animtime = 0
value = 5050

[State 88500, Fall]
type = selfState
triggerall = time = 48
trigger1 = statetype = S || pos y = var(57)
value = 0
ctrl = 1

[State 88500, Fall]
type = veladd
trigger1 = time > 48
y = 0.5

[State 88500, Fall]
type = selfState
trigger1 = vel y > 0 && pos y >= var(57)
value = 5110

;---------------------------------------;
;gunslide!
[Statedef 1200]
type    = A
movetype= A
physics = N
juggle  = 0
velset = 0,0
ctrl = 0
anim = 1200
sprpriority = 2

[State 1200, ZappySound]
type = PlaySnd
trigger1 = time = 0
value = S20, 10
channel = 0

[State 800, 2]
type = veladd
Trigger1 = time = 0
x = 12
y = -2

[State 600, 1.5]
type = varset
trigger1 = time = 0
fv = 2
value = 1
persistent = 0
ignorehitpause = 1

[State 600, 1.5]
type = varset
trigger1 = time > 0
fv = 2
value = fvar(2)*0.984375
ignorehitpause = 1

[State 800, 2]
type = veladd
Trigger1 = time > 0
x = -0.1875*fvar(2)
y = 0.140625

[State 800, 2]
type = varset
Trigger1 = !movecontact
v = 11
value = ifelse(enemy,var(21) < 3&&enemy,numexplod(1188) = 0, 320, 160-20*(enemy,numexplod(118) > 0))

[State 800, 2]
type = null;statetypeset
Trigger1 = enemy,numexplod(1188) > 0
movetype = I

[State 800, 1]
type = HitDef
Trigger1 = !movecontact
damage = 90,30
pausetime = 0,0
attr = S, NT          ;Attributes: Standing, Normal Throw
hitflag = HAF          ;Affect only ground people who are not being hit
guardflag = M
priority = 1, Miss    ;Throw has low priority, must be miss or dodge type.
hitsound = s20,0
guardsound = S5,14
sparkno = -1          ;No spark
p1sprpriority = -1      ;Draw in front of p2
p2facing = 1       ;Force p2 to face KFM
p2stateno = 1202
guard.dist = 0        ;This prevents p2 from going into a guard state if close
sparkno = -1
guard.sparkno = -1
fall = 1
fall.recover = 0
hitonce = 1

[State 800, 2]
type = playerpush
Trigger1 = time < 18
value = 0

[State 800, 2]
type = screenbound
Trigger1 = time < 18
value = 0
movecamera = 1,0


[State 800, 2]
type = changeanim
Trigger1 = time > 2 && p2stateno = [120,159] 
value = 1210

[State 800, 2]
type = selfState
Trigger1 = movehit
value = 1201

[State 800, 2]
type = selfState
Trigger1 = moveguarded
value = 1203

[State 800, 2]
type = null;posadd
Trigger1 = time = 18 && p2dist x > 0
x = ifelse(p2bodydist x < 30, p2bodydist x, 30)+10*(p2statetype = A)

[State 800, 2]
type = selfState
;Trigger1 = time = 18
trigger1 = pos y >= var(57)-6 && vel y > 0
value = 52
anim = ifelse(p2dist x < 0,5,0)

;-------------

[Statedef 1201]
type    = S
movetype= A
physics = N
anim = 1201
sprpriority = 0
velset = 0,0

[State -2, 34]
type = Playsnd
trigger1 = animelem = 3
value = S4,13
channel = 3

[State -2, 34]
type = Playsnd
trigger1 = animelem = 4
value = S20,1

[State 810, Bind 7]
type = posset
trigger1 = time = 0
y = var(57)


[State 810, Bind 7]
type = posadd
trigger1 = time = 0
x = 30
persistent = 0

[State 810, Bind 7]
type = TargetBind
trigger1 = time = 0
pos = 0, 0
time = 10
persistent = 0


[State 810, State End]
type = ChangeState
trigger1 = Animtime =  0
value = 0
ctrl = 1

;p2
[Statedef 1202]
type    = A
movetype= H
physics = N
velset = 0,0
sprpriority = 1

[State -2, invoff]
type = varset
trigger1 = time = 0
v = 17
value = 0

[State 820, 4351]
type = varadd
Trigger1 = time = 0
v = 21
value = 1

[State 820, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 1202

[State 820, 4351]
type = posAdd
Trigger1 = anim = 1202 && animelem = 6
x = 0
y = -88

[State 820, 4351]
type = velAdd
Trigger1 = anim = 1202 && animelem = 6
x = 8
y = -6

[State 820, 4351]
type = velAdd
Trigger1 = anim = 1202 && animelemtime(6) > 0
y = 0.5


[State 821, 4] ;Hit ground
type = SelfState
trigger1 = pos y > var(57) && vel y > 0
value = 5110


;---------------------
[StateDef 1203]; Blocked
type    = A
movetype= I
physics = N
ctrl = 0
velset = -1,-8
sprpriority = 2
anim = 1203

[State 2000, 4]
type = playsnd
trigger1 = time = 0
value = S13,0
volumescale = 200

[State 800, 2]
type = playerpush
Trigger1 = time < 24
value = 0

[State 1001, 10]
type = VelAdd
trigger1 = Time > 0
y = 0.375


[State 1001, 10]
type = posAdd
trigger1 = Time = 0
x = p2dist x -3

[State 1001, 10]
type = Posset
trigger1 = Time = 0
y = var(57)

[State 1050, 7]
type = selfstate
trigger1 = vel y > 0 && pos y > var(57)
value = 52
anim = 42


; baton sweep
[Statedef 1300]
type    = S
movetype= I
physics = N
juggle  = 8
ctrl = 0
velset = 6,0
anim = 1300
sprpriority = -2

[State 240, 1.5]
type = Playsnd
trigger1 = time = 0
value = S20,11
volumescale = 60
channel = 0

[State 240, 1.5]
type = Playsnd
trigger1 = animelem = 3
value = S5,155

[State 240, 1.5]
type = statetypeset
trigger1 = animelem = 2
movetype = A

[State 245, 2]
type = HitDef
trigger1 = !movecontact
attr = S, SA
animtype  = Back
damage    = 90, 20
guardflag = M
hitflag = MAF
pausetime = 0,2
sparkno = -1
hitonce = 1
guard.sparkno = -1
guardsound = S5,14
hitsound = S1338,1
ground.type = Low
ground.slidetime = 8
ground.hittime  = 8
guard.ctrltime = 12
guard.hittime = 12
ground.velocity = 0
p2facing = 1
;p2stateno = 5245
p2getp1state = 0
p1sprpriority = -2
p2sprpriority = 2
air.velocity = -3.4,-4.2
air.hittime = 17  
fall = 1
fall.recover = 0
ground.cornerpush.veloff = -30
priority = 1, Miss
guard.dist = 160
hitonce = 1

[State 240, 1.5]
type = velset
trigger1 = animelem = 6
trigger2 = moveguarded
x = 0

[State 240, 1.5]
type = changeanim
trigger1 = movehit && animelemtime(6) = 16
value = anim
elem = 7


[State 600, 1.5]
type = null;targetbind
trigger1 = movehit
pos = 100,0
persistent = 0

[State 600, 1.5]
type = targetvelset
trigger1 = moveguarded && target,hitover = 0
x = -4
ignorehitpause = 1

[State 245, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;========================================
; shotgun
;------------------------

[Statedef 1400]
type    = S
movetype= I
physics = S
anim = 1400
velset = 0,0
sprpriority = 2
ctrl = 0

[State ]
type = Explod
trigger1 = time = 0
anim = 888
ID = 1400
removetime = 180

[State ]
type = statetypeset
trigger1 = AnimElem = 4 
movetype = A

[State ]
type = playsnd
trigger1 = Time = 10
value = S20,12
volumescale = 160
channel = 0

[State ]
type = envshake
trigger1 = time = 10
time = 14
freq = 70
ampl = 1

[State ]
type = Helper
trigger1 = time = 10
helpertype = normal
stateno = 1401
pos = 0*const(size.xscale),0*const(size.yscale)
ownpal = 1

[State ]
type = StopSnd
trigger1 = time = 35
channel = 0

[State ]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

[Statedef 1401]
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
damage = 240,60
animtype = Light
projremove = 1
hitflag = MAF
guardflag = HL
pausetime = 0,2
sparkno = -1
guard.sparkno = -1
p2facing = 1
hitsound = S20,8
guardsound = S20,23
ground.type = High
ground.slidetime = 20
ground.hittime  = 15
ground.velocity = -15,0
air.velocity = -4,-5
yaccel = 0.5
guard.dist = 180
air.fall = 1
fall.recover = 0
air.juggle = 3
kill       = (root,Var(9) = 0)
fall.kill  = (root,Var(9) = 0)
guard.kill = (root,Var(9) = 0)
p2stateno = 1403
hitonce = 1

[State ]
type = envshake
trigger1 = movehit
trigger2 = moveguarded
ampl = 3
freq = 60
time = 16

[State ]
type = ChangeState
trigger1 = movecontact
value = 1402
ignorehitpause = 1

[State ]
type = destroyself
trigger1 = frontedgedist < -100

[Statedef 1402]
type    = S
movetype= A
physics = N
juggle  = 2
velset = 0,0
anim = 1402
ctrl = 0
sprpriority = 4

[State ]
type = posset
trigger1 = time < 12 && target,movetype = H
x = target,pos x

[State ]
type = helper
trigger1 = time = 0 && target,ID != root,ID
trigger1 = target,stateno = [1403,21240]
stateno = 7150
pos = 20,-96

[State ]
type = Explod
trigger1 = time = 0
triggerall = target,ID = root,ID
anim = F7214
pos = 10,-96
bindtime = 12
facing = 1
postype = p1
sprpriority = 4

[State ]
type = targetvelset
trigger1 = time < 12 && target,stateno = [150,159]
x = -1.5
ignorehitpause = 1

[State ]
type = destroyself
trigger1 = animtime = 0

[Statedef 1403]
type = S
movetype = H
physics = N
velset = 0,0
anim = 21238
sprpriority = 2
ctrl = 0

[State ]
type = changestate
trigger1 = Pos Y != var(57)
trigger1 = time = 0
value = 21240

[State ]
type = PlaySnd
trigger1 = time = 0
value = S3,0

[State ]
type = velset
trigger1 = time = 1
x = -3

[State ]
type = VelSet
trigger1 = time = 30
x = 0

[State ]
type = Changestate
trigger1 = AnimTime = 0
trigger1 = alive = 0 && !win
trigger2 = time = 12 && lose && prevstateno != 21238
value = 21299

[State ]
type = Changestate
trigger1 = AnimTime = 0
trigger1 = alive = 1 && life = 1 && enemy,var(59) = 1
value = 9001

[State ]
type = selfstate
trigger1 = time = 30
value = 0
ctrl = 1

[Statedef 1404]
type    = S
movetype= A
physics = S
juggle  = 2
velset = 0,0
anim = 1401
ctrl = 0

[State ]
type = ChangeAnim
trigger1 = time = 0
value = 1401
elem = 7

[State ]
type = turn
trigger1 = Time = 0

[State ]
type = posadd
trigger1 = Time = 0
x = -250

[State ]
type = velset
trigger1 = time > 0
x = 10

[State ]
type = hitdef
trigger1 = !movecontact
attr = S,HP
affectteam = F
damage = 240,60
animtype = Light
projremove = 1
hitflag = MAF
guardflag = HL
pausetime = 0,2
sparkno = -1
guard.sparkno = -1
hitsound = S20,8
guardsound = S30,6
ground.type = High
ground.slidetime = 20
ground.hittime  = 15
ground.velocity = -15,0
air.velocity = -4,-5
yaccel = 0.5
guard.dist = 90
air.fall = 1
fall.recover = 0
air.juggle = 3
kill       = (enemy,Var(9) = 0)
fall.kill  = (enemy,Var(9) = 0)
guard.kill = (enemy,Var(9) = 0)
p2stateno = 1403
hitonce = 1

[State ]
type = envshake
trigger1 = movehit
trigger2 = moveguarded
ampl = 3
freq = 60
time = 16

[State ]
type = ChangeState
trigger1 = movecontact
value = 1402
ignorehitpause = 1

[State ]
type = destroyself
trigger1 = frontedgedist < -100

; Flashlight
[Statedef 1500]
type    = S
movetype= A
physics = S
velset = 0,0
anim = 1500
ctrl = 0
sprpriority = 3

[State ]
type = Explod
trigger1 = time = 0
anim = 888
ID = 1500
removetime = 120

[State ]
type = PlaySnd
trigger1 = AnimElem = 2
value = S20,15
volumescale = 100

[State ]
type = Explod
trigger1 = AnimElem = 5
anim = 1501
pos = 63,-99
scale = const(size.xscale),const(size.yscale)
sprpriority = 4
removetime = 30
bindtime = -1
ownpal = 1
removeongethit = 1

[State ]
type = PlaySnd
trigger1 = AnimElem = 4
value = S20,14
volumescale = 255

[State ]
type = PlaySnd
trigger1 = time = 30
value = S20,14
volumescale = 255

[State ]
type = HitDef
trigger1 = !Movecontact && p2stateno != 9010
trigger1 = p2stateno != 9111
attr = S,NA
hitflag = M
guardflag = H
guard.dist = 180
guard.hittime = 0
p2stateno = 1501
hitonce = 1

[State ]
type = statetypeset
trigger1 = Moveguarded
triggerall = p2stateno = 9010 || p2stateno = 9111
movetype = I

[State ]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

[Statedef 1501]
type    = S
movetype= H
physics = N
anim = 5000
velset = 0,0
sprpriority = 2
ctrl = 0

[State ]
type = posset
trigger1 = !time
y = var(57)


[State ]
type = ChangeAnim
trigger1 = anim = 5000 && animtime = 0
value = 5300

[State ]
type = SprPriority
trigger1 = anim = 5300
value = 0


[State ]
type = selfstate
trigger1 = animtime = 0
trigger1 = alive = 1 && life = 1 && enemy,var(59) = 1
value = 9001

[State ]
type = selfstate
trigger1 = time = 75
value = 0
ctrl = 1

;========================================
; electroshoker
[Statedef 1600]
type    = S
movetype= A
physics = S
juggle  = 2
ctrl = 0
velset = 0,0
anim = 1600
sprpriority = 2

[State ]
type = Explod
trigger1 = time = 0
anim = 888
ID = 1600
removetime = 180

[State ]
type = Explod
trigger1 = animelem = 6
anim = 1601
pos = 0,0
scale = const(size.xscale),const(size.yscale)
sprpriority = 4
removetime = 32
bindtime = -1
ownpal = 1
removeongethit = 1

[State ]
type = PlaySnd
trigger1 = animelem = 7
value = S20,20
volumescale = 255

[State ]
type = HitDef
trigger1 = !movecontact
damage = 90,40
pausetime = 0,0
attr = S,NA
hitflag = M
guardflag = H
priority = 1, Miss
hitsound = S5,141
guardsound = s20,17
sparkno = -1
guard.sparkno = -1
p1sprpriority = 2
p2facing = 1
p1stateno = 1601
p2stateno = 1602
ground.hittime = 12
ground.slidetime = 12
yaccel = 0.5
fall = 1
fall.recover = 0
palfx.time = 60
palfx.add = 20+140*(var(46)>0)+90*(var(46)=1),100,160
palfx.sinadd = -120,-120,-120,8
palfx.color = 0
hitonce = 1

[State ]
type = statetypeset
trigger1 = p2dist x < 0
trigger2 = moveguarded
movetype = I

[State ]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

[Statedef 1601]
type    = S
movetype= A
physics = S
ctrl = 0
anim = 1602
velset = 0,0
sprpriority = 2

[State ]
type = PlaySnd
trigger1 = time = 0
value = S20,18 + random%2
volumescale = 255
channel = 2

[State ]
type = playsnd
trigger1 = time = 0
value = S20,16
channel = 0
volumescale = 255

[State ]
type = Explod
trigger1 = time%16 = 3 && time < 40
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
trigger1 = time%3 = 0 && time < 40
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
trigger1 = time = 60
channel = 0

[State ]
type = envshake
trigger1 = time = 0
ampl = 2
freq = 75
time = 70

[State ]
type = TargetBind
triggerall = time%6 = 3
trigger1 = p2name != "Motaro" && p4name != "Motaro"
pos = 65,0
time = 3

[State ]
type = playerpush
trigger1 = 1
value = 0

[State ]
type = targetdrop
trigger1 = time = 60
trigger2 = time > 0 && target,stateno != 1602
value = 0
ctrl = 1

[State end]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1
;p2
[Statedef 1602]
type = S
movetype = H
physics = N
anim = 5000
velset = 0,0
ctrl = 0
sprpriority = 2

[State 820, 4351]
type = varadd
Trigger1 = time = 0
v = 20
value = ceil(gethitvar(damage)*100/lifemax)

[State 3010, Var]
type = Varadd
trigger1 = time = 0
v = 21
value = 1


[State ]
type = changestate
trigger1 = time = 60
value = 5050
ctrl = 0


[StateDef 1999]
type    = U
movetype= H
physics = N
ctrl = 0

[State 1000, BounceOff]
type = selfState
trigger1 = prevstateno != 1999
value = 1999

[State 9327, explod] 
type = removeExplod
trigger1 = time = 0
ID = 1010

[State 1000, spear]
type = selfState
trigger1 = anim = 1001
value = 1003

[State 1000, spear]
type = selfState
trigger1 = anim = 1100
value = 1102

[State ]
type = selfState
trigger1 = anim = 1401
value = 1404

[State ]
type = selfState
trigger1 = anim = 1700
value = 1712

[State ]
type = selfState
trigger1 = anim = 1703
value = 1712

[State 1000, BounceOff]
type = destroyself
trigger1 = ishelper && root,stateno >= 0

[State 1000, BounceOff]
type = selfState
trigger1 = time = 30 || animtime = 0
value = 0
ctrl = 1

;-----------

[Statedef 2111];fake jump
type    = S
physics = S
anim = 0
ctrl = 0
sprpriority = 1

[State 40, jumpup]
type = PlaySnd
trigger1 = time = 2 && numexplod(7082) = 0
value = 3, 9
channel = 3

[State 40, 4]
type = VelSet
trigger1 = Time = 2
x = const(velocity.jump.fwd.x)
y = const(velocity.jump.y)

[State 40, 6]
type = ChangeState
trigger1 = Time = 2
value = 50
ctrl = 1

[StateDef 2112]; fake walk
type    = S
movetype= I
physics = N
ctrl = 0
anim = 20
velset = 3,0

[State -1]
type = selfState
value = 1000+10*(frontedgedist < 100||random%2 = 0)
trigger1 = var(50) = 1 && p2life > 2
triggerall = roundstate = 2
triggerall = random%50 < AILevel && time < 12
triggerall = time > 7 - AILevel
triggerall = p2statetype = A && p2movetype = H


[State -1]
type = selfState
value = 1100
trigger1 = var(50) = 1 && p2life > 2
triggerall = roundstate = 2
triggerall = random%50 < AILevel && time < 30
triggerall = time > 14 - 2*AILevel
triggerall = p2statetype = A && p2movetype = H

[State -1]
type = selfState
value = 1200
trigger1 = var(50) = 1 && p2life > 2
triggerall = roundstate = 2
triggerall = random%60 < AILevel && time > 30
triggerall = p2statetype = A && p2movetype = H

[State -1]
type = selfState
value = 210
trigger1 = var(50) = 1 && p2life > 2
triggerall = roundstate = 2
triggerall = time > 30 && abs(p2dist y) < 150 && p2bodydist x < 55 && random%12 < AILevel
triggerall = p2statetype = A && p2movetype = H

[State -1]
type = selfState
value = 20
trigger1 = var(50) != 1
trigger2 = roundstate != 2
trigger3 = time = 60
trigger4 = p2statetype != A || p2movetype != H
ctrl = 1