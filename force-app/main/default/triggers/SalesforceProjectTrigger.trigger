trigger SalesforceProjectTrigger on Salesforce_Project__c (before insert, after insert) {
    if (Trigger.isAfter && Trigger.isInsert) {
        //here we will call handler to create default ticket.
        SalesforceProjectTriggerHandler.createDefaultTicket(trigger.new);
    }
}