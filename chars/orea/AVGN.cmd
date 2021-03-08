[Remap]
x = x
y = y
z = z
a = a
b = b
c = c
s = s

[Defaults]
command.time = 15
command.buffer.time = 1

;-| Special Motions |------------------------------------------------------
[Command]
name = "Super_Super_Scope"
command = ~D, DF, F, D, DF, F,a+b
time = 25

[Command]
name = "Super_Super_Scope"
command = ~D, DF, F, D, DF, F,a+c
time = 25

[Command]
name = "Super_Super_Scope"
command = ~D, DF, F, D, DF, F,b+c
time = 25

[Command]
name = "Super_Glove"
command = ~D, DF, F, D, DF, F, x+y
time = 35

[Command]
name = "Super_Glove"
command = ~D, DF, F, D, DF, F, x+z
time = 35

[Command]
name = "Super_Glove"
command = ~D, DF, F, D, DF, F, y+z
time = 35

[Command]
name = "Power_Glove_X"
command = ~D, DF, F, x
time = 25

[Command]
name = "Power_Glove_Y"
command = ~D, DF, F, y
time = 25

[Command]
name = "Power_Glove_Z"
command = ~D, DF, F, z
time = 25

[Command]
name = "Super_Scope"
command = ~D, DF, F, c
time = 25

;-| Double Tap |-----------------------------------------------------------
[Command]
name = "FF"     ;Required (do not remove)
command = F, F
time = 10

[Command]
name = "BB"     ;Required (do not remove)
command = B, B
time = 10

;-| 2/3 Button Combination |-----------------------------------------------
[Command]
name = "recovery";Required (do not remove)
command = x+y
time = 1

;-| Dir + Button |---------------------------------------------------------

;-| Single Button |---------------------------------------------------------
[Command]
name = "a"
command = a
time = 1

[Command]
name = "b"
command = b
time = 1

[Command]
name = "c"
command = c
time = 1

[Command]
name = "x"
command = x
time = 1

[Command]
name = "y"
command = y
time = 1

[Command]
name = "z"
command = z
time = 1

[Command]
name = "start"
command = s
time = 1

;-| Hold Dir |--------------------------------------------------------------
[Command]
name = "holdC";Required (do not remove)
command = /$c
time = 1

[Command]
name = "holdfwd";Required (do not remove)
command = /$F
time = 1

[Command]
name = "holdback";Required (do not remove)
command = /$B
time = 1

[Command]
name = "holdup" ;Required (do not remove)
command = /$U
time = 1

[Command]
name = "holddown";Required (do not remove)
command = /$D
time = 1

[Statedef -1]
[State -1, SPG]
type = ChangeState
value = 550
triggerall = command = "Super_Glove"
trigger1 = statetype = S
trigger1 = power >= 1000
trigger1 = ctrl

[State -1, SSS]
type = ChangeState
value = 555
triggerall = command = "Super_Super_Scope"
trigger1 = statetype = S
trigger1 = power >= 1000
trigger1 = ctrl

[State -1, SSS]
type = ChangeState
value = 560
triggerall = command = "Super_Super_Scope"
trigger1 = statetype = A
trigger1 = power >= 1000
trigger1 = ctrl

[State -1, PGX]
type = ChangeState
value = 530
triggerall = command = "Power_Glove_X"
trigger1 = statetype = S
trigger1 = ctrl

[State -1, PGY]
type = ChangeState
value = 535
triggerall = command = "Power_Glove_Y"
trigger1 = statetype = S
trigger1 = ctrl

[State -1, PGY]
type = ChangeState
value = 537
triggerall = command = "Power_Glove_Z"
trigger1 = statetype = S
trigger1 = ctrl

[State -1, SS]
type = ChangeState
value = 520
triggerall = command = "Super_Scope"
trigger1 = statetype = A
trigger1 = NumHelper(500) = 0
trigger1 = ctrl

[State -1, SS]
type = ChangeState
value = 500
triggerall = command = "Super_Scope"
trigger1 = statetype = S
trigger1 = NumHelper(500) = 0
trigger1 = ctrl

[State -1, Run Fwd]
type = ChangeState
value = 100
trigger1 = command = "FF"
trigger1 = statetype = S
trigger1 = ctrl

[State -1, Run Back]
type = ChangeState
value = 105
trigger1 = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl

[State -1, Taunt]
type = ChangeState
value = 195
triggerall = command = "start"
trigger1 = statetype != A
trigger1 = ctrl

[State -1, SLK]
type = ChangeState
value = 200
triggerall = command = "a"
trigger1 = statetype = S
trigger1 = ctrl

[State -1, SMK]
type = ChangeState
value = 205
triggerall = command = "b"
trigger1 = statetype = S
trigger1 = ctrl

[State -1, Pen]
type = ChangeState
value = 207
triggerall = command = "c"
trigger1 = statetype = S
trigger1 = ctrl

[State -1, CSK]
type = ChangeState
value = 307
triggerall = command = "c"
trigger1 = statetype = C
trigger1 = ctrl

[State -1, SLK]
type = ChangeState
value = 210
triggerall = command = "x"
trigger1 = statetype = S
trigger1 = ctrl

[State -1, SLK]
type = ChangeState
value = 215
triggerall = command = "y"
trigger1 = statetype = S
trigger1 = ctrl

[State -1, SLK]
type = ChangeState
value = 217
triggerall = command = "z"
trigger1 = statetype = S
trigger1 = ctrl

[State -1, CLK]
type = ChangeState
value = 300
triggerall = command = "a"
trigger1 = statetype = C
trigger1 = ctrl

[State -1, CMK]
type = ChangeState
value = 305
triggerall = command = "b"
trigger1 = statetype = C
trigger1 = ctrl

[State -1, CLP]
type = ChangeState
value = 310
triggerall = command = "x"
trigger1 = statetype = C
trigger1 = ctrl

[State -1, CMP]
type = ChangeState
value = 315
triggerall = command = "y"
trigger1 = statetype = C
trigger1 = ctrl

[State -1, CSP]
type = ChangeState
value = 317
triggerall = command = "z"
trigger1 = statetype = C
trigger1 = ctrl

[State -1, ALK]
type = ChangeState
value = 400
triggerall = command = "a"
trigger1 = statetype = A
trigger1 = ctrl

[State -1, AMK]
type = ChangeState
value = 405
triggerall = command = "b"
trigger1 = statetype = A
trigger1 = ctrl

[State -1, AMK]
type = ChangeState
value = 407
triggerall = command = "c"
trigger1 = statetype = A
trigger1 = ctrl

[State -1, ALP]
type = ChangeState
value = 410
triggerall = command = "x"
trigger1 = statetype = A
trigger1 = ctrl

[State -1, ALP]
type = ChangeState
value = 415
triggerall = command = "y"
trigger1 = statetype = A
trigger1 = ctrl

[State -1, ALP]
type = ChangeState
value = 417
triggerall = command = "z"
trigger1 = statetype = A
trigger1 = ctrl
