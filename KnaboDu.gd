extends KinematicBody

var gravity = -12  # strength of gravity Vector3.DOWN * 12
var speed = 8  # movement speed
var jump_speed = 10  # jump strength
var spin = 4  # rotation speed

var velocity = Vector3()
var jump = false

var rotvalor

var nopiso = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	velocity.x = 0
	velocity.z = 0
	
	#mover
	if Input.is_action_pressed("diant"):
		#velocity.z -= speed
		velocity += transform.basis.z * speed		
	if Input.is_action_pressed("atras"):
		#velocity.z += speed
		velocity += -transform.basis.z * speed
	if Input.is_action_pressed("gidir"):
		#velocity.x += speed
		velocity += transform.basis.x * speed

	if Input.is_action_pressed("giesq"):
		#velocity.x -= speed
		velocity += -transform.basis.x * speed
	
	#girar para ver
	if Input.is_action_pressed("dir"):
		rotvalor = delta*spin
		rotate_y(rotvalor)
		
	if Input.is_action_pressed("esq"):
		rotvalor = delta*-spin
		rotate_y(rotvalor)				

	if Input.is_action_just_pressed("pular"):
		if nopiso == true:
			velocity.y = jump_speed	
	
	velocity.y += gravity * delta	
	velocity = move_and_slide(velocity, Vector3.UP)

	#se ta no chao
	if is_on_floor():
		nopiso = true
	else:
		nopiso = false
	

	pass
	
	

