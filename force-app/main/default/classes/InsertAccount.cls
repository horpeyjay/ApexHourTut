public with sharing class InsertAccount {
    // Method to create an account
    public ID createAccount(String accountName, String companyPhone, Integer annualRevenue, Integer numberOfEmployees) {
        Account acct = new Account();
        acct.Name = accountName;
        acct.Phone = companyPhone;
        acct.AnnualRevenue = annualRevenue;
        acct.NumberOfEmployees = numberOfEmployees;
        acct.AccountSource = 'Web';

        try {
            Database.SaveResult sr = Database.insert(acct);
            if (sr.isSuccess()) {
                System.debug('Account successfully created. Account ID: ' + sr.getId());
                return sr.getId();
            } 
        } catch (DmlException e) {
            System.debug('Error creating account: ' + e.getMessage());
            return null; // Return null if account creation failed
        }

        return acct.Id; // Return the created account ID
    }

    // Method to create a contact
    public List<Contact> createContact(String fName, String lName, ID accountId) {
        Contact cont = new Contact();
        cont.FirstName = fName;
        cont.LastName = lName;
        cont.AccountId = accountId;

        try {
            Database.SaveResult srcontact = Database.insert(cont);
            if(srcontact.isSuccess() == true) {
                System.debug('Account successfully created. Account ID: ' + srcontact.getId());
            }
        } catch (DmlException e) {
            System.debug('Error creating contact: ' + e.getMessage());
            System.debug('Contact successfully created. Contact ID: ' + cont.Id);
        }
        return [SELECT FirstName, LastName, AccountId FROM Contact WHERE AccountId = :accountId]; //just wanna show the list of contacts created.
    }
}