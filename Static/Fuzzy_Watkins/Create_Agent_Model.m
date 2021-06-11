function Model = Create_Agent_Model(x, y)
    
    actionRange = [1 2 3 4];
    
    %Initial Q Table
    Q = zeros(x,y,4);
    Z = zeros(x,y,4);
    V = zeros(x,y,4);
    M = zeros(x,y,4);
    
    %Initial Agent's Model
    Model.Q = Q;
    Model.Z = Z;
    Model.V = V;
    Model.M = M;
    Model.Actions = actionRange;
    Model.CurrentState = [1 1];
    Model.CurrentAction = 1;
    
end