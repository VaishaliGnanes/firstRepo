public class GrowerRelationshiptriggerHandler {
    public list<Growerrealtionship__c> triggernewList = new list<Growerrealtionship__c>();
    public list<Growerrealtionship__c> triggeroldList = new list<Growerrealtionship__c>();
    public Map<ID,Growerrealtionship__c> triggernewmapList = new Map<ID,Growerrealtionship__c>();
    public Map<ID,Growerrealtionship__c> triggeroldmapList = new Map<ID,Growerrealtionship__c>();
    
    public  GrowerRelationshiptriggerHandler(List<Growerrealtionship__c> newlist,List<Growerrealtionship__c> oldlist,Map<ID,Growerrealtionship__c> newmaplist,Map<ID,Growerrealtionship__c> oldmaplist){
        this.triggernewList=newlist;
        this.triggeroldList=oldlist;
        this.triggernewmapList=newmaplist;
        this.triggeroldmapList=oldmaplist;
    }
    
     public void onBeforeUpdate()
     {
        set<ID> acc=new Set<ID> ();
        Map<ID,Decimal> accmap= new Map<ID,Decimal>();
        for(Growerrealtionship__c gr: triggernewList){
            acc.add(gr.Account__c);
        }
        List<Payment__c> py= new List<Payment__c>([Select Sharing_Count__c,Account__c from Payment__c where Account__c IN:acc]);
        for(Payment__c p:py){
            accmap.put(p.Account__C,p.Sharing_Count__c);
        }
        for(Growerrealtionship__c gr: triggernewList){
            if((gr.status__c==false)&&(accmap.get(gr.Account__c)==1)){
                gr.addError('We have a payment');
            }
            	
            
        }
    }
    
    public void OnBeforeDelete(){
        set<ID> acc=new Set<ID> ();
        Map<ID,Decimal> accmap= new Map<ID,Decimal>();
        for(Growerrealtionship__c gr: triggeroldList){
            acc.add(gr.Account__c);
        }
        List<Payment__c> py= new List<Payment__c>([Select Sharing_Count__c,Account__c from Payment__c where Account__c IN:acc]);
        for(Payment__c p:py){
            accmap.put(p.Account__C,p.Sharing_Count__c);
        }
        for(Growerrealtionship__c gr: triggeroldList){
            if((accmap.get(gr.Account__c)==1)){
                gr.addError('We have a payment');
            }
            	
            
        }
    }
}