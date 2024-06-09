extends CharacterBody2D
var health = 3
# Get reference to the player
#var player

# wait for all nodes to be loaded 
# func _ready():
	# player = get_node("/root/Game/Player")

# or use the shorthand
@onready var player = get_node("/root/Game/Player")

func _ready():
	%Slime.play_walk()

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 300.0
	move_and_slide()

func take_damage():
	health -= 1
	%Slime.play_hurt
	
	if health == 0:
		queue_free()
		const SMOKE_SCENE = preload("res://smoke_explosion/smoke_explosion.tscn")
		var smoke = SMOKE_SCENE.instantiate()
		get_parent().add_child(smoke) # make the smoke a sibling of the mob so persists 
		smoke.global_position = global_position # the global position of the mob
