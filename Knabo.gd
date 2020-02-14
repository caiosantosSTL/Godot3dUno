extends KinematicBody

var speed = 5
var velox = Vector3()
var grav = -10


var pulo_altura = 10

var rot_dir
var rot_esq
var mov_diant
var mov_atras

var rotvalor

var andar = Vector3()

var nopiso = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):

	rot_dir = Input.is_action_pressed("dir")
	rot_esq = Input.is_action_pressed("esq")
	mov_atras = Input.is_action_pressed("atras")
	mov_diant = Input.is_action_pressed("diant")
	
	if rot_dir:
		rotvalor = delta*speed
		rotate_y(rotvalor)
		
	if rot_esq:
		rotvalor = delta*-speed
		rotate_y(rotvalor)
	
	if mov_diant:
		translate(Vector3(0,0,speed*delta))


	if mov_atras:
		translate(Vector3(0,0,-speed*delta))	

		
	if Input.is_action_just_pressed("pular"):
		if nopiso == true:
			velox.y = pulo_altura
		
	#gravidade
	velox.y += grav*delta
	move_and_slide(velox, Vector3(0,1,0))
	#velox = move_and_slide(velox, Vector3(0,1,0)) #probelam do deslizar
	
	#se ta no chao
	if is_on_floor():
		nopiso = true
	else:
		nopiso = false
		
	pass
