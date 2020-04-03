extends KinematicBody2D

export (int) var SPEED = 200

var dir = 'right'

func _physics_process(delta):
	var input = Vector2()
	
	if Input.is_action_just_pressed("ui_right"):
		dir = 'right'
	if Input.is_action_just_pressed("ui_left"):
		dir = 'left'
	
	input.x += float(Input.is_action_pressed('ui_right'))
	input.x -= float(Input.is_action_pressed('ui_left'))
	input.y -= float(Input.is_action_pressed('ui_up'))
	input.y += float(Input.is_action_pressed('ui_down'))

	if dir == 'right':
		get_node("AnimatedSprite").set_flip_h(false)
	elif dir == 'left':
		get_node("AnimatedSprite").set_flip_h(true)

	if input.length() != 0:
		input = input.normalized()

# warning-ignore:return_value_discarded
	move_and_collide(input * SPEED * delta)
