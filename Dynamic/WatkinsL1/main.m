clc;
close;
clear;
global e;
runs = 4;
run = 0;
for alpha_run = 1:runs
    for gamma_runs = 1:runs
        run = run + 1;
        %% Initialize Parameters
        maxEpisode = 2000;
        maxStep = 100;
        
        epsilon = .90; % Exploration Rate
        step = 13.8;
        r = 5;
        alpha = [.3,.5,.7,.9];
        gamma = [.3,.5,.7,.9];
        lambda = 1;
        goal = [16 1];
        xl = 16;
        yl = 16;
        stepOnTest = 100;
        Agent = Create_Agent_Model(xl, yl);
        mean_rewards = zeros(1,maxEpisode);
        
        test_period = 10;
        test_step = maxEpisode/test_period;
        test_rewards = zeros(1, test_step);
        test_totalsteps = zeros(1, test_step);
        %% Main Loop Watkins Q Learning
        
        for e = 1:maxEpisode
            if e < 1000
                goal = [16 1];
            else
                goal = [16 16];
            end
            epsilon = max(epsilon - 0.00045, 0);
            rewards = zeros(1,maxStep);
            
            Agent.Z = zeros(xl, yl, 4);
            Agent.CurrentState = [randi(xl) randi(yl)];
            Agent.CurrentAction = randi(numel(Agent.Actions));
            
            % Start Episod
            for s = 1:maxStep
                
                x = Agent.CurrentState(1);
                y = Agent.CurrentState(2);
                action = Agent.CurrentAction;
                
                % Take the action
                [reward, nx, ny] =  World(x, y ,action, xl, yl);
                
                if rand < epsilon
                    next_action = randi(numel(Agent.Actions));
                else
                    [next_action_value, next_action] = max(Agent.Q(nx, ny, :));
                end
                
                [next_action_star_value, next_action_star] = max(Agent.Q(nx, ny, :));
                
                delta = reward + gamma(gamma_runs)*Agent.Q(nx, ny, next_action_star) - Agent.Q(x, y, action);
                
                Agent.Z(x, y, action) = Agent.Z(x, y, action) + 1;
                
                for sx = 1:xl
                    for sy = 1:yl
                        for act = 1:4
                            Agent.Q(sx, sy, act) = Agent.Q(sx, sy, act) + alpha(alpha_run)*delta*Agent.Z(sx, sy, act);
                            if Agent.Z(sx, sy, act) ~= 0
                                if next_action == next_action_star
                                    Agent.Z(sx, sy, act) = gamma(gamma_runs)* Agent.Z(sx, sy, act);
                                else
                                    Agent.Z(sx, sy, act) = 0;
                                end
                            end
                        end
                    end
                end
                
                Agent.CurrentState = [nx ny];
                Agent.CurrentAction = next_action;
                
                rewards(s) = reward;
                
                if isequal([nx ny],goal)
                    % End Of Episode
                    break;
                end
                
            end
            % End of Episod
            if mod(e, test_period) == 0
                t = e/test_period;
                [ tr, ts ] = Test_QValue_TotalStep(Agent.Q, stepOnTest, goal, xl, yl);
                test_rewards(t) = tr;
                test_totalsteps(t) = ts;
                %disp(['Test Number: ' num2str(t) ' - Test Mean Rewards: ' num2str(tr) ' epsilon: ' num2str(epsilon)]);
                %disp(['Test Number: ' num2str(t) ' - Test Total Steps: ' num2str(ts) ' epsilon: ' num2str(epsilon)]);
            end
            mean_rewards(e) = mean(rewards(1:s));
        end
        % Save Results
        save(['.\Params\LO_TE_R', num2str(run),'_',num2str(alpha(alpha_run)),'_',num2str(gamma(gamma_runs)), '.mat'],'test_rewards');
        save(['.\Params\LO_TR_R', num2str(run),'_',num2str(alpha(alpha_run)),'_',num2str(gamma(gamma_runs)), '.mat'],'mean_rewards');
        save(['.\Params\LO_TE_TS_R', num2str(run),'_',num2str(alpha(alpha_run)),'_',num2str(gamma(gamma_runs)), '.mat'],'test_totalsteps');
        disp(['Number: ', num2str(run),'_',num2str(alpha(alpha_run)),'_',num2str(gamma(gamma_runs))]);
    end
end

%% Results
% h = PlotWorld(y, x, r, step);
% p = PlotPolicy(Agent.Q, state_size_x, state_size_y, step);
