/*

Create an Apex class called 'AccountProcessor' that contains a 'countContacts' method that accepts a List of Account IDs. This method must use the @future annotation.
For each Account ID passed to the method, count the number of Contact records associated to it and update the 'Number_of_Contacts__c' field with this value.

*/ 

global class AccountProcessor {

    //Count number of contact records for account
    //Update account's Number of Contacts field

    @future
    public static void countContacts(List<ID> AccountIds) {

        //Grab accounts
        List<Account> accounts = [Select Id, Name, Number_of_Contacts__c from Account Where Id IN :AccountIds];

        System.debug('DEBUG --> Created a set with ' + accounts.size() + ' IDs');

        for (Account thisAccount : accounts) {
            List<Contact> accountContacts = [SELECT Id FROM Contact where Account.Id = :thisAccount.id];
            thisAccount.Number_of_Contacts__c = accountContacts.size();
            update thisAccount;

            System.debug('DEBUG --> Set ' + accountContacts.size() + ' for Account ' + thisAccount.Id);
            System.debug('DEBUG --> Currently set to ' + thisAccount.Number_of_Contacts__c);


        }

    }
}
