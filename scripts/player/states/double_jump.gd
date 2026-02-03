extends State

@export
var fall_state: State
@export
var idle_state: State
@export
var move_state: State
@export
var death_state: State

@export
var jump_force: float = 320

func enter() -> void:
	super()
	parent.velocity.y = 0
	parent.velocity.y += -jump_force
	AudioManager.create_2d_audio_at_location(parent.position, SoundEffect.SOUND_EFFECT_TYPE.PLAYER_JUMP_DOUBLE)
	
func process_physics(delta: float) -> State:
	parent.velocity.y += gravity * delta
	
	if parent.velocity.y > 0:
		return fall_state
		
	if !parent.is_alive:
		return death_state
		
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
