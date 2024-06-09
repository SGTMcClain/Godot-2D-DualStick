extends Node2D

var mob_counter = 0

func spawn_mob():
	var new_mob = preload("res://mob.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)

func _on_timer_timeout():
	if mob_counter < 20:
		spawn_mob()
		mob_counter += 1


func _on_player_health_depleted():
	%GameOver.visible = true
	get_tree().paused = true
