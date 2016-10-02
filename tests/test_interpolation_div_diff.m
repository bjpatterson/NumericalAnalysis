function test_suite = test_interpolation_div_diff()
    initTestSuite;

function test_correctness
    X = 0:5;
    Y = X.^2+1;
    expected = [1 1 1 0 0 0; 0 2 3 1 0 0; 0 0 5 5 1 0; 0 0 0 10 7 1; 0 0 0 0 17 9; 0 0 0 0 0 26];
    actual = div_diff(X, Y);
    
    for i = 1:6
        for j = 1:6
            assertEqual(expected(i,j), actual(i,j))
        end
    end
    
function test_bad_inputs
    assertEqual(lagrange_interp([1 2],[1], 4), NaN)
    