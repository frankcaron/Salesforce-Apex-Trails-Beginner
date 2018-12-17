@isTest
private class StringArrayTestTester {
    static testMethod void ensureCountWorks() {

        StringArrayTest myTestArray = new StringArrayTest();

        List<String> testedArray = myTestArray.generateStringArray(5);

        //System should return back an array of length five
        System.assertEquals(testedArray.size(), 5);
    }

    static testMethod void ensureElementMatches() {

        StringArrayTest myTestArray = new StringArrayTest();

        List<String> testedArray = myTestArray.generateStringArray(5);

        //System should return back appropriate
        System.assertEquals(testedArray[1], 'Test 1');
    }
}