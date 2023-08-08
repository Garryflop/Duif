extends Label


# warning-ignore:unused_argument
func _process(delta):
	text = "Миссия: убрать телефоны " + str(Global.score) + "/" + str(Global.total) 
