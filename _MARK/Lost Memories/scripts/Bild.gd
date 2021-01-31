extends TextureRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	hide()


func start_watch():
	show()
	var timer = get_parent().get_node("ImgCloseTimer")
	timer.connect("timeout", self, "_on_ImgCloseTimer_timeout")
	timer.start()

func end_watch():
	hide()
	get_parent().get_node("ImgCloseTimer").stop()


func _on_ImgCloseTimer_timeout():
	get_parent().memory_has_finished()
	hide()
