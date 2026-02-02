extends State

@export
var fall_state: State
@export
var idle_state: State
@export
var move_state: State
@export
var double_jump: State

@export
var jump_force: float = 320

func enter() -> void:
	super()
	parent.velocity.y += -jump_force
	parent.jump_sound.play()
	
func process_physics(delta: float) -> State:
	parent.velocity.y += gravity * delta
	
	if parent.velocity.y > 0:
		return fall_state
		
	var movement = Input.get_axis("move_left", "move_right") * move_speed
	
	if movement != 0:
		parent.animated_sprite.flip_h = movement < 0
	parent.velocity.x = movement
	parent.move_and_slide()
	
	if parent.is_on_floor():
		parent.has_double_jumped = false
		if movement != 0:
			return move_state
		return idle_state
	
	return null
	
func process_input(event: InputEvent) -> State:
	if Input.is_action_just_pressed("jump") and !parent.has_double_jumped:
		parent.has_double_jumped = true
		# parent.velocity.y = 0
		return double_jump
	return null
	
