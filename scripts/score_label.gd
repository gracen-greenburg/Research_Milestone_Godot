extends Label

func _process(delta: float) -> void:
	# calling the game manager to show the death count
		text = "You made it in %d deaths" % GameManager.death_count
