local SlideScreen = {}
SlideScreen.__index = SlideScreen

function SlideScreen.new(config)
    local screen = {}
    setmetatable(screen, SlideScreen)

    screen._config = config

    return screen
end

function SlideScreen:getApplication()
    return self._application
end

function SlideScreen:setApplication(application)
    self._application = application
end

function SlideScreen:create()
end

function SlideScreen:destroy()
end

function SlideScreen:update(dt)
end

function SlideScreen:draw()
    local windowWidth, windowHeight = love.window.getDimensions()
    local lines = self._config.lines
    local fontScale = self._config.fontScale or 4 / 5
    local defaultLineHeight = 1 / #lines

    local totalLineHeight = 0
    for i, line in ipairs(self._config.lines) do
        local lineHeight = line.height or defaultLineHeight
        totalLineHeight = totalLineHeight + lineHeight
    end

    local y = 0.5 - 0.5 * totalLineHeight
    for i, line in ipairs(self._config.lines) do
        local lineHeight = line.height or defaultLineHeight
        local fontSize = lineHeight * windowHeight * fontScale
        if line.text then
            local textY = y + 0.5 * (1 - fontScale) * lineHeight
            love.graphics.setFont(self._application:createFont(fontSize))
            love.graphics.printf(line.text or "", -windowWidth, textY * windowHeight, 3 * windowWidth, "center")
        end
        y = y + lineHeight
    end
end

function SlideScreen:keypressed(key, isrepeat)
    if not isrepeat then
        local name = self._config.links and self._config.links[key]
        if name then
            local screen = self._application:createScreen(name)
            self._application:setScreen(screen)
        end
    end
end

function SlideScreen:keyreleased(key, isrepeat)
end

return SlideScreen
