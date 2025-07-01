extends Node
@export var settings = Vector2(1,2) # 0-dark / 1-light ,  0-default / 1-simple / 2-classic
@export var vismodes = [["dark", Color(0.16,0.16,0.16,1)], ["light", Color(0.92,0.92,0.92,1)]]
@export var window_size = [Vector2(20,4),Vector2(1172 - 20, 648 - 4)] # min x,y / max
@export var scaler = 2
@export var player_wall_dist = 39

@onready var player_sections = [
	[$"player 1", $"player 2"],
	[$"player 1/top", $"player 1/middle", $"player 1/bottom"],
	[$"player 2/top", $"player 2/middle", $"player 2/bottom"]
]

func _init_player_pos(playerint, pos, lengthpx):
	if (window_size[1].y - lengthpx * scaler / 2 < pos.y):
		pos.y = window_size[1].y - lengthpx * scaler / 2
	if (window_size[0].y + lengthpx * scaler / 2 > pos.y):
		pos.y = lengthpx * scaler / 2
	player_sections[playerint][1].global_scale *= Vector2(1, (lengthpx/12)-2)
	player_sections[playerint][0].global_position = pos - Vector2(0,lengthpx)
	player_sections[playerint][1].global_position = pos
	player_sections[playerint][2].global_position = pos + Vector2(0,lengthpx)
