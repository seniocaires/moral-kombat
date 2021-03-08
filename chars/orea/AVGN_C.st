;---------------------------------------------------------------------------
; Crouch Light Kick
[Statedef 300]
type    = C                      ;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A                      ;Move-type: A-attack, I-idle, H-gethit
physics = c                      ;Physics: S-stand, C-crouch, A-air
juggle  = 1                      ;Number of air juggle points move takes
velset = 0,0                     ;Set velocity (x,y) (Def: no change)
ctrl = 0                         ;Set ctrl (Def: no change)
anim = 300                       ;Change animation (Def: no change)
poweradd = 45                    ;Power to add (Def: 0)
sprpriority = 2                  ;Set p1's sprite layering priority to 2 (in front)

[State 300, HitDef]
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
sparkxy = -10, -55               ;X-offset for the "hit spark" rel. to p2,
;Y-offset for the spark rel. to p1
hitsound = 5, 0                  ;Sound to play on hit
guardsound = 6, 0                ;Sound to play on guard
ground.type = Low               ;Type: High, Low, Trip (def: Normal)
ground.slidetime = 5             ;Time that the opponent slides back
ground.hittime  = 10             ;Time opponent is in hit state
ground.velocity = -7             ;Velocity at which opponent is pushed
airguard.velocity = -1.0,-.9     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
air.type = High                  ;Type: High, Low, Trip (def: same as ground.type)
air.velocity = -1.4,-2           ;X-velocity at which opponent is pushed,
;Y-velocity at which opponent is pushed
air.hittime = 12                 ;Time before opponent regains control in air

[State 0, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 1
value = 0,1
volume = 255
channel = -1

[State 205, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

;---------------------------------------------------------------------------
; Crouch Medium Kick
[Statedef 305]
type    = C                      ;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A                      ;Move-type: A-attack, I-idle, H-gethit
physics = C                      ;Physics: S-stand, C-crouch, A-air
juggle  = 1                      ;Number of air juggle points move takes
velset = 0,0                     ;Set velocity (x,y) (Def: no change)
ctrl = 0                         ;Set ctrl (Def: no change)
anim = 301                       ;Change animation (Def: no change)
poweradd = 45                    ;Power to add (Def: 0)
sprpriority = 2                  ;Set p1's sprite layering priority to 2 (in front)

[State 300, HitDef]
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
sparkxy = -10, -55               ;X-offset for the "hit spark" rel. to p2,
;Y-offset for the spark rel. to p1
hitsound = 5, 0                  ;Sound to play on hit
guardsound = 6, 0                ;Sound to play on guard
ground.type = Low               ;Type: High, Low, Trip (def: Normal)
ground.slidetime = 5             ;Time that the opponent slides back
ground.hittime  = 10             ;Time opponent is in hit state
ground.velocity = -7             ;Velocity at which opponent is pushed
airguard.velocity = -1.0,-.9     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
air.type = High                  ;Type: High, Low, Trip (def: same as ground.type)
air.velocity = -1.4,-2           ;X-velocity at which opponent is pushed,
;Y-velocity at which opponent is pushed
air.hittime = 12                 ;Time before opponent regains control in air

[State 0, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 1
value = 0,1
volume = 255
channel = -1

[State 0, VelAdd]
type = VelAdd
trigger1 = AnimElem = 1
x = 5.5

[State 205, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

;---------------------------------------------------------------------------
; Crouch Scope
[Statedef 515]
type    = C                      ;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A                      ;Move-type: A-attack, I-idle, H-gethit
physics = C                      ;Physics: S-stand, C-crouch, A-air
juggle  = 1                      ;Number of air juggle points move takes
velset = 0,0                     ;Set velocity (x,y) (Def: no change)
ctrl = 0                         ;Set ctrl (Def: no change)
anim = 515                       ;Change animation (Def: no change)
poweradd = 45                    ;Power to add (Def: 0)
sprpriority = 2                  ;Set p1's sprite layering priority to 2 (in front)

[State 0, Projectile]
type = Projectile
trigger1 = Time = 1
trigger2 = Time = 7
trigger3 = Time = 13
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
offset = 5,-36
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
ground.type = Low

[State 205, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

;---------------------------------------------------------------------------
; Crouch Strong Kick
[Statedef 307]
type    = C                      ;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A                      ;Move-type: A-attack, I-idle, H-gethit
physics = c                      ;Physics: S-stand, C-crouch, A-air
juggle  = 1                      ;Number of air juggle points move takes
velset = 0,0                     ;Set velocity (x,y) (Def: no change)
ctrl = 0                         ;Set ctrl (Def: no change)
anim = 302                       ;Change animation (Def: no change)
poweradd = 45                    ;Power to add (Def: 0)
sprpriority = 2                  ;Set p1's sprite layering priority to 2 (in front)

[State 300, HitDef]
type = HitDef
trigger1 = AnimElem = 1
attr = S, NA                     ;Attribute: Standing, Normal Attack
damage = 55, 0                   ;Damage that move inflicts, guard damage
animtype = Hard                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag = MA                   ;Flags on how move is to be guarded against
hitflag = MAF                    ;Flags of conditions that move can hit
priority = 3, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
;Hit/Miss/Dodge type (Def: Hit)
pausetime = 8, 8                 ;Time attacker pauses, time opponent shakes
sparkno = 0                      ;Spark anim no (Def: set above)
sparkxy = -10, -55               ;X-offset for the "hit spark" rel. to p2,
;Y-offset for the spark rel. to p1
hitsound = 5, 0                  ;Sound to play on hit
guardsound = 6, 0                ;Sound to play on guard
ground.type = Trip              ;Type: High, Low, Trip (def: Normal)
ground.slidetime = 5             ;Time that the opponent slides back
ground.hittime  = 10             ;Time opponent is in hit state
ground.velocity = -7             ;Velocity at which opponent is pushed
airguard.velocity = -1.0,-.9     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
air.type = High                  ;Type: High, Low, Trip (def: same as ground.type)
air.velocity = -1.4,-2           ;X-velocity at which opponent is pushed,
;Y-velocity at which opponent is pushed
air.hittime = 12                 ;Time before opponent regains control in ai

[State 0, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 1
value = 0,1
volume = 255
channel = -1

[State 0, VelAdd]
type = VelAdd
trigger1 = AnimElem = 1
x = 9.5

[State 205, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

;---------------------------------------------------------------------------
; Crouch Light Punch
[Statedef 310]
type    = C                      ;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A                      ;Move-type: A-attack, I-idle, H-gethit
physics = C                      ;Physics: S-stand, C-crouch, A-air
juggle  = 1                      ;Number of air juggle points move takes
velset = 0,0                     ;Set velocity (x,y) (Def: no change)
ctrl = 0                         ;Set ctrl (Def: no change)
anim = 310                       ;Change animation (Def: no change)
poweradd = 45                    ;Power to add (Def: 0)
sprpriority = 2                  ;Set p1's sprite layering priority to 2 (in front)

[State 300, HitDef]
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
sparkxy = -10, -55               ;X-offset for the "hit spark" rel. to p2,
;Y-offset for the spark rel. to p1
hitsound = 5, 0                  ;Sound to play on hit
guardsound = 6, 0                ;Sound to play on guard
ground.type = Low               ;Type: High, Low, Trip (def: Normal)
ground.slidetime = 5             ;Time that the opponent slides back
ground.hittime  = 10             ;Time opponent is in hit state
ground.velocity = -7             ;Velocity at which opponent is pushed
airguard.velocity = -1.0,-.9     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
air.type = High                  ;Type: High, Low, Trip (def: same as ground.type)
air.velocity = -1.4,-2           ;X-velocity at which opponent is pushed,
;Y-velocity at which opponent is pushed
air.hittime = 12                 ;Time before opponent regains control in air

[State 0, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 1
value = 0,1
volume = 255
channel = -1

[State 205, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

;---------------------------------------------------------------------------
; Crouch Medium Punch
[Statedef 315]
type    = C                      ;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A                      ;Move-type: A-attack, I-idle, H-gethit
physics = C                      ;Physics: S-stand, C-crouch, A-air
juggle  = 1                      ;Number of air juggle points move takes
velset = 0,0                     ;Set velocity (x,y) (Def: no change)
ctrl = 0                         ;Set ctrl (Def: no change)
anim = 315                       ;Change animation (Def: no change)
poweradd = 55                    ;Power to add (Def: 0)
sprpriority = 2                  ;Set p1's sprite layering priority to 2 (in front)

[State 300, HitDef]
type = HitDef
trigger1 = AnimElem = 1
attr = S, NA                     ;Attribute: Standing, Normal Attack
damage = 55, 0                   ;Damage that move inflicts, guard damage
animtype = Medium                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag = MA                   ;Flags on how move is to be guarded against
hitflag = MAF                    ;Flags of conditions that move can hit
priority = 3, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
;Hit/Miss/Dodge type (Def: Hit)
pausetime = 8, 8                 ;Time attacker pauses, time opponent shakes
sparkno = 0                      ;Spark anim no (Def: set above)
sparkxy = -10, -55               ;X-offset for the "hit spark" rel. to p2,
;Y-offset for the spark rel. to p1
hitsound = 5, 0                  ;Sound to play on hit
guardsound = 6, 0                ;Sound to play on guard
ground.type = Low               ;Type: High, Low, Trip (def: Normal)
ground.slidetime = 5             ;Time that the opponent slides back
ground.hittime  = 10             ;Time opponent is in hit state
ground.velocity = -7             ;Velocity at which opponent is pushed
airguard.velocity = -1.0,-.9     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
air.type = High                  ;Type: High, Low, Trip (def: same as ground.type)
air.velocity = -1.4,-2           ;X-velocity at which opponent is pushed,
;Y-velocity at which opponent is pushed
air.hittime = 12                 ;Time before opponent regains control in air

[State 0, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 1
value = 0,1
volume = 255
channel = -1

[State 0, VelAdd]
type = VelAdd
trigger1 = AnimElem = 1
x = 7.5

[State 205, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

;---------------------------------------------------------------------------
; Crouch Strong Punch
[Statedef 317]
type    = C                      ;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A                      ;Move-type: A-attack, I-idle, H-gethit
physics = C                      ;Physics: S-stand, C-crouch, A-air
juggle  = 1                      ;Number of air juggle points move takes
velset = 0,0                     ;Set velocity (x,y) (Def: no change)
ctrl = 0                         ;Set ctrl (Def: no change)
anim = 217                       ;Change animation (Def: no change)
poweradd = 55                    ;Power to add (Def: 0)
sprpriority = 2                  ;Set p1's sprite layering priority to 2 (in front)

[State 300, HitDef]
type = HitDef
trigger1 = AnimElem = 3
attr = S, NA                     ;Attribute: Standing, Normal Attack
damage = 70, 0                   ;Damage that move inflicts, guard damage
animtype = Heavy                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag = MA                   ;Flags on how move is to be guarded against
hitflag = MAF                    ;Flags of conditions that move can hit
priority = 3, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
;Hit/Miss/Dodge type (Def: Hit)
pausetime = 8, 8                 ;Time attacker pauses, time opponent shakes
sparkno = 0                      ;Spark anim no (Def: set above)
sparkxy = -10, -55               ;X-offset for the "hit spark" rel. to p2,
;Y-offset for the spark rel. to p1
hitsound = 5, 0                  ;Sound to play on hit
guardsound = 6, 0                ;Sound to play on guard
ground.type = Trip               ;Type: High, Low, Trip (def: Normal)
ground.slidetime = 5             ;Time that the opponent slides back
ground.hittime  = 10             ;Time opponent is in hit state
ground.velocity = -1, -9             ;Velocity at which opponent is pushed
airguard.velocity = -1.0,-.9     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
air.type = High                  ;Type: High, Low, Trip (def: same as ground.type)
air.velocity = -1.4,-9           ;X-velocity at which opponent is pushed,
;Y-velocity at which opponent is pushed
air.hittime = 12                 ;Time before opponent regains control in air

[State 0, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 3
value = 0,1
volume = 255
channel = -1

[State 205, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1
