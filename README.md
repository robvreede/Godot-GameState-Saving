# Godot-GameState-Saving
Gamestate saving in Godot / Savefile

Make sure to add this to the "Project Settings" and enable this as Global Variable in the "AutoLoad" tab

You can then use these variables anywhere in your project using Global.{variable} like the Global.version variable.
Set it once, use it everywhere in the game.

You can save the game state variables using Global._save_game()

You can load the game state variables using Global._load_game()
