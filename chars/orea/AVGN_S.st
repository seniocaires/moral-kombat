;---------------------------------------------------------------------------
; Win state decider
[Statedef 180]
type = S

[State 180, 1]
type = ChangeState
trigger1 = Time = 0
value = 181

;---------------------------------------------------------------------------
[Statedef 181]
type = S
ctrl = 0
anim = 190
velset = 0,0

[State 181, 1]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1


;---------------------------------------------------------------------------
; Introduction
[Statedef 191]
type = S
ctrl = 0
anim = 190
velset = 0,0

[State 191, 2] ;Assert this until you want "round 1, fight" to begin
type = AssertSpecial
trigger1 = Time <= 200
flag = Intro

;---------------------------------------------------------------------------
;Run
[Statedef 100]
type    = A
physics = A
ctrl = 0
anim = 100
sprpriority = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = Time = 0
value = 40,0
volume = 255
channel = -1


[State 100, 1]
type = VelSet
trigger1 = Time = 0
x = const(velocity.run.fwd.x)
y = const(velocity.run.fwd.y)

[State 100, 2] ;Prevent run from canceling into walk
type = AssertSpecial
trigger1 = 1
flag = NoWalk

[State 100, 3] ;Prevent from turning
type = AssertSpecial
trigger1 = 1
flag = NoAutoTurn

[State 100, 4]
type = ChangeState
trigger1 = Pos y >= 1
value = 52

;---------------------------------------------------------------------------
; RUN_BACK2 (land)
[Statedef 106]
type    = S
physics = S
ctrl = 0
anim = 106

[State 106, 1]
type = VelSet
trigger1 = Time = 0
y = 0

[State 106, 2]
type = PosSet
trigger1 = Time = 0
y = 0

[State 106, 3]
type = MakeDust
trigger1 = Time = 2
pos = -5,-2
spacing = 1

[State 106, 4]
type = ChangeState
trigger1 = Time = 7
value = 0
ctrl = 1


;---------------------------------------------------------------------------
; Taunt
[Statedef 195]
type = S
ctrl = 0
anim = 195
velset = 0,0
movetype = I
physics = S
sprpriority = 2

[State 0, PowerAdd]
type = PowerAdd
trigger1 = Time = 119
value = 300

[State 195, 2]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Stand Light Kick
[Statedef 200]
type    = S                      ;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A                      ;Move-type: A-attack, I-idle, H-gethit
physics = S                      ;Physics: S-stand, C-crouch, A-air
juggle  = 1                      ;Number of air juggle points move takes
velset = 0,0                     ;Set velocity (x,y) (Def: no change)
ctrl = 0                         ;Set ctrl (Def: no change)
anim = 200                       ;Change animation (Def: no change)
poweradd = 30                    ;Power to add (Def: 0)
sprpriority = 2                  ;Set p1's sprite layering priority to 2 (in front)

[State 0, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 2
value = 0,0
volume = 255
channel = -1

[State 200, HitDef]
type = HitDef
trigger1 = AnimElem = 2
attr = S, NA                     ;Attribute: Standing, Normal Attack
damage = 25, 0                   ;Damage that move inflicts, guard damage
animtype = Light                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag = MA                   ;Flags on how move is to be guarded against
hitflag = MAF                    ;Flags of conditions that move can hit
priority = 3, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
;Hit/Miss/Dodge type (Def: Hit)
pausetime = 8, 8                 ;Time attacker pauses, time opponent shakes
sparkno = 0                      ;Spark anim no (Def: set above)
sparkxy = -10, -35               ;X-offset for the "hit spark" rel. to p2,
;Y-offset for the spark rel. to p1
hitsound = 5, 0                  ;Sound to play on hit
guardsound = 6, 0                ;Sound to play on guard
ground.type = Low               ;Type: High, Low, Trip (def: Normal)
ground.slidetime = 5             ;Time that the opponent slides back
ground.hittime  = 10             ;Time opponent is in hit state
ground.velocity = -7             ;Velocity at which opponent is pushed
airguard.velocity = -1.0,-.8     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
air.type = High                  ;Type: High, Low, Trip (def: same as ground.type)
air.velocity = -1.4,-3           ;X-velocity at which opponent is pushed,
;Y-velocity at which opponent is pushed
air.hittime = 12                 ;Time before opponent regains control in air

[State 200, CtrlSet]
type = CtrlSet
trigger1 = MoveHit
value = 1

[State 200, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Stand Medium Kick
[Statedef 205]
type    = S                      ;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A                      ;Move-type: A-attack, I-idle, H-gethit
physics = S                      ;Physics: S-stand, C-crouch, A-air
juggle  = 1                      ;Number of air juggle points move takes
velset = 0,0                     ;Set velocity (x,y) (Def: no change)
ctrl = 0                         ;Set ctrl (Def: no change)
anim = 205                       ;Change animation (Def: no change)
poweradd = 45                    ;Power to add (Def: 0)
sprpriority = 2                  ;Set p1's sprite layering priority to 2 (in front)

[State 205, HitDef]
type = HitDef
trigger1 = AnimElem = 2
attr = S, NA                     ;Attribute: Standing, Normal Attack
damage = 35, 0                   ;Damage that move inflicts, guard damage
animtype = Medium                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag = MA                   ;Flags on how move is to be guarded against
hitflag = MAF                    ;Flags of conditions that move can hit
priority = 3, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
;Hit/Miss/Dodge type (Def: Hit)
pausetime = 8, 8                 ;Time attacker pauses, time opponent shakes
sparkno = 0                      ;Spark anim no (Def: set above)
sparkxy = -10, -75               ;X-offset for the "hit spark" rel. to p2,
;Y-offset for the spark rel. to p1
hitsound = 5, 1                  ;Sound to play on hit
guardsound = 6, 0                ;Sound to play on guard
ground.type = High               ;Type: High, Low, Trip (def: Normal)
ground.slidetime = 5             ;Time that the opponent slides back
ground.hittime  = 10             ;Time opponent is in hit state
ground.velocity = -7             ;Velocity at which opponent is pushed
airguard.velocity = -1.0,-.8     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
air.type = High                  ;Type: High, Low, Trip (def: same as ground.type)
air.velocity = -1.4,-3           ;X-velocity at which opponent is pushed,
;Y-velocity at which opponent is pushed
air.hittime = 12                 ;Time before opponent regains control in air

[State 0, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 2
value = 0,1
volume = 255
channel = -1

[State 205, CtrlSet]
type = CtrlSet
trigger1 = MoveHit
value = 1

[State 205, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Pen
[Statedef 207]
type    = S                      ;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A                      ;Move-type: A-attack, I-idle, H-gethit
physics = S                      ;Physics: S-stand, C-crouch, A-air
juggle  = 1                      ;Number of air juggle points move takes
velset = 0,0                     ;Set velocity (x,y) (Def: no change)
ctrl = 0                         ;Set ctrl (Def: no change)
anim = 210                       ;Change animation (Def: no change)
poweradd = 1                    ;Power to add (Def: 0)
sprpriority = 2                  ;Set p1's sprite layering priority to 2 (in front)

[State 0, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 1
value = 0,0
volume = 255
channel = -1

[State 0, Projectile]
type = Projectile
trigger1 = Time = 1
trigger1 = Random <= 332
projanim = 207
projscale = 1,1
projremovetime = -1
velocity = 6,0
remvelocity = 0,0
velmul = 1
projhits = 1
projpriority = 1
projsprpriority = -1
projedgebound = 40
projstagebound = 40
projheightbound = -240
offset = 5,-80
postype = p1         ;p2,front,back,left,right
projshadow = 0,0,0
supermovetime = 0
pausemovetime = 0
attr = S,SP        ;SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
hitflag = MAF        ;HLAFD+-
guardflag = MA         ;HLA
getpower = 0,0
givepower = 0,0
animtype = light          ;light,medium,hard,back,up,diagup
air.animtype = light
priority = 4,Hit   ;Hit,Miss,Dodge
damage = 1,0
pausetime = 0,0
;guard.pause,0
sparkno = 0
guard.sparkno = 0
sparkxy = 0,0
hitsound = 5,0
guardsound = 0,0
ground.type = High

[State 0, Projectile]
type = Projectile
trigger1 = Time = 1
trigger1 = Random >= 333
trigger1 = Random <= 665
projanim = 208
projscale = 1,1
projremovetime = -1
velocity = 6,0
remvelocity = 0,0
velmul = 1
projhits = 1
projpriority = 1
projsprpriority = -1
projedgebound = 40
projstagebound = 40
projheightbound = -240
offset = 5,-80
postype = p1         ;p2,front,back,left,right
projshadow = 0,0,0
supermovetime = 0
pausemovetime = 0
attr = S,SP        ;SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
hitflag = MAF        ;HLAFD+-
guardflag = MA         ;HLA
getpower = 0,0
givepower = 0,0
animtype = light          ;light,medium,hard,back,up,diagup
air.animtype = light
priority = 4,Hit   ;Hit,Miss,Dodge
damage = 1,0
pausetime = 0,0
;guard.pause,0
sparkno = 0
guard.sparkno = 0
sparkxy = 0,0
hitsound = 5,0
guardsound = 0,0
ground.type = High

[State 0, Projectile]
type = Projectile
trigger1 = Time = 1
trigger1 = Random >= 666
projanim = 209
projscale = 1,1
projremovetime = -1
velocity = 6,0
remvelocity = 0,0
velmul = 1
projhits = 1
projpriority = 1
projsprpriority = -1
projedgebound = 40
projstagebound = 40
projheightbound = -240
offset = 5,-80
postype = p1         ;p2,front,back,left,right
projshadow = 0,0,0
supermovetime = 0
pausemovetime = 0
attr = S,SP        ;SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
hitflag = MAF        ;HLAFD+-
guardflag = MA         ;HLA
getpower = 0,0
givepower = 0,0
animtype = light          ;light,medium,hard,back,up,diagup
air.animtype = light
priority = 4,Hit   ;Hit,Miss,Dodge
damage = 1,0
pausetime = 0,0
;guard.pause,0
sparkno = 0
guard.sparkno = 0
sparkxy = 0,0
hitsound = 5,0
guardsound = 0,0
ground.type = High

[State 205, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Stand Light Punch
[Statedef 210]
type    = S                      ;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A                      ;Move-type: A-attack, I-idle, H-gethit
physics = S                      ;Physics: S-stand, C-crouch, A-air
juggle  = 1                      ;Number of air juggle points move takes
velset = 0,0                     ;Set velocity (x,y) (Def: no change)
ctrl = 0                         ;Set ctrl (Def: no change)
anim = 210                       ;Change animation (Def: no change)
poweradd = 25                    ;Power to add (Def: 0)
sprpriority = 2                  ;Set p1's sprite layering priority to 2 (in front)

[State 205, HitDef]
type = HitDef
trigger1 = AnimElem = 1
attr = S, NA                     ;Attribute: Standing, Normal Attack
damage = 20, 0                   ;Damage that move inflicts, guard damage
animtype = Light                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag = MA                   ;Flags on how move is to be guarded against
hitflag = MAF                    ;Flags of conditions that move can hit
priority = 3, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
;Hit/Miss/Dodge type (Def: Hit)
pausetime = 8, 8                 ;Time attacker pauses, time opponent shakes
sparkno = 0                      ;Spark anim no (Def: set above)
sparkxy = -10, -75               ;X-offset for the "hit spark" rel. to p2,
;Y-offset for the spark rel. to p1
hitsound = 5, 0                  ;Sound to play on hit
guardsound = 6, 0                ;Sound to play on guard
ground.type = High               ;Type: High, Low, Trip (def: Normal)
ground.slidetime = 5             ;Time that the opponent slides back
ground.hittime  = 10             ;Time opponent is in hit state
ground.velocity = -7             ;Velocity at which opponent is pushed
airguard.velocity = -1.0,-.8     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
air.type = High                  ;Type: High, Low, Trip (def: same as ground.type)
air.velocity = -1.4,-3           ;X-velocity at which opponent is pushed,
;Y-velocity at which opponent is pushed
air.hittime = 12                 ;Time before opponent regains control in air

[State 0, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 1
value = 0,1
volume = 255
channel = -1

[State 205, CtrlSet]
type = CtrlSet
trigger1 = MoveHit
value = 1

[State 205, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Stand Medium Punch
[Statedef 215]
type    = S                      ;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A                      ;Move-type: A-attack, I-idle, H-gethit
physics = S                      ;Physics: S-stand, C-crouch, A-air
juggle  = 1                      ;Number of air juggle points move takes
velset = 0,0                     ;Set velocity (x,y) (Def: no change)
ctrl = 0                         ;Set ctrl (Def: no change)
anim = 215                       ;Change animation (Def: no change)
poweradd = 45                    ;Power to add (Def: 0)
sprpriority = 2                  ;Set p1's sprite layering priority to 2 (in front)

[State 215, HitDef]
type = HitDef
trigger1 = AnimElem = 2
attr = S, NA                     ;Attribute: Standing, Normal Attack
damage = 35, 0                   ;Damage that move inflicts, guard damage
animtype = Medium                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag = MA                   ;Flags on how move is to be guarded against
hitflag = MAF                    ;Flags of conditions that move can hit
priority = 3, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
;Hit/Miss/Dodge type (Def: Hit)
pausetime = 8, 8                 ;Time attacker pauses, time opponent shakes
sparkno = 0                      ;Spark anim no (Def: set above)
sparkxy = -10, -55               ;X-offset for the "hit spark" rel. to p2,
;Y-offset for the spark rel. to p1
hitsound = 5, 1                  ;Sound to play on hit
guardsound = 6, 0                ;Sound to play on guard
ground.type = High               ;Type: High, Low, Trip (def: Normal)
ground.slidetime = 5             ;Time that the opponent slides back
ground.hittime  = 10             ;Time opponent is in hit state
ground.velocity = -7             ;Velocity at which opponent is pushed
airguard.velocity = -1.0,-.8     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
air.type = High                  ;Type: High, Low, Trip (def: same as ground.type)
air.velocity = -1.4,-3           ;X-velocity at which opponent is pushed,
;Y-velocity at which opponent is pushed
air.hittime = 12                 ;Time before opponent regains control in air

[State 0, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 2
value = 0,1
volume = 255
channel = -1

[State 205, CtrlSet]
type = CtrlSet
trigger1 = MoveHit
value = 1

[State 205, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Stand Strong Punch
[Statedef 217]
type    = S                      ;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A                      ;Move-type: A-attack, I-idle, H-gethit
physics = S                      ;Physics: S-stand, C-crouch, A-air
juggle  = 1                      ;Number of air juggle points move takes
velset = 0,0                     ;Set velocity (x,y) (Def: no change)
ctrl = 0                         ;Set ctrl (Def: no change)
anim = 217                       ;Change animation (Def: no change)
poweradd = 45                    ;Power to add (Def: 0)
sprpriority = 2                  ;Set p1's sprite layering priority to 2 (in front)

[State 217, HitDef]
type = HitDef
trigger1 = AnimElem = 3
attr = S, NA                     ;Attribute: Standing, Normal Attack
damage = 65, 0                   ;Damage that move inflicts, guard damage
animtype = Heavy                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag = MA                   ;Flags on how move is to be guarded against
hitflag = MAF                    ;Flags of conditions that move can hit
priority = 3, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
;Hit/Miss/Dodge type (Def: Hit)
pausetime = 8, 8                 ;Time attacker pauses, time opponent shakes
sparkno = 0                      ;Spark anim no (Def: set above)
sparkxy = -10, -55               ;X-offset for the "hit spark" rel. to p2,
;Y-offset for the spark rel. to p1
hitsound = 5, 2                  ;Sound to play on hit
guardsound = 6, 0                ;Sound to play on guard
ground.type = High               ;Type: High, Low, Trip (def: Normal)
ground.slidetime = 5             ;Time that the opponent slides back
ground.hittime  = 10             ;Time opponent is in hit state
ground.velocity = -9             ;Velocity at which opponent is pushed
airguard.velocity = -1.0,-.9     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
air.type = High                  ;Type: High, Low, Trip (def: same as ground.type)
air.velocity = -1.4,-8           ;X-velocity at which opponent is pushed,
;Y-velocity at which opponent is pushed
air.hittime = 12                 ;Time before opponent regains control in air

[State 0, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 2
value = 0,1
volume = 255
channel = -1

[State 0, VelAdd]
type = VelAdd
trigger1 = AnimElem = 2
x = 3

[State 205, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Super Scope
[Statedef 500]
type    = S                      ;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A                      ;Move-type: A-attack, I-idle, H-gethit
physics = S                      ;Physics: S-stand, C-crouch, A-air
juggle  = 1                      ;Number of air juggle points move takes
velset = 0,0                     ;Set velocity (x,y) (Def: no change)
ctrl = 0                         ;Set ctrl (Def: no change)
anim = 500                       ;Change animation (Def: no change)
poweradd = 30                    ;Power to add (Def: 0)
sprpriority = 2                  ;Set p1's sprite layering priority to 2 (in front)

[State 0, Helper]
type = Helper
trigger1 = Time >= 15
trigger1 = NumHelper(500) = 0
helpertype = normal ;player
ID = 500
name = "Scope Orb"
stateno = 505
pos = 25,-72
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 1
ownpal = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = Time = 16
value = 500,2
volume = 255
channel = 5

[State 205, ChangeState]
type = ChangeState
trigger1 = command != "holdC"
trigger1 = Time <= 15
value = 501
ctrl = 1

[State 205, ChangeState]
type = ChangeState
trigger1 = command != "holdC"
trigger1 = Time >= 15
trigger2 = time >= 125
value = 502
ctrl = 1

;---------------------------------------------------------------------------
; Super Scope
[Statedef 501]
type    = S                      ;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A                      ;Move-type: A-attack, I-idle, H-gethit
physics = S                      ;Physics: S-stand, C-crouch, A-air
juggle  = 1                      ;Number of air juggle points move takes
velset = 0,0                     ;Set velocity (x,y) (Def: no change)
ctrl = 0                         ;Set ctrl (Def: no change)
anim = 501                       ;Change animation (Def: no change)
poweradd = 30                    ;Power to add (Def: 0)
sprpriority = 2                  ;Set p1's sprite layering priority to 2 (in front)

[State 0, PlaySnd]
type = PlaySnd
trigger1 = Time = 1
trigger2 = Time = 9
trigger3 = Time = 18
value = 500,0
volume = 255
channel = 5

[State 0, Projectile]
type = Projectile
trigger1 = Time = 1
trigger2 = Time = 9
trigger3 = Time = 18
projanim = 506
projscale = 0.05,0.05
projremovetime = -1
velocity = 6,0
remvelocity = 0,0
velmul = 1
projhits = 1
projpriority = 1
projsprpriority = -1
projedgebound = 40
projstagebound = 40
projheightbound = -240
offset = 5,-72
postype = p1         ;p2,front,back,left,right
projshadow = 0,0,0
supermovetime = 0
pausemovetime = 0
attr = S,SP        ;SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
hitflag = MAF        ;HLAFD+-
guardflag = MA         ;HLA
getpower = 0,0
givepower = 0,0
animtype = light          ;light,medium,hard,back,up,diagup
air.animtype = light
priority = 4,Hit   ;Hit,Miss,Dodge
damage = 15,0
pausetime = 0,0
;guard.pause,0
sparkno = 0
guard.sparkno = 0
sparkxy = 0,0
hitsound = 0,0
guardsound = 0,0
ground.type = High

[State 205, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Super Scope
[Statedef 502]
type    = S                      ;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A                      ;Move-type: A-attack, I-idle, H-gethit
physics = S                      ;Physics: S-stand, C-crouch, A-air
juggle  = 1                      ;Number of air juggle points move takes
velset = 0,0                     ;Set velocity (x,y) (Def: no change)
ctrl = 0                         ;Set ctrl (Def: no change)
anim = 501                       ;Change animation (Def: no change)
poweradd = 30                    ;Power to add (Def: 0)
sprpriority = 2                  ;Set p1's sprite layering priority to 2 (in front)

[State 205, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Scope Orb
[Statedef 505]
type    = S                      ;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A                      ;Move-type: A-attack, I-idle, H-gethit
physics = S                      ;Physics: S-stand, C-crouch, A-air
scale = .1,.1
juggle  = 1                      ;Number of air juggle points move takes
ctrl = 0                         ;Set ctrl (Def: no change)
velset = 0,0                     ;Set velocity (x,y) (Def: no change)                       ;Set ctrl (Def: no change)
anim = 505                       ;Change animation (Def: no change)
poweradd = 30                    ;Power to add (Def: 0)
sprpriority = 3                  ;Set p1's sprite layering priority to 2 (in front)

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 0, AngleDraw]
type = AngleDraw
trigger1 = 1
scale = .1,.1

[State 205, ChangeState]
type = ChangeState
trigger1 = command != "holdC"
trigger1 = Time >= 5
value = 508
ctrl = 1

[State 205, ChangeState]
type = ChangeState
trigger1 = Time >= 30
value = 506
ctrl = 1

;---------------------------------------------------------------------------
; Scope Orb
[Statedef 506]
type    = S                      ;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A                      ;Move-type: A-attack, I-idle, H-gethit
physics = S                      ;Physics: S-stand, C-crouch, A-air
scale - .25,.25
juggle  = 1                      ;Number of air juggle points move takes
ctrl = 0                         ;Set ctrl (Def: no change)
velset = 0,0                     ;Set velocity (x,y) (Def: no change)                       ;Set ctrl (Def: no change)
anim = 505                       ;Change animation (Def: no change)
poweradd = 30                    ;Power to add (Def: 0)
sprpriority = 3                  ;Set p1's sprite layering priority to 2 (in front)

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 0, AngleDraw]
type = AngleDraw
trigger1 = 1
scale = .25,.25

[State 205, ChangeState]
type = ChangeState
trigger1 = command != "holdC"
value = 509
ctrl = 1

[State 205, ChangeState]
type = ChangeState
trigger1 = Time >= 30
value = 507
ctrl = 1

;---------------------------------------------------------------------------
; Scope Orb
[Statedef 507]
type    = S                      ;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A                      ;Move-type: A-attack, I-idle, H-gethit
physics = S                      ;Physics: S-stand, C-crouch, A-air
scale - .50,.50
juggle  = 1                      ;Number of air juggle points move takes
ctrl = 0                         ;Set ctrl (Def: no change)
velset = 0,0                     ;Set velocity (x,y) (Def: no change)                      ;Set ctrl (Def: no change)
anim = 505                       ;Change animation (Def: no change)
poweradd = 30                    ;Power to add (Def: 0)
sprpriority = 3                  ;Set p1's sprite layering priority to 2 (in front)

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 0, AngleDraw]
type = AngleDraw
trigger1 = 1
scale = .50,.50

[State 205, ChangeState]
type = ChangeState
trigger1 = command != "holdC"
value = 510
ctrl = 1

[State 205, ChangeState]
type = ChangeState
trigger1 = Time >= 50
value = 511
ctrl = 1

;---------------------------------------------------------------------------
; Scope Orb
[Statedef 508]
type    = S                      ;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A                      ;Move-type: A-attack, I-idle, H-gethit
physics = S                      ;Physics: S-stand, C-crouch, A-air
scale - .10,.10
juggle  = 1                      ;Number of air juggle points move takes
velset = 13,0                     ;Set velocity (x,y) (Def: no change)
ctrl = 0                         ;Set ctrl (Def: no change)
anim = 506                       ;Change animation (Def: no change)
poweradd = 30                    ;Power to add (Def: 0)
sprpriority = 3                  ;Set p1's sprite layering priority to 2 (in front)

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 0, VelSet]
type = VelSet
trigger1 = 1
x = 10

[State 0, AngleDraw]
type = AngleDraw
trigger1 = 1
scale = .10,.10

[State 0, PlaySnd]
type = PlaySnd
trigger1 = Time = 1
value = 500,1
volume = 255
channel = 5

[State 300, HitDef]
type = HitDef
trigger1 = AnimElem = 1
attr = S, NA                     ;Attribute: Standing, Normal Attack
damage = 45, 0                   ;Damage that move inflicts, guard damage
animtype = Medium                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag = MA                   ;Flags on how move is to be guarded against
hitflag = MAF                    ;Flags of conditions that move can hit
priority = 3, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
pausetime = 8, 8                 ;Time attacker pauses, time opponent shakes
sparkno = 0                      ;Spark anim no (Def: set above)
sparkxy = -0, -0               ;X-offset for the "hit spark" rel. to p2,
;Y-offset for the spark rel. to p1
hitsound = 5, 0                  ;Sound to play on hit
guardsound = 6, 0                ;Sound to play on guard
ground.type = High               ;Type: High, Low, Trip (def: Normal)
ground.slidetime = 5             ;Time that the opponent slides back
ground.hittime  = 10             ;Time opponent is in hit state
ground.velocity = -7             ;Velocity at which opponent is pushed
airguard.velocity = -1.0,-.9     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
air.type = High                  ;Type: High, Low, Trip (def: same as ground.type)
air.velocity = -1.4,-2           ;X-velocity at which opponent is pushed,
;Y-velocity at which opponent is pushed
air.hittime = 12                 ;Time before opponent regains control in air

[State 0, DestroySelf]
type = DestroySelf
trigger1 = movehit
trigger2 = time = 120

;---------------------------------------------------------------------------
; Scope Orb
[Statedef 509]
type    = S                      ;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A                      ;Move-type: A-attack, I-idle, H-gethit
physics = S                      ;Physics: S-stand, C-crouch, A-air
scale - .25,.25
juggle  = 1                      ;Number of air juggle points move takes
velset = 13,0                     ;Set velocity (x,y) (Def: no change)
ctrl = 0                         ;Set ctrl (Def: no change)
anim = 508                       ;Change animation (Def: no change)
poweradd = 30                    ;Power to add (Def: 0)
sprpriority = 3                  ;Set p1's sprite layering priority to 2 (in front)

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 0, VelSet]
type = VelSet
trigger1 = 1
x = 10

[State 0, AngleDraw]
type = AngleDraw
trigger1 = 1
scale = .25,.25

[State 0, PlaySnd]
type = PlaySnd
trigger1 = Time = 1
value = 500,1
volume = 255
channel = 5

[State 300, HitDef]
type = HitDef
trigger1 = AnimElem = 1
attr = S, NA                     ;Attribute: Standing, Normal Attack
damage = 65, 0                   ;Damage that move inflicts, guard damage
animtype = Medium                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag = MA                   ;Flags on how move is to be guarded against
hitflag = MAF                    ;Flags of conditions that move can hit
priority = 3, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
pausetime = 8, 8                 ;Time attacker pauses, time opponent shakes
sparkno = 0                      ;Spark anim no (Def: set above)
sparkxy = -0, -0               ;X-offset for the "hit spark" rel. to p2,
;Y-offset for the spark rel. to p1
hitsound = 5, 0                  ;Sound to play on hit
guardsound = 6, 0                ;Sound to play on guard
ground.type = High               ;Type: High, Low, Trip (def: Normal)
ground.slidetime = 5             ;Time that the opponent slides back
ground.hittime  = 10             ;Time opponent is in hit state
ground.velocity = -7             ;Velocity at which opponent is pushed
airguard.velocity = -1.0,-.9     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
air.type = High                  ;Type: High, Low, Trip (def: same as ground.type)
air.velocity = -1.4,-2           ;X-velocity at which opponent is pushed,
;Y-velocity at which opponent is pushed
air.hittime = 12                 ;Time before opponent regains control in air

[State 0, DestroySelf]
type = DestroySelf
trigger1 = movehit
trigger2 = time = 120

;---------------------------------------------------------------------------
; Scope Orb
[Statedef 510]
type    = S                      ;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A                      ;Move-type: A-attack, I-idle, H-gethit
physics = S                      ;Physics: S-stand, C-crouch, A-air
scale - .50,.50
juggle  = 1                      ;Number of air juggle points move takes
velset = 13,0                     ;Set velocity (x,y) (Def: no change)
ctrl = 0                         ;Set ctrl (Def: no change)
anim = 510                       ;Change animation (Def: no change)
poweradd = 30                    ;Power to add (Def: 0)
sprpriority = 3                  ;Set p1's sprite layering priority to 2 (in front)

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 0, VelSet]
type = VelSet
trigger1 = 1
x = 10

[State 0, AngleDraw]
type = AngleDraw
trigger1 = 1
scale = .50,.50

[State 0, PlaySnd]
type = PlaySnd
trigger1 = Time = 1
value = 500,1
volume = 255
channel = 5

[State 300, HitDef]
type = HitDef
trigger1 = AnimElem = 1
attr = S, NA                     ;Attribute: Standing, Normal Attack
damage = 90, 0                   ;Damage that move inflicts, guard damage
animtype = Heavy                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag = MA                   ;Flags on how move is to be guarded against
hitflag = MAF                    ;Flags of conditions that move can hit
priority = 3, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
pausetime = 8, 8                 ;Time attacker pauses, time opponent shakes
sparkno = 0                      ;Spark anim no (Def: set above)
sparkxy = -0, -0               ;X-offset for the "hit spark" rel. to p2,
;Y-offset for the spark rel. to p1
hitsound = 5, 0                  ;Sound to play on hit
guardsound = 6, 0                ;Sound to play on guard
ground.type = High               ;Type: High, Low, Trip (def: Normal)
ground.slidetime = 5             ;Time that the opponent slides back
ground.hittime  = 10             ;Time opponent is in hit state
ground.velocity = -7             ;Velocity at which opponent is pushed
airguard.velocity = -1.0,-.9     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
air.type = High                  ;Type: High, Low, Trip (def: same as ground.type)
air.velocity = -1.4,-2           ;X-velocity at which opponent is pushed,
;Y-velocity at which opponent is pushed
air.hittime = 12                 ;Time before opponent regains control in air

[State 0, DestroySelf]
type = DestroySelf
trigger1 = movehit
trigger2 = time = 120

;---------------------------------------------------------------------------
; Scope Orb
[Statedef 511]
type    = S                      ;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A                      ;Move-type: A-attack, I-idle, H-gethit
physics = S                      ;Physics: S-stand, C-crouch, A-air
scale - .60,.60
juggle  = 1                      ;Number of air juggle points move takes
velset = 13,0                     ;Set velocity (x,y) (Def: no change)
ctrl = 0                         ;Set ctrl (Def: no change)
anim = 511                       ;Change animation (Def: no change)
poweradd = 30                    ;Power to add (Def: 0)
sprpriority = 3                 ;Set p1's sprite layering priority to 2 (in front)

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 0, VelSet]
type = VelSet
trigger1 = 1
x = 10

[State 0, AngleDraw]
type = AngleDraw
trigger1 = 1
scale = .60,.60

[State 0, PlaySnd]
type = PlaySnd
trigger1 = Time = 1
value = 500,1
volume = 255
channel = 5

[State 300, HitDef]
type = HitDef
trigger1 = AnimElem = 1
attr = S, NA                     ;Attribute: Standing, Normal Attack
damage = 110, 0                   ;Damage that move inflicts, guard damage
animtype = Heavy                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag = MA                   ;Flags on how move is to be guarded against
hitflag = MAF                    ;Flags of conditions that move can hit
priority = 3, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
pausetime = 8, 8                 ;Time attacker pauses, time opponent shakes
sparkno = 0                      ;Spark anim no (Def: set above)
sparkxy = -0, -0               ;X-offset for the "hit spark" rel. to p2,
;Y-offset for the spark rel. to p1
hitsound = 5, 0                  ;Sound to play on hit
guardsound = 6, 0                ;Sound to play on guard
ground.type = Trip              ;Type: High, Low, Trip (def: Normal)
ground.slidetime = 5             ;Time that the opponent slides back
ground.hittime  = 10             ;Time opponent is in hit state
ground.velocity = -11,-3             ;Velocity at which opponent is pushed
airguard.velocity = -1.0,-.9     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
air.type = Trip                  ;Type: High, Low, Trip (def: same as ground.type)
air.velocity = -11.4,-3           ;X-velocity at which opponent is pushed,
;Y-velocity at which opponent is pushed
air.hittime = 12                 ;Time before opponent regains control in air

[State 0, DestroySelf]
type = DestroySelf
trigger1 = movehit
trigger2 = time = 120

;---------------------------------------------------------------------------
; Power Glove Light
[Statedef 530]
type    = S                      ;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A                      ;Move-type: A-attack, I-idle, H-gethit
physics = S                      ;Physics: S-stand, C-crouch, A-air
juggle  = 1                      ;Number of air juggle points move takes
velset = 0,0                     ;Set velocity (x,y) (Def: no change)
ctrl = 0                         ;Set ctrl (Def: no change)
anim = 530                       ;Change animation (Def: no change)
poweradd = 60                    ;Power to add (Def: 0)
sprpriority = 2                  ;Set p1's sprite layering priority to 2 (in front)

[State 0, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 2
value = 0,0
volume = 255
channel = -1

[State 200, HitDef]
type = HitDef
trigger1 = AnimElem = 2
attr = S, NA                     ;Attribute: Standing, Normal Attack
damage = 60, 0                   ;Damage that move inflicts, guard damage
animtype = Medium                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag = MA                   ;Flags on how move is to be guarded against
hitflag = MAF                    ;Flags of conditions that move can hit
priority = 3, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
;Hit/Miss/Dodge type (Def: Hit)
pausetime = 8, 8                 ;Time attacker pauses, time opponent shakes
sparkno = 0                      ;Spark anim no (Def: set above)
sparkxy = -10, -35               ;X-offset for the "hit spark" rel. to p2,
;Y-offset for the spark rel. to p1
hitsound = 5, 1                  ;Sound to play on hit
guardsound = 6, 0                ;Sound to play on guard
ground.type = Trip              ;Type: High, Low, Trip (def: Normal)
ground.slidetime = 5             ;Time that the opponent slides back
ground.hittime  = 10             ;Time opponent is in hit state
ground.velocity = -7,-1             ;Velocity at which opponent is pushed
airguard.velocity = -1.0,-.8     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
air.type = High                  ;Type: High, Low, Trip (def: same as ground.type)
air.velocity = -1.4,-3           ;X-velocity at which opponent is pushed,
;Y-velocity at which opponent is pushed
air.hittime = 12                 ;Time before opponent regains control in air

[State 0, VelAdd]
type = VelAdd
trigger1 = AnimElem = 2
x = 6

[State 200, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Power Glove Medium
[Statedef 535]
type    = S                      ;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A                      ;Move-type: A-attack, I-idle, H-gethit
physics = S                      ;Physics: S-stand, C-crouch, A-air
juggle  = 9                      ;Number of air juggle points move takes
velset = 0,0                     ;Set velocity (x,y) (Def: no change)
ctrl = 0                         ;Set ctrl (Def: no change)
anim = 535                       ;Change animation (Def: no change)
poweradd = 60                    ;Power to add (Def: 0)
sprpriority = 2                  ;Set p1's sprite layering priority to 2 (in front)

[State 0, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 3
value = 0,0
volume = 255
channel = -1

[State 200, HitDef]
type = HitDef
trigger1 = AnimElem = 3
attr = S, NA                     ;Attribute: Standing, Normal Attack
damage = 60, 0                   ;Damage that move inflicts, guard damage
animtype = Medium                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag = MA                   ;Flags on how move is to be guarded against
hitflag = MAF                    ;Flags of conditions that move can hit
priority = 3, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
;Hit/Miss/Dodge type (Def: Hit)
pausetime = 8, 8                 ;Time attacker pauses, time opponent shakes
sparkno = 0                      ;Spark anim no (Def: set above)
sparkxy = -10, -35               ;X-offset for the "hit spark" rel. to p2,
;Y-offset for the spark rel. to p1
hitsound = 5, 3                  ;Sound to play on hit
guardsound = 6, 0                ;Sound to play on guard
ground.type = Trip              ;Type: High, Low, Trip (def: Normal)
ground.slidetime = 5             ;Time that the opponent slides back
ground.hittime  = 10             ;Time opponent is in hit state
ground.velocity = -3,-9             ;Velocity at which opponent is pushed
airguard.velocity = -1.0,-.8     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
air.type = High                 ;Type: High, Low, Trip (def: same as ground.type)
air.velocity = -7.4,-3           ;X-velocity at which opponent is pushed,
;Y-velocity at which opponent is pushed
air.hittime = 12                 ;Time before opponent regains control in air

[State 0, VelAdd]
type = VelAdd
trigger1 = AnimElem = 2
x = 9

[State 200, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Power Glove Strong
[Statedef 537]
type    = S                      ;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A                      ;Move-type: A-attack, I-idle, H-gethit
physics = S                      ;Physics: S-stand, C-crouch, A-air
juggle  = 9                      ;Number of air juggle points move takes
velset = 0,0                     ;Set velocity (x,y) (Def: no change)
ctrl = 0                         ;Set ctrl (Def: no change)
anim = 537                       ;Change animation (Def: no change)
poweradd = 60                    ;Power to add (Def: 0)
sprpriority = 2                  ;Set p1's sprite layering priority to 2 (in front)

[State 0, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 3
trigger2 = AnimElem = 5
trigger3 = AnimElem = 7
trigger4 = AnimElem = 9
trigger5 = AnimElem = 11
trigger6 = AnimElem = 13
trigger7 = AnimElem = 15
trigger8 = AnimElem = 17
value = 0,0
volume = 255
channel = -1

[State 200, HitDef]
type = HitDef
trigger1 = AnimElem = 3
trigger2 = AnimElem = 5
trigger3 = AnimElem = 7
trigger4 = AnimElem = 9
trigger5 = AnimElem = 11
trigger6 = AnimElem = 13
trigger7 = AnimElem = 15
trigger8 = AnimElem = 17
attr = S, NA                     ;Attribute: Standing, Normal Attack
damage = 15, 0                   ;Damage that move inflicts, guard damage
animtype = Medium                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag = MA                   ;Flags on how move is to be guarded against
hitflag = MAF                    ;Flags of conditions that move can hit
priority = 3, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
;Hit/Miss/Dodge type (Def: Hit)
pausetime = 2, 8                 ;Time attacker pauses, time opponent shakes
sparkno = -1                      ;Spark anim no (Def: set above)
sparkxy = -5, -65               ;X-offset for the "hit spark" rel. to p2,
;Y-offset for the spark rel. to p1
hitsound = 5, 0                  ;Sound to play on hit
guardsound = 6, 0                ;Sound to play on guard
ground.type = High              ;Type: High, Low, Trip (def: Normal)
ground.slidetime = 5             ;Time that the opponent slides back
ground.hittime  = 10             ;Time opponent is in hit state
ground.velocity = -3             ;Velocity at which opponent is pushed
airguard.velocity = -1.0,-.8     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
air.type = High                 ;Type: High, Low, Trip (def: same as ground.type)
air.velocity = -1.4,-1           ;X-velocity at which opponent is pushed,
;Y-velocity at which opponent is pushed
air.hittime = 12                 ;Time before opponent regains control in air

[State 0, VelAdd]
type = VelAdd
trigger1 = AnimElem = 2
x = 6.5

[State 200, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Super Glove
[Statedef 550]
type    = S                      ;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A                      ;Move-type: A-attack, I-idle, H-gethit
physics = S                      ;Physics: S-stand, C-crouch, A-air
juggle  = 9                      ;Number of air juggle points move takes
velset = 0,0                     ;Set velocity (x,y) (Def: no change)
ctrl = 0                         ;Set ctrl (Def: no change)
anim = 550                       ;Change animation (Def: no change)
poweradd = -1000                    ;Power to add (Def: 0)
sprpriority = 2                  ;Set p1's sprite layering priority to 2 (in front)

[State 0, Pause]
type = Pause
trigger1 = AnimElem = 1
time = 30
movetime = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 1
value = 700,1
volume = 255
channel = -1

[State 0, Explod]
type = Explod
trigger1 = AnimElem = 1
anim = 600
pos = 0,-50
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
supermovetime = 30
pausemovetime = 30
scale = 1,1
sprpriority = 4
ontop = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 3
trigger2 = AnimElem = 5
trigger3 = AnimElem = 7
trigger4 = AnimElem = 9
trigger5 = AnimElem = 11
trigger6 = AnimElem = 13
trigger7 = AnimElem = 15
trigger8 = AnimElem = 17
trigger9 = AnimElem = 19
trigger10 = AnimElem = 21
trigger11 = AnimElem = 23
trigger12 = AnimElem = 25
trigger13 = AnimElem = 27
trigger14 = AnimElem = 29
trigger15 = AnimElem = 31
trigger16 = AnimElem = 33
trigger17 = AnimElem = 35
trigger18 = AnimElem = 37
trigger19 = AnimElem = 39
trigger20 = AnimElem = 41
trigger21 = AnimElem = 43
trigger22 = AnimElem = 45
trigger23 = AnimElem = 47
trigger24 = AnimElem = 49
trigger25 = AnimElem = 51
trigger26 = AnimElem = 53
trigger27 = AnimElem = 55
value = 0,0
volume = 255
channel = -1

[State 200, HitDef]
type = HitDef
trigger1 = AnimElem = 3
trigger2 = AnimElem = 5
trigger3 = AnimElem = 7
trigger4 = AnimElem = 9
trigger5 = AnimElem = 11
trigger6 = AnimElem = 13
trigger7 = AnimElem = 15
trigger8 = AnimElem = 17
trigger9 = AnimElem = 19
trigger10 = AnimElem = 21
trigger11 = AnimElem = 23
trigger12 = AnimElem = 25
trigger13 = AnimElem = 27
trigger14 = AnimElem = 29
trigger15 = AnimElem = 31
trigger16 = AnimElem = 33
trigger17 = AnimElem = 35
trigger18 = AnimElem = 37
trigger19 = AnimElem = 39
trigger20 = AnimElem = 41
trigger21 = AnimElem = 43
trigger22 = AnimElem = 45
trigger23 = AnimElem = 47
trigger24 = AnimElem = 49
trigger25 = AnimElem = 51
trigger26 = AnimElem = 53
trigger27 = AnimElem = 55
attr = S, NA                     ;Attribute: Standing, Normal Attack
damage = 10, 0                   ;Damage that move inflicts, guard damage
animtype = Medium                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag = MA                   ;Flags on how move is to be guarded against
hitflag = MAF                    ;Flags of conditions that move can hit
priority = 3, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
;Hit/Miss/Dodge type (Def: Hit)
pausetime = 2, 30                 ;Time attacker pauses, time opponent shakes
sparkno = -1                      ;Spark anim no (Def: set above)
sparkxy = -5, -65               ;X-offset for the "hit spark" rel. to p2,
;Y-offset for the spark rel. to p1
hitsound = 5, 0                  ;Sound to play on hit
guardsound = 6, 0                ;Sound to play on guard
ground.type = High              ;Type: High, Low, Trip (def: Normal)
ground.slidetime = 5             ;Time that the opponent slides back
ground.hittime  = 10             ;Time opponent is in hit state
ground.velocity = -3             ;Velocity at which opponent is pushed
airguard.velocity = -1.0,-.8     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
air.type = High                 ;Type: High, Low, Trip (def: same as ground.type)
air.velocity = -1.4,-1           ;X-velocity at which opponent is pushed,
;Y-velocity at which opponent is pushed
air.hittime = 12                 ;Time before opponent regains control in air

[State 0, VelAdd]
type = VelAdd
trigger1 = AnimElem = 2
x = 6.5

[State 0, Pause]
type = Pause
trigger1 = AnimElem = 58
time = 30
movetime = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 58
value = 700,1
volume = 255
channel = -1

[State 0, Explod]
type = Explod
trigger1 = AnimElem = 58
anim = 600
pos = -12,-53
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
supermovetime = 30
pausemovetime = 30
scale = 1,1
sprpriority = 4
ontop = 1

[State 0, VelAdd]
type = VelAdd
trigger1 = AnimElem = 59
x = 9.5

[State 200, HitDef]
type = HitDef
trigger1 = AnimElem = 60
attr = S, NA                     ;Attribute: Standing, Normal Attack
damage = 99, 0                   ;Damage that move inflicts, guard damage
animtype = Heavy                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag = MA                   ;Flags on how move is to be guarded against
hitflag = MAF                    ;Flags of conditions that move can hit
priority = 3, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
;Hit/Miss/Dodge type (Def: Hit)
pausetime = 2, 2                 ;Time attacker pauses, time opponent shakes
sparkno = S610                      ;Spark anim no (Def: set above)
sparkxy = -5, -65               ;X-offset for the "hit spark" rel. to p2,
;Y-offset for the spark rel. to p1
hitsound = S700, 0                  ;Sound to play on hit
guardsound = 6, 0                ;Sound to play on guard
ground.type = Trip              ;Type: High, Low, Trip (def: Normal)
ground.slidetime = 5             ;Time that the opponent slides back
ground.hittime  = 10             ;Time opponent is in hit state
ground.velocity = -3, -13             ;Velocity at which opponent is pushed
airguard.velocity = -1.0,-.8     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
air.type = Trip                 ;Type: High, Low, Trip (def: same as ground.type)
air.velocity = -1.4,-13           ;X-velocity at which opponent is pushed,
;Y-velocity at which opponent is pushed
air.hittime = 12                 ;Time before opponent regains control in air

[State 200, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Super Super Scope
[Statedef 555]
type    = S                      ;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A                      ;Move-type: A-attack, I-idle, H-gethit
physics = S                      ;Physics: S-stand, C-crouch, A-air
juggle  = 9                      ;Number of air juggle points move takes
velset = 0,0                     ;Set velocity (x,y) (Def: no change)
ctrl = 0                         ;Set ctrl (Def: no change)
anim = 501                       ;Change animation (Def: no change)
poweradd = -1000                    ;Power to add (Def: 0)
sprpriority = 2                  ;Set p1's sprite layering priority to 2 (in front)

[State 0, Pause]
type = Pause
trigger1 = Time = 1
time = 30
movetime = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = Time = 1
value = 700,1
volume = 255
channel = -1

[State 0, Explod]
type = Explod
trigger1 = Time = 1
anim = 600
pos = 22,-72
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
supermovetime = 30
pausemovetime = 30
scale = 1,1
sprpriority = 4
ontop = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = Time = 5
value = 500,1
volume = 255
channel = -1

[State 0, Projectile]
type = Projectile
trigger1 = Time = 5
projanim = 512
projscale = 1,1
projremovetime = -1
velocity = 13,0
remvelocity = 0,0
velmul = 1
projhits = 1
projpriority = 1
projsprpriority = -1
projedgebound = 40
projstagebound = 40
projheightbound = -240
offset = 5,-72
postype = p1         ;p2,front,back,left,right
projshadow = 0,0,0
supermovetime = 0
pausemovetime = 0
attr = S,SP        ;SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
hitflag = MAF        ;HLAFD+-
guardflag = MA         ;HLA
getpower = 0,0
givepower = 0,0
animtype = Heavy          ;light,medium,hard,back,up,diagup
air.animtype = Heavy
priority = 4,Hit   ;Hit,Miss,Dodge
damage = 300,0
pausetime = 0,0
;guard.pause,0
sparkno = S610
guard.sparkno = 0
sparkxy = 0,55
hitsound = S700,0
guardsound = 0,0
ground.type = Trip
ground.velocity = -9, -3
air.type = Trip
air.velocity = -9, -2

[State 200, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

