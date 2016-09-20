function [Y_interp] = lagrange_interp (X, Y, X_interp)
#
# Given a list of set points, interpolates y values for additional x points
# using Lagrange polynomials
#
# INPUTS:
#   X: a vector of x data points
#   Y: a vector of y data points corresponding to X
#   X_interp: a vector of x values for interpolating based on X and Y
#
# OUTPUTS:
#   Y_interp: the interpolated y values
#

    if(!isrow(X) || !isrow(Y) || length(X)!=length(Y))
        display('ERROR: X and Y must be row vectors of equal length')
        Y_interp = NaN;
    elseif(!isrow(X_interp))
        display('ERROR: X must be either a scalar or a row vector')
        Y_interp = NaN;
    elseif(!length(X) == length(unique(X)))
        display('ERROR: X cannot contain duplicate values!')
        Y_interp = NaN;
    else
        if(min(X_interp) < min(X) || max(X_interp) > max(X))
            display('WARNING: interpolation points lie outside the observed range')
        end
        
        n = length(X);
        l_poly = ones(n,length(X_interp));
        
        for i = 1:n
            for j = 1:n
                if(i != j)
                    l_poly(i,:) .*= (X_interp-X(j))/(X(i)-X(j));
                end
            end
        end
        
        Y_interp = zeros(1, length(X_interp));
        
        for i = 1:n
            Y_interp += Y(i)*l_poly(i,:);
        end
        
    end
end
