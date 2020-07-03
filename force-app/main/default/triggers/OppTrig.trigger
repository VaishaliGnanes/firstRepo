trigger OppTrig on Opportunity (before insert,after insert,before update, after update,before delete,after undelete) {
 	
    OppClass op= new OppClass(Trigger.new,Trigger.old,Trigger.newMap,Trigger.oldMap);
    
    if(Trigger.isBefore && Trigger.isInsert){
        op.onbeforeInsert();
    }
   // if(Trigger.isAfter && Trigger.isInsert){}
   if(Trigger.isBefore && Trigger.isUpdate){
     op.onbeforeUpdate();
}
   // if(Trigger.isAfter && Trigger.isUpdate){}
    //if(Trigger.isBefore && Trigger.isDelete){}
   // if(Trigger.isAfter && Trigger.isUnDelete){}
    
}