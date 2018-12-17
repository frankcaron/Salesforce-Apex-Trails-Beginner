public with sharing class NewCaseListController {

    /* Get new cases
    A publicly scoped method named getNewCases
    Use the return type of List<Case>
    Return a list of case records that includes the ID and CaseNumber fields
    Filter the results returned to only have a status of New
    */

    public List<Case> getNewCases() {
        List<Case> cases = new List<Case>();

        //Filter cases
        cases = [SELECT Id, CaseNumber FROM Case WHERE Status = 'New'];

        return cases;
    }
}
