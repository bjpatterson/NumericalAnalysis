function test_suite = test_calculus_integrate_trapezoid ()
    initTestSuite;

function test_no_crash
    y = integrate_trapezoid("sin(x)", 0, pi/2);
    y = integrate_trapezoid(@(x)sin(x), 0, pi/2);
    y = integrate_trapezoid("sin(x)", 0, pi/2, 100);
    y = integrate_trapezoid(@(x)sin(x), 0, pi/2, 100);
    
function test_correctness
    assertElementsAlmostEqual(integrate_trapezoid(@(x)x^2, 0, 2, 5000), 8/3);
    assertElementsAlmostEqual(integrate_trapezoid('sin(x)', 0, pi/2, 5000),1);
    