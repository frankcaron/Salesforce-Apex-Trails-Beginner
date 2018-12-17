/*

Create an Apex class called 'AddPrimaryContact' that implements the Queueable interface.
Create a constructor for the class that accepts as its first argument a Contact sObject and a second argument as a string for the State abbreviation.
The execute method must query for a maximum of 200 Accounts with the BillingState specified by the State abbreviation passed into the constructor and insert the Contact sObject record associated to each Account. Look at the sObject clone() method.

*/

public with sharing class AddPrimaryContact implements Queueable {
    
    private String thisState;
    private Contact thisContact;

    public AddPrimaryContact(Contact myContact, String stateAbbrev) {
        thisState = stateAbbrev;
        thisContact = myContact;
    }
    
    public void execute(QueueableContext context) {

        List<Account> accounts = [SELECT Id, BillingState FROM Account WHERE BillingState = :thisState LIMIT 200];

        for (Account account : accounts) {
            Contact toInsert = thisContact.clone();
            toInsert.AccountId = account.id;
            insert toInsert;
        }
    }
}

