@isTest
public class AccountTriggerTest {
   //how to test triggers?
   //create /update/delete/undelete data.
   @isTest
   private static void testMethod1() {
        //create account record
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

         //update record
         for (account eachAcc : listAcc) {
            eachAcc.Description = 'update';
         }
         update listAcc;

   }
}
