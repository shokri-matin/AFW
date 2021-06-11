function [ ER ] = GetER(x, y, action, action_star, M, xl, yl)

    [~, nx_prime, ny_prime] = World(x, y ,action, xl, yl);
    [~, nx_star, ny_star] = World(x, y ,action_star, xl, yl);
    
    Mstar = M(nx_prime, ny_prime, :);
    Mprime = M(nx_star, ny_star, :);
    
    EMstar = Entropy(Mstar);
    EMprime = Entropy(Mprime);
    
    if EMstar ~= 0 && EMprime ~= 0
        ER = EMprime/(EMstar + EMprime);
    else
        ER = .5;
    end
    
end

function [ e ] = Entropy( x )
   e = 0;
   p = x/sum(x);
   n = numel(p);
   for i=1:n
       if p(i) ~= 0
            e = e + p(i)*log2(p(i));
       end
   end
    e = -e;
end