@isTest
public class AccountQueueableExampleTest {
    @isTest
    private static void testQueueable1() {
        //1. prepare data
        //1. prepare data
        list<account> listAcc = new list<account>();
        for (Integer i = 0; i < 200; i++) {
            account a = new account();
            a.name = 'Pi test ' + i;
            a.Active__c = 'Yes';
            listAcc.add(a);
        }
        insert listAcc;

        //2. 
        Test.startTest();
        //AccountQueueableExample aq = new accountQueueableExample(listAcc);
        system.enqueueJob(new accountQueueableExample(listAcc));
        Test.stopTest();

        //3. assert
        List<account> getAccount = [select id, name from account];
        system.assert(getAccount[0].Name.contains('-- SI'));
    }
}
