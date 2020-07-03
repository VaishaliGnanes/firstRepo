@isTest
public class OppoDataUtility {

    public static List<Opportunity> createoppo(List<Account> acct){
        List<Opportunity> oppo=new List<Opportunity>(); 
        
        for(Integer i=0;i<acct.size();i++){
            oppo.add(new Opportunity(Name='Oppo'+i,AccountID=acct[i].ID,CloseDate=Date.newInstance(2018,3,9),StageName='Prospecting',Probability=20));
        }
        return oppo;
    }
    
   
}