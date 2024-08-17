trigger ContactTriggerWithHandler on Contact (before insert) {
    ContactHandlerClass.noContactWithParentAccount(Trigger.new);
    //call the no duplicate contact static class method in assignment 14
    ContactHandlerClass.noDuplicateContact(Trigger.new);

}