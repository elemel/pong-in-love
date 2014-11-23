local Application = {}
Application.__index = Application

function Application.new(screenFactory, fontFactory)
    local application = {}
    setmetatable(application, Application)

    application._screenFactory = screenFactory
    application._fontFactory = fontFactory

    return application
end

function Application:createScreen(name)
    return self._screenFactory:create(name)
end

function Application:createFont(name)
    return self._fontFactory:create(name)
end

function Application:getScreen()
    return self._screen
end

function Application:setScreen(screen)
    if self._screen then
        self._screen:destroy()
        self._screen:setApplication(nil)
    end
    self._screen = screen
    if self._screen then
        self._screen:setApplication(self)
        self._screen:create()
    end
end

function Application:update(dt)
    if self._screen then
        self._screen:update(dt)
    end
end

function Application:draw()
    if self._screen then
        self._screen:draw()
    end
end

function Application:keypressed(key, isrepeat)
    if self._screen then
        self._screen:keypressed(key, isrepeat)
    end
end

function Application:keyreleased(key, isrepeat)
    if self._screen then
        self._screen:keyreleased(key, isrepeat)
    end
end

return Application
