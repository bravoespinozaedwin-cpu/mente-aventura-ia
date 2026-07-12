extends Area2D

var activated: bool = false

func _on_body_entered(body: Node2D) -> void:
	if activated:
		return

	if body.name != "Player":
		return

	activated = true
	body.can_move = false

	await show_line("Nova: ¡Lo lograste! Gracias por seguirme...")
	await show_line("Protagonista: ¿Quién eres? ¿Y por qué querías que viniera?")
	await show_line("Nova: Me llamo Nova.")
	await show_line("Nova: Este mundo está perdiendo su equilibrio.")
	await show_line("Nova: Los cuatro Cristales del Poder fueron fragmentados.")
	await show_line("Nova: Necesito tu ayuda para recuperarlos.")
	await show_line("Nova: El primer paso comienza en el Santuario de la Observación...")

	DialogueManager.hide_dialogue()

	await get_tree().create_timer(0.8).timeout

	SceneManager.change_scene(
		"res://scenes/world1_observation/ForestOfObservation.tscn"
	)

func show_line(text: String) -> void:
	DialogueManager.show_dialogue(text)
	await get_tree().create_timer(2.8).timeout
