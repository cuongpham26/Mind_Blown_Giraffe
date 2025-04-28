extends Node

class_name Mission

var assets: Asset = Asset.new()

static var assets_used: Array[String]

# Contains the desired ratio for attributes 
# dark/light, cool/warm, sad/happy, comforting/inpsiring
var target_ratios = [[-0.5, 0.5], [-0.5, 0.5], [-0.5, 0.5], [-0.5, 0.5]]

# Contain the actual ratio
var dark: float = 0.0
var light: float = 0.0

var cool: float = 0.0
var warm: float = 0.0

var sad: float = 0.0
var happy: float = 0.0

var comforting: float = 0.0
var inspiring: float = 0.0

func add_asset(path: String) -> void:
	assets_used.append(path)
	
func remove_asset(path: String) -> void:
	assets_used.erase(path)

# Evaluate performance (Confidant always passes, Client can fail)
func evaluate_performance() -> int:
	for path in assets_used:
		var data = assets.get_item_info(path)

		if data[0] < 0:
			dark -= data[0]
		else:
			light += data[0]
			
		if data[1] < 0:
			cool -= data[1]
		else:
			warm += data[1]
			
		if data[2] < 0:
			sad -= data[2]
		else:
			happy += data[2]
		
		if data[3] < 0:
			comforting -= data[3]
		else:
			inspiring += data[3]
			
			
	# Calculate the actual ratios (avoid divide by zero)
	var ratios : Array[float] = []
	
	if dark == 0 and light == 0:
		ratios.append(0)
	elif light != 0:
		ratios.append(dark / light)
		
	if cool == 0 and warm == 0:
		ratios.append(0)
	elif warm != 0:
		ratios.append(cool / warm)
		
	if sad == 0 and happy == 0:
		ratios.append(0)
	elif happy != 0:
		ratios.append(sad / happy)
		
	if comforting == 0 and inspiring == 0:
		ratios.append(0)
	elif inspiring != 0:
		ratios.append(comforting / inspiring)
	
	
	var count: int = 0
	for i in ratios.size():
		if ratios[i] > target_ratios[i][0] and ratios[i] < target_ratios[i][1]:
			count += 1
			
	if count >= 3:
		return 3
	elif count == 2:
		return 2;
	elif count == 1:
		return 1
	else:
		return 0
