local FontFactory = {}
FontFactory.__index = FontFactory

function FontFactory.new()
    local factory = {}
    setmetatable(factory, FontFactory)

    factory._fonts = {}

    return factory
end

function FontFactory:create(size)
    size = math.floor(size + 0.5)
    if not self._fonts[size] then
        self._fonts[size] = love.graphics.newFont(size)
    end
    return self._fonts[size]
end

return FontFactory
