function [x, u_x] = integral_transform (v_y, K_xy, degree, n, eps = 0)
# A stepping stone towards general integral transform
#
# numerically solves for u(x) such that
#   'v(y) = integral( K(x,y)u(x)dx )'; x,y on [0,1]
#
# INPUTS:
#   v_y: a univariate anonymous function (defined on [0,1])
#   K_xy: an anonymous kernel function in two variables (x,y), defined on x,y from [0,1]
#   degree: estimation degree to use (0-2 supported)
#   n: number of intervals on x and y to use in estimation
#   eps: the theshold for ignoring near-zero elements (may speed up calculations)
#
# OUTPUTS:
#   x: a vector of the x values for which u(x) has been numerically solved
#   u_x: the numeric approximation of u(x).  u_x(n) ~ u(x(n))
#
# USAGE:
#   integral_transform(@(y)y*(y-1), @(x,y)exp(-10*abs(x-y)), 1, 64)

  x = y = 0:1/n:1;
  
  ### Working towards solving Au = v ###
  
  v = arrayfun(v_y,y);
  
  # determine point weights based on estimation degree
  weights = zeros(1, n+1);
  switch (degree) 
    case 0
      weights(:) = 1/(n+1);
    case 1
      weights(1) = weights(n+1) = 1/n/2;
      weights(2:n) = 1/n;
    case 2
      if (mod(n,2) != 0)
        disp("degree 2 numeric integration must have an even number of partitions");
        x = u_x = NaN;
        return
      end
      weights(1) = weights(n+1) = 1/n/3;
      weights(2:2:n) = 4/n/3;
      weights(3:2:n-1) = 2/n/3;
    otherwise
      disp("integral_transform is defined for estimates of degree 0, 1, or 2 only!");
      x = u_x = NaN;
      return
  end

  # K(j,k) = K_xy(x(k), y(j)) # (so that a row sum simulates integration over x)
  K = arrayfun(K_xy,ones(n+1,1)*x,(ones(n+1,1)*y)');
  A = weights.*K;
  
  # filter out A < eps (doesn't appear to reduce calculation time)
  filter = @(a) (abs(a)>=eps).*a;
  A = filter(A);
  
  # if the matrix is sparse, convert it in an attempt to save computation time
  #   (sparse defined as 5% or fewer nonzero elements)
  if(nnz(A) <= (n+1)^2*.05)
      disp("attempting to save time using a sparse matrix");
      A = sparse(A);
  end
  
  # solve the linear system Au = v
  u_x = (linsolve(A, v'))';
  
end
