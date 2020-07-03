trigger acc on Account (after insert) {
    Set<Id> se1 = new Set<Id>();
    List<Contact>  c=new List<Contact> ();
    for(Account ac : Trigger.New){
        se1.add(ac.CreatedById);
            }
    Map<Id,User> mp = new Map<Id,User>([Select Id, Name from User where id IN :se1]);
    for(Account ac : Trigger.New){
        if(ac.Type=='Customer - Channel'){
            System.debug('******Created'+mp.get(ac.CreatedById).Name);
            System.debug('******ACCNUMBER'+ac.id);
            
            Contact con = New Contact(LastName =mp.get(ac.CreatedById).Name,AccountId=ac.Id);
            c.add(con);
        }
        
        
    }
insert c;
}