extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_options_pressed():
	pass # Replace with function body.


func _on_quit_pressed():
	get_tree().quit()


func _on_player_vs_cpu_pressed():
	global.p2_is_cpu = true
	get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_player_vs_player_pressed():
	global.p2_is_cpu = false
	get_tree().change_scene_to_file("res://scenes/game.tscn")
