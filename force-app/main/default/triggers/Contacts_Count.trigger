trigger Contacts_Count on Contact (before insert, after undelete, after delete) {
    
    set<Id> SetAccountIds = new set<Id>();
    
    if(Trigger.isInsert||Trigger.isUndelete){
        for(Contact con : Trigger.New)
            SetAccountIds.add(con.AccountId);
            }
    if(Trigger.isDelete){
        for(Contact con : Trigger.Old)
            SetAccountIds.add(con.AccountId);
            }
List<Account> accs =[Select Id, Name,Count_Contacts__c, (Select Id from Contacts) from Account where Id IN :SetAccountIds];
    for(Account ac1 :accs ) {
        ac1.Count_Contacts__c = ac1.contacts.size();
       
    }
           update accs;
}