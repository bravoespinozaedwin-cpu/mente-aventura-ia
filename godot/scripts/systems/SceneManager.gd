extends Node

var current_scene_container: Node = null

func setup(container: Node) -> void:
	current_scene_container = container

func change_scene(scene_path: String) -> void:
	if current_scene_container == null:
		return

	for child in current_scene_container.get_children():
		child.queue_free()

	var new_scene = load(scene_path).instantiate()
	current_scene_container.add_child(new_scene)
