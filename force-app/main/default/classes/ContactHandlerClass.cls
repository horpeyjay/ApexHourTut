public with sharing class ContactHandlerClass {
    public static void noContactWithParentAccount(List<Contact> newcontact) {
        //Assignment 8 
        //If a Contact is created without a parent Account, do not allow the user to create the contact record
        for (Contact con : newcontact) {
            if (con.AccountID != null) {
                system.debug('You"ve successfully created account: ' + con.Name);
            }else {
                con.addError('You cannot create a contact without an account');
                con.clear();
            }
        }
    }
    public static void noDuplicateContact(List<Contact> nwContacts){
        //Assignment 14
        //Do not allow contact creation if a contact already exists with the same lastname, email & phone
        List<Contact> existingContact = [Select Id, LastName, Email, Phone FROM Contact]; //get all contacts records in the org
        for (Contact nwCon : nwContacts){
            for (Contact eCon : existingContact){

                if (nwCon.LastName == eCon.LastName && nwCon.Email == eCon.Email && nwCon.Phone == eCon.Phone) {
                    nwCon.addError('Contact already exists in the system');
                }
            }
        }
    }
}