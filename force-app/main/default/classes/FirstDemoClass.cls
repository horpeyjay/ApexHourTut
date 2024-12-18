public with sharing class FirstDemoClass {
    public FirstDemoClass() {

    }

    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactList(){
        try {
            return [Select Id, Email From Contact limit 20];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountList(){
        try {
            return [Select Id, Name From Account limit 2];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}