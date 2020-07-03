trigger CustomSet on Account (after insert) {
    for(Account a:trigger.new){
    Accounts__c ac = Accounts__c.getOrgDefaults();
    ac.Testing__c=a.Name;
    update ac;   
       
 }
}