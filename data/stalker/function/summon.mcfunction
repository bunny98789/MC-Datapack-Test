# Ensure the scoreboard timer objective exists
scoreboard objectives add ClownTimer dummy

# Summon the Killer Clown facing the player
execute at @p run summon zombie ~ ~ ~10 {CustomName:'{"text":"Killer Clown"}',CustomNameVisible:1b,Health:30f,Tags:["KillerClown"],Attributes:[{Name:"generic.max_health",Base:30f},{Name:"generic.movement_speed",Base:0.25f}]}

# Reset timer for all clowns
scoreboard players set @e[type=zombie,tag=KillerClown] ClownTimer 0
