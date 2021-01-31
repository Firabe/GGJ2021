extends Spatial

export(String) var memory_name
export(String) var memory_message = "Space"
export(int) var music_track = -1

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if memory_message == null:
		memory_message = "Space"


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area_body_entered(body):
	var mem_control = get_node("/root/GuiOverlay")
	if music_track >= 0:
		mem_control.queue_music(music_track)
	if memory_name != null:
		mem_control.set_available_memory(memory_name, memory_message)


func _on_Area_body_exited(body):
	if memory_name != null:
		var mem_control = get_node("/root/GuiOverlay")
		mem_control.remove_memory(memory_name)
	
