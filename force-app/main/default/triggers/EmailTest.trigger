trigger EmailTest on Account (after update) {

    EmailTestHandler eth = new EmailTestHandler();
    
    if(Trigger.isAfter && Trigger.isUpdate){
          for(Account a:Trigger.new){
           if(a.Active__c == 'Yes')
                 eth.SendEmails();
            }
        }
    }