extends CanvasLayer



func _on_Start_button_up():
	get_tree().change_scene("res://Scenes/BEGIN.tscn")




func _on_Credits_button_up():
	get_tree().change_scene("res://Scenes/Credits.tscn")


func _on_Quit_button_up():
	get_tree().quit()







func _on_Music_button_up():
	if Global.get_node("/root/Global/music").playing:
		Global.get_node("/root/Global/music").stop()
	else:
		Global.get_node("/root/Global/music").play()
