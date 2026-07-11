extends CharacterBody2D

@export var follow_speed: float = 90.0
@export var float_amplitude: float = 8.0
@export var float_speed: float = 2.0
@export var follow_offset: Vector2 = Vector2(50, -35)
@export var follow_player: bool = false

@onready var sprite: Sprite2D = $Sprite2D

var player: Node2D = null
var time: float = 0.0
var sprite_start_y: float = 0.0

func _ready() -> void:
	sprite_start_y = sprite.position.y
	player = get_tree().current_scene.find_child("Player", true, false)

func _physics_process(delta: float) -> void:
	time += delta

	# La flotación afecta solo a la imagen, no a la posición de Nova.
	sprite.position.y = sprite_start_y + sin(time * float_speed) * float_amplitude

	if follow_player and player:
		var target_position := player.global_position + follow_offset
		global_position = global_position.lerp(
			target_position,
			follow_speed * delta / 100.0
		)
