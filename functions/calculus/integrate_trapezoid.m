function [est] = integrate_trapezoid (f, a, b, n=1000)
# Estemates the integral of a function f over the interval (a,b) using n trapezoids
#
# IN:
#   f: a univariate function (as a string or anonymous function)
#   a, b: integration bounds
#   n: the number of partitions to use (1000 by default)
#
# OUT:
#   est: an estimate of the integral value
#
# usage:
#   integrate_trapezoid(@(x) x^2, 0, 5, 200)

  if(b==a)
      est = 0,
      return
  end
  if(b < a)
      est = integrate_trapezoid(f, b, a, n);
      return
  end
  
  if(ischar(f))
      f = inline(f);
  end
  
  h = (b-a)/n;
  X = a:h:b;
  Y = arrayfun(f, X);
  
  est = h * (2 * sum(Y) - Y(1) - Y(n+1)) / 2;
  
end
