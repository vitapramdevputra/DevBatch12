public class AccountQueueableExample implements Queueable{
    List<account> listAcc = new list<account>();
    //constructor
    public AccountQueueableExample(List<account> accounts){
        listAcc = accounts;
    }
    public void execute(QueueableContext qc){
        list<account> updateAccs = new list<account>();
        for (account eachAcc : listAcc) {
            Account a = new account();
            a.Id = eachAcc.id;
            a.Name =  eachAcc.Name + ' -- SI';
            updateAccs.add(a);
        }
        update updateAccs;
    }
}
