function test_suite = test_exp_approx()
    initTestSuite;

function test_negative_degree
    assertEqual(exp_approx(1,-1), 0)

function test_degree_zero
    assertEqual(exp_approx(1,0),1)
    
function test_low_order_correctness
    assertEqual(exp_approx(1,2),2.5)

function test_accuracy_of_e
    assertElementsAlmostEqual(exp_approx(1,25), 2.71828182845905)

function test_accuracy_of_e_squared
    assertElementsAlmostEqual(exp_approx(2.3,30), 9.97418245481472)
