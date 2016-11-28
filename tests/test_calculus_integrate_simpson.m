function test_suite = test_calculus_integrate_simpson ()
    initTestSuite;

function test_no_crash
    integrate_simpson("sin(x)", 0, pi/2);
    integrate_simpson(@(x)sin(x), 0, pi/2);
    integrate_simpson("sin(x)", 0, pi/2, 100);
    integrate_simpson(@(x)sin(x), 0, pi/2, 100);
    
function test_correctness
    assertEqual(integrate_simpson(@(x)x^2, 0, 2), 8/3);
    assertElementsAlmostEqual(integrate_simpson('sin(x)',0,pi/2),1);
