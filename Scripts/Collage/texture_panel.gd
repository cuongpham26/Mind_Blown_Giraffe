extends Panel

@onready var background1: Sprite2D = $Background1
@onready var background2: Sprite2D = $Background2
@onready var background3: Sprite2D = $Background3
@onready var background4: Sprite2D = $Background4

var background_keys: Array = []
var background_index: int = 0
const BACKGROUNDS_PER_PAGE: int = 5


var asset: Asset = Asset.new()

func _ready():
	# Load all background filenames once from Asset
	background_keys = asset.backgrounds.keys()
	update_backgrounds()

func _on_prev_set_pressed() -> void:
	if background_index >= BACKGROUNDS_PER_PAGE:
		background_index -= BACKGROUNDS_PER_PAGE
		update_backgrounds()

func _on_next_set_pressed() -> void:
	if background_index + BACKGROUNDS_PER_PAGE < background_keys.size():
		background_index += BACKGROUNDS_PER_PAGE
		update_backgrounds()

func update_backgrounds() -> void:
	set_background_texture(background1, background_index)
	set_background_texture(background2, background_index + 1)
	set_background_texture(background3, background_index + 2)
	set_background_texture(background4, background_index + 3)

func set_background_texture(sprite: Sprite2D, index: int) -> void:
	if index < background_keys.size():
		var filename = background_keys[index]
		var texture = load("res://Inventory/Backgrounds/" + filename)
		sprite.texture = texture

		if texture:
			var max_width: float = size[0]
			var max_height: float = 96
			var tex_width: float = texture.get_width()
			var tex_height: float = texture.get_height()

			# Same scaling rule: fit inside 160x160, at least one side = 160
			var scale_x: float = max_width / tex_width
			var scale_y: float = max_height / tex_height
			var final_scale = min(scale_x, scale_y)

			sprite.scale = Vector2(final_scale, final_scale)
	else:
		sprite.texture = null
