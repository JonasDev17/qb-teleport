JustTeleported = false
MenuItemId = nil
CurrentLocation = nil
CurrentZone = nil
CurrentTeleport = nil

local function CreateTeleportBoxZone(name, coords, boxWidth, boxLength)
    local pos = vector3(coords.x, coords.y, coords.z)
    return BoxZone:Create(pos, boxWidth and boxWidth or 3, boxLength and boxLength or 3, {
        name = name,
        offset = {0.0, 0.0, 0.0},
        debugPoly = Config.DebugPoly,
        heading = coords.w,
        minZ = pos.z - 1.0,
        maxZ = pos.z + 4.0,
        coords = pos,
    })
end

CreateThread(function()
    for k, location in pairs(Config.Teleports) do
        for _,teleport in pairs(location.teleports) do
            local zones = {}
            if type(teleport.coords) == "table" then
                for _, coord in pairs(teleport.coords) do
                    zones[#zones+1] = CreateTeleportBoxZone(coord.id, coord.coords, teleport.boxZoneWidth and teleport.boxZoneWidth or location.boxZoneWidth, teleport.boxZoneLength and teleport.boxZoneLength or location.boxZoneLength)
                end
            else
               zones[1] = CreateTeleportBoxZone(teleport.id, teleport.coords, teleport.boxZoneWidth and teleport.boxZoneWidth or location.boxZoneWidth, teleport.boxZoneLength and teleport.boxZoneLength or location.boxZoneLength)
            end
            local comboZone = ComboZone:Create(zones, {name = "teleportCombo"})
            comboZone:onPlayerInOut(function(isPointInside, _, z)
                local canTeleport = IsPedInAnyVehicle(PlayerPedId(), false) and (location.allowVehicles or teleport.allowVehicles)  or not IsPedInAnyVehicle(PlayerPedId(), false)
                if isPointInside then
                    CurrentLocation = k
                    CurrentZone = z.name
                    CurrentTeleport = teleport.id
                    if canTeleport then
                        exports['qb-core']:DrawText(teleport.drawText or location.drawText , teleport.drawTextLocation or location.drawTextLocation)
                        MenuItemId = exports['qb-radialmenu']:AddOption({
                            id = 'teleport',
                            title = teleport.radialTitle or location.radialTitle,
                            icon = 'door-open',
                            type = 'client',
                            event = 'qb-teleport:client:openMenu',
                            shouldClose = true,
                            data = {
                                teleports = location.teleports
                            }
                        }, MenuItemId)
                    end
                else
                    if canTeleport then
                        exports['qb-core']:HideText()
                        if MenuItemId ~= nil then
                            exports['qb-radialmenu']:RemoveOption(MenuItemId)
                            MenuItemId = nil
                            CurrentLocation = nil
                            CurrentTeleport = nil
                            CurrentZone = nil
                        end
                    end
                end
            end)
        end
    end
end)

AddEventHandler('qb-teleport:client:openMenu', function(data)
    local teleports = data
    if data.data and data.data.teleports then
        teleports = data.data.teleports
    end
    TeleportMenu(teleports)
end)

local function teleportToCoords(location, zoneName)
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    DoScreenFadeOut(800)
    while not IsScreenFadedOut() do Wait(0) end
    local coords = veh ~= 0 and location.vehicleCoords or location.coords
    if coords.x == nil then
        for _,coord in pairs(location.coords) do
            if coord.id == zoneName then
                SetEntityCoords(veh ~= 0 and veh or ped, coords.coords.x, coord.coords.y, coord.coords.z)
                SetEntityHeading(veh ~= 0 and veh or ped, coord.coords.w)
            end
        end
    else
        SetEntityCoords(veh ~= 0 and veh or ped, coords.x, coords.y, coords.z)
        if coords.w ~= nil then
            SetEntityHeading(veh ~= 0 and veh or ped, coords.w)
        end
    end
    DoScreenFadeIn(800)
    JustTeleported = true
end

function TeleportMenu(teleports)
    local teleportMenu = {{header = Config.Teleports[CurrentLocation].header, isMenuHeader = true}}
    for  i=#teleports,1,-1 do
        local tp = teleports[i]
        local canTeleport = IsPedInAnyVehicle(PlayerPedId(), false) and teleports[i].allowVehicles  or not IsPedInAnyVehicle(PlayerPedId(), false)
        local params = {
            event = "Teleport:Client:Location",
            args = {
                targetLocation = tp
            }
        }
        if tp.coords.x == nil then
            params = {
                event = "qb-teleport:client:openMenu",
                args = {
                    data = {
                        teleports = tp.coords
                    }
                }
            }
        end
        teleportMenu[#teleportMenu + 1] = {
            header = tp.title,
            txt = "",
            disabled = tp.id == CurrentTeleport or not canTeleport,
            params = params
        }
    end

    teleportMenu[#teleportMenu + 1] = {
        header = 'Close',
        txt = "",
        params = {
            event = "qb-menu:client:closeMenu"
        }

    }
    exports['qb-menu']:openMenu(teleportMenu)
end

ResetTeleport = function()
    SetTimeout(1000, function() JustTeleported = false end)
end

RegisterNetEvent('Teleport:Client:Location', function(data)
    if not JustTeleported then
        local canTeleport = IsPedInAnyVehicle(PlayerPedId(), false) and data.targetLocation.allowVehicles  or not IsPedInAnyVehicle(PlayerPedId(), false)
        if  canTeleport then
            TriggerServerEvent('Teleport:Server:ToLocation', CurrentLocation, CurrentTeleport, data.targetLocation, data.targetLocation.id)
        end
    end
end)

RegisterNetEvent("Teleport:Client:ToLocation", function(location, zoneName)
    teleportToCoords(location, zoneName)
    ResetTeleport()
end)

