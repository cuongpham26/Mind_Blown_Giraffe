extends Sprite2D

@onready var background: Sprite2D = get_node("../../Background")

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed and get_rect().has_point(to_local(event.position)): 
		if get_parent().name == "TexturePanel":
			var min_width: float = 1280
			var min_height: float = 720
			var tex_width: float = texture.get_width()
			var tex_height: float = texture.get_height()

			# Same scaling rule: fit inside 160x160, at least one side = 160
			var scale_x: float = min_width / tex_width
			var scale_y: float = min_height / tex_height
			var final_scale = max(scale_x, scale_y)

			background.scale = Vector2(final_scale, final_scale)
			background.set_texture(texture)
