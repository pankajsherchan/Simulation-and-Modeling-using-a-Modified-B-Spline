% Function to plot bspline graph. Takes in argument highest number, lowest number and number of nodal points.
function f = Bspline_KMatrix(b,a,n)

    % Calculates interval distance between two nodal points.
    h = (b-a)/(n-1);
    
    % Cube of distance between nodal points
    c = h^3;
    
    % Square of distance between nodal points
    s = h^2;
    syms t
    
    % Creates a array with equal interval. Interval value is same as that of nodal distance. Upper limit is highest input number plus 2 nodal distance and lower limit is 
    % lowest input number minus 2 nodal distance.
    nodePoints = (a-2*h):h:(b+2*h);
    
    % Piecewise function array.
    B = sym(zeros(1,n));
    % initialize figure
    figure
    title('B Spline');
    

    i = 0;

    % Loops starts. Run one value less than number of nodal points.
    while i < n

        % Since, matlab array starts at 1 and our i value starts as -2. Mapping the index with respect to value of i.
        index = i + 3;
       
        % initializes piecewise function for B Spline graph.
        B(i+1) = (1/c)*piecewise(nodePoints(index-2)<=t<=nodePoints(index-1),(t-nodePoints(index-2))^3,nodePoints(index-1)<=t<=nodePoints(index),c+(3*s)*(t-nodePoints(index-1))+3*h*(t-nodePoints(index-1))^2-3*(t-nodePoints(index-1))^3,nodePoints(index)<=t<=nodePoints(index+1),c+3*s*(nodePoints(index+1)-t)+3 *h *(nodePoints(index+1)-t)^2-3*(nodePoints(index+1)-t)^3,nodePoints(index+1)<=t<=nodePoints(index+2),(nodePoints(index+2)-t)^3,0);
        
        % Plots graph.
        %fplot(B(i+1))
        
        i = i + 1;

        % Holds the graph so that everyt function is plotted on the same graph.
        hold on
    end

% Limits the y interval of our graph from 0 to 4.
ylim([0 4])
xlim([-2 2])
hold off

K = zeros(n);

Bbar = zeros(length(B));

Bbar = B;

% disp(B);
%updating the spline values at end points
% Bbar(1) = Bbar(1) - 4 * Bbar(0) 
% Bbar(n) = Bbar(n) - 4 * Bbar(n-1) 

% disp(Bbar);


for i = 1: n
    for j = 1 : n   
        Di = diff(B(i),t)
        Dj = diff(B(j),t);
        value = ((Di * Dj) + ((pi^2) * B(i) * B(j)));
        K(i,j) = double(int(value,a,b));
    end   
end

Integral_F = zeros(n, 1);

 for j = 1 : n   
        value = (2 * (pi^2) * sin(pi * t)* B(j));
        Integral_F(j) = double(int(value,a,b));
 end  
%  
%  inverese = inv(K)
%  f = Integral_F
 
 c = inv(K) * Integral_F

f = 0;
end

