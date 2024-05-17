extends StaticBody2D

@onready var player_movement = $PlayerMovement

# Called when the node enters the scene tree for the first time.
func _ready():
	player_movement.is_player = !global.p2_is_cpu
	player_movement.p_height = $ColorRect.get_size().y
	player_movement.move_up_button = "p2_up"
	player_movement.move_down_button = "p2_down"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
