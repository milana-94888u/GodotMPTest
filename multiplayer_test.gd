extends Node2D


var num_players := 0


var peer := ENetMultiplayerPeer.new()
@export var player_scene: PackedScene
@export var camera_scene: PackedScene


func _on_join_button_pressed() -> void:
	peer.create_client("localhost", 7000)
	multiplayer.multiplayer_peer = peer


func _on_host_button_pressed() -> void:
	peer.create_server(7000)
	multiplayer.multiplayer_peer = peer
	multiplayer.peer_connected.connect(add_player)
#	add_player()


func add_player(id := 1) -> void:
	var player: Node
	if num_players == 0:
		player = player_scene.instantiate()
	else:
		player = camera_scene.instantiate()
	player.name = str(id)
	num_players += 1
	call_deferred("add_child", player)
