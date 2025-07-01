extends Node2D

@onready var ball = $ball/ball
@onready var player_1 = $"."

var paddle_size = 3.5 # number that is unit length
var max_speeds = 200 # (in pixels / second)

func _ready() -> void:
	Global._init_player_pos(1, Vector2(Global.player_wall_dist, Global.window_size[1].y / 2), 12 * paddle_size)

func _process(_delta: float) -> void:
	pass
