local ScreenFactory = {}
ScreenFactory.__index = ScreenFactory

function ScreenFactory.new()
    local factory = {}
    setmetatable(factory, ScreenFactory)

    factory._creators = {}

    return factory
end

function ScreenFactory:getCreator(name)
    return self._creators[name]
end

function ScreenFactory:setCreator(name, creator)
    self._creators[name] = creator
end

function ScreenFactory:create(name, config)
    local creator = self._creators[name]
    return creator(config)
end

return ScreenFactory
