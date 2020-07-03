trigger Autoapprove on Apply_Leave__c (after insert) {
    for(Apply_Leave__c al:Trigger.new){
        Approval.ProcessSubmitRequest ap=new Approval.ProcessSubmitRequest();
   		ap.setObjectId(al.id);
        ap.setProcessDefinitionNameOrId('04a6F000000QBg5');
        Approval.ProcessResult result = Approval.process(ap);
    }
}