extends KinematicBody2D
#variables de velocidad y gravedad
var gravity = 700
var speed = 100
#variables de salto
var jump = -320
var jump_force = -500
var jump_time = 0
var can_jun = false
var velocity = Vector2.ZERO
#obtener animacion
onready var anima = $AnimatedSprite

func _ready():
	pass 

func _physics_process(delta):
	movimientos()
	if not Input.is_action_pressed("jump"):
		if velocity.y < -50:
			velocity.y += gravity * delta
	
	velocity.x += velocity.x * delta
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity,Vector2.UP)
	
	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			velocity.y += jump
	
	if not is_on_floor():
		anima.animation = 'Jump'
		velocity.y = clamp(velocity.y,jump_force,1000)
	
func movimientos():
	velocity.x = 0
	if Input.is_action_pressed("ui_right"):
		anima.animation = 'Running'
		anima.flip_h= false
		velocity.x += speed
	elif Input.is_action_pressed("ui_left"):
		velocity.x -= speed
		anima.animation = 'Running'
		anima.flip_h = true
	else:
		anima.animation = 'Iddle'




