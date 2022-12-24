public class SoqlDemo22 {
    public static void soqlChildToParent_1() {
        List<contact> listContact = [select id, name, account.name , account.Industry
                            from contact where account.industry = 'energy'];
        for (contact eachContact : listContact) {
            string cntName = eachContact.Name;
            string cntId = eachContact.Id;
            string accountName = eachContact.account.Name;
            //string accountInd = eachContact.account.Industry;
            system.debug('contact name is ' + cntName + ', account name is ' + accountName);
        }
    }

    public static void soqlParentToChild_1() {
        //query account record, print annual revenue. Type = 'Customer - Direct'
        //outer query or main query is for account object. 
        //Inner query is opportunity
        List<account> listAccOpp = [select id, name, annualrevenue,
                                (select name, amount from Opportunities where stagename = 'Closed Won') 
                                from account where type = 'Customer - Direct'];
        for (account eachAcc : listAccOpp) {
            system.debug('account name is ' + eachAcc.Name + ', annual revenue is ' + eachAcc.AnnualRevenue);
            List<Opportunity> listOpp = eachAcc.Opportunities;
            for (opportunity eachOpp : listOpp) {
                system.debug('--- opp name is ' + eachOpp.Name + ', amount is ' + eachOpp.Amount);
            }
        }
    }
}
