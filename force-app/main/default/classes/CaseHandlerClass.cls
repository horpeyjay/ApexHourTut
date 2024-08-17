public with sharing class CaseHandlerClass {

    // Use Case 3 : Whenever a Case is created & Case Origin is “Phone”, Set Priority as “High”, else set Priority as “Low”
    public static void casePriority(List<Case> newCases) {
        for (Case nCases : newCases){
            if(nCases.Origin == 'Phone'){
                nCases.Priority = 'High';
            }else{
                nCases.Priority = 'Low';
            }
        }
    }
    public static void caseDeletionByAdmin(List<Case> oldCases){
		//Assignment 16
		//Allow Case Deletion only by “System Admin users”
		//This get the system admin profile
		Profile adminProfile = [Select Id, Name From Profile Where Name = 'System Administrator'];
        //check if the current user profile matches tha admin profile
        if(UserInfo.getProfileId() != adminProfile.Id){
			//if not system admin, prevent deletion
            for(Case c : oldCases){
				c.addError('You can not delete this case. Only your system admin can');
            }
        }else{
			if(!(Schema.SObjectType.Case.isDeletable())){
                throw new System.NoAccessException();
            }
        }
    }
}