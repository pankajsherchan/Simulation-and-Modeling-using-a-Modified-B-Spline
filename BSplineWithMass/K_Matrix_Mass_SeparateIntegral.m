function [K,BBar] = K_Matrix_Mass_SeparateIntegral(B, b, a, n,nodePoints)
    syms t

K_L = zeros(n-2);
K_R = zeros(n-2);

K = zeros((n-2));



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
        Di = diff(BBar(i),t, 2);
        Dj = diff(BBar(j),t, 2);
        value = (Di * Dj); 
%         + ((pi^2) * BBar(i) * BBar(j)));
%         K_L(i,j) = double(int(value,a, (a+b) / 2 ));
%         K_R(i,j) = double(int(value,(a+b) / 2, b ));
        K(i,j) = double(int(value,a, b ));


    end 
    
    fplot(BBar(i));
    hold on;
    
   
    xlim([-1 3]);

end

zerosMatrix = zeros(size(K_L));

disp('Left & Right K');
disp(K_L);
disp(K_R);
% K = [K_L zerosMatrix; zerosMatrix K_R];
% K = K_L + K_R;
% disp(K);
% csvwrite('KCP',K)
filename = 'Left.xlsx';
xlswrite(filename,K_L);

filename = 'Right.xlsx';
xlswrite(filename,K_R);

filename = 'All.xlsx';
xlswrite(filename,(K_L + K_R));

title('BBar Graph');
xticks(nodePoints);
grid on;
grid minor;
hold off



end
