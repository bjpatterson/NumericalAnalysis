function [approx] = cos_approx (x, degree)
# Estimates cos(x) using a Maclaurin polynomial of specified degree
#   - x should be in radians
    approx = 0;
    next_term = 1;
    for n = 0:2:degree
        approx += next_term;
        next_term *= -x^2/(n+1)/(n+2);
    end
end
