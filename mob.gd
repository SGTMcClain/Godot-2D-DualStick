extends CharacterBody2D

# Get reference to the player
#var player

# wait for all nodes to be loaded 
# func _ready():
	# player = get_node("/root/Game/Player")

# or use the shorthand
@onready var player = get_node("/root/Game/Player")

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 300.0
	move_and_slide()
