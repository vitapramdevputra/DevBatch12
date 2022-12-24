@isTest
public class AccountTriggerHandlerTest {
    @istest
    private static void testUpdateDescription() {
        //insert account record with active field as yes.
        //1. prepare data
        Account acc1 = new account();
        acc1.Name = 'SI Test';
        acc1.Industry = 'Energy';

        Account acc2 = new account();
        acc2.Name = 'UI Test';
        acc2.Industry = 'Energy';
        acc2.Active__c = 'Yes';

        Account acc3 = new account();
        acc3.Name = 'PI Test';
        acc3.Industry = 'Banking';

        List<account> listAcc = new list<account>{acc1, acc2, acc3};
        insert listAcc;


        //verify description.
        //soql
        Account checkInsertYes = [select id, name, active__c, Description from account where id = :acc2.id];
        system.assertEquals('Account is now Active. Enjoy, celebrate, have fun.', checkInsertYes.Description);
        //check description.
        //assert
        for (account a : listAcc) {
            a.Active__c = 'Yes';
        }
        update listAcc;

        List<account> allAcc = [select id, name, active__c, Description from account];
        system.assertEquals('Account is now Active. Enjoy, celebrate, have fun.', allAcc[0].Description);
    }
    @isTest
    private static void testUpdateVIP() {
        //create 3 account
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
 
          //create 100  contacts for each account
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
           

        //update vip field of 3 account to TRUE.
        for (account a : listAcc) {
            a.vip__c = true;
        }
        update listAcc;
            //it would auto update for all contacts.
        
        //verify if contacts vip is changed.
        list<contact> allContacts = [select id, accountid, vip__c from contact];
            //soql
        for (contact c : allContacts) {
            system.assertEquals(true, c.vip__c);
        }
            //assert.
    }
}
