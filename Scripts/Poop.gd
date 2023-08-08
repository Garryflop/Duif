extends Area2D

var speed = 300
var direction = Vector2.DOWN


func _physics_process(delta):
	translate(direction.normalized() * speed * delta)





func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Poop_area_entered(area):
	if area.is_in_group("Obstacle"):
		queue_free()
