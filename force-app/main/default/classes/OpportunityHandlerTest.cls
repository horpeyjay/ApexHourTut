@isTest
public class OpportunityHandlerTest {
    @testSetup
    static void setupTestData(){
        // Create a user to assign as the owner
        Profile p = [SELECT Id FROM Profile WHERE Name='System Administrator'];
        User testUser = new User(
            Username = 'testuser467548908534228@testuser467548908534228.com',
            Alias = 'tuser',
            Email = 'testuser467548908534228@testuser467548908534228.com',
            EmailEncodingKey = 'UTF-8',
            LastName = 'Test',
            LanguageLocaleKey = 'en_US',
            LocaleSidKey = 'en_US',
            ProfileId = p.Id,
            TimeZoneSidKey = 'America/Los_Angeles'
        );
        insert testUser;

        // Create and insert an account with the test user as the owner
        Account testAccount = new Account(Name = 'Test Account', OwnerId = testUser.Id);
        insert testAccount;

        // Insert an opportunity with a different stage
        Opportunity testOpp = new Opportunity(
            Name = 'Test Opportunity',
            StageName = 'Prospecting',
            CloseDate = Date.today(),
            Amount = 1000,
            Probability = 50,
            AccountId = testAccount.Id
        );
        insert testOpp;
    }

    @isTest
    static void testOppsWonTask(){
        Opportunity testOpp = [SELECT Id, StageName, CloseDate, OwnerId FROM Opportunity LIMIT 1];
        Test.startTest();
        testOpp.StageName = 'Closed Won';
        update testOpp;
        Test.stopTest();
        List<Task> newTask = [SELECT Id, Subject, OwnerId, WhatId, Priority, Status, ActivityDate FROM Task WHERE WhatId = :testOpp.Id];
        System.assertEquals(1, newTask.size());
        System.assertEquals('Revenue Split', newTask[0].Subject);
        System.assertEquals(testOpp.OwnerId, newTask[0].OwnerId);
        System.assertEquals('High', newTask[0].Priority);
        System.assertEquals('In Progress', newTask[0].Status);
        System.assertEquals(Date.today() + 14, newTask[0].ActivityDate);
    }

    @isTest
    static void testOppChangeAmount(){
        Opportunity testOpp = [SELECT Id, StageName, Amount, Probability FROM Opportunity LIMIT 1];
        Test.startTest();
        testOpp.StageName = 'Qualification';
        update testOpp;
        Test.stopTest();
        Opportunity updatedOpp = [SELECT Id, StageName, Amount, Probability FROM Opportunity WHERE Id = :testOpp.Id];
        System.assertEquals((1000 * 50) / 100, updatedOpp.Amount);
    }

    @isTest
    static void testDeleteOppTeamMember(){
        Opportunity testOpp = [SELECT Id, StageName FROM Opportunity LIMIT 1];
        OpportunityTeamMember teamMember = new OpportunityTeamMember(
            OpportunityId = testOpp.Id,
            TeamMemberRole = 'Sales Rep',
            UserId = UserInfo.getUserId()
        );
        insert teamMember;
        Test.startTest();
        testOpp.StageName = 'Closed Lost';
        update testOpp;
        Test.stopTest();
        List<OpportunityTeamMember> remainingTeamMembers = [SELECT Id FROM OpportunityTeamMember WHERE OpportunityId = :testOpp.Id];
        System.assertEquals(0, remainingTeamMembers.size());
    }
}
