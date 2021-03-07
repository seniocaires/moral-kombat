;-| Default Values |-------------------------------------------------------
[Defaults]
; Default value for the "time" parameter of a Command. Minimum 1.
command.time = 30

; Default value for the "buffer.time" parameter of a Command. Minimum 1,
; maximum 30.
command.buffer.time = 1



;-| Super Motions |--------------------------------------------------------
;The following two have the same name, but different motion.
;Either one will be detected by a "command = TripleKFPalm" trigger.
;Time is set to 20 (instead of default of 15) to make the move
;easier to do.

[Command]
name = "2QCB_yb"
command = ~D, DB, B, a+b
time = 30

[Command]
name = "2QCB_yb"
command = ~D, DB, B, b+c
time = 30

[Command]
name = "2QCB_yb"
command = ~D, DB, B, a+c
time = 30

;ADA
[Command]
name = "2QCF_z"
command = c+z+s
time = 30

[Command]
name = "2QCF_xy"
command = ~D, DB, B, x+y
time = 30

[Command]
name = "2QCF_xy"
command = ~D, DB, B, y+z
time = 30

[Command]
name = "2QCF_xy"
command = ~D, DB, B, x+z
time = 30

[Command]
name = "2QCF_zz"
command = ~D, F, D, F, z
time = 30


[Command]
name = "2QCF_a"
command = ~D, DF, F, a+b
time = 30

[Command]
name = "2QCF_a"
command = ~D, DF, F, b+c
time = 30

[Command]
name = "2QCF_a"
command = ~D, DF, F, a+c
time = 30

[Command]
name = "2QCF_x"
command = ~D, DF, F, x+y
time = 30

[Command]
name = "2QCF_y"
command = ~D, DF, F, y+z
time = 30

[Command]
name = "2QCF_y"
command = ~D, DF, F, x+z
time = 30
;[Command]
;name = "2QCF_xb"
;command = ~D, B, D, B, x
;time = 30
;[Command]
;name = "2QCF_yb"
;command = ~D, B, D, B, y
;time = 30









;-| Special Motions |------------------------------------------------------

[Command]
name = "granada"
command = ~F, D, DF, a
time = 30
[Command]
name = "granada"
command = ~F, D, DF, b
time = 30
[Command]
name = "granada"
command = ~F, D, DF, c
time = 30

[Command]
name = "DP_x"
command = ~F, D, DF, x
time = 30
[Command]
name = "DP_y"
command = ~F, D, DF, y
time = 30
[Command]
name = "DP_y"
command = ~F, D, DF, z
time = 30

[Command]
name = "QCF_x"
command = ~D, DF, F, x
time = 30
[Command]
name = "QCF_y"
command = ~D, DF, F, y
time = 30
[Command]
name = "QCF_y"
command = ~D, DF, F, z
time = 30

[Command]
name = "QCB_x"
command = ~D, DB, B, x
time = 30
[Command]
name = "QCB_y"
command = ~D, DB, B, y
time = 30
[Command]
name = "QCB_y"
command = ~D, DB, B, z
time = 30

[Command]
name = "QCF_a"
command = ~D, DF, F, a
time = 30
[Command]
name = "QCF_b"
command = ~D, DF, F, b
time = 30
[Command]
name = "QCF_b"
command = ~D, DF, F, c
time = 30

[Command]
name = "QCB_a"
command = ~D, DB, B, a
time = 30
[Command]
name = "QCB_b"
command = ~D, DB, B, b
time = 30
[Command]
name = "QCB_b"
command = ~D, DB, B, c
time = 30

[Command]
name = "baixo_a"
command = /$D, a
time = 30

[Command]
name = "baixo_b"
command = /$D, b
time = 30

[Command]
name = "baixo_b"
command = /$D, c
time = 30

[Command]
name = "cima_a"
command = /$U, a
time = 30

[Command]
name = "cima_b"
command = /$U, b
time = 30

[Command]
name = "cima_b"
command = /$U, c
time = 30

[Command]
name = "frente_a"
command = /$F, a
time = 30

[Command]
name = "frente_b"
command = /$F, b
time = 30

[Command]
name = "frente_b"
command = /$F, c
time = 30

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
;

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

;-| Hold Button |----------------------------------------------------------
; Please define Anim 74140108 in your AIR file if AND ONLY IF you place these
; 7 Hold Button commands immediately after the 11 Single Button and Hold Dir
; commands at the very top of your CMD list, as demonstrated here.
; In this version of the AI code, these commands are only used by the XOR
; method, and thus are optional.  But there remains a possibility that a
; future version of the helper method might be helped by having these
; commands placed here, and Anim 74140108 would then be used to indicate
; that a partner character has a compatible CMD.

[Command]
name = "holda"
command = /a
time = 1

[Command]
name = "holdb"
command = /b
time = 1

[Command]
name = "holdc"
command = /c
time = 1

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
name = "holdstart"
command = /s
time = 1
;-| especiais |-----------------------------------------------

;-| Double Tap |-----------------------------------------------------------
[Command]
name = "FF"     ;Required (do not remove)
command = F, F
time = 10


[Command]
name = "BB"     ;Required (do not remove)
command = B, B
time = 10
;buffer.time = 5

[Command]
name = "hop"
command = D,D
time = 10

;-| 2/3 Button Combination |-----------------------------------------------

[Command]
name = "recovery";Required (do not remove)
command = x+a
time = 2

[Command]
name = "recovery";Required (do not remove)
command = c
time = 1

[Command]
name = "fwdrecovery";Required (do not remove)
command = F,x+a
time = 2

[Command]
name = "brecovery";Required (do not remove)
command = B,x+a
time = 2

[Command]
name = "knock"
command = y+b
time = 10

;-| Dir + Button |---------------------------------------------------------
[Command]
name = "hijump"
command = ~$D, $U
time = 18

[Command]
name = "SJ"
command = ~$D, $U
time = 18
;-| CPU |--------------------------------------------------------------
; Note that if you make any changes to the basic one-button or recovery
; commands, you'll need to make the same changes to their matching commands here
; and/or in the XOR VarSet controller.  That includes things like, for example:
;  * changing the recovery command to use a different combination of buttons.
;  * renaming the b button command as "d", or the start button command as "s".
;  * switching the button names around, e.g. so button y triggers "a" and button a triggers "y".
;  * having more than one way to trigger the same command name.
; If you understand how the XOR method works, the proper changes should be obvious.
; If you don't understand it, then simply disable the lines in the XOR VarSet
; controller that correspond to the commands you've altered.

[Command]
name = "a2"
command = a
time = 1

[Command]
name = "b2"
command = b
time = 1

[Command]
name = "c2"
command = c
time = 1

[Command]
name = "x2"
command = x
time = 1

[Command]
name = "y2"
command = y
time = 1

[Command]
name = "z2"
command = z
time = 1

[Command]
name = "start2"
command = s
time = 1

[Command]
name = "holdfwd2"
command = /$F
time = 1

[Command]
name = "holdback2"
command = /$B
time = 1

[Command]
name = "holdup2"
command = /$U
time = 1

[Command]
name = "holddown2"
command = /$D
time = 1

[Command]
name = "holda2"
command = /a
time = 1

[Command]
name = "holdb2"
command = /b
time = 1

[Command]
name = "holdc2"
command = /c
time = 1

[Command]
name = "holdx2"
command = /x
time = 1

[Command]
name = "holdy2"
command = /y
time = 1

[Command]
name = "holdz2"
command = /z
time = 1

[Command]
name = "holdstart2"
command = /s
time = 1

[Command]
name = "recovery2"
command = x+a
time = 1

[Command]
name = "recovery2"
command = c
time = 1

;---------------------------------------------------------------------------

[Statedef -1]

; AI Helper Check
[State -1, AI Helper Check]
type = ChangeState
trigger1 = IsHelper(9741)
value = 9741

; AI Helper Check 2
[State -1, AI Helper Check 2]
type = ChangeState
trigger1 = IsHelper(9742)
value = 9742

;===========================================================================
;KFM's jump into attack code.
;===========================================================================
;[State -1, AtkDetecion1]
;type = VarSet
;trigger1 = 1
;sysvar(3) = Floor(sysfvar(2))
;ignorehitpause = 1

;[State -1, AtkDetecion1]
;type = VarSet
;trigger1 = 1
;sysfvar(2) = sysfvar(3)
;ignorehitpause = 1

;[State -1, AtkDetecion1]
;type = VarSet
;trigger1 = 1
;sysfvar(3) = sysfvar(4)
;ignorehitpause = 1

;[State -1, AtkDetecion2]
;type = VarSet
;trigger1 = 1
;sysfvar(4) = 1*(command = "a") + 10*(command = "b") + 100*(command = "c") + 1000*(command = "x") + 10000*(command = "y") + 100000*(command = "z")
;ignorehitpause = 1

;[State -1, DirDetecion2]
;type = VarAdd
;trigger1 = Floor(sysvar(4) % 10) = 0
;trigger2 = Floor(sysvar(4) % 10) < 2
;sysvar(4) = 1*(command = "holdfwd")
;ignorehitpause = 1

;[State -1, DirDetecion2]
;type = VarAdd
;trigger1 = Floor((sysvar(4)/10) % 10) = 0
;trigger2 = Floor((sysvar(4)/10) % 10) < 2
;sysvar(4) = 10*(command = "holdback")
;ignorehitpause = 1

;[State -1, DirDetecion2]
;type = VarAdd
;trigger1 = Floor((sysvar(4)/100) % 10) = 0
;trigger2 = Floor((sysvar(4)/100) % 10) < 2
;sysvar(4) = 100*(command = "holddown")
;ignorehitpause = 1

;[State -1, DirDetecion2]
;type = VarAdd
;trigger1 = Floor((sysvar(4)/1000) % 10) = 0
;trigger2 = Floor((sysvar(4)/1000) % 10) < 2
;sysvar(4) = 1000*(command = "holdup")
;ignorehitpause = 1

;[State -1, DirDetecion2]
;type = VarAdd
;trigger1 = Floor(sysvar(4) % 10) > 0
;trigger1 = command != "holdfwd"
;sysvar(4) = -1
;ignorehitpause = 1

;[State -1, DirDetecion2]
;type = VarAdd
;trigger1 = Floor((sysvar(4)/10) % 10) > 0
;trigger1 = command != "holdback"
;sysvar(4) = -10
;ignorehitpause = 1

;[State -1, DirDetecion2]
;type = VarAdd
;trigger1 = Floor((sysvar(4)/100) % 10) > 0
;trigger1 = command != "holddown"
;sysvar(4) = -100
;ignorehitpause = 1

;[State -1, DirDetecion2]
;type = VarAdd
;trigger1 = Floor((sysvar(4)/1000) % 10) > 0
;trigger1 = command != "holdup"
;sysvar(4) = -1000
;ignorehitpause = 1

;[State -1, DirDetecion2]
;type = VarAdd
;trigger1 = Floor(sysvar(4) % 10) > 0
;trigger1 = command != "holdfwd"
;sysvar(4) = -1
;ignorehitpause = 1

;[State -1, DirDetecion2]
;type = VarAdd
;trigger1 = Floor((sysvar(4)/10) % 10) > 0
;trigger1 = command != "holdback"
;sysvar(4) = -10
;ignorehitpause = 1

;[State -1, DirDetecion2]
;type = VarAdd
;trigger1 = Floor((sysvar(4)/100) % 10) > 0
;trigger1 = command != "holddown"
;sysvar(4) = -100
;ignorehitpause = 1

;[State -1, DirDetecion2]
;type = VarAdd
;trigger1 = Floor((sysvar(4)/1000) % 10) > 0
;trigger1 = command != "holdup"
;sysvar(4) = -1000
;ignorehitpause = 1

;===============================================================================
;-------------------------------------------------------------------------------
;===============================================================================
;Hyper Desperation Moves
;===============================================================================
;-------------------------------------------------------------------------------
;===============================================================================
;===============================================================================
;Guns Combo
;===============================================================================
;===============================================================================
[State -1,Guns Combo <<<<<<<<<<<<]
type = ChangeState
value = 3200
triggerall = command="2QCB_yb"
triggerall = power >= 3000
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,399]) && movecontact

;===============================================================================
;-------------------------------------------------------------------------------
;===============================================================================
;Super Desperation Moves
;===============================================================================
;-------------------------------------------------------------------------------
;===============================================================================
;===============================================================================
;Bazooka
;===============================================================================
;===============================================================================
; Leon: No Chão / Bazooka: No Chão
[State -1,Bazooka]
type = ChangeState
value = 3510
triggerall = Command = "2QCF_zz"
triggerall = power >= 2000
triggerall = NumHelPer(3700) = 1
triggerall = Helper(3700), Pos X = [Pos X -35, Pos X +70]
triggerall = Helper(3700), stateno = 3710
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,399]) && movecontact

; Leon: No Chão / Bazooka: No Ar
[State -1,Bazooka]
type = ChangeState
value = 3511
triggerall = Command = "2QCF_zz"
triggerall = power >= 2000
triggerall = NumHelPer(3700) = 1
triggerall = Helper(3700), Pos X = [Pos X -25, Pos X +50];[Pos X -25, Pos X +30]
triggerall = Helper(3700), Pos Y = [-100, -10]
triggerall = Helper(3700), stateno = 3700
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,399]) && movecontact

; Leon: No Ar / Bazooka: No Ar
[State -1,Bazooka]
type = ChangeState
value = 3512
triggerall = Command = "2QCF_zz"
triggerall = power >= 2000
triggerall = NumHelPer(3700) = 1
triggerall = Helper(3700), Pos X = [Pos X -20, Pos X +50]
triggerall = Helper(3700), Pos Y = [-185, -100]
triggerall = Helper(3700), stateno = 3700
triggerall = statetype = A
trigger1 = ctrl
trigger2=(stateno=[600,699]) && movecontact

;===============================================================================
;===============================================================================
;Uzi
;===============================================================================
;===============================================================================
;Forte
[State -1,Uzi]
type = ChangeState
value = 3300
triggerall = command="2QCF_xy"
triggerall = power >= 2000
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,399]) && movecontact

;===============================================================================
;-------------------------------------------------------------------------------
;===============================================================================
;Desperation Moves
;===============================================================================
;-------------------------------------------------------------------------------
;===============================================================================
;===============================================================================
;Piercing eyes
;===============================================================================
;===============================================================================


;-------------------------------------------------------------------------------
; Max PowerBar Condition
;-------------------------------------------------------------------------------


;===============================================================================
;===============================================================================
; S.T.A.R.S. Advanced Attack
;===============================================================================
;===============================================================================
[State -1, S.T.A.R.S. Advanced Attack]
type = ChangeState
value = 3400
triggerall = command="2QCF_a"
triggerall = power >= 1000
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,399]) && movecontact



;===============================================================================
;===============================================================================
;Shotgun
;===============================================================================
;===============================================================================
;Forte
[State -1,Shotgun Forte]
type = ChangeState
value = 3010
triggerall = command="2QCF_y"
triggerall = power >= 1000
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,399]) && movecontact

[State -1,Shotgun Fraco]
type = ChangeState
value = 3000
triggerall = command="2QCF_x"
triggerall = power >= 1000
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,399]) && movecontact



;===============================================================================
;===============================================================================
;Preparando Granada
;===============================================================================
;===============================================================================
;Preparando Granada
;[State -1,Preparando Granada]
;type = ChangeState
;value = 3100
;triggerall = command="2QCF_xb"
;triggerall = power >= 1000
;triggerall = statetype != A
;trigger1 = ctrl
;trigger2=(stateno=[200,399]) && movecontact

;[State -1,Preparando Granada (Ja contendo 9 granadas)]
;type = ChangeState
;value = 3101
;triggerall = command="2QCF_yb"
;triggerall = power >= 1000
;triggerall = statetype != A
;trigger1 = ctrl
;trigger2=(stateno=[200,399]) && movecontact


;===============================================================================
;===============================================================================
;Granada
;===============================================================================
;===============================================================================
;Granada
[State -1,Granada]
type = ChangeState
value = 3110
triggerall = command = "granada"
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,399]) && movecontact

;===============================================================================
;-------------------------------------------------------------------------------
;-------------------------------------------------------------------------------
;===============================================================================
; Special Moves
;===============================================================================
;-------------------------------------------------------------------------------
;-------------------------------------------------------------------------------
;===============================================================================
; Facada Anti-Aérea
;===============================================================================
;Forte
[State -1,Facada Anti-Aérea Forte]
type = ChangeState
value = 1410
triggerall = command="DP_y"
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,399]) && movecontact

;Fraca
[State -1,Facada Anti-Aérea Fraca]
type = ChangeState
value = 1400
triggerall = command="DP_x"
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,399]) && movecontact

;===============================================================================
; Chutão
;===============================================================================
;Forte
[State -1,Chutão Forte]
type = ChangeState
value = 1310
triggerall = command="QCF_b"
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,399]) && movecontact

;Fraco
[State -1,Chutão Fraco]
type = ChangeState
value = 1300
triggerall = command="QCF_a"
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,399]) && movecontact

;===============================================================================
; Soco Corrido
;===============================================================================
;Forte
[State -1,Soco Corrido Forte]
type = ChangeState
value = 1210
triggerall = command="QCF_y"
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,399]) && movecontact

;Fraco
[State -1,Soco Corrido Fraco]
type = ChangeState
value = 1200
triggerall = command="QCF_x"
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,399]) && movecontact

;===============================================================================
; Tiro
;===============================================================================
;Forte
[State -1,Tiro Forte]
type = ChangeState
value = 1105
triggerall = command="QCB_y"
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,399]) && movecontact

;Fraco
[State -1,Tiro Fraco]
type = ChangeState
value = 1100
triggerall = command="QCB_x"
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,399]) && movecontact

;===============================================================================
; Facada
;===============================================================================
;Forte
[State -1,Facada Forte]
type = ChangeState
value = 1050
triggerall = command="QCB_b"
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,399]) && movecontact

;Fraco
[State -1,Facada Fraca]
type = ChangeState
value = 1000
triggerall = command="QCB_a"
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,399]) && movecontact

;---------------------------------------------------------------------------
;Guard Counter Blowback Attack
;[State -1, Guard Counter Blowback Attack]
;type = ChangeState
;value = 255
;;triggerall = var(59) != 1
;triggerall = statetype != A
;trigger1 =  (command = "z" || command = "knock")
;trigger1 = stateno = 150 || stateno = 151
;trigger1 = power >= 1000

;---------------------------------------------------------------------------
;-------------------------------------------------------------------------------



;-------------------------------------------------------------------------------
;-------------------------------------------------------------------------------
;Grab Attempt
[State -1, Grab Attempt]
type = ChangeState
value = 850
triggerall = EnemyNear,HitOver && EnemyNear,GetHitVar(ctrltime)=0
;triggerall = var(59) != 1
triggerall = command = "holdfwd"
triggerall = command = "c"
triggerall = statetype = S
triggerall = ctrl
triggerall = stateno != 100
triggerall = enemynear,anim!=[120,159]
triggerall = p2stateno != 40 && p2stateno !=52 ; Cannot grab during jump start / jump land
trigger1 = p2bodydist X <= 10 && p2dist X >= -20
trigger1 = (p2statetype = S) || (p2statetype = C)
trigger1 = p2movetype != H
[State -1, Grab Attempt]
type = ChangeState
value = 800
triggerall = EnemyNear,HitOver && EnemyNear,GetHitVar(ctrltime)=0
;triggerall = var(59) != 1
triggerall = command = "holdfwd"
triggerall = command = "z"
triggerall = statetype = S
triggerall = ctrl
triggerall = stateno != 100
triggerall = enemynear,anim!=[120,159]
triggerall = p2stateno != 40 && p2stateno !=52 ; Cannot grab during jump start / jump land
trigger1 = p2bodydist X <= 10 && p2dist X >= -20
trigger1 = (p2statetype = S) || (p2statetype = C)
trigger1 = p2movetype != H

;---------------------------------------------------------------------------
; PowerBar Explod
;[State -1, >>> PowerBar Explod <<<]
;type = ChangeState
;value = 790
;;triggerall = var(59) != 1
;triggerall = Power >= 1000
;triggerall = NumHelPer(10090) = 0
;;triggerall = helper(10090),var(25) <= 0
;triggerall = command = "c" || command = "a" && command = "y"
;triggerall = statetype != A
;trigger1 = ctrl

;---------------------------------------------------------------------------
; PowerBar Explod
;[State -1, >>> PowerBar Explod (Cancel Version) <<<]
;type = ChangeState
;value = 791
;;triggerall = var(59) != 1
;triggerall = Power >= 2000
;triggerall = NumHelPer(10090) = 0
;;triggerall = helper(10090),var(25) <= 0
;triggerall = command = "c" || command = "a" && command = "y"
;triggerall = statetype != A
;trigger1 = stateno = 200 && movehit = 1
;trigger2 = stateno = 210 && movehit = 1
;trigger3 = stateno = 215 && movehit = 1
;trigger4 = stateno = 230 && movehit = 1
;trigger5 = stateno = 240 && movehit = 1
;trigger6 = stateno = 245 && movehit = 1
;trigger7 = stateno = 250 && movehit = 1
;trigger8 = stateno = 255 && movehit = 1
;trigger9 = stateno = 260 && movehit = 1
;trigger10 = stateno = 265 && movehit = 1
;trigger11 = stateno = 300 && movehit = 1
;trigger12 = stateno = 310 && movehit = 1
;trigger13 = stateno = 330 && movehit = 1
;trigger14 = stateno = 340 && movehit = 1
;;ignorehitpause = 1

;---------------------------------------------------------------------------
;---------------------------------------------------------------------------


;===========================================================================
;---------------------------------------------------------------------------
;Run Fwd
;ƒ_ƒbƒVƒ…
[State -1, Run Fwd]
type = ChangeState
value = 100
;triggerall = var(59) != 1
triggerall = command = "FF"
triggerall = statetype = S
trigger1 = ctrl
trigger2 = stateno = 791

;---------------------------------------------------------------------------
;Run Back
;Œã‘Þƒ_ƒbƒVƒ…
[State -1, Run Back]
type = ChangeState
value = 105
;triggerall = var(59) != 1
triggerall = command = "BB"
triggerall = statetype = S
trigger1 = ctrl
trigger2 = stateno = 791

;===========================================================================
;---------------------------------------------------------------------------



;---------------------------------------------------------------------------
;Taunt
;’§”­
[State -1, Taunt]
type = ChangeState
value = 195
;triggerall = var(59) != 1
triggerall = command = "start"
trigger1 = stateno != 195
trigger1 = statetype != A
trigger1 = ctrl || (stateno = 100 && animelemtime(2) >= 0) || stateno = 101
;---------------------------------------------------------------------------



;Jump Light Punch
[State -1, Jump Light Punch]
type = ChangeState
value = 400
triggerall = var(59) = 0
triggerall = Command = "x"
triggerall = StateType = A
trigger1 = Ctrl
trigger2 = MoveContact
trigger2 = StateNo = 1002
trigger3 = stateno = 1011
trigger4 = stateno = 1021

;----------------------------------------------------------------------
;Jump Middle Punch
[State -1, Jump Middle Punch]
type = ChangeState
value = 410
triggerall = var(59) = 0
triggerall = Command = "y"
triggerall = StateType = A
trigger1 = Ctrl
trigger2 = MoveContact
trigger2 = StateNo = 400
trigger3 = MoveContact
trigger3 = StateNo = 430
trigger4 = MoveContact
trigger4 = StateNo = 1002
trigger5 = stateno = 1011
trigger6 = stateno = 1021

;---------------------------------------------------------------------------
;Jump Strong Punch
[State -1, Jump Strong Punch]
type = ChangeState
value = 420
triggerall = var(59) = 0
triggerall = Command = "z"
triggerall = StateType = A
trigger1 = Ctrl
trigger2 = MoveContact
trigger2 = StateNo = 410
trigger3 = MoveContact
trigger3 = StateNo = 450
trigger4 = MoveContact
trigger4 = StateNo = 440
trigger5 = MoveContact
trigger5 = StateNo = 1002
trigger6 = stateno = 1011
trigger7 = stateno = 1021

;---------------------------------------------------------------------------
;Jump Light Kick
[State -1, Jump Light Kick]
type = ChangeState
value = 430
triggerall = var(59) = 0
triggerall = Command = "a"
triggerall = StateType = A
trigger1 = Ctrl
trigger2 = MoveContact
trigger2 = StateNo = 400
trigger3 = MoveContact
trigger3 = StateNo = 1002
trigger4 = stateno = 1011
trigger5 = stateno = 1021

;----------------------------------------------------------------------
;Jump Middle Kick
[State -1, Jump Middle Kick]
type = ChangeState
value = 440
triggerall = var(59) = 0
triggerall = Command = "b"
triggerall = StateType = A
trigger1 = Ctrl
trigger2 = MoveContact
trigger2 = StateNo = 410
trigger3 = MoveContact
trigger3 = StateNo = 430
trigger4 = MoveContact
trigger4 = StateNo = 1002
trigger5 = stateno = 1011
trigger6 = stateno = 1021

;---------------------------------------------------------------------------
;Jump Strong Kick
[State -1, Jump Strong Kick]
type = ChangeState
value = 450
triggerall = var(59) = 0
triggerall = Command = "c"
triggerall = StateType = A
triggerall = stateno != 450
trigger1 = Ctrl
trigger2 = MoveContact
trigger2 = StateNo = 440
trigger3 = MoveContact
trigger3 = StateNo = 410
trigger4 = MoveContact
trigger5 = StateNo = 1002
trigger6 = stateno = 1011
trigger7 = stateno = 1021

;-----------------------------
[State -1, X agachado]
type = ChangeState
value = 300
triggerall = var(59) = 0
triggerall = Command = "x"
triggerall = Command = "holddown"
trigger1 = (StateType != A) && (Ctrl)
trigger2 = (StateNo = 200) && (Movecontact)
trigger3 = (StateNo = 230) && (Movecontact)
trigger4 = (StateNo = 1000) && (Movecontact)
trigger5 = stateno = 811

;-----------------------------
[State -1, X]
type = ChangeState
value = 200
triggerall = var(59) = 0
triggerall = Command = "x"
triggerall = Command != "holddown"
trigger1 = (StateType = S) && (Ctrl)
trigger2 = stateno = 811

;-----------------------------

[State -1, Y agachado]
type = ChangeState
value = 320
triggerall = var(59) = 0
triggerall = Command = "y"
triggerall = Command = "holddown"
trigger1 = (StateType != A) && (Ctrl)
trigger2 = (StateNo = 200) && (Movecontact)
trigger3 = (StateNo = 230) && (Movecontact)
trigger4 = (StateNo = 300) && (Movecontact)
trigger5 = (StateNo = 330) && (Movecontact)
trigger6 = (StateNo = 210) && (Movecontact)
trigger7 = (StateNo = 211) && (Movecontact)
trigger8 = (StateNo = 350) && (Movecontact)
trigger9 = (StateNo = 340) && (Movecontact)

;-----------------------------

[State -1, Y]
type = ChangeState
value = 210
triggerall = var(59) = 0
triggerall = Command = "y"
triggerall = Command != "holddown"
trigger1 = (StateType = S) && (Ctrl)
trigger2 = (StateNo = 200) && (Movecontact) && time > 3
trigger3 = (StateNo = 230) && (Movecontact)

;-----------------------------

[State -1, Z]
type = ChangeState
value = 206
triggerall = var(59) = 0
triggerall = Command = "z"
triggerall = Command != "holddown"
trigger1 = (StateType = S) && (Ctrl)
trigger2 = (StateNo = 200) && (Movecontact) && time > 3
trigger3 = (StateNo = 230) && (Movecontact) && time > 3
trigger4 = (StateNo = 210) && (Movecontact) && time > 3
trigger5 = (StateNo = 211) && (Movecontact) && time > 3
trigger6 = (StateNo = 350) && (Movecontact) && time > 3
trigger7 = (StateNo = 241) && (Movecontact) && time > 3
trigger8 = stateno = 1002
 
;-----------------------------

[State -1, C]
type = ChangeState
value = 250
triggerall = var(59) = 0
triggerall = Command = "c"
triggerall = Command != "holddown"
trigger1 = (StateType = S) && (Ctrl)
trigger2 = (StateNo = 200) && (Movecontact)
trigger3 = (StateNo = 210) && (Movecontact)
trigger4 = (StateNo = 211) && (Movecontact)
trigger5 = (StateNo = 240) && (Movecontact)
trigger6 = (StateNo = 241) && (Movecontact)

;-----------------------------

[State -1, Z agachado]
type = ChangeState
value = 310
triggerall = var(59) = 0
triggerall = Command = "z"
triggerall = Command = "holddown"
trigger1 = (StateType != A) && (Ctrl)
trigger2 = (StateNo = 200) && (Movecontact)
trigger3 = (StateNo = 230) && (Movecontact)
trigger4 = (StateNo = 300) && (Movecontact)
trigger5 = (StateNo = 330) && (Movecontact)
trigger6 = (StateNo = 210) && (Movecontact)
trigger7 = (StateNo = 211) && (Movecontact)
trigger8 = (StateNo = 240) && (Movecontact)
trigger9 = (StateNo = 241) && (Movecontact)
trigger10 = (StateNo = 220) && (Movecontact)
trigger11 = (StateNo = 221) && (Movecontact)
trigger12 = (StateNo = 320) && (Movecontact)
trigger13 = (StateNo = 340) && (Movecontact)
trigger14 = (StateNo = 1000) && (Movecontact)

;-----------------------------

[State -1, A agachado]
type = ChangeState
value = 330
triggerall = var(59) = 0
triggerall = Command = "a"
triggerall = Command = "holddown"
trigger1 = (StateType != A) && (Ctrl)
trigger2 = (Stateno = 200) && (Movecontact)
trigger3 = (Stateno = 230) && (Movecontact)
trigger4 = (Stateno = 300) && (Movecontact)
trigger5 = (StateNo = 1000) && (Movecontact)
trigger6 = stateno = 811

;-----------------------------


[State -1, A]
type = ChangeState
value = 230
triggerall = var(59) = 0
triggerall = Command = "a"
triggerall = Command != "holddown"
triggerall = stateno != 100
trigger1 = (StateType = S) && (Ctrl)
trigger2 = (Stateno = 200) && (Movecontact)
trigger3 = stateno = 811

;-----------------------------

[State -1, B]
type = ChangeState
value = 240
triggerall = var(59) = 0
triggerall = Command = "b"
triggerall = Command != "holddown"
trigger1 = (StateType = S) && (Ctrl)
trigger2 = (StateNo = 200) && (Movecontact)
trigger3 = (StateNo = 230) && (Movecontact)
trigger4 = (StateNo = 210) && (Movecontact)
trigger5 = (StateNo = 211)

;-----------------------------

[State -1, B agachado]
type = ChangeState
value = 350
triggerall = var(59) = 0
triggerall = Command = "b"
triggerall = Command = "holddown"
trigger1 = (StateType != A) && (Ctrl)
trigger2 = (StateNo = 200) && (Movecontact)
trigger3 = (StateNo = 230) && (Movecontact)
trigger4 = (StateNo = 300) && (Movecontact)
trigger5 = (StateNo = 330) && (Movecontact)
trigger6 = (StateNo = 210) && (Movecontact)
trigger7 = (StateNo = 211) && (Movecontact)
trigger8 = (StateNo = 240) && (Movecontact)
trigger9 = (StateNo = 241) && (Movecontact)
trigger10 = (StateNo = 220) && (Movecontact)
trigger11 = (StateNo = 221) && (Movecontact)
trigger12 = (StateNo = 1000) && (Movecontact)
trigger13 = (StateNo = 310) && (Movecontact)

;-----------------------------

[State -1, C agachado]
type = ChangeState
value = 340
triggerall = var(59) = 0
triggerall = Command = "c"
triggerall = Command = "holddown"
triggerall = statetype !=A
trigger1 = (Ctrl)
trigger2 = (StateNo = 200) && (Movecontact)
trigger3 = (StateNo = 230) && (Movecontact)
trigger4 = (StateNo = 300) && (Movecontact)
trigger5 = (StateNo = 330) && (Movecontact)
trigger6 = (StateNo = 210) && (Movecontact)
trigger7 = (StateNo = 211) && (Movecontact)
trigger8 = (StateNo = 250) && (Movecontact)
trigger9 = (StateNo = 251) && (Movecontact)
trigger10 = (StateNo = 320) && (Movecontact)
trigger11 = (StateNo = 321) && (Movecontact)
trigger12 = (StateNo = 310) && (Movecontact)
trigger13 = (StateNo = 350) && (Movecontact)
trigger14 = (StateNo = 1000) && (Movecontact)
;---------------------------------------------------------------------------
;Jump Strong Kick
[State -1, Jump Strong Kick]
type = ChangeState
value = ifelse (!Vel X, 441, 440)
;triggerall = var(59) != 1
triggerall = command = "b"
trigger1 = ctrl
trigger1 = statetype = A


; Fall Breaker
[State -1, Fall Breaker]
type = ChangeState
value = 5200
;triggerall = var(59) != 1
triggerall = alive
triggerall = canrecover
triggerall = command = "recovery"
trigger1 = stateno = 5050
trigger1 = pos y >= -40
;-----------------------------
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
trigger1 = stateno = 310 && movehit