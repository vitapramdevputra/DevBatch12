public class SalesforceProjectTriggerHandler {
   public static void createDefaultTicket(List<salesforce_project__c> spTriggerNew) {
        try{
            List<Salesforce_Ticket__c> stList = new list<Salesforce_Ticket__c>();
            DefaultTicketInfo__c defaultValues = DefaultTicketInfo__c.getOrgDefaults();
            for (salesforce_project__c eachSP : spTriggerNew) {
                Salesforce_Ticket__c st  = new Salesforce_Ticket__c();
                //set subject as custom setting's subject value
                st.Subject__c = defaultValues.Subject__c; //do not hard code this. make it a little dynamic.
                st.Salesforce_Project__c = eachSP.id;
                st.Priority__c = 'Medium';
                //set Description__c as custom setting's Description__c value
                st.Description__c = defaultValues.description__c;
                stList.add(st);
            }
            if (!stList.isEmpty()) {
                insert stList;
            }
        } catch(exception ex){
            system.debug('exception msg: ' + ex.getMessage());
            for (salesforce_project__c eachSP : spTriggerNew) {
                eachSP.addError('Error in creating Ticket. Please contact your administrator.');
            }
        }
        
   }

   public static void validateSPComplete(List<salesforce_project__c> spTriggerNew, List<salesforce_project__c> spTriggerOld,
   Map<Id, salesforce_project__c> spTriggerNewMap, Map<Id, salesforce_project__c> spTriggerOldMap) {
        set<id> spIds = new set<Id>();
        for (salesforce_project__c eachSP : spTriggerNew) {
            if (eachSP.Status__c == 'Completed' && eachSP.Status__c != spTriggerOldMap.get(eachSP.Id).Status__c) {
                spIds.add(eachSP.Id);
            }
        }

        //get all Not-completed tickets of all comleted project
        List<Salesforce_Ticket__c> listST = [select id, status__c, salesforce_project__c from Salesforce_Ticket__c
        where Salesforce_Project__c in :spIds and status__c != 'Completed'];

        for (salesforce_ticket__c eachST : listST) {
            Salesforce_Project__c sp = spTriggerNewMap.get(eachst.Salesforce_Project__c);
            sp.Status__c.addError('Cannot complete project because all tickets are not completed. Go away now.');
        }
   }

   @future
   public static void updateProjectDescription(set<id> spIds) {
        system.debug('inside future method. okay?');
        List<Salesforce_Project__c> allSp = [select id, description__c 
        from Salesforce_Project__c where id in :spIds];

        for (salesforce_project__c eachSP : allSP) {
            eachSP.Description__c += '. Updated from future';
        }
        update allSp;
   }

   //a)
   public static void spCompletedStatus(List<salesforce_project__c> spTriggerNew, List<salesforce_project__c> spTriggerOld,
   Map<Id, salesforce_project__c> spTriggerNewMap, Map<Id, salesforce_project__c> spTriggerOldMap) {
        //get set id for which project 'status' is changed to completed.
        //compare old and new to get if status is completed
        set<id> spIds = new set<id>();
        for (salesforce_project__c eachSp : spTriggerNew) {
            Salesforce_Project__c oldSP = spTriggerOldMap.get(eachSP.Id);
            if (eachSP.Status__c == 'Completed' && eachSP.Status__c != oldSP.Status__c) {
                spIds.add(eachSP.Id);
            }
        }
        //call future method to update all its tickets
        //call b)
        if (!spIds.isEmpty()) {
            completeAllTickets(spIds);
        }
   }

   @future //b)
   public static void completeAllTickets(set<id> spIds) { 
        //get all tickets which are not completed
        List<Salesforce_Ticket__c> allST = [select id, status__c, salesforce_project__c from Salesforce_Ticket__c
        where Salesforce_Project__c in :spIds and status__c != 'Completed'];
        // set status as completed
        for (salesforce_ticket__c eachST : allST) {
            eachST.status__c = 'Completed';
        }
        update allST;
       //update all tickets
   }
}
