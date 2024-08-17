public class PassingValues {
    
    public void mainValueMethod(){
        string websiteurl = 'www.apexhours.com';
        system.debug ('Before the call ' + websiteurl);
        passByValueCall(websiteurl);
        system.debug ('After the call ' + websiteurl);
    }
    
    private void passByValueCall (String urlvalue){
		urlvalue = 'www.salesforce.com'; //Pass by Value Call
    }
    
    public void mainreferenceMethod(){
        Account a = new Account();
        a.Name = 'Test Account';
        a.Website = 'www.apexhours.com';
        system.debug ('Before the reference call ' + a);
        passByrefCall(a);
        system.debug('After reference call ' + a);
        
    }

    private void passByrefCall(Account a){
        a.Website = 'www.salesforce.com';
    }
}

/*Calling out this method on the debug log
PassingValues p2 = new PassingValues();
p2.mainValueMethod();

p2.mainreferenceMethod();
*/