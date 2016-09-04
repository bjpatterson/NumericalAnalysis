function test_suite = test_newton_root_est()
    initTestSuite;

function test_text_convergence
    assertElementsAlmostEqual(
        newton_root_est('x^2-3', '2*x', 1.5, 10^-8, 1000),
        sqrt(3)
    )
    
function test_function_convergence
    assertElementsAlmostEqual(
        newton_root_est(@(y) cos(y)-.2, @(y) -sin(y), 1, 10^-8, 1000),
        acos(.2)
    )
    
function test_divergence
    assertEqual(newton_root_est('x^2+1', '2*x', 1, .0001, 1000), NaN)

function test_relative_error
    root = 3;
    for n = 1:10
        error = 10^-n;
        est = newton_root_est('(x-3)^2', '2*x-6', 2, error, 1000);
        assertTrue(abs(est-root) <= error)
        assertTrue(abs(est-root) > error^2) # not strictly true in all cases
    end
    
function test_fail
    assertTrue(1 == 0)