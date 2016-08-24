function [approx] = exp_approx (x, degree)
# Estimates e^x using a Maclaurin polynomial of specified degree
    approx = 0;
    curr_term = 1;
    for n = 0:degree
        approx += curr_term;
        curr_term *= x/(n+1);
    end
end


%!assert(exp_approx(1,0)==1)
%!assert(exp_approx(1,-1)==0)
%!assert(abs(exp_approx(1,20) - 2.71828) < .00001)
%!assert(abs(exp_approx(2.3,25) - 9.974182) < .000001)
