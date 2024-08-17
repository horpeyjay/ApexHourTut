trigger OpportunityTriggerWithHandler on Opportunity (before insert, before update, before delete, after insert, after update, after delete) {
    if(Trigger.isAfter) {
        if(Trigger.isInsert || Trigger.isUpdate) {
            OpportunityHandlerClass.oppsWonTask(Trigger.newMap);
        }
    }
    if(Trigger.isBefore) {
        if(Trigger.isUpdate) {
            OpportunityHandlerClass.oppChangeAmount(Trigger.oldMap, Trigger.newMap);
            OpportunityHandlerClass.deleteOppTeamMember(Trigger.oldMap, Trigger.newMap);
        }
    }
}
