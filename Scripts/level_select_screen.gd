extends Control

@onready var mouse_clicked = $MouseButton/AudioStreamPlayer
@onready var keys = $KeysButton/AudioStreamPlayer
@onready var paper = $FreeCollageButton/AudioStreamPlayer
@onready var back_button = $BackButton
@onready var mouse_button = $MouseButton
@onready var free_collage_button = $FreeCollageButton
@onready var keys_button = $KeysButton

var is_playing_mouse = false
var is_playing_paper = false
var is_playing_keys = false

func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/title_screen.tscn")

func _on_mouse_button_pressed() -> void:
	if is_playing_mouse:
		return
	is_playing_mouse = true
	mouse_button.disabled = true
	mouse_clicked.play()
	await mouse_clicked.finished
	get_tree().change_scene_to_file("res://Scenes/email.tscn")
	is_playing_mouse = false
	mouse_button.disabled = false

func _on_free_collage_button_pressed() -> void:
	if is_playing_paper:
		return
	is_playing_paper = true
	free_collage_button.disabled = true
	paper.play()
	await paper.finished
	get_tree().change_scene_to_file("res://Scenes/collage_editor.tscn")
	is_playing_paper = false
	free_collage_button.disabled = false

func _on_keys_button_pressed() -> void:
	if is_playing_keys:
		return
	is_playing_keys = true
	keys_button.disabled = true
	keys.play()
	await keys.finished
	get_tree().change_scene_to_file("res://Scenes/store.tscn")
	is_playing_keys = false
	keys_button.disabled = false
