extends Node

var game = preload("uid://dudwhigbnir6n")
@onready var margin_container: MarginContainer = $CanvasLayer/MarginContainer
@onready var pixel_viewport: SubViewport = $CanvasLayer/Game/PixelViewport
@onready var main_menu_ui: Control = $CanvasLayer/Game/PixelViewport/MainMenuUi

func _ready() -> void:
	Global.button_pressed.connect(_on_global_button_pressed)
	margin_container.visible = false

func _on_global_button_pressed(id: String):
	match id:
		"PlayButton":
			change_main_scene(game)
			main_menu_ui.visible = false
			margin_container.visible = true

func change_main_scene(scene_resource: PackedScene):
	for child in pixel_viewport.get_children():
		if child is CanvasLayer or child is Control:
			continue
		
		child.queue_free()
		
	var new_scene = scene_resource.instantiate()
	
	pixel_viewport.add_child(new_scene)
