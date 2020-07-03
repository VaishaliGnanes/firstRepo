public class consolidatedlineHandler {
	 public list<Consolidated_Line__c> triggernewList = new list<Consolidated_Line__c>();
    public list<Consolidated_Line__c> triggeroldList = new list<Consolidated_Line__c>();
    public Map<ID,Consolidated_Line__c> triggernewmapList = new Map<ID,Consolidated_Line__c>();
    public Map<ID,Consolidated_Line__c> triggeroldmapList = new Map<ID,Consolidated_Line__c>();
    Map<ID,Decimal> mapnum = new Map<ID,Decimal>();
        Map<ID,String> maptext = new Map<ID,String>();
    set<Id> idconso = new set<Id>();
    List<Consolidated_Line__c> mapiterator = new List<Consolidated_Line__c>();
    public  consolidatedlineHandler(List<Consolidated_Line__c> newlist,List<Consolidated_Line__c> oldlist,Map<ID,Consolidated_Line__c> newmaplist,Map<ID,Consolidated_Line__c> oldmaplist){
        this.triggernewList=newlist;
        this.triggeroldList=oldlist;
        this.triggernewmapList=newmaplist;
        this.triggeroldmapList=oldmaplist;
    }
     public void onAfterInsert(){
     	
         for(Consolidated_Line__c conso:triggernewList){
            idconso.add(conso.Id);
         }
         mapiterator=[select Id,Invoice__r.Placement__r.Job__r.Job_Num__c,Invoice__r.Placement__r.Job__r.Job_Text__c from Consolidated_Line__c where Id IN :idconso];
         
         for(Consolidated_Line__c conso1:mapiterator){
             mapnum.put(conso1.id, conso1.Invoice__r.Placement__r.Job__r.Job_Num__c);
             maptext.put(conso1.id, conso1.Invoice__r.Placement__r.Job__r.Job_Text__c);
         }
         
         for(Consolidated_Line__c conso:mapiterator){
          conso.Consolidated_Number__c=mapnum.get(conso.id);
           conso.Consolidated_Text__c=maptext.get(conso.id);      
         
         }
         update mapiterator;
     }
    
}