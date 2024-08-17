trigger CaseTriggerWithHandler on Case (before insert, before update, before delete) {
    if(Trigger.isBefore){
        if(Trigger.isInsert || Trigger.isUpdate){
            //call the method for case priority
            CaseHandlerClass.casePriority(Trigger.new);
        }
        if(Trigger.isDelete){
			CaseHandlerClass.caseDeletionByAdmin(Trigger.old);
        }
    }
}