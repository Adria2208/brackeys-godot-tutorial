extends Area2D

@export 
var debug_id: String
@export
var damage: int = 1

@onready var timer: Timer = $Timer # Variable that automatically finds the node using $Path

func _ready() -> void:
	if debug_id.is_empty() or debug_id == null:
		push_error("Failed to get debug_id from " + str(self) + " at " + str(self.position))

func _on_body_entered(body: Player) -> void:
	#print("You died!")
	Engine.time_scale = 0.5 # Slow down game speed.
	body.damage(damage, debug_id)
	# GlobalSignals.emit_signal("player_death")
	# body.get_node("CollisionShape2D").queue_free() # Remove that node.
	timer.start()

func _on_timer_timeout() -> void: # Execute when timer ends.
	Engine.time_scale = 1
	get_tree().reload_current_scene()
