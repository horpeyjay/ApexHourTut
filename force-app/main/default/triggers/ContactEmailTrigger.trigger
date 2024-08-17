trigger ContactEmailTrigger on Contact (before insert) {

    List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
    for(Contact con : Trigger.new){
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        if (con.Email != null){
            mail.setSubject('Hello ' + con.LastName);
            mail.setTargetObjectId(con.Id);
            mail.setTreatTargetObjectAsRecipient(true);
            mail.setHtmlBody('Hello, This is just a testing email');
            String body = 'Your email address is: ' + con.Email;
            mail.setPlainTextBody(body);
            List<String> emailList = new List<String>();
            emailList.add(con.Email);
            mail.setToAddresses(emailList);
            mails.add(mail);
        }
    }

}