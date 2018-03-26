clear all;

a = 0;
b = 2.25;
n= 10;
h = (b-a)/(n-1); 

[B] = Bspline(b, a, n);

[K, BBar_ZeroDispAndSlope] = FiniteElementApproximation_ZeroDispAndSlope(B, b, a, n);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% THIS PART IS TO BE DONE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% [finalresult] = finalResult(BBar_ZeroDispAndSlope, K ,  b, a, n);
% y = transpose(finalresult) * transpose(BBar_ZeroDispAndSlope);
% disp('Y');
% disp(y);
% nodes = a:h:b;
% disp('This is nodal points')
% disp(nodes);
% plot (nodes, sin(pi*nodes)); 
% hold on;
% fplot(y);
% legend('Y');

