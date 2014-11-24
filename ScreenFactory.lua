local ScreenFactory = {}
ScreenFactory.__index = ScreenFactory

function ScreenFactory.new()
    local factory = {}
    setmetatable(factory, ScreenFactory)

    factory._creators = {}
    factory._configs = {}
    factory._screens = {}

    return factory
end

function ScreenFactory:getCreator(type_)
    return self._creators[name]
end

function ScreenFactory:setCreator(type_, creator)
    self._creators[type_] = creator
end

function ScreenFactory:getConfig(name)
    return self._configs[name]
end

function ScreenFactory:setConfig(name, config)
    self._configs[name] = config
end

function ScreenFactory:create(name)
    if not self._screens[name] then
        local config = self._configs[name]
        local creator = self._creators[config.type_]
        self._screens[name] = creator(config)
    end
    return self._screens[name]
end

return ScreenFactory
