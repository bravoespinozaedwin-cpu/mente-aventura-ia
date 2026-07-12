extends Node2D

@onready var current_scene: Node = $CurrentScene

func _ready() -> void:
	SceneManager.setup(current_scene)

	if current_scene.get_child_count() == 0:
		SceneManager.change_scene(
			"res://scenes/intro/Bedroom.tscn"
		)
