Config = {}

--isPlaying should not be changed!
--name of the radio stations:
-- "RADIO_01_CLASS_ROCK",              -- Los Santos Rock Radio
-- "RADIO_02_POP",                     -- Non-Stop-Pop FM
-- "RADIO_03_HIPHOP_NEW",              -- Radio Los Santos
-- "RADIO_04_PUNK",                    -- Channel X
-- "RADIO_05_TALK_01",                 -- West Coast Talk Radio
-- "RADIO_06_COUNTRY",                 -- Rebel Radio
-- "RADIO_07_DANCE_01",                -- Soulwax FM
-- "RADIO_08_MEXICAN",                 -- East Los FM
-- "RADIO_09_HIPHOP_OLD",              -- West Coast Classics
-- "RADIO_11_TALK_02",                 -- Blaine County Radio
-- "RADIO_12_REGGAE",                  -- Blue Ark
-- "RADIO_13_JAZZ",                    -- Worldwide FM
-- "RADIO_14_DANCE_02",                -- FlyLo FM
-- "RADIO_15_MOTOWN",                  -- The Lowdown 91.1
-- "RADIO_16_SILVERLAKE",              -- Radio Mirror Park
-- "RADIO_17_FUNK",                    -- Space 103.2
-- "RADIO_18_90S_ROCK",                -- Vinewood Boulevard Radio
-- "RADIO_19_USER",                    -- Self Radio
-- "RADIO_20_THELAB",                  -- The Lab
-- "RADIO_21_DLC_XM17",                -- Blonded Los Santos 97.8 FM
-- "RADIO_22_DLC_BATTLE_MIX1_RADIO",   -- Los Santos Underground Radio
-- "RADIO_23_DLC_XM19_RADIO",          -- iFruit Radio
-- "RADIO_27_DLC_PRHEI4",              -- Still Slipping Los Santos
-- "RADIO_34_DLC_HEI4_KULT",           -- Kult FM
-- "RADIO_35_DLC_HEI4_MLR",            -- The Music Locker
-- "RADIO_36_AUDIOPLAYER",             -- Media Player
-- "RADIO_37_MOTOMAMI"                 -- MOTOMAMI Los Santos

Config.radios = {
    {
        isPlaying = false, --dont change
        name = 'RADIO_02_POP',
        data = {
            url = 'https://icast.connectmedia.hu/5201/live.mp3', --streaming URL
            volume = 0.2, --default volume
            name = 'Rádió 1' --not working right now
        }
    },
    {
        isPlaying = false,
        name = 'RADIO_03_HIPHOP_NEW',
        data = {
            url = 'https://mr-stream.connectmedia.hu/4738/mr2.mp3',
            volume = 0.2,
            name = 'Petofi Rádió'
        }
    },
    {
        isPlaying = false,
        name = 'RADIO_04_PUNK',
        data = {
            url = 'https://icast.connectmedia.hu/5001/live.mp3',
            volume = 0.2,
            name = 'Retro Rádió'
        }
    }
}