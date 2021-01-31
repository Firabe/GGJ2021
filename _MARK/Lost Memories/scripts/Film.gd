extends VideoPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	hide()


func start_watch():
	show()
	play()

func end_watch():
	hide()
	stop()


func _on_FilmExample_finished():
	get_parent().memory_has_finished()
	hide()
