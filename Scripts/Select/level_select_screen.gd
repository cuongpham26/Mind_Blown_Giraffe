extends Control

@onready var mouse_audio: AudioStreamPlayer = $MouseButton/AudioStreamPlayer
@onready var keys_audio: AudioStreamPlayer = $KeysButton/AudioStreamPlayer
@onready var paper_audio: AudioStreamPlayer = $FreeCollageButton/AudioStreamPlayer
@onready var button_audio: AudioStreamPlayer = $BackButton/AudioStreamPlayer

func _on_back_button_pressed() -> void:
	button_audio.play()
	await button_audio.finished
	get_tree().change_scene_to_file("res://Scenes/title.tscn")


func _on_mouse_button_pressed() -> void:
	mouse_audio.play()
	await mouse_audio.finished
	get_tree().change_scene_to_file("res://Scenes/email.tscn")


func _on_free_collage_button_pressed() -> void:
	paper_audio.play()
	await paper_audio.finished
	get_tree().change_scene_to_file("res://Scenes/collage.tscn")


func _on_keys_button_pressed() -> void:
	keys_audio.play()
	await keys_audio.finished
	get_tree().change_scene_to_file("res://Scenes/store.tscn") 
