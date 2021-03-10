; _______________________________________
;|Pocket Guy                             |
;|Character Made by: Duende Macabro  ::..|
;|Version: Beta 1 - 05/09/05 ::..        |
;|Started at 16/07/2005 ::..             |
;|Contact:                               |
;|weaponx_nirvana@yahoo.com.br           |
;|_______________________________________|



;===================|
;--[ Super Moves ]--|
;===================|

[Command]
Name= "2qcf_a"
command = ~D, DF, F, D, DF, F, a
time = 20

;=====================|
;--[ Special Moves ]--|
;=====================|

[Command]
Name= "qcf_a"
command = ~D, DF, F, a

[Command]
Name= "qcf_b"
command = ~D, DF, F, b

[Command]
Name= "qcb_a"
command = ~D, DB, B, a

[Command]
Name= "qcb_b"
command = ~D, DB, B, b


;==================|
;--[ Double tap ]--|
;==================|

[Command]
name = "FF"     
command = F, F
time = 10

[Command]
name = "BB"     
command = B, B
time = 10

;==================|
;--[ 2/3 button ]--|
;==================|

[Command]
name = "recovery"
command = x+y
time = 1

;====================|
;--[ Dir + button ]--|
;====================|

[Command]
name = "down_a"
command = /$D,a
time = 1

[Command]
name = "down_b"
command = /$D,b
time = 1

;=====================|
;--[ Single Button ]--|
;=====================|

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

;================|
;--[ Hold Dir ]--|
;================|

[Command]
name = "holdfwd"
command = /$F
time = 1

[Command]
name = "holdback"
command = /$B
time = 1

[Command]
name = "holdup"
command = /$U
time = 1

[Command]
name = "holddown"
command = /$D
time = 1

;===================|
;--[ Hold Button ]--|
;===================|

[Command]
name = "hold_x"
command = /x
time = 1

[Command]
name = "hold_y"
command = /y
time = 1

[Command]
name = "hold_z"
command = /z
time = 1

[Command]
name = "hold_a"
command = /a
time = 1

[Command]
name = "hold_b"
command = /b
time = 1

[Command]
name = "hold_c"
command = /c
time = 1

[Command]
name = "hold_start"
command = /s
time = 1


;===========================|
;=-=-=-< Statedef -1 >=-=-=-|
;===========================|
[Statedef -1]


;==============|
;--[ Supers ]--|
;==============|

; Espancamento
;-------------------------
[State -1]
type = ChangeState
value = 2000
triggerall = (command = "2qcf_a")&&(Power >= 1000)
trigger1 = (statetype = S && ctrl)


;================|
;--[ Specials ]--|
;================|

; Arremesso de faca
;-----------------------------
[State -1, arremesso de faca]
type = ChangeState
value = 1000
triggerall = command = "qcf_a"
trigger1 = ( statetype = S ) && ( ctrl = 1 )


; Chute giratório
;-----------------------------
[State -1, chute giratório]
type = ChangeState
value = 1010
triggerall = command = "qcb_b"
trigger1 = ( statetype = S ) && ( ctrl = 1 )


; Sequência de socos
;-----------------------------
[State -1, sequência de socos]
type = ChangeState
value = 1020
triggerall = command = "qcb_a"
trigger1 = ( statetype = S ) && ( ctrl = 1 )


; Porrada de cano
;-----------------------------
[State -1, arremesso de faca]
type = ChangeState
value = 1030
triggerall = command = "qcf_b"
trigger1 = ( statetype = S ) && ( ctrl = 1 )


;====================|
;--[ Miscelaneous ]--|
;====================|

; Run
;-----------------------------
[State -1, Run Fwd]
type = ChangeState
value = 100
trigger1 = ( command = "FF" ) && ( statetype = S ) && ( ctrl = 1 )


; Run Kick
;-----------------------------
[State -1, shoulder]
type = ChangeState
value = 110
trigger1 = ( stateno = 100 && command = "a" ) || ( stateno = 100 && command = "b")
trigger1 = (statetype = S) || (statetype = C) && ( ctrl = 1 )


; Hop Backwards
;-----------------------------
[State -1, Run Back]
type = ChangeState
value = 105
trigger1 = command = "BB" && ( statetype = S ) && ( ctrl = 1 )


; Taunt
;-----------------------------
[State -1, Taunt]
type = ChangeState
value = 195
triggerall = command = "start"
trigger1 = ( statetype != A ) && ( ctrl = 1 )


;====================|
;--[ Normal moves ]--|
;====================|


; Stand Punch
;-----------------------------
[State -1, soco]
type = ChangeState
value = 200
triggerall = ( command = "a" )
trigger1 = ( statetype = S ) && ( ctrl = 1 )


; Stand Kick
;-----------------------------
[State -1, chute]
type = ChangeState
value = 210
triggerall = command = "b"
trigger1 = ( statetype = S ) && ( ctrl = 1 )


; Crouch Punch
;-----------------------------
[State -1, soco]
type = ChangeState
value = 400
triggerall = ( command = "a" )
trigger1 = ( statetype = C ) && ( ctrl = 1 )


; Crouch Kick
;-----------------------------
[State -1, chute]
type = ChangeState
value = 410
triggerall = command = "b"
trigger1 = ( statetype = C ) && ( ctrl = 1 )

; Air Kick
;-----------------------------
[State -1, soco no ar]
type = ChangeState
value = 600
triggerall = command = "a"
trigger1 = ( statetype = A ) && ( ctrl = 1 )


; Strong Air Kick
;-----------------------------
[State -1, chute no ar]
type = ChangeState
value = 610
triggerall = command = "b"
trigger1 = ( statetype = A ) && ( ctrl = 1 )


