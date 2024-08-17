public with sharing class TaskHandlerClass {
    public static void setTaskPriority(List<Task> tasks) {
        //set task priority to high
        for(Task t : tasks){

            t.Priority = 'High';
        }
    }
}