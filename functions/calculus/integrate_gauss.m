function [est] = integrate_gauss (f, a, b, partitions=1000, points=3)
# Estemates the integral of a function f over the interval (a,b)
#   Using Gaussian Quadrature
#
# IN:
#   f: a univariate function (as a string or anonymous function)
#   a, b: integration bounds
#   partitions: the number of partitions to use (1000 by default)
#   points: the number of points to use within each partition
#
# OUT:
#   est: an estimate of the integral value
#
# usage:
#   integrate_gauss(@(x) sin(x), 0, pi/2, 20, 5)

  if(b==a)
      est = 0,
      return
  end
  if(b < a)
      est = integrate_simpson(f, b, a, partitions, points);
      return
  end
  
  if(ischar(f))
      f = inline(f);
  end
  
  h = (b-a)/partitions;
  
  [x,w] = gauss_quad_weights(points, 0, h);
  
  # Condensed for Efficiency:
  # Each row represents an interval. Each column, the nth point in that interval.
  # Apply the function f to all points, then multiply by the appropriate weights.
  # Finally, sum up the weighted matrix to get the integral estimate
  est = sum((arrayfun(f, (a:h:b-h)' + x ) .* w)(:));
  
end
