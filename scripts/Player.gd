extends StaticBody2D

@onready var color_rect = $ColorRect

var win_height: int
var p_height: int

# Called when the node enters the scene tree for the first time.
func _ready():
	win_height = get_viewport_rect().size.y
	p_height = color_rect.get_size().y

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("p1_up"):
		position.y -= get_parent().PADDLE_SPEED * delta
	elif Input.is_action_pressed("p1_down"):
		position.y += get_parent().PADDLE_SPEED * delta

	position.y = clamp(position.y, p_height/2.0, win_height - p_height/2.0)
