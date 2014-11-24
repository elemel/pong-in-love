local Application = require "Application"
local FontFactory = require "FontFactory"
local GameScreen = require "GameScreen"
local ScreenFactory = require "ScreenFactory"
local SlideScreen = require "SlideScreen"

function love.load()
    love.window.setTitle("PONG in LÖVE")
    love.window.setMode(800, 600, {
        -- fullscreen = true,
        fullscreentype = "desktop",
        resizable = true,
    })

    local screenFactory = ScreenFactory.new()

    screenFactory:setCreator("game", GameScreen.new)
    screenFactory:setCreator("slide", SlideScreen.new)

    screenFactory:setConfig("title", {
        type_ = "slide",
        lines = {
            {text = "PONG in LÖVE", height = 0.2},
            {text = "by Mikael Lind", height = 0.1},
            {height = 0.1},
            {text = "elemel@elemel.se", height = 0.1},
        },
        links = {
            right = "overview",
        },
    })

    screenFactory:setConfig("overview", {
        type_ = "slide",
        lines = {
            {text = "Overview", height = 0.2},
            {text = "- LÖVE and Lua", height = 0.1},
            {text = "- PONG", height = 0.1},
            {text = "- PONG in LÖVE", height = 0.1},
        },
        links = {
            left = "title",
            right = "love",
        },
    })

    screenFactory:setConfig("love", {
        type_ = "slide",
        lines = {
            {text = "LÖVE", height = 0.2},
            {text = "- 2D game framework", height = 0.1},
            {text = "- Portable, open source", height = 0.1},
            {text = "- Program your game in Lua", height = 0.1},
            {height = 0.1},
            {text = "love2d.org", height = 0.1},
        },
        links = {
            left = "overview",
            right = "lua",
        },
    })

    screenFactory:setConfig("lua", {
        type_ = "slide",
        lines = {
            {text = "Lua", height = 0.2},
            {text = "- Dynamic programming language", height = 0.1},
            {text = "- Similar to JavaScript", height = 0.1},
            {text = "- Popular for game scripting", height = 0.1},
        },
        links = {
            left = "love",
            right = "pong",
        },
    })

    screenFactory:setConfig("pong", {
        type_ = "slide",
        lines = {
            {text = "PONG", height = 0.2},
            {text = "- Early arcade video game", height = 0.1},
            {text = "- Released by Atari in 1972", height = 0.1},
            {text = "- Commercially successful", height = 0.1},
        },
        links = {
            left = "lua",
            right = "pongInLove",
        },
    })

    screenFactory:setConfig("pongInLove", {
        type_ = "slide",
        lines = {
            {text = "PONG in LÖVE", height = 0.2},
            {text = "- ??? lines of LÖVE", height = 0.1},
            {text = "- Demo", height = 0.1},
        },
        links = {
            left = "pong",
            right = "game",
        },
    })

    screenFactory:setConfig("game", {
        type_ = "game",
        links = {
            left = "pongInLove",
            right = "gameOver",
        },
    })

    screenFactory:setConfig("gameOver", {
        type_ = "slide",
        lines = {
            {text = "GAME ÖVER", height = 0.2},
            {text = "- Questions?", height = 0.1},
            {height = 0.1},
            {text = "github.com/elemel/pong-in-love", height = 0.1},
        },
        links = {
            left = "game",
        },
    })

    local fontFactory = FontFactory.new()
    application = Application.new(screenFactory, fontFactory)

    local screen = application:createScreen("title")
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
