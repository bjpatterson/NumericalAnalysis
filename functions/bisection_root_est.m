function [root_est] = bisection_root_est (a, b, epsilon)
# Computes bisection iterations until |bn-an| < eps
# Returns the approximate root of function f() (hardcoded at present)

    f_at_a = f(a); #f(b) is not reused, so it is not stored

    if (f_at_a * f(b) > 0)
        display('Bad inputs!')
        return
    end
    
    error = abs(b - a);
    do
        root_est = (a + b) / 2;
        if (f_at_a * f(root_est) < 0)
            b = root_est;
        else
            a = root_est;
            f_at_a = f(a);
        end
        error /= 2;
    until  (error <= epsilon)
end
