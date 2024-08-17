trigger AccoutTriggerWithHandler on Account (before insert, before update, after update, after insert) {
    if(Trigger.isBefore){
        if(Trigger.isUpdate){
            //call the ownership method on the handler class
            AccountHandlerClass.accOwnershipPrivate(Trigger.new);
        }
    }
    if(Trigger.isAfter){
        if(Trigger.isUpdate){
            //call the website update static method
            AccountHandlerClass.accWebsiteUpdate(Trigger.new);
            AccountHandlerClass.createNEmployees(Trigger.new);
        }
        if (Trigger.isInsert){
            //call the employee method upon account creation
            AccountHandlerClass.createNEmployees(Trigger.new);
        }

    }
}