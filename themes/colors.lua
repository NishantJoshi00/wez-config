local themes = {
    ["kanagawa-dragon"] = require("themes.kanagawa-dragon"),
}

local current_hour = tonumber(os.date("%H"));

return themes["kanagawa-dragon"]
