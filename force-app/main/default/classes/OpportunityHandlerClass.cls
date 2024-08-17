public with sharing class OpportunityHandlerClass {
    public static void oppsWonTask(Map<Id, Opportunity> newOppsMaps) {
        List<Task> newTask = new List<Task>();
        for (Opportunity opp : newOppsMaps.values()){
            if(opp.StageName == 'Closed Won'){
                Task oppTask = new Task();
                oppTask.Subject = 'Revenue Split';
                oppTask.OwnerId = opp.OwnerId;
                oppTask.WhatId = opp.Id;
                oppTask.Priority = 'High';
                oppTask.Status = 'In Progress';
                oppTask.ActivityDate = Date.today() + 14;
                newTask.add(oppTask);
            }
        }
        insert newTask;
    }

    public static void oppChangeAmount(Map<Id,Opportunity> oldOpps, Map<Id,Opportunity> newOpps){
        for (Id oppsID : newOpps.keySet()){
            Opportunity oopps = oldOpps.get(oppsID);
            Opportunity noops = newOpps.get(oppsID);
            if (oopps.StageName != noops.StageName){
                integer probability = integer.valueOf(oopps.Probability);
                noops.Amount = (oopps.Amount * probability)/100;
            }
        }
    }

    public static void deleteOppTeamMember(Map<Id, Opportunity> prvOpps, Map<Id, Opportunity> thisOpps){
        List<Id> oppsIDs = new List<Id>();
        for(ID oIDs: thisOpps.keySet()){
            Opportunity previousOpps = prvOpps.get(oIDs);
            Opportunity nextOpps = thisOpps.get(oIDs);
            if(nextOpps.StageName == 'Closed Lost' && previousOpps.StageName != 'Closed Lost'){
                oppsIDs.add(oIDs);
            }
        }
        if(oppsIDs.size() > 0){
            List<OpportunityTeamMember> oppsTeamMembers = new List<OpportunityTeamMember>(
                [SELECT Id FROM OpportunityTeamMember WHERE OpportunityId IN :oppsIDs]);
            if(!oppsTeamMembers.isEmpty()){
                try {
                    delete oppsTeamMembers;
                } catch (DmlException e) {
                    system.debug('An unexpected error has occurred: ' + e.getMessage());
                }
            }
        }
    }
}