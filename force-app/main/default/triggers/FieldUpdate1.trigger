trigger FieldUpdate1 on Account (after insert, after update) {
    Map<Id,String> m1 = new Map<Id,String>();
    Set<Id> s1 = new Set<Id>();
    
    for(Account a1 : Trigger.New){
        m1.put(a1.Id, a1.Description);
        s1.add(a1.Id);
             }
    List<Contact> c1 = New List<Contact>([Select Id, Accountid from Contact where AccountId IN: s1 ]);
    
    for(Contact c: c1){
        c.Title = m1.get(c.AccountId);
        
    }

    update c1;
}