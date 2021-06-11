function [ VR ] = GetVR( x, y, next_action, next_action_star, V )

    Vstar = V(x, y, next_action_star);
    Vprime = V(x, y, next_action);
    
    if Vstar ~= 0 && Vprime ~= 0
        VR = Vprime/(Vstar + Vprime);
    else
        VR = .5;
    end
    
end

