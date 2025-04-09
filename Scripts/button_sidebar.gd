@icon("../Icons/control.png")
extends Control

@onready var sidebar: Panel = $Sidebar
@onready var button: Button = $Button
@onready var button_sound = $BackButton/AudioStreamPlayer

var sidebar_visible = false

func _ready():
	sidebar.hide()  # Initially hide the sidebar
	button.connect("pressed", Callable(self, "_toggle_sidebar"))

func _toggle_sidebar():
	sidebar_visible = !sidebar_visible
	if sidebar_visible:
		sidebar.show()
	else:
		sidebar.hide()


func _on_back_button_pressed() -> void:
	button_sound.play()
	await button_sound.finished
	get_tree().change_scene_to_file("res://Scenes/title_screen.tscn")
