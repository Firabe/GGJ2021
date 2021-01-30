extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("TextureRect").hide()

func finished_playing():
	get_node("TextureRect").show()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area_area_exited(area):
	get_node("VideoPlayer").play()
