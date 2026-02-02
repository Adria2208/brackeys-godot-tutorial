extends State

@export
var idle_state: State
@export
var move_state: State

func process_physics(delta: float) -> State:
	parent.velocity.y += gravity * delta
	
	var movement = Input.get_axis("move_left", "move_right")
	
	if movement != 0:
		parent.animated_sprite.flip_h = movement < 0
	parent.velocity.x = movement
	
	if parent.is_on_floor():
		if movement != 0:
			return move_state
		return idle_state
	return null
