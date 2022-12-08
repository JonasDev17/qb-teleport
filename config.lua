Config = {}
Config.DebugPoly = false
Config.Teleports = {
    ['moneylaundering'] = {
        drawText = 'Door',
        drawTextLocation = 'left',
        radialTitle = "Door",
        boxZoneWidth = 2,
        boxZoneLength = 2,
        header = 'Unknown Location',
        debug = false,
        allowVehicles = false,
        teleports = {
            [1] = {
                id="exit",
                title = "Inside",
                coords = vector4(1138.02, -3199.04, -40.67, 351.12),
                requiredItem = 'green_key', -- optional
                range = 2.5,
                soundfile = "doorunlock", -- soundfile in [standalon]/interact-sound/client/html/sounds
                soundDistance = 1.0,
            },
            [2] = {
                id = "entrance",
                title = "Outside",
                coords = vector4(1002.892334, -2414.186279, 30.508989, 354.516083),
                requiredItem = 'green_key',
                range = 1.5,
                soundfile = "doorunlock",
                soundDistance = 1.0,
            },
        }
    },
    ['weaponcrafting'] = {
        drawText = 'Door',
        drawTextLocation = 'left',
        radialTitle = "Door",
        boxZoneWidth = 2,
        boxZoneLength = 2,
        header = 'Unknown Location',
        debug = false,
        teleports = {
            [1] = {
                id="roof",
                title = "Entrance",
                coords = vector4(1242.202637, -3196.683838, 6.028232, 281.251617),
                requiredItem = 'purple_key',
                range = 2.5,
                soundfile = "elevator",
                soundDistance = 1.0
            },
            [2] = {
                id = "basement",
                title = "Basement",
                coords = vector4(857.21, -3250.11, -99.32, 357.46),
                requiredItem = 'purple_key',
                range = 2.5,
                soundfile = "elevator",
                soundDistance = 1.0
            },
        }
    },
    --Maze Bank
    ['mazebank'] = {
        drawText = 'Elevator',
        drawTextLocation = 'left',
        radialTitle = "Elevator",
        boxZoneWidth = 3,
        boxZoneLength = 3,
        header = 'Maze Bank',
        debug = false,
        teleports = {
            [1] = {
                id = "underground",
                title = "Underground",
                coords = vector4(-84.18, -822.76, 35.03, 343.43),
                vehCoords = vector4(-84.18, -822.76, 35.03, 343.43),
                range = 6.0,
                boxZoneWidth = 8,
                boxZoneLength = 8,
                soundfile = "elevator",
                soundDistance = 1.0,
                allowVehicles = true,
            },
            [2] = {
                id = "ground",
                title = "Ground floor",
                coords = {
                    [1] = {
                        id = "frontdoor1",
                        title = "Front Door 1",
                        coords = vector4(-66.9, -802.48, 43.23, 150.95),
                        range = 2.5,
                        soundfile = "elevator",
                        soundDistance = 1.0,
                        --allowVehicles = true
                    },
                    [2] = {
                        id = "frontdoor2",
                        title = "Front Door 2",
                        coords = vector4(-71.29, -801.03, 43.23, 338.55),
                        range = 2.5,
                        soundfile = "elevator",
                        soundDistance = 1.0
                    },
                },
                range = 2.5,
                soundfile = "elevator",
                soundDistance = 1.0,
                allowVehicles = false,
            },
            [3] = {
                id = "floor22",
                title = "Floor 22",
                coords = vector4(-91.86, -821.20, 221.00, 248.3),
                drawText = 'Elevator',
                range = 2.5,
                soundfile = "elevator",
                soundDistance = 1.0
            },
            [4] = {
                id = "floor26",
                title = "Floor 26",
                coords = vector4(-76.69, -830.38, 242.39, 79.89),
                drawText = 'Elevator',
                range = 2.5,
                soundfile = "elevator",
                soundDistance = 1.0
            },
            [5] = {
                id = "floor33",
                title = "Floor 33",
                coords = vector4(-71.41, -811.22, 284.00, 156.45),
                vehicleCoords = vector4(-72.50, -814.18, 283.58, 157.41),
                boxZoneWidth = 10,
                boxZoneLength = 8,
                drawText = 'Elevator',
                range = 6.0,
                soundfile = "elevator",
                soundDistance = 1.0,
                allowVehicles = true,
            },
            [6] = {
                id = "roof",
                title = "Roof",
                coords = vector4(-74.98, -824.33, 320.29, 346.57),
                drawText = 'Elevator',
                range = 2.5,
                soundfile = "elevator",
                soundDistance = 1.0
            },
        }
    },
    ['eclipsetower'] = {
        drawText = 'Elevator',
        drawTextLocation = 'left',
        radialTitle = "Elevator",
        boxZoneWidth = 3,
        boxZoneLength = 3,
        header = 'Eclipse Tower',
        debug = false,
        teleports = {
            [1] = {
                id = 'ground',
                coords = vector4(-770.58, 312.93, 84.7, 173.63),
                title = 'Ground floor',
                range = 2.5,
                soundfile = "elevator",
                soundDistance = 1.0,
            },
            [2] = {
                id = 'floor14',
                coords = vector4(-781.85, 325.96, 175.8, 175.87),
                title = "Floor 14",
                range = 2.5,
                soundfile = "elevator",
                soundDistance = 1.0
            },
            [3] = {
                id = 'floor15',
                coords = vector4(-787.45, 315.73, 186.91, 273.17),
                title = "Floor 15",
                range = 2.5,
                soundfile = "elevator",
                soundDistance = 1.0
            },
            [4] = {
                id = 'floor19',
                coords = vector4(-785.21, 323.8, 211.0, 271.35),
                title = "Floor 19",
                range = 2.5,
                soundfile = "elevator",
                soundDistance = 1.0
            },
            [5] = {
                id = 'floor21',
                coords = vector4(-781.98, 326.23, 222.26, 190.06),
                title = "Floor 21",
                range = 2.5,
                soundfile = "elevator",
                soundDistance = 1.0
            },
            [6] = {
                id = 'roof',
                coords = vector4(-754.91, 334.69, 229.64, 81.08),
                title = "Roof",
                range = 2.5,
                soundfile = "elevator",
                soundDistance = 1.0
            },
        }
    },
}



