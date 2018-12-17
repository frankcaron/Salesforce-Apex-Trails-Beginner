@isTest
public class TestVerifyDate {

    @isTest static void testWithin30Days()
    {

        //Return Date 2
        Date date1 = Date.today();
        Date date2 = Date.today().addDays(29);

        Date checkedDate = VerifyDate.checkDates(date1, date2);

        System.assertEquals(date2, checkedDate);

    }

    @isTest static void testOutside30Days()
    {

        //Return End Of Month
        Date date1 = Date.today();
        Date date2 = Date.today()+40;

        Date checkedDate = VerifyDate.checkDates(date1, date2);

        System.assertequals(checkedDate.month(),date1.month());
        System.assert(checkedDate.day() - 28 >= 0);

    }

    
}