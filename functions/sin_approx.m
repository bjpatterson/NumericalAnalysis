function [approx] = sin_approx (x, degree)
# Estimates sin(x) using a Maclaurin polynomial of specified degree
#   - x should be in radians
    approx = 0;
    next_term = x;
    for n = 1:2:degree
        approx += next_term;
        next_term *= -x^2/(n+1)/(n+2);
    end
end
