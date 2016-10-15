function test_suite = test_calculus_derivative_richardson ()
    initTestSuite;
    
function test_no_crash
    y = derivative_richardson('x^2', 1);
    y = derivative_richardson(@(x)sin(x), 1);
    y = derivative_richardson('tan(x)/x^x', 2, .00001);
    y = derivative_richardson(@(x)x^x, 2, .00001);
    y = derivative_richardson('tan(x)/x^x', 2, .5, 10^-10);
    y = derivative_richardson(@(x)x^x, 2, .5, 10^-10);
    
    disp("Warnings expected for lack of divergence (but no crashes):")
    y = derivative_richardson('tan(x)/x^x', 2, .5, 10^-16,1);
    y = derivative_richardson(@(x)x^x, 2, .5, 10^-16,1);
    
function test_correctness
    assertEqual(derivative_richardson(@(x)x^2, 2, 1), 4)
    assertElementsAlmostEqual(derivative_richardson('sin(x)',0),1)

