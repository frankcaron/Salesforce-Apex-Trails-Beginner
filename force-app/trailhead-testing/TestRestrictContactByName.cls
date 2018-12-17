@isTest
public class TestRestrictContactByName {

    @isTest static void restrictedContact()
    {

        //Create and insert contact
        Contact contactToTest = new Contact(FirstName='Bob',LastName='INVALIDNAME');
        Boolean testedSuccessfully = true;

        try {
            insert contactToTest;
        } catch (DmlException e) {
            System.debug('Nope.');
            testedSuccessfully = false;
        }

        //Assert normal 
        System.assert(!testedSuccessfully);


    }
    
    @isTest static void legitContact()
    {
        //Create and insert contact
        Contact contactToTest = new Contact(FirstName='Bob',LastName='Loblaw');
        Boolean testedSuccessfully = true;

        try {
            insert contactToTest;

        } catch (DmlException e) {
            System.debug('Nope.');
            testedSuccessfully = false;
        }

        //Assert normal 
        System.assert(testedSuccessfully);
    }

}