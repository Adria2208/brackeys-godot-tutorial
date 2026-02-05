extends Node2D

@onready var camera_2d: Camera2D = $Camera2D
@onready var options_menu: VBoxContainer = $OptionsMenu
@onready var v_box_container: VBoxContainer = $VBoxContainer

var camera_original_position: Vector2 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	camera_original_position = camera_2d.position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func _on_options_pressed() -> void:
	camera_2d.position.x = options_menu.position.x + (options_menu.size.x / 2)

func _on_exit_pressed() -> void:
	get_tree().quit()

func _on_back_options_button_pressed() -> void:
	camera_2d.position = camera_original_position
