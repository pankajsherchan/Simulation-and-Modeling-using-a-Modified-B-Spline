% Function to plot bspline graph. Takes in argument highest number, lowest number and number of nodal points.
function f = Bspline(b,a,n)

    % Calculates interval distance between two nodal points.
    h = (b-a)/(n-1);
    
    % Cube of distance between nodal points
    c = h^3;
    
    % Square of distance between nodal points
    s = h^2;
    syms t
    
    % Creates a array with equal interval. Interval value is same as that of nodal distance. Upper limit is highest input number plus 3 nodal distance and lower limit is 
    % lowest input number minus 3 nodal distance. We have taken boundary +
    % 1 and boundary - 1 into consideration.
    nodePoints = (a-3*h):h:(b+3*h);
    
    % Piecewise function array.
    % Taking end points spline function to adjust endpoints with boundary
    % conditions later in the code.
    B = sym(zeros(1,(n+2)));
    % initialize figure
    figure
    title('B Spline');  
    

    i = 0;

    % Loops starts. Run one value more than number of nodal points.
    while i < (n+2)
 
        % Since, matlab array starts at 1 and our i value starts as -2. Mapping the index with respect to value of i.
        index = i + 3;
         
        % initializes piecewise function for B Spline graph.
         B(i+1) = (1/c)*piecewise(nodePoints(index-2)<=t<=nodePoints(index-1),(t-nodePoints(index-2))^3,nodePoints(index-1)<=t<=nodePoints(index),c+(3*s)*(t-nodePoints(index-1))+3*h*(t-nodePoints(index-1))^2-3*(t-nodePoints(index-1))^3,nodePoints(index)<=t<=nodePoints(index+1),c+3*s*(nodePoints(index+1)-t)+3 *h *(nodePoints(index+1)-t)^2-3*(nodePoints(index+1)-t)^3,nodePoints(index+1)<=t<=nodePoints(index+2),(nodePoints(index+2)-t)^3,0);

        
       
        % Plots graph.
        fplot(B(i+1));
        
        i = i + 1;

        % Holds the graph so that everyt function is plotted on the same graph.
        hold on
    end

% Limits the y interval of our graph from 0 to 4.
ylim([0 4])

hold off

f= B;
   
end