local QBCore = exports['qb-core']:GetCoreObject()

local function GetTeleportFromId(teleports, id)
    for _,teleport in pairs(teleports) do
        if teleport.id == id then return teleport end
    end
end

RegisterNetEvent('Teleport:Server:ToLocation', function(currenLocationName, currentTeleportId, targetLocation, zoneName)
    local src = source
    local currentLocation = GetTeleportFromId(Config.Teleports[currenLocationName].teleports, currentTeleportId)
    

    if targetLocation == nil then
        TriggerClientEvent('QBCore:Notify', src, "It leads nowhere...", 'error', 5000)
    end

    local player_coords = GetEntityCoords(GetPlayerPed(src))
    local dist = -1
    if currentLocation.coords.x == nil then
        for _,coord in pairs(currentLocation.coords) do
            if coord.id == zoneName then
                dist = #(player_coords.xy - coord.coords.xy)
            end
        end
    else
        dist = #(player_coords.xy - currentLocation.coords.xy)
    end

    local isAuthorized = true
    local Player = QBCore.Functions.GetPlayer(src)
    if targetLocation.requiredItem then
        local item = Player.Functions.GetItemByName(targetLocation.requiredItem)
         isAuthorized = item ~= nil
    elseif targetLocation.job and targetLocation.job ~= '' and targetLocation.job ~= 'unemployed' then
        isAuthorized = Player.PlayerData.job.name == targetLocation.job
    end

    if isAuthorized and dist <= currentLocation.range then
        if currentLocation.soundfile then
            TriggerEvent('InteractSound_SV:PlayOnOne', src, currentLocation.soundfile, 0.5)
        end
        print(targetLocation.coords.z)
        TriggerClientEvent("Teleport:Client:ToLocation", src, targetLocation, zoneName)
    else
         TriggerClientEvent('QBCore:Notify', src, "The door is locked...", 'error', 5000)
    end
end)

