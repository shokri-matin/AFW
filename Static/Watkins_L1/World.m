function [reward, nx, ny] = World(cx, cy, action, x_limit, y_limit)

    nx = cx;
    ny = cy;
    goal = [16 1];
    
    reward = 0;
    % 1=left, 2=down, 3=up, 4=right
    switch action
        case 1
            if cy-1>0
                ny = cy - 1;
            else
                ny = cy;
                reward = -1;
            end
        case 2
            if cx+1<=x_limit
                nx = cx + 1;
            else
                nx = cx;
                reward = -1;
            end
        case 3
            if cx-1>0
                nx = cx - 1;
            else
                nx = cx;
                reward = -1;
            end
        case 4
            if cy+1<=y_limit
                ny = cy + 1;
            else
                ny = cy;
                reward = -1;
            end
    end
    
    if IsWall(cx, cy, action)
        nx = cx;
        ny = cy;
        reward = -1;
    end

    if isequal([nx ny],goal)
       reward = 1;
    end
    
end
function [result] = IsWall(cx, cy, action)
    result = 0;
    y = 1:1:15;
    if (cx == 14) && (sum(cy == y)>0) && (action == 2)
        result = 1;
    end
    
    if (cx == 15) && (sum(cy == y)>0) && (action == 3)
        result = 1;
    end
end