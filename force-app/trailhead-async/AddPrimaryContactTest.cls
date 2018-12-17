/*

In the test class, insert 50 Account records for BillingState "NY" and 50 Account records for BillingState "CA". Create an instance of the AddPrimaryContact class, enqueue the job and assert that a Contact record was inserted for each of the 50 Accounts with the BillingState of "CA".
The unit tests must cover all lines of code included in the AddPrimaryContact class, resulting in 100% code coverage.
Run your test class at least once (via 'Run All' tests the Developer Console) before attempting to verify this challenge.

*/

@isTest
public class AddPrimaryContactTest {
    @isTest static void testAddPrimaryContact() {

        // Standard vars for testing
        String myState = 'NY';
        Contact myContact = new Contact(LastName='Caron');

        //Start the test
        Test.startTest();

        // find all accounts with the appropriate state
        List<Account> accounts = [select id from account where billingstate = :myState];

        // instantiate a new instance of the Queueable class
        AddPrimaryContact addCont = new AddPrimaryContact(myContact, myState);
        
        // enqueue the job for processing
        ID jobID = System.enqueueJob(addCont);

        Test.stopTest();

        // after the testing stops, assert records were updated properly
        System.assertEquals(50, [SELECT count() FROM Contact WHERE AccountId IN :accounts]);

    }

    @testSetup static void setup() {
        List<Account> accts = new List<Account>();

        // insert 50 leads
        for (Integer i=0;i<50;i++) {
            accts.add(new Account(Name='Test Co', BillingState='NY'));
        }

        // insert 50 leads
        for (Integer i=0;i<50;i++) {
            accts.add(new Account(Name='Test Co 2', BillingState='CA'));
        }

        insert accts;
    }
}