/* 
Test Class for a Trailhead

Requirements: 
The Apex class must have a public static method called searchContactsAndLeads
The method must accept an incoming string as a parameter
The method should then find any contact or lead that matches the string as part of either the first or last name
The method should finally use a return type of List<List< SObject>>
*/

public class ContactAndLeadSearch {

    //Create a new account
    public static List<List<sObject>> searchContactsAndLeads(String a) {

        List<List<SObject>> cts = [FIND :a IN NAME FIELDS RETURNING Lead(FirstName,LastName),Contact(FirstName,LastName,Department)];
        return cts;

    }
}
