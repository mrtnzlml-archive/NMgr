% Derivace funkce, která je zadána tabulkou s hodnotami X, Y
function [dx, dy] = derivation(x, y)

    dx = []; %zeros(length(x), 1);
    dy = diff(y);
    for index = 1:length(x)-1
        dx(index) = abs(x(index) - x(index+1));
        dy(index) = dy(index) / dx(index); %dY/dX
    end

end
