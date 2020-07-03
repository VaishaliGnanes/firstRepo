trigger AORTrigger on AOR__c (after update) {
    
    List<AOR__c> rec = new List<AOR__c>();
        rec = [Select Name from AOR__c];
    List<AOR__c> rec1 = new List<AOR__c>();
        for(AOR__c a1 : rec){
            if(a1.Active__c=true){
            String name =  a1.Name;
            String splitname = name.substringAfterLast('-');
                System.debug('splitname'+splitname);
            List<Account> a=new List<Account>([Select id from Account where AccountNumber=:splitname]);
            
            for(Account ac:a){
            a1.Account__c=ac.id;
             }
            rec1.add(a1);
                system.debug('pppppppppppppppppppp'+rec1);
            }
            }
    update rec1;
}