extends Node2D

@onready var current_scene: Node2D = $CurrentScene

func _ready():
	load_initial_scene()

func load_initial_scene():
	var bedroom_scene = preload("res://scenes/intro/Bedroom.tscn")
	var bedroom = bedroom_scene.instantiate()
	current_scene.add_child(bedroom)
