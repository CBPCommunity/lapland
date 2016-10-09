debug = true;

function love.conf(game)
    game.identity = "Lapland";
    game.version = "0.10.1";
    --game.window.icon = "";
		
    game.window.borderless = not debug;
    game.console = debug;
end