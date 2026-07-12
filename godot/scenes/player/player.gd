extends CharacterBody2D

@export var speed: float = 160.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

var current_interactable: Area2D = null
var can_move: bool = true

func _ready() -> void:
	animated_sprite.play("idle")

func _physics_process(_delta: float) -> void:
	if !can_move:
		velocity = Vector2.ZERO
		animated_sprite.play("idle")
		move_and_slide()
		return

	var direction := Vector2.ZERO

	direction.x = (
		Input.get_action_strength("move_right")
		- Input.get_action_strength("move_left")
	)

	direction.y = (
		Input.get_action_strength("move_down")
		- Input.get_action_strength("move_up")
	)

	if direction != Vector2.ZERO:
		direction = direction.normalized()
		velocity = direction * speed
		animated_sprite.play("walk")

		if direction.x != 0:
			animated_sprite.flip_h = direction.x < 0
	else:
		velocity = Vector2.ZERO
		animated_sprite.play("idle")

	move_and_slide()

	if Input.is_action_just_pressed("interact"):
		if DialogueManager.is_dialogue_active:
			DialogueManager.hide_dialogue()
		elif (
			current_interactable
			and current_interactable.has_method("interact")
		):
			current_interactable.interact()

func _on_interaction_area_area_entered(area: Area2D) -> void:
	current_interactable = area

func _on_interaction_area_area_exited(area: Area2D) -> void:
	if current_interactable == area:
		current_interactable = null
