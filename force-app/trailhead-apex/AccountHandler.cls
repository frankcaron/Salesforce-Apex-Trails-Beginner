/* 
Test Class for a Trailhead

Requirements: 
    The method must accept an incoming string as a parameter, which will be used to create the Account name
    The method must insert the account into the system and then return the record
    The method must also accept an empty string, catch the failed DML and then return null
*/

public class AccountHandler {

    //Create a new account
    public static Account insertNewAccount(String givenName) {

        //Create placeholder
        Account newAccount = new Account(Name=givenName);

        //Try to DML it
        try {
            //Attempt the insert
            insert newAccount;
            
        } catch (System.DmlException e) {
            System.debug('A DML exception has occurred: ' +
                e.getMessage());
            return null;
        }

        return newAccount;
    }
}
