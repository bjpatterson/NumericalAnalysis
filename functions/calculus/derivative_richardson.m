function [est] = derivative_richardson (f, x, eps=10^-8, h=.5, n=25)
# uses Richardson extrapolation to estimate the derivative of f at x
#
# PARAMS:
#   f: the function under investigation (as a string or anonymous function)
#   x: the location at which to estimate the derivative of f
#   eps: the algorithm stops when abs(last_est - curr_est) < eps
#   h: (optional) distance from x to measure the first approximation [f(x+h)-f(x-h)]/2h
#   n: (optional) the max number of iterations of Richardson extrapolation to use
#
# RETURNS:
#   est: the estimated derivative of f at x
#   table: the table of all values from the Richardson extrapolation

    if(ischar(f))
        f = inline(f);
    end
    
    table = zeros(n);
    
    est = prev = NaN;
    
    for i = 1:n
        table(i,1) = (f(x+h)-f(x-h))/(2*h);
        for j = 2:i;
            table(i,j) = table(i,j-1) + (table(i,j-1)-table(i-1,j-1))/(4^(j-1)-1);
        end
        prev = est;
        est = table(i,i);
        if abs(est - prev) < eps
            return
        end
        h /= 2;
    end
    
    disp("Warning: The Richardson extrapolation process did not converge.")
    disp("This is often due to rounding errors or extremely unsmooth functions")
    
end
