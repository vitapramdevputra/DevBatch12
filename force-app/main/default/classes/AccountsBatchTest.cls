@isTest
public class AccountsBatchTest {
    @isTest
   private static void testBatch1() {
        //1. prepare data
        list<account> listAcc = new list<account>();
        for (Integer i = 0; i < 900; i++) {
            account a = new account();
            a.name = 'Pi test ' + i;
            a.Active__c = 'Yes';
            listAcc.add(a);
        }
        insert listAcc;

        //2. Test.startest
        Test.startTest();
        AccountsBatch ab = new AccountsBatch();
        //we cannot divide in groups when we executing batch from TEST class.
        //it must process in 1 CHUNK.
        
        //System.UnexpectedException: No more than one executeBatch can be called from within a test method.  
        //Please make sure the iterable returned from your start method matches the batch size, resulting in one executeBatch invocation.
        Id jobId = database.executeBatch(ab, 900);
        Test.stopTest();

        //3. assert
        List<account> getAccounts = [select id, description from Account];
        system.assert(getAccounts[0].Description.contains('batch'));
   }
}
