
public with sharing class StringArrayTest {
    
    //Constructor
    public StringArrayTest() {
        //
    }

    //Public method to return list array
    public List<String> generateStringArray(Integer numStrings) {
        List<String> myList = new List<String>();
        Integer count = 0;

        //Count up to the numStrings requested
        do {
            String newString = 'Test ' + String.valueOf(count);
            count++;
            myList.add(newString);
        } while (count < numStrings);

        //Return array
        return myList;
    }
}
