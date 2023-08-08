extends Area2D

enum State{normal, phone, poop}

export(Array, Texture) var TextureVariations: Array = [
	preload("res://Assets/Sprites/People3.png"),
	preload("res://Assets/Sprites/People2.png"),
	preload("res://Assets/Sprites/People.png")
] 
#	preload("res://Assets/Sprites/People3.png"), 	preload("res://Assets/Sprites/People.png"),
onready var anim = $AnimationPlayer

var state = State.normal
var speed = 50
var direction = Vector2.LEFT


func _ready():
	randomize()
	variate_textures()
	if int(rand_range(0, 100)) % 2 == 0:
		state = State.normal
	else:
		state = State.phone

func _physics_process(delta):
	translate(direction.normalized() * speed * delta)
	match state:
		State.normal:
			anim.play("walk")
		State.phone:
			anim.play("walk_with_phone")
		State.poop:
			anim.play("poop")

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_People_area_entered(area):
	if area.name == "Poop" and state == State.phone:
		Global.score += 1
		state = State.poop
		$discontent.play()
		print("BYP")
	elif area.name == "Poop" and state == State.normal:
		if Global.score > 0:	
			Global.score -= 1
		state = State.poop
		$discontent.play()
		print(":(((")


func variate_textures():
	if TextureVariations.size() > 1:
		var texture_id: int = randi() % TextureVariations.size()
		var chosen_texture: Texture = TextureVariations[texture_id]
		$Sprite.texture = chosen_texture
