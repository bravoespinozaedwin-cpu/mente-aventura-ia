extends Node2D

@onready var dialogue_label: Label = $DialogueUI/DialogueLabel

func show_dialogue(text: String) -> void:
	dialogue_label.text = text
	dialogue_label.visible = true
