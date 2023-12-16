ESX = exports['es_extended']:getSharedObject()  


RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job
end)

local job = ESX.PlayerData.job
local jobName = job.name
local jobGrade = job.grade_label

RegisterNetEvent('idcard')
AddEventHandler('idcard', function()
TriggerEvent('jsfour-idcard:openuseid', GetPlayerServerId(NetworkGetPlayerIndexFromPed()))
end)

lib.registerContext({
    id = 'menuf5',
    title = 'Menu F5',
    options = {
        {
            title = 'Porte Feuille',
            arrow = true,
            icon = 'bars',
            menu = 'portefeuille',   
        },
        {
            title = 'Votre grade',
            arrow = true,
            icon = 'bars',
            menu = 'votregrade',   
        },
        {
            title = 'Votre Id',
            arrow = true,
            icon = 'bars',
            menu = 'votreid',   
        },
        {
            title = 'Votre job',
            arrow = true,
            icon = 'bars',
            menu = 'votrejob',   
        },




    }
})



lib.registerContext({
    id = 'portefeuille',
    title = 'Porte Feuille',
    options = {
        {
            title = 'Carte identite',
            event = 'idcard'
        },
       {
            title = 'Permis de conduire',
            event = 'jsfour-idcard:openusedriver'
        },
       {
            title = 'Permis darmes',
            event = 'jsfour-idcard:openuseweapon'
        },


    }
})


lib.registerContext({
    id = 'votregrade',
    title = 'Votre grade',
    options = {
        {
            title = 'votre grade',
             description = "Grade: " ..jobGrade
        },


    }
})


lib.registerContext({
    id = 'votrejob',
    title = 'Votre job',
    options = {
        {
            title = 'votre jobs',
             description = "Grade: " ..job.name
        },


    }
})


lib.registerContext({
    id = 'votreid',
    title = 'Votre Id',
    options = {
        {
            title = 'votre id',
            description = "ID: " ..GetPlayerServerId(NetworkGetEntityOwner(GetPlayerPed(-1))),

        },


    }
})




Citizen.CreateThread(function()
    while true do
      Citizen.Wait(0)
      if IsControlJustPressed(0, 166) then -- para baguhin ang menu key https://docs.fivem.net/docs/game-references/controls/ pour changer la touche, to change the key
        lib.showContext('menuf5')
      end
    end
  end)
  