function u = UA(freq, rho_prim, phi_prim)


lambda = 3e8 / freq;

a = 1;
b = 1;
m = 3;
n1 = 0.6;
n2 = 1;
n3 = 1;

% rr = 7*lambda * (abs(cos(m * phi_prim/4)/a).^n2    +  abs(sin(m * phi_prim/4)/b).^n3  ) .^ (-1/n1);
rr = 7 * lambda;

if (rho_prim < rr) 
    
    u = 1;
    
else
    u = 0;

end
