trigger GRTrigger on Growerrealtionship__c (before insert,after insert,before update,after update,before delete,after delete) {
    
    GrowerRelationshiptriggerHandler handler = new  GrowerRelationshiptriggerHandler(Trigger.new,Trigger.old,Trigger.newMap,Trigger.oldMap);
    if(Trigger.isBefore && Trigger.isUpdate){
        handler.onBeforeUpdate();
    }
    if(Trigger.isBefore && Trigger.isDelete){
        handler.onBeforeDelete();
    }
    
}