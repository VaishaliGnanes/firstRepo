public class OppClass {
	List<Opportunity> newlist= new List<Opportunity>();
    List<Opportunity> oldlist= new List<Opportunity>();
    Map<ID,Opportunity> newmaplist= new Map<ID,Opportunity>();
    Map<ID,Opportunity> oldmaplist= new Map<ID,Opportunity>();
    Set<id> ownid = new Set<id>();
    
    public OppClass(List<Opportunity> newtriggerlist,List<Opportunity> oldtriggerlist,Map<ID,Opportunity> newtriggermap,Map<ID,Opportunity> oldtriggermap){
        this.newlist=newtriggerlist;
        this.oldlist=oldtriggerlist;
        this.newmaplist=newtriggermap;
        this.oldmaplist=oldtriggermap;
    }
    
    public void onbeforeInsert(){
        for(Opportunity op:newlist){
            ownid.add(op.OwnerId);
           //Contact c=new Contact(LastName=op.OwnerId,AccountID=op.AccountId)
        }
        
        Map<ID,User> us = new Map<ID,User>([Select id,name from User where id IN:ownid]);
         List<Contact> con = new List<Contact>();
        for(Opportunity op:newlist){
           Contact c=new Contact(LastName=us.get(op.OwnerId).Name,AccountID=op.AccountId);
           con.add(c);
        }
		insert con;
        
    }
    public void onafterInsert(){}
    public void onbeforeUpdate(){
            for(Opportunity op:newlist){
            ownid.add(op.OwnerId);
          
        }
        
        Map<ID,User> us = new Map<ID,User>([Select id,name from User where id IN:ownid]);
        List<Contact> con = new List<Contact>();
        for(Opportunity op:newlist){
           Contact c=new Contact(LastName=us.get(op.OwnerId).Name,AccountID=op.AccountId);
            con.add(c);
        }
       insert con;

    }
    public void onafterUpdate(){}
    public void onbeforedelete(){}
    public void onafterUndelete(){}
}