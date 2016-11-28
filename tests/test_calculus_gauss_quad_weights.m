
function test_suite = test_calculus_gauss_quad_weights ()
    initTestSuite;

function test_correctness
    [x,w] = gauss_quad_weights(1);
    assertElementsAlmostEqual(x, 0);
    assertElementsAlmostEqual(w, 2);
    
    [x,w] = gauss_quad_weights(2);
    assertElementsAlmostEqual(abs(x(1)), abs(x(2)));
    assertElementsAlmostEqual(abs(x(1)), sqrt(1/3));
    assertElementsAlmostEqual(w(1), w(2));
    assertElementsAlmostEqual(w(1), 1);
    
    [x,w] = gauss_quad_weights(3);
    assertElementsAlmostEqual(abs(x(1)), abs(x(3)));
    assertElementsAlmostEqual(abs(x(2)), 0);
    assertElementsAlmostEqual(abs(x(1)), sqrt(3/5));
    assertElementsAlmostEqual(w(1), w(3));
    assertElementsAlmostEqual(w(1), 5/9);
    assertElementsAlmostEqual(w(2), 8/9);
    
    [x,w] = gauss_quad_weights(3, 0, 1);
    assertElementsAlmostEqual(abs(.5 - x(1)), abs(.5 - x(3)));
    assertElementsAlmostEqual(abs(x(2)), .5);
    assertElementsAlmostEqual(abs(.5-x(1)), sqrt(3/5)/2);
    assertElementsAlmostEqual(w(1), w(3));
    assertElementsAlmostEqual(w(1), 5/18);
    assertElementsAlmostEqual(w(2), 4/9);
    