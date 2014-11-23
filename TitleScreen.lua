local TitleScreen = {}
TitleScreen.__index = TitleScreen

function TitleScreen.new(config)
    local screen = {}
    setmetatable(screen, TitleScreen)

    screen._config = config

    return screen
end

function TitleScreen:getApplication()
    return self._application
end

function TitleScreen:setApplication(application)
    self._application = application
end

function TitleScreen:create()
end

function TitleScreen:destroy()
end

function TitleScreen:update(dt)
end

function TitleScreen:draw()
    local windowWidth, windowHeight = love.window.getDimensions()
    local fontSize = 0.25 * windowHeight
    love.graphics.setFont(self._application:createFont(fontSize))
    love.graphics.printf("PONG", 0, 0.5 * windowHeight - 0.5 * fontSize, windowWidth, "center")
end

function TitleScreen:keypressed(key, isrepeat)
    if key == "right" and not isrepeat then
        local screen = self._application:createScreen("game", {})
        self._application:setScreen(screen)
    end
end

function TitleScreen:keyreleased(key, isrepeat)
end

return TitleScreen
