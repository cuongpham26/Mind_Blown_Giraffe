extends Control

@onready var volume_slider = $VolumeSlider


func _ready() -> void:
	volume_slider = 1.0
	

func _on_volume_slider_value_changed(value: float) -> void:
	MusicPlayer.set_volume(value)
	

func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/title_screen.tscn")
