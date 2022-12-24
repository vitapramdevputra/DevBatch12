@isTest
public class SoqlDemo22Test {
    @TestSetup //we have some accounts in testSetup.
    static void makeData(){
        //1. prepare data
        Account acc1 = new account();
        acc1.Name = 'SI Test';
        acc1.Industry = 'Energy';

        Account acc2 = new account();
        acc2.Name = 'UI Test';
        acc2.Industry = 'Energy';

        Account acc3 = new account();
        acc3.Name = 'PI Test';
        acc3.Industry = 'Banking';

        List<account> listAcc = new list<account>{acc1, acc2, acc3};
        insert listAcc;

        List<contact> listContact = new list<Contact>();
        for (Integer i = 0; i < 300; i++) {
            contact c = new contact();
            c.Lastname = 'test soql';
            if (i < 100) {
                c.AccountId = acc1.id;
            } else if (i < 200) {
                c.AccountId = acc2.id;
            } else {
                c.AccountId = acc3.id;
            }
            listContact.add(c);
        }
        insert listContact;
    }

    @isTest
    private static void testMethod1() {
        //2. test.starttest
        Test.startTest();
        SoqlDemo22.soqlChildToParent_1();
        Test.stopTest();
    }

    @isTest
    private static void testMethod2() {
        //how to update accounts we created in testSetup?
        //first soql
        list<account> listAcc = [select id, name from account];
        for (account eachAcc : listAcc) {
            eachAcc.type = 'Customer - Direct';
        }
        update listAcc;

        List<Opportunity> listOpp = new List<Opportunity>();
        for (Integer i = 0; i < 300; i++) {
            Opportunity op = new Opportunity();
            op.name = 'Test opp';
            op.StageName = 'Closed Won';
            op.CloseDate = date.today();
            if (i < 100) {
                op.AccountId = listAcc[0].id;
            } else if (i < 200) {
                op.AccountId = listAcc[1].id;
            } else {
                op.AccountId = listAcc[2].id;
            }
            listOpp.add(op);
        }
        insert listOpp;

        Test.startTest();
        SoqlDemo22.soqlParentToChild_1();
        Test.stopTest();

    }

    //testmethod3
        //fetch accounts list<account> listAcc = [select id, name from account];
        //type ? => null. why null? 
}
