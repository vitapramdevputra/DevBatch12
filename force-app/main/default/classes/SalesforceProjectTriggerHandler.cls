public class SalesforceProjectTriggerHandler {
   public static void createDefaultTicket(List<salesforce_project__c> spTriggerNew) {
        List<Salesforce_Ticket__c> stList = new list<Salesforce_Ticket__c>();
        for (salesforce_project__c eachSP : spTriggerNew) {
            Salesforce_Ticket__c st  = new Salesforce_Ticket__c();
            st.Subject__c = 'Default st';
            st.Salesforce_Project__c = eachSP.id;
            stList.add(st);
        }
        if (!stList.isEmpty()) {
            insert stList;
        }
   }
}
