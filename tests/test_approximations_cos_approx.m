function test_suite = test_approximations_cos_approx()
    initTestSuite;

function test_negative_degree
    assertEqual(cos_approx(1,-1), 0)

function test_degree_zero
    assertEqual(cos_approx(1,0),1)
    
function test_low_order_correctness
    assertEqual(cos_approx(1,3),.5)

function test_accuracy
    assertElementsAlmostEqual(
    cos_approx(1,25), 0.54030230586814)
