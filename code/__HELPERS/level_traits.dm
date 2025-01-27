// Helpers for checking whether a z-level conforms to a specific requirement

// Basic levels
#define is_centcom_level(z) SSmapping.level_trait(z, ZTRAIT_CENTCOM)

#define is_station_level(z) SSmapping.level_trait(z, ZTRAIT_STATION)

#define is_mining_level(z) SSmapping.level_trait(z, ZTRAIT_MINING)

#define is_reebe(z) SSmapping.level_trait(z, ZTRAIT_REEBE)

#define is_reserved_level(z) SSmapping.level_trait(z, ZTRAIT_RESERVED)

#define is_away_level(z) SSmapping.level_trait(z, ZTRAIT_AWAY)

#define is_vr_level(z) SSmapping.level_trait(z, ZTRAIT_VR)

#define is_dungeon_level(z) SSmapping.level_trait(z, ZTRAIT_DUNGEON)

#define is_above_level(z) SSmapping.level_trait(z, ZTRAIT_ABOVE)

#define is_secret_level(z) SSmapping.level_trait(z, ZTRAIT_SECRET)
