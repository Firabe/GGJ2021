extends Area2D

var memory_name = "BildExample"
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_parent().get_node("KinematicBody2D/Polygon2D").show()





func _on_Area2D_body_entered(body):
	var mem_control = get_node("/root/GuiOverlay")
	mem_control.set_available_memory(memory_name)
	


func _on_Area2D_body_exited(body):
	var mem_control = get_node("/root/GuiOverlay")
	mem_control.remove_memory(memory_name)
