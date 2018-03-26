a = 0;
b = 5;
n= 5;
h = (b-a)/(n-1);
    

[B] = Bspline(b, a, n);
[K, BBar] = K_Matrix(B, b, a, n);
[finalresult] = finalResult(BBar, K ,  b, a, n);

y = transpose(finalresult) * transpose(BBar);
disp('THis is Y');
disp(y);
 nodes = a:h:b;
 plot (nodes, sin(pi*nodes)); 
 hold on;
xlim([0 5])

 fplot(y);

