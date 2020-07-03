public without sharing class SubmitButtonController{	
    @AuraEnabled
    public static String UpdateCase(String caseId){
        Case c=[select Id,status from Case where Id=:caseId];
        if(c.status=='new'){
            c.status='Working';
        }
        system.debug('c.Status'+c.status);
        return c.status;  
    }
}