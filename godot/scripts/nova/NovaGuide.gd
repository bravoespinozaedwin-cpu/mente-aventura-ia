extends Node

@export var speed: float = 80.0
@export var trigger_distance: float = 80.0
@export var arrival_distance: float = 5.0

@onready var nova: CharacterBody2D = $"../Nova"
@onready var player: CharacterBody2D = $"../Player"
@onready var path: Node2D = $"../NovaPath"

var waypoints: Array[Marker2D] = []
var current_waypoint: int = 0
var is_moving: bool = false

func _ready() -> void:
	for child in path.get_children():
		if child is Marker2D:
			waypoints.append(child)

func _process(delta: float) -> void:
	if current_waypoint >= waypoints.size():
		return

	# Nova solo empieza a avanzar cuando el jugador se acerca mucho.
	if not is_moving:
		var player_distance := player.global_position.distance_to(nova.global_position)

		if player_distance <= trigger_distance:
			is_moving = true
		else:
			return

	var target := waypoints[current_waypoint].global_position

	nova.global_position = nova.global_position.move_toward(
		target,
		speed * delta
	)

	# Al llegar al waypoint, Nova vuelve a esperar.
	if nova.global_position.distance_to(target) <= arrival_distance:
		nova.global_position = target
		current_waypoint += 1
		is_moving = false
