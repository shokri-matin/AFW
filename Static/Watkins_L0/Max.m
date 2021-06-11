function [action index] = Max(x, r)
    m = max(x);
    place = find(x == m);
    %r = randi(numel(place));
    if numel(place) >= r
        index = place(r);
    else
        index = 1;
    end
    action = x(index);
end