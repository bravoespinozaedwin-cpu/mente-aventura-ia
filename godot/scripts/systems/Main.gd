extends Node2D

@onready var current_scene: Node2D = $CurrentScene

func _ready() -> void:
	SceneManager.setup(current_scene)
	SceneManager.change_scene("res://scenes/intro/Bedroom.tscn")
