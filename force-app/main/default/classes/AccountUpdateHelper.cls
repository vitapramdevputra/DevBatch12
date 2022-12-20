public class AccountUpdateHelper {
    //annonate method with invocable so that it can be called from PB/flows.
    @invocableMethod
    public static void updateAccountWebsite(List<id> accIds) {
        list<account> listAcc = [select id, website from account where id in :accIds];

        for (account eachAcc : listAcc) {
            eachAcc.Website = 'www.softinnovas.com';
        }
        update listAcc;
    }
}
