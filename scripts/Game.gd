extends Sprite2D

@onready var ball = $Ball
@onready var player_score = $HUD/PlayerScore
@onready var cpu_score = $HUD/CPUScore
@onready var ball_timer = $BallTimer
@onready var winner_label = $HUD/WinnerLabel

var score := [0, 0] # Player, CPU
const PADDLE_SPEED := 500

func _on_ball_timer_timeout():
	ball.new_ball()

func _on_score_left_body_entered(_body):
	score[1] += 1
	cpu_score.text = str(score[1])
	if !check_game_over(score[1], "Player 2"):
		ball_timer.start()
	
func _on_score_right_body_entered(_body):
	score[0] += 1
	player_score.text = str(score[0])
	if !check_game_over(score[0], "Player 1"):
		ball_timer.start()

func check_game_over(scr, player):
	if scr == global.winning_score:
		end_game(player)
		return true
	return false
		
func end_game(player):
	winner_label.text = "%s Wins" % player
	winner_label.visible = true
	await get_tree().create_timer(3.0).timeout
	winner_label.visible = false
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
