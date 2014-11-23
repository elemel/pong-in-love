local GameScreen = {}
GameScreen.__index = GameScreen

function GameScreen.new(config)
    local screen = {}
    setmetatable(screen, GameScreen)

    screen._config = config

    return screen
end

function GameScreen:getApplication()
    return self._application
end

function GameScreen:setApplication(application)
    self._application = application
end

function GameScreen:create()
end

function GameScreen:destroy()
end

function GameScreen:update(dt)
end

function GameScreen:draw()
    local windowWidth, windowHeight = love.window.getDimensions()
    local fontSize = 0.25 * windowHeight
    love.graphics.setFont(self._application:createFont(fontSize))
    love.graphics.printf("GAME", 0, 0.5 * windowHeight - 0.5 * fontSize, windowWidth, "center")
end

function GameScreen:keypressed(key, isrepeat)
    if key == "left" and not isrepeat then
        local screen = self._application:createScreen("title", {})
        self._application:setScreen(screen)
    end
end

function GameScreen:keyreleased(key, isrepeat)
end

return GameScreen
