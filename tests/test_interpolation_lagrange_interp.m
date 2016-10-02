function test_suite = test_interpolation_lagrange_interp()
    initTestSuite;

function test_single_interpolation
    assertEqual(lagrange_interp([1 2 3], [1 4 9], 1.5), 1.5^2)
    
function test_multi_interpolation
    x = [1.5 1.75 2.5]
    x2 = x .^2
    y = lagrange_interp([1 2 3], [1 4 9], x)
    for i in 1:length(x)
        assertEqual(x2(i), y(i))
    end

function test_bad_inputs
    assertEqual(lagrange_interp([1 2],[1], 4), NaN)
    assertEqual(lagrange_interp([1; 2],[1; 3], 4), NaN)
    assertEqual(lagrange_interp([1; 1],[1; 3], 4), NaN)
    