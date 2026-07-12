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
	await show_line("Nova: Me llamo Nova. Algo terrible ocurrió en este lugar.")
	await show_line("Nova: Cuatro cristales que protegían este mundo fueron fragmentados.")
	await show_line("Nova: El primero está oculto en el Bosque de la Observación.")
	await show_line("Nova: Necesito tu ayuda para encontrarlo.")

	DialogueManager.hide_dialogue()

	# Por ahora devolvemos el movimiento.
	# Luego aquí cambiaremos al siguiente escenario.
	body.can_move = true


func show_line(text: String) -> void:
	DialogueManager.show_dialogue(text)
	await get_tree().create_timer(2.8).timeout
