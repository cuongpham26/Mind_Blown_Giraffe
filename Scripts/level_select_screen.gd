extends Control


func _on_order_1_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/collage_editor.tscn")


func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/title_screen.tscn")
