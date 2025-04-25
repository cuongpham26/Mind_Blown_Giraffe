extends Panel
@onready var setone = $ItemSet1
@onready var settwo = $ItemSet2
@onready var setthree = $ItemSet3
@onready var setfour = $ItemSet4

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	settwo.visible = false
	setthree.visible = false
	setfour.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_prev_button_pressed() -> void:
	if setfour.visible:
		setfour.visible = false
		setthree.visible = true
		return
	if setthree.visible:
		setthree.visible = false
		settwo.visible = true
		return
	if settwo.visible:
		settwo.visible = false
		setone.visible = true
		return


func _on_next_button_pressed() -> void:
	if setone.visible:
		setone.visible = false
		settwo.visible = true
		return
	if settwo.visible:
		settwo.visible = false
		setthree.visible = true
		return
	if setthree.visible:
		setthree.visible = false
		setfour.visible = true
		return
