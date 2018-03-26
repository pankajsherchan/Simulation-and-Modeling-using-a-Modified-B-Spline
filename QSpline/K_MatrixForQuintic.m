function [K_Matrix, Return_QBar] = K_MatrixForQuintic(Q, b, a, n)
    syms t
K = zeros(n);
QBar = sym(zeros(1,n));
% At 0, Q2 = 66, Q1 = 26, Q3 = 26, Q4 = 1
% We could use either Q1 or Q3 to drop down value to 0.
QBar(1) = Q(2)-((66/26)*Q(1)); 
QBar(2) = Q(2)-((66/26)*Q(3));
QBar(3) = Q(2)-66*Q(4);
QBar(n) = Q(n+1)-((66/26)*Q(n+2));
QBar(n-1) = Q(n+1)-((66/26)*Q(n));
QBar(n-2) = Q(n+1)-(66*Q(n-1));
  figure
    title('Q Bar Test');
    
for i = 4 : n-3
    QBar(i) = Q(i+1); 
end
Return_QBar = QBar;
fplot(QBar(1));
hold on
for i = 1: n
    for j = 1 : n   
        Di = diff(QBar(i),t);
        Dj = diff(QBar(j),t);
        value = ((Di * Dj) + ((pi^2) * QBar(i) * QBar(j)));
        K(i,j) = double(int(value,a,b));
    end 
    fplot(QBar(i));
end
hold off
K_Matrix = K;
end
