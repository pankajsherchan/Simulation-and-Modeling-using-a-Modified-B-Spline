function [K_Matrix, Return_BBar] = K_Matrix(B, b, a, n)
    syms t

K = zeros(n);

BBar = sym(zeros(1,n));

% Adjusting the first two and last two value of the graph.
BBar(1) = B(2)-(4*B(1));
BBar(2) = B(2)-(4*B(3));
BBar(n) = B(n+1)-(4*B(n+2));
BBar(n-1) = B(n+1)-(4*B(n));
  figure
    title('B Bar Test');
    
for i = 3 : n-2
    BBar(i) = B(i+1); 
end

Return_BBar = BBar;
fplot(BBar(1));
hold on
for i = 1: n
    for j = 1 : n   
        Di = diff(BBar(i),t);
        Dj = diff(BBar(j),t);
        value = ((Di * Dj) + ((pi^2) * BBar(i) * BBar(j)));
        K(i,j) = double(int(value,a,b));
    end 
    fplot(BBar(i));
end
hold off

K_Matrix = K;

end