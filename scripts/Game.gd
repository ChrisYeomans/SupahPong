extends Sprite2D

@onready var ball = $Ball
@onready var player_score = $HUD/PlayerScore
@onready var cpu_score = $HUD/CPUScore
@onready var ball_timer = $BallTimer

var score := [0, 0] # Player, CPU
const PADDLE_SPEED: int = 500

func _on_ball_timer_timeout():
	ball.new_ball()

func _on_score_left_body_entered(_body):
	score[1] += 1
	cpu_score.text = str(score[1])
	ball_timer.start()
	
func _on_score_right_body_entered(_body):
	score[0] += 1
	player_score.text = str(score[0])
	ball_timer.start()

