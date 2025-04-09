extends Node

class_name Asset
# Store all the assets along with the gradable attributes
# When a player obtain an assets, that asset will be added to their inventory
var asset = {
	"02_dish_2.png": { "Dark/Light": 4, "Cool/Warm": -2, "Sad/Happy": 0, "Comforting/Inspiring": -1 },
	"15_burger.png": { "Dark/Light": 1, "Cool/Warm": 3, "Sad/Happy": 2, "Comforting/Inspiring": -4 },
	"38_friedegg.png": { "Dark/Light": 4, "Cool/Warm": 1, "Sad/Happy": 3, "Comforting/Inspiring": -3 },
	"54_hotdog.png": { "Dark/Light": -1, "Cool/Warm": 3, "Sad/Happy": 2, "Comforting/Inspiring": -4 },
	"81_pizza.png": { "Dark/Light": 1, "Cool/Warm": 4, "Sad/Happy": 2, "Comforting/Inspiring": -3 },
	"color_background_86.png": { "Dark/Light": 2, "Cool/Warm": 3, "Sad/Happy": 4, "Comforting/Inspiring": -1 },
	"color_background_79.png": { "Dark/Light": -3, "Cool/Warm": -3, "Sad/Happy": -1, "Comforting/Inspiring": 0 },
	"color_background_77.png": { "Dark/Light": 3, "Cool/Warm": 4, "Sad/Happy": 1, "Comforting/Inspiring": 0 },
	"color_background_76.png": { "Dark/Light": -3, "Cool/Warm": -3, "Sad/Happy": -1, "Comforting/Inspiring": 0 },
	"color_background_71.png": { "Dark/Light": 4, "Cool/Warm": 2, "Sad/Happy": 1, "Comforting/Inspiring": 0 },
	"color_background_66.png": { "Dark/Light": 1, "Cool/Warm": -4, "Sad/Happy": 1, "Comforting/Inspiring": -1 },
	"color_background_65.png": { "Dark/Light": 2, "Cool/Warm": -4, "Sad/Happy": -1, "Comforting/Inspiring": 0 },
	"color_background_58.png": { "Dark/Light": 2, "Cool/Warm": -3, "Sad/Happy": 0, "Comforting/Inspiring": 1 },
	"color_background_54.png": { "Dark/Light": 2, "Cool/Warm": 2, "Sad/Happy": -1, "Comforting/Inspiring": 0 },
	"color_background_48.png": { "Dark/Light": 1, "Cool/Warm": 3, "Sad/Happy": 1, "Comforting/Inspiring": -2 },
	"color_background_47.png": { "Dark/Light": 1, "Cool/Warm": -2, "Sad/Happy": 1, "Comforting/Inspiring": -1 },
	"color_background_34.png": { "Dark/Light": 1, "Cool/Warm": -4, "Sad/Happy": -1, "Comforting/Inspiring": 0 },
	"Cloth_24-256x256.png": { "Dark/Light": 3, "Cool/Warm": 4, "Sad/Happy": 0, "Comforting/Inspiring": -1 },
	"Cloth_22-256x256.png": { "Dark/Light": -2, "Cool/Warm": 4, "Sad/Happy": -1, "Comforting/Inspiring": 1 },
	"Cloth_19-256x256.png": { "Dark/Light": 1, "Cool/Warm": -3, "Sad/Happy": 0, "Comforting/Inspiring": 1 },
	"Cloth_18-256x256.png": { "Dark/Light": -4, "Cool/Warm": -4, "Sad/Happy": 0, "Comforting/Inspiring": 1 },
	"Cloth_16-256x256.png": { "Dark/Light": 3, "Cool/Warm": -4, "Sad/Happy": 0, "Comforting/Inspiring": -1 },
	"Cloth_14-256x256.png": { "Dark/Light": 3, "Cool/Warm": -4, "Sad/Happy": 0, "Comforting/Inspiring": -1 },
	"Cloth_12-256x256.png": { "Dark/Light": 3, "Cool/Warm": 3, "Sad/Happy": 1, "Comforting/Inspiring": -2 },
	"Cloth_11-256x256.png": { "Dark/Light": 3, "Cool/Warm": 0, "Sad/Happy": 1, "Comforting/Inspiring": -2 },
	"Cloth_10-256x256.png": { "Dark/Light": -1, "Cool/Warm": 1, "Sad/Happy": 0, "Comforting/Inspiring": -1 },
	"Cloth_07-256x256.png": { "Dark/Light": 4, "Cool/Warm": 2, "Sad/Happy": 1, "Comforting/Inspiring": 0 },
	"Cloth_06-256x256.png": { "Dark/Light": -1, "Cool/Warm": 3, "Sad/Happy": 0, "Comforting/Inspiring": -2 },
	"Cloth_04-256x256.png": { "Dark/Light": 3, "Cool/Warm": 2, "Sad/Happy": 0, "Comforting/Inspiring": -1 },
	"Cloth_02-256x256.png": { "Dark/Light": -2, "Cool/Warm": 3, "Sad/Happy": 0, "Comforting/Inspiring": -1 },
	"Cloth_01-256x256.png": { "Dark/Light": -2, "Cool/Warm": -4, "Sad/Happy": -1, "Comforting/Inspiring": 0 },
	"Art Texture 059.JPG": { "Dark/Light": 4, "Cool/Warm": -1, "Sad/Happy": 2, "Comforting/Inspiring": 0 },
	"Art Texture 057.JPG": { "Dark/Light": -1, "Cool/Warm": -3, "Sad/Happy": -2, "Comforting/Inspiring": 0 },
	"Art Texture 056.JPG": { "Dark/Light": 4, "Cool/Warm": 1, "Sad/Happy": 2, "Comforting/Inspiring": 0 },
	"Art Texture 055.JPG": { "Dark/Light": 4, "Cool/Warm": 3, "Sad/Happy": 1, "Comforting/Inspiring": 0 },
	"Art Texture 052.JPG": { "Dark/Light": 3, "Cool/Warm": -4, "Sad/Happy": -2, "Comforting/Inspiring": 0 },
	"Art Texture 037.JPG": { "Dark/Light": 3, "Cool/Warm": -4, "Sad/Happy": 0, "Comforting/Inspiring": 1 },
	"Art Texture 036.JPG": { "Dark/Light": -2, "Cool/Warm": -3, "Sad/Happy": 0, "Comforting/Inspiring": 4 },
	"Art Texture 034.JPG": { "Dark/Light": 1, "Cool/Warm": -3, "Sad/Happy": 2, "Comforting/Inspiring": 0 },
	"Art Texture 027.jpg": { "Dark/Light": -3, "Cool/Warm": -3, "Sad/Happy": -1, "Comforting/Inspiring": 0 },
	"Art Texture 020.jpg": { "Dark/Light": -2, "Cool/Warm": -4, "Sad/Happy": 0, "Comforting/Inspiring": 2 },
	"Art Texture 014.jpg": { "Dark/Light": -2, "Cool/Warm": 2, "Sad/Happy": 0, "Comforting/Inspiring": 1 },
	"Art Texture 011.jpg": { "Dark/Light": -2, "Cool/Warm": 1, "Sad/Happy": -3, "Comforting/Inspiring": 1 },
	"Art Texture 01.jpg": { "Dark/Light": 2, "Cool/Warm": -1, "Sad/Happy": 1, "Comforting/Inspiring": 3 },
	"48x48 trees 2.png": { "Dark/Light": 0, "Cool/Warm": -1, "Sad/Happy": 3, "Comforting/Inspiring": -2 },
	"48x48 trees 3.png": { "Dark/Light": 0, "Cool/Warm": -1, "Sad/Happy": 3, "Comforting/Inspiring": -2 },
	"16x32 trees 2.png": { "Dark/Light": 1, "Cool/Warm": 0, "Sad/Happy": 3, "Comforting/Inspiring": -2 },
	"16x32 trees 3.png": { "Dark/Light": -2, "Cool/Warm": 0, "Sad/Happy": 1, "Comforting/Inspiring": -2 },
	"16x32 trees 4.png": { "Dark/Light": 1, "Cool/Warm": 0, "Sad/Happy": 2, "Comforting/Inspiring": 1 },
	"BirdFly.png": { "Dark/Light": 0, "Cool/Warm": 2, "Sad/Happy": 2, "Comforting/Inspiring": 2 },
	"FrogIdle.png": { "Dark/Light": 2, "Cool/Warm": -2, "Sad/Happy": 3, "Comforting/Inspiring": 0 },
	"Golden.png": { "Dark/Light": 1, "Cool/Warm": 1, "Sad/Happy": 3, "Comforting/Inspiring": 0 },
	"Cattt.png": { "Dark/Light": 1, "Cool/Warm": 0, "Sad/Happy": 3, "Comforting/Inspiring": -3 },
	"Bunny.png": { "Dark/Light": 1, "Cool/Warm": 1, "Sad/Happy": 3, "Comforting/Inspiring": 0 },
	"Pig.png": { "Dark/Light": 2, "Cool/Warm": 2, "Sad/Happy": 0, "Comforting/Inspiring": -2 }
}

func get_asset_info(asset_path: String) -> Dictionary:
	if asset.has(asset_path):
		return asset[asset_path]
	else:
		print("Asset not found: ", asset_path)
		return {}
