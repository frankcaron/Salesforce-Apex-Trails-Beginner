@isTest
public class LeadProcessorTest {

    @isTest static void testProcessedLeads() {
        Test.startTest();
        LeadProcessor ledy = new LeadProcessor();
        Id batchId = Database.executeBatch(ledy);
        Test.stopTest();
        // after the testing stops, assert records were updated properly
        System.assertEquals(200, [select count() from lead where LeadSource = 'Dreamforce']);
    }

    @testSetup static void setup() {
        List<Lead> leads = new List<Lead>();
        // insert 10 leads
        for (Integer i=0;i<200;i++) {
            leads.add(new Lead(LastName='Tester',Company='Tested',LeadSource='Web'));
        }
        insert leads;
    }
}