extends Node2D

func _on_difficulty_timer_timeout() -> void:
	Global.change_difficulty()
