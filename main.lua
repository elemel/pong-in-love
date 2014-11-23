function love.load()
    love.window.setTitle("PONG")
    love.window.setMode(800, 600, {
        -- fullscreen = true,
        fullscreentype = "desktop",
        resizable = true,
    })
end

function love.draw()
    local windowWidth, windowHeight = love.window.getDimensions()
    local fontSize = 0.25 * windowHeight
    love.graphics.setFont(love.graphics.newFont(fontSize))
    love.graphics.printf("PONG", 0, 0.5 * windowHeight - 0.5 * fontSize, windowWidth, "center")
end
