extends Node

# ["Dark/Light", "Cool/Warm", "Sad/Happy", "Comforting/Inspiring"]

class_name Asset
# Store all the assets along with the gradable attributes
# When a player obtains an asset, that asset will be added to their inventory
var asset = {
	"02_dish_2.png": [4, -2, 0, -1],
	"15_burger.png": [1, 3, 2, -4],
	"38_friedegg.png": [4, 1, 3, -3],
	"54_hotdog.png": [-1, 3, 2, -4],
	"81_pizza.png": [1, 4, 2, -3],
	"color_background_86.png": [2, 3, 4, -1],
	"color_background_79.png": [-3, -3, -1, 0],
	"color_background_77.png": [3, 4, 1, 0],
	"color_background_76.png": [-3, -3, -1, 0],
	"color_background_71.png": [4, 2, 1, 0],
	"color_background_66.png": [1, -4, 1, -1],
	"color_background_65.png": [2, -4, -1, 0],
	"color_background_58.png": [2, -3, 0, 1],
	"color_background_54.png": [2, 2, -1, 0],
	"color_background_48.png": [1, 3, 1, -2],
	"color_background_47.png": [1, -2, 1, -1],
	"color_background_34.png": [1, -4, -1, 0],
	"Cloth_24-256x256.png": [3, 4, 0, -1],
	"Cloth_22-256x256.png": [-2, 4, -1, 1],
	"Cloth_19-256x256.png": [1, -3, 0, 1],
	"Cloth_18-256x256.png": [-4, -4, 0, 1],
	"Cloth_16-256x256.png": [3, -4, 0, -1],
	"Cloth_14-256x256.png": [3, -4, 0, -1],
	"Cloth_12-256x256.png": [3, 3, 1, -2],
	"Cloth_11-256x256.png": [3, 0, 1, -2],
	"Cloth_10-256x256.png": [-1, 1, 0, -1],
	"Cloth_07-256x256.png": [4, 2, 1, 0],
	"Cloth_06-256x256.png": [-1, 3, 0, -2],
	"Cloth_04-256x256.png": [3, 2, 0, -1],
	"Cloth_02-256x256.png": [-2, 3, 0, -1],
	"Cloth_01-256x256.png": [-2, -4, -1, 0],
	"Art Texture 059.JPG": [4, -1, 2, 0],
	"Art Texture 057.JPG": [-1, -3, -2, 0],
	"Art Texture 056.JPG": [4, 1, 2, 0],
	"Art Texture 055.JPG": [4, 3, 1, 0],
	"Art Texture 052.JPG": [3, -4, -2, 0],
	"Art Texture 037.JPG": [3, -4, 0, 1],
	"Art Texture 036.JPG": [-2, -3, 0, 4],
	"Art Texture 034.JPG": [1, -3, 2, 0],
	"Art Texture 027.jpg": [-3, -3, -1, 0],
	"Art Texture 020.jpg": [-2, -4, 0, 2],
	"Art Texture 014.jpg": [-2, 2, 0, 1],
	"Art Texture 011.jpg": [-2, 1, -3, 1],
	"Art Texture 01.jpg": [2, -1, 1, 3],
	"48x48 trees 2.png": [0, -1, 3, -2],
	"48x48 trees 3.png": [0, -1, 3, -2],
	"16x32 trees 2.png": [1, 0, 3, -2],
	"16x32 trees 3.png": [-2, 0, 1, -2],
	"16x32 trees 4.png": [1, 0, 2, 1],
	"BirdFly.png": [0, 2, 2, 2],
	"FrogIdle.png": [2, -2, 3, 0],
	"Golden.png": [1, 1, 3, 0],
	"Cattt.png": [1, 0, 3, -3],
	"Bunny.png": [1, 1, 3, 0],
	"Pig.png": [2, 2, 0, -2]
}

func get_asset_info(asset_path: String) -> Array:
	if asset.has(asset_path):
		return asset[asset_path]
	else:
		print("Asset not found: ", asset_path)
		return []
