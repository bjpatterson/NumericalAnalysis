function test_suite = test_zeros_secant_root_est()
    initTestSuite;

function test_text_convergence
    assertElementsAlmostEqual(
        secant_root_est('x^2-3', 1.5, 10^-8, 1000),
        sqrt(3)
    )
    
function test_function_convergence
    assertElementsAlmostEqual(
        secant_root_est(@(y) cos(y)-.2, 1, 10^-8, 1000),
        acos(.2)
    )
    
function test_divergence
    display("(divergence expected):")
    assertEqual(secant_root_est('x^2+1', 1, .0001, 1000), NaN)

function test_relative_error
    root = 3;
    for n = 1:10
        error = 10^-n;
        est = secant_root_est('(x-3)^2', 2, error, 1000);
        assertTrue(abs(est-root) <= 2*error) # wiggle room for approximation
        assertTrue(abs(est-root) > error^2) # not strictly true in all cases
    end

    function test_successive_estimations
    [ignore list] = secant_root_est(@(x)x^2-2, 1, 10^-8, 1000);
    assertElementsAlmostEqual(list(1), 1)
    assertElementsAlmostEqual(list(2), 1.5)
    assertTrue(length(list) == 6)

