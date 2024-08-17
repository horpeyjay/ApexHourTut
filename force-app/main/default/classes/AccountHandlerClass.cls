public with sharing class AccountHandlerClass {
    public static void accOwnershipPrivate(List<Account> accs) {
        //Assignment 9
        //If an Account is updated and Ownership is set to Private, do not allow the user to save the record.
        for (Account a : accs){
            if (a.Ownership == 'Private'){
                a.addError('You cannot save the record if the ownership is private');
            }
        }
    }
    public static void accWebsiteUpdate(List<Account> accs){
        //Assignment 10
        //Every time an account website is updated, update the website field on all its child contacts
        List<Contact> conToUpate = new List<Contact>(); //collect the contact in an array
        for (Account a : accs){ //loop through each account
            if(a.Website != null){ //check in place to ensure account website isn't empty
                for (Contact c : [Select Id, Website__c from Contact where AccountId = :a.Id]){
                    //checking each account to ensure that the website field is populate.
                        if(a.Website != null && c.Website__c == null){
                            c.Website__c = a.Website;
                            conToUpate.add(c);
                        }else if(a.Website == null && c.Website__c != null){
                            //do nothing
                        }else if(a.Website == null && c.Website__c == null){
                            c.Website__c = null;
                            conToUpate.add(c);
                        }      
                }
            }
        }

        if(!conToUpate.isEmpty()){
            update conToUpate;
        }
    }
    public static void createNEmployees(List<Account> accs){
        //Assignment 11
        //Create number of employee based on the number of employees on the account record.
        List<Contact> con = new List<Contact>();
        for (Account a : accs){
            if(a.NumberOfEmployees != null){
                //count the number of records on the account.
                List<Contact> existingEmp = [Select Id From Contact Where AccountId = :a.Id];
                //count the number of existing employees
                Integer noofExisting = existingEmp.size();
                //check if the number of employee is more than the existing employee.
                Integer contactLefts = a.NumberOfEmployees - noofExisting;
                //if more than existing employee, create new employee, if not, do nothing.
                if(contactLefts > 0){ 
                    for (Integer i = 1; i <= contactLefts; i++){
                        Contact newCon = new Contact();
                        newCon.FirstName = 'FirstName' + i;
                        newCon.LastName = a.Name + ' ' + i;
                        newCon.AccountId = a.Id;
                        con.add(newCon);
                    }
                }
            }
        }
        Insert con;
    }
}