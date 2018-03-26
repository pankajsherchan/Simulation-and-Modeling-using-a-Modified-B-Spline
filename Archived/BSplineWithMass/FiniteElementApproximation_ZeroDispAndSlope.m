function [K_Matrix, Return_BBar] = FiniteElementApproximation_ZeroDispAndSlope(B, b, a, n)
    syms t

K = zeros(n);

BBar = sym(zeros(1,n));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% MODIFICATION AT THE LEFT MOST END WHICH IS AT O  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Since our Spline starts at 0 , but matlab Array starts at 1 index. B(1) is actual B(0).
% At nodal point = 0, Bbar should have zero displacement.

BBar(1) = B(2) - 4 * B(1);   %Actual -> Bbar(0)
BBar(2) = B(2) - 4 * B(3);   %Actual -> Bbar(1)

% BBar(3) remails as it is.
BBar(3) = B(4);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  MODIFICATION AT THE MASS NODAL P{OINT WHICH IS AT 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%]
% Actually B(4) and B(6) are removed because B(5) corresponds to Bsline at
% nodal point 1 where mass exists. So our modificed BBar(4) will point to
% B(5) where the mass exists. That is why the modification has been done in
% B(4) instead of B(5)
BBar(4) = B(5) - 2* B(4) - 2* B(6); % zero displacement and slope by singler
BBar(5) = B(7); % since we removed B(3) and B(5) to satisfied the singler zero displacement and slope
BBar(6) = B(8); % Not sure if BBar(6) should be B(9) or B(8) here
BBar(7) = B(9);
BBar(8) = B(10);


Return_BBar = BBar;

figure
title('B Bar for Zero Disp and Slope Test');
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

ylim([-15 6])
legend('BBar with zero displacement and Slope');
     
hold off

K_Matrix = K;

end