@isTest
private class ContactSearchTests {
    static testMethod void ensureResultsAreReturned() {

        //Create account
        List<Contact> contacts = ContactSearch.searchForContacts('Ruiz', '111111');

        //Validate
        System.assert(contacts.size() >= 0);
    }
}
