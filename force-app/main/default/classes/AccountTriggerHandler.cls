public with sharing class AccountTriggerHandler {
    private Boolean m_isExecuting = false;
    private Integer BatchSize = 0;
    public static Boolean isFromBatchJob;
    public static Boolean isFromUploadAPI = false;

    public AccountTriggerHandler(Boolean isExecuting, Integer size) {
        m_isExecuting = isExecuting;
        BatchSize = size;
    }
    public void onBeforeInsert(List<Account> newAccounts) {
        //updateAccountPhone(newAccounts);
        system.debug('Account Trigger on before insert');
    }
    public void onAfterInsert(List<Account> newAccounts) {
        system.debug('Account Trigger on after insert ');
        //updateCustomer(newAccounts);
    }
    public void OnAfterUpdate(List<Account> oldAccounts, List<Account> updatedAccounts, Map<ID, Account> oldAccountsMap, Map<ID, Account> updatedAccountsMap) {
                        
        //updateCustomer(updatedAccounts, oldAccounts, updatedAccountsMap, oldAccountsMap);
        system.debug('Account Trigger On After Update');

    }
    public void onBeforeUpdate( List<Account> oldAccounts,
                                List<Account> updatedAccounts,
                                Map<ID, Account> updatedAccountsMap,
                                Map<ID, Account> oldAccountsMap) {
        //updateAccountPhone(updatedAccounts);
    }
    @future
    public static void onAfterUpdateAsync(set<ID> newAccountIDs){

    }
    public Boolean isTriggerContext{
        get {return m_isExecuting;}
    }
    public Boolean isVisualforcePageContext{
        get {return !isTriggerContext;}
    }
}