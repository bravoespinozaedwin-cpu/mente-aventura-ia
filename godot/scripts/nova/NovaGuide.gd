extends Node

@export var speed: float = 80.0

var nova: CharacterBody2D
var waypoints: Array[Marker2D] = []
var current: int = 0

func _ready() -> void:
	nova = get_parent().find_child("Nova", true, false) as CharacterBody2D
	var path := get_parent().find_child("NovaPath", true, false)

	if nova == null:
		push_error("NovaGuide: no se encontró el nodo Nova")
		return

	if path == null:
		push_error("NovaGuide: no se encontró NovaPath")
		return

	for child in path.get_children():
		if child is Marker2D:
			waypoints.append(child)

	print("Nova encontrada: ", nova.name)
	print("Waypoints encontrados: ", waypoints.size())

func _process(delta: float) -> void:
	if nova == null or current >= waypoints.size():
		return

	var target := waypoints[current].global_position
	nova.global_position = nova.global_position.move_toward(
		target,
		speed * delta
	)

	if nova.global_position.distance_to(target) < 5.0:
		current += 1
