extends Node2D

var total = Global.total

# warning-ignore:unused_argument
func _process(delta):
	if Global.score == total:
		print("You Win")


func _on_Zone_body_entered(body):
	if body.name == "Player":
		body.game_over()
