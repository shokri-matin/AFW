function h = PlotPolicy(Q, state_size_x, state_size_y, step)

for x = 1:state_size_x
    for y = 1:state_size_y
        [~, action] = max(Q(x, y, :));
        
        xunit = 2*(y-1)*step + step;
        yunit = 2*(x-1)*step + step;
        
        % 1=left, 2=down, 3=up, 4=right
        switch action
            case 1
                h = line([xunit xunit-step] , [yunit yunit]);
            case 2
                h = line([xunit xunit] , [yunit yunit+step]);
            case 3
                h = line([xunit xunit] , [yunit yunit-step]);
            case 4
                h = line([xunit xunit+step] , [yunit yunit]);
        end
    end
end

hold off

end
