@icon("../Icons/image.png")
class_name image extends Sprite2D
#random comment to see if it works in git	 
# Drag and drop variables
var draggable: bool = false
var sizeable_up: bool = false
var sizeable_down: bool = false

var mouse_offset: Vector2
var delay: float = .2
var is_original: bool = true  # Only original Sidebar images can duplicate
var tween: Tween = null  # Store the tween instance
var highlighted: bool = false

func _input(event: InputEvent) -> void:
	# Allow duplication only if the sprite is inside the Sidebar and is an original
	if event is InputEventMouseButton and event.pressed and get_rect().has_point(to_local(event.position)): 
		if is_original and get_parent() and get_parent().name == "Sidebar":
			var new_sprite: image = duplicate()
			get_parent().get_parent().add_child(new_sprite)
			new_sprite.global_position = global_position + Vector2(600, 200)
			new_sprite.is_original = false  # Mark duplicate as non-original
	
	#highlighting logic		
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed and not is_original:
			if is_pixel_opaque(get_local_mouse_position()):
				highlighted = true
			if not is_pixel_opaque(get_local_mouse_position()):
				highlighted = false


	# Dragging logic
	if highlighted:
		if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed and event.button_index and not is_original:
				if is_pixel_opaque(get_local_mouse_position()):
					draggable = true
					mouse_offset = get_global_mouse_position() - global_position
					z_index = get_tree().get_node_count()  # Bring sprite to the top when clicked
			else:
				draggable = false
	

		# Resizing logic
		if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_RIGHT:
			if event.pressed and get_rect().has_point(to_local(event.position)) and not is_original:
				sizeable_up = true
			else:
				sizeable_up = false

		if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_MIDDLE:
			if event.pressed and get_rect().has_point(to_local(event.position)) and not is_original:
				sizeable_down = true
			else:
				sizeable_down = false

func _process(delta):

	if highlighted:
		set_self_modulate(Color(1,1,1,.5))
		if Input.is_action_just_pressed("ui_left"):
			rotation_degrees -= 30
		if Input.is_action_just_pressed("ui_right"):
			rotation_degrees += 30
		if Input.is_action_just_pressed("ui_up"):
			var flipped = is_flipped_h()
			set_flip_h(!flipped)
	if not highlighted:
		set_self_modulate(Color(1,1,1,1))
	if draggable:
		position = get_global_mouse_position() - mouse_offset  # Move directly for smoother dragging
		
func _physics_process(delta):
	
	if sizeable_up or sizeable_down:
		if tween and tween.is_running():
			tween.kill()  # Kill previous tween to avoid conflicts
		tween = get_tree().create_tween()
		
		if sizeable_up and highlighted:
			tween.tween_property(self, "scale", scale * 2, .5)
			sizeable_up = false  # Reset flag after resizing
		
		if sizeable_down and highlighted:
			tween.tween_property(self, "scale", scale / 2, .5)
			sizeable_down = false  # Reset flag after resizing
