function [approx] = tan_approx (x, degree)
# Estimates tan(x) by Maclaurin polynomials of specified degree for sin and cos
#   - x should be in radians
    approx = sin_approx(x, degree)/cos_approx(x, degree);
end
