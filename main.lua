local Application = require "Application"
local TitleScreen = require "TitleScreen"

function love.load()
    love.window.setTitle("PONG")
    love.window.setMode(800, 600, {
        -- fullscreen = true,
        fullscreentype = "desktop",
        resizable = true,
    })

    local screen = TitleScreen.new()

    application = Application.new()
    application:setScreen(screen)
end

function love.update(dt)
    application:update(dt)
end

function love.draw()
    application:draw()
end
