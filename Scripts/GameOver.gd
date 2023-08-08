extends CanvasLayer



func _ready():
	get_tree().paused = true
	if Global.finish:
		$game_over1.play()
		Global.finish = false
	else:
		$game_over2.play()




func _on_Button_button_up():
	get_tree().paused = false
	Global.score = 0
	get_tree().reload_current_scene()
