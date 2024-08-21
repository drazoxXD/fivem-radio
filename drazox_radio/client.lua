local customRadios = {}
local isPlaying = false
local index = -1
local volume = GetProfileSetting(306) / 10
local previousVolume = volume
local availableRadios =  {
    "RADIO_01_CLASS_ROCK",              -- Los Santos Rock Radio
    "RADIO_02_POP",                     -- Non-Stop-Pop FM
    "RADIO_03_HIPHOP_NEW",              -- Radio Los Santos
    "RADIO_04_PUNK",                    -- Channel X
    "RADIO_05_TALK_01",                 -- West Coast Talk Radio
    "RADIO_06_COUNTRY",                 -- Rebel Radio
    "RADIO_07_DANCE_01",                -- Soulwax FM
    "RADIO_08_MEXICAN",                 -- East Los FM
    "RADIO_09_HIPHOP_OLD",              -- West Coast Classics
    "RADIO_11_TALK_02",                 -- Blaine County Radio
    "RADIO_12_REGGAE",                  -- Blue Ark
    "RADIO_13_JAZZ",                    -- Worldwide FM
    "RADIO_14_DANCE_02",                -- FlyLo FM
    "RADIO_15_MOTOWN",                  -- The Lowdown 91.1
    "RADIO_16_SILVERLAKE",              -- Radio Mirror Park
    "RADIO_17_FUNK",                    -- Space 103.2
    "RADIO_18_90S_ROCK",                -- Vinewood Boulevard Radio
    "RADIO_19_USER",                    -- Self Radio
    "RADIO_20_THELAB",                  -- The Lab
    "RADIO_21_DLC_XM17",                -- Blonded Los Santos 97.8 FM
    "RADIO_22_DLC_BATTLE_MIX1_RADIO",   -- Los Santos Underground Radio
    "RADIO_23_DLC_XM19_RADIO",          -- iFruit Radio
    "RADIO_27_DLC_PRHEI4",              -- Still Slipping Los Santos
    "RADIO_34_DLC_HEI4_KULT",           -- Kult FM
    "RADIO_35_DLC_HEI4_MLR",            -- The Music Locker
    "RADIO_36_AUDIOPLAYER",             -- Media Player
    "RADIO_37_MOTOMAMI"                 -- MOTOMAMI Los Santos
}

local customRadios = Config.radios

for i, radioEntry in ipairs(customRadios) do
    local radio = radioEntry.name
    local data = radioEntry.data

    if not availableRadios[radio] then
        lib.print.error(("radio: %s is an invalid radio."):format(radio))
    else
        table.insert(customRadios, {
            isPlaying = false,
            name = radio,
            data = data
        })

        if data.name then
            AddTextEntry(radio, data.name)
        end
    end
end

for _, radioEntry in ipairs(customRadios) do
    lib.print.info(("Radio Entry: Name: %s, URL: %s, Volume: %f"):format(
        radioEntry.name,
        radioEntry.data.url,
        radioEntry.data.volume
    ))
end

RegisterNUICallback("radio:ready", function(data, cb)
    SendNUIMessage({ type = "create", radios = customRadios, volume = volume })
    previousVolume = -1
end)

SendNUIMessage({ type = "create", radios = customRadios, volume = volume })

function PlayCustomRadio(radio)
    isPlaying = true
    index = table.indexOf(customRadios, radio)
    ToggleCustomRadioBehavior()
    SendNUIMessage({ type = "play", radio = radio.name })
end

function StopCustomRadios()
    isPlaying = false
    ToggleCustomRadioBehavior()
    SendNUIMessage({ type = "stop" })
end

function ToggleCustomRadioBehavior()
    SetFrontendRadioActive(not isPlaying)

    if isPlaying then
        StartAudioScene("DLC_MPHEIST_TRANSITION_TO_APT_FADE_IN_RADIO_SCENE")
    else
        StopAudioScene("DLC_MPHEIST_TRANSITION_TO_APT_FADE_IN_RADIO_SCENE")
    end
end

-- Utility function to find index of a table value
function table.indexOf(tbl, value)
    for i, v in ipairs(tbl) do
        if v == value then
            return i
        end
    end
    return -1
end


local function mainRadio()
    CreateThread(function()
        while cache.vehicle do
            if IsPlayerVehicleRadioEnabled() then
                local playerRadioStationName = GetPlayerRadioStationName()
                local customRadio = nil
                print(playerRadioStationName)
                for _, radio in ipairs(customRadios) do
                    if radio.name == playerRadioStationName then
                        customRadio = radio
                        break
                    end
                end
    
                if not isPlaying and customRadio then
                    PlayCustomRadio(customRadio)
                elseif isPlaying and customRadio and table.indexOf(customRadios, customRadio) ~= index then
                    StopCustomRadios()
                    PlayCustomRadio(customRadio)
                elseif isPlaying and not customRadio then
                    StopCustomRadios()
                end
            elseif isPlaying then
                StopCustomRadios()
            end
    
            volume = GetProfileSetting(306) / 10
            if previousVolume ~= volume then
                SendNUIMessage({ type = "volume", volume = volume })
                previousVolume = volume
            end
            Wait(500)
        end
    end)
end

lib.onCache('vehicle', function(value)
    if value then
        mainRadio()
    end
end)