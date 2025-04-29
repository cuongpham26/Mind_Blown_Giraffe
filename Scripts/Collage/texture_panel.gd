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
			var max_width: float = size[0]
			var max_height: float = 96
			var texture_width: float = texture.get_width()
			var texture_height: float = texture.get_height()

			sprite.scale = Vector2(max_width / texture_width, max_height / texture_height)
			
	else:
		sprite.texture = null
