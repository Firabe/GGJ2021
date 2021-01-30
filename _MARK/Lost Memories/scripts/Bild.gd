extends TextureRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	hide()


func start_watch():
	show()
	get_parent().get_node("ImgCloseTimer").start()

func end_watch():
	hide()
	get_parent().get_node("ImgCloseTimer").start()


func _on_ImgCloseTimer_timeout():
	hide()
