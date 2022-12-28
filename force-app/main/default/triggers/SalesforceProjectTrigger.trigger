trigger SalesforceProjectTrigger on Salesforce_Project__c (before insert, after insert, before update, after update) {
    if (Trigger.isAfter && Trigger.isInsert) {
        //here we will call handler to create default ticket.
        SalesforceProjectTriggerHandler.createDefaultTicket(trigger.new);

        //call future method
        system.debug('calling future method. NOW.');
        Map<id, Salesforce_Project__c> spNewMap = trigger.newMap;
        SalesforceProjectTriggerHandler.updateProjectDescription(spNewMap.keySet());
        system.debug('called future method. DONE.');
    }
    if (Trigger.isBefore && Trigger.isUpdate) {
        //do the completion valdiation
        //SalesforceProjectTriggerHandler.validateSPComplete(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    }
    if(Trigger.isAfter && Trigger.isUpdate){
        //call method
        //call method a)
        SalesforceProjectTriggerHandler.spCompletedStatus(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    }
}