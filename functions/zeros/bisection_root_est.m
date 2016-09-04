function [root_est] = bisection_root_est (f, a, b, epsilon)
# Computes bisection iterations until |bn-an| < eps
# Returns the approximate root of function f()
#
# f is a function(as a string or an anonymous function)
# a and b are bounding coordinates (f(a)*f(b) must be less than zero
# epsilon is the acceptable degree of error
#
# Usage examples:
#     bisection_root_est(@(y) .5 - sin(y)/y, -2, 0, .00001)
#     bisection_root_est('x^2-3', 1, 2, 10^-8)

    if(ischar(f))
        f = inline(f);
    end
    
    f_at_a = f(a); #f(b) is not reused, so it is not stored

    if (f_at_a * f(b) > 0)
        display('Bad inputs!')
        root_est = NaN;
        return
    end
    
    error = abs(b - a);
    do
        root_est = (a + b) / 2;
        if (f_at_a * f(root_est) < 0)
            b = root_est;
        else
            a = root_est;
            f_at_a = f(a);
        end
        error /= 2;
    until  (error <= epsilon)
end
