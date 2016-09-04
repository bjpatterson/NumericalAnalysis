function test_suite = test_zeros_bisection_root_est()
    initTestSuite;

function test_text_convergence
    assertElementsAlmostEqual(bisection_root_est('x^2-3', 1, 2, 10^-8), sqrt(3))
    
function test_function_convergence
    assertElementsAlmostEqual(
        bisection_root_est(@(y) .5 - sin(y)/y, -2, 0, 10^-8),
        -1.8954942670339809471
    )

function test_bad_inputs
    assertEqual(bisection_root_est('x^2', 1, 2, .001), NaN)

function test_relative_error
    root = sqrt(2);
    for n = 1:10
        error = 10^-n;
        est = bisection_root_est('x^2-2', 1, 2, error);
        assertTrue(abs(est-root) <= error)
        assertTrue(abs(est-root) > error^2) # not strictly true in all cases
    end
