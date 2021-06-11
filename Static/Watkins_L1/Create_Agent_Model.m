function Model = Create_Agent_Model(x, y)
    
    actionRange = 1:1:4;
    
    %Initial Q Table
    Q = zeros(x,y,4);
    Z = zeros(x,y,4);
    
    %Initial Agent's Model
    Model.Q = Q;
    Model.Z = Z;
    Model.Actions = actionRange;
    Model.CurrentState = [1 1];
    Model.CurrentAction = 2;
    
end