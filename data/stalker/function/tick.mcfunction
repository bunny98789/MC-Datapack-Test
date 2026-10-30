# Force the clown to stare down nearby players
execute as @e[type=zombie,tag=KillerClown] at @s run tp @s ~ ~ ~ facing entity @p

# Apply slowness/blindness if the player gets within 2 blocks
execute at @e[type=zombie,tag=KillerClown] run effect give @a[distance=..2] minecraft:blindness 3 1
execute at @e[type=zombie,tag=KillerClown] run effect give @a[distance=..2] minecraft:slowness 3 2
