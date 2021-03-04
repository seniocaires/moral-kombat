;===========================================================================
;Marvel vs. Capcom - Eternity of Heroes - Animations Template V.8
;by Acey, FX ripped by Kong, Based on MvC2 Guile by RedHot, updated by Scar
;===========================================================================

;---------------------------------------------------------------------------
;Artificial Intelligence
;---------------------------------------------------------------------------

;-|-AI-|--------------------------------------------------------------------
[Command]
name = "AI_1"
command = a, x, F, D, a, a, D
time = 1

[Command]
name = "AI_2"
command = a, a, a, a, a, a, b
time = 1

[Command]
name = "AI_3"
command = a, a, b, D, F, b, x
time = 1

[Command]
name = "AI_4"
command = y, a, F, b, B, y, a
time = 1

[Command]
name = "AI_5"
command = a, b, x, y, y, b, b
time = 1

[Command]
name = "AI_6"
command = b, y, y, F, b, B, B
time = 1

[Command]
name = "AI_7"
command = a, y, F, a, x, a, F, b
time = 1

[Command]
name = "AI_8"
command = a, a, b, y, x, B, x
time = 1

[Command]
name = "AI_9"
command = x, x, a, F, F, b, D
time = 1

[Command]
name = "AI_10"
command = x, x, a, F, y, a, a, F
time = 1

[Command]
name = "AI_11"
command = a, b, a, x, a, y, a
time = 1

[Command]
name = "AI_12"
command = b, y, a, F, y, a, x
time = 1

[Command]
name = "AI_13"
command = x, a, y, y, x, B, B
time = 1

[Command]
name = "AI_14"
command = a, F, F, x, B, F, x
time = 1

[Command]
name = "AI_15"
command = y, x, b, b, a, x, y
time = 1

;---------------------------------------------------------------------------
;Commands
;---------------------------------------------------------------------------
;Rampage LVL3

[Command]
name = "Rampage"
command = ~D, DF, F, x+y

[Command]
name = "Rampage"
command = ~D, DF, F, x+z

[Command]
name = "Rampage"
command = ~D, DF, F, y+z
;----------------------------------------------------------------------------
;Rampage LVL3

[Command]
name = "rampage-2"
command = ~D, DB, B, x+y

[Command]
name = "rampage-2"
command = ~D, DB, B, x+z

[Command]
name = "rampage-2"
command = ~D, DB, B, y+z
;----------------------------------------------------------------------------
;powergeyser

[Command] 
name = "powergeyser"
command = ~D, DF, F, a+b
time = 40

[Command] 
name = "powergeyser"
command = ~D, DF, F, b+c
time = 40

[Command] 
name = "powergeyser"
command = ~D, DF, F, a+c
time = 40
;---------------------------------------------------------------------------
;Encore LVL3

[Command]
name = "encore"
command = ~D, DF, F, a+b

[Command]
name = "encore"
command = ~D, DF, F, b+c

[Command]
name = "encore"
command = ~D, DF, F, a+c

;---------------------------------------------------------------------------
;Hyper2

[Command]
name = "Hyper2"
command = ~D, DB, B, a+b

[Command]
name = "Hyper2"
command = ~D, DB, B, a+c

[Command]
name = "Hyper2"
command = ~D, DB, B, b+c

;---------------------------------------------------------------------------
;RHINO CHARGE
[Command]
name = "charge_x"
command = ~D,DF,F, x

[Command]
name = "charge_y"
command = ~D,DF,F, y

[Command]
name = "charge_z"
command = ~D,DF,F, z

;-------------------------------------------------------------------------------
;Stop
[Command]
name = "stop"
command = ~D,DB,B, x

[Command]
name = "stop"
command = ~D,DB,B, y

[Command]
name = "stop"
command = ~D,DB,B, z
;------------------------
;Rhino Stomp (ground)
[Command]
name = "knee_a"
command = ~D,DF,F, a

[Command]
name = "knee_b"
command = ~D,DF,F, b

[Command]
name = "knee_c"
command = ~D,DF,F, c

;------------------------
;Rhino Stomp (air)
[Command]
name = "knee_air"
command = ~D,DF,F, a

[Command]
name = "knee_air"
command = ~D,DF,F, b

[Command]
name = "knee_air"
command = ~D,DF,F, c
;-------------------------------------------------------------------------
;Rhino Gore

[Command]
name = "gore_a"
command = ~D,DB,B, a

[Command]
name = "gore_b"
command = ~D,DB,B, b

[Command]
name = "gore_c"
command = ~D,DB,B, c

;-------------------------------------------------------------------------
;Counter

[Command]
name = "Counter"
command = ~F, x+a

[Command]
name = "Counter"
command = ~F, y+b

[Command]
name = "Counter"
command = ~F, z+c

[Command]
name = "236Z"
command = z+y+x

;---------------------------------------------------------------------------
; Roll

[Command]
name = "roll_n"
command = ~B, D, DB, x

[Command]
name = "roll_m"
command = ~B, D, DB,  y

[Command]
name = "roll_f"
command = ~B, D, DB, z

;---------------------------------------------------------------------------
; Forward Recovery Roll or Alpha Counter1

[Command]
name = "ac_f_roll_n"
command = ~B, DB, D, x

[Command]
name = "ac_f_roll_m"
command = ~B, DB, D, y

[Command]
name = "ac_f_roll_f"
command = ~B, DB, D, z

;---------------------------------------------------------------------------
; Backward Recovery Roll or Alpha Counter2

[Command]
name = "ac_sweep_b_roll_n"
command = ~B, DB, D, a

[Command]
name = "ac_sweep_b_roll_m"
command = ~B, DB, D, b

[Command]
name = "ac_sweep_b_roll_f"
command = ~B, DB, D, c

;---------------------------------------------------------------------------------------------
;Super Jump

[Command]
name = "Super_Jump"
command = ~D, U

;---------------------------------------------------------------------------------------------
;Double_Tap
[Command]
name = "FF"     ;Required (do not remove)
command = F, F
time = 10

[Command]
name = "BB"     ;Required (do not remove)
command = B, B
time = 10

;---------------------------------------------------------------------------------------------
;2/3 button combination
[Command]
name = "recovery";Required (do not remove)
command = x+y
time = 1

[Command]
name = "guardpush"
command = x+y
time = 5

[Command]
name = "guardpush"
command = x+z
time = 5

[Command]
name = "guardpush"
command = y+z
time = 5

[Command]
name = "throw_p"
command = x+y
time = 5

[Command]
name = "throw_p"
command = y+z
time = 5

[Command]
name = "throw_p"
command = x+z
time = 5

[Command]
name = "throw_k"
command = a+b
time = 5

[Command]
name = "throw_k"
command = b+c
time = 5

[Command]
name = "throw_k"
command = a+c
time = 5

;---------------------------------------------------------------------------------------------
;Dir + button
[Command]
name = "down_a"
command = /$D,a
time = 1

[Command]
name = "down_b"
command = /$D,b
time = 1

[Command]
name = "fwd_z"
command = /$F,z
time = 1

[Command]
name = "fwd_a"
command = /$F,a
time = 1

[Command]
name = "fwd_b"
command = /$F,b
time = 1

[Command]
name = "fwd_c"
command = /$F,c
time = 1

[Command]
name = "back_b"        ;Alternative button command
command = /$B,b
time = 1

[Command]
name = "back_c"        ;Alternative button command
command = /$B,c
time = 1

;---------------------------------------------------------------------------------------------
;One button
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
name = "s"
command = s
time = 1

;---------------------------------------------------------------------------------------------
;Hold button
[Command]
name = "holdx"
command = /x
time = 1

[Command]
name = "holdy"
command = /y
time = 1

[Command]
name = "holdz"
command = /z
time = 1

[Command]
name = "holda"
command = /a
time = 1

[Command]
name = "holdc"
command = /c
time = 1

[Command]
name = "holdb"
command = /b
time = 1

[Command]
name = "pc1"
command = b+y

[Command]
name = "ki"
command = /b+y

;---------------------------------------------------------------------------------------------
;Hold dir
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

[Command]
name = "SJ"
command = $D, $U

;---------------------------------------------------------------------------
;Artificial Intelligence
;---------------------------------------------------------------------------

[Statedef -1]
;-|-AI-|--------------------------------------------------------------------
[State -1, AI]
type = VarSet
trigger1 = command = "AI_1"
trigger2 = command = "AI_2"
trigger3 = command = "AI_3"
trigger4 = command = "AI_4"
trigger5 = command = "AI_5"
trigger6 = command = "AI_6"
trigger7 = command = "AI_7"
trigger8 = command = "AI_8"
trigger9 = command = "AI_9"
trigger10 = command = "AI_10"
trigger11 = command = "AI_11"
trigger12 = command = "AI_12"
trigger13 = command = "AI_13"
trigger14 = command = "AI_14"
trigger15 = command = "AI_15"
v = 59
value = 1


;---------------------------------------------------------------------------
;Commands
;---------------------------------------------------------------------------


;===============================================================================================
;                                            Hyper Moves
;===============================================================================================
;Rampage
[State -1]
type = ChangeState
value = 3000
triggerall = Var(59)!=1&&command="Rampage"&&life!=0&&p2life!=0&&power>=1000
triggerall = StateType != A
trigger1=ctrl
trigger2 = (StateNo = 200) && (Movecontact)
trigger3 = (StateNo = 210) && (Movecontact)
trigger4 = (StateNo = 230) && (Movecontact)
trigger5 = (StateNo = 240) && (Movecontact)
trigger6 = (StateNo = 400) && (Movecontact)
trigger7 = (StateNo = 430) && (Movecontact)
trigger8 = (StateNo = 440) && (Movecontact)
;-----------------------------
;Rampage2 
[State -1]
type = ChangeState
value = 4000
triggerall = Var(59)!=1&&command="rampage-2"&&life!=0&&p2life!=0&&power>=1000
triggerall = StateType != A
trigger1=ctrl
trigger2 = (StateNo = 200) && (Movecontact)
trigger3 = (StateNo = 210) && (Movecontact)
trigger4 = (StateNo = 230) && (Movecontact)
trigger5 = (StateNo = 240) && (Movecontact)
trigger6 = (StateNo = 400) && (Movecontact)
trigger7 = (StateNo = 430) && (Movecontact)
trigger8 = (StateNo = 440) && (Movecontact)
;-----------------------------
;powergeyser
[State -1, powergeyser]
type = ChangeState
value = 3201
triggerall = !var(59)
triggerall = command = "powergeyser"
triggerall = power >= 1000
trigger1 = Statetype != A && ctrl
trigger2 = (StateType != A) && (HitdefAttr = SC, NA) && (MoveContact)
;-----------------------------
;Encore LVL3
[State -1]
type =null; ChangeState
value = 3500
triggerall = Var(59)!=1&&command="encore"&&life!=0&&p2life!=0&&power>=3000
triggerall = StateType !=A
trigger1=ctrl



;===============================================================================================
;                                            Super Moves
;===============================================================================================
;Rhino Charge
[State -1]
type = ChangeState
value = ifelse(command="charge_x",1000,ifelse(command="charge_y",1001,1002))
triggerall = Var(59)!=1&&command="charge_x"||command="charge_y"||command="charge_z"&&life!=0&&p2life!=0
triggerall = StateType != A
trigger1=ctrl
trigger2 = (StateNo = 200) && (Movecontact)
trigger3 = (StateNo = 210) && (Movecontact)
trigger4 = (StateNo = 230) && (Movecontact)
trigger5 = (StateNo = 240) && (Movecontact)
trigger6 = (StateNo = 400) && (Movecontact)
trigger7 = (StateNo = 410) && (Movecontact)
trigger8 = (StateNo = 430) && (Movecontact)
trigger9 = (StateNo = 440) && (Movecontact)

;Stop
[State -1]
type = ChangeState
value = 1300
triggerall = command = "stop"
triggerall = StateType != A
trigger1=ctrl
trigger2 = (StateNo = 200) && (Movecontact)
trigger3 = (StateNo = 210) && (Movecontact)
trigger4 = (StateNo = 230) && (Movecontact)
trigger5 = (StateNo = 240) && (Movecontact)
trigger6 = (StateNo = 400) && (Movecontact)
trigger7 = (StateNo = 410) && (Movecontact)
trigger8 = (StateNo = 430) && (Movecontact)
trigger9 = (StateNo = 440) && (Movecontact)
;----------------------------------------------------------------------------------------------------------
;Rhino Knee (ground)
[State -1]
type = ChangeState
value = ifelse(command="knee_a",1100,ifelse(command="knee_b",1101,1102))
triggerall = Var(59)!=1&&command="knee_a"||command="knee_b"||command="knee_c"&&life!=0&&p2life!=0
triggerall = StateType != A
trigger1=ctrl
;-----------------------------
;Rhino Knee (air)
[State -1]
type = ChangeState
value = 1105
triggerall = Var(59)!=1&&command="knee_air"&&life!=0&&p2life!=0
triggerall = StateType = A
trigger1=ctrl
;-----------------------------
;Rhino Gore
[State -1]
type = ChangeState
value = 1200
triggerall = Var(59)!=1&&command="gore_a"||command="gore_b"||command="gore_c"&&life!=0&&p2life!=0
triggerall = StateType != A
trigger1=ctrl
trigger2 = (StateNo = 200) && (Movecontact)
trigger3 = (StateNo = 210) && (Movecontact)
trigger4 = (StateNo = 230) && (Movecontact)
trigger5 = (StateNo = 240) && (Movecontact)
trigger6 = (StateNo = 400) && (Movecontact)
trigger7 = (StateNo = 410) && (Movecontact)
trigger8 = (StateNo = 430) && (Movecontact)
trigger9 = (StateNo = 440) && (Movecontact)
;-----------------------------
[State -1, Dash Forward]
type = ChangeState
value = 100
triggerall = StateType = S
triggerall = (Ctrl) && (StateNo != 100)
trigger1 = Command = "FF"
;-----------------------------

[State -1, Jump Back]
type = ChangeState
value = 105
triggerall = StateType = S
triggerall = (Ctrl) && (StateNo != 100)
trigger1 = Command = "BB"
;-----------------------------
[State -1]
type = ChangeState
value = 7500
triggerall = Power < 3000 && (command = "pc1")
trigger1 = statetype = S
trigger1 = ctrl

;-----------------------------
[State -1, X]
type = ChangeState
value = 600
triggerall = command = "x"
trigger1 = Statetype = A && ctrl
trigger2 = stateno = 105 && time > 4
;-----------------------------
[State -1, Y]
type = ChangeState
value = 610
triggerall = command = "y"
trigger1 = Statetype = A && ctrl
trigger2 = (StateNo = 600) && (Movecontact) && time > 2
trigger3 = (StateNo = 630) && (Movecontact) && time > 2
trigger4 = stateno = 105 && time > 4
;-----------------------------
[State -1, Z]
type = ChangeState
value = 620
triggerall = command = "z"
trigger1 = Statetype = A && ctrl
trigger2 = (StateNo = 600) && (Movecontact) && time > 2
trigger3 = (StateNo = 630) && (Movecontact) && time > 2
trigger4 = (StateNo = 610) && (Movecontact) && time > 2
trigger5 = (StateNo = 640) && (Movecontact) && time > 2
trigger6 = stateno = 105 && time > 4
;-----------------------------
[State -1, B]
type = ChangeState
value = 640
triggerall = command = "b"
trigger1 = Statetype = A && ctrl
trigger2 = (StateNo = 600) && (Movecontact)
trigger3 = (StateNo = 610) && (Movecontact)
trigger4 = (StateNo = 620) && (Movecontact)
trigger5 = (StateNo = 630) && (Movecontact)
trigger6 = stateno = 105 && time > 4
;-----------------------------
[State -1, C]
type = ChangeState
value = 650
triggerall = command = "c"
trigger1 = Statetype = A && ctrl
trigger2 = (StateNo = 600) && (Movecontact)
trigger3 = (StateNo = 610) && (Movecontact)
trigger4 = (StateNo = 620) && (Movecontact)
trigger5 = (StateNo = 630) && (Movecontact)
trigger6 = (StateNo = 640) && (Movecontact)
trigger7 = stateno = 105 && time > 4
;-----------------------------
[State -1, A]
type = ChangeState
value = 630
triggerall = command = "a"
trigger1 = Statetype = A && ctrl
trigger2 = (StateNo = 600) && (Movecontact)
trigger3 = stateno = 105 && time > 4
;-----------------------------
[State -1, X]
type = ChangeState
value = 200
triggerall = Command = "x"
triggerall = Command != "holddown"
trigger1 = (StateType = S) && (Ctrl)
;-----------------------------
[State -1, Y]
type = ChangeState
value = 210;;;; IfElse(P2BodyDist X > 28,210,211)
triggerall = Command = "y"
triggerall = Command != "holddown"
trigger1 = (StateType = S) && (Ctrl)
trigger2 = (StateNo = 200) && (Movecontact) && time > 3
trigger3 = (StateNo = 230) && (Movecontact) && time > 3
;-----------------------------
[State -1, Z]
type = ChangeState
value = 220
triggerall = Command = "z"
triggerall = Command != "holddown"
trigger1 = (StateType = S) && (Ctrl)
trigger2 = (StateNo = 200) && (Movecontact) && time > 3
trigger3 = (StateNo = 230) && (Movecontact) && time > 3
trigger4 = (StateNo = 210) && (Movecontact) && time > 3
trigger5 = (StateNo = 211) && (Movecontact) && time > 3
trigger6 = (StateNo = 240) && (Movecontact) && time > 3
trigger7 = (StateNo = 241) && (Movecontact) && time > 3
;-----------------------------
[State -1, C]
type = ChangeState
value = 250
triggerall = Command = "c"
triggerall = Command != "holddown"
trigger1 = (StateType = S) && (Ctrl)
trigger2 = (StateNo = 200) && (Movecontact)
trigger3 = (StateNo = 230) && (Movecontact)
trigger4 = (StateNo = 210) && (Movecontact)
trigger5 = (StateNo = 211) && (Movecontact)
trigger6 = (StateNo = 240) && (Movecontact)
trigger7 = (StateNo = 241) && (Movecontact)
trigger8 = (StateNo = 221) && (Movecontact)
trigger9 = (StateNo = 220) && (Movecontact)
;-----------------------------

[State -1, s]
type = ChangeState
value = 195
triggerall = Command = "s"
triggerall = Command != "holddown"
triggerall = stateno != 100
trigger1 = (StateType = S) && (Ctrl)
;-----------------------------

[State -1, A]
type = ChangeState
value = 230
triggerall = Command = "a"
triggerall = Command != "holddown"
triggerall = stateno != 100
trigger1 = (StateType = S) && (Ctrl)
trigger2 = (Stateno = 200) && (Movecontact)
;-----------------------------

[State -1, B]
type = ChangeState
value = 240
triggerall = Command = "b"
triggerall = Command != "holddown"
trigger1 = (StateType = S) && (Ctrl)
trigger2 = (StateNo = 200) && (Movecontact)
trigger3 = (StateNo = 230) && (Movecontact)
trigger4 = (StateNo = 210) && (Movecontact)
trigger5 = (StateNo = 211) && (Movecontact)
;-----------------------------

[State -1, Crouching Light Punch]
type = ChangeState
triggerall = Var(59) <= 0
value = 400
triggerall = command = "x"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 410 && movecontact
trigger3 = stateno = 420 && movecontact
trigger4 = stateno = 430 && movecontact
trigger5 = stateno = 440 && movecontact
trigger6 = stateno = 450 && movecontact
;TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT
[State -1, Crouching medium Punch]
type = ChangeState
value = 410
triggerall = Var(59) <= 0
triggerall = command = "y"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 400 && movecontact
trigger3 = stateno = 420 && movecontact
trigger4 = stateno = 430 && movecontact
trigger5 = stateno = 440 && movecontact
trigger6 = stateno = 450 && movecontact
;TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT
[State -1, Crouching Strong Punch]
type = ChangeState
triggerall = Var(59) <= 0
value = 420
triggerall = command = "z"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 400 && movecontact
trigger3 = stateno = 410 && movecontact
trigger4 = stateno = 430 && movecontact
trigger5 = stateno = 440 && movecontact
trigger6 = stateno = 450 && movecontact
;TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT
[State -1, Crouching Light Kick]
type = ChangeState
triggerall = Var(59) <= 0
value = 430
triggerall = command = "a"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 400 && movecontact
trigger3 = stateno = 410 && movecontact
trigger4 = stateno = 420 && movecontact
trigger5 = stateno = 440 && movecontact
trigger6 = stateno = 450 && movecontact
;TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT
[State -1, Crouching medium Kick]
type = ChangeState
triggerall = Var(59) <= 0
value = 440
triggerall = command = "b"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 400 && movecontact
trigger3 = stateno = 410 && movecontact
trigger4 = stateno = 420 && movecontact
trigger5 = stateno = 430 && movecontact
trigger6 = stateno = 450 && movecontact
;TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT
[State -1, Crouching Strong Kick]
type = ChangeState
triggerall = Var(59) <= 0
value = 450
triggerall = command = "c"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 400 && movecontact
trigger3 = stateno = 410 && movecontact
trigger4 = stateno = 420 && movecontact
trigger5 = stateno = 430 && movecontact
trigger6 = stateno = 440 && movecontact
;------------------------------------------------------------------------
[State -1, Super Jump]
type = ChangeState
value = 7000
triggerall = Command = "SJ"
trigger1 = StateType = S
trigger1 = ctrl
;-----------------------------
[State -1, Super Jump]
type = ChangeState
value = 7000
triggerall = Command = "holdup"
trigger1 = stateno = 420 && movehit

[State -1, Guard Push stand]
type = ChangeState
value = 6300
triggerall = command = "guardpush" && statetype = S
trigger1 = stateno = [150,153]

[State -1, Guard Push crouch]
type = ChangeState
value = 6310
triggerall = command = "guardpush" && statetype = C
trigger1 = stateno = [150,153]

;---------------------------------------------------------------------------
;----------------------------- Recovery Roll -------------------------------
;---------------------------------------------------------------------------

;---------------------------------------------------------------------------
; Near Foward Recovery Roll
[State -1]
type = VarSet
triggerall = Var(59) != 2
triggerall = command = "ac_f_roll_n"
triggerall = alive = 1
trigger1 = stateno = 5080
v = 30
value = 1

[State -1]
type = ChangeState
value = 831
triggerall = Var(59) != 2
triggerall = Var(30) = 1
trigger1 = (Pos Y >= 0) && (Vel Y > 0)

;---------------------------------------------------------------------------
; Medium Foward Recovery Roll
[State -1]
type = VarSet
triggerall = Var(59) != 2
triggerall = command = "ac_f_roll_m"
triggerall = alive = 1
trigger1 = stateno = 5080
v = 30
value = 2

[State -1]
type = ChangeState
value = 832
triggerall = Var(59) != 2
triggerall = Var(30) = 2
trigger1 = (Pos Y >= 0) && (Vel Y > 0)

;---------------------------------------------------------------------------
; Far Foward Recovery Roll
[State -1]
type = VarSet
triggerall = Var(59) != 2
triggerall = command = "ac_f_roll_f"
triggerall = alive = 1
trigger1 = stateno = 5080
v = 30
value = 3

[State -1]
type = ChangeState
value = 840
triggerall = Var(59) != 2
triggerall = Var(30) = 3
trigger1 = (Pos Y >= 0) && (Vel Y > 0)

;---------------------------------------------------------------------------
; Near Backward Recovery Roll
[State -1]
type = VarSet
triggerall = Var(59) != 2
triggerall = command = "ac_sweep_b_roll_n"
triggerall = alive = 1
trigger1 = stateno = 5080
v = 30
value = 4

[State -1]
type = ChangeState
value = 850
triggerall = Var(59) != 2
triggerall = Var(30) = 4
trigger1 = (Pos Y >= 0) && (Vel Y > 0)

;---------------------------------------------------------------------------
; Medium Backward Recovery Roll
[State -1]
type = VarSet
triggerall = Var(59) != 2
triggerall = command = "ac_sweep_b_roll_m"
triggerall = alive = 1
trigger1 = stateno = 5080
v = 30
value = 5

[State -1]
type = ChangeState
value = 855
triggerall = Var(59) != 2
triggerall = Var(30) = 5
trigger1 = (Pos Y >= 0) && (Vel Y > 0)

;---------------------------------------------------------------------------
; Far Backward Recovery Roll

[State -1]
type = VarSet
triggerall = Var(59) != 2
triggerall = command = "ac_sweep_b_roll_f"
triggerall = alive = 1
trigger1 = stateno = 5080 
v = 30
value = 6

[State -1]
type = ChangeState
value = 860
triggerall = Var(59) != 2
triggerall = Var(30) = 6
trigger1 = (Pos Y >= 0) && (Vel Y > 0)

;---------------------------------------------------------------------------
;------------------------ Lie Down Recovery Roll ---------------------------
;---------------------------------------------------------------------------

;---------------------------------------------------------------------------
; Lie Down Forward Recovery Roll
[State -1]
type = ChangeState
value = 832
triggerall = Var(59) != 2
triggerall = command = "holdfwd"
triggerall = time = 1
triggerall = life > 0
trigger1 = stateno = 5080

;---------------------------------------------------------------------------
; Lie Down Backward Recovery Roll
[State -1]
type = ChangeState
value = 855
triggerall = Var(59) != 2
triggerall = command = "holdback"
triggerall = time = 1
triggerall = life > 0
trigger1 = stateno = 5080

