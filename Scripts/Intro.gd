extends CanvasLayer

#cutscene 1
func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Intro":
		get_tree().change_scene("res://Scenes/MainMenu.tscn")
