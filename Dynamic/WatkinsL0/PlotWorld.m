function h = PlotWorld(x, y, r, step)
    Initial_Game_Space();
    th = 0:pi/50:2*pi;
    xunit = r * cos(th) + (2*(x-1)*step + step);
    yunit = r * sin(th) + (2*(y-1)*step + step);
    h = plot(xunit, yunit, 'black');
    hold off
end
function [] = Initial_Game_Space()
    img = imread('gridworld.jpg');
    figure(2),imshow(img)
    hold on;
end