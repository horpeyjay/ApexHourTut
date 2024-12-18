import { LightningElement } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';

export default class NavigationExamples extends NavigationMixin(LightningElement) {
    navigateToRecordDetailPage(){
        this[NavigationMixin.Navigate]({
          type: "standard__objectPage",
          attributes: {
            actionName: "home",
            objectApiName: "Account"
          }
        });
    }

    
}