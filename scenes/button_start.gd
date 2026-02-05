extends Button

func _ready():
	$".".grab_focus.call_deferred()
