extends Control

@onready var mouse_clicked = $MouseButton/AudioStreamPlayer
@onready var keys = $KeysButton/AudioStreamPlayer
@onready var paper = $FreeCollageButton/AudioStreamPlayer
@onready var button = $BackButton/AudioStreamPlayer

@onready var back_button  = $BackButton
@onready var mouse_button = $MouseButton
@onready var keys_button = $KeysButton
@onready var free_collage_button = $FreeCollageButton

var is_playing = false

func _on_back_button_pressed() -> void:
	if is_playing:
		return
	is_playing = true
	back_button.disabled = true
	button.play()
	await button.finished
	get_tree().change_scene_to_file("res://Scenes/title_screen.tscn")
	is_playing = false
	back_button.disabled = false 


func _on_mouse_button_pressed() -> void:
	if is_playing:
		return 
	is_playing = true
	mouse_button.disabled = true 
	mouse_clicked.play()
	await mouse_clicked.finished
	get_tree().change_scene_to_file("res://Scenes/email.tscn")
	is_playing = false
	mouse_button.disabled = false 


func _on_free_collage_button_pressed() -> void:
	if is_playing:
		return 
	is_playing = true 
	free_collage_button.disabled = true 
	paper.play()
	await paper.finished
	get_tree().change_scene_to_file("res://Scenes/collage_editor.tscn")
	is_playing = false 
	free_collage_button.disabled = false 


func _on_keys_button_pressed() -> void:
	if is_playing:
		return 
	is_playing = true
	keys_button.disabled = true 
	keys.play()
	await keys.finished
	get_tree().change_scene_to_file("res://Scenes/store.tscn") 
	is_playing = false 
	keys_button.disabled = false 

	  
	
