@icon("../Icons/image.png")
class_name image extends Sprite2D

# Drag and drop variables
var draggable: bool = false
var sizeable_up: bool = false
var sizeable_down: bool = false
var mouse_offset: Vector2
var delay: float = .2
var is_original: bool = true  # Only original Sidebar images can duplicate

func _input(event: InputEvent) -> void:
	# Allow duplication only if the sprite is inside the Sidebar and is an original
	if event is InputEventMouseButton and event.pressed and get_rect().has_point(to_local(event.position)): 
		if is_original and get_parent() and get_parent().name == "Sidebar":
			var new_sprite: image = duplicate()
			get_parent().add_child(new_sprite)
			new_sprite.global_position = global_position + Vector2(600, 200)
			new_sprite.is_original = false  # Mark duplicate as non-original

	# Dragging logic
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed and get_rect().has_point(to_local(event.position)):
			draggable = true
			mouse_offset = get_global_mouse_position() - global_position
		else:
			draggable = false

	# Resizing logic
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_RIGHT:
		if event.pressed and get_rect().has_point(to_local(event.position)):
			sizeable_up = true
		else:
			sizeable_up = false

	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_MIDDLE:
		if event.pressed and get_rect().has_point(to_local(event.position)):
			sizeable_down = true
		else:
			sizeable_down = false

func _physics_process(delta):
	var tween: Tween = get_tree().create_tween()
	if draggable:
		tween.tween_property(self, "position", get_global_mouse_position() - mouse_offset, delay * delta)
	if sizeable_up:
		tween.tween_property(self, "scale", Vector2(scale.x * 1.25, scale.y * 1.25), .5)
	if sizeable_down:
		tween.tween_property(self, "scale", Vector2(scale.x / 1.25, scale.y / 1.25), .5)
