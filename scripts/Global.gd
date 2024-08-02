extends Node

var music_playing = 1
var change_music = 0

var hearts = 3

var player: CharacterBody2D
var player_alive: bool
var player_str = 16
var flying_damage_zone: Area2D
var flying_str = 12
var weapon_equipped: bool

var platform_score = 0
var platform_score_history: int

func brainstorm_entered():
	change_music = 1
	music_playing = 2

func brainstorm_exit():
	change_music = 1
	music_playing = 1
