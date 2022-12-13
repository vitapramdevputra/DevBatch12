trigger AccountTrigger on Account (before insert, before update, after insert, after update) {

    list<account> accTriggerNew = trigger.new;
    if (Trigger.isBefore && Trigger.isInsert) {
        system.debug('BEFORE record in after insert : ' + accTriggerNew);
        system.debug('BEFORE # of records inserted : ' + accTriggerNew.size());
        for (account eachAcc : accTriggerNew) {
            system.debug('BEFORE acc id is ' + eachacc.id + ', acc name is ' + eachacc.Name);
        }
    }

    if (Trigger.isAfter && Trigger.isInsert) {
        system.debug('After record in after insert : ' + accTriggerNew);
        system.debug('After # of records inserted : ' + accTriggerNew.size());
        for (account eachAcc : accTriggerNew) {
            system.debug('After acc id is ' + eachacc.id + ', acc name is ' + eachacc.Name);
        }
    }


    if (Trigger.isBefore && Trigger.isUpdate) {
        system.debug('BEFORE record in after Update : ' + accTriggerNew);
        system.debug('BEFORE # of records Update : ' + accTriggerNew.size());
        for (account eachAcc : accTriggerNew) {
            system.debug('BEFORE Update acc id is ' + eachacc.id + ', acc name is ' + eachacc.Name);
        }
    }

    if (Trigger.isAfter && Trigger.isUpdate) {
        system.debug('After record in after Update : ' + accTriggerNew);
        system.debug('After # of records Update : ' + accTriggerNew.size());
        for (account eachAcc : accTriggerNew) {
            system.debug('After Update acc id is ' + eachacc.id + ', acc name is ' + eachacc.Name);
        }
    }

    /*
    if (Trigger.isBefore && Trigger.isInsert) {
        system.debug('account Before Insert trigger called.');
    }
    if (Trigger.isAfter && Trigger.isInsert) {
        system.debug('account After Insert trigggger called. yeah');
    }
    if (Trigger.isBefore && Trigger.isUpdate) {
        system.debug('account Before Update trigger called.');
    }
    if (Trigger.isAfter && Trigger.isUpdate) {
        system.debug('account After Update trigggger called. yeah');
    }
    */

    /*
    //when we insert record - trigger.isinsert will be true.
    if (Trigger.isInsert) {
        system.debug('account before insert trigger called');    
    }
    //when we update record - trigger.isUpdate will be true.
    if (Trigger.isUpdate) {
        system.debug('account before update trigger called');    
    }*/


    /*
    if (Trigger.isBefore) {
        system.debug('account before insert trigger called');
    }
    if (Trigger.isAfter) {
        system.debug('account after insert trigger called');
    }*/
    
    
}