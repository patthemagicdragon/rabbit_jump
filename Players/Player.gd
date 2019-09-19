extends KinematicBody2D

var motion = Vector2(0, 100)
export var SPEED = 100
export var gravity = 10
export var jump_power = 1000

func _physics_process(delta):
	
	apply_gravity()
	jump()
	walk()
	
	move_and_slide(motion, Vector2( 0, 1))
	
func apply_gravity():
	if is_on_floor():
		motion.y = 0
	else:
		motion.y = motion.y + gravity
	
func jump():
	if Input.is_action_just_pressed("jump"):
		motion.y = -jump_power
		
func walk():

	if Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		motion.x = -SPEED
	elif Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
		motion.x = +SPEED
	else:
		motion.x=0