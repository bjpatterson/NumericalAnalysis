function test_suite = test_approximations_sin_approx()
    initTestSuite;

function test_negative_degree
    assertEqual(sin_approx(1,-1), 0)

function test_degree_zero
    assertEqual(sin_approx(1,0),0)
    
function test_low_order_correctness
    assertEqual(sin_approx(1,3),5/6)

function test_accuracy
    assertElementsAlmostEqual(sin_approx(1,25), 0.841470984807897)
