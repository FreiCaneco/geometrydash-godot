extends Control
 
func _on_start_pressed() -> void:
	Global.button_pressed.emit("PlayButton")
