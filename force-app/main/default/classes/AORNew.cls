global class AORNew implements database.Batchable<sObject> {
    global database.QueryLocator start(database.BatchableContext bc){
        String query = 'Select Id, Name from AOR__c where Account__c = Null';
        return database.getQueryLocator(query);
    }
    global void execute(database.BatchableContext bc, List<AOR__c> ac){
       set<string> accid = new set<string>();
        List<Account> ac1 = new List<Account>();
        Map<String,Account> m1 = new Map<String,Account>();
        List<AOR__c> l1 = new List<AOR__c>();
        for(AOR__c a :ac ){
            accid.add(a.Name.substringAfterLast('-'));
        }
      ac1= [select ID,Name, AccountNumber from account where AccountNumber IN:accid];
                for(Account ao1 : ac1){
            m1.put(ao1.AccountNumber, ao1);
                       }
        system.debug('map*****'+m1);
        for(AOR__c aou: ac){
            aou.Account__c = m1.get(aou.Name.substringAfterLast('-')).Name;
            l1.add(aou);
        }
        update l1;
        system.debug('update*****'+l1);
        
    }
    global void finish(database.BatchableContext bc)
    {}
}