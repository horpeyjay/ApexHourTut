public with sharing class CreateApexHourAccount {
    public void ahAccount() {
        InsertAccount newApexHour = new InsertAccount();
        

        ID accountID = newApexHour.createAccount('Apex Hour', '(809)-345-46765', 100000, 56);
        system.debug('id is ' + accountID);

        if (accountID != null) {
            List<Contact> apexcon = new List<Contact>();
            Contact firstcon = new contact(FirstName = 'Apex', LastName = 'day', accountID = accountId);
            apexcon.add(firstcon);
            Contact newContact = new Contact(FirstName = 'Apex', LastName = 'Hour', AccountID = accountId );
            apexcon.add(newContact);
            Contact secondcon = new Contact(FirstName = 'testing', LastName= 'Hour', AccountID = accountId);
            apexcon.add(secondcon);
            /*Contact thirdcon = newApexHour.createContact('testing', 'Hour', accountID);
            apexcon.add(thirdcon);
            Contact forthcon = newApexHour.createContact('testing', 'Hour', accountID);
            apexcon.add(forthcon);*/
            
            if (apexcon.size() > 0) {
                Database.SaveResult [] totalcon = Database.insert(apexcon);
                system.debug('Inserted the contacts ' + totalcon);
            }   
            
        }   
    }
}