public class AccountTriggerHandler {
    public static void updateAccountDescription(List<account> accTriggerNew, List<account> accTriggerOld, 
                                    Map<id, account> accTriggerNewMap, Map<id, account> accTriggerOldMap) {
        for (Account eachAccount : accTriggerNew) {
            boolean updateDesc = false;
            if (Trigger.isInsert && eachAccount.Active__c == 'Yes') {
                updateDesc = true;
            }
            if (Trigger.isUpdate) {
                Id accId = eachAccount.Id;
                Account oldAcc = accTriggerOldMap.get(accId);
                Account newAcc = accTriggerNewMap.get(eachAccount.Id);
                if(eachAccount.Active__c == 'Yes' && oldAcc.Active__c != newAcc.Active__c){
                    updateDesc = true;
                }
            }
            if (updateDesc) {
                eachAccount.Description = 'Account is now Active. Enjoy, celebrate, have fun.';
            }
        }
    }

    public static void updateVIPforContacts(List<account> accTriggerNew, List<account> accTriggerOld, 
    Map<id, account> accTriggerNewMap, Map<id, account> accTriggerOldMap) {
            //set of account ids
            set<id> accountIds = new set<id>();
        //for trigger.new
        for (Account eachAcc : accTriggernew) {
             //check if vip is changed (if condition)
             if (eachAcc.vip__c != accTriggerOldMap.get(eachAcc.Id).vip__c) {
                //add acc id in set of accountids
                accountIds.add(eachAcc.Id);
             }
        } //we have all acc ids where is vip is changed
        //get contacts of all the accounts where vip is changed. 
        list<contact> allContacts = [select id, vip__c, accountId from contact where accountId in :accountIds];
       
        if (!allContacts.isEmpty()) {
            //for loop of contact
            for (contact eachContact : allContacts) {
                //set vip field same as account's vip field
                //eachContact.vip__c = account's vip field
                account newAcc = accTriggerNewMap.get(eachContact.AccountId);
                boolean accVIP = newAcc.vip__c;

                eachContact.vip__c = accTriggerNewMap.get(eachContact.AccountId).vip__c;
            }
            update allContacts;
        }
    }
}
