extends CharacterBody2D

@export var follow_speed: float = 90.0
@export var float_amplitude: float = 8.0
@export var float_speed: float = 2.0
@export var follow_offset: Vector2 = Vector2(50, -35)

var player: Node2D = null
var time: float = 0.0

func _ready():
	player = get_tree().current_scene.get_node_or_null("Player")

func _physics_process(delta):
	if player == null:
		return

	time += delta

	var target_position := player.global_position + follow_offset
	target_position.y += sin(time * float_speed) * float_amplitude

	global_position = global_position.lerp(target_position, follow_speed * delta / 100.0)
