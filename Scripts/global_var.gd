extends Node

var level = 1

# FOOD CHAIN '' aka I'm definitely over complicating this''
# One rule: If A % B == 1: A eats B
# PRIME + 1 = non-predator
const food_chain = {
	"mouse" : 3,
	"parrot" : 5,
	"cat": 16, # 3x5+1, ---- mouse + parrot
	"dog": 8, # 7 + 1, I am the good boye
	"chicken": 14, # 13 + 1
	"fox": 127, #, --- eats chicken, mouse, frog
	"wolf": 337, # --- cat dog mouse chicken
	"frog": 18,
	"snake": 19, # ---frog + mouse
	"lion": 273228817, # everything but frog and parrot
	"cthulhu": 1
}

const queue = {
	"1": ["mouse", "cat", "dog"],
	"2": ["wolf", "cat", "dog", "parrot"],
	"3": ["cat", "frog", "chicken", "fox", "lion"],
	"4": ["snake", "fox", "wolf", "cat", "mouse", "parrot"]
}

const win_con = {
	"1": 60,
	"2": 5,
	"3": -50,
	"4": -125
}

const text_guide = {
	"1": "1. Cat eats mouse",
	"2": "1. Cat eats parrot\n2. Wolf eats dog & cat",
	"3": "1. Fox eats chicken & frog\n2. Lion eats cat, chicken, fox",
	"4": "1. Cat eats mouse & parrot\n2. Fox eats mouse.\n3. Snake eats mouse\n4. Wolf eats cat & mouse"
}

const width = {
	"1": 1, "2": 1, "3": 1,
	"4": 2
}