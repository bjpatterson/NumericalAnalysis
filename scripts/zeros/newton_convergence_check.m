# A script for checking the convergence of newton's method
#  


##### SET THESE #####
f = @(x) x^2-3;
df = @(x) 2*x;

#f = @(x) x*sin(x);
#df = @(x) sin(x)+x*cos(x);
#####################

[accurate_zero, estimates] = newton_root_est(f, df, .5, 10^-14, 1000);
errors = estimates - accurate_zero;

error_over_previous = zeros(1, columns(errors)-2);  # exclude last term for stability
for i = 1:columns(error_over_previous)
    error_over_previous(i) = abs(errors(i+1)/errors(i));
end

error_over_previous_squared = zeros(1,columns(errors)-2);  # exclude last term for stability
for i = 1:columns(error_over_previous_squared)
    error_over_previous_squared(i) = abs(errors(i+1)/errors(i)^2);
end

##### CHOOSE WHICH PLOT TO GRAPH #####

# If this is roughly constant, f(x) has multiplicity > 1
# If this goes to 0, f(x) has multiplicity 1
#plot(error_over_previous)

# if this is roughly constant, f(x) has multiplicity 1
# if this goes to infinity, f(x) has multiplicity > 1
plot(error_over_previous_squared)
