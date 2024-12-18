import { LightningElement } from 'lwc';

export default class ParentApexHour extends LightningElement {

    message = 'I\'m from parent LWC';
    
    handleClick (event){
        this.message = 'Message changed';
        this.template.querySelector('c-child-apex-hour').childComp(this.message);
    }

    handleEvent(event){
        let key = event.detail.key;
        let value = event.detail.value;

        this.message = key + ' ' + value;

        window.console.log(this.message);
    }
}