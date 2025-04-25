extends Sprite2D

@onready var background: Sprite2D = get_node("../../../Background")

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed and get_rect().has_point(to_local(event.position)): 
		if get_parent() and get_parent().get_parent().name == "TexturePanel":
			background.set_texture(texture)
