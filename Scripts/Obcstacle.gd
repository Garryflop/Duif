extends Node2D
class_name Obstacle

const SPEED = 45

var started = false

func _ready():
	set_physics_process(false)


func _physics_process(delta):
	position.x += -SPEED * delta
#	if global_position.x <= -860:
#		global_position.x = 360

func start_game():
	started = true
	set_physics_process(true)


func _unhandled_input(event):
	if event.is_action_pressed("FLAP") and !started:
		start_game()


func _on_Finish_body_entered(body):
	if body.name == "Player":
		Global.finish = true
		body.game_over()
		set_physics_process(false)
		started = false


func _on_FinishedGame_body_entered(body):
	if body.name == "Player":
		if Global.score >= Global.total:
			get_tree().change_scene("res://Scenes/END.tscn")
		else:	
			Global.finish = true
			body.game_over()
			set_physics_process(false)
			started = false
		
		
