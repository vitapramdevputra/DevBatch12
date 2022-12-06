public class DmlDemo {
    public static void dmlInsertDemo_stndObj() {
        //we will create account record using Apex.
        //1. create new instance.
        Account acc = new account();

        //2. set field values
        acc.Name = 'SoftInnovas';
        
        //dml
        insert acc;
        system.debug('inserted acc: ' + acc);
    }

    public static void dmlInsertDemo_cstmObj() {
        //1. create new instance
        Salesforce_project__c spNew = new salesforce_project__c();
        //set field values
        spNew.project_name__c = 'Teach DML to Batch12';
        spNew.description__c = 'All of you doing great.';

        //3.  dml (insert)
        insert spNew;
    }

    public static void dmlUpdateDemo_1() {
        Account acc = new account();
        acc.name = 'sfdc';
        insert acc;

        //update field name
        acc.Name = 'Salesforce Inc.';
        update acc;
    }
}
