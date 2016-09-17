function [y_interp] = lagrange_interp (x_point, y_point, x_interp)
#
# Given a list of set points, interpolates y values for additional x points
# using Lagrange polynomials
#
# INPUTS:
#   x_point: a vector of x data points
#   y_point: a vector of y data points corresponding to x_point
#   x_interp: a vector of x values for interpolating based on x_point and y_point
#
# OUTPUTS:
#   y_interp: the interpolated y values
#

    if(!isrow(x_point) || !isrow(y_point) || length(x_point)!=length(y_point))
        display('ERROR: x_point and y_point must be row vectors of equal length')
        y_interp = NaN;
    elseif(!isrow(x_interp))
        display('ERROR: x_point must be either a scalar or a row vector')
        y_interp = NaN;
    elseif(!length(x_point) == length(unique(x_point)))
        display('ERROR: x_point cannot contain duplicate values!')
        y_interp = NaN;
    else
        if(min(x_interp) < min(x_point) || max(x_interp) > max(x_point))
            display('WARNING: interpolation points lie outside the observed range')
        end
        
        n = length(x_point);
        l_poly = ones(n,length(x_interp));
        
        for i = 1:n
            for j = 1:n
                if(i != j)
                    l_poly(i,:) .*= (x_interp-x_point(j))/(x_point(i)-x_point(j));
                end
            end
        end
        
        y_interp = zeros(1, length(x_interp));
        
        for i = 1:n
            y_interp += y_point(i)*l_poly(i,:);
        end
        
    end
end
