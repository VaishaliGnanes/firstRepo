public class EmailTestHandler {
 //  List<Account> TriggerNewList = new List<Account>();
    
    public EmailTestHandler(){
    
        
    }
    public void SendEmails(){
        
        List<Messaging.SingleEmailMessage> lstmsg = new List<Messaging.SingleEmailMessage>();
        Messaging.SingleEmailMessage msg= new Messaging.SingleEmailMessage();
      /*  List<String> ToAdd = new List<String>();
        ToAdd.add('vaishalignanes@gmail.com');
        msg.setToAddresses(ToAdd);*/
        ID temp=[Select id from EmailTemplate where DeveloperName='SendEmailToOwner'].ID;
        msg.setTemplateId(temp);
        ID targ=[Select id from User where Email='vaishalignanes@gmail.com' limit 1].ID;
        msg.setTargetObjectId(targ);
        msg.saveAsActivity=false;
        lstmsg.add(msg);
        Messaging.sendEmail(lstmsg);
        
    }
     
   

}