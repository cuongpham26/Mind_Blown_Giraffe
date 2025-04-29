extends Panel

@onready var background1: Sprite2D = $Background1
@onready var background2: Sprite2D = $Background2
@onready var background3: Sprite2D = $Background3
@onready var background4: Sprite2D = $Background4

var background_keys: Array = Asset.new().backgrounds.keys()
var background_index: int = 0
const BACKGROUNDS_PER_PAGE: int = 5

func _ready():
	update_backgrounds()

func _on_prev_set_pressed() -> void:
	if background_index >= BACKGROUNDS_PER_PAGE:
		background_index -= BACKGROUNDS_PER_PAGE
		update_backgrounds()

func _on_next_set_pressed() -> void:
	if background_index + BACKGROUNDS_PER_PAGE < background_keys.size():
		background_index += BACKGROUNDS_PER_PAGE
		update_backgrounds()
		
# Update the 4 backgrounds on the panel
func update_backgrounds() -> void:
	set_background_texture(background1, background_index)
	set_background_texture(background2, background_index + 1)
	set_background_texture(background3, background_index + 2)
	set_background_texture(background4, background_index + 3)

# Update each of the background  on the panel per call
func set_background_texture(sprite: Sprite2D, index: int) -> void:
	if index < background_keys.size():
		var filename: String = background_keys[index]
		var texture: Texture = load("res://Inventory/Backgrounds/" + filename)
		sprite.texture = texture
		
		if texture:
			var target_width: float = size[0] # Set target_width to panel width
			# If you want more backgrounds on the panel decrease the target_height
			# then manually put another object, and vice versa
			var target_height: float = 96

			sprite.scale = Vector2(target_width / texture.get_width(), target_height / texture.get_height())
			
	else:
		sprite.texture = null

# Set your big background using the background list from the panel	
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		var background_list = find_children("Background?", "Sprite2D", false, true)
		
		for background in background_list:
			if background.get_rect().has_point(background.to_local(event.position)): 			
				# We plan to release this game on a 1280 * 720 computer screen
				var target_width: float = 1280
				var target_height: float = 720

				get_node("../Background").scale = Vector2(target_width / background.texture.get_width(), target_height / background.texture.get_height())
				get_node("../Background").set_texture(background.texture)
