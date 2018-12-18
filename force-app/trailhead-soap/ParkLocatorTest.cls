@isTest
private class ParkLocatorTest {
    static testMethod void testCallout() {

        //Name
        String country = 'Germany';

        //Set Mock
        Test.setMock(WebServiceMock.class, new ParkServiceMock());

        //Test
        List<String> parkNames = ParkLocator.country(country);

        //Assert normal 
        System.assertequals(parkNames.size(), 1);

    }
}
