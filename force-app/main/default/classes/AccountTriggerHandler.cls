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
}
