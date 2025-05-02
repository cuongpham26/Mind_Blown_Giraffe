extends Control

@onready var audio: AudioStreamPlayer = $AudioStreamPlayer
@onready var start_button: Button = $StartButton
@onready var options_button: Button = $OptionsButton
@onready var quit_button: Button = $QuitButton

var is_playing: bool = false 

func _ready() -> void:
	start_button.pressed.connect(_on_start_button_pressed)
	options_button.pressed.connect(_on_options_button_pressed)
	quit_button.pressed.connect(_on_quit_button_pressed)

func _on_start_button_pressed() -> void:
	if is_playing: return
	is_playing = true
	start_button.disabled = true
	audio.play()
	await audio.finished
	get_tree().change_scene_to_file("res://Scenes/select.tscn")


func _on_options_button_pressed() -> void:
	if is_playing: return
	is_playing = true
	options_button.disabled = true
	audio.play()
	await audio.finished
	get_tree().change_scene_to_file("res://Scenes/settings.tscn")
	
func _on_quit_button_pressed() -> void:
	get_tree().quit()
