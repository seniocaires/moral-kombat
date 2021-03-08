;---------------------------------------------------------------------------
; Air Light Kick
[Statedef 400]
type    = A                      ;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A                      ;Move-type: A-attack, I-idle, H-gethit
physics = A                      ;Physics: S-stand, C-crouch, A-air
juggle  = 1                      ;Number of air juggle points move takes
ctrl = 0                         ;Set ctrl (Def: no change)
anim = 400                       ;Change animation (Def: no change)
poweradd = 30                    ;Power to add (Def: 0)
sprpriority = 2                  ;Set p1's sprite layering priority to 2 (in front)

[State 0, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 1
value = 0,0
volume = 255
channel = -1

[State 200, HitDef]
type = HitDef
trigger1 = AnimElem = 1
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
trigger2 = AnimElem = 4
value = 1

;---------------------------------------------------------------------------
; Air Medium Kick
[Statedef 405]
type    = A                      ;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A                      ;Move-type: A-attack, I-idle, H-gethit
physics = A                      ;Physics: S-stand, C-crouch, A-air
juggle  = 1                      ;Number of air juggle points move takes
ctrl = 0                         ;Set ctrl (Def: no change)
anim = 405                       ;Change animation (Def: no change)
poweradd = 30                    ;Power to add (Def: 0)
sprpriority = 2                  ;Set p1's sprite layering priority to 2 (in front)

[State 0, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 1
value = 0,0
volume = 255
channel = -1

[State 200, HitDef]
type = HitDef
trigger1 = AnimElem = 1
attr = S, NA                     ;Attribute: Standing, Normal Attack
damage = 45, 0                   ;Damage that move inflicts, guard damage
animtype = Medium                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
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
ground.type = High              ;Type: High, Low, Trip (def: Normal)
ground.slidetime = 5             ;Time that the opponent slides back
ground.hittime  = 10             ;Time opponent is in hit state
ground.velocity = -7             ;Velocity at which opponent is pushed
airguard.velocity = -1.0,-.8     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
air.type = Trip                  ;Type: High, Low, Trip (def: same as ground.type)
air.velocity = -.6,-9           ;X-velocity at which opponent is pushed,
;Y-velocity at which opponent is pushed
air.hittime = 12                 ;Time before opponent regains control in air

[State 200, CtrlSet]
type = CtrlSet
trigger1 = MoveHit
trigger2 = AnimElem = 4
value = 1

;---------------------------------------------------------------------------
; Air Pen
[Statedef 407]
type    = A                      ;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A                      ;Move-type: A-attack, I-idle, H-gethit
physics = A                      ;Physics: S-stand, C-crouch, A-air
juggle  = 1                      ;Number of air juggle points move takes
ctrl = 1                         ;Set ctrl (Def: no change)
anim = 415                       ;Change animation (Def: no change)
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
hitsound = 0,0
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

;---------------------------------------------------------------------------
; Air Scope
[Statedef 520]
type    = A                      ;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A                      ;Move-type: A-attack, I-idle, H-gethit
physics = A                      ;Physics: S-stand, C-crouch, A-air
juggle  = 1                      ;Number of air juggle points move takes
ctrl = 0                         ;Set ctrl (Def: no change)
anim = 520                       ;Change animation (Def: no change)
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
offset = 5,-88
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
hitsound = 5,0
guardsound = 0,0
ground.type = High

[State 200, CtrlSet]
type = CtrlSet
trigger1 = MoveHit
trigger2 = AnimElem = 4
value = 1

;---------------------------------------------------------------------------
; Air Light Punch
[Statedef 410]
type    = A                      ;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A                      ;Move-type: A-attack, I-idle, H-gethit
physics = A                      ;Physics: S-stand, C-crouch, A-air
juggle  = 1                      ;Number of air juggle points move takes
ctrl = 0                         ;Set ctrl (Def: no change)
anim = 410                       ;Change animation (Def: no change)
poweradd = 30                    ;Power to add (Def: 0)
sprpriority = 2                  ;Set p1's sprite layering priority to 2 (in front)

[State 0, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 1
value = 0,0
volume = 255
channel = -1

[State 200, HitDef]
type = HitDef
trigger1 = AnimElem = 1
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
ground.type = High               ;Type: High, Low, Trip (def: Normal)
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
trigger2 = AnimElem = 4
value = 1

;---------------------------------------------------------------------------
; Air Medium Punch
[Statedef 415]
type    = A                      ;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A                      ;Move-type: A-attack, I-idle, H-gethit
physics = A                      ;Physics: S-stand, C-crouch, A-air
juggle  = 1                      ;Number of air juggle points move takes
ctrl = 0                         ;Set ctrl (Def: no change)
anim = 415                       ;Change animation (Def: no change)
poweradd = 30                    ;Power to add (Def: 0)
sprpriority = 2                  ;Set p1's sprite layering priority to 2 (in front)

[State 0, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 1
value = 0,0
volume = 255
channel = -1

[State 200, HitDef]
type = HitDef
trigger1 = AnimElem = 1
attr = S, NA                     ;Attribute: Standing, Normal Attack
damage = 45, 0                   ;Damage that move inflicts, guard damage
animtype = Medium                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
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
ground.type = High               ;Type: High, Low, Trip (def: Normal)
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
trigger2 = AnimElem = 4
value = 1

;---------------------------------------------------------------------------
; Air Strong Punch
[Statedef 417]
type    = A                      ;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A                      ;Move-type: A-attack, I-idle, H-gethit
physics = A                      ;Physics: S-stand, C-crouch, A-air
juggle  = 1                      ;Number of air juggle points move takes
ctrl = 0                         ;Set ctrl (Def: no change)
anim = 417                       ;Change animation (Def: no change)
poweradd = 40                    ;Power to add (Def: 0)
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
damage = 65, 0                   ;Damage that move inflicts, guard damage
animtype = Heavy                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
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
ground.type = High               ;Type: High, Low, Trip (def: Normal)
ground.slidetime = 5             ;Time that the opponent slides back
ground.hittime  = 10             ;Time opponent is in hit state
ground.velocity = -7             ;Velocity at which opponent is pushed
airguard.velocity = -1.0,-.8     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
air.type = Trip                  ;Type: High, Low, Trip (def: same as ground.type)
air.velocity = -1.4,6           ;X-velocity at which opponent is pushed,
;Y-velocity at which opponent is pushed
air.hittime = 12                 ;Time before opponent regains control in air

[State 200, CtrlSet]
type = CtrlSet
trigger1 = MoveHit
trigger2 = AnimElem = 6
value = 1

;---------------------------------------------------------------------------
; Super Super Scope
[Statedef 560]
type    = A                      ;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A                      ;Move-type: A-attack, I-idle, H-gethit
physics = A                      ;Physics: S-stand, C-crouch, A-air
juggle  = 9                      ;Number of air juggle points move takes
velset = 0,0                     ;Set velocity (x,y) (Def: no change)
ctrl = 0                         ;Set ctrl (Def: no change)
anim = 520                       ;Change animation (Def: no change)
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


