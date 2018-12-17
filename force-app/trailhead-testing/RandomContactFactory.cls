/*

The Apex class must be called 'RandomContactFactory' and be in the public scope.
The Apex class should NOT use the @isTest annotation.
The Apex class must have a public static method called 'generateRandomContacts' (without the @testMethod annotation).
The 'generateRandomContacts' method must accept an integer as the first parameter, and a string as the second. The first parameter controls the number of contacts being generated, the second is the last name of the contacts generated.
The 'generateRandomContacts' method should have a return type of List<Contact>.
The 'generateRandomContacts' method must be capable of consistently generating contacts with unique first names.
For example, the 'generateRandomContacts' might return first names based on iterated number (i.e. 'Test 1','Test 2').
The 'generateRandomContacts' method should not insert the contact records into the database.

*/

public with sharing class RandomContactFactory {
    
    public static List<Contact> generateRandomContacts(Integer count, String lastName) {
        List<Contact> toReturn = new List<Contact>();

        for (Integer i = 0; i < count; i++) {
            String fakeName = 'Test' + i;
            Contact newb = new Contact(FirstName=fakeName, LastName=lastName);
            toReturn.add(newb);
        }
        
        return toReturn;
    }
    
}
