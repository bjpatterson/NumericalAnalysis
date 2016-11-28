function [est] = derivative_basic (f, x, h=10^-8)
# Estimates a derivative using (f(x+eps)-f(x-eps))/(2*eps)
#
# PARAMS:
#     f: a function (as a string or an anonymous function)
#     x: the point at which to estimate the derivative
#     h: the epsilon to use in the calculation (optional)
#
# example calls:
#   derivative_basic('x^2', 1)
#   derivative_basic(@(x) sin(x)+x, .111, .00001)

    if(ischar(f))
        f = inline(f);
    end
    est = (f(x+h)-f(x-h))/(2*h); 
end
