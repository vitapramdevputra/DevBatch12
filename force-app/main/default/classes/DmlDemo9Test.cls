@isTest
public class DmlDemo9Test {
    @isTest
    private static void dmlInsert1Test() {
        //DML in TEST
        DmlDemo9.dmlInsertDemo_stndObj();//call dml method
        //will it insert record in org?     NO. 

        //it will insert record in Testing world.

        //how to verify then?
        //get the record from testing world.

        //soql -> we cannot get records from org.
            //-> we get the records from TESTING world.
        List<account> listAcc = [select id, name from account where name = 'SoftInnovas'];
        system.assertEquals(1, listAcc.size());
        Account acc1 = listAcc[0];
        system.assertEquals('SoftInnovas', acc1.Name);
    }
    @isTest
    private static void dmlInsert4test() {
        //create account record before calling method.
        //prepare data.
        Account acc = new account();
        acc.name = 'SoftInnovas Inc.';
        insert acc;
        DmlDemo9.dmlInsertDemo_4();//will this work?
        //how to verify?
        list<contact> allContacts = [select id, lastname, name from contact where lastname = 'Biden'];
        system.assertEquals('Biden', allContacts[0].LastName);
    }
}
