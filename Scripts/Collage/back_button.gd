extends Control

@onready var back_button_sound = $TexturePanel/BackButton/AudioStreamPlayer
@onready var sidebar: Panel = $ItemPanel
@onready var back_button: Button = $TexturePanel/BackButton

func _on_back_button_pressed() -> void:
	back_button_sound.play()
	await back_button_sound.finished
	get_tree().change_scene_to_file("res://Scenes/title.tscn")
