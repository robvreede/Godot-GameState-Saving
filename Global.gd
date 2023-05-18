extends Node

var savegame1 = "res://savegame1.dat"
var version = "v2023-05-18  |  Work in progress"

var gamedata = {
		"current_level" : 1,
		"player_position_x" : 33,
		"player_position_y" : 33,
		"player_position_z" : 33,
		"player_rotation_x" : 33,
		"player_rotation_y" : 33,
		"player_rotation_z" : 33,
		"player_health" : 100,
	}


func _save_game():
	#var file = FileAccess.open_encrypted_with_pass(savegame1, FileAccess.WRITE, "youverysecretkeytoencryptthesavefile")
	var file = FileAccess.open(savegame1, FileAccess.WRITE)
	if file.is_open():
		#file.store_var(gamedata, true)
		file.store_line(JSON.stringify(gamedata))
		file.close()
		print("Savegame saved")


func _load_game():
	#var file = FileAccess.open_encrypted_with_pass(savegame1, FileAccess.READ, "youverysecretkeytoencryptthesavefile")
	var file = FileAccess.open(savegame1, FileAccess.READ)
	if FileAccess.file_exists(savegame1) and file.is_open():
		gamedata = JSON.parse_string(file.get_as_text())
		file.close()
		#data = JSON.get_data()
		print(gamedata)
		print(gamedata.player_health)
		print("Savegame loaded")
