trigger udpatehello on Account (before insert,before update) {
    
    for(Account a:Trigger.new){
       a.Hello__c='World';
    }
}