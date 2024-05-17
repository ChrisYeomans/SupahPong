extends Node2D

class_name PlayerMovement

@onready var ball = %Ball

var win_height: float
var p_height: float
var move_up_button: String
var move_down_button: String
var is_player: bool
var ball_pos: Vector2
var dist: int
var move_by: int
var PADDLE_SPEED: int

# Called when the node enters the scene tree for the first time.
func _ready():
	win_height = get_viewport_rect().size.y
	PADDLE_SPEED = get_parent().get_parent().PADDLE_SPEED

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_player:
		player_movement(delta)
	else:
		cpu_movement(delta)

func player_movement(delta):
	if Input.is_action_pressed(move_up_button):
		get_parent().position.y -= PADDLE_SPEED * delta
	elif Input.is_action_pressed(move_down_button):
		get_parent().position.y += PADDLE_SPEED * delta

	get_parent().position.y = clamp(get_parent().position.y, p_height/2.0, win_height - p_height/2.0)

func cpu_movement(delta):
	ball_pos = ball.position
	dist = get_parent().position.y - ball_pos.y
	if abs(dist) > PADDLE_SPEED * delta:
		move_by = PADDLE_SPEED * delta * (dist/abs(dist))
	else:
		move_by = dist
	get_parent().position.y -= move_by
	get_parent().position.y = clamp(get_parent().position.y, p_height/2.0, win_height - p_height/2.0)
