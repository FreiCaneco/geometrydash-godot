extends Node

var score: int = 0

# Difficulty Attributtes/Methods
signal difficulty_changed()
var rng = RandomNumberGenerator.new()

func change_difficulty() -> void:
	difficulty_changed.emit()

# Buttons Attributtes/Methods
signal button_pressed(id: String)
