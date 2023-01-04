public class ContactTriggerHandler {
    public static void updateContactValidation1(List<contact> conTriggerNew, List<contact> conTriggerOld,
                                    Map<id, contact> conTriggerNewMap, map<id, contact> conTriggerOldMap) {
        for (contact eachContact : conTriggerNew) {
            Contact oldContact = conTriggerOldMap.get(eachContact.id);
            //if contact's lead source is 'Partner Referral',
            //then DO NOT ALLOW user to update CONTACT (any field)
            if (oldContact.LeadSource == 'Partner Referral') {
                eachContact.addError('Cannot update Partner Referral contact');
            }
        }
    }

    public static void updateContactValidation2(List<contact> conTriggerNew, List<contact> conTriggerOld,
                    Map<id, contact> conTriggerNewMap, map<id, contact> conTriggerOldMap) {
        for (Contact eachContact : conTriggerNew) {
            if (eachContact.LeadSource != conTriggerOldMap.get(eachContact.Id).LeadSource) {
                string customMsg = system.label.contactValidation2;
                eachContact.LeadSource.addError(customMsg);
            }
        }
    }
}
