extends CharacterBody2D

var health = 100.0

signal health_depleted

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
	
	const DAMAGE_RATE = 5.0
	var overlapping_mobs = %hurtbox.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		health -= DAMAGE_RATE * overlapping_mobs.size() * delta
		%ProgressBar.value = health
		
		if health <= 0.0:
			health_depleted.emit()
		elif health <= 20.0: #change color when at low health
			%ProgressBar.get("theme_override_styles/fill").bg_color = Color(1,0,0,1)
		elif health <= 50.0:
			%ProgressBar.get("theme_override_styles/fill").bg_color = Color.YELLOW
		else:
			%ProgressBar.get("theme_override_styles/fill").bg_color = Color(0.62, 1.0, 0.31, 1.0)
