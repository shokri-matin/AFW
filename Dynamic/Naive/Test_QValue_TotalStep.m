function [ mean_reward, total_steps ] = Test_QValue_TotalStep( Q, step, goal, xl, yl )
    mean_rewards = zeros(1, xl*yl);
    total_step = zeros(1, xl*yl);
    j = 0;
    for x = 1:xl
        for y = 1:yl
            j = j+1;
            sx = x;
            sy = y;
            rewards = zeros(1, step);
            for i=1:step
                [~, action] = max(Q(sx, sy, :));
                [reward, nx, ny] = World(sx, sy ,action, xl, yl);
                rewards(i) = reward;
                if isequal([nx ny],goal)
                    break;
                end
                sx = nx;
                sy = ny;
            end
            total_step(j) = i;
            mean_rewards(j) = sum(rewards(1:i));
        end
    end
    mean_reward = mean(mean_rewards);
    total_steps = sum(total_step);
end