extends CharacterBody2D

# Basic Character movement using Input Map
func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * 600
	move_and_slide()
	
	# Walk animation
	if velocity.length() > 0.0:
		# get_node long Version
		get_node("HappyBoo").play_walk_animation()
	else:
		#get_node shortcut using `$`
		$HappyBoo.play_idle_animation()
	###
	# NOTE: get_node call also be accessed using % as a shortcut if you
	# first enable it by right clicking the node in the scene list and
	# selecting `Access by unique name` it can then be accessed as 
	# `%HappyBoo`.  It is only accessible from the current scene.
	###
