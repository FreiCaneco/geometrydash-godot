extends CharacterBody2D

@onready var anim: AnimationPlayer = $AnimationPlayer
@onready var jump_sfx_player: AudioStreamPlayer  = $sfx_jump
@export var jump_sfxs: Array[AudioStreamWAV] = []
@onready var coyote_timer: Timer = $coyote_timer

@export var speed: int = 60
@export var JUMP_VELOCITY = -350;
@export var jump_cutoff_multiplier: float = 0.4
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity");

var can_jump: bool

func _physics_process(delta: float) -> void:	
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		if coyote_timer.is_stopped():
			coyote_timer.start()

	can_jump = is_on_floor() or coyote_timer.time_left > 0
	
	if velocity.y < 0 and Input.is_action_just_released("jump"):
		velocity.y *= jump_cutoff_multiplier

	if Input.is_action_just_pressed("jump") and can_jump:
		coyote_timer.stop()
		jump_sfx_player.stream = jump_sfxs[randi_range(0,jump_sfxs.size() - 1)]
		jump_sfx_player.play()
		velocity.y = JUMP_VELOCITY
		Global.score += 1
		anim.play("Jump")

	velocity.x = speed * 1
	move_and_slide()
