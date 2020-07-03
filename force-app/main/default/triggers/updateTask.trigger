trigger updateTask on Task (before insert) {
    Set<id> userid=new Set<id>();
   // List<Task> tk=new List<Task>();
    for(Task t:Trigger.new){
        system.debug('Enter');
        userid.add(t.OwnerID);
    }
    system.debug('Userid'+userid);
    Map<ID,User> use=new Map<ID,User>([Select id,Brand__C from User where Id IN:userid]);
    system.debug('map'+use);
    
    for(Task t:Trigger.new){
        t.Brand__c=use.get(t.OwnerID).Brand__c;
       // tk.add(t);
    }
   // update tk;
}