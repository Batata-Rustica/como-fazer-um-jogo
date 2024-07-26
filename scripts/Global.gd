extends Node

var music_playing = 1
var change_music = 0
var hearts = 3
var player: CharacterBody2D

var weapon_equipped: bool


func brainstorm_entered():
	change_music = 1
	music_playing = 2
