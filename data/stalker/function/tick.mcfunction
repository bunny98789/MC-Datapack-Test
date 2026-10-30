# Ensure objectives exist
scoreboard objectives add ClownTimer dummy
scoreboard objectives add SpawnTimer dummy

# -------------------------------------------------------------
# NIGHT-ONLY SINGLE SPAWN CONTROL
# -------------------------------------------------------------
function stalker:spawn

# -------------------------------------------------------------
# CHARGE TIMER LOGIC
# -------------------------------------------------------------
# 1. Increment Timer (20 ticks = 1 second)
execute as @e[type=zombie,tag=KillerClown] run scoreboard players add @s ClownTimer 1

# 2. TRIGGER CHARGE (At 400 ticks / 20 seconds, tag with "Charging")
execute as @e[type=zombie,tag=KillerClown,scores={ClownTimer=400..}] run tag @s add Charging
execute as @e[type=zombie,tag=KillerClown,scores={ClownTimer=400..}] run effect give @s minecraft:speed 4 2 true
execute as @e[type=zombie,tag=KillerClown,scores={ClownTimer=400..}] run playsound minecraft:entity.ghast.scream host @a ~ ~ ~ 1 0.5

# RESET CHARGE MODE after 80 ticks (4 seconds of charging)
execute as @e[type=zombie,tag=KillerClown,scores={ClownTimer=480..}] run tag @s remove Charging
execute as @e[type=zombie,tag=KillerClown,scores={ClownTimer=480..}] run scoreboard players set @s ClownTimer 0

# -------------------------------------------------------------
# PASSIVE STALKING (Only runs when NOT charging)
# -------------------------------------------------------------
execute as @e[type=zombie,tag=KillerClown,tag=!Charging] at @s run tp @s ~ ~ ~ facing entity @p eyes
execute as @e[type=zombie,tag=KillerClown,tag=!Charging] at @s if entity @p[distance=..8] run tp @s ^ ^ ^-0.35 facing entity @p eyes
execute as @e[type=zombie,tag=KillerClown,tag=!Charging] at @s if entity @p[distance=12..30] run tp @s ^ ^ ^0.25 facing entity @p eyes
execute as @e[type=zombie,tag=KillerClown,tag=!Charging] at @s if entity @p[distance=30..] run tp @s @p ^ ^ ^-10 facing entity @p eyes

# -------------------------------------------------------------
# ACTIVE CHARGE BEHAVIOR & WALL CLIMBING
# -------------------------------------------------------------
# Move directly toward player fast during charge
execute as @e[type=zombie,tag=KillerClown,tag=Charging] at @s run tp @s ^ ^ ^0.45 facing entity @p eyes

# WALL CLIMBING: Boost upward if hitting a wall
execute as @e[type=zombie,tag=KillerClown] at @s unless block ^ ^ ^0.6 minecraft:air unless block ^ ^ ^0.6 minecraft:cave_air run tp @s ~ ~0.4 ~ facing entity @p eyes

# -------------------------------------------------------------
# ATTACK STRIKE & STATUS EFFECTS
# -------------------------------------------------------------
execute at @e[type=zombie,tag=KillerClown] run effect give @a[distance=..1.8] minecraft:blindness 4 1 true
execute at @e[type=zombie,tag=KillerClown] run effect give @a[distance=..1.8] minecraft:slowness 4 2 true
