trigger AccountTrigger on Account (before insert, before update, after insert, after update) {

    if (Trigger.isBefore) {
        AccountTriggerHandler.updateAccountDescription(trigger.new, trigger.old, trigger.newMap, trigger.oldMap);
    }
    if (Trigger.isAfter && Trigger.isUpdate) {
        //call method to update VIP fields of all contacts.
        AccountTriggerHandler.updateVIPforContacts(trigger.new, trigger.old, trigger.newMap, trigger.oldMap);
    }
    /*
    List<account> accTriggerNew = trigger.new;
    List<account> accTriggerOld = trigger.old;
    Map<id, account> accTriggerNewMap = trigger.newmap;
    Map<id, account> accTriggerOldMap = trigger.oldMap;
    //keys means ids of newMap and oldMap are SAME (update)


    if (Trigger.isAfter && Trigger.isUpdate) {
        Set<id> accIds = accTriggerNewMap.keySet();
        //for each loop of set of ids
            //get value of new account using ID from newMap
            //get value of old account using ID from oldMap
        integer countWebsite = 0;
        for (Id eachId : accIds) {
            system.debug('eachId -> ' + eachId);

            account newAccount = accTriggerNewMap.get(eachId);
            system.debug('newAccount name -> ' + newAccount.Name);
            string newWebsite = newAccount.Website;

            account oldAccount = accTriggerOldMap.get(eachId);
            system.debug('oldAccount name -> ' + oldAccount.Name);
            string oldWebsite = oldAccount.Website;

            if (newWebsite != oldWebsite) {
                system.debug('Account ' + newaccount.Name + ', new website is ' + newWebsite);
                countWebsite++;
            }
        }
        system.debug('# account website updated --> ' + countWebsite);
    }
    */
/*
    if (Trigger.isBefore && Trigger.isInsert) {
        system.debug('before insert trigger new: ' + accTriggerNew); //yes, but no id
        system.debug('before insert trigger old: ' + accTriggerOld); //null
        system.debug('before insert trigger new map: ' + accTriggerNewMap);//null
        system.debug('before insert trigger old map: ' + accTriggerOldMap);//null
    }
    if (Trigger.isAfter && Trigger.isInsert) {
        system.debug('after insert trigger new: ' + accTriggerNew);//yes
        system.debug('after insert trigger old: ' + accTriggerOld);//null
        system.debug('after insert trigger new map: ' + accTriggerNewMap);//yes
        system.debug('after insert trigger old map: ' + accTriggerOldMap);//null
    }

    if (Trigger.isBefore && Trigger.isUpdate) {
        //all variable YES (not null)
        system.debug('before update trigger new: ' + accTriggerNew);
        system.debug('before update trigger old: ' + accTriggerOld);
        system.debug('before update trigger new map: ' + accTriggerNewMap);
        system.debug('before update trigger old map: ' + accTriggerOldMap);
    }
    if (Trigger.isAfter && Trigger.isUpdate) {
        //all variable YES (not null)
        system.debug('after update trigger new: ' + accTriggerNew);
        system.debug('after update trigger old: ' + accTriggerOld);
        system.debug('after update trigger new map: ' + accTriggerNewMap);
        system.debug('after update trigger old map: ' + accTriggerOldMap);
    }
*/
    /*
    if (Trigger.isAfter) {
        List<account> accTriggerNew = trigger.new;
        //new set of id
        set<id> accountIds = new set<id>();
        for (account newAcc : accTriggerNew) {
            accountIds.add(newAcc.Id);//add id to the set
        }
        system.debug('set of id >>> ' + accountids);
    } */
    /*if (Trigger.isAfter && Trigger.isUpdate) {
        List<account> accTriggerOld = trigger.old;
        for (account oldAcc : accTriggerOld) {
            system.debug('old acc id ' + oldAcc.id + ', old acc name is ' + oldAcc.Name);
        }

        List<account> accTriggerNew = trigger.new;
        for (account newAcc : accTriggerNew) {
            system.debug('new acc id ' + newAcc.id + ' new acc name is ' + newAcc.Name);
        }
    }*/
    /*
    if (Trigger.isBefore && Trigger.isInsert) {
        system.debug('before insert trigger.old is ' + trigger.old); //null.
    }
    if (Trigger.isAfter && Trigger.isInsert) {
        system.debug('after insert trigger.old is ' + trigger.old); //null.
    }
    if (Trigger.isBefore && Trigger.isUpdate) {
        system.debug('before udpate trigger.old is ' + trigger.old); //null.
    }
    if (Trigger.isAfter && Trigger.isUpdate) {
        system.debug('after update trigger.old is ' + trigger.old); //null.
    }*/
    /*
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
    } */

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