extends Node2D

@onready var dialogue_label: Label = $DialogueUI/DialogueLabel

func _ready():
	DialogueManager.dialogue_started.connect(_on_dialogue_started)
	DialogueManager.dialogue_finished.connect(_on_dialogue_finished)

func _on_dialogue_started(text: String) -> void:
	dialogue_label.text = text
	dialogue_label.visible = true

func _on_dialogue_finished() -> void:
	dialogue_label.visible = false
