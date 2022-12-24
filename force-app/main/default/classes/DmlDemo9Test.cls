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
    @isTest
    private static void dmlInsert5test() {
        //creating 10k projects
        Salesforce_Project__c sp  = new Salesforce_Project__c();
        sp.Project_Name__c = 'SP test';
        sp.Status__c = 'New';
        insert sp;

        Test.startTest();
        //actual method to test.
        DmlDemo9.dmlInsertDemo_5(); //will this work?
        Test.stopTest();

        //to verify, we soql.
        List<Salesforce_Ticket__c> listST = [select id, subject__c, salesforce_project__c 
                            from Salesforce_Ticket__c where Subject__c = 'Learn apex dml'];
        system.assertEquals(sp.Id, listST[0].Salesforce_Project__c);
    }
}
