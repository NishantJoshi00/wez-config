local themes = {
    ["kanagawa-dragon"] = require("themes.collection.kanagawa-dragon"),
}

local current_hour = tonumber(os.date("%H"));

return themes["kanagawa-dragon"]
