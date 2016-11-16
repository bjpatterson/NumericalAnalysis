function test_suite = test_calculus_integrate_gauss ()
    initTestSuite;

function test_no_crash
    integrate_gauss("sin(x)", 0, pi/2);
    integrate_gauss(@(x)sin(x), 0, pi/2);
    integrate_gauss("sin(x)", 0, pi/2, 100);
    integrate_gauss(@(x)sin(x), 0, pi/2, 100);
    integrate_gauss("sin(x)", 0, pi/2, 1, 5);
    integrate_gauss(@(x)sin(x), 0, pi/2, 1, 5);
    
function test_correctness
    assertElementsAlmostEqual(integrate_gauss(@(x)x^5, 0, 2,1,3), 32/3);
    assertElementsAlmostEqual(integrate_gauss('sin(x)',0,pi/2,1,5),1);
    assert(0==1) # to ensure tests are being run by CI
