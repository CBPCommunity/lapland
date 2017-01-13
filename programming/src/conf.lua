debug = true;
-- Please check this whenever writing debugging-related code to make sure
-- no unwanted output makes it into a release version!

function love.conf(game)
    game.identity = "Lapland";
    game.version = "0.10.1";
    --game.window.icon = "";
		
    game.window.borderless = not debug;
    game.console = debug;
end

-- For more information about possible settings please
-- see the [love wiki page](http://love2d.org/wiki/Config_Files)