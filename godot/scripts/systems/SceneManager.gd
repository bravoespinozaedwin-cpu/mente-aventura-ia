extends Node

var current_scene_container: Node = null

func setup(container: Node) -> void:
	current_scene_container = container

func change_scene(scene_path: String) -> void:
	if current_scene_container == null:
		push_error("SceneManager: CurrentScene no fue configurado.")
		return

	if not ResourceLoader.exists(scene_path):
		push_error("SceneManager: No existe la escena: " + scene_path)
		return

	var packed_scene := load(scene_path) as PackedScene

	if packed_scene == null:
		push_error("SceneManager: No se pudo cargar la escena.")
		return

	for child in current_scene_container.get_children():
		current_scene_container.remove_child(child)
		child.queue_free()

	var new_scene := packed_scene.instantiate()
	current_scene_container.add_child(new_scene)

	print("Escena cargada: ", scene_path)
