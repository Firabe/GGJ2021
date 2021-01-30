extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_parent().get_node("KinematicBody2D/Polygon2D").show()





func _on_Area2D_body_entered(body):
	get_parent().get_node("GUI/BildExample").show_image()
	


func _on_Area2D_body_exited(body):
	get_parent().get_node("GUI/BildExample").show_image()
