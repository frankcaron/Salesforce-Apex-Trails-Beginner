
/* 

Create an Apex class named AccountTriggerHandler that contains a public static method called CreateAccounts to accept the List of Account objects
For each Account record, before saving, ensure that the ShippingState field has the same value as the BillingState field

Write an Apex trigger named AccountTrigger that fires before records are inserted
The Apex trigger must call the AccountTriggerHandler.CreateAccounts() method with the collection of new records
Make sure you use the isBefore and isInsert trigger context variables
Create a test class named AccountTriggerTest that inserts 200 Account records with a BillingState of CA. After the insert, test to ensure that all 200 records have a ShippingState of CA
Before verifying this challenge, run your test class at least once using the Developer Console Run All feature.

*/

public class AccountTriggerHandler {
    public static void CreateAccounts(List<Account> acclist){
        for(Account a:acclist) {
            if(a.ShippingState!=a.BillingState) {
                a.ShippingState = a.BillingState; // you need to update ShippingState
            }
        }
    }
}
