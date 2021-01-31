extends KinematicBody


var velocity = Vector3()
var direction = Vector3()
var is_moving = false

export var acceleration = 10
export var max_speed = 10
export var gravity = -10

var camera

func _ready():
	#camera = $CameraTarget/Camera.get_global_transform()
	pass

func _physics_process(delta):
	if get_node("/root/GuiOverlay").can_move():
		camera = $CameraTarget/Camera.get_global_transform()
		
		direction = Vector3()
		var input_vector = Vector2()
		var tform = transform
		is_moving = false
		
		if Input.is_action_pressed("move_left"):
			direction += -camera.basis[0]
			is_moving = true
		if Input.is_action_pressed("move_right"):
			direction += camera.basis[0]
			is_moving = true
		if Input.is_action_pressed("move_up"):
			direction += -camera.basis[2]
			is_moving = true
		if Input.is_action_pressed("move_down"):
			direction += camera.basis[2]
			is_moving = true
		
		direction = direction.normalized()
		
		velocity.y += delta * gravity
		
		var hori = velocity
		hori.y = 0
		
		var goto = direction * max_speed
		hori = hori.linear_interpolate(goto, acceleration * delta)
		
		velocity.x = hori.x
		velocity.z = hori.z
		
		velocity = move_and_slide(velocity, Vector3(0, 1, 0))
		
		if is_moving:
			var angle = atan2(hori.x, hori.z)
			var rot = get_rotation()
			rot.y = angle
			set_rotation(rot)
		
