trigger Casecreation on Account (after insert,after update) {

    CasecreationHandler casehandler = new CasecreationHandler(Trigger.new,Trigger.old,Trigger.newmap,Trigger.oldmap);
    
    if(Trigger.isInsert && Trigger.isAfter){
        casehandler.onafterinsert();
    }
}