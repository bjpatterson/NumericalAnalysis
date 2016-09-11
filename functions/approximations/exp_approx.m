function [approx] = exp_approx (x, degree)
# Estimates e^x using a Maclaurin polynomial of specified degree
    approx = 0;
    curr_term = 1;
    for n = 0:degree
        approx += curr_term;
        curr_term *= x/(n+1);
    end
end
