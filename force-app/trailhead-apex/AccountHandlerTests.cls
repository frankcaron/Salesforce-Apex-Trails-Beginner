@isTest
private class AccountHandlerTests {
    static testMethod void ensureAccountCreation() {

        //Create account
        Account myAccount = AccountHandler.insertNewAccount('Frank Caron');

        //Validate
        System.assertEquals(myAccount.name, 'Frank Caron');
    }

    static testMethod void ensureNoAccountIsCreated() {

        //Create account
        Account myAccount = AccountHandler.insertNewAccount('');

        //Validate
        System.assertEquals(myAccount, null);
    }
}
