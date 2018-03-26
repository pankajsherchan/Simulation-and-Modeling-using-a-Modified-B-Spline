a=0;
b=2;
n=13;
[B,nodePoints] = Bspline(b,a,n);
[K,BBar] = K_Matrix_Mass_SeparateIntegral(B, b, a, n,nodePoints);
[y] = finalResult(K,BBar,b,a,n);
graphplot(y,nodePoints);

%  !!! Since our matrix element is modified individually, changing 'n' value causes error. 
