extends KinematicBody2D

const FLAP = 100
const MAXFALLSPEED = 50
const GRAVITY = 5

onready var anim = $AnimationPlayer

var poop = preload("res://Scenes/Poop.tscn")
var finishLevel = preload("res://Scenes/LevelFinish.tscn")
var gameOver = preload("res://Scenes/GameOver.tscn")

var vel = Vector2()
var started = false
var die = false

func _ready():
	set_physics_process(false)


func _physics_process(delta):
	vel.y += GRAVITY
	if vel.y > MAXFALLSPEED:
		vel.y = MAXFALLSPEED
	
	if Input.is_action_just_pressed("FLAP"):
		vel.y = -FLAP
		$wing.play()
	if Input.is_action_just_pressed("PEW"):
		var bullet = poop.instance()
		bullet.global_position = self.global_position
		$poop.play()
		get_tree().get_root().get_node("Sample").add_child(bullet)
	
	vel = move_and_slide(vel, Vector2.UP)


func start_game():
	started = true
	set_physics_process(true)
	anim.play("Flap")


func game_over():
	var level
	if Global.score >= 5 and Global.finish:
		level = finishLevel.instance()
	else:
		level = gameOver.instance()
	die = true
	started = false
	set_physics_process(false)
	anim.play("Stop")
	$die.play()
	yield(anim,"animation_finished")
	
	Global.score = 0
	get_parent().add_child(level)
# warning-ignore:return_value_discarded

func _unhandled_input(event):
	if event.is_action_pressed("FLAP") && !started && !die:
		start_game()
		

