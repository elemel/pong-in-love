local Application = require "Application"
local FontFactory = require "FontFactory"
local GameScreen = require "GameScreen"
local ScreenFactory = require "ScreenFactory"
local TitleScreen = require "TitleScreen"

function love.load()
    love.window.setTitle("PONG")
    love.window.setMode(800, 600, {
        -- fullscreen = true,
        fullscreentype = "desktop",
        resizable = true,
    })

    local screen = TitleScreen.new()

    local screenFactory = ScreenFactory.new()
    screenFactory:setCreator("game", GameScreen.new)
    screenFactory:setCreator("title", TitleScreen.new)

    local fontFactory = FontFactory.new()
    application = Application.new(screenFactory, fontFactory)
    application:setScreen(screen)
end

function love.update(dt)
    application:update(dt)
end

function love.draw()
    application:draw()
end

function love.keypressed(key, isrepeat)
    application:keypressed(key, isrepeat)
end

function love.keyreleased(key, isrepeat)
    application:keyreleased(key, isrepeat)
end
