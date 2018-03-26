a = 0;
b = 1;
n= 5;
h = (b-a)/(n-1);
    
[Q] = QSpline(b, a, n);
[K, QBar] = K_MatrixForQuintic(Q, b, a, n);
disp(K);
[finalresult] = finalResult(QBar, K ,  b, a, n);
y = transpose(finalresult) * transpose(QBar);
 disp(y);
 nodes = a:h:b;
 plot (nodes, sin(pi*nodes)); 
 
 grid on;
 grid minor;
 hold on;
 fplot(y);
 hold off
 xlim([0 1])
