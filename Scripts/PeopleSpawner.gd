extends Node2D

onready var timer = $Timer

var people = preload("res://Scenes/People.tscn")

func _ready():
	randomize()


func _on_Timer_timeout():
	spawn_people()


func spawn_people():
	var person = people.instance()
	add_child(person)
	person.position.x = rand_range(10, 100)
