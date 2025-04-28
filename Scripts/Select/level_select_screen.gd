extends Control

@onready var mouse_audio: AudioStreamPlayer = $MouseButton/AudioStreamPlayer
@onready var keys_audio: AudioStreamPlayer = $KeysButton/AudioStreamPlayer
@onready var paper_audio: AudioStreamPlayer = $FreeCollageButton/AudioStreamPlayer
@onready var button_audio: AudioStreamPlayer = $BackButton/AudioStreamPlayer

@onready var mouse = $MouseButton
@onready var keys = $KeysButton
@onready var paper = $FreeCollageButton
@onready var backButton = $BackButton

var is_playing = false 

func _on_back_button_pressed() -> void:
	if is_playing: 
		return
	is_playing = true 
	backButton.disabled = true
	button_audio.play()
	await button_audio.finished
	get_tree().change_scene_to_file("res://Scenes/title.tscn")
	is_playing = false
	backButton.disabled = false 


func _on_mouse_button_pressed() -> void:
	if is_playing: 
		return 
	is_playing = true
	mouse.disabled = true 
	mouse_audio.play()
	await mouse_audio.finished
	get_tree().change_scene_to_file("res://Scenes/email.tscn")
	is_playing = false
	mouse.disabled = false 


func _on_free_collage_button_pressed() -> void:
	if is_playing:
		return
	is_playing = true
	paper.disabled = true
	paper_audio.play()
	await paper_audio.finished
	get_tree().change_scene_to_file("res://Scenes/collage.tscn")
	is_playing = false
	paper.disabled = false 


func _on_keys_button_pressed() -> void:
	if is_playing:
		return
	is_playing = true
	keys.disabled = true
	keys_audio.play()
	await keys_audio.finished
	get_tree().change_scene_to_file("res://Scenes/store.tscn") 
	is_playing = false
	keys.disabled = false
