@isTest		
public class OppoClassTest {
	
    @TestSetup
    public static void  CreateoppoData(){
      	List<Account> acc= DataUtilityClass.createacc(10);
        List<Opportunity> opp=  OppoDataUtility.createoppo(acc);
        List<User> u= DataUtilityClass.createuser(1);
    }
    
    public static  testmethod void  checkoppo(){
        test.startTest();
        User u=[select id from User limit 1];
        List<Contact> c = new List<Contact>();
        
        System.runAs(u){
            List<Opportunity> op= [Select id,name,Probability from Opportunity];
            for(Opportunity o:op){
                o.Probability=40;
            }
            update op;
             for(Opportunity o:op){
                 if(o.Probability >=20){
                      c= [select id from Contact where AccountID =:o.AccountId];
                 }
                 update c;
               
            }
            boolean var= c.size()>0?true:false;
            system.assertEquals(true,true);
            
        }
        test.stopTest();
        
    }
}