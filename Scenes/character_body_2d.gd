extends CharacterBody2D

# Movement properties
@export var base_speed: float = 150.0
var direction: Vector2 = Vector2.ZERO

func _ready() -> void:
	# Pick a random starting direction and normalize it so it moves at a consistent speed
	direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()

func _process(delta: float) -> void:
	# Move the sprite based on direction and speed
	position += direction * base_speed * delta
	
	# Get the current screen size (the window boundaries)
	var screen_size = get_viewport_rect().size
	
	# Bounce off the left or right walls
	if position.x < 0 or position.x > screen_size.x:
		direction.x *= -1
		position.x = clamp(position.x, 0, screen_size.x) # Keeps it from getting stuck outside
		
	# Bounce off the top or bottom walls
	if position.y < 0 or position.y > screen_size.y:
		direction.y *= -1
		position.y = clamp(position.y, 0, screen_size.y)

# Call this function to give the sprite a speed boost
func add_speed_boost(amount: float = 50.0) -> void:
	base_speed += amount

func reduce_speed_boost(amount: float = 100.0) -> void:
	base_speed -= amount

func _on_coin_clicker_pressed() -> void:
	add_speed_boost()


func _on_reduce_money_pressed() -> void:
	reduce_speed_boost()
