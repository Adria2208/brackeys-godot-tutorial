class_name Player
extends CharacterBody2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var state_machine: Node = $StateMachine

var has_double_jumped = false
var hp: int = 1

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

func damage(damage_amount: int, enemy_name: String) -> void: 
	hp -= damage_amount
	print("Damaged by {0} for {1} hp.".format([enemy_name, str(damage_amount)]))
