function test_suite = test_calculus_derivative_basic ()
    initTestSuite;
    
function test_no_crash
    y = derivative_basic('x^2', 1);
    y = derivative_basic(@(x)sin(x), 1);
    y = derivative_basic('tan(x)/x^x', 2, .00001);
    y = derivative_basic(@(x)x^x, 2, .00001);
    
function test_correctness
    assertEqual(derivative_basic(@(x)x^2, 2, 1), 4)
    assertElementsAlmostEqual(derivative_basic('sin(x)',0),1)
