extends Node

var is_watching_memory = false
var current_memory = null
var image_path = ""
var can_move = false


func can_move():
	return can_move

func _unhandled_input(event):
	if event.is_action_pressed("ui_accept"):
		if is_watching_memory:
			is_watching_memory = false
			stop_watch_memory()
		elif current_memory != null:
			is_watching_memory = true
			start_watch_memory()


func memory_has_finished():
	is_watching_memory = false

func start_watch_memory():
	get_node(current_memory).start_watch(image_path)
	$Music.playMemorySound()
	
func stop_watch_memory():
	get_node(current_memory).end_watch()
	
func queue_music(number):
	$Music.queueMusic(number)
	
func change_ambient(path):
	$Music.changeAmbient()

func set_available_memory(memory, message, img_p):
	image_path = img_p
	current_memory = memory
	$Message.text = message
	$Message.show()

func remove_memory(memory):
	if (current_memory == memory):
		if is_watching_memory:
			stop_watch_memory()
			is_watching_memory = false
		current_memory = null
		$Message.hide()


func _on_TextureButton_pressed():
	$MenuScreen.hide()
	$Intro.start_watch("")


func _on_Intro_finished():
	can_move = true
