function [root_est, all_ests] = secant_root_est (f, init_est, epsilon, max_iter)
# Implementation of the secant method for solving f(x) = 0
# Stopping criteria is abs(current_estimate - previous_estimate) < epsilon
#
#
# PARAMS:
#   f is a function (as a string or an anonymous function)
#   init_est is an initial approximation to iterate from
#   epsilon is an approximate acceptable degree of error
#   max_iter is the maximum iterations before returning (in case of divergence)
#
# RETURNS:
#   root_est is the best estimate of a root to the given function f
#   all_ests is the estimate history, where all_ests(n) is the nth estimate
#
#
# Usage Examples:
#     secant_root_est('x^2-3', 1.5, .00001, 1000)
#     secant_root_est(@(y) cos(y)-.2, 1, 10^-8, 1000)
#     [estimate, previous_estimates] = secant_root(f, init_est, epsilont, max_iter)

    if(ischar(f))
        f = inline(f);
    end
    
    prev_est = init_est - 2 * epsilon;
    prev_y = f(prev_est);
    root_est = init_est;
    
    for iter = 1:max_iter
        all_ests(iter) = root_est;
        y = f(root_est);
        sec_slope = (y - prev_y) / (root_est - prev_est);
        error_est = -y / sec_slope;
        
        # update estimate
        prev_est = root_est;
        prev_y = y;
        root_est += error_est;
        
        if(abs(error_est) <= epsilon)
            return
        end
    end
    
    display("The maximum allowed iteration was reached. Divergence is likely.")
    root_est = NaN;
    
end
