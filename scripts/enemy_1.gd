extends Node2D

const SPEED = 40
var direction = 1
var can_check = true

@onready var ray_cast_right = $RayCastRight
@onready var ray_cast_left = $RayCastLeft
@onready var ray_cast_down = $RayCastDown
@onready var animated_sprite = $AnimatedSprite2D
@onready var timer = $Timer

func _ready():
	timer.timeout.connect(_on_timer_timeout)

func _apply_animations():
	if ray_cast_right.is_colliding():
		direction = -1
		animated_sprite.flip_h = true
	if ray_cast_left.is_colliding():
		direction = 1
		animated_sprite.flip_h = false
	if not ray_cast_down.is_colliding() and can_check:
		direction *= -1
		animated_sprite.flip_h = not animated_sprite.flip_h
		can_check = false
		timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):	
	#if multiplayer.is_server():
	position.x += direction * SPEED * delta
	_apply_animations()
	
	#if not multiplayer.is_server() or MultiplayerManager.host_mode_enabled:

func _on_timer_timeout():
	can_check = true
