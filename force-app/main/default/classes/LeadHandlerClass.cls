public with sharing class LeadHandlerClass {
    //Assignment 2
    //Whenever a Lead record is updated, set the Lead Status to “Working-Contacted”.
    public static void leadStatusUpdate(List<Lead> newLeads) {
        for (Lead newLead : newLeads) {
            newLead.Status = 'Working - Contacted';
        }
    }
    //Assignment 4 
    //Whenever a Lead is updated and Industry is “Healthcare”, set Lead Source, SIC Code and Primary.
    public static void leadIndustryUpdate(List<Lead> newLeads) {
        for (Lead newLead : newLeads) {
            if (newLead.Industry == 'Healthcare') {
                newLead.LeadSource = 'Web';
                newLead.SicCode__c = '7839';
                newLead.Primary__c = 'Yes';
            }
        }
    }
    //Assignment 6 
    //When a Lead record is created, create a Task for the Lead Owner to follow up with the Customer.
    public static void leadOwnerTask(Map<Id,Lead> newLeadTaskMap){
        //create a task array
        List<Task> taskCollection = new List<Task>();
        //create a single task object instance
        Task singleTask = new Task();

        //loop through the new lead records and create a task for each lead record
        for (Lead eachLead : newLeadTaskMap.values()){
            //create task for each lead object
            singleTask.OwnerId = eachLead.OwnerId;
            singleTask.Subject = 'Follow up with Lead';
            singleTask.Status = 'New';
            singleTask.Priority = 'Normal';
            singleTask.WhoId = eachLead.Id;
            singleTask.ActivityDate = Date.today() + 7;
        }
        //add the task to the task array
        taskCollection.add(singleTask);
        //insert the task using DML
        insert(taskCollection);
    }
    public static void noLeadDeletion(List<Lead> exLeads){
        //Assignment 12
        //Prevent Lead deletion when status is Working - Contacted
        for (Lead DND : exLeads){
            if(DND.Status == 'Working - Contacted'){
                DND.addError('You can not delete a lead with a status Working Contacted');
            }
        }
    }
    /*//Combined both assignment 2 & 4 together since they are both working on before update trigger. 
    public void leadIndustryStatusUpdate(List<Lead> oldLead){
        for (Lead oldLeadToWork : oldLead){
            oldLeadToWork.Status = 'Working - Contacted';
            if (oldLeadToWork.Industry == 'Healthcare'){
                oldLeadToWork.LeadSource = 'Web';
                oldLeadToWork.SicCode__c = '7839';
                oldLeadToWork.Primary__c = 'Yes';
            }
            
        }
    }*/

}