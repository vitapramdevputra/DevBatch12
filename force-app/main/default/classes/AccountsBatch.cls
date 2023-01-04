public class AccountsBatch implements Database.Batchable<sObject>, database.stateful{
    public Integer count = 0;
    public integer countRecords = 0;


   //start the first method to RUN in Batch class
   //we write SOQL in start
   public Database.QueryLocator start(Database.BatchableContext bc){
     //soql query
     database.QueryLocator q1 = Database.getQueryLocator([select id, name, description, active__c from account]);
     return q1;
   }
   //execute method runs Multiple times to process group(chunk) of records
   public void execute(Database.BatchableContext bc, list<account> scope){
        system.debug('execute start');
        count++;
        //scope means group of account records which we want to update
        list<account> updateAccs = new list<account>();
        for (account eachAcc : scope) {
            if (eachAcc.Active__c != 'No') {
                eachAcc.Description += '...updated via batch. Enjoy.';
                updateAccs.add(eachAcc);
                countRecords++;
            }
        }
        if (!updateAccs.isEmpty()) {
            update updateAccs;
        }
        system.debug('number of times execute executed: ' + count);
        system.debug('numbef of records processed: ' + countRecords);
        system.debug('execute done.');
   }
   //finish method runs when all the group of records are processed.
   public void finish(Database.BatchableContext bc){
        system.debug('finish method called.');
        system.debug('FINISH number of times execute executed: ' + count);
        system.debug('FINISH numbef of records processed: ' + countRecords);
   }
   
}
