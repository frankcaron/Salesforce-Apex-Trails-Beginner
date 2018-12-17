/* 
Test Class for a Trailhead

Requirements: 
    The Apex class must have a public static method called searchForContacts
        The method must accept two incoming strings as parameters
        The method should then find any contact that has a last name matching the first string, and mailing postal code (API name: MailingPostalCode) matching the second string
        The method should finally return a list of Contact records of type List that includes the ID and Name fields
*/

public class ContactSearch {

    //Create a new account
    public static List<Contact> searchForContacts(String a, String b) {

        List<Contact> cts = [SELECT Name, ID, LastName, MailingPostalCode FROM Contact WHERE LastName = :a AND MailingPostalCode = :b];
        return cts;

    }
}
