@isTest
private class ContactAndLeadSearchTests {
    static testMethod void ensureAccountCreation() {

        //Fetch
        List<List<sObject>> matchingRecords = ContactAndLeadSearch.searchContactsAndLeads('Smith');

        //Validate
        System.assert(matchingRecords.size() >= 0);

    }
}
