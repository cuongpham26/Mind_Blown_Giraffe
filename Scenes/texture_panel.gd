extends Panel
@onready var setone = $Set1
@onready var settwo = $Set2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	setone.visible = true
	settwo.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_prev_set_pressed() -> void:
	setone.visible = true
	settwo.visible = false


func _on_next_set_pressed() -> void:
	setone.visible = false
	settwo.visible = true
