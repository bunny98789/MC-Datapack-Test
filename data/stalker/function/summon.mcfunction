# Spawns the Killer Clown Zombie facing the player
execute at @p run summon zombie ~ ~ ~10 {CustomName:'{"text":"Killer Clown"}',CustomNameVisible:1b,Health:30f,Tags:["KillerClown"],Attributes:[{Name:"generic.max_health",Base:30f},{Name:"generic.movement_speed",Base:0.25f}]}
