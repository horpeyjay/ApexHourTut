trigger AccountEmailer on Account (before insert) {
    if(Trigger.isBefore && Trigger.isInsert){
		system.debug('I am in Account Emailer before insert context');
    }
}