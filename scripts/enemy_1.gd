extends Node2D

const SPEED = 40
var direction = 1
var can_check = true
var _is_colliding_right = false
var _is_colliding_left = false
var _is_colliding_down = false

@onready var ray_cast_right = $RayCastRight
@onready var ray_cast_left = $RayCastLeft
@onready var ray_cast_down = $RayCastDown
@onready var animated_sprite = $AnimatedSprite2D
@onready var timer = $Timer

func _ready():
	timer.timeout.connect(_on_timer_timeout)

func _apply_animations():
	if _is_colliding_right:
		direction = -1
		animated_sprite.flip_h = true
	if _is_colliding_left:
		direction = 1
		animated_sprite.flip_h = false
	if not _is_colliding_down and can_check:
		direction *= -1
		animated_sprite.flip_h = not animated_sprite.flip_h
		can_check = false
		timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):	
	if multiplayer.is_server():
		_is_colliding_right = ray_cast_right.is_colliding()
		_is_colliding_left = ray_cast_left.is_colliding()
		_is_colliding_down = ray_cast_down.is_colliding()
		position.x += direction * SPEED * delta
	
	if not multiplayer.is_server() or MultiplayerManager.host_mode_enabled:
		_apply_animations()

func _on_timer_timeout():
	can_check = true
