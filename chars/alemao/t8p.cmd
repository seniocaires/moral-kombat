; The CMD file.
;
; Two parts: 1. Command definition and  2. State entry
; (state entry is after the commands def section)
;
; 1. Command definition
; ---------------------
; Note: The commands are CASE-SENSITIVE, and so are the command names.
; The eight directions are:
;   B, DB, D, DF, F, UF, U, UB     (all CAPS)
;   corresponding to back, down-back, down, downforward, etc.
; The six buttons are:
;   a, b, c, x, y, z               (all lower case)
;   In default key config, abc are are the bottom, and xyz are on the
;   top row. For 2 button characters, we recommend you use a and b.
;   For 6 button characters, use abc for kicks and xyz for punches.
;
; Each [Command] section defines a command that you can use for
; state entry, as well as in the CNS file.
; The command section should look like:
;
;   [Command]
;   name = some_name
;   command = the_command
;   time = time (optional)
;   buffer.time = time (optional)
;
; - some_name
;   A name to give that command. You'll use this name to refer to
;   that command in the state entry, as well as the CNS. It is case-
;   sensitive (QCB_a is NOT the same as Qcb_a or QCB_A).
;
; - command
;   list of buttons or directions, separated by commas. Each of these
;   buttons or directions is referred to as a "symbol".
;   Directions and buttons can be preceded by special characters:
;   slash (/) - means the key must be held down
;          egs. command = /D       ;hold the down direction
;               command = /DB, a   ;hold down-back while you press a
;   tilde (~) - to detect key releases
;          egs. command = ~a       ;release the a button
;               command = ~D, F, a ;release down, press fwd, then a
;          If you want to detect "charge moves", you can specify
;          the time the key must be held down for (in game-ticks)
;          egs. command = ~30a     ;hold a for at least 30 ticks, then release
;   dollar ($) - Direction-only: detect as 4-way
;          egs. command = $D       ;will detect if D, DB or DF is held
;               command = $B       ;will detect if B, DB or UB is held
;   plus (+) - Buttons only: simultaneous press
;          egs. command = a+b      ;press a and b at the same time
;               command = x+y+z    ;press x, y and z at the same time
;   greater-than (>) - means there must be no other keys pressed or released
;                      between the previous and the current symbol.
;          egs. command = a, >~a   ;press a and release it without having hit
;                                  ;or released any other keys in between
;   You can combine the symbols:
;     eg. command = ~30$D, a+b     ;hold D, DB or DF for 30 ticks, release,
;                                  ;then press a and b together
;
;   Note: Successive direction symbols are always expanded in a manner similar
;         to this example:
;           command = F, F
;         is expanded when MUGEN reads it, to become equivalent to:
;           command = F, >~F, >F
;
;   It is recommended that for most "motion" commads, eg. quarter-circle-fwd,
;   you start off with a "release direction". This makes the command easier
;   to do.
;
; - time (optional)
;   Time allowed to do the command, given in game-ticks. The default
;   value for this is set in the [Defaults] section below. A typical
;   value is 15.
;
; - buffer.time (optional)
;   Time that the command will be buffered for. If the command is done
;   successfully, then it will be valid for this time. The simplest
;   case is to set this to 1. That means that the command is valid
;   only in the same tick it is performed. With a higher value, such
;   as 3 or 4, you can get a "looser" feel to the command. The result
;   is that combos can become easier to do because you can perform
;   the command early. Attacks just as you regain control (eg. from
;   getting up) also become easier to do. The side effect of this is
;   that the command is continuously asserted, so it will seem as if
;   you had performed the move rapidly in succession during the valid
;   time. To understand this, try setting buffer.time to 30 and hit
;   a fast attack, such as KFM's light punch.
;   The default value for this is set in the [Defaults] section below. 
;   This parameter does not affect hold-only commands (eg. /F). It
;   will be assumed to be 1 for those commands.
;
; If you have two or more commands with the same name, all of them will
; work. You can use it to allow multiple motions for the same move.
;
; Some common commands examples are given below.
;
; [Command] ;Quarter circle forward + x
; name = "QCF_x"
; command = ~D, DF, F, x
;
; [Command] ;Half circle back + a
; name = "HCB_a"
; command = ~F, DF, D, DB, B, a
;
; [Command] ;Two quarter circles forward + y
; name = "2QCF_y"
; command = ~D, DF, F, D, DF, F, y
;
; [Command] ;Tap b rapidly
; name = "5b"
; command = b, b, b, b, b
; time = 30
;
; [Command] ;Charge back, then forward + z
; name = "charge_B_F_z"
; command = ~60$B, F, z
; time = 10
;
; [Command] ;Charge down, then up + c
; name = "charge_D_U_c"
; command = ~60$D, U, c
; time = 10


;-| Button Remapping |-----------------------------------------------------
; This section lets you remap the player's buttons (to easily change the
; button configuration). The format is:
;   old_button = new_button
; If new_button is left blank, the button cannot be pressed.
[Remap]
x = x
y = y
z = z
a = a
b = b
c = c
s = s
;  Note that if you modify the button remapping scheme here, this character will
; still be able to correctly detect the basic commands of other characters
; complying with the basic command order specified below, as long as their
; buttons haven't been remapped.  But no character (not even one with the same
; remapping scheme, not even another instance of this character) will be able to
; correctly detect this character's commands.  This shouldn't ever result in any
; false positives, but it could delay correct positives, and could erroneously
; make the helper AI activation method trigger a false negative in team simul
; modes, in which case the XOR-ed commands method would be needed to provide
; backup.  But of course, this isn't an issue in any version of Mugen prior to
; version 2002.04.14.

;-| Default Values |-------------------------------------------------------
[Defaults]
; Default value for the "time" parameter of a Command. Minimum 1.
command.time = 15

; Default value for the "buffer.time" parameter of a Command. Minimum 1,
; maximum 30.
command.buffer.time = 1


; These 11 Single Button and Hold Dir commands must be placed here at the top
; of the CMD, above all other commands, and in the standard order shown here,
; in order for the "Compatibly Partnered" version (9742) of the helper AI
; activation method to work with different partners in simul team mode.
; (When the partner is not compatible, then it's best to just use the regular
; version (9741) and rely on the XOR method for backup in case a human
; partner's input turns off the CPU partner's AI.)
;   (Now, even if you do not intend to give your character any custom AI, it
; would still be nice if you would place the commands at the top of your CMD,
; for the sake of other characters which do use this AI activation method.
; And then, define Anim 9741 in your AIR file to indicate to other characters
; that your character is compatible.
;   It may slightly increase the chances of faulty AI activation if the user
; is using characters with a poor implementation of the old humanly-impossible
; commands AI activation method when fighting against your character, but
; other than that, there's really no particular reason not to.  And you can
; change the names of the commands if you want.  For compatibility, all that
; really matters is the "command" and "time" parameters.)
;
; Please don't add any extra definitions for any of these 11 basic command
; names, nor for any of the 7 "hold[button]" command names that follow.
; For example, things like this should be avoided:
;	[Command]
;	name = "z"
;	command = y+b
;	time = 1
; There are several workarounds possible to achieve the same effect.  Please
; feel free to ask me about it if you have any uncertainty.
; Violating this rule would cause the KeyCtrl Helper method and/or the XORed
; Commands method to malfunction, and could also interfere with other future
; applications of this command order standard.
;
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

;--- None of your own command definitions should be above this line. ---

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
command = x+y
time = 1

; Here add matching commands for any moves that must never be used randomly
; by the computer, such as suicide moves and super moves, and add the pairs
; to the XOR VarSet controller in State -3.

; If you're desperate to make sure that the AI always gets turned on as soon
; as possible, you can add more equivalents for your own commands here too,
; and add to the XOR VarSet controller's triggers accordingly.

; And of course, if you've run out of unique command labels (Mugen allows
; 128), you can remove as many of these as you want.  You'll of course need
; to modify the XOR VarSet controller's triggers accordingly, but Mugen
; will let you know if you forget to do so. :)


;-| Super Motions |--------------------------------------------------------
;The following two have the same name, but different motion.
;Either one will be detected by a "command = TripleKFPalm" trigger.
;Time is set to 20 (instead of default of 15) to make the move
;easier to do.
;
[Command]
name = "Poverty"
command = ~D,B,U,F
[Command]
name = "Poverty"
command = ~D,DB,B,UB,U,UF,F
[Command]
name = "Poverty"
command = ~$D,$B,$U,$F


[Command]
name = "SimpleSuper"
command = ~D,DF,F,D,DF,F,x
time = 20
[Command]
name = "SimpleSuper"
command = ~D,DF,F,D,DF,F, y
time = 20
[Command]
name = "SimpleSuper"
command = ~D,DF,F,D,DF,F, z
time = 20
[Command]
name = "SimpleSuper"
command = ~D,F,D,F, x
time = 20
[Command]
name = "SimpleSuper"
command = ~D,F,D,F, y
time = 20
[Command]
name = "SimpleSuper"
command = ~D,F,D,F, z
time = 20

[Command]
name = "CounterSuper"
command = ~D,DB,B,D,DB,B, x
time = 20
[Command]
name = "CounterSuper"
command = ~D,DB,B,D,DB,B, y
time = 20
[Command]
name = "CounterSuper"
command = ~D,DB,B,D,DB,B, z
time = 20
[Command]
name = "CounterSuper"
command = ~D,B,D,B, x
time = 20
[Command]
name = "CounterSuper"
command = ~D,B,D,B, y
time = 20
[Command]
name = "CounterSuper"
command = ~D,B,D,B, y
time = 20


[Command]
name = "RisingSuper"
command = ~D,DB,B,D,DB,B, a
time = 20
[Command]
name = "RisingSuper"
command = ~D,DB,B,D,DB,B, b
time = 20
[Command]
name = "RisingSuper"
command = ~D,DB,B,D,DB,B, c
time = 20
[Command]
name = "RisingSuper"
command = ~D,B,D,B, a
time = 20
[Command]
name = "RisingSuper"
command = ~D,B,D,B, b
time = 20
[Command]
name = "RisingSuper"
command = ~D,B,D,B, c
time = 20

;-| Special Motions |------------------------------------------------------
[Command]
name = "upper_a"
command = ~F, D, DF, a
[Command]
name = "upper_b"
command = ~F, D, DF, b
[Command]
name = "upper_c"
command = ~F, D, DF, c
[Command]
name = "upper_a"
command = ~F, D, F, a
[Command]
name = "upper_b"
command = ~F, D, F, b
[Command]
name = "upper_c"
command = ~F, D, F, c

[Command]
name = "HCB_x"
command = ~F, DF, D, DB, B, x
[Command]
name = "HCB_x"
command = ~F, D, B, x
[Command]
name = "HCB_y"
command = ~F, DF, D, DB, B, y
[Command]
name = "HCB_y"
command = ~F, D, B, y
[Command]
name = "HCB_z"
command = ~F, DF, D, DB, B, z
[Command]
name = "HCB_z"
command = ~F, D, B, z

[Command]
name = "HCF_a"
command = ~B, DB, D, DF, F, a
[Command]
name = "HCF_a"
command = ~B, D, F, a
[Command]
name = "HCF_b"
command = ~B, DB, D, DF, F, b
[Command]
name = "HCF_b"
command = ~B, D, F, b
[Command]
name = "HCF_c"
command = ~B, DB, D, DF, F, c
[Command]
name = "HCF_c"
command = ~B, D, F, c

[Command]
name = "HCF_x"
command = ~B, DB, D, DF, F, x
[Command]
name = "HCF_x"
command = ~B, D, F, x
[Command]
name = "HCF_y"
command = ~B, DB, D, DF, F, y
[Command]
name = "HCF_y"
command = ~B, D, F, y
[Command]
name = "HCF_z"
command = ~B, DB, D, DF, F, z
[Command]
name = "HCF_z"
command = ~B, D, F, z

[Command]
name = "QCB_a"
command = ~D, DB, B, a
[Command]
name = "QCB_b"
command = ~D, DB, B, b
[Command]
name = "QCB_c"
command = ~D, DB, B, c
[Command]
name = "QCB_x"
command = ~D, DB, B, x
[Command]
name = "QCB_y"
command = ~D, DB, B, y
[Command]
name = "QCB_z"
command = ~D, DB, B, z

[Command]
name = "QCB_a"
command = ~D, B, a
[Command]
name = "QCB_b"
command = ~D, B, b
[Command]
name = "QCB_c"
command = ~D, B, c
[Command]
name = "QCB_x"
command = ~D, B, x
[Command]
name = "QCB_y"
command = ~D, B, y
[Command]
name = "QCB_z"
command = ~D, B, z

[Command]
name = "Zaieken_x"
command = ~DB, F, x
[Command]
name = "Zaieken_y"
command = ~DB, F, y
[Command]
name = "Zaieken_z"
command = ~DB, F, z

[Command]
name = "CDU_x"
command = ~15$D, $U, x
time = 10
[Command]
name = "CDU_y"
command = ~15$D, $U, y
time = 10
[Command]
name = "CDU_z"
command = ~15$D, $U, z
time = 10

; N'Edge

[Command]
name = "SimpleSuper"
command = ~D,DF,F,D,DF,F, ~x
time = 20
[Command]
name = "SimpleSuper"
command = ~D,DF,F,D,DF,F, ~y
time = 20
[Command]
name = "SimpleSuper"
command = ~D,DF,F,D,DF,F, ~z
time = 20
[Command]
name = "SimpleSuper"
command = ~D,F,D,F, ~x
time = 20
[Command]
name = "SimpleSuper"
command = ~D,F,D,F, ~y
time = 20
[Command]
name = "SimpleSuper"
command = ~D,F,D,F, ~z
time = 20

[Command]
name = "CounterSuper"
command = ~D,DB,B,D,DB,B, ~x
time = 20
[Command]
name = "CounterSuper"
command = ~D,DB,B,D,DB,B, ~y
time = 20
[Command]
name = "CounterSuper"
command = ~D,DB,B,D,DB,B, ~z
time = 20
[Command]
name = "CounterSuper"
command = ~D,B,D,B, ~x
time = 20
[Command]
name = "CounterSuper"
command = ~D,B,D,B, ~y
time = 20
[Command]
name = "CounterSuper"
command = ~D,B,D,B, ~y
time = 20


[Command]
name = "RisingSuper"
command = ~D,DB,B,D,DB,B, ~a
time = 20
[Command]
name = "RisingSuper"
command = ~D,DB,B,D,DB,B, ~b
time = 20
[Command]
name = "RisingSuper"
command = ~D,DB,B,D,DB,B, ~c
time = 20
[Command]
name = "RisingSuper"
command = ~D,B,D,B, ~a
time = 20
[Command]
name = "RisingSuper"
command = ~D,B,D,B, ~b
time = 20
[Command]
name = "RisingSuper"
command = ~D,B,D,B, ~c
time = 20

;-| Special Motions |------------------------------------------------------
[Command]
name = "upper_a"
command = ~F, D, DF, ~a
[Command]
name = "upper_b"
command = ~F, D, DF, ~b
[Command]
name = "upper_c"
command = ~F, D, DF, ~c
[Command]
name = "upper_a"
command = ~F, D, F, ~a
[Command]
name = "upper_b"
command = ~F, D, F, ~b
[Command]
name = "upper_c"
command = ~F, D, F, ~c

[Command]
name = "HCB_x"
command = ~F, DF, D, DB, B, ~x
[Command]
name = "HCB_x"
command = ~F, D, B, ~x
[Command]
name = "HCB_y"
command = ~F, DF, D, DB, B, ~y
[Command]
name = "HCB_y"
command = ~F, D, B, ~y
[Command]
name = "HCB_z"
command = ~F, DF, D, DB, B, ~z
[Command]
name = "HCB_z"
command = ~F, D, B, ~z

[Command]
name = "HCF_a"
command = ~B, DB, D, DF, F, ~a
[Command]
name = "HCF_a"
command = ~B, D, F, ~a
[Command]
name = "HCF_b"
command = ~B, DB, D, DF, F, ~b
[Command]
name = "HCF_b"
command = ~B, D, F, ~b
[Command]
name = "HCF_c"
command = ~B, DB, D, DF, F, ~c
[Command]
name = "HCF_c"
command = ~B, D, F, ~c

[Command]
name = "HCF_x"
command = ~B, DB, D, DF, F, ~x
[Command]
name = "HCF_x"
command = ~B, D, F, ~x
[Command]
name = "HCF_y"
command = ~B, DB, D, DF, F, ~y
[Command]
name = "HCF_y"
command = ~B, D, F, ~y
[Command]
name = "HCF_z"
command = ~B, DB, D, DF, F, ~z
[Command]
name = "HCF_z"
command = ~B, D, F, ~z

[Command]
name = "QCB_a"
command = ~D, DB, B, ~a
[Command]
name = "QCB_b"
command = ~D, DB, B, ~b
[Command]
name = "QCB_c"
command = ~D, DB, B, ~c
[Command]
name = "QCB_x"
command = ~D, DB, B, ~x
[Command]
name = "QCB_y"
command = ~D, DB, B, ~y
[Command]
name = "QCB_z"
command = ~D, DB, B, ~z

[Command]
name = "QCB_a"
command = ~D, B, ~a
[Command]
name = "QCB_b"
command = ~D, B, ~b
[Command]
name = "QCB_c"
command = ~D, B, ~c
[Command]
name = "QCB_x"
command = ~D, B, ~x
[Command]
name = "QCB_y"
command = ~D, B, ~y
[Command]
name = "QCB_z"
command = ~D, B, ~z

[Command]
name = "Zaieken_x"
command = ~DB, F, ~x
[Command]
name = "Zaieken_y"
command = ~DB, F, ~y
[Command]
name = "Zaieken_z"
command = ~DB, F, ~z

[Command]
name = "CDU_x"
command = ~15$D, $U, ~x
time = 10
[Command]
name = "CDU_y"
command = ~15$D, $U, ~y
time = 10
[Command]
name = "CDU_z"
command = ~15$D, $U, ~z
time = 10


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
[Command]
name = "down_a"
command = /$D,a
time = 1

[Command]
name = "down_b"
command = /$D,b
time = 1

;---------------------------------------------------------------------------
; 2. State entry
; --------------
; This is where you define what commands bring you to what states.
;
; Each state entry block looks like:
;   [State -1, Label]           ;Change Label to any name you want to use to
;                               ;identify the state with.
;   type = ChangeState          ;Don't change this
;   value = new_state_number
;   trigger1 = command = command_name
;   . . .  (any additional triggers)
;
; - new_state_number is the number of the state to change to
; - command_name is the name of the command (from the section above)
; - Useful triggers to know:
;   - statetype
;       S, C or A : current state-type of player (stand, crouch, air)
;   - ctrl
;       0 or 1 : 1 if player has control. Unless "interrupting" another
;                move, you'll want ctrl = 1
;   - stateno
;       number of state player is in - useful for "move interrupts"
;   - movecontact
;       0 or 1 : 1 if player's last attack touched the opponent
;                useful for "move interrupts"
;
; Note: The order of state entry is important.
;   State entry with a certain command must come before another state
;   entry with a command that is the subset of the first.
;   For example, command "fwd_a" must be listed before "a", and
;   "fwd_ab" should come before both of the others.
;
; For reference on triggers, see CNS documentation.
;
; Just for your information (skip if you're not interested):
; This part is an extension of the CNS. "State -1" is a special state
; that is executed once every game-tick, regardless of what other state
; you are in.


; Don't remove the following line. It's required by the CMD standard.
[Statedef -1]

; The main purpose of having these next two controllers here at the top of
; StateDef -1 is to make sure the AI helper never changes to a different state,
; nor encounters any VarSets within State -1.
; But they also improve efficiency by preventing Mugen from wasting time
; processing the entire State -1 for the helper.
[State -1, AI Helper Check]
type = ChangeState
trigger1 = IsHelper(9741)
value = 9741

[State -1, AI Helper Check 2]
type = ChangeState
trigger1 = IsHelper(9742)
value = 9742

; This is generally the best place to put most of your AI directives.  For
; example, this controller would only be executed when the CPU is in control:
;
; [State -1, Haha!]
; type = ChangeState
; trigger1 = var(0) ; (Or use "var(58)>0" if you've chosen not to
;                   ; use the Simplifier variable/controller.)
; trigger1 = ctrl
; trigger1 = StateType = S
; trigger1 = MoveType = I
; trigger1 = P2MoveType = H
; trigger1 = NumEnemy = 1
; trigger1 = Enemy,GetHitVar(HitTime) > 60
; trigger1 = PrevStateNo != 195
; trigger1 = Random < 99
; value = 195

; And of course, most human-only command-based ChangeStates also belong
; in State -1.  For example, this move would only be performable by a human:
;
; [State -1, Death Before Dishonor]
; type = ChangeState
; trigger1 = command = "suicide"
; trigger1 = !var(0) ; (Or use "var(58)<1" if you've chosen not to
;                    ; use the Simplifier variable/controller.)
; trigger1 = ctrl
; trigger1 = StateType != A
; trigger1 = MoveType = I
; value = {suicide state number}


;===========================================================================
;This is not a move, but it sets up var(1) to be 1 if conditions are right
;for a combo into a special move (used below).
;Since a lot of special moves rely on the same conditions, this reduces
;redundant logic.
[State -1, Combo condition Reset]
type = VarSet
trigger1 = 1
var(9) = 0

[State -1, Combo condition Check]
type = VarSet
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = statetype != A
trigger2 = (stateno = [200,299]) || (stateno = [400,499])
trigger2 = (stateno != 250 && stateno != 450) || animtime >= -10
trigger2 = movecontact
trigger3 = stateno = 40
trigger3 = animtime != 0
var(9) = 1

;===========================================================================
;AI
;===========================================================================

[State AI, Kung Fu Throw]
type = ChangeState
value = ifelse(random<100,40,ifelse(random<100,1300,800))
triggerall = var(55)
triggerall = statetype = S
triggerall = ctrl
triggerall = stateno != 100
triggerall = stateno != 40
triggerall = random < 900 || var(54) = 2
triggerall = p2stateno != [5100,5200]
triggerall = prevstateno != [800,899]
;triggerall = var(8) <= 0
trigger1 = p2bodydist X <= 5
trigger1 = (p2statetype = S) || (p2statetype = C)
trigger1 = p2movetype != H || random < 321

[State AI, ChangeState]
type = ChangeState
triggerall = stateno != 40
triggerall = (var(55)) && (StateType != A) && (Ctrl) && (EnemyNear, Facing != Facing) && (var(50)<40)
trigger1 = (P2StateType != C) && (((P2MoveType = A) && (inguarddist)) || (EnemyNear, NumProj > 0))
value = ifelse(random<32&&(stateno!=[120,169])&&power>=1000,3050,130)

[State AI, ChangeState]
type = ChangeState
triggerall = stateno != 40
triggerall = (var(55)) && (StateType != A) && (Ctrl) && (EnemyNear, Facing != Facing) && (var(50)<40)
trigger1 = (P2StateType = C) && (((P2MoveType = A) && (inguarddist)) || (EnemyNear, NumProj > 0))
value = ifelse(random<16&&(stateno!=[120,169]),40,131)

[State AI, Taunt]
type = ChangeState
triggerall = var(55)
triggerall = p2bodydist x >= 80
triggerall = statetype != A
triggerall = prevstateno != 195
triggerall = stateno != 195
triggerall = ctrl
trigger1 = random < ifelse(p2bodydist x<=45,500,20)
trigger1 = (p2stateno = [5100,5200]) || p2statetype = L
value = 195

; AI CONSIDERATIONS

[State -1, AI Consideration reset]
type = VarSet
trigger1 = 1
var(50) = 0

[State AI, Consider Projectile Spam]
type = VarSet
triggerall = var(55)
triggerall = random < 123
triggerall = ((p2movetype != A && enemynear, numproj = 0) || (EnemyNear, Facing = Facing) || (EnemyNear, moveguarded >= 8) || (var(51)) || (!InGuardDist) ) || (p2movetype!= A && enemynear, ctrl = 0) || random < 100
triggerall = (p2stateno != [5080,5130]) || random < 150
triggerall = p2bodydist x >= 80
triggerall = p2bodydist y >= -100
triggerall = ( p2dist y + (enemynear,const(size.head.pos.y) / ifelse(p2statetype=C,2,1) ) ) <= -50 || random < 100
triggerall = statetype != A
triggerall = !numhelper(1200)
trigger1 = stateno != 40
trigger1 = stateno != 20 || random < 100
trigger1 = !moveguarded
var(50) = 1200 + ifelse((p2stateno != [5080,5130]),(random%3*10),0)

[State AI, Consider Advancing]
type = VarSet
triggerall = var(55)
triggerall = random < 200
triggerall = ((enemynear, ctrl = 0) && p2movetype != A) || (p2movetype = A && (enemynear, facing = facing))
triggerall = p2stateno != [5080,5130]
triggerall = p2bodydist x >= 80
triggerall = statetype != A
trigger1 = stateno != 40
trigger1 = !moveguarded
var(50) = 100

[State AI, Consider QCB.H]
type = VarSet
triggerall = var(50) != 0 || random < 326
triggerall = var(55)
triggerall = random < 105
triggerall = ((p2movetype != A && enemynear, numproj = 0) || (EnemyNear, Facing = Facing) || (EnemyNear, moveguarded >= 8) || (var(51)) || (!InGuardDist) ) || (p2movetype!= A && enemynear, ctrl = 0)
triggerall = p2stateno != [5080,5130]
triggerall = p2bodydist x = [25,201]
triggerall = p2bodydist y >= -120
triggerall = ( p2dist y + (enemynear,const(size.head.pos.y) / ifelse(p2statetype=C,2,1) ) ) <= -60
triggerall = statetype != A
triggerall = !numtarget(1000)
triggerall = !moveguarded
trigger1 = stateno != 40
trigger1 = stateno != 20 || random < 100
trigger1 = var(9)
trigger2 = stateno = 1150 || stateno = 1160 || (stateno = 1170 && animelemtime(5)>=0)
trigger2 = animtime >= -10 || movecontact
trigger3 = stateno = 1200 || stateno = 1210 || stateno = 1220
trigger3 = animelemtime(3) >= 3
var(50) = 1020

[State AI, Consider KFP.H]
type = VarSet
triggerall = var(50) != 0 || random < 326
triggerall = var(55)
triggerall = random < 110
triggerall = ((p2movetype != A && enemynear, numproj = 0) || (EnemyNear, Facing = Facing) || (EnemyNear, moveguarded >= 8) || (var(51)) || (!InGuardDist) ) || (p2movetype!= A && enemynear, ctrl = 0)
triggerall = p2stateno != [5080,5130]
triggerall = p2bodydist x = [25,146]
triggerall = p2bodydist y >= -90
triggerall = ( p2dist y + (enemynear,const(size.head.pos.y) / ifelse(p2statetype=C,2,1) ) ) <= -80
triggerall = statetype != A
triggerall = !moveguarded
trigger1 = stateno != 40
trigger1 = stateno != 20 || random < 100
trigger1 = var(9)
trigger2 = stateno = 1150 || stateno = 1160 || (stateno = 1170 && animelemtime(5)>=0)
trigger2 = animtime >= -10 || movecontact
var(50) = 1170

[State AI, Consider QCB.M]
type = VarSet
triggerall = var(50) != 0 || random < 326
triggerall = var(55)
triggerall = random < 115
triggerall = ((p2movetype != A && enemynear, numproj = 0) || (EnemyNear, Facing = Facing) || (EnemyNear, moveguarded >= 8) || (var(51)) || (!InGuardDist) ) || (p2movetype!= A && enemynear, ctrl = 0)
triggerall = p2stateno != [5080,5130]
triggerall = p2bodydist x = [25,126]
triggerall = p2bodydist y >= -150
triggerall = ( p2dist y + (enemynear,const(size.head.pos.y) / ifelse(p2statetype=C,2,1) ) ) <= -85
triggerall = statetype != A
triggerall = !numtarget(1000)
triggerall = !moveguarded
trigger1 = stateno != 40
trigger1 = stateno != 20 || random < 100
trigger1 = var(9)
trigger2 = stateno = 1150 || stateno = 1160 || (stateno = 1170 && animelemtime(5)>=0)
trigger2 = animtime >= -10 || movecontact
trigger3 = stateno = 1200 || stateno = 1210 || stateno = 1220
trigger3 = animelemtime(3) >= 3
var(50) = 1010

[State AI, Consider KFP.L]
type = VarSet
triggerall = var(50) != 0 || random < 326
triggerall = var(55)
triggerall = random < 120
triggerall = ((p2movetype != A && enemynear, numproj = 0) || (EnemyNear, Facing = Facing) || (EnemyNear, moveguarded >= 8) || (var(51)) || (!InGuardDist) ) || (p2movetype!= A && enemynear, ctrl = 0)
triggerall = p2stateno != [5080,5130]
triggerall = p2bodydist x = [25,120]
triggerall = p2bodydist y >= -90
triggerall = ( p2dist y + (enemynear,const(size.head.pos.y) / ifelse(p2statetype=C,2,1) ) ) <= -80
triggerall = statetype != A
triggerall = !moveguarded
trigger1 = stateno != 40
trigger1 = stateno != 20 || random < 100
trigger1 = var(9)
trigger2 = stateno = 1150 || stateno = 1160 || (stateno = 1170 && animelemtime(5)>=0)
trigger2 = animtime >= -10 || movecontact
var(50) = ifelse(random<500,1160,1150)

[State AI, Consider BH.H]
type = VarSet
triggerall = var(50) != 0 || random < 326
triggerall = var(55)
triggerall = random < 125
triggerall = ((p2movetype != A && enemynear, numproj = 0) || (EnemyNear, Facing = Facing) || (EnemyNear, moveguarded >= 8) || (var(51)) || (!InGuardDist) ) || (p2movetype!= A && enemynear, ctrl = 0) || (random < 250)
triggerall = p2stateno != [5080,5130]
triggerall = p2bodydist x = [25,107]
triggerall = p2bodydist y >= -90
triggerall = ( p2dist y + (enemynear,const(size.head.pos.y) / ifelse(p2statetype=C,2,1) ) ) <= -90
triggerall = statetype != A
triggerall = !numtarget(1050)
trigger1 = stateno != 40
trigger1 = stateno != 20 || random < 100
trigger1 = var(9)
trigger2 = stateno = 1150 || stateno = 1160 || (stateno = 1170 && animelemtime(5)>=0)
trigger2 = animtime >= -10 || movecontact
var(50) = 1070

[State AI, Consider QCB.L]
type = VarSet
triggerall = var(50) != 0 || random < 326
triggerall = var(55)
triggerall = random < 130
triggerall = ((p2movetype != A && enemynear, numproj = 0) || (EnemyNear, Facing = Facing) || (EnemyNear, moveguarded >= 8) || (var(51)) || (!InGuardDist) ) || (p2movetype!= A && enemynear, ctrl = 0)
triggerall = p2stateno != [5080,5130]
triggerall = p2bodydist x = [25,101]
triggerall = p2bodydist y >= -140
triggerall = ( p2dist y + (enemynear,const(size.head.pos.y) / ifelse(p2statetype=C,2,1) ) ) <= -70
triggerall = statetype != A
triggerall = !numtarget(1000)
triggerall = !moveguarded
trigger1 = stateno != 40
trigger1 = stateno != 20 || random < 100
trigger1 = var(9)
trigger2 = stateno = 1150 || stateno = 1160 || (stateno = 1170 && animelemtime(5)>=0)
trigger2 = animtime >= -10 || movecontact
var(50) = 1000

[State AI, Consider BH.L]
type = VarSet
triggerall = var(50) != 0 || random < 326
triggerall = var(55)
triggerall = random < 135
triggerall = ((p2movetype != A && enemynear, numproj = 0) || (EnemyNear, Facing = Facing) || (EnemyNear, moveguarded >= 8) || (var(51)) || (!InGuardDist) ) || (p2movetype!= A && enemynear, ctrl = 0) || (random < 300)
triggerall = p2stateno != [5080,5130]
triggerall = p2bodydist x = [25,88]
triggerall = p2bodydist y >= -81
triggerall = ( p2dist y + (enemynear,const(size.head.pos.y) / ifelse(p2statetype=C,2,1) ) ) <= -80
triggerall = statetype != A
triggerall = !numtarget(1050)
triggerall = !moveguarded
trigger1 = stateno != 40
trigger1 = stateno != 20 || random < 100
trigger1 = var(9)
trigger2 = stateno = 1150 || stateno = 1160 || (stateno = 1170 && animelemtime(5)>=0)
trigger2 = animtime >= -10 || movecontact
var(50) = ifelse(random<500,1060,1050)

[State AI, Consider S/F.HK]
type = VarSet
triggerall = var(50) != 0 || random < 326
triggerall = var(55)
triggerall = random < 140
triggerall = ((p2movetype != A && enemynear, numproj = 0) || (EnemyNear, Facing = Facing) || (EnemyNear, moveguarded >= 8) || (var(51)) || (!InGuardDist) ) || (p2movetype!= A && enemynear, ctrl = 0)
triggerall = p2stateno != [5080,5130]
triggerall = p2bodydist x = [25,88]
triggerall = p2bodydist y >= -132
triggerall = ( p2dist y + (enemynear,const(size.head.pos.y) / ifelse(p2statetype=C,2,1) ) ) <= -70
triggerall = statetype != A
trigger1 = stateno != 40
trigger1 = stateno != 20 || random < 100
trigger1 = ctrl
trigger2 = stateno = 200 || stateno = 215 || stateno = 205 || stateno = 210 || stateno = 400 || stateno = 410 || stateno = 430 || stateno = 235
trigger2 = animtime >= -7 || movecontact
var(50) = ifelse(random<500,250,255)

[State AI, Consider F.LK/MK]
type = VarSet
triggerall = var(50) != 0 || random < 326
triggerall = var(55)
triggerall = random < 145
triggerall = ((p2movetype != A && enemynear, numproj = 0) || (EnemyNear, Facing = Facing) || (EnemyNear, moveguarded >= 8) || (var(51)) || (!InGuardDist) ) || (p2movetype!= A && enemynear, ctrl = 0)
triggerall = p2stateno != [5080,5130]
triggerall = p2bodydist x = [15,84]
triggerall = p2bodydist y >= -113
triggerall = ( p2dist y + (enemynear,const(size.head.pos.y) / ifelse(p2statetype=C,2,1) ) ) <= -70
triggerall = statetype != A
trigger1 = stateno != 40
trigger1 = stateno != 20 || random < 100
trigger1 = ctrl
trigger2 = stateno = 430
trigger2 = animtime >= -7 || movecontact
var(50) = ifelse(random<500,235,245)

[State AI, Consider F.LP/MP]
type = VarSet
triggerall = var(50) != 0 || random < 326
triggerall = var(55)
triggerall = random < 150
triggerall = ((p2movetype != A && enemynear, numproj = 0) || (EnemyNear, Facing = Facing) || (EnemyNear, moveguarded >= 8) || (var(51)) || (!InGuardDist) ) || (p2movetype!= A && enemynear, ctrl = 0)
triggerall = p2stateno != [5080,5130]
triggerall = p2bodydist x = [10,78]
triggerall = p2bodydist y >= -95
triggerall = ( p2dist y + (enemynear,const(size.head.pos.y) / ifelse(p2statetype=C,2,1) ) ) <= -80
triggerall = statetype != A
trigger1 = stateno != 40
trigger1 = stateno != 20 || random < 100
trigger1 = ctrl
trigger2 = stateno = 200 || stateno = 400 || stateno = 410
trigger2 = animtime >= -7 || movecontact
var(50) = ifelse(random<500,205,215)

[State AI, Consider C.LP]
type = VarSet
triggerall = var(50) != 0 || random < 326
triggerall = var(55)
triggerall = random < 155
triggerall = ((p2movetype != A && enemynear, numproj = 0) || (EnemyNear, Facing = Facing) || (EnemyNear, moveguarded >= 8) || (var(51)) || (!InGuardDist) ) || (p2movetype!= A && enemynear, ctrl = 0)
triggerall = p2stateno != [5080,5130]
triggerall = p2bodydist x = [-5,67]
triggerall = p2bodydist y >= -50
triggerall = ( p2dist y + (enemynear,const(size.head.pos.y) / ifelse(p2statetype=C,2,1) ) ) <= -48
triggerall = statetype != A
trigger1 = stateno != 40
trigger1 = stateno != 20 || random < 100
trigger1 = ctrl
trigger2 = stateno = 400 || stateno = 200
trigger2 = animtime >= -7 || movecontact
var(50) = 400

[State AI, Consider C.MP/HP]
type = VarSet
triggerall = var(50) != 0 || random < 326
triggerall = var(55)
triggerall = random < 160
triggerall = ((p2movetype != A && enemynear, numproj = 0) || (EnemyNear, Facing = Facing) || (EnemyNear, moveguarded >= 8) || (var(51)) || (!InGuardDist) ) || (p2movetype!= A && enemynear, ctrl = 0)
triggerall = p2stateno != [5080,5130]
triggerall = p2bodydist x = [-5,67]
triggerall = p2bodydist y >= -50
triggerall = ( p2dist y + (enemynear,const(size.head.pos.y) / ifelse(p2statetype=C,2,1) ) ) <= -48
triggerall = statetype != A
trigger1 = stateno != 40
trigger1 = stateno != 20 || random < 100
trigger1 = ctrl
trigger2 = stateno = 400 || stateno = 200 || stateno = 205
trigger2 = animtime >= -7 || movecontact
var(50) = ifelse(random<500,420,410)

[State AI, Consider Upper.H]
type = VarSet
triggerall = var(50) != 0 || random < 326
triggerall = var(55)
triggerall = random < 165
triggerall = ((p2movetype != A && enemynear, numproj = 0) || (EnemyNear, Facing = Facing) || (EnemyNear, moveguarded >= 8) || (var(51)) || (!InGuardDist) ) || (p2movetype!= A && enemynear, ctrl = 0) || random < 200
triggerall = p2stateno != [5080,5130]
triggerall = p2bodydist x = [-5,62]
triggerall = p2bodydist y >= -140
triggerall = ( p2dist y + (enemynear,const(size.head.pos.y) / ifelse(p2statetype=C,2,1) ) ) <= -48
triggerall = p2statetype != C
triggerall = statetype != A
triggerall = !numtarget(1100)
triggerall = !moveguarded
trigger1 = stateno != 40
trigger1 = stateno != 20 || random < 100
trigger1 = var(9)
trigger2 = stateno = 1150 || stateno = 1160 || (stateno = 1170 && animelemtime(5)>=0)
trigger2 = animtime >= -10 || movecontact
var(50) = 1120

[State AI, Consider S.LP/MP]
type = VarSet
triggerall = var(50) != 0 || random < 326
triggerall = var(55)
triggerall = random < 170
triggerall = ((p2movetype != A && enemynear, numproj = 0) || (EnemyNear, Facing = Facing) || (EnemyNear, moveguarded >= 8) || (var(51)) || (!InGuardDist) ) || (p2movetype!= A && enemynear, ctrl = 0)
triggerall = p2stateno != [5080,5130]
triggerall = p2bodydist x = [-5,60]
triggerall = p2bodydist y >= -80
triggerall = ( p2dist y + (enemynear,const(size.head.pos.y) / ifelse(p2statetype=C,2,1) ) ) <= -80
triggerall = statetype != A
trigger1 = stateno != 40
trigger1 = stateno != 20 || random < 100
trigger1 = ctrl
var(50) = ifelse(random<500,200,210)

[State AI, Consider S.LK/MK]
type = VarSet
triggerall = var(50) != 0 || random < 326
triggerall = var(55)
triggerall = random < 175
triggerall = ((p2movetype != A && enemynear, numproj = 0) || (EnemyNear, Facing = Facing) || (EnemyNear, moveguarded >= 8) || (var(51)) || (!InGuardDist) ) || (p2movetype!= A && enemynear, ctrl = 0)
triggerall = p2stateno != [5080,5130]
triggerall = p2bodydist x = [-5,54]
triggerall = p2bodydist y >= -113
triggerall = ( p2dist y + (enemynear,const(size.head.pos.y) / ifelse(p2statetype=C,2,1) ) ) <= -70
triggerall = statetype != A
trigger1 = stateno != 40
trigger1 = stateno != 20 || random < 100
trigger1 = ctrl
trigger2 = stateno = 430
trigger2 = animtime >= -7 || movecontact
var(50) = ifelse(random<500,230,240)

[State AI, Consider S/F.HP]
type = VarSet
triggerall = var(50) != 0 || random < 326
triggerall = var(55)
triggerall = random < 185
triggerall = ((p2movetype != A && enemynear, numproj = 0) || (EnemyNear, Facing = Facing) || (EnemyNear, moveguarded >= 8) || (var(51)) || (!InGuardDist) ) || (p2movetype!= A && enemynear, ctrl = 0)
triggerall = p2stateno != [5080,5130]
triggerall = p2bodydist x = [-5,50]
triggerall = p2bodydist y >= -70
triggerall = ( p2dist y + (enemynear,const(size.head.pos.y) / ifelse(p2statetype=C,2,1) ) ) <= -65
triggerall = statetype != A
trigger1 = stateno != 40
trigger1 = stateno != 20 || random < 100
trigger1 = ctrl
trigger2 = stateno = 200 || stateno = 205 || stateno = 210 || stateno = 215 || stateno = 400
trigger2 = animtime >= -7 || movecontact
var(50) = ifelse(random<500,220,225)

[State AI, Consider Upper.L]
type = VarSet
triggerall = var(50) != 0 || random < 326
triggerall = var(55)
triggerall = random < 180
triggerall = ((p2movetype != A && enemynear, numproj = 0) || (EnemyNear, Facing = Facing) || (EnemyNear, moveguarded >= 8) || (var(51)) || (!InGuardDist) ) || (p2movetype!= A && enemynear, ctrl = 0) || random < 200
triggerall = p2stateno != [5080,5130]
triggerall = p2bodydist x = [-5,48]
triggerall = p2bodydist y >= -130
triggerall = ( p2dist y + (enemynear,const(size.head.pos.y) / ifelse(p2statetype=C,2,1) ) ) <= -48
triggerall = p2statetype != C
triggerall = statetype != A
triggerall = !numtarget(1100)
triggerall = !moveguarded
trigger1 = stateno != 40
trigger1 = stateno != 20 || random < 100
trigger1 = var(9)
trigger2 = stateno = 1150 || stateno = 1160 || (stateno = 1170 && animelemtime(5)>=0)
trigger2 = animtime >= -10 || movecontact
var(50) = ifelse(random<500,1100,1110)

[State AI, Consider C.MK/HK]
type = VarSet
triggerall = var(50) != 0 || random < 326
triggerall = var(55)
triggerall = random < 190
triggerall = ((p2movetype != A && enemynear, numproj = 0) || (EnemyNear, Facing = Facing) || (EnemyNear, moveguarded >= 8) || (var(51)) || (!InGuardDist) ) || (p2movetype!= A && enemynear, ctrl = 0)
triggerall = p2stateno != [5080,5130]
triggerall = p2bodydist x = [-5,79]
triggerall = p2bodydist y >= -40
triggerall = statetype != A
trigger1 = stateno != 40
trigger1 = stateno != 20 || random < 100
trigger1 = ctrl
trigger2 = stateno = 400 || stateno = 200 || stateno = 205 || stateno = 230
trigger2 = animtime >= -7 || movecontact
var(50) = ifelse(random<500,450,440)

[State AI, Consider C.LK]
type = VarSet
triggerall = var(50) != 0 || random < 326
triggerall = var(55)
triggerall = random < 195
triggerall = ((p2movetype != A && enemynear, numproj = 0) || (EnemyNear, Facing = Facing) || (EnemyNear, moveguarded >= 8) || (var(51)) || (!InGuardDist) ) || (p2movetype!= A && enemynear, ctrl = 0)
triggerall = p2stateno != [5080,5130]
triggerall = p2bodydist x = [-5,61]
triggerall = p2bodydist y >= -39
triggerall = statetype != A
trigger1 = stateno != 40
trigger1 = stateno != 20 || random < 100
trigger1 = ctrl
trigger2 = stateno = 400 || stateno = 200 || stateno = 205
trigger2 = animtime >= -7 || movecontact
var(50) = 430

[State AI, Consider Knee.L]
type = VarSet
triggerall = var(50) != 0 || random < 326
triggerall = var(55)
triggerall = random < 200
triggerall = ((p2movetype != A && enemynear, numproj = 0) || (EnemyNear, Facing = Facing) || (EnemyNear, moveguarded >= 8) || (var(51)) || (!InGuardDist) ) || (p2movetype!= A && enemynear, ctrl = 0) || random < 100
triggerall = p2stateno != [5080,5130]
triggerall = p2bodydist x = [-9,36-(p2dist x/2)]
triggerall = p2bodydist y >= -121
triggerall = ( p2dist y + (enemynear,const(size.head.pos.y) / ifelse(p2statetype=C,2,1) ) ) <= -19
triggerall = statetype != A
triggerall = !numtarget(1300)
triggerall = !moveguarded
trigger1 = stateno != 40
trigger1 = stateno != 20 || random < 100
trigger1 = var(9)
trigger2 = stateno = 1150 || stateno = 1160 || (stateno = 1170 && animelemtime(5)>=0)
trigger2 = animtime >= -10 || movecontact
var(50) = 1300

[State AI, Consider Knee.H]
type = VarSet
triggerall = var(50) != 0 || random < 326
triggerall = var(55)
triggerall = random < 205
triggerall = ((p2movetype != A && enemynear, numproj = 0) || (EnemyNear, Facing = Facing) || (EnemyNear, moveguarded >= 8) || (var(51)) || (!InGuardDist) ) || (p2movetype!= A && enemynear, ctrl = 0) || random < 100
triggerall = p2stateno != [5080,5130]
triggerall = p2bodydist x = [-9,36-(p2dist x)]
triggerall = p2bodydist y >= -121
triggerall = ( p2dist y + (enemynear,const(size.head.pos.y) / ifelse(p2statetype=C,2,1) ) ) <= -29
triggerall = statetype != A
triggerall = !numtarget(1300)
triggerall = !moveguarded
trigger1 = stateno != 40
trigger1 = stateno != 20 || random < 100
trigger1 = var(9)
trigger2 = stateno = 1150 || stateno = 1160 || (stateno = 1170 && animelemtime(5)>=0)
trigger2 = animtime >= -10 || movecontact
var(50) = ifelse(random<500,1310,1320)


[State AI, Consider a Super]
type = VarSet
triggerall = var(55)
triggerall = random < 60
triggerall = ((p2movetype != A && enemynear, numproj = 0) || (EnemyNear, Facing = Facing) || (EnemyNear, moveguarded >= 8) || (var(51)) || (!InGuardDist) ) || (p2movetype!= A && enemynear, ctrl = 0) || random < 100
triggerall = p2stateno != [5080,5130]
triggerall = p2bodydist x = [25,100]
triggerall = p2bodydist y >= -65
triggerall = ( p2dist y + (enemynear,const(size.head.pos.y) / ifelse(p2statetype=C,2,1) ) ) <= -40
triggerall = ( enemynear, vel y <= 0 ) || ( enemynear, vel y + pos y <= -15 )
triggerall = statetype != A
triggerall = power >= 1000
trigger1 = stateno != 40
trigger1 = stateno != 20 || random < 100
trigger1 =(p2movetype = H) || (enemynear, ctrl = 0)
trigger1 = p2stateno != [120,165]
var(50) = 3000

[State AI, Consider a Counter]
type = VarSet
triggerall = var(55)
triggerall = random < 300
triggerall = ((p2movetype = A) && (EnemyNear, Facing != Facing))
triggerall = p2movetype != H
triggerall = statetype != A
triggerall = power >= 1000
triggerall = p2bodydist x <= 100
trigger1 = stateno != 40
var(50) = 3050

[State AI, Consider blowing yourself up]
type = VarSet
triggerall = var(55)
triggerall = random < 85
triggerall = ((p2movetype != A && enemynear, numproj = 0) || (EnemyNear, Facing = Facing) || (EnemyNear, moveguarded >= 8) || (var(51)) || (!InGuardDist) ) || (p2movetype!= A && enemynear, ctrl = 0) || random < 400
triggerall = p2bodydist x = [-28 + (enemynear,vel x),28 + (enemynear,vel x)]
triggerall = p2bodydist y >= -90
triggerall = p2stateno != 5120
triggerall = statetype != A
triggerall = power >= 1000
trigger1 = stateno != 40
trigger1 = stateno != 20 || random < 100
trigger1 = (p2movetype = H) || (enemynear, ctrl = 0)
trigger1 = p2stateno != [120,165]
var(50) = 3100


; Jumpy

[State AI, Consider J.P]
type = VarSet
triggerall = var(55)
triggerall = random < 200
triggerall = p2stateno != [5080,5130]
triggerall = p2bodydist x = [-5,36]
triggerall = p2bodydist y = [-91,60]
triggerall = vel y > 0 || random < 50 || p2statetype = A || p2movetype = A
trigger1 = statetype = A
var(50) = ifelse(random<500,600,610) + ifelse(random<500,0,10)

[State AI, Consider J.LK]
type = VarSet
triggerall = var(55)
triggerall = random < 200
triggerall = p2stateno != [5080,5130]
triggerall = p2bodydist x = [-12,25]
triggerall = p2bodydist y = [-81,51]
triggerall = vel y > 0 || random < 50 || p2statetype = A
trigger1 = statetype = A
var(50) = 630

[State AI, Consider J.MK/HK]
type = VarSet
triggerall = var(55)
triggerall = random < 200
triggerall = p2stateno != [5080,5130]
triggerall = p2bodydist x = [-15,71]
triggerall = p2bodydist y = [-116,66]
triggerall = vel y > 0 || random < 50 || p2statetype = A
trigger1 = statetype = A
var(50) = ifelse(random<500,640,650)

[State AI, Consider J.DK]
type = VarSet
triggerall = var(55)
triggerall = random < 200
triggerall = p2stateno != [5080,5130]
triggerall = p2bodydist x = [-15,64]
triggerall = p2bodydist y = [-101,72]
triggerall = vel y > 0 || random < 50 || p2statetype = A
trigger1 = statetype = A
var(50) = 655

[State AI, Consider J.DP]
type = VarSet
triggerall = var(55)
triggerall = random < 200
triggerall = p2stateno != [5080,5130]
triggerall = p2bodydist x = [-5,42]
triggerall = p2bodydist y = [-51,68]
triggerall = vel y > 0 || random < 50 || p2statetype = A
trigger1 = statetype = A
var(50) = 625

[State AI, DO SOMETHING]
type = ChangeState
value = ifelse(random<420&&power>=1000,3150,811+random%4)
triggerall = var(55)
triggerall = stateno = 810
trigger1 = random < 66
trigger1 = animelemtime(2) > 8
trigger1 = animelemtime(3) < 0
trigger2 = animelemtime(3) = -1


;



;===========================================================================
;END OF AI
;===========================================================================

; NOW THAT'S JUST OVERKILL
[State -1, Simplest Super Ever]
type = ChangeState
value = 3000
triggerall = (command = "SimpleSuper" && !var(55)) || var(50) = 3000
triggerall = power >= 1000
trigger1 = var(9)
trigger2 = stateno = 1005
trigger2 = time >= 2
trigger3 = stateno = 1150 || stateno = 1160 || stateno = 1170
trigger3 = animtime >= -10 || movecontact
trigger4 = stateno = 1050 || stateno = 1060 || stateno = 1070
trigger4 = animtime >= -10

; NOW THAT'S JUST OVERKILL
[State -1, Striking Hercules]
type = ChangeState
value = 3050
triggerall = command = "CounterSuper" || var(50) = 3050
triggerall = power >= 1000
trigger1 = var(9)
trigger2 = stateno = 1005
trigger2 = time >= 2
trigger3 = stateno = 1150 || stateno = 1160 || stateno = 1170
trigger3 = animtime >= -10 || movecontact
trigger4 = stateno = 1050 || stateno = 1060 || stateno = 1070
trigger4 = animtime >= -10

; NOW THAT'S JUST OVERKILL
[State -1, Bomb Super]
type = ChangeState
value = 3100
triggerall = (command = "RisingSuper" && !var(55)) || var(50) = 3100
triggerall = power >= 1000
trigger1 = var(9)
trigger2 = stateno = 1005
trigger2 = time >= 2
trigger3 = stateno = 1150 || stateno = 1160 || stateno = 1170
trigger3 = animtime >= -10 || movecontact
trigger4 = stateno = 1050 || stateno = 1060 || stateno = 1070
trigger4 = animtime >= -10
trigger5 = stateno = 52
trigger5 = time >= 2


; DP+X
[State -1, Air Knee]
type = ChangeState
value = 1300
triggerall = (command = "upper_a" && !var(55)) || var(50) = 1300
trigger1 = var(9)
trigger2 = stateno = 1150 || stateno = 1160 || stateno = 1170
trigger2 = animtime >= -10 || movecontact

; DP+Y
[State -1, Air Knee]
type = ChangeState
value = 1310
triggerall = (command = "upper_b" && !var(55)) || var(50) = 1310
trigger1 = var(9)
trigger2 = stateno = 1150 || stateno = 1160 || stateno = 1170
trigger2 = animtime >= -10 || movecontact

; DP+Z
[State -1, Air Knee]
type = ChangeState
value = 1320
triggerall = (command = "upper_c" && !var(55)) || var(50) = 1320
trigger1 = var(9)
trigger2 = stateno = 1150 || stateno = 1160 || stateno = 1170
trigger2 = animtime >= -10 || movecontact

; QCB+X
[State -1, Special Punch]
type = ChangeState
value = 1050
triggerall = (command = "HCB_x" && !var(55)) || var(50) = 1050
trigger1 = var(9)
trigger2 = stateno = 1150 || stateno = 1160 || stateno = 1170
trigger2 = animtime >= -10 || movecontact

[State -1, Special Punch]
type = ChangeState
value = 1060
triggerall = (command = "HCB_y" && !var(55)) || var(50) = 1060
trigger1 = var(9)
trigger2 = stateno = 1150 || stateno = 1160 || stateno = 1170
trigger2 = animtime >= -10 || movecontact

[State -1, Special Punch]
type = ChangeState
value = 1070
triggerall = (command = "HCB_z" && !var(55)) || var(50) = 1070
trigger1 = var(9)
trigger2 = stateno = 1150 || stateno = 1160 || stateno = 1170
trigger2 = animtime >= -10 || movecontact

; QCB+X
[State -1, Hadouken]
type = ChangeState
value = 1200
triggerall = command = "HCF_x" || var(50) = 1200
triggerall = !numhelper(1200)
trigger1 = var(9)

[State -1, Hadouken]
type = ChangeState
value = 1210
triggerall = command = "HCF_y" || var(50) = 1210
triggerall = !numhelper(1200)
trigger1 = var(9)

[State -1, Hadouken]
type = ChangeState
value = 1220
triggerall = command = "HCF_z" || var(50) = 1220
triggerall = !numhelper(1200)
trigger1 = var(9)

; QCB+A
[State -1, Special Kick]
type = ChangeState
value = 1000
triggerall = command = "QCB_a" || var(50) = 1000
trigger1 = var(9)
trigger2 = stateno = 1150 || stateno = 1160 || stateno = 1170
trigger2 = animtime >= -10 || movecontact
trigger3 = stateno = 1200 || stateno = 1210 || stateno = 1220
trigger3 = animelemtime(3) >= 3

; QCB+A
[State -1, Special Kick]
type = ChangeState
value = 1010
triggerall = command = "QCB_b" || var(50) = 1010
trigger1 = var(9)
trigger2 = stateno = 1150 || stateno = 1160 || stateno = 1170
trigger2 = animtime >= -10 || movecontact
trigger3 = stateno = 1200 || stateno = 1210 || stateno = 1220
trigger3 = animelemtime(3) >= 3

; QCB+A
[State -1, Special Kick]
type = ChangeState
value = 1020
triggerall = command = "QCB_c" || var(50) = 1020
trigger1 = var(9)
trigger2 = stateno = 1150 || stateno = 1160 || stateno = 1170
trigger2 = animtime >= -10 || movecontact
trigger3 = stateno = 1200 || stateno = 1210 || stateno = 1220
trigger3 = animelemtime(3) >= 3

; QCB+A
[State -1, Uppercut]
type = ChangeState
value = 1100
triggerall = (command = "CDU_x" && !var(55)) || var(50) = 1100
trigger1 = var(9)

; QCB+A
[State -1, Uppercut]
type = ChangeState
value = 1110
triggerall = (command = "CDU_y" && !var(55)) || var(50) = 1110
trigger1 = var(9)

; QCB+A
[State -1, Uppercut]
type = ChangeState
value = 1120
triggerall = (command = "CDU_z" && !var(55)) || var(50) = 1120
trigger1 = var(9)

; QCF+X
[State -1, Palm]
type = ChangeState
value = 1150
triggerall = (command = "Zaieken_x" && !var(55)) || var(50) = 1150
trigger1 = var(9)

; QCF+Y
[State -1, Palm]
type = ChangeState
value = 1160
triggerall = (command = "Zaieken_y" && !var(55)) || var(50) = 1160
trigger1 = var(9)

; QCF+Z
[State -1, Palm]
type = ChangeState
value = 1170
triggerall = (command = "Zaieken_z" && !var(55)) || var(50) = 1170
trigger1 = var(9)



;===========================================================================

;===========================================================================

;
[State -1, Take the job off the opponent]
type = ChangeState
value = 3150
triggerall = command = "Poverty"
triggerall = stateno = 810
triggerall = power >= 1000
trigger1 = animelemtime(2) > 0
trigger1 = animelemtime(3) < 0

;
[State -1, Choke]
type = ChangeState
value = 814
triggerall = command = "holdup"
triggerall = command = "x" || command = "y" || command = "z"
triggerall = stateno = 810
trigger1 = animelemtime(2) > 0
trigger1 = animelemtime(3) < 0

;
[State -1, Headbutt]
type = ChangeState
value = 813
triggerall = command = "holddown"
triggerall = command = "x" || command = "y" || command = "z"
triggerall = stateno = 810
trigger1 = animelemtime(2) > 0
trigger1 = animelemtime(3) < 0

;
[State -1, Suplex]
type = ChangeState
value = 811
triggerall = command != "holddown"
triggerall = command != "holdup"
triggerall = command = "x" || command = "y" || command = "z"
triggerall = stateno = 810
trigger1 = animelemtime(2) > 0
trigger1 = animelemtime(3) < 0

;
[State -1, Knee]
type = ChangeState
value = 812
triggerall = command = "a" || command = "b" || command = "c"
triggerall = stateno = 810
trigger1 = animelemtime(2) > 0
trigger1 = animelemtime(3) < 0


;---------------------------------------------------------------------------
;Run Fwd
;ダッシュ
[State -1, Run Fwd]
type = ChangeState
value = 100
trigger1 = (command = "FF") || (var(50) = 100)
trigger1 = stateno != 100
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
;Run Back
;後退ダッシュ
;[State -1, Run Back]
;type = ChangeState
;value = 105
;trigger1 = command = "BB"
;trigger1 = statetype = S
;trigger1 = ctrl

[State -1, Throw]
type = ChangeState
value = 800
triggerall = command = "y" || command = "z"
triggerall = command = "holdfwd" || command = "holdback"
triggerall = statetype = S
triggerall = ctrl
triggerall = stateno != 100
;triggerall = var(8) = 0
trigger1 = p2bodydist X < 5
trigger1 = (p2statetype = S) || (p2statetype = C)
;trigger1 = p2movetype != H



;===========================================================================
;---------------------------------------------------------------------------
[State -1, Standing Light Punch]
type = ChangeState
value = 205
triggerall = ((command = "x") && (command != "holddown") && (command = "holdfwd")) || var(50) = 205
trigger1 = statetype != A
trigger1 = ctrl

[State -1, Standing Medium Punch]
type = ChangeState
value = 215
triggerall = ((command = "y") && (command != "holddown") && (command = "holdfwd")) || var(50) = 215
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 || stateno = 400 || stateno = 410
trigger2 = animtime >= -7 || movecontact

[State -1, Standing Hard Punch]
type = ChangeState
value = 225
triggerall = ((command = "z") && (command != "holddown") && (command = "holdfwd")) || var(50) = 225
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 || stateno = 205 || stateno = 210 || stateno = 215 || stateno = 400
trigger2 = animtime >= -7 || movecontact

[State -1, Forward Light Kick]
type = ChangeState
value = 235
triggerall = ((command = "a") && (command != "holddown") && (command = "holdfwd")) || var(50) = 235
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 430
trigger2 = animtime >= -7 || movecontact

[State -1, Forward Medium Kick]
type = ChangeState
value = 245
triggerall = ((command = "b") && (command != "holddown") && (command = "holdfwd")) || var(50) = 245
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 430
trigger2 = animtime >= -7 || movecontact

[State -1, Forward Hard Kick]
type = ChangeState
value = 255
triggerall = ((command = "c") && (command != "holddown") && (command = "holdfwd")) || var(50) = 255
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 || stateno = 215 || stateno = 205 || stateno = 210 || stateno = 400 || stateno = 410 || stateno = 430 || stateno = 235 || stateno = 230
trigger2 = animtime >= -7 || movecontact

;---------------------------------------------------------------------------
[State -1, Standing Light Punch]
type = ChangeState
value = 200
triggerall = ((command = "x") && (command != "holddown")) || var(50) = 200
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200
trigger2 = animtime >= -7 || movecontact

[State -1, Standing Medium Punch]
type = ChangeState
value = 210
triggerall = ((command = "y") && (command != "holddown")) || var(50) = 210
trigger1 = statetype != A
trigger1 = ctrl
;trigger2 = stateno = 200
;trigger2 = animtime >= -7 || movecontact

[State -1, Standing Hard Punch]
type = ChangeState
value = 220
triggerall = ((command = "z") && (command != "holddown")) || var(50) = 220
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 || stateno = 205 || stateno = 210 || stateno = 215 || stateno = 400
trigger2 = animtime >= -7 || movecontact

[State -1, Standing Light Kick]
type = ChangeState
value = 230
triggerall = ((command = "a") && (command != "holddown")) || var(50) = 230
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 430
trigger2 = animtime >= -7 || movecontact

[State -1, Standing Medium Kick]
type = ChangeState
value = 240
triggerall = ((command = "b") && (command != "holddown")) || var(50) = 240
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 430
trigger2 = animtime >= -7 || movecontact

[State -1, Standing Hard Kick]
type = ChangeState
value = 250
triggerall = ((command = "c") && (command != "holddown")) || var(50) = 250
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 || stateno = 215 || stateno = 205 || stateno = 210 || stateno = 400 || stateno = 410 || stateno = 430 || stateno = 235
trigger2 = animtime >= -7 || movecontact


;---------------------------------------------------------------------------
;...
[State -1, Taunt]
type = ChangeState
value = 195
triggerall = command = "start"
triggerall = stateno != 195
trigger1 = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
[State -1, Crouching Light Punch]
type = ChangeState
value = 400
triggerall = ((command = "x") && (command = "holddown")) || var(50) = 400
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 400 || stateno = 200
trigger2 = animtime >= -7 || movecontact

[State -1, Crouching Medium Punch]
type = ChangeState
value = 410
triggerall = ((command = "y") && (command = "holddown")) || var(50) = 410
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 400 || stateno = 200 || stateno = 205
trigger2 = animtime >= -7 || movecontact

[State -1, Crouching Hard Punch]
type = ChangeState
value = 420
triggerall = ((command = "z") && (command = "holddown")) || var(50) = 420
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 || stateno = 400 || stateno = 210 || stateno = 215 || stateno = 205
trigger2 = animtime >= -7 || movecontact

[State -1, Crouching Light Kick]
type = ChangeState
value = 430
triggerall = ((command = "a") && (command = "holddown")) || var(50) = 430
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 400 || stateno = 200 || stateno = 205
trigger2 = animtime >= -7 || movecontact

[State -1, Crouching Medium Kick]
type = ChangeState
value = 440
triggerall = ((command = "b") && (command = "holddown")) || var(50) = 440
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 400 || stateno = 200 || stateno = 205 || stateno = 230
trigger2 = animtime >= -7 || movecontact

[State -1, Crouching Hard Kick]
type = ChangeState
value = 450
triggerall = ((command = "c") && (command = "holddown")) || var(50) = 450
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 400 || stateno = 200 || stateno = 205 || stateno = 235 || stateno = 245
trigger2 = animtime >= -7 || movecontact

;---------------------------------------------------------------------------
[State -1, Jump DropKick]
type = ChangeState
value = 655
triggerall = ((command = "c") && (command = "holddown") && !var(55)) || var(50) = 655
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 || stateno = 610 || stateno = 620 || stateno = 630
trigger2 = movecontact || time >= 20

[State -1, Jump Elbow]
type = ChangeState
value = 625
triggerall = ((command = "z") && (command = "holddown") && !var(55)) || var(50) = 625
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 || stateno = 610 || stateno = 620 || stateno = 630
trigger2 = movecontact || time >= 20

[State -1, Jump Punch]
type = ChangeState
value = 600
triggerall = (command = "x" && !var(55)) || var(50) = 600
trigger1 = statetype = A
trigger1 = ctrl

[State -1, Jump Punch]
type = ChangeState
value = 610
triggerall = (command = "y" && !var(55)) || var(50) = 610
trigger1 = statetype = A
trigger1 = ctrl

[State -1, Jump Punch]
type = ChangeState
value = 620
triggerall = (command = "z" && !var(55)) || var(50) = 620
trigger1 = statetype = A
trigger1 = ctrl

[State -1, Jump Kick]
type = ChangeState
value = 630
triggerall = (command = "a" && !var(55)) || var(50) = 630
trigger1 = statetype = A
trigger1 = ctrl

[State -1, Jump Kick]
type = ChangeState
value = 640
triggerall = (command = "b" && !var(55)) || var(50) = 640
trigger1 = statetype = A
trigger1 = ctrl

[State -1, Jump Kick]
type = ChangeState
value = 650
triggerall = (command = "c" && !var(55)) || var(50) = 650
trigger1 = statetype = A
trigger1 = ctrl



