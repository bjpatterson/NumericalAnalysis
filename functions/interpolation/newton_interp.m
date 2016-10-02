function [Y_interp] = newton_interp(X, Y, X_interp)
#
# Given a list of set points, interpolates y values for additional x points
# using Newton polynomials (derived from divided differenecs)
#    (calculated using nested multiplication)
#
# INPUTS:
#   X: a row vector of x data points
#   Y: a row vector of y data points corresponding to X
#   X_interp: a row vector of x values for interpolating based on X and Y
#
# OUTPUTS:
#   Y_interp: the interpolated y values
#

    if(!isrow(X) || !isrow(Y) || length(X)!=length(Y))
        display('ERROR: X and Y must be row vectors of equal length')
        Y_interp = NaN;
    elseif(!isrow(X_interp))
        display('ERROR: X_interp must be either a scalar or a row vector')
        Y_interp = NaN;
    elseif(!length(X) == length(unique(X)))
        display('ERROR: X cannot contain duplicate values!')
        Y_interp = NaN;
    else
        if(min(X_interp) < min(X) || max(X_interp) > max(X))
            display('WARNING: interpolation points lie outside the observed range')
        end
        
        # get the polynomial coefficients
        C = div_diff(X, Y)(1, :);
        
        # carry out nested multiplication
        Y_interp = C(length(X)) * ones(1, length(X_interp));
        
        for i = length(X)-1:-1:1
            Y_interp .*= (X_interp - X(i));
            Y_interp += C(i);
        end
        
    end
end
