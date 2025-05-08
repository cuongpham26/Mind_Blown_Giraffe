extends Control

@onready var back_button: Button = $BackButton
@onready var control_button: Button = $ControlButton
@onready var submit_button: Button = $SubmitButton

var is_playing: bool = false # To fix double cick

func _ready() -> void:
	back_button.pressed.connect(_on_back_button_pressed)
	submit_button.pressed.connect(_on_submit_button_pressed)
	control_button.pressed.connect(_on_control_button_pressed)

func _on_back_button_pressed() -> void:
	if is_playing: return
	is_playing = true
	back_button.disabled = true
	back_button.get_node("AudioStreamPlayer").play()
	await back_button.get_node("AudioStreamPlayer").finished
	get_tree().change_scene_to_file("res://Scenes/title.tscn")
	
	
func _on_control_button_pressed() -> void:
	control_button.get_node("PopupMenu").set_visible(!control_button.get_node("PopupMenu").is_visible())

	
func _on_submit_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/result.tscn")
