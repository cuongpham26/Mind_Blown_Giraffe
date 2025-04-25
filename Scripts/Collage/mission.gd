extends Node

class_name Mission

var assets = Asset.new()

var assets_used: Array[String]

# Contains the desired ratio for attributes
@export var dark_light: int = 2
@export var comforting_inspiring: int = 2
@export var sad_happy: int = 2
@export var cool_warm: int = 2

# Contain the actual ratio
var dark: int = 0
var light: int = 0
var comforting: int = 0
var inspiring: int = 0
var sad: int = 0
var happy: int = 0
var cool: int = 0
var warm: int = 0

func add_asset(path: String) -> void:
	assets_used.append(path)
	
func remove_asset(path: String) -> void:
	assets_used.erase(path)

# Evaluate performance (Confidant always passes, Client can fail)
func evaluate_performance() -> int:
	for path in assets_used:
		var data = assets.get_asset_info(path)
		if data[0] < 0:
			dark -= data[0]
		else:
			light += data[0]
			
		if data[1] < 0:
			comforting -= data[1]
		else:
			inspiring += data[1]
			
		if data[2] < 0:
			sad -= data[2]
		else:
			happy += data[2]
		
		if data[3] < 0:
			cool -= data[3]
		else:
			warm += data[3]
			
			
	# Calculate the actual ratios (avoid divide by zero)
	var ratios = []
	if light == 0 and dark == 0:
		ratios.append({"ratio": 0, "desired": dark_light})
	if light != 0:
		ratios.append({"ratio": dark / light, "desired": dark_light})
	if comforting == 0 and inspiring == 0:
		ratios.append({"ratio": 0, "desired": comforting_inspiring})
	if inspiring != 0:
		ratios.append({"ratio": comforting / inspiring, "desired": comforting_inspiring})
	if sad == 0 and happy == 0:
		ratios.append({"ratio": 0, "desired": sad_happy})
	if happy != 0:
		ratios.append({"ratio": sad / happy, "desired": sad_happy})
	if cool == 0 and warm == 0:
		ratios.append({"ratio": 0, "desired": cool_warm})
	if warm != 0:
		ratios.append({"ratio": cool / warm, "desired": cool_warm})
	
	# Check for 1 star: all ratios meet or exceed their desired ratios
	for item in ratios:
		if item["ratio"] < item["desired"]:
			return 0  # Failed the mission
	
	# If all ratios passed, then check how well top 3 ratios exceeded the requirement
	# Sort by how much they exceed desired values (descending)
	ratios.sort_custom(func(a, b): return (b["ratio"] - b["desired"]) < (a["ratio"] - a["desired"]))
	
	var top_3_exceeds = []
	for i in min(3, ratios.size()):
		var exceed_amount = ratios[i]["ratio"] - ratios[i]["desired"]
		top_3_exceeds.append(exceed_amount)

	# Check thresholds for stars
	if top_3_exceeds.all(func(x): return x > 1.5):
		return 3
	elif top_3_exceeds.all(func(x): return x > 0.5):
		return 2
	else:
		return 1
