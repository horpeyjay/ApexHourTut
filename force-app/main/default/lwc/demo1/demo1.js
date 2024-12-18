import { LightningElement } from 'lwc';

export default class Demo1 extends LightningElement {
    handleError(){
        alert('Error Occured');
    }

    handleSubmit(){
        alert('Record Submitted');
    }

    handleSuccess(){
      alert('Record Created');  
    }
}