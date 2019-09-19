extends KinematicBody2D

var motion = Vector2(0, 100)
export var SPEED = 700
export var gravity = 10
export var jump_power = 1000
var jump_count = 0

func _physics_process(delta):
	
	apply_gravity()
	jump()
	walk()
	
	move_and_slide(motion, Vector2( 0, -1))
	
func apply_gravity():
	if is_on_floor():
		motion.y = 0
	else:
		motion.y = motion.y + gravity
	
func jump():
	if jump_count < 1:
		if Input.is_action_just_pressed("jump"):
			motion.y = -jump_power
			jump_count = jump_count + 1
	if is_on_floor():
		jump_count = 0
			
func walk():

	if Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		motion.x = -SPEED
	elif Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
		motion.x = +SPEED
	else:
		motion.x=0