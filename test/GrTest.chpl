use UnitTest;

config const testParam: bool = true;

proc myTest(test: Test) {
  test.assertTrue(testParam);
}
