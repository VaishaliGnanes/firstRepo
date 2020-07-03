@isTest
public class DataUtilityClass {

    public static List<Account> createacc(Integer numb){
        List<Account> acc=new List<Account>();
        for(Integer i=1;i<=numb;i++){
            
            acc.add(new Account(Name='Account'+i));
            system.debug('acc'+acc);
        }
        
        return acc;
    }
    
    
    public static List<Growerrealtionship__c> createGRrecords(List<Account> acct){
        List<Growerrealtionship__c> gr=new List<Growerrealtionship__c>();
        Integer numb=acct.size();
        system.debug('accnumb'+numb);
        for(Integer i=0;i<numb;i++){ 
            System.debug('acctid'+acct[i]);
            gr.add(new Growerrealtionship__c(Name='GR'+i,Account__c=acct[i].Id,Status__c=true));
            system.debug('gr'+gr);
        }
        return gr;
    }
    
    public static List<Payment__c> createPYrecords(List<Account> acct){
        List<Payment__c> py=new List<Payment__c>();
        Integer numb=acct.size();
        for(Integer i=0;i<numb;i++){
            System.debug('acctid'+acct[i].name);
            py.add(new Payment__c(Name='GR'+i,Account__c=acct[i].Id,Sharing_Count__c=1));
            system.debug('py'+py);
        }
        return py;
    }
    
    public static List<User> createuser(Integer numb){
        List<User> u= new List<User>();
        for(Integer i=1;i<numb;i++){
            u.add(new User(LastName = 'TestName'+i,
         	 Alias = 'TN'+i,
            Email = 'User'+i+'@cognizant.com',
            Username = 'User'+i+'@cognizant.com',
            ProfileId = '00e6F000002Rfga',
            CommunityNickname = 'TestNick',
        	TimeZoneSidKey='America/New_York',
            LocaleSidKey='en_US',
            LanguageLocaleKey='en_US',
        	EmailEncodingKey='UTF-8'));
        }
        return u;
    }
}