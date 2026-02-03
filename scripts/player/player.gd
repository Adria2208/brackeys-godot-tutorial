class_name Player
extends CharacterBody2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var state_machine: Node = $StateMachine
@onready var jump_sound: AudioStreamPlayer2D = $JumpSound
@onready var double_jump_sound: AudioStreamPlayer2D = $DoubleJumpSound

var has_double_jumped = false

func _ready() -> void:
	# Initialize the state machine, passing a reference of the playerto the states,
	# that way they can move and react accordingly
	state_machine.init(self)

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)
	
func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)
	
func _process(delta: float) -> void:
	state_machine.process_frame(delta)
