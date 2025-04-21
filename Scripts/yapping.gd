extends Control

@onready var click = $AudioStreamPlayer
@onready var go_to_canvas_button = $GoToCanvasButton

var is_playing = false

func _on_go_to_canvas_pressed() -> void:
	if is_playing:
		return
	is_playing = true
	go_to_canvas_button.disabled = true
	click.play()
	await click.finished
	get_tree().change_scene_to_file("res://Scenes/collage_editor.tscn")
	is_playing = false
	go_to_canvas_button.disabled = false
