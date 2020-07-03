trigger updatetype on Contact (before insert) {
    Set<id> conacc=new set<id>();
    for(Contact c:Trigger.new){
        conacc.add(c.AccountId);
    }
    Map<Id,Account> acctype= new Map<Id,Account>([select Id,Name,type from Account where Id IN:conacc]);
    
    for(Contact con:trigger.new){
        con.Acctype__c= acctype.get(con.AccountId).Type;
    }
    
}