extends CSGBox3D

@export var speed = 5.0  # Speed at which the cube moves towards the player
@export var start_distance = 10.0  # Distance from the player
var cube_color = Color()  # Color of the cube

func _ready():
	position = Vector3(randf_range(-1, 1), randf_range(-1, 1), start_distance)
	position.z = 10
	randomize_color()

func _process(delta):
	position.z -= speed * delta
	if position.z <= 0:
		queue_free()

func randomize_color():
	cube_color = Color(1, 0, 0) if randi() % 2 == 0 else Color(0, 0, 1)
	if material:
		material.albedo_color = cube_color
	else:
		material = StandardMaterial3D.new()
		material.albedo_color = cube_color

func get_color():
	return cube_color
