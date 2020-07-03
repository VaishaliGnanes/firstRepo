public class Autoapproveleave implements Database.Batchable<sobject>{
     String query;
    public Database.QueryLocator start(Database.BatchableContext bc){
        query='select id,Leave_type__c,Total_Number_of_days__c,Approval__c from Apply_Leave__c where Total_Number_of_days__c<=3';
        Database.QueryLocator qr =Database.getQueryLocator(query);
        return qr;
    }
    
    public void execute(Database.BatchableContext bc,List<Apply_Leave__c> leave){
        system.debug('leave list >>>>>>>>'+leave);
        List<Apply_Leave__c> autoapprlist = new List<Apply_Leave__c>();
        for(Apply_Leave__c rec:leave){
        rec.id=rec.id;
          rec.Approval__c=true;
            autoapprlist.add(rec);
        }
        system.debug('List autoapprlist>>>>>'+autoapprlist);
 update autoapprlist;
    }
    
    public void finish(Database.BatchableContext bc){
        
    }
    
}