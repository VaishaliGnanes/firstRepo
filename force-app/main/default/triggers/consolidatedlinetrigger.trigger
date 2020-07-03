trigger consolidatedlinetrigger on Consolidated_Line__c (before insert,after insert,before update,after update,before delete,after delete) {
	//consolidatedlineHandler handler = new  consolidatedlineHandler(Trigger.new,Trigger.old,Trigger.newMap,Trigger.oldMap);
	newconsolihandler handler=new  newconsolihandler(Trigger.new,Trigger.old,Trigger.newMap,Trigger.oldMap);
     if(Trigger.isAfter && Trigger.isInsert)
        handler.onAfterInsert();
    }