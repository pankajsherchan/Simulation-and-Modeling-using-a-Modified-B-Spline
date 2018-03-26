function [K,BBar] = K_Matrix(B, b, a, n,nodePoints)
    syms t

K = zeros(n-2);

BBar = sym(zeros(1,n-2));

% Adjusting the first two and last two value of the graph.
% Remember B(2) here is actually B(1).(index has shifted one unit up)
% we created 13 B splines [excluding the two outer splines] and we lose 3
% splines while modifying the graph. So,10 splines are left.

%But we choseto include the exterior spline of right side as well. So 11 Bsplines in total :-)

BBar(1) = B(2)-2*B(1)-2*B(3);
BBar(2)=B(4);
BBar(3)=B(5);
BBar(4)=B(6);
BBar(5)=B(8);
BBar(6)=B(10);
BBar(7)=B(11);
BBar(8)=B(12);
BBar(9)=B(13);
BBar(10)=B(14);
BBar(11)=B(15);

figure();

for i = 1:11
    for j = 1 :11   
        Di = diff(BBar(i),t);
        Dj = diff(BBar(j),t);
        value = ((Di * Dj) + ((pi^2) * BBar(i) * BBar(j)));
        K(i,j) = double(int(value,a,b));
    end 
    
    fplot(BBar(i));
    hold on;
    
   
    xlim([-1 3]);

end
disp(K);

title('BBar Graph');
xticks(nodePoints);
grid on;
grid minor;
hold off



end
