;JUMPING KICK
[Statedef 600]
type    = A
movetype= A
physics = A
juggle  = 1
ctrl = 0
anim = 600

[State 600, Select]
type = VarRandom
trigger1 = Time = 1
v = 11
range = 11, 12

[State 620, 145]
type = Playsnd
trigger1 = Animelem = 2
value = S1339,0
channel = 0

[State 600, 2]
type = HitDef
trigger1 = !MoveContact
attr = A, NA
damage    = 70, 30
air.animtype  = Back
hitflag = MAF
guardflag = M
priority = 6,miss;-((p2stateno = [600,620])&&enemy,time > time)
sparkno = 1
sparkxy = 0, -70
guard.sparkno = 40
pausetime = 5+4*(p2statetype = A),1
p2facing = 1
forcestand = 1
hitsound   = S1338,1
guardsound = F6,0
ground.type = High
ground.slidetime = 12
ground.hittime  = 16
guard.hittime = 12
yaccel = 0.5
hitonce = 1
ground.velocity = -1,0
air.velocity = -3.5, -6

[State 201, 347]
type = EnvShake
trigger1 = movecontact
time = 12
freq = 90
ampl = 3 
ignorehitpause = 1
persistent = 0

[State 600, 1.5]
type = changeanim
trigger1 = movecontact
value = anim
elem = animelemno(0) + 1
persistent = 0

[State 600, 1.5]
type = targetvelset
trigger1 = moveguarded = [1,12]
x = -2
ignorehitpause = 1



[State 600, 3.3]
type = selfstate
trigger1 = Movecontact && roundstate = 2
value = 601

[State 600, 3.3]
type = null;veladd
trigger1 = 1
y = 0.5


;---------------------------------------------------------------------------
;JUMPING PUNCH
[Statedef 610]
type    = A
movetype= A
physics = A
juggle  = 1
ctrl = 0
anim = 610

[State 621, adjust]
type = Turn
trigger1 = Time = 0
trigger1 = (P2Dist X < 0) && (P2Dist X > -55)

[State 610, Select]
type = VarRandom
trigger1 = Time = 1
v = 11
range = 11, 12

[State 620, 145]
type = Playsnd
trigger1 = Animelem = 2
value = S1339,0
channel = 0

[State 610, 1.5]
type = turn
trigger1 = time = 0
trigger1 = P2Dist X < -55

[State 610, 2]
type = HitDef
trigger1 = !movecontact
attr = A, NA
damage    = 80, 30
air.animtype  = Back
air.hittime  = 55
air.velocity = -3.5, -6
yaccel = 0.5
hitflag = MAF
guardflag = M
priority = 6,miss;-((p2stateno = [600,620])&&enemy,time > time)
pausetime = 5+4*(p2statetype = A),1
hitsound   = S1338,1
guardsound = f6,0
p2facing = 1
sparkno = -1
sparkxy = -25,-30
guard.sparkno = 40
forcestand = 1
ground.type = High
ground.slidetime = 12
ground.hittime  = 16
ground.velocity = -1
guard.hittime = 12
fall.recover = 0
hitonce = 1
;guard.dist = ifelse(vel x > 0, 80, 60)

[State 600, 1.5]
type = changeanim
trigger1 = movecontact
value = anim
elem = animelemno(0) + 1
persistent = 0

[State 201, 347]
type = EnvShake
trigger1 = movecontact
time = 12
freq = 90
ampl = 3 
ignorehitpause = 1
persistent = 0

;[State 600, 1.5]
;type = targetstate
;trigger1 = movecontact = [1,2]
;trigger1 = win && target,pos y > var(57) - 20
;value = 21299
;ignorehitpause = 1
;persistent = 0

[State 600, 1.5]
type = targetstate
trigger1 = movecontact && p2stateno = 5020 && enemy,numexplod(118) > 0
trigger1 = target,pos y > var(57) - 5
triggerall = enemy,authorname != "boss"
value = 5005
ignorehitpause = 1
persistent = 0

[State 610, 3.3]
type = selfstate
trigger1 = Movecontact && roundstate = 2
value = 611

[State 600, 1.5]
type = targetvelset
trigger1 = moveguarded = [1,12]
x = -2
ignorehitpause = 1

[State 600, 1.5]
type = velset
trigger1 = movecontact
triggerall = vel x > 0
x = 0
ignorehitpause = 1

;-----------------------------------------------------------------------------------------

;JUMPING SIDE KICK
[Statedef 620]
type    = A
movetype= A
physics = A
juggle  = 2
ctrl = 0
anim = 620

[State 621, adjust]
type = Turn
trigger1 = Time = 0
trigger1 = (P2Dist X < 0) && (P2Dist X > -55)

[State 620, Select]
type = VarRandom
trigger1 = Time = 1
v = 11
range = 11, 12


[State 620, 145]
type = Playsnd
trigger1 = Animelem = 2
value = S1339,0
channel = 0

[State 620, 2]
type = HitDef
trigger1 = !movecontact 
attr = A, NA
damage    = 80,30
animtype  = Back
hitflag = MAF
guardflag = M
priority = 6-((p2stateno = 620)&&enemy,time > time)
p2facing = 1-2*(p2dist x < 0)
pausetime = 7,1
sparkno = 1
sparkxy = -15,-50
guard.sparkno = 40
hitsound   = S1338,1
guardsound = F6,0
ground.type = High
ground.slidetime = 11
guard.ctrltime = 11
ground.hittime  = 11
ground.velocity = -3+6*(p2dist x < 0), -7.9
air.velocity = -3.5, -6
yaccel = 0.5
hitonce = 1
fall = 1
fall.recover = 0
guard.dist = ifelse(vel x > 0, 120, 80)

[State 600, 1.5]
type = changeanim
trigger1 = moveguarded
value = anim
elem = animelemno(0) + 1
persistent = 0

[State 600, 1.5]
type = null;targetbind
trigger1 = movehit && p2dist x < 0
pos = 0,p2dist y
ignorehitpause = 1
persistent = 0

[State 600, 1.5]
type = targetvelset
trigger1 = moveguarded && target,hitover = 0
x = -2
ignorehitpause = 1

[State 600, 1.5]
type = velset
trigger1 = moveguarded
triggerall = vel x > 0
x = 0
ignorehitpause = 1

[State 610, 3.3]
type = selfstate
trigger1 = MoveHit
value = 621


  
[Statedef 621]
type    = A
movetype= A
physics = A
juggle = 7
ctrl = 0


[State 620, 4]
type = VelSet
trigger1 = time < 5
X = -.1


[State 620, 534]
type = VelSet
trigger1 = time = 0
Y = 2

[State 620, 4]
type = Changestate
trigger1 = Pos Y = 0
value = 0
ctrl = 1

; HP1
[Statedef 200]
type    = S                      
movetype= A                      
physics = S                     
juggle  = 1                     
velset = 0,0                    
ctrl = 0                        
anim = 201+(selfanimexist(202)&&(prevstateno != [200,221]))
sprpriority = 2

[State 442, 3.3]
type = varset
trigger1 = time = 0
trigger2 = time > 12
v = 12
Value = 0

[State 620, 145]
type = varset
trigger1 = movehit && target,statetype = A
v = 47
value = 0
ignorehitpause = 1

;
;[State 8000, Power bloker]
;type = Explod
;trigger1 = movehit && target,statetype = A
;anim = 888
;pos = 0,0
;postype = p1
;ID = 7080
;sprpriority  = 1
;removetime = 45
;ignorehitpause = 1
;persistent = 0


[State 442, 3.3]
type = Varset
trigger1 = time = 0
trigger1 = prevstateno != [200,221]
trigger2 = animtime = 0
v = 11
Value = 0+(p2movetype = H && p2statetype = A && time = 0)

[State 442, 3.3]
type = VarAdd
triggerall = movecontact
trigger1 = p2stateno = 5020
trigger1 = enemy,backedgebodydist < 40||var(11) = 0
trigger2 = p2stateno = 21239
trigger3 = p2stateno = [150,159]
trigger3 = prevstateno = [200,221]
trigger3 = enemy,backedgebodydist < 40
v = 11
Value = 1 + (p2stateno = 21239)
ignorehitpause = 1
persistent = 0

[State 442, 3.3]
type = selfstate
trigger1 = var(11) > 1
triggerall = roundstate = 2
ignorehitpause = 1
Value = 299

[State 442, 3.3]
type = VarSet
trigger1 = prevstateno != [200,221]
trigger2 = p2stateno != [5000,5012]
trigger2 = p2stateno != [150,159]
triggerall = time = 0
v = 16
Value = 0

[State 442, 3.3]
type = VarAdd
trigger1 = movecontact
v = 16
Value = 1+2*(moveguarded > 0)
ignorehitpause = 1
persistent = 0


[State 3, whoosh]
type = Playsnd
trigger1 = Animelem = 2
value = S1339,0
channel = 0

[State 200, 1]
type = HitDef
trigger1 = !MoveContact
triggerall = p2statetype != C || p2stateno = [120,159]
triggerall = p2stateno != 5120
attr = S, NA                    
damage    = 60,30                
animtype = Light
air.animtype = Back                               
guardflag = M
hitflag = MAF
pausetime = 0,1
sparkno = 1
sparkxy = -35,-105
guard.sparkno = 40
hitsound   = S1338,1
guardsound = F6,0          
ground.type = High
ground.slidetime = 12
ground.hittime  = 12
p2facing = 1
air.juggle = 6
guard.slidetime = 12
guard.ctrltime = 12 
ground.velocity = -4,0
air.velocity = -3, -6
yaccel = 0.4375
ground.cornerpush.veloff = -10;-30*((p2statetype = A&&p2movetype = H)||var(16) >= 4||var(11) > 0)
numhits = 0
hitonce = 1
fall.recover = 1
priority = 1, Miss
forcestand = 1

[State 600, 1.5]
type = null;velset
;trigger1 = movecontact
trigger1 = (movehit && p2statetype = A&&p2movetype = H)||var(16) >= 5||var(11) > 0
trigger1 = frontedgedist < 160
triggerall = target,backedgebodydist < 40
x = -4
ignorehitpause = 1

[State 600, 1.5]
type = targetvelset
trigger1 = moveguarded && target,hitover = 0
x = -2
ignorehitpause = 1

[State 600, 1.5]
type = targetstate
triggerall = movehit
trigger1 = target,statetype != A
triggerall = var(16) >= 5
value = 5000;ifelse(target,backedgebodydist < 40, 120, 21238)
ignorehitpause = 1
persistent = 0

[State 600, 1.5]
type = targetstate
trigger1 = movecontact && win && target,pos y > var(57) - 20
value = 5030
ignorehitpause = 1
persistent = 0

[State 600, 1.5]
type = targetvelset
trigger1 = movecontact && target,stateno = 21239
x = -3

[State -1, Stand SPunch2]
type = varset
v = 12
triggerall = roundstate = 2
triggerall = command = "a"
triggerall = time > 0
trigger1 = time < 12
trigger2 = !movecontact
value = 2


[State -1, Stand SPunch2]
type = varset
triggerall = roundstate = 2
triggerall = command = "x"
triggerall = time > 0
trigger1 = time < 12
trigger2 = !movecontact 
v = 12
value = 1

[State -1, SPunch cancel]
type = varset
triggerall = roundstate = 2
triggerall = (prevstateno != [200,221])
triggerall = command = "b" || command = "y" || command = "blok" || command = "run"
trigger1 = var(12) = 0 && time > 0 && time < 12
trigger1 = var(50) = 0
v = 12
value = 3

[State -1, cl]
type = changeanim
trigger1 = var(12) = 3 && animelemtime(3) = 4
value = anim
elem = 5

[State -1, cl]
type = changeanim
trigger1 = var(12) = 3 && anim = 202 && animelemtime(5) = 2
value = anim
elem = 6

[State -1, guardd]
type = ChangeState
value = 120
triggerall = inguarddist || (p2movetype = A && p2bodydist x < 60)
trigger1 = var(50) = 0 && command = "blok"
trigger2 = var(50) = 1 && random%14 < AILevel && AILevel > 2+random%3
ignorehitpause = 1

[State -1, Stand SPunch2]
type = ChangeState
value = 201 + 20*(var(12) = 2)
triggerall = var(12) = [1,2]
trigger1 = time > 9
trigger1 = var(50) = 0
ignorehitpause = 1

[State 200, 3]
type = Ctrlset
triggerall = AnimTime > -4 && movehit && p2statetype = A
triggerall = prevstateno != [200,221]
trigger1 = var(50) = 0 && command = "holdup"
value = 1

[State 200, 3]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;HP - Part 2
; HP2
[Statedef 201]
type    = S                      
movetype= A                      
physics = S                     
juggle  = 2
velset = 0,0                    
ctrl = 0                        
anim = 200                     
sprpriority = 2 

[State 442, 3.3]
type = varset
trigger1 = time = 0
trigger2 = time > 12
v = 12
Value = 0

[State 620, 145]
type = varset;Poweradd
trigger1 = movehit && target,statetype = A
v = 47
value = 0;-900
ignorehitpause = 1

;
;[State 8000, Power bloker]
;type = Explod
;trigger1 = movehit && target,statetype = A
;anim = 888
;pos = 0,0
;postype = p1
;ID = 7080
;sprpriority  = 1
;removetime = 45
;ignorehitpause = 1
;persistent = 0
;

[State 442, 3.3]
type = hitAdd
trigger1 = movehit = 1
trigger1 = p2statetype != S
Value = 1                

[State 442, 3.3]
type = Varset
trigger1 = time = 0
trigger1 = prevstateno != [200,221]
trigger2 = animtime = 0
v = 11
Value = 0+(p2movetype = H && p2statetype = A && time = 0)

[State 442, 3.3]
type = VarAdd
triggerall = movecontact
trigger1 = p2stateno = 5020
trigger1 = enemy,backedgebodydist < 40
trigger2 = p2stateno = 21239
trigger3 = p2stateno = [150,159]
trigger3 = enemy,backedgebodydist < 40
v = 11
Value = 1 + (p2stateno = 21239)
persistent = 0

[State 442, 3.3]
type = selfstate
trigger1 = var(11) > 1
triggerall = roundstate = 2
Value = 299-70*(p2stateno = 5020 && enemy,backedgebodydist > 3)


[State 3, whoosh]
type = Playsnd
trigger1 = Animelem = 2
value = S1339,0
channel = 0

[State 442, 3.3]
type = VarSet
trigger1 = prevstateno != [200,221]
trigger2 = p2stateno != [5000,5012]
trigger2 = p2stateno != [150,159]
triggerall = time = 0
v = 16
Value = 0

[State 442, 3.3]
type = VarAdd
trigger1 = movecontact
v = 16
Value = 1+2*(moveguarded > 0)
ignorehitpause = 1
persistent = 0


[State 200, 1]
type = HitDef
trigger1 = !MoveContact
triggerall = p2statetype != C || p2stateno = [120,159]
attr = S, NA                    
damage    = 60,30                
animtype = Light
air.animtype = Back                               
guardflag = M
hitflag = MAF            
pausetime = 0,1
sparkno = 1
sparkxy = -35,-105
guard.sparkno = 40
hitsound   = S1338,1
guardsound = F6,0           
ground.type = High
ground.slidetime = 12
ground.hittime  = 12
p2facing = 1
air.juggle = 6
guard.slidetime = 12
guard.ctrltime = 12 
ground.velocity = -4,0
air.velocity = -3, -6
yaccel = 0.4375
hitonce = 1
ground.cornerpush.veloff = -10;-30*((p2statetype = A&&p2movetype = H)||var(16) >= 4||var(11) > 0)
;guard.cornerpush.veloff = -5-20*(var(16) >= 4||var(11) > 0)
numhits = 0
fall.recover = 1
priority = 1, Miss

[State 600, 1.5]
type = null;velset
;trigger1 = movecontact 
trigger1 = (movehit&&p2statetype = A&&p2movetype = H)||var(16) >= 5||var(11) > 0||moveguarded
trigger1 = frontedgedist < 160
;trigger2 = moveguarded && frontedgedist < 90
triggerall = target,backedgebodydist < 40
x = -4
ignorehitpause = 1

[State 600, 1.5]
type = targetvelset
trigger1 = moveguarded && target,hitover = 0
x = -2
ignorehitpause = 1

;[State 600, 1.5]
;type = targetstate
;trigger1 = movecontact && win && target,pos y > var(57) - 20
;value = 21299
;ignorehitpause = 1
;persistent = 0

;[State 600, 1.5]
;type = targetstate
;triggerall = movehit
;trigger1 = target,statetype != A
;triggerall = var(16) >= 5
;value = 21238;ifelse(target,backedgebodydist < 40, 120, 21238)
;ignorehitpause = 1
;persistent = 0

[State 600, 1.5]
type = targetvelset
trigger1 = movecontact && target,stateno = 21239
x = -3

[State -1, Stand SPunch2]
type = varset
v = 12
triggerall = roundstate = 2
triggerall = command = "a"
triggerall = time > 0
trigger1 = time < 12
trigger2 = !movecontact 
value = 2


[State -1, Stand SPunch2]
type = varset
triggerall = roundstate = 2
triggerall = command = "x"
triggerall = time > 0
trigger1 = time < 12
trigger2 = !movecontact 
v = 12
value = 1

[State -1, guardd]
type = ChangeState
value = 120
triggerall = inguarddist || (p2movetype = A && p2bodydist x < 60)
trigger1 = var(50) = 0 && command = "blok"
trigger2 = var(50) = 1 && random%14 < AILevel && AILevel > 2+random%3
ignorehitpause = 1

[State -1, Stand SPunch2]
type = ChangeState
value = 200 + 20*(var(12) = 2)
triggerall = var(12) > 0
trigger1 = time > 9
trigger1 = var(50) = 0
ignorehitpause = 1

[State 200, 3]
type = Ctrlset
trigger1 = AnimTime > -5 && movehit && p2statetype = A
trigger1 = var(50) = 0 && command = "holdup"
value = 1

[State 200, 3]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;LP - Part 1
; LP1
[Statedef 220]
type    = S                      
movetype= A                      
physics = S                     
juggle  = 5                     
velset = 0,0                    
ctrl = 0                        
anim = 220+2*(selfanimexist(222)&&(prevstateno != [200,221]))
sprpriority = 2                  

[State 442, 3.3]
type = varset
trigger1 = time = 0
trigger2 = time > 12
v = 12
Value = 0

[State 620, 145]
type = varset;Poweradd
trigger1 = movehit && target,statetype = A
v = 47
value = 0;-900
ignorehitpause = 1

;
;[State 8000, Power bloker]
;type = Explod
;trigger1 = movehit && target,statetype = A
;anim = 888
;pos = 0,0
;postype = p1
;ID = 7080
;sprpriority  = 1
;removetime = 45
;ignorehitpause = 1
;persistent = 0

[State 442, 3.3]
type = hitAdd
trigger1 = movehit = 1
trigger1 = p2statetype != S
Value = 1

[State 442, 3.3]
type = Varset
trigger1 = time = 0
trigger1 = prevstateno != [200,221]
trigger2 = animtime = 0
v = 11
Value = 0+(p2movetype = H && p2statetype = A && time = 0)

[State 442, 3.3]
type = VarAdd
triggerall = movecontact
trigger1 = p2stateno = 5020
trigger1 = enemy,backedgebodydist < 40||var(11) = 0
trigger2 = p2stateno = 21239
trigger3 = p2stateno = [150,159]
trigger3 = prevstateno = [200,221]
trigger3 = target,backedgebodydist < 40
v = 11
Value = 1 + (p2stateno = 21239)
persistent = 0

[State 442, 3.3]
type = selfstate
trigger1 = var(11) > 1
triggerall = roundstate = 2
Value = 299

[State 442, 3.3]
type = VarSet
trigger1 = prevstateno != [200,221]
trigger2 = p2stateno != [5000,5012]
trigger2 = p2stateno != [150,159]
triggerall = time = 0
v = 16
Value = 0

[State 442, 3.3]
type = VarAdd
trigger1 = movecontact
v = 16
Value = 1+2*(moveguarded > 0)
ignorehitpause = 1
persistent = 0


[State 3, whoosh]
type = Playsnd
trigger1 = Animelem = 2
value = S1339,1
channel = 0

[State 200, 1]
type = HitDef
trigger1 = !MoveContact
trigger1 = p2statetype != C || p2movetype = H || p2stateno = [120,159]
attr = S, NA                    
damage    = 50,20                
animtype = Light
air.animtype = Back                               
guardflag = M
hitflag = MAF            
pausetime = 0,0
sparkno = 0
sparkxy = -35,-105
guard.sparkno = 40
hitsound   = S1338,0
guardsound = F6,0               
ground.type = Low
ground.slidetime = 12
ground.hittime  = 12
p2facing = 1
air.juggle = 6
guard.slidetime = 12
guard.ctrltime = 12 
ground.velocity = -4,0
air.velocity = -3, -6
yaccel = 0.4375
airguard.velocity = -1.9
ground.cornerpush.veloff = 0;-30*((p2statetype = A&&p2movetype = H)||var(16) >= 4||var(11) > 0)
numhits = 0
hitonce = 1
fall.recover = 1
priority = 1, Miss

[State 600, 1.5]
type = null;velset
;trigger1 = movecontact
trigger1 = (movehit&&p2statetype = A&&p2movetype = H)||var(16) >= 5||var(11) > 0
trigger1 = frontedgedist < 160
triggerall = target,backedgebodydist < 40
x = -4
ignorehitpause = 1

[State 600, 1.5]
type = targetvelset
trigger1 = moveguarded && target,hitover = 0
x = -3
ignorehitpause = 1
;
[State 600, 1.5]
type = targetvelset
triggerall = movehit
trigger1 = target,statetype != A
triggerall = var(16) >= 5
x = -3
ignorehitpause = 1
persistent = 0

;[State 600, 1.5]
;type = targetstate
;trigger1 = movecontact && win && target,pos y > var(57) - 20
;value = 21299
;ignorehitpause = 1
;persistent = 0
;
;[State 600, 1.5]
;type = targetvelset
;trigger1 = movecontact && target,stateno = 21239
;x = -3

[State -1, Stand SPunch2]
type = varset
v = 12
triggerall = roundstate = 2
triggerall = command = "a"
triggerall = time > 0
trigger1 = time < 12
trigger2 = !movecontact 
value = 2


[State -1, Stand SPunch2]
type = varset
triggerall = roundstate = 2
triggerall = command = "x"
triggerall = time > 0
trigger1 = time < 12
trigger2 = !movecontact 
v = 12
value = 1

[State -1, SPunch cancel]
type = varset
triggerall = roundstate = 2
triggerall = (prevstateno != [200,221])
triggerall = command = "b" || command = "y" || command = "blok" || command = "run"
trigger1 = var(12) = 0 && time > 0 && time < 12
v = 12
value = 3

[State -1, cl]
type = changeanim
trigger1 = var(12) = 3 && animelemtime(3) = 4
value = anim
elem = 5

[State -1, cl]
type = changeanim
trigger1 = var(12) = 3 && anim = 222 && animelemtime(5) = 2
value = anim
elem = 6

[State -1, guardd]
type = ChangeState
value = 120
triggerall = inguarddist || (p2movetype = A && p2bodydist x < 60)
trigger1 = var(50) = 0 && command = "blok"
trigger2 = var(50) = 1 && random%14 < AILevel && AILevel > 2+random%3
ignorehitpause = 1

[State -1, Stand SPunch2]
type = ChangeState
value = 201 + 20*(var(12) = 2)
triggerall = var(12) = [1,2]
trigger1 = time > 9
trigger1 = var(50) = 0
ignorehitpause = 1

[State 205, 3]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


;---------------------------------------------------------------------------
;LP - Part 2
; LP2
[Statedef 221]
type    = S                      
movetype= A                      
physics = S                     
juggle  = 5                     
velset = 0,0                    
ctrl = 0                        
anim = 221                      
sprpriority = 2                  

[State 442, 3.3]
type = varset
trigger1 = time = 0
trigger2 = time > 12
v = 12
Value = 0

[State 620, 145]
type = varset;Poweradd
trigger1 = movehit && target,statetype = A
v = 47
value = 0;-900
ignorehitpause = 1



[State 442, 3.3]
type = hitAdd
trigger1 = movehit = 1
trigger1 = p2statetype != S
Value = 1

[State 442, 3.3]
type = Varset
trigger1 = time = 0
trigger1 = prevstateno != [200,221]
trigger2 = animtime = 0
v = 11
Value = 0+(p2movetype = H && p2statetype = A && time = 0)

[State 442, 3.3]
type = VarAdd
triggerall = movecontact
trigger1 = p2stateno = 5020
trigger1 = enemy,backedgebodydist < 40
trigger2 = p2stateno = 21239
trigger3 = p2stateno = [150,159]
trigger3 = target,backedgebodydist < 40
v = 11
Value = 1 + (p2stateno = 21239)
persistent = 0

[State 442, 3.3]
type = selfstate
trigger1 = var(11) > 1
triggerall = roundstate = 2
Value = 299-70*(p2stateno = 5020 && enemy,backedgebodydist > 3)


[State 442, 3.3]
type = VarSet
trigger1 = prevstateno != [200,221]
trigger2 = p2stateno != [5000,5012]
trigger2 = p2stateno != [150,159]
triggerall = time = 0
v = 16
Value = 0

[State 442, 3.3]
type = VarAdd
trigger1 = movecontact
v = 16
Value = 1+2*(moveguarded > 0)
ignorehitpause = 1
persistent = 0


[State 3, whoosh]
type = Playsnd
trigger1 = Animelem = 2
value = S1339,1
channel = 0

[State 200, 1]
type = HitDef
trigger1 = !MoveContact
trigger1 = p2statetype != C || p2movetype = H|| p2stateno = [120,159]
attr = S, NA                    
damage    = 50,20
animtype = Light
air.animtype = Back                               
guardflag = M
hitflag = MAF            
pausetime = 0,0
sparkno = 0
sparkxy = -35,-105
guard.sparkno = 40
hitsound   = S1338,0
guardsound = F6,0              
ground.type = Low
ground.slidetime = 12
ground.hittime  = 12
p2facing = 1
air.juggle = 6
guard.slidetime = 12
guard.ctrltime = 12 
ground.velocity = -6,0
air.velocity = -3, -6
yaccel = 0.4375
airguard.velocity = -1.9
ground.cornerpush.veloff = -10;-30*((p2statetype = A&&p2movetype = H)||var(16) >= 4||var(11) > 0)
;guard.cornerpush.veloff = -5-25*(var(16) >= 4||var(11) > 0)
numhits = 0
hitonce = 1
fall.recover = 1
priority = 1, Miss

[State 600, 1.5]
type = null;velset
;trigger1 = movecontact
trigger1 = (movehit&&p2statetype = A&&p2movetype = H)||var(16) >= 5||var(11) > 0
trigger1 = frontedgedist < 140
;trigger2 = moveguarded && frontedgedist < 90
triggerall = target,backedgebodydist < 40
x = -4
ignorehitpause = 1

[State -1, Stand SPunch2]
type = varset
v = 12
triggerall = roundstate = 2
triggerall = command = "a"
triggerall = time > 0
trigger1 = time < 12
trigger2 = !movecontact 
value = 2

[State -1, Stand SPunch2]
type = varset
triggerall = roundstate = 2
triggerall = command = "x"
triggerall = time > 0
trigger1 = time < 12
trigger2 = !movecontact 
v = 12
value = 1

[State -1, guardd]
type = ChangeState
value = 120
triggerall = inguarddist || (p2movetype = A && p2bodydist x < 60)
trigger1 = var(50) = 0 && command = "blok"
trigger2 = var(50) = 1 && random%14 < AILevel && AILevel > 2+random%3
ignorehitpause = 1

[State -1, Stand SPunch2]
type = ChangeState
value = 200 + 20*(var(12) = 2)
triggerall = var(12) > 0
trigger1 = time > 9
trigger1 = var(50) = 0
ignorehitpause = 1

[State 600, 1.5]
type = targetvelset
trigger1 = moveguarded && target,hitover = 0
x = -3
ignorehitpause = 1

[State 600, 1.5]
type = velset
triggerall = movehit
trigger1 = target,statetype != A
triggerall = var(16) >= 5
x = -3
ignorehitpause = 1
persistent = 0


;[State 600, 1.5]
;type = targetvelset
;trigger1 = movecontact && target,stateno = 21239
;x = -3

[State 206, 3]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;-------------
;HK
[Statedef 210]
type    = S
movetype= A
physics = S
juggle  = 1
ctrl = 0
velset = 0,0
anim = 210

[State 3, whoosh]
type = Playsnd
trigger1 = Animelem = 6
value = S1339,0
channel = 0

[State 210, 2]
type = HitDef
trigger1 = !movecontact
triggerall = p2statetype != C || p2stateno = [120,159]
attr = S, NA
animtype  = Light
damage    = 80, 30
guardflag = M
hitflag = MAF
pausetime = 4+12*(p2statetype = A&&p2movetype = H&&enemy,backedgebodydist < 40),4
sparkno = 2
sparkxy = -20,-105
guard.sparkno = 40
hitsound   = S1338,2
guardsound = F6,0                 
ground.type = High
p2facing = 1
guard.ctrltime = 12 
ground.slidetime = 24
ground.hittime  = 24
ground.velocity = 0,0
air.velocity = -3.5,-6
yaccel = 0.5
air.hittime = 12
air.fall = 0
fall.recover = 0
hitonce = 1
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = -20
priority = 3, Miss

[State 201, 347]
type = null;EnvShake
trigger1 = movecontact
time = 15
freq = 70
ampl = 3 
ignorehitpause = 1
persistent = 0

[State 600, 1.5]
type = targetvelset
trigger1 = moveguarded = [1,12]
x = -2
ignorehitpause = 1

[State 600, 1.5]
type = targetvelset
trigger1 = movehit = [1,9]
triggerall = target,statetype != A
x = -4.5
ignorehitpause = 1

[State 600, 1.5]
type = varset
trigger1 = movehit = 9
fv = 2
value = 1
persistent = 0
ignorehitpause = 1

[State 600, 1.5]
type = varset
trigger1 = movehit > 9
fv = 2
value = fvar(2)*0.984375
ignorehitpause = 1

[State 600, 1.5]
type = targetvelset
trigger1 = movehit = [10,19]
triggerall = target,statetype != A
x = (-4.5+0.0703125*(movecontact - 9))*fvar(2)
ignorehitpause = 1

[State 600, 1.5]
type = targetvelset
trigger1 = movehit > 19
triggerall = target,statetype = S
x = 0
ignorehitpause = 1

[State 210, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;regular lk
[Statedef 225]
type    = S
movetype= A
physics = S
juggle  = 1
ctrl = 0
velset = 0,0
anim = 225

[State 3, whoosh]
type = Playsnd
trigger1 = Animelem = 4
value = S1339,0
channel = 0

[State 225, 2]
type = HitDef
trigger1 = !movecontact
attr = S, NA
animtype  = Light
damage    = 70, 40
guardflag = M
hitflag = MAF
pausetime = 2+5*(p2statetype = A), 2
sparkno = 1
sparkxy = -25,-55
guard.sparkno = 40
hitsound   = S1338,1
guardsound = F6,0              
ground.type = Low
p2facing = 1
guard.ctrltime = 12 
ground.slidetime = 12
ground.hittime  = 12
ground.velocity = -4,0
air.velocity = -3.5,-6
yaccel = 0.5
air.hittime = 12   
air.fall = 0
fall.recover = 0
hitonce = 1
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = -10
priority = 3, Miss


[State 201, 347]
type = null;EnvShake
trigger1 = movecontact
time = 15
freq = 60
ampl = 3 
ignorehitpause = 1
persistent = 0

[State 600, 1.5]
type = targetvelset
trigger1 = moveguarded && target,hitover = 0
x = -2
ignorehitpause = 1

[State 600, 1.5]
type = targetvelset
trigger1 = movehit = [1,12]
triggerall = target,statetype = S || target,statetype = C
x = -4
ignorehitpause = 1

[State 225, 3]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;roundhouse
[Statedef 240]
type    = S
movetype= A
physics = S
juggle  = 5
ctrl = 0
velset = 0,0
anim = 240

[State 240, 1.5]
type = Playsnd
trigger1 = animelem = 5
value = S1339,0

[State 240, 2]
type = HitDef
trigger1 = !movecontact
attr = S, NA
animtype  = Back
damage    = 110, 40
guardflag = M
hitflag = MAF
pausetime = 4,2
sparkno = 2
sparkxy = -55,-95
guard.sparkno = 40
hitsound   = S1338,2
guardsound = F6,0     
ground.type = High
ground.slidetime = 30
p2facing = 1
guard.ctrltime = 12
guard.slidetime = 12
ground.hittime  = 12
ground.velocity = -6,-8            
air.velocity = -6,-8
air.hittime = 12  
ground.cornerpush.veloff = -15
guard.cornerpush.veloff = 0
fall.recover = 0
fall = 1
envshake.time = 15
envshake.freq = 70
envshake.ampl = 7
yaccel = 0.5
priority = 3, Miss

[State 600, 1.5]
type = targetvelset
trigger1 = moveguarded && target,hitover = 0
x = -4
ignorehitpause = 1

[State 240, 1.5]
type = varset
trigger1 = time = 0
trigger2 = animtime = 0
v = 11
value = 0

[State 240, 1.5]
type = varset
trigger1 = movecontact
v = 11
value = pos x
ignorehitpause = 1
persistent = 0

[State 240, 3]
type = selfstate
triggerall = roundstate = 2
triggerall = movecontact = [1,2]
trigger1 = abs(pos x) > abs(var(11)) + 20
trigger2 = abs(pos x) < abs(var(11)) - 20
trigger3 = movecontact = 2 && enemy,backedgebodydist < 40
value = 249
ignorehitpause = 1

[State 201, 347]
type = EnvShake
trigger1 = moveguarded
time = 15
freq = 55
ampl = 5 
ignorehitpause = 1
persistent = 0

[State 240, 3]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

[Statedef 249]; rh cancel
type    = S
movetype= I
physics = S
ctrl = 0
velset = 0,0

[State 9130, SetFatal]
type = Varset
trigger1 = Time = 0
V = 11
value = animelemno(0) - 1

[State 240, 3]
type = Changeanim
trigger1 = 1;time < 16
value = anim
elem = var(11)

[State 240, 3]
type = velset
trigger1 = time < 12 && frontedgedist < 120
x = -8

[State 202, NotFrly]
type = velset
trigger1 = vel x = 0 || frontedgedist >= 120
x = -0.1

[State 240, 3]
type = ChangeState
trigger1 = time = 30;AnimTime = 0
value = 0
ctrl = 1

[Statedef 259]; popup cancel
type    = S
movetype= I
physics = S
ctrl = 0
velset = 0,0

[State var]
type = targetlifeadd
trigger1 = target,life < 2
trigger1 = var(9) = 0 || var(19) = 1
value = -1
kill = 1

[State 240, 3]
type = velset
trigger1 = time < 12 && frontedgedist < 120
x = -8

[State 9130, SetFatal]
type = Varset
trigger1 = Time = 0
V = 11
value = animelemno(4)

[State 240, 3]
type = Changeanim
trigger1 = 1
value = anim
elem = var(11)

[State 202, NotFrly]
type = velset
trigger1 = time > 12 || vel x = 0
x = -0.1

[State 240, 3]
type = ChangeState
trigger1 = time = 60
value = 0
ctrl = 1

[Statedef 269]; combo cancel
type    = S
movetype= I
physics = S
ctrl = 0
velset = 0,0


[State 240, 3]
type = velset
trigger1 = time < 12
x = -4

[State 240, 3]
type = varset
trigger1 = time = 0
v = 11
value = animelemno(0)

[State 240, 3]
type = Changeanim
trigger1 = 1
value = anim
elem = var(11)

[State 240, 3]
type = ChangeState
trigger1 = Time = 20
value = 0
ctrl = 1

;sweep
[Statedef 245]
type    = C
movetype= A
physics = S
juggle  = 4
ctrl = 0
velset = 0,0
anim = 245
sprpriority = -2


[State 620, 145]
type = Playsnd
trigger1 = Animelem = 4
value = S1339,0
channel = 0

[State 245, 4]
type = changeanim
triggerall = time = 0 && p2stateno != 5245
triggerall = enemy,authorname != "boss"
trigger1 = enemy,numexplod(1188) > 0 || enemy,numexplod(118) > 0
trigger2 = p2statetype = A && p2movetype = H && numexplod(7080) > 0 && enemy,numexplod(118) = 0
value = 246

[State 245, 4]
type = null;changeanim
triggerall = anim = 246
trigger1 = enemy,numexplod(1188) > 0
trigger1 = p2stateno = 5120 || enemy,var(21) = 0
value = 245
elem = animelemno(0)
persistent = 0

[State 245, 4]
type = changeanim
triggerall = anim = 245
trigger1 = p2stateno = 1000
trigger1 = inguarddist
value = 246
elem = animelemno(0)
persistent = 0

[State 245, 2]
type = HitDef
trigger1 = !movecontact
trigger1 = p2statetype != A || anim = 246
attr = S, NA
animtype  = Back
damage    = 80, 30
guardflag = L
hitflag = MAFD
pausetime = 0,2
sparkno = 1
hitonce = 1
guard.sparkno = 40
guardsound = F6,0
hitsound   = S1338,1
ground.type = Low
ground.slidetime = 8
ground.hittime  = 8
guard.ctrltime = 8
ground.velocity = 0,0
p2facing = 1
p1sprpriority = -2
p2sprpriority = 2
air.velocity = -3.4,-4.2
air.hittime = 17  
fall = 1
fall.recover = 0
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = -15
priority = 0, Miss
;p2stateno = 5245


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

[Statedef 229]; punch cancel - middle
type    = S
movetype= A
physics = S
juggle  = 4
ctrl = 0
velset = 0,0

[State 245, 4]
type = varset
trigger1 = time = 0
v = 16
value = 0

[State 245, 4]
type = velset
trigger1 = frontedgedist < 140 && target,backedgebodydist < 40
x = -6

[State 245, 4]
type = Changeanim
trigger1 = 1
value = anim
elem = animelemno(0)

[State 245, 4]
type = ChangeState
trigger1 = time > 20
value = 0
ctrl = 1

[Statedef 299]; punch cancel - halt
type    = S
movetype= A
physics = S
juggle  = 4
ctrl = 0
velset = 0,0

[State 240, 1.5]
type = varset
trigger1 = time = 0
v = 11
value = pos x
ignorehitpause = 1
persistent = 0

[State 245, 4]
type = velset
trigger1 = frontedgedist < 140 && target,backedgebodydist < 40
x = -8

[State 245, 4]
type = varset
trigger1 = time = 0
v = 16
value = 0

[State 245, 4]
type = Changeanim
trigger1 = 1
value = anim
elem = animelemno(0)

[State 245, 4]
type = ChangeState
trigger1 = target,stateno = 5020
;trigger1 = target,stateno != 21239
value = 229

[State 245, 4]
type = ChangeState
trigger1 = Time = 30
trigger2 = target,stateno != 21239 && time > 20
value = 0
ctrl = 1

;crouch LK
[Statedef 400]
type    = C
movetype= A
physics = S
juggle  = 1
ctrl = 0
;anim = 400

[State 200, chg]
type = changeanim
trigger1 = anim != 11 && time = 0
value = 10

[State 200, chg]
type = changeanim
trigger1 = anim = 11 && time = 0
trigger2 = anim = 10 && animtime = 0
triggerall = p2dist x < -25 && selfanimexist(6)
value = 6
persistent = 0

[State 200, chg]
type = turn
trigger1 = anim = 6
persistent = 0

[State 200, chg]
type = changeanim
trigger1 = anim = 11 && time = 0
trigger2 = anim != 400 && animtime = 0
value = 400

[State 245, 4]
type = null;Statetypeset
triggerall = anim = 400 && Animelem = 2
trigger1 = enemy,numexplod(118) = 0
trigger2 = enemy,gethitvar(yvel) > -10
triggerall = enemy,statetype != S && enemy,statetype != C
movetype = I


[State 200, Playf]
type = PlaySnd
trigger1 = anim = 400 && animelem = 2
value = S1339,1
channel = 0

[State 400, 2]
type = HitDef
trigger1 = !movecontact
attr = S, NA
damage    = 60, 20
animtype  = Light
hitflag = MD
guardflag = M
pausetime = 2,2
sparkno = 1
guard.sparkno = 40
hitsound   = S1338,0
guardsound = F6,0
ground.type = Low
guard.ctrltime = 12
guard.slidetime = 12
ground.slidetime = 12
ground.hittime  = 12
ground.velocity = -3
air.velocity = -3.5,-6
ground.cornerpush.veloff = -15
down.velocity = -4,0
down.hittime = 12
fall.recover = 0
p2facing = 1
air.fall = 0
hitonce = 1
guard.dist = 110
priority = 1, Miss

[State 240, 1.5]
type = varset
trigger1 = movecontact
v = 11
value = pos x
ignorehitpause = 1
persistent = 0

[State 240, 3]
type = selfstate
triggerall = roundstate = 2
triggerall = movecontact = [1,2]
trigger1 = abs(pos x) > abs(var(11)) + 15
trigger2 = abs(pos x) < abs(var(11)) - 15
value = 409
ignorehitpause = 1

[State 600, 1.5]
type = targetvelset
trigger1 = moveguarded&&target,hitover = 0
x = -3
ignorehitpause = 1

[State 600, 1.5]
type = targetvelset
trigger1 = movehit
triggerall = target,statetype = S || target,statetype = C
triggerall = target,hitover = 0
x = -3
ignorehitpause = 1

[State 600, 1.5]
type = targetstate
trigger1 = movecontact && target,stateno = 5080
value = 5010
ignorehitpause = 1
persistent = 0

[State 400, 4]
type = ChangeState
trigger1 = anim = 400 && AnimTime = 0
value = 11
ctrl = 1

[Statedef 409]; lk cancel
type    = S
movetype= I
physics = S
ctrl = 0

[State 240, 1.5]
type = varset
trigger1 = time = 0
v = 11
value = animelemno(0)

[State 202, NotFrly]
type = Changeanim
trigger1 = 1
value = anim
elem = var(11)

[State 431, 4]
type = ChangeState
trigger1 = Time = 20
value = 11*(command = "holddown")
ctrl = 1

;crouch HK
[Statedef 410]
type    = C
movetype= A
physics = S
juggle  = 1
ctrl = 0
;anim = 410

[State 200, chg]
type = changeanim
trigger1 = anim != 11 && time = 0
value = 10

[State 200, chg]
type = changeanim
trigger1 = anim = 11 && time = 0
trigger2 = anim = 10 && animtime = 0
triggerall = p2dist x < -25 && selfanimexist(6)
value = 6
persistent = 0

[State 200, chg]
type = turn
trigger1 = anim = 6
persistent = 0

[State 200, chg]
type = changeanim
trigger1 = anim = 11 && time = 0
trigger2 = anim != 410 && animtime = 0
value = 410


[State 200, Playf]
type = PlaySnd
trigger1 = anim = 410 && animelem = 2
value = S1339,0
channel = 0

[State 410, 2]
type = HitDef
trigger1 = !movecontact
attr = C, NA
damage    = 70, 30
animtype  = LIGHT
;;Nothing = 10
hitflag = MAF
guardflag = M
pausetime = 2,2
sparkno = 1
sparkxy = -20,-40
guard.sparkno = 40
hitsound   = S1338,1
guardsound = F6,0
guard.ctrltime = 12
guard.slidetime = 12
ground.type = Low
ground.cornerpush.veloff = ifelse(p2statetype = A && p2movetype = H,0,-14)
ground.slidetime = 12
ground.hittime  = 12
p2facing = 1
ground.velocity = -4.5,0
air.velocity = -3,-6
yaccel = 0.5
air.fall = 1
fall.recover = 0
hitonce = 1
priority = 3, Miss

[State 240, 1.5]
type = varset
trigger1 = time = 0
trigger2 = animtime = 0
v = 11
value = 0

[State 240, 1.5]
type = varset
trigger1 = movecontact
v = 11
value = pos x
ignorehitpause = 1
persistent = 0

[State 240, 3]
type = selfstate
triggerall = roundstate = 2
triggerall = movehit
trigger1 = p2statetype = A && p2movetype = H && target,stateno = 5020
value = 419
ignorehitpause = 1

[State 240, 3]
type = selfstate
triggerall = movecontact = [1,2]
trigger1 = abs(pos x) > abs(var(11)) + 15
trigger2 = abs(pos x) < abs(var(11)) - 15
value = 409
ignorehitpause = 1

[State 600, 1.5]
type = targetvelset
trigger1 = moveguarded&&target,hitover = 0
x = -5
ignorehitpause = 1

[State 600, 1.5]
type = targetvelset
trigger1 = movehit
triggerall = target,statetype = S || target,statetype = C
triggerall = target,hitover = 0
x = -4.5
ignorehitpause = 1

[State 410, 4]
type = ChangeState
trigger1 = anim = 410 && AnimTime = 0
value = 11
ctrl = 1

[Statedef 419]; hk cancel
type    = S
movetype= I
physics = S
ctrl = 0

[State 240, 1.5]
type = varset
trigger1 = time = 0
v = 11
value = animelemno(0)

[State 202, NotFrly]
type = Changeanim
trigger1 = time < 12
value = anim
elem = var(11)

[State 431, 4]
type = ChangeState
trigger1 = animtime = 0
value = 11
ctrl = 1
;crouch LP
[Statedef 420]
type    = C
movetype= A
physics = S
juggle  = 1
ctrl = 0
;anim = 420

[State 200, chg]
type = changeanim
trigger1 = anim != 11 && time = 0
value = 10

[State 200, chg]
type = changeanim
trigger1 = anim = 11 && time = 0
trigger2 = anim = 10 && animtime = 0
triggerall = p2dist x < -25 && selfanimexist(6)
value = 6
persistent = 0

[State 200, chg]
type = turn
trigger1 = anim = 6
persistent = 0

[State 200, chg]
type = changeanim
trigger1 = anim = 11 && time = 0
trigger2 = anim != 420 && animtime = 0
value = 420

[State 200, Playf]
type = PlaySnd
trigger1 = anim = 420 && animelem = 2
value = S1339,1
channel = 0

[State 420, 2]
type = HitDef
trigger1 = !movecontact
attr = C, NA
damage    = 60, 20
animtype  = Light
air.animtype  = Back
air.velocity = -3,-6
yaccel = 0.5
sparkno = 1
sparkxy = 0, -30
guard.sparkno = 40
hitflag = MAF
guardflag = M
pausetime = 0,2
p2facing = 1
hitsound   = S1338,0
guardsound = F6,0
ground.type = Low
ground.slidetime = 12
ground.hittime  = 12
ground.velocity = -4
guard.ctrltime = 12
guard.velocity = -2
guard.slidetime = 12
ground.cornerpush.veloff = ifelse(p2statetype=A&&var(16) < 2,0,-15)
down.hittime = 12
fall.recover = 0
air.fall = 1
hitonce = 1
priority = 1, Miss

[State 240, 1.5]
type = varset
trigger1 = time = 0
triggerall = p2statetype != A || p2movetype != H
v = 16
value = 0

[State 240, 1.5]
type = varadd
trigger1 = time = 0 && p2statetype = A && p2movetype = H
v = 16
value = 1
ignorehitpause = 1
persistent = 0

[State 240, 1.5]
type = varset
trigger1 = time = 0
trigger2 = animtime = 0
v = 11
value = 0

[State 240, 1.5]
type = varset
trigger1 = movecontact
v = 11
value = pos x
ignorehitpause = 1
persistent = 0

[State 240, 3]
type = selfstate
triggerall = roundstate = 2
triggerall = movecontact = [1,2]
trigger1 = abs(pos x) > abs(var(11)) + 15
trigger2 = abs(pos x) < abs(var(11)) - 15
value = 429
ignorehitpause = 1


[State 600, 1.5]
type = targetvelset
trigger1 = moveguarded&&target,hitover = 0
x = -2
ignorehitpause = 1


[State 600, 1.5]
type = targetvelset
trigger1 = movehit
triggerall = target,statetype = S || target,statetype = C
triggerall = target,hitover = 0
x = -4
ignorehitpause = 1

[State 420, 4]
type = ChangeState
trigger1 = anim = 420 && AnimTime = 0
value = 11
ctrl = 1

[Statedef 429]; lp cancel
type    = S
movetype= I
physics = S
ctrl = 0

[State 202, NotFrly]
type = Changeanim
trigger1 = time > 2
value = anim
elem = 4

[State 431, 4]
type = ChangeState
trigger1 = Time = 20
value = 11*(command = "holddown")
ctrl = 1

;UPPERCUT
[Statedef 430]
type    = C
movetype= A
physics = S
juggle  = 5
ctrl = 0
velset = 0,0
;anim = 430
sprpriority = 2

[State 430, chg]
type = changeanim
trigger1 = anim != 11 && time = 0
value = 10

[State 430, chg]
type = changeanim
trigger1 = anim = 11 && time = 0
trigger2 = anim = 10 && animtime = 0
triggerall = p2dist x < -25 && selfanimexist(6)
value = 6
persistent = 0

[State 430, chg]
type = turn
trigger1 = anim = 6
persistent = 0

[State 430, chg]
type = changeanim
trigger1 = anim = 11 && time = 0
trigger2 = anim != 430 && animtime = 0
value = 430

[State 430, chg]
type = statetypeset
trigger1 = anim = 430 && animelem = 3
value = S

[State 430, 1]
type = PlaySnd
trigger1 = anim = 430 && animelem = 2
value = S1339,0


[State 430, 2]
type = HitDef
trigger1 = !MoveContact
triggerall = p2statetype != C || p2stateno = [120,159]
attr = C, NA
damage    = 110, 40
animtype  = Back
hitflag = MAF
guardflag = M
pausetime = 0,2
p1stateno = 431
sparkno = 1
sparkxy = -18,-100
guard.sparkno = 40
hitsound   = S1338,2
p2facing = 1
guardsound = F6,0
ground.cornerpush.veloff = -15
ground.type = High
guard.ctrltime = 16
guard.slidetime = 16
ground.slidetime = 16
ground.hittime  = 16
ground.velocity = -2,-12
air.velocity = -2,-12
yaccel = 0.375
envshake.time = 15
envshake.freq = 70
envshake.ampl = 7
fall.recover = 0
fall = 1
hitonce = 1
priority = 4, Miss

[State 430, 1.5]
type = varset
trigger1 = time = 0
trigger2 = animtime = 0
v = 11
value = 0

[State 430, 1.5]
type = varset
trigger1 = movecontact
v = 11
value = pos x
ignorehitpause = 1
persistent = 0

[State 430, 3]
type = selfstate
triggerall = roundstate = 2
triggerall = movecontact = [1,2]
trigger1 = abs(pos x) > abs(var(11)) + 20
trigger2 = abs(pos x) < abs(var(11)) - 20
value = 439
ignorehitpause = 1

[State 430, 1.5]
type = targetvelset
trigger1 = moveguarded&&target,hitover = 0
x = -4
ignorehitpause = 1

[State 430, 347]
type = EnvShake
trigger1 = moveguarded
time = 15
freq = 55
ampl = 5 
ignorehitpause = 1
persistent = 0

[State 430, 4]
type = ChangeState
trigger1 = anim = 430 && AnimTime = 0
value = 0
ctrl = 1


[Statedef 431]
type    = S
movetype= A
physics = S
ctrl = 0
anim = 431


[State 240, 1.5]
type = varset
trigger1 = time = 0
v = 11
value = pos x

[State 240, 3]
type = selfstate
triggerall = time < 2
triggerall = roundstate = 2
trigger1 = target,backedgebodydist < 10
;trigger1 = abs(pos x) > abs(var(11)) + 20
;trigger2 = abs(pos x) < abs(var(11)) - 20
value = 439
ignorehitpause = 1

[State 202, NotFrly]
type = Changeanim
triggerall = Time < 50
trigger1 = enemy,vel y < 0 
trigger2 = abs(p2dist y) > 180
triggerall = fvar(5) != 111
triggerall = roundstate = 2
value = 431

[State 202, NotFrly]
type = Changeanim
trigger1 = Time = 14
trigger1 = fvar(5) = 111
triggerall = roundstate = 2
value = 431
elem = 2

[State 431, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

[Statedef 432]
type    = S
movetype= I
physics = S
ctrl = 0

[State 240, 1.5]
type = varset
trigger1 = time = 0
v = 11
value = pos x

[State 240, 1.5]
type = varset
trigger1 = time = 0
v = 12
value = 0

[State 240, 3]
type = varset
triggerall = time = 1
trigger1 = abs(pos x) > abs(var(11)) + 20
trigger2 = abs(pos x) < abs(var(11)) - 20
v = 12
value = animelemno(-1)
ignorehitpause = 1

[State 202, NotFrly]
type = velset
trigger1 = time > 0
x = -0.1

[State 202, NotFrly]
type = Changeanim
trigger1 = var(12) > 0
value = anim
elem = var(12)

[State 431, 4]
type = ChangeState
trigger1 = AnimTime = 0
trigger2 = time > 60
value = 0
ctrl = 1

[Statedef 439]; upper cancel
type    = S
movetype= I
physics = S
ctrl = 0
anim = 431

[State var]
type = targetlifeadd
trigger1 = target,life < 2
trigger1 = var(9) = 0 || var(19) = 1
value = -1
kill = 1

[State 202, NotFrly]
type = Changeanim
trigger1 = 1
value = 431

[State 202, NotFrly]
type = velset
trigger1 = vel x = 0
x = -0.1

[State 431, 4]
type = ChangeState
trigger1 = Time = 60-40*(prevstateno = 430)
value = 0
ctrl = 1
