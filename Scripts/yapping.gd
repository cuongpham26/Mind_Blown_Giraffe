extends Control

@onready var click = $AudioStreamPlayer



func _on_go_to_canvas_pressed() -> void:
	click.play()
	await click.finished
	get_tree().change_scene_to_file("res://Scenes/collage_editor.tscn")
