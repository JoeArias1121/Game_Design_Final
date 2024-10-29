extends Node2D

@onready var label: Label = $Label
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.text = str(Global.lvl)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
