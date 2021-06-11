function [ achive_a_star, achive_a_prime ] = GetAchivements(x, y, next_action, next_action_star, Q, gamma, xl, yl)

    [reward_a_star, nx_star, ny_star] = World(x, y ,next_action_star, xl, yl);
    [reward_a_prime, nx_prime, ny_prime] = World(x, y ,next_action, xl, yl);
    
    achive_a_star = reward_a_star + gamma * max(Q(nx_star, ny_star, :));
    achive_a_prime = reward_a_prime + gamma * max(Q(nx_prime, ny_prime, :));
    
end