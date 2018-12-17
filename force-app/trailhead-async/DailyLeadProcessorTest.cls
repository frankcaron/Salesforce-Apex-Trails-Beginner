/* 
In the test class, insert 200 Lead records, schedule the DailyLeadProcessor class to run and test that all Lead records were updated correctly.
*/

@isTest
public class DailyLeadProcessorTest {

    @isTest static void testedDailyProcessedLeads() {

        String CRON_EXP = '0 0 0 15 3 ? 2022';

        Test.startTest();

        String jobId = System.schedule('ScheduledApexTest',
            CRON_EXP, 
            new DailyLeadProcessor());

        Test.stopTest();

        // after the testing stops, assert records were updated properly
        System.assertEquals(200, [SELECT count() FROM lead WHERE LeadSource = 'Dreamforce']);
        
    }

    @testSetup static void setup() {

        List<Lead> leads = new List<Lead>();
        // insert 10 leads
        for (Integer i=0;i<200;i++) {
            leads.add(new Lead(LastName='Tester',Company='Tested',LeadSource=''));
        }
        insert leads;
    }
}