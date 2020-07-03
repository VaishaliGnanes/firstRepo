public class CasecreationHandler {
    
    public List<Account> newAccountlist = new List<Account>();
    public List<Account> oldAccountlist = new List<Account>();
    public Map<ID,Account> newaccountmap= new Map<ID,Account>();
    public Map<ID,Account> oldaccountmap= new Map<ID,Account>();
    
    public CasecreationHandler(List<Account> newacclist,List<Account> oldacclist, Map<ID,Account> newmaplist, Map<ID,Account> oldmaplist){
        this.newAccountlist=newacclist;
        this.oldAccountlist=oldacclist;
        this.newaccountmap=newmaplist;
        this.oldaccountmap=oldmaplist;
    }
    
    public void onafterinsert(){
        List<Case> c=new List<Case>();
        
        for(Account acc:newAccountlist){
            
            Case cas=new Case(Status='New',Origin='Phone',Account__c=acc.ID);
            c.add(cas);
            system.debug('Caselist'+c);
        }
     insert c;
    }
}