extends Spatial

export(String) var memory_name
export(String) var memory_message

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area_body_entered(body):
	var mem_control = get_node("/root/GuiOverlay")
	mem_control.set_available_memory(memory_name, memory_message)


func _on_Area_body_exited(body):
	var mem_control = get_node("/root/GuiOverlay")
	mem_control.remove_memory(memory_name)
	
