/* 

Create an Apex class named AccountUtils and include a static method named accountsByState that accepts a state abbreviation as a string and returns a List of Account objects
The method must return the ID and name of all Account objects that match the BillingState for the state abbreviation passed to the method

*/ 

public with sharing class AccountUtils {
    public static List<Account> accountsByState(String state) {
        List<Account> accounts = new List<Account>();
        accounts = [SELECT Id, Name FROM Account WHERE BillingState = :state];
        return accounts;
    }
}
