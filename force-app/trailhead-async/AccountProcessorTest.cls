@isTest
public class AccountProcessorTest {

    @isTest static void testAccounts() {

        //Create temp account and contact
        Account newAccount = new Account(Name='Testy Account');
        insert newAccount;

        Contact newContact = new Contact(LastName='Tester', AccountId=newAccount.Id);
        insert newContact;

        System.debug('TEST --> Account ID' + newAccount.Id);

        //Create array of Ids
        List<Id> accountIds = new List<Id>();
        accountIds.add(newAccount.Id);

        //Set fields
        Test.startTest();
        AccountProcessor.countContacts(accountIds);
        Test.stopTest();

        //Get final account
        Account finalAccount = [select Number_of_Contacts__c from Account where id = :newAccount.Id LIMIT 1];
        System.assertEquals(1, finalAccount.Number_Of_Contacts__c);

    }
}