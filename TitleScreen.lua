local TitleScreen = {}
TitleScreen.__index = TitleScreen

function TitleScreen.new()
    local screen = {}
    setmetatable(screen, TitleScreen)
    return screen
end

function TitleScreen:create()
end

function TitleScreen:destroy()
end

function TitleScreen:update(dt)
end

function TitleScreen.draw()
    local windowWidth, windowHeight = love.window.getDimensions()
    local fontSize = 0.25 * windowHeight
    love.graphics.setFont(love.graphics.newFont(fontSize))
    love.graphics.printf("PONG", 0, 0.5 * windowHeight - 0.5 * fontSize, windowWidth, "center")
end

return TitleScreen
