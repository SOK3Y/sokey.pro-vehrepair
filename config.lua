name = GetCurrentResourceName()

Config = {}

Config['RepairTime'] = 10 -- in seconds

function Notify(title, description, type)
    lib.notify({
        title = title or 'Powiadomienie',
        description = description,
        type = type or 'info',
    })
end