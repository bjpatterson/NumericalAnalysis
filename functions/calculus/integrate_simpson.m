function [est] = integrate_simpson (f, a, b, n=1000)
# Estemates the integral of a function f over the interval (a,b) using n parabolas
#
# IN:
#   f: a univariate function (as a string or anonymous function)
#   a, b: integration bounds
#   n: the number of quadratic partitions to use (1000 by default)
#
# OUT:
#   est: an estimate of the integral value
#
# usage:
#   integrate_simpson(@(x) sin(x), 0, pi/2, 20)

  if(b==a)
      est = 0,
      return
  end
  if(b < a)
      est = integrate_simpson(f, b, a, n);
      return
  end
  
  if(ischar(f))
      f = inline(f);
  end
  
  h = (b-a)/2/n;
  X = a:h:b;
  Y = arrayfun(f, X);
  
  est = h * (4*sum(Y(2:2:2*n)) + 2*sum(Y(3:2:2*n-1))+ Y(1) + Y(2*n+1)) / 3;
  
end
