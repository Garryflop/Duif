extends CanvasLayer


onready var anim = $AnimationPlayer
var list = 1




func _on_Button_button_up():
	if list < 4:
		list += 1
		anim.play(str(list))
	else:
		get_tree().change_scene("res://Scenes/Sample1.tscn")
