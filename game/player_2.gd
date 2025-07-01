extends Node2D

@onready var ball = $"../ball"
@onready var player = $"."

var paddle_size = 3 # number that is unit length
var max_speeds = 200 # (in pixels / second)

func _init_player_pos():
	paddle_size = clamp(paddle_size, 1.3, 25)
	$middle.scale = Vector2(1, paddle_size - 2)
	$middle.global_position = Vector2.ZERO
	$middle.visible = false if paddle_size < 2 else true
	$top.global_position = Vector2(0, (paddle_size - 1) * -6)
	$bottom.global_position = Vector2(0, (paddle_size - 1) * 6)
	player.global_position = Vector2(Global.winend.x - Global.pongtowall, Global.winend.y / 2)
	
func set_player_pos(pos):
	if (Global.winend.y - paddle_size * 6 * Global.scaler < pos.y):
		pos.y = Global.winend.y - paddle_size * 6 * Global.scaler
	if (Global.winstart.y + paddle_size * 6 * Global.scaler > pos.y):
		pos.y = (paddle_size - 2) * 6 * Global.scaler
	player.global_position = pos

func _ready() -> void:
	_init_player_pos()

func _process(_delta: float) -> void:
	pass
