# 1. Continuous Stare: Force the clown to constantly turn toward the nearest player
execute as @e[type=zombie,tag=KillerClown] at @s run tp @s ~ ~ ~ facing entity @p eyes

# 2. Back Away: If player gets closer than 8 blocks, step backward (away from player)
execute as @e[type=zombie,tag=KillerClown] at @s if entity @p[distance=..8] run tp @s ^ ^ ^-0.35 facing entity @p eyes

# 3. Creep Forward: If player gets farther than 12 blocks, step forward (toward player)
execute as @e[type=zombie,tag=KillerClown] at @s if entity @p[distance=12..30] run tp @s ^ ^ ^0.25 facing entity @p eyes

# 4. Teleport Catch-up: If player gets way too far (>30 blocks), instantly relocate behind them
execute as @e[type=zombie,tag=KillerClown] at @s if entity @p[distance=30..] run tp @s @p ^ ^ ^-10 facing entity @p eyes

# 5. Close-Range Attack Effects: Slowness + Blindness if player corners it within 2 blocks
execute at @e[type=zombie,tag=KillerClown] run effect give @a[distance=..2] minecraft:blindness 3 1 true
execute at @e[type=zombie,tag=KillerClown] run effect give @a[distance=..2] minecraft:slowness 3 2 true
