extends TileMapLayer

var rng = RandomNumberGenerator.new()
var tilesCoords = PackedVector2Array()
var last_tile: Vector2i 

func _ready() -> void:
	rng.randomize()
	
	# Gera a plataforma inicial
	for i in range(-2,30):
		var tile = Vector2i(i,0)
		tilesCoords.append(tile)
		if i == 29: 
			last_tile = Vector2i(i,0)
	set_cells_terrain_path(tilesCoords,0,0)

	tilesCoords.clear()
	generateMap()

func generateMap() -> void:
	var platform_height_difference := rng.randi_range(-5,5)
	var distance_between_platforms := rng.randi_range(4,7)
	var _first_tile: Vector2i = last_tile + Vector2i(distance_between_platforms, platform_height_difference)
	tilesCoords.append(_first_tile)
	
	var _platform_length := rng.randi_range(2,6)
	for i in range(_platform_length):
		var _platform_tile = Vector2i(_first_tile.x + i + 1, _first_tile.y)
		tilesCoords.append(_platform_tile)
		if i == _platform_length - 1:
			last_tile = Vector2i(_first_tile.x + i + 1, _first_tile.y)
	
	set_cells_terrain_path(tilesCoords,0,0)
	
