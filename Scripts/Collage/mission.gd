extends Node

class_name Mission

var asset_class = Asset.new()

# Contains the desired ratio for attributes
var dark_light: int = 2
var comforting_inspiring: int = 2
var sad_happy: int = 2
var cool_warm: int = 2

# Contain the actual ratio
var dark: int = 0
var light: int = 0
var comforting: int = 0
var inspiring: int = 0
var sad: int = 0
var happy: int = 0
var cool: int = 0
var warm: int = 0

# Evaluate performance (Confidant always passes, Client can fail)
func evaluate_performance(assets_used: Array[String]) -> int:
	var score: int = 0
	for asset in assets_used:
		var info = asset_class.get_asset_info(asset)
		if info["Dark/Light"] < 0:
			dark -= info["Dark/Light"]
		else:
			light += info["Dark/Light"]
			
		if info["Comforting/Inspiring"] < 0:
			comforting -= info["Comforting/Inspiring"]
		else:
			inspiring += info["Comforting/Inspiring"]
			
		if info["Sad/Happy"] < 0:
			sad -= info["Sad/Happy"]
		else:
			happy += info["Sad/Happy"]
		
		if info["Cool/Warm"] < 0:
			cool -= info["Cool/Warm"]
		else:
			warm += info["Cool/Warm"]
			
			
	# Calculate the actual ratios (avoid divide by zero)
	var ratios = []
	if light != 0:
		ratios.append({"ratio": dark / light, "desired": dark_light})
	if inspiring != 0:
		ratios.append({"ratio": comforting / inspiring, "desired": comforting_inspiring})
	if happy != 0:
		ratios.append({"ratio": sad / happy, "desired": sad_happy})
	if warm != 0:
		ratios.append({"ratio": cool / warm, "desired": cool_warm})
	
		# Check for 1 star: all ratios meet or exceed their desired ratios
	var all_meet_required = true
	for item in ratios:
		if item["ratio"] < item["desired"]:
			all_meet_required = false
			break

	if not all_meet_required:
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
