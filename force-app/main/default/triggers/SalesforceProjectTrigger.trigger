trigger SalesforceProjectTrigger on Salesforce_Project__c (before insert, after insert, before update) {
    if (Trigger.isAfter && Trigger.isInsert) {
        //here we will call handler to create default ticket.
        SalesforceProjectTriggerHandler.createDefaultTicket(trigger.new);
    }
    if (Trigger.isBefore && Trigger.isUpdate) {
        //do the completion valdiation
        SalesforceProjectTriggerHandler.validateSPComplete(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    }
}