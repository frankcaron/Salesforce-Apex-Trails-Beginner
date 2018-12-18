/* 

Create a class called 'ParkLocator' that has a 'country' method that uses the 'ParkService' class and returns an array of available park names for a particular country passed to the web service. Possible country names that can be passed to the web service include Germany, India, Japan and United States.

*/

public with sharing class ParkLocator {
    public static List<String> country(String country) {
        ParkService.ParksImplPort grabMyPark = new ParkService.ParksImplPort();
        return grabMyPark.byCountry('Germany'); 
    }
}
