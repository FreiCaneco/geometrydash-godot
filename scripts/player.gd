extends CharacterBody2D

const SPEED = 150 
const JUMP_VELOCITY = -275;
var isAlive := true

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity");

func _init() -> void:
	pass
	
func _physics_process(delta: float) -> void:
	
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
			
	velocity.x = SPEED * 1
	
	move_and_slide();
