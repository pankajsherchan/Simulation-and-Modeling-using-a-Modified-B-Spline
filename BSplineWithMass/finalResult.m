function [y] = finalResult(K,BBar,b,a,n)
    syms t

F = zeros((n-2), 1);
F_L = zeros((n-2), 1);
F_R = zeros((n-2), 1);


% n is 13. Since our BBar is size 11*11, F matrix is made 11*1. 
for j = 1 : (n-2)   
       value = (2 * (pi^2) * sin(pi * t)* BBar(j));
%        F_L(j) = double(int(value,a, (a +b) / 2));
%        F_R(j) = double(int(value,(a + b) /2 ,b));
       F(j) = double(int(value,a ,b));

end  


% F = [F_L ; F_R];
% F = (F_L + F_R);

filename = 'L_F.xlsx';
xlswrite(filename,F_L);

filename = 'R_F.xlsx';
xlswrite(filename,F_R);

filename = 'All_F.xlsx';
xlswrite(filename, (F_L + F_R));



disp("the size of k ");
disp(size(K));

disp("the size of F ");
disp(size(F));



c = inv(K) * F;

disp('The inverse of K');
disp(inv(K));

disp('The size of BBar');
disp(size(BBar));

% disp(c);
y=transpose(c)*transpose(BBar);
end
