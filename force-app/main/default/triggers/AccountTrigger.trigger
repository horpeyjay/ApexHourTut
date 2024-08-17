trigger AccountTrigger on Account (before insert, before update, after update) {
    
    if (Trigger.isBefore && Trigger.isInsert) {
        System.debug('I am a before Account Trigger insert context');
    }
    
    if (Trigger.isUpdate) {
        if (Trigger.isBefore) {
            for (Account acc : Trigger.new) {
                System.debug('New Name: ' + acc.Name);
                System.debug('Old Name: ' + Trigger.oldMap.get(acc.Id).Name);
            }
        }
        //if (Trigger.isAfter) {
            // Add your after update logic here, if any.
        //}
    }
}