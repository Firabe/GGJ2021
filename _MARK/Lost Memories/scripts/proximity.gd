extends Spatial

export(String) var memory_name = "Bild"
export(String) var memory_message = "Space"
export(String) var image_path = "nebel.png"
export(int) var music_track = -1
export(String) var ambient_track = ""

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area_body_entered(body):
	var mem_control = get_node("/root/GuiOverlay")
	if music_track >= 0:
		mem_control.queue_music(music_track)
	if ambient_track != "":
		mem_control.change_ambient(ambient_track)
	if memory_name != "":
		mem_control.set_available_memory(memory_name, memory_message, image_path)


func _on_Area_body_exited(body):
	if memory_name != "":
		var mem_control = get_node("/root/GuiOverlay")
		mem_control.remove_memory(memory_name)
	
