extends TextureRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	hide()


func show_image():
	show()
	get_parent().get_node("ImgCloseTimer").start()

func hide_image():
	hide()
	get_parent().get_node("ImgCloseTimer").start()


func _on_ImgCloseTimer_timeout():
	hide()
