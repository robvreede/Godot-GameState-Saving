extends Node



var version = "v2023-05-13  |  Work in progress"
var current_level = 1
var player_position_x = 33
var player_position_y = 33
var player_position_z = 33
var player_rotation_x = 33
var player_rotation_y = 33
var player_rotation_z = 33
var player_health = 100
var data
var savegamedata = JSON.new()
var have_weapon = true

func _save_game():
	data = {
		"current_level" : current_level,
		"player_position.x" : player_position_x,
		"player_position.y" : player_position_y,
		"player_position.z" : player_position_z,
		"player_rotation.x" : player_rotation_x,
		"player_rotation.y" : player_rotation_y,
		"player_rotation.z" : player_rotation_z,
		"player_health" : player_health,
	}

	var file = FileAccess.open_encrypted_with_pass("user://savegame.json", FileAccess.WRITE, "{youverysecretkeytoencryptthesavefile}")
	if file.is_open():
		savegamedata.parse(data)
		file.store_var(savegamedata, true)
		file.close()
		print("Savegame saved")


func _load_game():
	var file = FileAccess.open_encrypted_with_pass("user://savegame.json", FileAccess.READ, "youverysecretkeytoencryptthesavefile")
	if file.is_open():
		file.close()
		data = savegamedata.get_data()
		print(data)
		
		# Populate loaded data
		current_level = data["current_level"]
		player_position_x = data["player_position.x"]
		player_position_y = data["player_position.y"]
		player_position_z = data["player_position.z"]
		player_rotation_x = data["player_rotation.x"]
		player_rotation_y = data["player_rotation.y"]
		player_rotation_z = data["player_rotation.z"]
		player_health = data["player_health"]
		
		print("Savegame loaded")
