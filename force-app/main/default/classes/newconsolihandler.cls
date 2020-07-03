public class newconsolihandler {
	public list<Consolidated_Line__c> triggernewList = new list<Consolidated_Line__c>();
    public list<Consolidated_Line__c> triggeroldList = new list<Consolidated_Line__c>();
    public Map<ID,Consolidated_Line__c> triggernewmapList = new Map<ID,Consolidated_Line__c>();
    public Map<ID,Consolidated_Line__c> triggeroldmapList = new Map<ID,Consolidated_Line__c>();
    List<Consolidated_Line__c> recs = new List<Consolidated_Line__c>();
    List<Consolidated_Line__c> recs1 = new List<Consolidated_Line__c>();
    public newconsolihandler(List<Consolidated_Line__c> newlist,List<Consolidated_Line__c> oldlist,Map<ID,Consolidated_Line__c> newmaplist,Map<ID,Consolidated_Line__c> oldmaplist){
        this.triggernewList=newlist;
        this.triggeroldList=oldlist;
        this.triggernewmapList=newmaplist;
        this.triggeroldmapList=oldmaplist;
    }
    
    public void onAfterInsert(){
       
        recs =[select Id,Invoice__r.Placement__r.Job__r.Job_Num__c,Invoice__r.Placement__r.Job__r.Job_Text__c from Consolidated_Line__c];

        
        for(Consolidated_Line__c cl : recs){
            cl.Consolidated_Text__c = cl.Invoice__r.Placement__r.Job__r.Job_Text__c;
            cl.Consolidated_Number__c = cl.Invoice__r.Placement__r.Job__r.Job_Num__c;
            recs1.add(cl);
        }
        update recs1;
    }
    
}