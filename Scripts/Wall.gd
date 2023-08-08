extends Area2D


func _on_Wall_body_entered(body):
	if body.name == "Player":
		body.game_over()
		get_parent().set_physics_process(false)
