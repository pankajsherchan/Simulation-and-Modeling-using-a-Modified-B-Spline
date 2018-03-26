% Function to plot Quintic graph. Takes in argument highest number, lowest number and number of nodal points.
function f = QSpline(b,a,n)

    % Calculates interval distance between two nodal points.
    h = (b-a)/(n-1)
    
    % Cube of distance between nodal points
    h_fifth = h^5
    
    % Square of distance between nodal points
    s = h^2
    syms t
    
    % Piecewise function array.
    B = sym(zeros(1,n+2))

    % Creates a array with equal interval. Interval value is same as that of nodal distance. Upper limit is highest input number plus 2 nodal distance and lower limit is 
    % lowest input number minus 2 nodal distance.
    N = (a - 4*h):h:(b+4*h)
    
    % initialize figure
    figure
    title('Quintic Spline')
    
    i = 0

    % Loops starts. Run one value less than number of nodal points.
    while i < (n+2)
        disp(i);
        % Since, matlab array starts at 1 and our i value starts as -3. Mapping the index with respect to value of i.
        index = i + 4
       
        % initializes piecewise function for B Spline graph.
        B(i+1) = (1/h_fifth)* piecewise(N(index-3)<=t<= N(index-2),(t-N(index-3))^5,N(index-2)<=t<=N(index-1), (t-N(index-3))^5 - 6*(t - N(index-2))^5,N(index-1)<=t<= N(index), (t-N(index-3))^5 - 6*(t - N(index-2))^5 + 15 * (t - N(index-1))^5, N(index)<=t<= N(index + 1), (t-N(index-3))^5 - 6*(t - N(index-2))^5 + 15 * (t - N(index-1))^5 - 20 * (t - N(index))^5,N(index+1)<=t<= N(index + 2), (t-N(index-3))^5 - 6*(t - N(index-2))^5 + 15 * (t - N(index-1))^5 - 20 * (t - N(index))^5 + 15 * (t - N(index + 1))^5,N(index + 2)<=t<= N(index + 3), (t-N(index-3))^5 - 6*(t - N(index-2))^5 + 15 * (t - N(index-1))^5 - 20 * (t - N(index))^5 + 15 * (t - N(index + 1))^5 - 6 * (t - N(index + 2))^5,0)
        
        i = i + 1
        
        % Plots graph.
        fplot(B(i))

        % Holds the graph so that everyt function is plotted on the same graph.
        hold on
    end

% Limits the y interval of our graph from 0 to 80.
ylim([0 80])

hold off
   
f = B;
end



