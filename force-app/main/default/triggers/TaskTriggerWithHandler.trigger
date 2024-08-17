trigger TaskTriggerWithHandler on Task (before insert, before update) {

    if(Trigger.isBefore) {
        if(Trigger.isInsert || Trigger.isUpdate) {

            TaskHandlerClass.setTaskPriority(Trigger.new);
        }
    }
}