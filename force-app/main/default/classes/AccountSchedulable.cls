public class AccountSchedulable implements Schedulable{
    public void execute(SchedulableContext sc){
        //we can call any method of any apex class here.
        //or we can directly write some apex code here
        //or we can call future, queueable, or batch.
        //Batch is recommended because if we have lots of records, we can process.

        database.executeBatch(new accountsBatch());
    }
}
