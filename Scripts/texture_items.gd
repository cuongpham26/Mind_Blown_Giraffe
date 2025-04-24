extends Sprite2D

@onready var background: ColorRect = $"../../../Canvas/Background"
var is_original = true
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed and get_rect().has_point(to_local(event.position)): 
			if is_original and get_parent() and get_parent().get_parent().name == "TexturePanel" and get_parent().is_visible():
				var new_sprite = duplicate()
				background.add_child(new_sprite)
				new_sprite.global_position = global_position + Vector2(600, 200)
				new_sprite.is_original = false
				new_sprite.scale *= 9.1
				new_sprite.position = Vector2(1500,970)
				
