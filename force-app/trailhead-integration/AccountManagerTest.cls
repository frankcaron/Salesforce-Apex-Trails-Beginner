//Test  class
@isTest 
private class AccountManagerTest {
    static testMethod void testAccountManager(){

        //Setup test
        Account acc = new Account(Name = 'Testy');
        insert acc;

        Id recordId = acc.Id;

        Contact con = new Contact(LastName = 'Tester', AccountId = recordId);
        insert con;

        //Test Call
        RestRequest request = new RestRequest();
        request.requestUri = 'https://frankycaron-dev-ed.my.salesforce.com/services/apexrest/Accounts/' + recordId + '/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;

        // Call the method to test
        Account thisAccount = AccountManager.getAccount();

        // Verify results
        System.assert(thisAccount!= null);
        System.assertEquals('Testy', thisAccount.Name);
    }
}