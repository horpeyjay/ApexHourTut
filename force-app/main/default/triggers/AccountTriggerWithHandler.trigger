trigger AccountTriggerWithHandler on Account (before insert, before update, after insert, after update) {
    /*AccountTriggerHandler handler = new AccountTriggerHandler(Trigger.isExecuting, Trigger.size);
    

    if(Trigger.isInsert) {
        if(Trigger.isBefore) {
            handler.OnBeforeInsert(Trigger.new);
        }
        if(Trigger.isAfter) {
            handler.OnAfterInsert(Trigger.new);
        }
    }else if (Trigger.isUpdate){

        if(Trigger.isBefore){
            handler.OnBeforeUpdate(Trigger.new, Trigger.old, Trigger.oldMap,Trigger.newMap);
        }
        if(Trigger.isAfter){
            handler.OnAfterUpdate(Trigger.new, Trigger.old, Trigger.oldMap,Trigger.newMap);
        }
    }

    switch on Trigger.operationType {
        when BEFORE_INSERT {
            System.debug('BEFORE_INSERT');
            handler.validateAccounts(Trigger.new);
        }
    }*/
}