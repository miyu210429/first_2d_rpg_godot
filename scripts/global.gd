extends Node

var player_current_attack = false

var current_scene = "world" #ワールドの崖側
var transition_scene = false

var player_exit_cliffside_posx = 171
var player_exit_cliffside_posy = 29
var player_start_posx = 96
var player_start_posy = 121

var game_first_loadin = true

func finish_changescenes():
	if transition_scene == true:
		transition_scene = false
		if current_scene == "world":#シーンが２つしかないからif,elseという単純な条件分岐
			current_scene = "cliff_side"
		else:
			current_scene = "world"
