extends CanvasLayer


func _ready():
	get_tree().paused = true
	Global.finish = false


func _on_Button_button_up():
	if Global.level < 3:
		Global.level += 1
		get_tree().paused = false
		get_tree().change_scene("res://Scenes/Sample" + str(Global.level) +".tscn")
