################################
# # # # Taylor Series  # # # # #
################################

f(x+h) = f(x) + h*f'(x) + h^2/2! f''(x) + h^3/3! f'''(x) ...



################################
# interpolation error (Newton) #
################################

# General (n+1 nodes)
f(x) - p_n(x) = [ f<n+1>(z_x) /(n+1)! ] * prod(i=0:n,x-x_i);

# Uniformly dist (n+1 nodes)
|f(x) - p_n(x)| <= max(|f<n+1>(z_x)|) * h^(n+1) / 4(n+1)
