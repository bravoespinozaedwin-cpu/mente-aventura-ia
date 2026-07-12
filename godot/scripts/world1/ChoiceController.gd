extends CanvasLayer

signal answer_selected(answer)

func _ready():
	visible = false

func show_choices():
	visible = true

func _on_button_ready_pressed():
	answer_selected.emit("ready")
	visible = false

func _on_button_fear_pressed():
	answer_selected.emit("fear")
	visible = false

func _on_button_question_pressed():
	answer_selected.emit("question")
	visible = false
