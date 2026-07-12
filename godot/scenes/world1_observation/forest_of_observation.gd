extends Node2D

@onready var dialogue_panel: PanelContainer = $DialogueUI/PanelContainer
@onready var dialogue_label: Label = $DialogueUI/PanelContainer/DialogueLabel

func _ready() -> void:
	dialogue_panel.visible = false

	if not DialogueManager.dialogue_started.is_connected(_on_dialogue_started):
		DialogueManager.dialogue_started.connect(_on_dialogue_started)

	if not DialogueManager.dialogue_finished.is_connected(_on_dialogue_finished):
		DialogueManager.dialogue_finished.connect(_on_dialogue_finished)

func _on_dialogue_started(text: String) -> void:
	dialogue_label.text = text
	dialogue_panel.visible = true

func _on_dialogue_finished() -> void:
	dialogue_panel.visible = false
