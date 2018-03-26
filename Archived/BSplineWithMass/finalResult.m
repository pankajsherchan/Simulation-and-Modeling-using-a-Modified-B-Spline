function c = finalResult(B ,K , b, a, n)
    syms t

Integral_F = zeros(n, 1);

 for j = 1 : n   
        value = (2 * (pi^2) * sin(pi * t)* B(j));
        Integral_F(j) = double(int(value,a,b));
 end  
 
 c = inv(K) * Integral_F
 
end