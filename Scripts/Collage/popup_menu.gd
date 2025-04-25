extends PopupMenu

func _ready():
	visible = false

func _on_settings_button_pressed() -> void:
	visible = true
	await get_tree().create_timer(3).timeout
	visible = false
