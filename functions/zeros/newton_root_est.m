function [root_est] = newton_root_est (f, df, init_est, epsilon, max_iter)
# Implementation of Newton's method for solving f(x) = 0
# Stopping criteria is abs(current_estimate - previous_estimate) < epsilon
#
# f is a function (as a string or an anonymous function)
# df is the first derivative of f (as a string or an anonymous function)
# init_est is an initial approximation to iterate from
# epsilon is an approximate acceptable degree of error
# max_iter is the maximum iterations before returning (in case of divergence)
#
# Usage Examples:
#     newton_root_est('x^2-3', '2*x', 1.5, .00001, 1000)
#     newton_root_est(@(y) cos(y)-.2, @(y) -sin(y), 1, 10^-8, 1000)
    
    if(ischar(f))
        f = inline(f);
    end
    if(ischar(df))
        df = inline(df);
    end
    
    root_est = init_est;
    
    for iter = 1:max_iter
        error_est = -f(root_est)/df(root_est);
        root_est += error_est;
        if(abs(error_est) <= epsilon)
            return
        end
    end
    
    display("The maximum allowed iteration was reached. Divergence is likely.")
    newton_root_est = NaN;
    
end