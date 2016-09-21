function [DDT] = div_diff (X, Y)
# Given a set of (x,y) cooredinates, calculates the table of divided differences
#   The first row of this table contains coefficients to the Newton polynomial
#
# INPUTS:
#   X is a row vector of x coordinates
#   Y is a row vector of y coordinates
#
# OUTPUTS:
#   DDT is the divided difference table such that:
#     DDT(i,j) = f[X(i), X(i+1),...., X(j)]
#       (DDT(i,j) == 0 for all j < i)
#
# USAGE:
#   table = div_diff([1 2 4 3 -1], [6 3 56 4 3])
#

    if(!isrow(X) || !isrow(Y) || length(X)!=length(Y))
        display('ERROR: X and Y must be row vectors of equal length')
        DDT = NaN;
    elseif(!length(X) == length(unique(X)))
        display('ERROR: X cannot contain duplicate values!')
        DDT = NaN;
    else
        DDT = diag(Y);
        for deg = 2:length(X) # The diagonal
            for indx = 1:length(X)-deg+1 # iterates through the diagonal
                r=indx;
                c=indx+deg-1;
                DDT(r, c) = (DDT(r+1,c) - DDT(r,c-1)) / (X(r) - X(c));
            end
        end        
    end
end
