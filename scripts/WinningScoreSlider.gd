extends HSlider


# Called when the node enters the scene tree for the first time.
func _ready():
	value = global.winning_score


func _on_value_changed(value):
	global.winning_score = value
	$"../WinningScoreLabel".text = "Winning Score: %s" % value
