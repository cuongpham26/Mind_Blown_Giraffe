extends Control

@onready var label: Label = $Label
var mission = Mission.new()

func _ready():
	label.set_text("You have " + str(mission.evaluate_performance()) + " stars.")


func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/collage.tscn")
