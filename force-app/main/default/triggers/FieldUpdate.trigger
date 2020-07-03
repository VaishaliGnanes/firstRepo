trigger FieldUpdate on Account (after insert, after update) {
  Map<id,String> acc= new  Map<id,String>();
    List<Contact> conlist =new  List<Contact>();
    Set<id> accid= new Set<id>();
   
    for(Account ac: Trigger.new)    {
        acc.put(ac.Id,ac.Account_Testing__c);
         accid.add(ac.ID);
    }                     
  List<Contact> con= new List<Contact>([Select id,AccountID from Contact where AccountID IN: accid]);
    for(Contact c:con){
        c.AssistantName= acc.get(c.AccountID);
         conlist.add(c);
    }
    update conlist;
}