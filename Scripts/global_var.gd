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
	"fox": 15, #, --- eats chicken
	"wolf": 337, # --- cat dog mouse chicken
	"frog": 18,
	"snake": 19, # ---frog + mouse
	"lion": 2151409, # everything but frog and parrot
	"cthulhu": 1
}

const queue = {
	"1": ["mouse", "cat", "dog"],
	"2": ["wolf", "cat", "dog", "parrot"],
	"3": ["mouse", "frog", "chicken", "fox", "cat"]
}

const win_con = {
	"1": 60,
	"2": 5,
	"3": -20
}

const text_guide = {
	"1": "1. Cat eats mouse",
	"2": "1. Cat eats parrot \n 2. Wolf eats dog and cat",
	"3": "Fuck off"
}