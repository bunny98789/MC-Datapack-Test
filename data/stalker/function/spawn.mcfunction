# Ensure spawn timer objective exists
scoreboard objectives add SpawnTimer dummy

# Only increment spawn clock if NO clown currently exists
execute unless entity @e[type=zombie,tag=KillerClown] run scoreboard players add #World SpawnTimer 1

# Attempt spawn every 600 ticks (~30 seconds) during nighttime
execute if score #World SpawnTimer matches 600.. unless entity @e[type=zombie,tag=KillerClown] run function stalker:try_spawn

# Reset spawn timer if it goes over limit
execute if score #World SpawnTimer matches 600.. run scoreboard players set #World SpawnTimer 0
