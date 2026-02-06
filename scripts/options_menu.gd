extends VBoxContainer

func _on_master_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(0, linear_to_db(value))

func _on_sfx_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(2, linear_to_db(value))
	
func _on_mute_toggled(toggled_on: bool) -> void:
	var mute_status := AudioServer.is_bus_mute(0)
	AudioServer.set_bus_mute(0, !mute_status)
