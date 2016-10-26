function [est] = integrate_trapezoid (f, a, b, n=1000)


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
  Y = f(X);
  
  est = (2 * sum(Y) - Y(1) - Y(n+1)) / 2 / n;
  
end
