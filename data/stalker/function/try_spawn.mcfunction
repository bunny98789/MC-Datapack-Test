# Check if it is night time (13000 to 23000 ticks) and spawn 15 blocks behind the player
execute if time query daytime 13000..23000 at @p run summon zombie ^ ^ ^-15 {CustomName:'{"text":"Killer Clown"}',CustomNameVisible:1b,Health:30f,Tags:["KillerClown"],Attributes:[{Name:"generic.max_health",Base:30f},{Name:"generic.movement_speed",Base:0.25f}]}

# Reset clown timer on spawn
scoreboard players set @e[type=zombie,tag=KillerClown] ClownTimer 0
