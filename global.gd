extends Node
@export var settings = Vector2(0,1) # 0-dark / 1-light ,  0-default / 1-simple / 2-classic
@export var vismodes = [["dark", Color(0.16,0.16,0.16,1)], ["light", Color(0.92,0.92,0.92,1)]]
@export var winstart = Vector2(20,4)
@export var winend = Vector2(1172 - 20, 648 - 4)
@export var scaler = 2
@export var pongtowall = 39
