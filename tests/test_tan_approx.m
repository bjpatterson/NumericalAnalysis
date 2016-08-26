function test_suite = test_tan_approx()
    initTestSuite;

function test_negative_degree_crash
    assertEqual(tan_approx(1,-1),NaN)

function test_degree_zero
    assertEqual(tan_approx(1,0),0)
    
function test_low_order_correctness
    assertEqual(tan_approx(1,3),5/3)

function test_accuracy
    assertElementsAlmostEqual(
    tan_approx(1,25),
    0.841470984807897/0.54030230586814
)
