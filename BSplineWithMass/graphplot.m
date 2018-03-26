function graphplot(y,nodePoints)

figure();

fplot(y);
title('Y Graph');
grid on;
hold on;

%Comparing with sin(pix) default graph  
syms x;
f=sin(pi*x);
fplot(f);

xlim([0 2]);
xticks(nodePoints);

end

