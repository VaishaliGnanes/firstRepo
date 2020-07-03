trigger PhoneUpdate on Account (after insert, after update) {
    Set<Id> setid = new Set<Id>();
    List<Contact> con = new List<Contact>();
   
    
    for(Account a1:Trigger.New){
        setid.add(a1.Id);
            }
    
   
    con = [Select Id,HomePhone,Account.Phone from Contact where AccountId IN: setid ];
    
    for(Contact c:con){
        c.HomePhone=c.Account.Phone;
    }
    

  update con;

}