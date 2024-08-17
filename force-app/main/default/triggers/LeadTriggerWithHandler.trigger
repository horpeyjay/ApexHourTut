trigger LeadTriggerWithHandler on Lead (before insert, before update, before delete, after insert, after update) {
    //Whenever a Lead record is updated, set the Lead Status to “Working-Contacted”.
    if(Trigger.isBefore){
        if(Trigger.isUpdate){
            LeadHandlerClass.leadStatusUpdate(Trigger.new);
            LeadHandlerClass.leadIndustryUpdate(Trigger.new);
            //Here is the combined code for Assignment 2 & 4
            //lHC.leadIndustryStatusUpdate(Trigger.new);
        }
        if(Trigger.isInsert){
            //perform before insert operation on lead
        }
        if(Trigger.isDelete){
            //perform a delete operation on lead
            LeadHandlerClass.noLeadDeletion(Trigger.old);
        }
    }
    if(Trigger.isAfter){
        if(Trigger.isUpdate){
            //perform after update operation on leads
            system.debug('This is an after update operations');
        }
        if(Trigger.isInsert){
            //perform after insert operation on leads
            //Assignment 6
            LeadHandlerClass.leadOwnerTask(Trigger.newMap);
        }
    }
}