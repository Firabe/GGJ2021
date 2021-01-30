extends VideoPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	hide()


func start_movie():
	show()
	play()

func end_movie():
	hide()
	stop()


func _on_FilmExample_finished():
	hide()
