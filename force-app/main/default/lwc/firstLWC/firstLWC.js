import { LightningElement, api, wire } from 'lwc';
import  getContactList from '@salesforce/apex/FirstDemoClass.getContactList';
import  getAccountList from '@salesforce/apex/FirstDemoClass.getAccountList';

export default class FirstLWC extends LightningElement {
    greeting = 'Opeyemi';
    inputText = '';
    @api message = 'This is a simple message';
    result;
    error;

    /**
     * To call the apex method, 
     * Get a class
     * create an auraEnabled method in it
     * import the method in LWC
     * use @wire to call the method
     */
    @wire(getContactList)
    wiredData({data, error}){
        if(data){
            this.result = data;
            this.error = undefined;
            window.console.log('data is' + data);
        }else if(error){
            this.error = error;
            window.console.log('error is' + error);
            this.result = undefined;
        }
    }
    
    handleClick(event){
        this.inputText = event.target.value;
        window.console.log('event target and its value are' + event.target.value);
    }

    handleSubmit() {
        alert('Button Clicked');
        getAccountList()
            .then(result => {
                this.result = result;
                this.error = undefined;
            })
            .catch(error => {
                // TODO Error handling
                this.error = error;
                this.result = undefined;
            });
    }
}