extends Node

@onready var player: CharacterBody2D = $"../Player"

func _ready() -> void:
	player.can_move = false
	start_intro()

func start_intro() -> void:
	await get_tree().create_timer(1.0).timeout

	await show_line("Protagonista: ¿Dónde estamos?")
	await show_line("Nova: Este es el Santuario de la Observación.")
	await show_line("Nova: Aquí comienza nuestra verdadera aventura.")
	await show_line("Nova: Quédate cerca de mí. Tenemos mucho que descubrir.")

	DialogueManager.hide_dialogue()
	player.can_move = true

func show_line(text: String) -> void:
	DialogueManager.show_dialogue(text)
	await get_tree().create_timer(2.8).timeout
