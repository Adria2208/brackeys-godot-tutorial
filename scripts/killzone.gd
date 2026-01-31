extends Area2D

@onready var timer: Timer = $Timer # Variable that automatically finds the node using $Path

func _on_body_entered(body: Node2D) -> void:
	print("You died!")
	timer.start()

func _on_timer_timeout() -> void: # Execute when timer ends.
	get_tree().reload_current_scene()
