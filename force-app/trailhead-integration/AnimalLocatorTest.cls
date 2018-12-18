@isTest
public class AnimalLocatorTest {

    /* 
    Create a test class named AnimalLocatorTest that uses a mock class called AnimalLocatorMock to mock the callout response. 
    */
    @isTest static void AnimalLocatorMock()
    {
        //Animal ID
        Integer animalId = 1;

        //Set Mock
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());

        //Test
        String animalName = AnimalLocator.getAnimalNameById(animalId);

        //Assert normal 
        System.assertequals('chicken', animalName);

    }

    @isTest static void AnimalNotLocatedMock()
    {
        //Animal ID
        Integer animalId = 1;

        //Set Mock
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorNotFoundMock());

        //Test
        String animalName = AnimalLocator.getAnimalNameById(animalId);

        //Assert normal 
        System.assertequals('', animalName);

    }

    @isTest static void testGetCallout() {

        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock()); 
        // This causes a fake response to be sent
        // from the class that implements HttpCalloutMock. 
        
        HttpResponse response = AnimalLocator.getCallout('animals', 1);

        // Verify that the response received contains fake values
        String contentType = response.getHeader('Content-Type');
        System.assert(contentType == 'application/json');
        String actualValue = response.getBody();
        String expectedValue = '{"animal":{"id":1,"name":"chicken","eats":"chicken food","says":"cluck cluck"}}';
        System.assertEquals(actualValue, expectedValue);
        System.assertEquals(200, response.getStatusCode());
    }
}