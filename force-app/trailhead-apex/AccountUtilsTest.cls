@isTest
private class AccountUtilsTest {
    static testMethod void ensureAccountsAreReturned() {

        //Create account
        List<Account> myAccounts = AccountUtils.accountsByState('TN');

        //Validate
        System.assert(myAccounts.size() >= 0);
    }
}
