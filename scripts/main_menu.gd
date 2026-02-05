extends Node2D

@onready var animation_player: AnimationPlayer = $UI/AnimationPlayer

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func _on_options_pressed() -> void:
	animation_player.play("move_left")

func _on_exit_pressed() -> void:
	get_tree().quit()

func _on_back_options_button_pressed() -> void:
	animation_player.play_backwards("move_left")
