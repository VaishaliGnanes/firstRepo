trigger BatchApexErrorTrigger on BatchApexErrorEvent (after insert) {

    List<BatchLeadConvertErrors__c> listBLC = new List<BatchLeadConvertErrors__c>(); 
    BatchLeadConvertErrors__c blc;
    for(BatchApexErrorEvent baee:trigger.new){
        blc = new BatchLeadConvertErrors__c();
        blc.AsyncApexJobId__c =baee.AsyncApexJobId;
        blc.Records__c = baee.JobScope;
        blc.StackTrace__c=baee.StackTrace;
        listBLC.add(blc);
    }
    
    insert listBLC;
}