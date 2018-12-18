/*

The Apex class must be called 'AnimalLocator', have a 'getAnimalNameById' method that accepts an Integer and returns a String.
The 'getAnimalNameById' method must call https://th-apex-http-callout.herokuapp.com/animals/:id, using the ID passed into the method. The method returns the value of the 'name' property (i.e., the animal name). 

*/

public with sharing class AnimalLocator {
    
    public static String getAnimalNameById(Integer idToGet) {
        String animalName = '';

        //Call out
        Map<String, Object> retrievedAnimal = getResource('animals', idToGet);

        //Parse
        if (retrievedAnimal != null) {
            animalName = retrievedAnimal.get('name').toString();
        }

        //Return
        return animalName;
    }

    private static Map<String, Object> getResource(String collectionName, Integer idToGet) {

        //Get response
        HttpResponse response = getCallout(collectionName, idToGet);
        
        //Compute singular resource name
        //String resourceName = collectionName.substring(0, collectionName.length()-1);
        
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            Map<String, Object> resource = (Map<String, Object>) results.get('animal');
			
            System.debug('DEBUG --> ' + collectionName);
            System.debug('DEBUG --> ' + results);
            System.debug('DEBUG --> ' + resource);

            if (resource.get('id') == idToGet) {
                return resource;
            }
        }

        return null;
    }

    public static HttpResponse getCallout(String collectionName, Integer idToGet) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/' + collectionName + '/' + idToGet);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        return response;
    }

}