trigger ownertrigger on Account (before insert) {
    Map<id,String> users= new Map<id,String>();
    set<id> userid=new set<id>();
    for(Account a:Trigger.new){
        userid.add(a.OwnerId);
    }
    
    List<User> owneruser=new List<User>();
    owneruser=[Select id,name from User where id in :userid];
    
    for(User u:owneruser){
       users.put(u.Id,u.Name);
    }
    
    for(Account a:trigger.new){
        a.Ownerlookup__c=users.get(a.OwnerId);
    }
}