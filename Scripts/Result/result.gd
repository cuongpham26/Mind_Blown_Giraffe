extends Control

var mission: Mission = Mission.new()

func _ready() -> void:
	get_node("Label").set_text("You have " + str(mission.evaluate_performance()) + " stars.")
	get_node("BackButton").pressed.connect(_on_back_button_pressed)


func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/collage.tscn")
