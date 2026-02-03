extends State

func enter() -> void:
	super()
	AudioManager.create_2d_audio_at_location(parent.position, SoundEffect.SOUND_EFFECT_TYPE.PLAYER_HURT)

func process_physics(delta: float) -> State:
	parent.velocity.y += gravity * delta
	
	parent.velocity.x = lerp(parent.velocity.x, 0.0, 5 * delta)
	parent.move_and_slide()
	
	return null
