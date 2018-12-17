/*
Create an Apex class that implements the Database.Batchable interface to update all Lead records in the org with a specific LeadSource. 

Use a QueryLocator in the start method to collect all Lead records in the org.
The execute method must update all Lead records in the org with the LeadSource value of 'Dreamforce'.
*/

global with sharing class LeadProcessor implements Database.Batchable<sObject> {

    global Integer recordsProcessed = 0;

    global Database.QueryLocator start(Database.BatchableContext bc) {
        // collect the batches of records or objects to be passed to execute
        return Database.getQueryLocator(
            'SELECT ID, LeadSource FROM Lead'
        );

    }
    global void execute(Database.BatchableContext bc, List<Lead> scope){
        // process each batch of records
        for (Lead l : scope) {
            l.LeadSource = 'Dreamforce';
            update l;
            recordsProcessed++;
        }
    }    
    global void finish(Database.BatchableContext bc){
        // execute any post-processing operations
        System.debug(recordsProcessed + ' records processed. Shazam!');

        AsyncApexJob job = [SELECT Id, Status, NumberOfErrors, 
            JobItemsProcessed,
            TotalJobItems, CreatedBy.Email
            FROM AsyncApexJob
            WHERE Id = :bc.getJobId()];
    } 
}