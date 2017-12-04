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
	"4": ["snake", "fox", "wolf", "cat", "mouse", "parrot"],
	"5": []
}

const win_con = {
	"1": 60,
	"2": 5,
	"3": -50,
	"4": -125,
	"5": -180
}

const text_guide = {
	"1": "LEVEL 1\nClick the pet you want to let in.\nFill the house up to the line with pets.\nRemember:\n1. Cat eats Mouse.",
	"2": "LEVEL 2\n1. Cat eats Parrot.\n2. Wolf eats Dog & Cat.",
	"3": "LEVEL 3\n1. Fox eats Chicken & Frog.\n2. Lion eats Cat, Chicken & Fox.",
	"4": "LEVEL 4\n1. Cat eats Mouse & Parrot.\n2. Fox eats Mouse.\n3. Snake eats Mouse.\n4. Wolf eats Cat & Mouse.",
	"5": "FINAL ENDLESS RANDOMIZED LEVEL\n\n\n\n\n\n\n\n\n\nThank you for playing!"
}
