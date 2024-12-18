import { LightningElement, api } from 'lwc';

export default class ChildApexHour extends LightningElement {
    @api message;

    @api childComp(name){
        alert(name);
        this.message = name;
    }

    //send from child component to parent component
    handleClick(){
        const event = new CustomEvent("btnClick", {
            detail: { 
                key: '001HSGBSD',
                value : 'ApexHours'
             }
        });
        this.dispatchEvent(event);
    }
}