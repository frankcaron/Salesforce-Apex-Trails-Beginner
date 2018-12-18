/* 
The Apex class must have a method called 'getAccount' that is annotated with @HttpGet and returns an Account object.
The method must return the ID and Name for the requested record and all associated contacts with their ID and Name.

https://frankycaron-dev-ed.my.salesforce.com/services/apexrest/
*/

@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing class AccountManager {
    
    @HttpGet
    global static Account getAccount() {
        RestRequest request = RestContext.request;
        String accountId = request.requestURI.substringBetween('Accounts/','/contacts');
        Account result = [SELECT Id,Name,(SELECT Id,Name FROM Contacts) FROM Account WHERE Id = :accountId LIMIT 1];
        return result;
    }
}
